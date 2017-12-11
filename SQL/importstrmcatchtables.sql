Drop table wikiwtershed.strmcat01;

Create Table wikiwtershed.strmcat01
(
COMID	text	,
CatAreaSqKm	text	,
WsAreaSqKm	text	,
CatPctFull	text	,
WsPctFull	text	,
PctOw2001Cat	text	,
PctIce2001Cat	text	,
PctUrbOp2001Cat	text	,
PctUrbLo2001Cat	text	,
PctUrbMd2001Cat	text	,
PctUrbHi2001Cat	text	,
PctBl2001Cat	text	,
PctDecid2001Cat	text	,
PctConif2001Cat	text	,
PctMxFst2001Cat	text	,
PctShrb2001Cat	text	,
PctGrs2001Cat	text	,
PctHay2001Cat	text	,
PctCrop2001Cat	text	,
PctWdWet2001Cat	text	,
PctHbWet2001Cat	text	,
PctOw2001Ws	text	,
PctIce2001Ws	text	,
PctUrbOp2001Ws	text	,
PctUrbLo2001Ws	text	,
PctUrbMd2001Ws	text	,
PctUrbHi2001Ws	text	,
PctBl2001Ws	text	,
PctDecid2001Ws	text	,
PctConif2001Ws	text	,
PctMxFst2001Ws	text	,
PctShrb2001Ws	text	,
PctGrs2001Ws	text	,
PctHay2001Ws	text	,
PctCrop2001Ws	text	,
PctWdWet2001Ws	text	,
PctHbWet2001Ws	text	)

 
-- Load in StreamCat Tables 
Copy wikiwtershed.strmcat01 From '/home/drwi-user/merged2001.csv' DELIMITER ',' CSV HEADER

CREATE INDEX 
   ON wikiwtershed.strmcat01 (comid ASC NULLS LAST);


Select comid, count(*) cnt from wikiwtershed.strmcat01 group by comid order by cnt desc;

Delete From wikiwtershed.strmcat01 Where comid = 'COMID'

Begin; Alter Table wikiwtershed.strmcat01 Alter Column comid type integer using comid::integer;

Begin; Alter Table wikiwtershed.strmcat01 add constraint pkstrmcat01 primary key (comid);

Begin; Alter Table wikiwtershed.strmcat01 Alter Column CatAreaSqKm type float using CatAreaSqKm::float; Commit;
Begin; Alter Table wikiwtershed.strmcat01 Alter Column 	WsAreaSqKm	type float using  	(case when WsAreaSqKm like 'NA' then null else WsAreaSqKm end)  ::float; Commit;

Begin; Alter Table wikiwtershed.strmcat01 Alter Column 	CatPctFull	type float using  	(Case When CatPctFull like 'NA' then null else CatPctFull end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat01 Alter Column 	WsPctFull	type float using  	(Case When WsPctFull like 'NA' then null else WsPctFull end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat01 Alter Column 	PctOw2001Cat	type float using  	(Case When PctOw2001Cat like 'NA' then null else PctOw2001Cat end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat01 Alter Column 	PctIce2001Cat	type float using  	(Case When PctIce2001Cat like 'NA' then null else PctIce2001Cat end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat01 Alter Column 	PctUrbOp2001Cat	type float using  	(Case When PctUrbOp2001Cat like 'NA' then null else PctUrbOp2001Cat end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat01 Alter Column 	PctUrbLo2001Cat	type float using  	(Case When PctUrbLo2001Cat like 'NA' then null else PctUrbLo2001Cat end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat01 Alter Column 	PctUrbMd2001Cat	type float using  	(Case When PctUrbMd2001Cat like 'NA' then null else PctUrbMd2001Cat end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat01 Alter Column 	PctUrbHi2001Cat	type float using  	(Case When PctUrbHi2001Cat like 'NA' then null else PctUrbHi2001Cat end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat01 Alter Column 	PctBl2001Cat	type float using  	(Case When PctBl2001Cat like 'NA' then null else PctBl2001Cat end )::float; Commit;

Begin; Alter Table wikiwtershed.strmcat01 Alter Column 	PctDecid2001Cat	type float using  	(Case When PctDecid2001Cat like 'NA' then null else PctDecid2001Cat end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat01 Alter Column 	PctConif2001Cat	type float using  	(Case When PctConif2001Cat like 'NA' then null else PctConif2001Cat end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat01 Alter Column 	PctMxFst2001Cat	type float using  	(Case When PctMxFst2001Cat like 'NA' then null else PctMxFst2001Cat end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat01 Alter Column 	PctShrb2001Cat	type float using  	(Case When PctShrb2001Cat like 'NA' then null else PctShrb2001Cat end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat01 Alter Column 	PctGrs2001Cat	type float using  	(Case When PctGrs2001Cat like 'NA' then null else PctGrs2001Cat end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat01 Alter Column 	PctHay2001Cat	type float using  	(Case When PctHay2001Cat like 'NA' then null else PctHay2001Cat end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat01 Alter Column 	PctCrop2001Cat	type float using  	(Case When PctCrop2001Cat like 'NA' then null else PctCrop2001Cat end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat01 Alter Column 	PctWdWet2001Cat	type float using  	(Case When PctWdWet2001Cat like 'NA' then null else PctWdWet2001Cat end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat01 Alter Column 	PctHbWet2001Cat	type float using  	(Case When PctHbWet2001Cat like 'NA' then null else PctHbWet2001Cat end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat01 Alter Column 	PctOw2001Ws	type float using  	(Case When PctOw2001Ws like 'NA' then null else PctOw2001Ws end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat01 Alter Column 	PctIce2001Ws	type float using  	(Case When PctIce2001Ws like 'NA' then null else PctIce2001Ws end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat01 Alter Column 	PctUrbOp2001Ws	type float using  	(Case When PctUrbOp2001Ws like 'NA' then null else PctUrbOp2001Ws end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat01 Alter Column 	PctUrbLo2001Ws	type float using  	(Case When PctUrbLo2001Ws like 'NA' then null else PctUrbLo2001Ws end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat01 Alter Column 	PctUrbMd2001Ws	type float using  	(Case When PctUrbMd2001Ws like 'NA' then null else PctUrbMd2001Ws end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat01 Alter Column 	PctUrbHi2001Ws	type float using  	(Case When PctUrbHi2001Ws like 'NA' then null else PctUrbHi2001Ws end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat01 Alter Column 	PctBl2001Ws	type float using  	(Case When PctBl2001Ws like 'NA' then null else PctBl2001Ws end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat01 Alter Column 	PctDecid2001Ws	type float using  	(Case When PctDecid2001Ws like 'NA' then null else PctDecid2001Ws end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat01 Alter Column 	PctConif2001Ws	type float using  	(Case When PctConif2001Ws like 'NA' then null else PctConif2001Ws end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat01 Alter Column 	PctMxFst2001Ws	type float using  	(Case When PctMxFst2001Ws like 'NA' then null else PctMxFst2001Ws end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat01 Alter Column 	PctShrb2001Ws	type float using  	(Case When PctShrb2001Ws like 'NA' then null else PctShrb2001Ws end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat01 Alter Column 	PctGrs2001Ws	type float using  	(Case When PctGrs2001Ws like 'NA' then null else PctGrs2001Ws end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat01 Alter Column 	PctHay2001Ws	type float using  	(Case When PctHay2001Ws like 'NA' then null else PctHay2001Ws end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat01 Alter Column 	PctCrop2001Ws	type float using  	(Case When PctCrop2001Ws like 'NA' then null else PctCrop2001Ws end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat01 Alter Column 	PctWdWet2001Ws	type float using  	(Case When PctWdWet2001Ws like 'NA' then null else PctWdWet2001Ws end )::float; Commit;
Begin; Alter Table wikiwtershed.strmcat01 Alter Column 	PctHbWet2001Ws	type float using  	(Case When PctHbWet2001Ws like 'NA' then null else PctHbWet2001Ws end )::float; Commit;




