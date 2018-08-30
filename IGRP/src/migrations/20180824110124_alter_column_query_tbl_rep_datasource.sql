ALTER TABLE public.tbl_rep_source
    ALTER COLUMN type_query TYPE text ;
    
    ALTER TABLE public.tbl_rep_template_param
    ADD COLUMN rep_source_fk integer;
ALTER TABLE public.tbl_rep_template_param
    ADD CONSTRAINT "REP_SOURCE_PARAM_FK" FOREIGN KEY (rep_source_fk)
    REFERENCES public.tbl_rep_source (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;