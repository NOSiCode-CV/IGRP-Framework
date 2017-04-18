<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="IGRP-head"/>
        <!-- TOOLSBAR CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/toolsbar/includes/toolsbar.css"/>
        <!-- FORM CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/form/includes/igrp.forms.css"/>
        <!-- TABLE CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/table/includes/igrp.tables.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/table/includes/dataTables.bootstrap.css"/>
        <!-- CHART CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/chart/includes/igrp.charts.css"/>
        <!-- SELECT CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/fields/select/includes/select2/select2.min.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/fields/select/includes/select2/select2.style.css"/>
        <!-- DATE CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/fields/date/includes/dateTimePicker/css/datetimepicker.css"/>
        <style>
        </style>
      </head>
      <body class="{$bodyClass}">
        <xsl:call-template name="IGRP-topmenu"/>
        <form>
          <div class="container-fluid">
            <div class="row">
              <xsl:call-template name="IGRP-sidebar"/>
              <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
                <div class="content">
                  <div class="row">
                    <div class="gen-column col-md-8">
                      <div class="gen-inner">
                        <xsl:if  test="rows/content/page_title">
                          <section  class="content-header gen-container-item " item-name="page_title">
                            <h1>
                              <xsl:value-of select="rows/content/page_title/fields/text/value"/>
                            </h1>
                          </section>
                        </xsl:if>
                        <xsl:if  test="rows/content/gen_menu">
                          <div  class="toolsbar-holder gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" item-name="gen_menu">
                            <div class="btns-holder  pull-left" role="group">
                              <xsl:apply-templates select="rows/content/gen_menu" mode="gen-buttons"/>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if  test="rows/content/filter_1">
                          <div  class="box igrp-forms gen-container-item " item-name="filter_1">
                            <div class="box-body">
                              <div role="form" gen-id="drop-zone">
                                <xsl:if  test="rows/content/filter_1/fields/numero_processo">
                                  <div  class="form-group col-md-3   gen-fields-holder" item-name="numero_processo" item-type="number">
                                    <label for="{rows/content/filter_1/fields/numero_processo/@name}">
                                      <span gen-lbl-setter="">
                                        <xsl:value-of select="rows/content/filter_1/fields/numero_processo/label"/>
                                      </span>
                                    </label>
                                    <input type="number" value="{rows/content/filter_1/fields/numero_processo/value}" class="form-control" id="{rows/content/filter_1/fields/numero_processo/@name}" name="{rows/content/filter_1/fields/numero_processo/@name}" maxlength="30">
                                    </input>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/filter_1/fields/tipo_processo">
                                  <div  class="col-md-3 form-group  gen-fields-holder" item-name="tipo_processo" item-type="select">
                                    <label for="{rows/content/filter_1/fields/tipo_processo/@name}">
                                      <xsl:value-of select="rows/content/filter_1/fields/tipo_processo/label"/>
                                    </label>
                                    <select class="form-control select2 " id="filter_1_tipo_processo" name="{rows/content/filter_1/fields/tipo_processo/@name}">
                                      <xsl:for-each select="rows/content/filter_1/fields/tipo_processo/list/option">
                                        <option value="{value}" label="{text}">
                                          <xsl:if test="@selected='true'">
                                            <xsl:attribute name="selected">selected
                                            </xsl:attribute>
                                          </xsl:if>
                                          <span>
                                            <xsl:value-of select="text"/>
                                          </span>
                                        </option>
                                      </xsl:for-each>
                                    </select>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/filter_1/fields/data_inicio">
                                  <div  class="form-group col-md-3  gen-fields-holder" item-name="data_inicio" item-type="date">
                                    <label for="{rows/content/filter_1/fields/data_inicio/@name}">
                                      <span gen-lbl-setter="">
                                        <xsl:value-of select="rows/content/filter_1/fields/data_inicio/label"/>
                                      </span>
                                    </label>
                                    <div class="input-group">
                                      <input type="text" value="{rows/content/filter_1/fields/data_inicio/value}" class="form-control gen-date" id="filter_1-data_inicio" name="{rows/content/filter_1/fields/data_inicio/@name}" format="IGRP_datePicker" maxlength="30"/>
                                      <span class="input-group-btn gen-date-icon">
                                        <span class="btn btn-default">
                                          <i class="fa fa-calendar"/>
                                        </span>
                                      </span>
                                    </div>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/filter_1/fields/data_fim">
                                  <div  class="form-group col-md-3  gen-fields-holder" item-name="data_fim" item-type="date">
                                    <label for="{rows/content/filter_1/fields/data_fim/@name}">
                                      <span gen-lbl-setter="">
                                        <xsl:value-of select="rows/content/filter_1/fields/data_fim/label"/>
                                      </span>
                                    </label>
                                    <div class="input-group">
                                      <input type="text" value="{rows/content/filter_1/fields/data_fim/value}" class="form-control gen-date" id="filter_1-data_fim" name="{rows/content/filter_1/fields/data_fim/@name}" format="IGRP_datePicker" maxlength="30"/>
                                      <span class="input-group-btn gen-date-icon">
                                        <span class="btn btn-default">
                                          <i class="fa fa-calendar"/>
                                        </span>
                                      </span>
                                    </div>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/filter_1/fields/prioridade">
                                  <div  class="col-md-3 form-group  gen-fields-holder" item-name="prioridade" item-type="select">
                                    <label for="{rows/content/filter_1/fields/prioridade/@name}">
                                      <xsl:value-of select="rows/content/filter_1/fields/prioridade/label"/>
                                    </label>
                                    <select class="form-control select2 " id="filter_1_prioridade" name="{rows/content/filter_1/fields/prioridade/@name}">
                                      <xsl:for-each select="rows/content/filter_1/fields/prioridade/list/option">
                                        <option value="{value}" label="{text}">
                                          <xsl:if test="@selected='true'">
                                            <xsl:attribute name="selected">selected
                                            </xsl:attribute>
                                          </xsl:if>
                                          <span>
                                            <xsl:value-of select="text"/>
                                          </span>
                                        </option>
                                      </xsl:for-each>
                                    </select>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/filter_1/fields/search">
                                  <div  class="form-group col-md-3   gen-fields-holder" item-name="search" item-type="text">
                                    <label for="{rows/content/filter_1/fields/search/@name}">
                                      <span gen-lbl-setter="">
                                        <xsl:value-of select="rows/content/filter_1/fields/search/label"/>
                                      </span>
                                    </label>
                                    <input type="text" value="{rows/content/filter_1/fields/search/value}" class="form-control" id="{rows/content/filter_1/fields/search/@name}" name="{rows/content/filter_1/fields/search/@name}" maxlength="500">
                                    </input>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/filter_1/fields/pesquisar">
                                  <div  class="form-group col-md-3  gen-fields-holder" item-name="pesquisar" item-type="link">
                                    <a href="{rows/content/filter_1/fields/pesquisar/value}" class="link btn btn-primary form-link" target="_blank">
                                      <span gen-lbl-setter="">
                                        <xsl:value-of select="rows/content/filter_1/fields/pesquisar/label"/>
                                      </span>
                                    </a>
                                  </div>
                                </xsl:if>
                              </div>
                            </div>
                            <xsl:apply-templates select="rows/content/filter_1/tools-bar" mode="form-buttons"/>
                          </div>
                        </xsl:if>
                        <xsl:if  test="rows/content/gen_table_toolsbar">
                          <div  class="toolsbar-holder gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" item-name="gen_table_toolsbar">
                            <div class="btns-holder  pull-right" role="group">
                              <xsl:apply-templates select="rows/content/gen_table_toolsbar" mode="gen-buttons"/>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if  test="rows/content/gen_table">
                          <div  class="box box-table-contents gen-container-item " item-name="gen_table">
                            <div class="box-body table-box">
                              <table id="gen_table" class="table table-striped gen-data-table IGRP_contextmenu">
                                <thead>
                                  <tr gen-id="drop-zone" gen-field-template="th">
                                    <xsl:if  test="rows/content/gen_table/fields/priority">
                                      <th  align="right" class=" gen-fields-holder">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/gen_table/fields/priority/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if  test="rows/content/gen_table/fields/tarefa">
                                      <th  align="left" class=" gen-fields-holder">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/gen_table/fields/tarefa/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if  test="rows/content/gen_table/fields/categoria_processo">
                                      <th  align="left" class=" gen-fields-holder">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/gen_table/fields/categoria_processo/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if  test="rows/content/gen_table/fields/dt__entrada">
                                      <th  align="center" class=" gen-fields-holder">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/gen_table/fields/dt__entrada/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if  test="rows/content/gen_table/fields/marcar">
                                      <th  class="bs-checkbox gen-fields-holder" align="center">
                                        <input type="checkbox" class="IGRP_checkall" check-rel="marcar"/>
                                      </th>
                                    </xsl:if>
                                  </tr>
                                </thead>
                                <tbody>
                                  <xsl:for-each select="rows/content/gen_table/table/value/row">
                                    <tr gen-id="drop-zone">
                                      <xsl:apply-templates mode="context-param" select="context-menu"/>
                                      <xsl:if  test="priority">
                                        <td  align="right" data-row="{position()}" data-title="{../../fields/priority/label}" class="number">
                                          <span class="">
                                            <xsl:value-of select="priority"/>
                                          </span>
                                        </td>
                                      </xsl:if>
                                      <xsl:if  test="tarefa">
                                        <td  align="left" data-row="{position()}" data-title="{../../fields/tarefa/label}" class="text">
                                          <span class="">
                                            <xsl:value-of select="tarefa"/>
                                          </span>
                                        </td>
                                      </xsl:if>
                                      <xsl:if  test="categoria_processo">
                                        <td  align="left" data-row="{position()}" data-title="{../../fields/categoria_processo/label}" class="text">
                                          <span class="">
                                            <xsl:value-of select="categoria_processo"/>
                                          </span>
                                        </td>
                                      </xsl:if>
                                      <xsl:if  test="dt__entrada">
                                        <td  align="center" data-row="{position()}" data-title="{../../fields/dt__entrada/label}" class="date">
                                          <span class="">
                                            <xsl:value-of select="dt__entrada"/>
                                          </span>
                                        </td>
                                      </xsl:if>
                                      <xsl:if  test="marcar">
                                        <td  align="" data-row="{position()}" data-title="{../../label/marcar}" class="bs-checkbox">
                                          <xsl:if test="marcar != '-0'">
                                            <input type="checkbox" name="p_marcar" value="{marcar}" check-rel="marcar">
                                              <xsl:if test="marcar_check=marcar">
                                                <xsl:attribute name="checked">checked
                                                </xsl:attribute>
                                              </xsl:if>
                                            </input>
                                          </xsl:if>
                                        </td>
                                      </xsl:if>
                                    </tr>
                                  </xsl:for-each>
                                </tbody>
                              </table>
                            </div>
                            <xsl:apply-templates select="rows/content/gen_table/table/context-menu" mode="table-context-menu"/>
                          </div>
                        </xsl:if>
                      </div>
                    </div>
                    <div class="gen-column col-md-4">
                      <div class="gen-inner">
                        <xsl:if  test="rows/content/paragraph_1">
                          <div  class="gen-container-item " item-name="paragraph_1">
                            <div class="box-body">
                              <p>
                                <xsl:value-of disable-output-escaping="yes" select="rows/content/paragraph_1/fields/text/value"/>
                              </p>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if  test="rows/content/tarefas_por_executar">
                          <div  class="box gen-container-item " gen-structure="graphic" item-name="tarefas_por_executar">
                            <xsl:call-template name="box-header">
                              <xsl:with-param name="title" select="rows/content/tarefas_por_executar/@title"/>
                              <xsl:with-param name="collapsible" select="'true'"/>
                            </xsl:call-template>
                            <div class="box-body">
                              <xsl:call-template name="igrp-graph">
                                <xsl:with-param name="table" select="rows/content/tarefas_por_executar"/>
                                <xsl:with-param name="chart_type" select="'piechart'"/>
                                <xsl:with-param name="height" select="'250'"/>
                                <xsl:with-param name="title" select="'Tarefas por executar'"/>
                                <xsl:with-param name="url" select="rows/content/tarefas_por_executar/url"/>
                              </xsl:call-template>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if  test="rows/content/tarefas_por_prioridade">
                          <div  class="box gen-container-item " gen-structure="graphic" item-name="tarefas_por_prioridade">
                            <xsl:call-template name="box-header">
                              <xsl:with-param name="title" select="rows/content/tarefas_por_prioridade/@title"/>
                              <xsl:with-param name="collapsible" select="'true'"/>
                            </xsl:call-template>
                            <div class="box-body">
                              <xsl:call-template name="igrp-graph">
                                <xsl:with-param name="table" select="rows/content/tarefas_por_prioridade"/>
                                <xsl:with-param name="chart_type" select="'columnchart'"/>
                                <xsl:with-param name="height" select="'250'"/>
                                <xsl:with-param name="title" select="'Tarefas por prioridade'"/>
                                <xsl:with-param name="url" select="rows/content/tarefas_por_prioridade/url"/>
                              </xsl:call-template>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if  test="rows/content/tarefas_disponiveis">
                          <div  class="box gen-container-item " gen-structure="graphic" item-name="tarefas_disponiveis">
                            <xsl:call-template name="box-header">
                              <xsl:with-param name="title" select="rows/content/tarefas_disponiveis/@title"/>
                              <xsl:with-param name="collapsible" select="'true'"/>
                            </xsl:call-template>
                            <div class="box-body">
                              <xsl:call-template name="igrp-graph">
                                <xsl:with-param name="table" select="rows/content/tarefas_disponiveis"/>
                                <xsl:with-param name="chart_type" select="'columnchart'"/>
                                <xsl:with-param name="height" select="'250'"/>
                                <xsl:with-param name="title" select="'Tarefas Disponiveis'"/>
                                <xsl:with-param name="url" select="rows/content/tarefas_disponiveis/url"/>
                              </xsl:call-template>
                            </div>
                          </div>
                        </xsl:if>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <xsl:call-template name="IGRP-bottom"/>
        </form>
        <!-- FORM JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/form/includes/igrp.forms.js">
        </script>
        <!-- TABLE JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/table/includes/jquery.dataTables.min.js">
        </script>
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/table/includes/dataTables.bootstrap.min.js">
        </script>
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/table/includes/bootstrap-contextmenu.js">
        </script>
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/table/includes/table.contextmenu.js">
        </script>
        <!-- CHART JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/chart/includes/highcharts/highcharts.js">
        </script>
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/chart/includes/highcharts/highcharts-more.js">
        </script>
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/chart/includes/highcharts/exporting.js">
        </script>
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/chart/includes/igrp.charts.js">
        </script>
        <!-- SELECT JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/select/includes/select2/select2.full.min.js">
        </script>
        <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/select/includes/select2.init.js">
        </script>
        <!-- DATE JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/date/includes/dateTimePicker/js/datetimepicker.js">
        </script>
        <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/date/includes/dateTimePicker/js/dtp.init.js">
        </script>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1475756689839"/>
  <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1475756689839"/>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1475756689839"/>
  <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1475756689839"/>
  <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1475756689839"/>
  <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1475756689839"/>
  <xsl:include href="../../xsl/tmpl/IGRP-charts.tmpl.xsl?v=1475756689839"/>
</xsl:stylesheet>
