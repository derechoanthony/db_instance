-- Table: public.encashment

-- DROP TABLE public.encashment;

CREATE TABLE public.encashment
(
    id integer NOT NULL DEFAULT nextval('encashment_id_seq'::regclass),
    uid integer NOT NULL DEFAULT nextval('encashment_uid_seq'::regclass),
    amount numeric(12, 2),
    emp_id integer NOT NULL DEFAULT nextval('encashment_emp_id_seq'::regclass),
    status integer,
    encashment_date timestamp without time zone,
    created_at timestamp without time zone NOT NULL DEFAULT now(),
    updated_at timestamp without time zone NOT NULL DEFAULT now(),
    CONSTRAINT pk_encashment PRIMARY KEY (id),
    CONSTRAINT encashment_emp_id_fkey FOREIGN KEY (emp_id)
        REFERENCES public.users (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT encashment_uid_fkey FOREIGN KEY (uid)
        REFERENCES public.users (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.encashment
    OWNER to postgres;