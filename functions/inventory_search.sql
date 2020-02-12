-- FUNCTION: public.inventory_search(integer)

-- DROP FUNCTION public.inventory_search(integer);

CREATE OR REPLACE FUNCTION public.inventory_search(
	_id integer)
    RETURNS SETOF "TABLE(item_id integer, item_description character varying)"
    LANGUAGE 'plpgsql'
    COST 100.0
    VOLATILE NOT LEAKPROOF 
    ROWS 1000.0
AS $function$

BEGIN
    RETURN QUERY SELECT id, description from inventory where id=_id;
END

$function$;

ALTER FUNCTION public.inventory_search(integer)
    OWNER TO postgres;
