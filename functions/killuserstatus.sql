-- FUNCTION: public.killuserstatus(character varying)

-- DROP FUNCTION public.killuserstatus(character varying);

CREATE OR REPLACE FUNCTION public.killuserstatus(
	_email character varying)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100.0
    VOLATILE NOT LEAKPROOF 
AS $function$

BEGIN
    UPDATE users SET status = 0 WHERE username = _email;
    UPDATE users_profile SET status = 0 WHERE email = _email;
    UPDATE user_roles SET status = 0 WHERE profile_id = (SELECT id FROM users_profile WHERE email=_email);
END

$function$;

ALTER FUNCTION public.killuserstatus(character varying)
    OWNER TO postgres;
