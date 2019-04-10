package nosi.core.webapp.security;

import java.util.ArrayList;
import java.util.List;

/**
 * Emanuel
 * 4 Apr 2019
 */
public class PagesScapePermission {

	public static final List<String> PAGES_WIDTHOUT_LOGIN = new ArrayList<>();
	
	public static final List<String> PAGES_SCAPE_ENCRYPT= new ArrayList<>();
	
	public static final List<String> PAGES_SHAREDS = new ArrayList<>();
	
	static {
		PAGES_WIDTHOUT_LOGIN.add("igrp/login/login".toLowerCase());
		PAGES_WIDTHOUT_LOGIN.add("igrp/home/index".toLowerCase());
		PAGES_WIDTHOUT_LOGIN.add("igrp/ErrorPage/exception".toLowerCase());
		PAGES_WIDTHOUT_LOGIN.add("igrp/error-page/exception".toLowerCase());
		PAGES_WIDTHOUT_LOGIN.add("igrp/error-page/notFound".toLowerCase());
		PAGES_WIDTHOUT_LOGIN.add("igrp/login/logout".toLowerCase());	
		PAGES_WIDTHOUT_LOGIN.add("igrp/Page/detailPage".toLowerCase());
		PAGES_WIDTHOUT_LOGIN.add("igrp/Page/listPage".toLowerCase());
		PAGES_WIDTHOUT_LOGIN.add("igrp/Page/listService".toLowerCase());
		PAGES_WIDTHOUT_LOGIN.add("igrp/Page/imageList".toLowerCase());
		PAGES_WIDTHOUT_LOGIN.add("igrp/Page/preserveUrl".toLowerCase());
		PAGES_WIDTHOUT_LOGIN.add("igrp/Page/listDomains".toLowerCase());
		PAGES_WIDTHOUT_LOGIN.add("igrp/Page/domainsValues".toLowerCase());
		PAGES_WIDTHOUT_LOGIN.add("igrp/Page/getPageJson".toLowerCase());
	}

	/**
	 * Page/Action calling with IGRP Javascript
	 */
	static {
		PAGES_SCAPE_ENCRYPT.add("igrp/pesquisar-menu/myMenu".toLowerCase());
		PAGES_SCAPE_ENCRYPT.add("igrp/pesquisar-menu/topMenu".toLowerCase());
		PAGES_SCAPE_ENCRYPT.add("igrp_studio/env/myApps".toLowerCase());
		PAGES_SCAPE_ENCRYPT.add("igrp_studio/env/openApp".toLowerCase());
		PAGES_SCAPE_ENCRYPT.add("igrp_studio/WebReport/get-image".toLowerCase());
		PAGES_SCAPE_ENCRYPT.add("igrp/File/save-image".toLowerCase());
		PAGES_SCAPE_ENCRYPT.add("igrp/File/get-file".toLowerCase());
		PAGES_SCAPE_ENCRYPT.add("igrp/Page/fileExists".toLowerCase());
		PAGES_SCAPE_ENCRYPT.add("igrp/Page/metodos-core".toLowerCase());
		PAGES_SCAPE_ENCRYPT.add("igrp/Page/detailPage".toLowerCase());
		PAGES_SCAPE_ENCRYPT.add("igrp/Page/listPage".toLowerCase());
		PAGES_SCAPE_ENCRYPT.add("igrp/Page/listService".toLowerCase());
		PAGES_SCAPE_ENCRYPT.add("igrp/Page/imageList".toLowerCase());
		PAGES_SCAPE_ENCRYPT.add("igrp/Page/preserveUrl".toLowerCase());
		PAGES_SCAPE_ENCRYPT.add("igrp/Page/listDomains".toLowerCase());
		PAGES_SCAPE_ENCRYPT.add("igrp/Page/domainsValues".toLowerCase());
		PAGES_SCAPE_ENCRYPT.add("igrp/Page/getPageJson".toLowerCase());
	}
	
	static {
		PAGES_SHAREDS.add("igrp/home/index".toLowerCase());
		PAGES_SHAREDS.add("igrp/DefaultPage/index".toLowerCase());
		PAGES_SHAREDS.add("igrp/ExecucaoTarefas/index".toLowerCase());
		PAGES_SHAREDS.add("igrp/ExecucaoTarefas/Assumir_button_tabela".toLowerCase());
		PAGES_SHAREDS.add("igrp/ExecucaoTarefas/Leberar_tarefa_button_minha_tarefas".toLowerCase());
		PAGES_SHAREDS.add("igrp/ExecucaoTarefas/Detalhes_processos_button_minha_tarefas".toLowerCase());
		PAGES_SHAREDS.add("igrp/ExecucaoTarefas/Detalhes_minha_tarefa".toLowerCase());
		PAGES_SHAREDS.add("igrp/ExecucaoTarefas/Executar_button_minha_tarefas".toLowerCase());
		PAGES_SHAREDS.add("igrp/ExecucaoTarefas/Alterar_prioridade_tarefa".toLowerCase());
		PAGES_SHAREDS.add("igrp/ExecucaoTarefas/Detalhes_processo".toLowerCase());
		PAGES_SHAREDS.add("igrp/ExecucaoTarefas/Detalhes_tarefa".toLowerCase());
		PAGES_SHAREDS.add("igrp/ExecucaoTarefas/Transferir_tarefa".toLowerCase());
		PAGES_SHAREDS.add("igrp/ExecucaoTarefas/Enviar_msg".toLowerCase());
		PAGES_SHAREDS.add("igrp/ExecucaoTarefas/Ver_estatistica".toLowerCase());
		PAGES_SHAREDS.add("igrp/ExecucaoTarefas/Ver_detalhes".toLowerCase());
		PAGES_SHAREDS.add("igrp/ExecucaoTarefas/Pesquisar_estatistica".toLowerCase());
		PAGES_SHAREDS.add("igrp/ExecucaoTarefas/Pesquisar_colaborador".toLowerCase());
		PAGES_SHAREDS.add("igrp/ExecucaoTarefas/Pesquisar_tarefa".toLowerCase());
		PAGES_SHAREDS.add("igrp/ExecucaoTarefas/Pesquisar_button_minhas_tarefas".toLowerCase());
		PAGES_SHAREDS.add("igrp/ExecucaoTarefas/Pesquisar_button_disponiveis".toLowerCase());
		PAGES_SHAREDS.add("igrp/ExecucaoTarefas/Iniciar_novo_processo".toLowerCase());
		PAGES_SHAREDS.add("igrp/ExecucaoTarefas/Show_diagram".toLowerCase());
		PAGES_SHAREDS.add("igrp/ExecucaoTarefas/Cancelar_processo".toLowerCase());
		PAGES_SHAREDS.add("igrp/ExecucaoTarefas/Cancelar_processo".toLowerCase());
		PAGES_SHAREDS.add("igrp/ExecucaoTarefas/process-task".toLowerCase());
		PAGES_SHAREDS.add("igrp/Dash_board_processo/index".toLowerCase());
	}
}
