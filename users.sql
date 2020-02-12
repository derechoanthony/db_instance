-- Table: public.users

-- DROP TABLE public.users;

CREATE TABLE public.users
(
    id integer NOT NULL DEFAULT nextval('users_id_seq'::regclass),
    profile_id integer NOT NULL DEFAULT nextval('users_profile_id_seq1'::regclass),
    username character varying(50) COLLATE pg_catalog."default" NOT NULL,
    userpassword character varying(255) COLLATE pg_catalog."default" NOT NULL,
    status smallint DEFAULT 0,
    created_at timestamp without time zone NOT NULL DEFAULT now(),
    updated_at timestamp without time zone NOT NULL DEFAULT now(),
    CONSTRAINT pk_users PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.users
    OWNER to postgres;