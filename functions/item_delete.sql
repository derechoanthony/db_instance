-- FUNCTION: public.item_delete(integer)

-- DROP FUNCTION public.item_delete(integer);

CREATE OR REPLACE FUNCTION public.item_delete(
	_id integer)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100.0
    VOLATILE NOT LEAKPROOF 
AS $function$

BEGIN
    UPDATE inventory 
    SET is_delete = 1
    WHERE id = _id;

    UPDATE item_points
    SET is_delete = 1
    WHERE item_id = _id;
END

$function$;

ALTER FUNCTION public.item_delete(integer)
    OWNER TO postgres;
