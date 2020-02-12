-- FUNCTION: public.inventory_entry(character varying, character varying, character varying, integer, integer, numeric, integer, integer, character varying, character varying, character varying, character varying)

-- DROP FUNCTION public.inventory_entry(character varying, character varying, character varying, integer, integer, numeric, integer, integer, character varying, character varying, character varying, character varying);

CREATE OR REPLACE FUNCTION public.inventory_entry(
	_code character varying,
	_name character varying,
	_description character varying,
	_uom_id integer,
	_category_id integer,
	_price numeric,
	_qunatity integer,
	_restock integer,
	_image character varying,
	_binary_points character varying,
	_positional_points character varying,
	_commissional_points character varying)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100.0
    VOLATILE NOT LEAKPROOF 
AS $function$

BEGIN
    INSERT INTO inventory(code,name,description,uom_id,category_id,price,quantity,restock,image) 
    VALUES (_code,_name,_description,_uom_id,_category_id,_price,_qunatity,_restock,_image);
    INSERT INTO item_points (item_id,binary_points,positional_points,commissional_points)
    VALUES ((SELECT id FROM inventory where code =_code),_binary_points,_positional_points,_commissional_points);

END

$function$;

ALTER FUNCTION public.inventory_entry(character varying, character varying, character varying, integer, integer, numeric, integer, integer, character varying, character varying, character varying, character varying)
    OWNER TO postgres;
