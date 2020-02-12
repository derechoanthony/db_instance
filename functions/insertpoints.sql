-- FUNCTION: public.insertpoints(integer, integer, character varying)

-- DROP FUNCTION public.insertpoints(integer, integer, character varying);

CREATE OR REPLACE FUNCTION public.insertpoints(
	_item_code integer,
	_u_id integer,
	_transaction_code character varying)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100.0
    VOLATILE NOT LEAKPROOF 
AS $function$

BEGIN
    INSERT INTO binary_points (item_id,points,uid,transaction_code)VALUES(_item_code,(select binary_points from item_points where item_id = _item_code),_transaction_code);
    INSERT INTO positional_points (item_id,points,uid,transaction_code)VALUES(_item_code,(select positional_points from item_points where item_id = _item_code),_transaction_code);
    INSERT INTO commissional_points (item_id,points,uid,transaction_code)VALUES(_item_code,(select commissional_points from item_points where item_id = _item_code),_transaction_code);
END

$function$;

ALTER FUNCTION public.insertpoints(integer, integer, character varying)
    OWNER TO postgres;
