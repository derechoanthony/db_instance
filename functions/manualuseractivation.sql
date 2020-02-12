-- FUNCTION: public.manualuseractivation(character varying, integer)

-- DROP FUNCTION public.manualuseractivation(character varying, integer);

CREATE OR REPLACE FUNCTION public.manualuseractivation(
	_email character varying,
	_profileid integer)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100.0
    VOLATILE NOT LEAKPROOF 
AS $function$

BEGIN
    UPDATE users SET status = 1 WHERE  profile_id = _profileId;
    UPDATE users_profile SET status = 1 WHERE  id = _profileId;
    UPDATE user_roles SET status = 1 WHERE profile_id = _profileId;
END

$function$;

ALTER FUNCTION public.manualuseractivation(character varying, integer)
    OWNER TO postgres;
