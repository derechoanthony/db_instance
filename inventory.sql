-- Table: public.inventory

-- DROP TABLE public.inventory;

CREATE TABLE public.inventory
(
    id integer NOT NULL DEFAULT nextval('inventory_id_seq'::regclass),
    name character varying(150) COLLATE pg_catalog."default",
    description character varying(255) COLLATE pg_catalog."default",
    uom_id integer NOT NULL DEFAULT nextval('inventory_uom_id_seq'::regclass),
    category_id integer NOT NULL DEFAULT nextval('inventory_category_id_seq'::regclass),
    price numeric(12, 2),
    quantity integer,
    restock integer,
    status smallint DEFAULT 1,
    created_at timestamp without time zone NOT NULL DEFAULT now(),
    updated_at timestamp without time zone NOT NULL DEFAULT now(),
    image character varying(255) COLLATE pg_catalog."default",
    code character varying(25) COLLATE pg_catalog."default",
    is_delete smallint DEFAULT 0,
    CONSTRAINT pk_inventory PRIMARY KEY (id),
    CONSTRAINT inventory_code_key UNIQUE (code),
    CONSTRAINT inventory_category_id_fkey FOREIGN KEY (category_id)
        REFERENCES public.category (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT inventory_uom_id_fkey FOREIGN KEY (uom_id)
        REFERENCES public.uom (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.inventory
    OWNER to postgres;