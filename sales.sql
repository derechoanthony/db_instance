-- Table: public.sales

-- DROP TABLE public.sales;

CREATE TABLE public.sales
(
    id integer NOT NULL DEFAULT nextval('sales_id_seq'::regclass),
    salesinvoice character varying(25) COLLATE pg_catalog."default",
    transaction_code character varying(25) COLLATE pg_catalog."default",
    u_id integer NOT NULL DEFAULT nextval('sales_u_id_seq'::regclass),
    purchase_date timestamp without time zone NOT NULL DEFAULT now(),
    total_amount numeric(12, 2),
    amount_tender numeric(12, 2),
    prepared_by integer NOT NULL DEFAULT nextval('sales_prepared_by_seq'::regclass),
    created_at timestamp without time zone NOT NULL DEFAULT now(),
    updated_at timestamp without time zone NOT NULL DEFAULT now(),
    _isvoid integer DEFAULT 0,
    particulars character varying(500) COLLATE pg_catalog."default" DEFAULT 'N/a'::character varying,
    CONSTRAINT pk_sales PRIMARY KEY (id),
    CONSTRAINT sales_prepared_by_fkey FOREIGN KEY (prepared_by)
        REFERENCES public.users (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT sales_u_id_fkey FOREIGN KEY (u_id)
        REFERENCES public.users (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.sales
    OWNER to postgres;