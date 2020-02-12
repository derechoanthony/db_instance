-- Table: public.item_points

-- DROP TABLE public.item_points;

CREATE TABLE public.item_points
(
    id integer NOT NULL DEFAULT nextval('item_points_id_seq'::regclass),
    item_id integer NOT NULL DEFAULT nextval('item_points_item_id_seq'::regclass),
    binary_points character varying(25) COLLATE pg_catalog."default",
    positional_points character varying(25) COLLATE pg_catalog."default",
    commissional_points character varying(25) COLLATE pg_catalog."default",
    status smallint DEFAULT 1,
    created_at timestamp without time zone NOT NULL DEFAULT now(),
    updated_at timestamp without time zone NOT NULL DEFAULT now(),
    is_delete smallint DEFAULT 0,
    CONSTRAINT pk_item_points PRIMARY KEY (id),
    CONSTRAINT item_points_item_id_fkey FOREIGN KEY (item_id)
        REFERENCES public.inventory (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.item_points
    OWNER to postgres;