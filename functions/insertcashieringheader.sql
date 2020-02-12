-- FUNCTION: public.insertcashieringheader(character varying, character varying, integer, numeric, numeric, integer)

-- DROP FUNCTION public.insertcashieringheader(character varying, character varying, integer, numeric, numeric, integer);

CREATE OR REPLACE FUNCTION public.insertcashieringheader(
	_salesinvoice character varying,
	_transaction_code character varying,
	_u_id integer,
	_total_amount numeric,
	_amount_tender numeric,
	_prepared_by integer)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100.0
    VOLATILE NOT LEAKPROOF 
AS $function$

BEGIN
    INSERT INTO sales(salesinvoice,transaction_code,u_id,total_amount,amount_tender,prepared_by) VALUES
    (_salesinvoice,_transaction_code,_u_id,_total_amount,_amount_tender,_prepared_by);
END

$function$;

ALTER FUNCTION public.insertcashieringheader(character varying, character varying, integer, numeric, numeric, integer)
    OWNER TO postgres;
