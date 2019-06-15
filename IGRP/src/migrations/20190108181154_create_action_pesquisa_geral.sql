INSERT INTO public.tbl_action(
	 action, action_descr, iscomponent, package_name, page, page_descr, status, versao, xsl_src, env_fk,tipo)
	VALUES ('index', 'Pesquisa BI-CNI-passport', 0, 'nosi.webapps.igrp_studio.pages', 'Pesquisa_bi_cni_passport', 'Pesquisa BI-CNI-passport', 1, 2.3,'igrp_studio/pesquisa_bi_cni_passport/Pesquisa_bi_cni_passport.xsl', 3, 0);
 

INSERT INTO public.tbl_action(
	 action, action_descr, iscomponent, package_name, page, page_descr, status, versao, xsl_src, env_fk,tipo)
	VALUES ('index', 'Pesquisa NIF', 0, 'nosi.webapps.igrp_studio.pages', 'Pesquisa_nif_rest', 'Pesquisa NIF', 1, 2.3,'igrp_studio/pesquisa_nif_rest/Pesquisa_nif_rest.xsl', 3, 0);
	
INSERT INTO public.tbl_action(
	 action, action_descr, iscomponent, package_name, page, page_descr, status, versao, xsl_src, env_fk,tipo)
	VALUES ('index', 'Pesquisa Geografia', 0, 'nosi.webapps.igrp_studio.pages', 'Pesquisa_geografia', 'Pesquisa Geografia', 1, 2.3,'igrp_studio/pesquisa_geografia/Pesquisa_geografia.xsl', 3, 0);

INSERT INTO public.tbl_action(
	 action, action_descr, iscomponent, package_name, page, page_descr, status, versao, xsl_src, env_fk,tipo)
	VALUES ('index', 'Pesquisa nacionalidade', 0, 'nosi.webapps.igrp_studio.pages', 'Pesquisa_nacionalidade', 'Pesquisa nacionalidade', 1, 2.3,'igrp_studio/pesquisa_nacionalidade/Pesquisa_nacionalidade.xsl', 3, 0);

INSERT INTO public.tbl_action(action, action_descr, package_name, page, page_descr, status, versao, xsl_src, env_fk,isComponent,tipo)
VALUES ( 'index', 'Pesquisa CAE', 'nosi.webapps.igrp.pages', 'Pesquisa_cae', 'Pesquisa CAE', 1, '2.3','igrp/pesquisa_cae/Pesquisa_cae.xsl', 1,0,1);