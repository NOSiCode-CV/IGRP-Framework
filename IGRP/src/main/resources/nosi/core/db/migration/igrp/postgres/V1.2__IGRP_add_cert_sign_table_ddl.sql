-- Table: public.tbl_cert_signs

-- DROP TABLE IF EXISTS public.tbl_cert_signs;

CREATE TABLE IF NOT EXISTS public.tbl_cert_signs
(
    uuid uuid NOT NULL,
    certificate text ,
    created_at timestamp without time zone,
    file_id text ,
    data text ,
    data_hash text,
    status text ,
    updated_at timestamp without time zone,
    CONSTRAINT tbl_cert_signs_pkey PRIMARY KEY (uuid)
);