-- Table: public.uom

-- DROP TABLE public.uom;

CREATE TABLE public.uom
(
    id integer NOT NULL DEFAULT nextval('uom_id_seq'::regclass),
    code character varying(10) COLLATE pg_catalog."default",
    description character varying(150) COLLATE pg_catalog."default",
    status smallint DEFAULT 1,
    created_at timestamp without time zone NOT NULL DEFAULT now(),
    updated_at timestamp without time zone NOT NULL DEFAULT now(),
    CONSTRAINT pk_uom PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.uom
    OWNER to postgres;