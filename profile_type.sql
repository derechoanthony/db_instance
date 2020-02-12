-- Table: public.profile_type

-- DROP TABLE public.profile_type;

CREATE TABLE public.profile_type
(
    id integer NOT NULL DEFAULT nextval('profile_type_id_seq'::regclass),
    user_type_id integer NOT NULL DEFAULT nextval('profile_type_user_type_id_seq'::regclass),
    user_profile_id integer NOT NULL DEFAULT nextval('profile_type_user_profile_id_seq'::regclass),
    status smallint DEFAULT 1,
    CONSTRAINT pk_profiletype PRIMARY KEY (id),
    CONSTRAINT profile_type_user_profile_id_fkey FOREIGN KEY (user_profile_id)
        REFERENCES public.users_profile (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT profile_type_user_type_id_fkey FOREIGN KEY (user_type_id)
        REFERENCES public.user_type (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.profile_type
    OWNER to postgres;