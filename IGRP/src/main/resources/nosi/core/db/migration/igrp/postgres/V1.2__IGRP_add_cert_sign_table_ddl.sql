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
    cert_sn text ,
    user_context text ,
    user_id text ,
    user_ip text ,
    env_id text ,
    name text ,
    mime_type text ,
    updated_at timestamp without time zone,
    CONSTRAINT tbl_cert_signs_pkey PRIMARY KEY (uuid)
);