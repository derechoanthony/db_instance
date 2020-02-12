-- FUNCTION: public.insertuserroles()

-- DROP FUNCTION public.insertuserroles();

CREATE OR REPLACE FUNCTION public.insertuserroles(
	)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100.0
    VOLATILE NOT LEAKPROOF 
AS $function$

BEGIN
    INSERT INTO roles (id,name) VALUES(1,'admin');
    INSERT INTO roles (id,name) VALUES(2,'member');
    INSERT INTO roles (id,name) VALUES(3,'inventory');
    INSERT INTO roles (id,name) VALUES(4,'cashiering');
    INSERT INTO roles (id,name) VALUES(5,'accounting');
END

$function$;

ALTER FUNCTION public.insertuserroles()
    OWNER TO postgres;
