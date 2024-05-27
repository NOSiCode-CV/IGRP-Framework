package nosi.core.webapp.security;

import java.util.Set;

/**
 * Emanuel
 * 4 Apr 2019
 */
public final class PagesScapePermission {

   private static final Set<String> PAGES_WITHOUT_LOGIN;
   private static final Set<String> PAGES_SCAPE_ENCRYPT;
   private static final Set<String> PAGES_SHARED;

   static {
      PAGES_WITHOUT_LOGIN = Set.of(
              "igrp/login/login", "igrp/home/index", "igrp/errorpage/exception",
              "igrp/error-page/exception", "igrp/errorpage/permission", "igrp/error-page/permission",
              "igrp/error-page/notfound", "igrp/errorpage/notfound", "igrp/file/get-image-txt",
              "igrp/file/save-image", "igrp/digitalsignature/savesignature", "igrp/digitalsignature/downloadcertificate",
              "igrp/digitalsignature/downloaddata", "igrp/file/getpublicfile", "igrp/page/detailpage",
              "igrp/page/listpage", "igrp/page/listservice", "igrp/page/imagelist",
              "igrp/page/preserveurl", "igrp/page/listdomains", "igrp/page/domainsvalues",
              "igrp/page/getpagejson", "inps_porton/pagamento_de_servico/index", "inps_porton/pagamento_de_servico/pagar",
              "igrp_studio/web-report/get-link-report", "igrp_studio/web-report/get-contraprova", "igrp_studio/webreport/get-image",
              "igrp_studio/webreport/preview", "igrp_studio/web-report/get-xsl", "portondinosilha/pagamento_de_donativo/index",
              "portondinosilha/pagamento_de_servico/index"
      );

      PAGES_SCAPE_ENCRYPT = Set.of(
              "igrp/login/login", "igrp/login/logout", "igrp/errorpage/exception",
              "igrp/error-page/exception", "igrp/errorpage/permission", "igrp/error-page/permission",
              "igrp/error-page/notfound", "igrp/errorpage/notfound", "igrp/pesquisar-menu/mymenu",
              "igrp/pesquisar-menu/topmenu", "igrp_studio/env/myapps", "igrp_studio/env/openapp",
              "igrp_studio/webreport/get-image", "igrp_studio/web-report/get-contraprova", "igrp_studio/web-report/get-xsl",
              "igrp/file/get-image-txt", "igrp/file/save-image", "igrp/file/get-file",
              "igrp/digitalsignature/savesignature", "igrp/digitalsignature/downloadcertificate", "igrp/digitalsignature/downloaddata",
              "igrp/page/fileexists", "igrp/page/metodos-core", "igrp/page/detailpage",
              "igrp/page/listpage", "igrp/page/listservice", "igrp/page/imagelist",
              "igrp/page/preserveurl", "igrp/page/listdomains", "igrp/page/domainsvalues",
              "igrp/page/getpagejson", "inps_porton/pagamento_de_servico/index", "inps_porton/pagamento_de_servico/pagar",
              "portondinosilha/pagamento_de_donativo/index", "portondinosilha/pagamento_de_servico/index"
      );

      PAGES_SHARED = Set.of(
              "igrp_studio/webreport/get-image", "igrp_studio/env/myapps", "igrp_studio/env/openapp",
              "igrp/file/save-image", "igrp/error-page/permission", "igrp/pesquisar-menu/mymenu",
              "igrp/pesquisar-menu/topmenu", "igrp/error-page/notfound", "igrp/home/index",
              "tutorial/defaultpage/index", "igrp/execucaotarefas/index", "igrp/execucaotarefas/assumir_button_tabela",
              "igrp/execucaotarefas/leberar_tarefa_button_minha_tarefas", "igrp/execucaotarefas/detalhes_processos_button_minha_tarefas", "igrp/execucaotarefas/detalhes_minha_tarefa",
              "igrp/execucaotarefas/executar_button_minha_tarefas", "igrp/execucaotarefas/alterar_prioridade_tarefa", "igrp/execucaotarefas/detalhes_processo",
              "igrp/execucaotarefas/detalhes_tarefa", "igrp/execucaotarefas/transferir_tarefa", "igrp/execucaotarefas/enviar_msg",
              "igrp/execucaotarefas/ver_estatistica", "igrp/execucaotarefas/ver_detalhes", "igrp/execucaotarefas/pesquisar_estatistica",
              "igrp/execucaotarefas/pesquisar_colaborador", "igrp/execucaotarefas/pesquisar_tarefa", "igrp/execucaotarefas/pesquisar_button_minhas_tarefas",
              "igrp/execucaotarefas/pesquisar_button_disponiveis", "igrp/execucaotarefas/iniciar_novo_processo", "igrp/execucaotarefas/show_diagram",
              "igrp/execucaotarefas/cancelar_processo", "igrp/execucaotarefas/process-task", "igrp/dash_board_processo/index"
      );
   }

   public static Set<String> getPagesWithoutLogin() {
      return PAGES_WITHOUT_LOGIN;
   }

   public static Set<String> getPagesScapeEncrypt() {
      return PAGES_SCAPE_ENCRYPT;
   }

   public static Set<String> getPagesShared() {
      return PAGES_SHARED;
   }
}
