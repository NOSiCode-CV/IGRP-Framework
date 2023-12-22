CREATE INDEX IF NOT EXISTS profmp on tbl_profile (type_fk, type,user_fk)
CREATE INDEX IF NOT EXISTS menu_ae on tbl_menu (action_fk, env_fk)