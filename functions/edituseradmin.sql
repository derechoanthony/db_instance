-- FUNCTION: public.edituseradmin(character varying, character varying, character varying, character varying, integer, integer, character varying)

-- DROP FUNCTION public.edituseradmin(character varying, character varying, character varying, character varying, integer, integer, character varying);

CREATE OR REPLACE FUNCTION public.edituseradmin(
	_first_name character varying,
	_middle_name character varying,
	_last_name character varying,
	_email character varying,
	_position integer,
	_id integer,
	_image character varying)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100.0
    VOLATILE NOT LEAKPROOF 
AS $function$

BEGIN
    -- UPDATE users SET userName = _email  WHERE id = _id;
    UPDATE user_roles SET roles_id = _position  WHERE profile_id = (SELECT profile_id from users where id = _id);
    -- email = _email,
    UPDATE users_profile SET first_name = _first_name,middle_name = _middle_name,last_name = _last_name,  profile_image =_image where id=(SELECT profile_id from users where id = _id);
END

$function$;

ALTER FUNCTION public.edituseradmin(character varying, character varying, character varying, character varying, integer, integer, character varying)
    OWNER TO postgres;
