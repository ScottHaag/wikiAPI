-- Create table that makes sums for huc12 ..

Drop Table wikiwtershed.huc12_strmcat11;

Create Table wikiwtershed.huc12_strmcat11
(
huc12 character varying(12) NOT NULL,
CatAreaSqKm	float	,
WsAreaSqKm	float	,
CatPctFull	float	,
WsPctFull	float	,
PctOw2011Cat	float	,
PctIce2011Cat	float	,
PctUrbOp2011Cat	float	,
PctUrbLo2011Cat	float	,
PctUrbMd2011Cat	float	,
PctUrbHi2011Cat	float	,
PctBl2011Cat	float	,
PctDecid2011Cat	float	,
PctConif2011Cat	float	,
PctMxFst2011Cat	float	,
PctShrb2011Cat	float	,
PctGrs2011Cat	float	,
PctHay2011Cat	float	,
PctCrop2011Cat	float	,
PctWdWet2011Cat	float	,
PctHbWet2011Cat	float
);


Begin; Alter Table wikiwtershed.huc12_strmcat11 add constraint pkhuc12_strmcat11 primary key (huc12); Commit;

Insert Into wikiwtershed.huc12_strmcat11 (huc12)
Select huc12 from wikiwtershed.boundary_huc12;

Update wikiwtershed.huc12_strmcat11 old
Set 
CatAreaSqKm = new.CatAreaSqKm,
PctOw2011Cat	= new.PctOw2011Cat,
PctIce2011Cat	= new.PctIce2011Cat,
PctUrbOp2011Cat	= new.PctUrbOp2011Cat,
PctUrbLo2011Cat	= new.PctUrbLo2011Cat,
PctUrbMd2011Cat	= new.PctUrbMd2011Cat,
PctUrbHi2011Cat	= new.PctUrbHi2011Cat,
PctBl2011Cat	= new.PctBl2011Cat,
PctDecid2011Cat	= new.PctDecid2011Cat,
PctConif2011Cat	= new.PctConif2011Cat,
PctMxFst2011Cat	= new.PctMxFst2011Cat,
PctShrb2011Cat	= new.PctShrb2011Cat,
PctGrs2011Cat	= new.PctGrs2011Cat,
PctHay2011Cat	= new.PctHay2011Cat,
PctCrop2011Cat	= new.PctCrop2011Cat,
PctWdWet2011Cat	= new.PctWdWet2011Cat,
PctHbWet2011Cat	= new.PctHbWet2011Cat	
From
(
	Select 
	t1.huc12
	,sum(CatAreaSqKm) as CatAreaSqKm
	,sum(PctOw2011Cat * CatAreaSqKm) / sum(CatAreaSqKm) As PctOw2011Cat 

	,sum(PctIce2011Cat * CatAreaSqKm) / sum(CatAreaSqKm) As PctIce2011Cat
	,sum(PctUrbOp2011Cat * CatAreaSqKm) / sum(CatAreaSqKm) As PctUrbOp2011Cat
	,sum(PctUrbLo2011Cat * CatAreaSqKm) / sum(CatAreaSqKm) As PctUrbLo2011Cat
	,sum(PctUrbMd2011Cat * CatAreaSqKm) / sum(CatAreaSqKm) As PctUrbMd2011Cat
	,sum(PctUrbHi2011Cat * CatAreaSqKm) / sum(CatAreaSqKm) As PctUrbHi2011Cat
	,sum(PctBl2011Cat * CatAreaSqKm) / sum(CatAreaSqKm) As PctBl2011Cat
	,sum(PctDecid2011Cat * CatAreaSqKm) / sum(CatAreaSqKm) As PctDecid2011Cat
	,sum(PctConif2011Cat * CatAreaSqKm) / sum(CatAreaSqKm) As PctConif2011Cat
	,sum(PctMxFst2011Cat * CatAreaSqKm) / sum(CatAreaSqKm) As PctMxFst2011Cat
	,sum(PctShrb2011Cat * CatAreaSqKm) / sum(CatAreaSqKm) As PctShrb2011Cat
	,sum(PctGrs2011Cat * CatAreaSqKm) / sum(CatAreaSqKm) As PctGrs2011Cat
	,sum(PctHay2011Cat * CatAreaSqKm) / sum(CatAreaSqKm) As PctHay2011Cat
	,sum(PctCrop2011Cat * CatAreaSqKm) / sum(CatAreaSqKm) As PctCrop2011Cat
	,sum(PctWdWet2011Cat * CatAreaSqKm) / sum(CatAreaSqKm) As PctWdWet2011Cat
	,sum(PctHbWet2011Cat * CatAreaSqKm) / sum(CatAreaSqKm) As PctHbWet2011Cat
		From 
		wikiwtershed.nhdplus t1
		join 
		wikiwtershed.strmcat11 t2
		on t1.comid = t2.comid
		Group by t1.huc12
) new
Where new.huc12 = old.huc12;


		
		




