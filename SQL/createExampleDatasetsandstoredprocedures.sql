-- Setting up the data 
Create Table wikiwtershed.nhdcoefs as 
Select comid, huc12, 1 / count(*) over (partition by huc12) as ag_tn_coef

From wikiwtershed.nhdplus;

ALTER TABLE wikiwtershed.nhdcoefs
  ADD CONSTRAINT nhdpluscoefspk PRIMARY KEY(comid);

CREATE INDEX 
   ON wikiwtershed.nhdplus (huc12 ASC NULLS LAST);

ALTER TABLE wikiwtershed.nhdcoefs
  ADD FOREIGN KEY (huc12) REFERENCES wikiwtershed.boundary_huc12 (huc12)
   ON UPDATE NO ACTION ON DELETE NO ACTION;
CREATE INDEX huc12foreignkeycoefs2
  ON wikiwtershed.nhdcoefs(huc12);


Select * From wikiwtershed.nhdcoefs limit 10;

Drop Function wikiwtershed.srat(huc12a character varying(12),tn_ag_load float) ;
 
CREATE OR REPLACE FUNCTION wikiwtershed.srat(huc12a character varying(12),tn_ag_load float) 
RETURNS TABLE (id integer, ag_tn_ld_nhd float ) AS $$
BEGIN
    RETURN QUERY Select comid, ag_tn_coef * tn_ag_load from wikiwtershed.nhdcoefs where huc12 like huc12a;
END;
$$ LANGUAGE plpgsql;

Select * From  wikiwtershed.srat('030701020406',10 )  ;
  











    