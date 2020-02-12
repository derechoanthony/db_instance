-- Table: public.applicationcodes

-- DROP TABLE public.applicationcodes;

CREATE TABLE public.applicationcodes
(
    id integer NOT NULL DEFAULT nextval('applicationcodes_id_seq'::regclass),
    code character varying(100) COLLATE pg_catalog."default",
    count integer,
    status smallint DEFAULT 1,
    created_at timestamp without time zone NOT NULL DEFAULT now(),
    updated_at timestamp without time zone NOT NULL DEFAULT now(),
    points integer,
    key character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT pk_applicationcodes PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.applicationcodes
    OWNER to postgres;