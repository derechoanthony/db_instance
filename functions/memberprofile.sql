-- FUNCTION: public.memberprofile(character varying, character varying, character varying, character varying, character varying, date, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying)

-- DROP FUNCTION public.memberprofile(character varying, character varying, character varying, character varying, character varying, date, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying);

CREATE OR REPLACE FUNCTION public.memberprofile(
	_first_name character varying,
	_middle_name character varying,
	_last_name character varying,
	_suffix character varying,
	_nickname character varying,
	_bdate date,
	_mobile_no character varying,
	_present_address character varying,
	_permanent_address character varying,
	_email character varying,
	_father_full_name character varying,
	_mother_full_name character varying,
	_beneficiary_full_name character varying,
	_password character varying,
	_regcode character varying,
	_memberkey character varying)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100.0
    VOLATILE NOT LEAKPROOF 
AS $function$

BEGIN
    INSERT INTO users_profile(first_name,middle_name,last_name,suffix,nickname,bdate,mobile_no,present_address,permanent_address,email,father_full_name,mother_full_name,Beneficiary_full_name,applicationcode,memberKey)
    VALUES(_first_name,_middle_name,_last_name,_suffix,_nickname,_bdate,_mobile_no,_present_address,_permanent_address,_email,_father_full_name,_mother_full_name,_Beneficiary_full_name,_regCode,_memberKey);   
    INSERT INTO users(profile_id,userName,userPassword)values((SELECT id FROM users_profile WHERE email=_email),_email,_password);
    INSERT INTO user_roles(profile_id,roles_id)values((SELECT id FROM users_profile WHERE email=_email),(select id from roles where name='member'));
    UPDATE applicationcodes SET count = count - 1 where key = _regCode;
END

$function$;

ALTER FUNCTION public.memberprofile(character varying, character varying, character varying, character varying, character varying, date, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying)
    OWNER TO postgres;
