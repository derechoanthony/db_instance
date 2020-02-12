-- Table: public.user_type

-- DROP TABLE public.user_type;

CREATE TABLE public.user_type
(
    id integer NOT NULL DEFAULT nextval('user_type_id_seq'::regclass),
    name character varying(50) COLLATE pg_catalog."default",
    status smallint DEFAULT 1,
    CONSTRAINT pk_usertype PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.user_type
    OWNER to postgres;