-- Table: public.user_roles

-- DROP TABLE public.user_roles;

CREATE TABLE public.user_roles
(
    id integer NOT NULL DEFAULT nextval('user_roles_id_seq'::regclass),
    profile_id integer NOT NULL DEFAULT nextval('user_roles_profile_id_seq'::regclass),
    roles_id integer NOT NULL DEFAULT nextval('user_roles_roles_id_seq'::regclass),
    status smallint DEFAULT 0,
    created_at timestamp without time zone NOT NULL DEFAULT now(),
    updated_at timestamp without time zone NOT NULL DEFAULT now(),
    CONSTRAINT pk_users_roles PRIMARY KEY (id),
    CONSTRAINT user_roles_profile_id_fkey FOREIGN KEY (profile_id)
        REFERENCES public.users_profile (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT user_roles_roles_id_fkey FOREIGN KEY (roles_id)
        REFERENCES public.roles (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.user_roles
    OWNER to postgres;