-- Table: public.users_profile

-- DROP TABLE public.users_profile;

CREATE TABLE public.users_profile
(
    id integer NOT NULL DEFAULT nextval('users_profile_id_seq'::regclass),
    first_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    middle_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    last_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    suffix character varying(10) COLLATE pg_catalog."default" NOT NULL,
    nickname character varying(50) COLLATE pg_catalog."default" NOT NULL,
    bdate date,
    mobile_no character varying(50) COLLATE pg_catalog."default" NOT NULL,
    present_address character varying(255) COLLATE pg_catalog."default" NOT NULL,
    permanent_address character varying(255) COLLATE pg_catalog."default" NOT NULL,
    email character varying(50) COLLATE pg_catalog."default" NOT NULL,
    father_full_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    mother_full_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    beneficiary_full_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    status smallint DEFAULT 0,
    profile_image character varying(255) COLLATE pg_catalog."default" NOT NULL DEFAULT 'asset/default-user.png'::character varying,
    applicationcode character varying(100) COLLATE pg_catalog."default",
    memberkey character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT pk_userprofile PRIMARY KEY (id),
    CONSTRAINT users_profile_email_key UNIQUE (email)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.users_profile
    OWNER to postgres;