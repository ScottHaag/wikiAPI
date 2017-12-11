-- Input file based on 
SELECT id, huc08, name, ST_SRID(geom), geom, Geomwgs84
  FROM public.boundary_huc08 limit 10;

Alter Table public.boundary_huc08 Add Column Geomwgs84 geometry(Multipolygon,4326);

Update public.boundary_huc08 Set
Geomwgs84 = ST_SetSRID(Geom,4326);

Alter Table public.boundary_huc08 Drop Column Geom;

Alter Table public.boundary_huc08 Rename Column Geomwgs84 to Geom;

CREATE INDEX boundary_huc08_geom_gist
  ON public.boundary_huc08
  USING gist
  (geom);

create schema wikiwtershed

Alter Table public.boundary_huc08 Set Schema wikiwtershed

ALTER TABLE wikiwtershed.boundary_huc08 DROP CONSTRAINT boundary_huc08_pkey1;


Alter Table wikiwtershed.boundary_huc08 Drop Column id;

ALTER TABLE wikiwtershed.boundary_huc08
  ADD CONSTRAINT boundary_huc08_pkey1 PRIMARY KEY(huc08);

Select * From wikiwtershed.boundary_huc08 Limit 1

-- End HUC8
-- Begin HUC10

-- Input file based on 

Alter Table public.boundary_huc10 Add Column Geomwgs84 geometry(Multipolygon,4326);

Update public.boundary_huc10 Set
Geomwgs84 = ST_SetSRID(Geom,4326);

Alter Table public.boundary_huc10 Drop Column Geom;

Alter Table public.boundary_huc10 Rename Column Geomwgs84 to Geom;

CREATE INDEX boundary_huc10_geom_gist
  ON public.boundary_huc10
  USING gist
  (geom);


Alter Table public.boundary_huc10 Set Schema wikiwtershed;

Select *, ST_Area(geom) From wikiwtershed.boundary_huc10 
where huc10 like '0902031408';


Alter Table wikiwtershed.boundary_huc10 Add Column id integer;

Drop Table wikiwtershed.boundary_huc10t2 Cascade;

Create Table wikiwtershed.boundary_huc10t2 As
Select row_number() over (partition by 1 order by 1) as rn, * From wikiwtershed.boundary_huc10;

Select * From wikiwtershed.boundary_huc10t2 

ALTER TABLE wikiwtershed.boundary_huc10t2
  ADD CONSTRAINT boundary_huc10_pkey1 PRIMARY KEY(rn);

Drop View wikiwtershed.boundary_huc10tst;

Delete From wikiwtershed.boundary_huc10t2 where rn = 8748;

Create   View wikiwtershed.boundary_huc10tst As
Select * From wikiwtershed.boundary_huc10t2 
where huc10 like '0902031408';

ALTER TABLE wikiwtershed.boundary_huc10t2
  ADD UNIQUE (huc10);

Alter Table  wikiwtershed.boundary_huc10t2 drop column rn;

ALTER TABLE wikiwtershed.boundary_huc10t2
  ADD CONSTRAINT boundary_huc10_pkey1 PRIMARY KEY(huc10);

Alter Table wikiwtershed.boundary_huc10 Drop Column id;

ALTER TABLE wikiwtershed.boundary_huc10
  ADD CONSTRAINT boundary_huc10_pkey1 PRIMARY KEY(huc10);

--Drop Table wikiwtershed.boundary_huc10;

Alter Table wikiwtershed.boundary_huc10t2 Rename To boundary_huc10

-- End HUC10

-- Begin HUC12

-- Input file based on 

Alter Table public.boundary_huc12 Add Column Geomwgs84 geometry(Multipolygon,4326);

Update public.boundary_huc12 Set
Geomwgs84 = ST_SetSRID(Geom,4326);

Alter Table public.boundary_huc12 Drop Column Geom;

Alter Table public.boundary_huc12 Rename Column Geomwgs84 to Geom;

CREATE INDEX boundary_huc12_geom_gist
  ON public.boundary_huc12
  USING gist
  (geom);

Alter Table public.boundary_huc12 Set Schema wikiwtershed;

ALTER TABLE wikiwtershed.boundary_huc12
  ADD CONSTRAINT boundary_huc12_unique Unique (huc12);


Drop View wikiwtershed.boundary_huc12st;

Create View wikiwtershed.boundary_huc12st As
Select * From wikiwtershed.boundary_huc12 where huc12 in ('150801031203') 

Select huc12, count(*) cnt From wikiwtershed.boundary_huc12 GRoup By huc12 order by cnt desc, huc12 

"040201050608" delete extra
"040201010102" merge
"040201030108" merge
"150801031203" merge

select max(id) from wikiwtershed.boundary_huc12


Insert into wikiwtershed.boundary_huc12 (id, huc12, geom)

Select 
(select max(id) from wikiwtershed.boundary_huc12) + 1
,huc12
,ST_Union(geom) 
From wikiwtershed.boundary_huc12  
group by huc12

Delete From  wikiwtershed.boundary_huc12 
Where id in (81643,81647,81623)

Delete From  wikiwtershed.boundary_huc12 where huc12 is null
Where huc12 in ('040201010102','040201030108','150801031203') and id < 86020;

SElect * From wikiwtershed.boundary_huc12 where huc12 is null

ALTER TABLE wikiwtershed.boundary_huc12 DROP CONSTRAINT boundary_huc12_pkey1;


Alter Table wikiwtershed.boundary_huc12 Drop Column id Cascade; 

ALTER TABLE wikiwtershed.boundary_huc12
  ADD CONSTRAINT boundary_huc12_pkey1 PRIMARY KEY(huc12);


Select * From wikiwtershed.boundary_huc12 where huc12 like '040201010102'

Insert into wikiwtershed.boundary_huc12 (huc12,name,geom_detailed,geom)
Select huc12, name, ST_Union(geom_detailed), ST_Union(geom) From public.boundary_huc12 where huc12 like '040201010102' group by huc12, name

-- End HUC12

-- Start NHDPLUS


Alter Table wikiwtershed.nhdplus rename column "GRIDCODE" to gridcode;
Alter Table wikiwtershed.nhdplus rename column "FEATUREID" to comid;
Alter Table wikiwtershed.nhdplus rename column "SOURCEFC" to sourcefc;
Alter Table wikiwtershed.nhdplus rename column "AreaSqKM" to areasqkm;
Alter Table wikiwtershed.nhdplus rename column "Shape_Length" to shapelength;
Alter Table wikiwtershed.nhdplus rename column "Shape_Area" to shape_area;
Alter Table wikiwtershed.nhdplus rename column "geom" to geom_catch;

Alter Table wikiwtershed.nhdplus add unique (comid);
Select * From wikiwtershed.nhdplus where comid is null 

Alter table wikiwtershed.nhdplus drop column id
Alter Table wikiwtershed.nhdplus add constraint nhdpluspk Primary Key (comid) 

Alter Table wikiwtershed.nhdplus add column 
ALTER TABLE wikiwtershed.nhdplus ADD COLUMN geom_catch_centroid geometry(Point,4326);

CREATE INDEX sidx_nhdplus_geom_ce
  ON wikiwtershed.nhdplus
  USING gist
  (geom_catch_centroid);


CREATE INDEX sidx_nhdplus_geom_ce
  ON wikiwtershed.nhdplus
  USING gist
  (geom);

CREATE INDEX sidx_nhdplus_geom 
  ON wikiwtershed.nhdplus
  USING gist
  (geom_catch);

CREATE INDEX sidx_nhdplus_geom_stream

  ON wikiwtershed.nhdplus
  USING gist
  (geom_stream);

  
ALter Table wikiwtershed.nhdplus Add Column huc12 character varying(12); 

Update wikiwtershed.nhdplus 
Set geom_catch_centroid = ST_Centroid(geom_catch); 

Update wikiwtershed.nhdplus old 
Set huc12 = t.huc12
From
(
Select comid, h12.huc12 From ( select * From wikiwtershed.nhdplus where comid = 1440535 ) as nhd join wikiwtershed.boundary_huc12 h12
on ST_Intersects(nhd.geom_catch_centroid,h12.geom) 
) t
Where t.comid = old.comid;

Create View wikiwtershed.nhdplus_huc12nulls as
select * From wikiwtershed.nhdplus where huc12 is null 


Update wikiwtershed.nhdplus old 
Set huc12 = '120401040703' where comid = 1440535  

Select max(char_length(comid::text)) from wikiwtershed.nhdplus 

ALTER TABLE wikiwtershed.nhdplus ADD COLUMN geom_stream geometry(MultiLineString,4326);

CREATE INDEX sidx_nhdplus_geom_stream
  ON wikiwtershed.nhdplus
  USING gist
  (geom_stream);


Alter Table wikiwtershed.nhdplus_stream Rename Column "TerminalPa" To terminalpa;
Alter Table wikiwtershed.nhdplus_stream Rename Column "TerminalFl" To terminalfl;
Alter Table wikiwtershed.nhdplus_stream Rename Column "Hydroseq" To hydroseq;
Alter Table wikiwtershed.nhdplus_stream Rename Column "DnHydroseq" To dnhydroseq;
Alter Table wikiwtershed.nhdplus_stream Rename Column "UpHydroseq" To uphydroseq ; 
Alter Table wikiwtershed.nhdplus_stream Rename Column "id" To gid ; 
Alter Table wikiwtershed.nhdplus_stream Rename Column "AreaSqKM" To areasqkm;
Alter Table wikiwtershed.nhdplus_stream Rename Column "COMID" To comid; 

CREATE INDEX sidx_nhdplus_comid
  ON wikiwtershed.nhdplus_stream
  
  (comid);

Alter table wikiwtershed.nhdplus_stream add column strt bigint;
Alter table wikiwtershed.nhdplus_stream add column finish bigint;

Select max(strt) from wikiwtershed.nhdplus_stream 

select  terminalfl, terminalpa,hydroseq, dnhydroseq, 
uphydroseq , areasqkm  
from wikiwtershed.nhdplus_stream limit 10

Update wikiwtershed.nhdplus old
Set geom_stream = ST_Force_2D(ST_Transform(new.geom,4326))
from 
( Select t1.* From 
wikiwtershed.nhdplus_stream t1 
join 
wikiwtershed.nhdplus t2  
ON t2.geom_stream is null And t1.comid = t2.comid
Limit 100000
) new
where old.comid = new.comid;

Select * From 


-- QAQC
Select Count(*) 
From wikiwtershed.nhdplus 
where geom_stream is null;
 
DROP INDEX wikiwtershed.nhdplus_huc12_idx

DROP INDEX wikiwtershed.sidx_nhdplus_geom_stream;

CREATE UNIQUE INDEX 
   ON wikiwtershed.nhdplus_stream (comid ASC NULLS LAST);

Alter TABle public.nhdplus set schema wikiwtershed

-- Export Table 
drwi-user@ans-drwi:~> pg_dump --username=drwiadmin --table=wikiwtershed.nhdplus --data-only --column-inserts drwi > nhdplus112117.sql


downloaded with putty and gziped the file send to Matt and Rotterman using google drive