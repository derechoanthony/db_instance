-- Table: public.roles

-- DROP TABLE public.roles;

CREATE TABLE public.roles
(
    id integer NOT NULL DEFAULT nextval('roles_id_seq'::regclass),
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    status smallint DEFAULT 0,
    created_at timestamp without time zone NOT NULL DEFAULT now(),
    updated_at timestamp without time zone NOT NULL DEFAULT now(),
    CONSTRAINT pk_roles PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.roles
    OWNER to postgres;