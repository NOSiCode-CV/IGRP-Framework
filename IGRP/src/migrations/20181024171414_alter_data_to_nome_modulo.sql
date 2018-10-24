UPDATE public.tbl_action
SET  nomemodulo=(select m.name from public.tbl_modulo m where m.id=public.tbl_action.module_fk)
WHERE module_fk is not null