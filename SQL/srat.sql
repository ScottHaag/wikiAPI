CREATE OR REPLACE FUNCTION wikiwtershed.srat(
    IN huc12a character varying,
    IN tn_ag_load double precision)
  RETURNS TABLE(id integer, ag_tn_ld_nhd double precision) AS
$BODY$
BEGIN

   Create Temp Table   
   tmptble1 As 
   ( Select comid, ag_tn_coef * tn_ag_load from wikiwtershed.nhdcoefs where huc12 like huc12a);


    RETURN QUERY Select * From tmptble1;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION wikiwtershed.srat(character varying, double precision)
  OWNER TO drwiadmin;
