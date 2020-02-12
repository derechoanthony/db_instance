-- FUNCTION: public.insertcashieringdetail(character varying, character varying, integer, integer, numeric)

-- DROP FUNCTION public.insertcashieringdetail(character varying, character varying, integer, integer, numeric);

CREATE OR REPLACE FUNCTION public.insertcashieringdetail(
	_salesinvoice character varying,
	_transaction_code character varying,
	_item_code integer,
	_quantity integer,
	_amount numeric)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100.0
    VOLATILE NOT LEAKPROOF 
AS $function$

BEGIN
    INSERT INTO sales_details(salesinvoice,transaction_code,item_code,quantity,amount) VALUES
    (_salesinvoice,_transaction_code,_item_code,_quantity,_amount);

    UPDATE inventory SET quantity = quantity - _quantity WHERE id = _item_code;
END

$function$;

ALTER FUNCTION public.insertcashieringdetail(character varying, character varying, integer, integer, numeric)
    OWNER TO postgres;
