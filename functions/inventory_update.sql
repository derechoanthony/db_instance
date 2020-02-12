-- FUNCTION: public.inventory_update(character varying, character varying, character varying, integer, integer, numeric, integer, integer, character varying, character varying, character varying, character varying, integer)

-- DROP FUNCTION public.inventory_update(character varying, character varying, character varying, integer, integer, numeric, integer, integer, character varying, character varying, character varying, character varying, integer);

CREATE OR REPLACE FUNCTION public.inventory_update(
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
	_commissional_points character varying,
	_id integer)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100.0
    VOLATILE NOT LEAKPROOF 
AS $function$

BEGIN
    UPDATE inventory 
    -- code = _code,
    SET name=_name,description=_description,
        uom_id=_uom_id,category_id=_category_id,price=_price,
        quantity=_qunatity,restock=_restock,image=_image
    WHERE id = _id;

    UPDATE item_points
    SET binary_points =_binary_points,positional_points=_positional_points,commissional_points=_commissional_points
    WHERE item_id = _id;
END

$function$;

ALTER FUNCTION public.inventory_update(character varying, character varying, character varying, integer, integer, numeric, integer, integer, character varying, character varying, character varying, character varying, integer)
    OWNER TO postgres;
