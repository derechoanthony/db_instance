-- FUNCTION: public.login(character varying, character varying)

-- DROP FUNCTION public.login(character varying, character varying);

CREATE OR REPLACE FUNCTION public.login(
	_username character varying,
	_password character varying)
    RETURNS refcursor
    LANGUAGE 'plpgsql'
    COST 100.0
    VOLATILE NOT LEAKPROOF 
AS $function$

DECLARE
    ref refcursor;
BEGIN
    OPEN ref FOR select users.id,users_profile.first_name,users_profile.middle_name,users_profile.last_name,users_profile.email,user_roles.roles_id,roles.name from users inner join users_profile  on users.profile_id = users_profile.id inner join user_roles on users_profile.id=user_roles.profile_id inner join roles on user_roles.roles_id = roles.id where users.username='derechoanthony2@gmail.com' and users.userpassword='22536293fa34e1dbbd2e1ca21046ebc866acd1c2011575f1af23275cf20fae6d';

    RETURN ref;
END;

$function$;

ALTER FUNCTION public.login(character varying, character varying)
    OWNER TO postgres;
