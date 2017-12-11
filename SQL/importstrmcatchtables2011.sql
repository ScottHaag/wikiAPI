Drop table wikiwtershed.strmcat11;

Create Table wikiwtershed.strmcat11
(
COMID	text	,
CatAreaSqKm	text	,
WsAreaSqKm	text	,
CatPctFull	text	,
WsPctFull	text	,
PctOw2011Cat	text	,
PctIce2011Cat	text	,
PctUrbOp2011Cat	text	,
PctUrbLo2011Cat	text	,
PctUrbMd2011Cat	text	,
PctUrbHi2011Cat	text	,
PctBl2011Cat	text	,
PctDecid2011Cat	text	,
PctConif2011Cat	text	,
PctMxFst2011Cat	text	,
PctShrb2011Cat	text	,
PctGrs2011Cat	text	,
PctHay2011Cat	text	,
PctCrop2011Cat	text	,
PctWdWet2011Cat	text	,
PctHbWet2011Cat	text	,
PctOw2011Ws	text	,
PctIce2011Ws	text	,
PctUrbOp2011Ws	text	,
PctUrbLo2011Ws	text	,
PctUrbMd2011Ws	text	,
PctUrbHi2011Ws	text	,
PctBl2011Ws	text	,
PctDecid2011Ws	text	,
PctConif2011Ws	text	,
PctMxFst2011Ws	text	,
PctShrb2011Ws	text	,
PctGrs2011Ws	text	,
PctHay2011Ws	text	,
PctCrop2011Ws	text	,
PctWdWet2011Ws	text	,
PctHbWet2011Ws	text	)

 
-- Load in StreamCat Tables 
Copy wikiwtershed.strmcat11 From '/home/drwi-user/merged2011.csv' DELIMITER ',' CSV HEADER



CREATE INDEX 
   ON wikiwtershed.strmcat11 (comid ASC NULLS LAST);

Delete From wikiwtershed.strmcat11 Where comid = 'COMID'

Select comid, count(*) cnt from wikiwtershed.strmcat11 group by comid order by cnt desc;



Begin; Alter Table wikiwtershed.strmcat11 Alter Column comid type integer using comid::integer;

Begin; Alter Table wikiwtershed.strmcat11 add constraint pkstrmcat11 primary key (comid);

Begin; Alter Table wikiwtershed.strmcat11 Alter Column CatAreaSqKm type float using CatAreaSqKm::float; Commit;
Begin; Alter Table wikiwtershed.strmcat11 Alter Column 	WsAreaSqKm	type float using  	(case when WsAreaSqKm like 'NA' then null else WsAreaSqKm end)  ::float; Commit;

Begin; Alter Table wikiwtershed.strmcat11 Alter Column 	CatPctFull	type float using  	(Case When CatPctFull like 'NA' then null else CatPctFull end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat11 Alter Column 	WsPctFull	type float using  	(Case When WsPctFull like 'NA' then null else WsPctFull end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat11 Alter Column 	PctOw2011Cat	type float using  	(Case When PctOw2011Cat like 'NA' then null else PctOw2011Cat end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat11 Alter Column 	PctIce2011Cat	type float using  	(Case When PctIce2011Cat like 'NA' then null else PctIce2011Cat end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat11 Alter Column 	PctUrbOp2011Cat	type float using  	(Case When PctUrbOp2011Cat like 'NA' then null else PctUrbOp2011Cat end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat11 Alter Column 	PctUrbLo2011Cat	type float using  	(Case When PctUrbLo2011Cat like 'NA' then null else PctUrbLo2011Cat end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat11 Alter Column 	PctUrbMd2011Cat	type float using  	(Case When PctUrbMd2011Cat like 'NA' then null else PctUrbMd2011Cat end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat11 Alter Column 	PctUrbHi2011Cat	type float using  	(Case When PctUrbHi2011Cat like 'NA' then null else PctUrbHi2011Cat end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat11 Alter Column 	PctBl2011Cat	type float using  	(Case When PctBl2011Cat like 'NA' then null else PctBl2011Cat end )::float; Commit;

Begin; Alter Table wikiwtershed.strmcat11 Alter Column 	PctDecid2011Cat	type float using  	(Case When PctDecid2011Cat like 'NA' then null else PctDecid2011Cat end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat11 Alter Column 	PctConif2011Cat	type float using  	(Case When PctConif2011Cat like 'NA' then null else PctConif2011Cat end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat11 Alter Column 	PctMxFst2011Cat	type float using  	(Case When PctMxFst2011Cat like 'NA' then null else PctMxFst2011Cat end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat11 Alter Column 	PctShrb2011Cat	type float using  	(Case When PctShrb2011Cat like 'NA' then null else PctShrb2011Cat end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat11 Alter Column 	PctGrs2011Cat	type float using  	(Case When PctGrs2011Cat like 'NA' then null else PctGrs2011Cat end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat11 Alter Column 	PctHay2011Cat	type float using  	(Case When PctHay2011Cat like 'NA' then null else PctHay2011Cat end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat11 Alter Column 	PctCrop2011Cat	type float using  	(Case When PctCrop2011Cat like 'NA' then null else PctCrop2011Cat end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat11 Alter Column 	PctWdWet2011Cat	type float using  	(Case When PctWdWet2011Cat like 'NA' then null else PctWdWet2011Cat end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat11 Alter Column 	PctHbWet2011Cat	type float using  	(Case When PctHbWet2011Cat like 'NA' then null else PctHbWet2011Cat end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat11 Alter Column 	PctOw2011Ws	type float using  	(Case When PctOw2011Ws like 'NA' then null else PctOw2011Ws end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat11 Alter Column 	PctIce2011Ws	type float using  	(Case When PctIce2011Ws like 'NA' then null else PctIce2011Ws end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat11 Alter Column 	PctUrbOp2011Ws	type float using  	(Case When PctUrbOp2011Ws like 'NA' then null else PctUrbOp2011Ws end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat11 Alter Column 	PctUrbLo2011Ws	type float using  	(Case When PctUrbLo2011Ws like 'NA' then null else PctUrbLo2011Ws end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat11 Alter Column 	PctUrbMd2011Ws	type float using  	(Case When PctUrbMd2011Ws like 'NA' then null else PctUrbMd2011Ws end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat11 Alter Column 	PctUrbHi2011Ws	type float using  	(Case When PctUrbHi2011Ws like 'NA' then null else PctUrbHi2011Ws end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat11 Alter Column 	PctBl2011Ws	type float using  	(Case When PctBl2011Ws like 'NA' then null else PctBl2011Ws end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat11 Alter Column 	PctDecid2011Ws	type float using  	(Case When PctDecid2011Ws like 'NA' then null else PctDecid2011Ws end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat11 Alter Column 	PctConif2011Ws	type float using  	(Case When PctConif2011Ws like 'NA' then null else PctConif2011Ws end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat11 Alter Column 	PctMxFst2011Ws	type float using  	(Case When PctMxFst2011Ws like 'NA' then null else PctMxFst2011Ws end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat11 Alter Column 	PctShrb2011Ws	type float using  	(Case When PctShrb2011Ws like 'NA' then null else PctShrb2011Ws end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat11 Alter Column 	PctGrs2011Ws	type float using  	(Case When PctGrs2011Ws like 'NA' then null else PctGrs2011Ws end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat11 Alter Column 	PctHay2011Ws	type float using  	(Case When PctHay2011Ws like 'NA' then null else PctHay2011Ws end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat11 Alter Column 	PctCrop2011Ws	type float using  	(Case When PctCrop2011Ws like 'NA' then null else PctCrop2011Ws end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat11 Alter Column 	PctWdWet2011Ws	type float using  	(Case When PctWdWet2011Ws like 'NA' then null else PctWdWet2011Ws end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat11 Alter Column 	PctHbWet2011Ws	type float using  	(Case When PctHbWet2011Ws like 'NA' then null else PctHbWet2011Ws end )::float; Commit;




