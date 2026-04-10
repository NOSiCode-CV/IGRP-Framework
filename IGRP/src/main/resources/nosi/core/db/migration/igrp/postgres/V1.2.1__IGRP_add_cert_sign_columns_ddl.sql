ALTER TABLE IF EXISTS public.tbl_cert_signs
    ADD COLUMN IF NOT EXISTS cert_sn text,
    ADD COLUMN IF NOT EXISTS user_context text,
    ADD COLUMN IF NOT EXISTS user_id text,
    ADD COLUMN IF NOT EXISTS user_ip text,
    ADD COLUMN IF NOT EXISTS env_id text,
    ADD COLUMN IF NOT EXISTS name text,
    ADD COLUMN IF NOT EXISTS mime_type text;