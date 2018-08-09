ALTER TABLE public.tbl_config_env ALTER column charset DROP NOT NULL;
ALTER TABLE public.tbl_config_env ALTER column host DROP NOT NULL;
ALTER TABLE public.tbl_config_env ALTER column name_db DROP NOT NULL;
ALTER TABLE public.tbl_config_env ALTER column port DROP NOT NULL;