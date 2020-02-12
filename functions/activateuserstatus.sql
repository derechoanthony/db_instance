-- FUNCTION: public.activateuserstatus(character varying)

-- DROP FUNCTION public.activateuserstatus(character varying);

CREATE OR REPLACE FUNCTION public.activateuserstatus(
	_email character varying)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100.0
    VOLATILE NOT LEAKPROOF 
AS $function$

BEGIN
    UPDATE users SET status = 1 WHERE username = _email;
    UPDATE users_profile SET status = 1 WHERE email = _email;
    UPDATE user_roles SET status = 1 WHERE profile_id = (SELECT id FROM users_profile WHERE email=_email);
END

$function$;

ALTER FUNCTION public.activateuserstatus(character varying)
    OWNER TO postgres;
