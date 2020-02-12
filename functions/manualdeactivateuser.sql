-- FUNCTION: public.manualdeactivateuser(character varying, integer)

-- DROP FUNCTION public.manualdeactivateuser(character varying, integer);

CREATE OR REPLACE FUNCTION public.manualdeactivateuser(
	_email character varying,
	_profileid integer)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100.0
    VOLATILE NOT LEAKPROOF 
AS $function$

BEGIN
    UPDATE users SET status = 0 WHERE  profile_id = _profileId;
    UPDATE users_profile SET status = 0 WHERE id = _profileId;
    UPDATE user_roles SET status = 0 WHERE profile_id = _profileId;
END

$function$;

ALTER FUNCTION public.manualdeactivateuser(character varying, integer)
    OWNER TO postgres;
