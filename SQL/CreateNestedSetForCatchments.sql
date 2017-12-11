/* 
1) Create a lightweight Table with Simple Routing Work
2) ran out of space on remote server trying on local host

*/

Drop Table If Exists .nhdplus_stream_nsidx Cascade;

Create Table wikiwtershed.nhdplus_stream_nsidx as 
Select terminalpa,hydroseq, dnhydroseq from wikiwtershed.nhdplus_stream --where terminalpa = 200005438 ;


ALTER TABLE wikiwtershed.nhdplus_stream_nsidx DROP CONSTRAINT pk_nsidx;
Alter Table wikiwtershed.nhdplus_stream_nsidx Alter Column hydroseq  type text using hydroseq::text;

Alter Table wikiwtershed.nhdplus_stream_nsidx Alter Column dnhydroseq  type text using dnhydroseq::text;


Alter Table wikiwtershed.nhdplus_stream_nsidx Alter Column terminalpa  type text using terminalpa::text;

Alter table wikiwtershed.nhdplus_stream_nsidx add constraint pk_nsidx  primary key ( hydroseq);

CREATE INDEX 

   ON wikiwtershed.nhdplus_stream_nsidx (dnhydroseq ASC NULLS LAST);

CREATE INDEX 
   ON wikiwtershed.nhdplus_stream_nsidx (terminalpa ASC NULLS LAST);


Alter table wikiwtershed.nhdplus_stream_nsidx add column lft bigint;
Alter table wikiwtershed.nhdplus_stream_nsidx add column rght bigint;

CREATE INDEX 
   ON wikiwtershed.nhdplus_stream_nsidx (lft ASC NULLS LAST);

Select terminalpa, count(*) cnt
From wikiwtershed.nhdplus_stream_nsidx 
Group by terminalpa
order by cnt desc;


-- Create lft value 
Update wikiwtershed.nhdplus_stream_nsidx old
set lft = rn 
From 
(
With Recursive included_parts(path, hydroseq, dnhydroseq, strt, terminalpa) As 
(
Select 1::text as path,hydroseq ,dnhydroseq, 1 as strt,terminalpa 
From wikiwtershed.nhdplus_stream_nsidx where hydroseq in (select hydroseq from wikiwtershed.nhdplus_stream_nsidx  where hydroseq = terminalpa and terminalpa = 270005292 )
Union all
Select path || (row_number() over (partition by t1.hydroseq))::text, t1.hydroseq ,t1.dnhydroseq, included_parts.strt + 1, t1.terminalpa
From (select * From wikiwtershed.nhdplus_stream_nsidx where terminalpa = 270005292 ) t1 
join included_parts 
on t1.dnhydroseq = included_parts.hydroseq  
)
Select *  From included_parts order by path )

Select row_number() Over (partition by terminalpa order by path) rn ,hydroseq
From included_parts order by path 
) new
where old.hydroseq = new.hydroseq;



-- Same Statement as above with hydroseq listed out

create table wikiwtershed.nhdplus_stream_nsidxrght_calc1 as  
With Recursive included_parts(path, hydroseq, dnhydroseq, strt, terminalpa) As 
(
Select hydroseq as path,hydroseq ,dnhydroseq, 1 as strt,terminalpa 
From wikiwtershed.nhdplus_stream_nsidx where hydroseq in (select hydroseq from wikiwtershed.nhdplus_stream_nsidx  where hydroseq = terminalpa and terminalpa != '350002977' )
Union all
Select path || ',' ||t1.hydroseq, t1.hydroseq ,t1.dnhydroseq, included_parts.strt + 1, t1.terminalpa
From (select * From wikiwtershed.nhdplus_stream_nsidx where terminalpa != '350002977' ) t1 
join included_parts 
on t1.dnhydroseq = included_parts.hydroseq  
)
Select *  From included_parts order by path;


-- Need to unnest and count the path field
create table wikiwtershed.nhdplus_stream_nsidxrght_calc2 as 
Select regexp_split_to_table(t1.path, E',') AS upath 
From wikiwtershed.nhdplus_stream_nsidxrght_calc1 t1;

Drop table wikiwtershed.nhdplus_stream_nsidxrght_calc1;

-- Update the Results
create table wikiwtershed.nhdplus_stream_nsidxrght_calc3 as 
Select upath, count(*) cnt
From wikiwtershed.nhdplus_stream_nsidxrght_calc2 t1
group by upath;

Drop table wikiwtershed.nhdplus_stream_nsidxrght_calc2;

Update wikiwtershed.nhdplus_stream_nsidx old
set rght = lft + cnt -1
From wikiwtershed.nhdplus_stream_nsidxrght_calc3 t3
Where old.hydroseq::text = t3.upath;

Drop table wikiwtershed.nhdplus_stream_nsidxrght_calc3;



Select terminalpa, count(*) cnt From wikiwtershed.nhdplus_stream_nsidx group by terminalpa
order by cnt desc;


"terminalpa";"cnt"
350002977;1111475 121978522 ms
 
"terminalpa";"cnt"
290001792;26479 -- need to check this out

"terminalpa";"cnt"
"270003673";19675 done

"terminalpa";"cnt"
"290001768";67601  58,6055 10 minutes

"terminalpa";"cnt"
"350002528";87017 79,8740

"terminalpa";"cnt"
"720000024";119442

"terminalpa";"cnt"
"350002977";1111475



   