-- Table: public.commissional_points

-- DROP TABLE public.commissional_points;

CREATE TABLE public.commissional_points
(
    id integer NOT NULL DEFAULT nextval('commissional_points_id_seq'::regclass),
    item_id integer NOT NULL DEFAULT nextval('commissional_points_item_id_seq'::regclass),
    points character varying(10) COLLATE pg_catalog."default",
    created_at timestamp without time zone NOT NULL DEFAULT now(),
    updated_at timestamp without time zone NOT NULL DEFAULT now(),
    uid integer NOT NULL DEFAULT nextval('commissional_points_uid_seq'::regclass),
    transaction_code character varying(25) COLLATE pg_catalog."default",
    CONSTRAINT pk_commissional_points PRIMARY KEY (id),
    CONSTRAINT commissional_points_item_id_fkey FOREIGN KEY (item_id)
        REFERENCES public.inventory (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT commissional_points_uid_fkey FOREIGN KEY (uid)
        REFERENCES public.users (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.commissional_points
    OWNER to postgres;