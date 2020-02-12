-- Table: public.category

-- DROP TABLE public.category;

CREATE TABLE public.category
(
    id integer NOT NULL DEFAULT nextval('category_id_seq'::regclass),
    description character varying(150) COLLATE pg_catalog."default",
    status smallint DEFAULT 1,
    created_at timestamp without time zone NOT NULL DEFAULT now(),
    updated_at timestamp without time zone NOT NULL DEFAULT now(),
    CONSTRAINT pk_category PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.category
    OWNER to postgres;