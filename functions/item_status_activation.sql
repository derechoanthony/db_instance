-- FUNCTION: public.item_status_activation(integer)

-- DROP FUNCTION public.item_status_activation(integer);

CREATE OR REPLACE FUNCTION public.item_status_activation(
	_id integer)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100.0
    VOLATILE NOT LEAKPROOF 
AS $function$

BEGIN
    UPDATE inventory 
    SET status = 1
    WHERE id = _id;

    UPDATE item_points
    SET status = 1
    WHERE item_id = _id;
END

$function$;

ALTER FUNCTION public.item_status_activation(integer)
    OWNER TO postgres;
