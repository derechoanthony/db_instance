-- FUNCTION: public.item_status_deactivation(integer)

-- DROP FUNCTION public.item_status_deactivation(integer);

CREATE OR REPLACE FUNCTION public.item_status_deactivation(
	_id integer)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100.0
    VOLATILE NOT LEAKPROOF 
AS $function$

BEGIN
    UPDATE inventory 
    SET status = 0
    WHERE id = _id;

    UPDATE item_points
    SET status = 0
    WHERE item_id = _id;
END

$function$;

ALTER FUNCTION public.item_status_deactivation(integer)
    OWNER TO postgres;
