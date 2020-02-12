-- Table: public.sales_details

-- DROP TABLE public.sales_details;

CREATE TABLE public.sales_details
(
    id integer NOT NULL DEFAULT nextval('sales_details_id_seq'::regclass),
    salesinvoice character varying(25) COLLATE pg_catalog."default",
    transaction_code character varying(25) COLLATE pg_catalog."default",
    item_code integer NOT NULL DEFAULT nextval('sales_details_item_code_seq'::regclass),
    quantity integer,
    amount numeric(12, 2),
    created_at timestamp without time zone NOT NULL DEFAULT now(),
    updated_at timestamp without time zone NOT NULL DEFAULT now(),
    _isvoid integer DEFAULT 0,
    redem integer DEFAULT 0,
    CONSTRAINT pk_sales_details PRIMARY KEY (id),
    CONSTRAINT sales_details_item_code_fkey FOREIGN KEY (item_code)
        REFERENCES public.inventory (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.sales_details
    OWNER to postgres;