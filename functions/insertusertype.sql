-- FUNCTION: public.insertusertype()

-- DROP FUNCTION public.insertusertype();

CREATE OR REPLACE FUNCTION public.insertusertype(
	)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100.0
    VOLATILE NOT LEAKPROOF 
AS $function$

BEGIN
    INSERT INTO user_type (id,name) VALUES(1,'Distributor');
    INSERT INTO user_type (id,name) VALUES(2,'Achiever');
    INSERT INTO user_type (id,name) VALUES(3,'Star');
    INSERT INTO user_type (id,name) VALUES(4,'WE-Elite');
END

$function$;

ALTER FUNCTION public.insertusertype()
    OWNER TO postgres;
