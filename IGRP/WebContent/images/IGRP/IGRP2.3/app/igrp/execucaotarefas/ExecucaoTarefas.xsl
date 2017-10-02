<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- TABCONTENT CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/tabs/igrp.tabs.css?v={$version}"/>
                <!-- VIEW CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/view/igrp.view.css?v={$version}"/>
                <!-- TABLE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css?v={$version}"/>
                <!-- SELECT CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.min.css?v={$version}"/>
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.style.css?v={$version}"/>
                <!-- DATE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/datetimepicker/css/datetimepicker.css?v={$version}"/>
                <style/>
            </head>
            <body class="{$bodyClass} sidebar-off">
                <xsl:call-template name="IGRP-topmenu"/>
                <form method="POST" class="IGRP-form" name="formular_default" enctype="multipart/form-data">
                    <div class="container-fluid">
                        <div class="row">
                            <xsl:call-template name="IGRP-sidebar"/>
                            <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
                                <div class="content">
                                    <div class="row" id="row-bb2f2f6f">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/sectionheader_1">
                                                    <section class="content-header gen-container-item " gen-class="" item-name="sectionheader_1">
                                                        <h2>
                                                            <xsl:value-of select="rows/content/sectionheader_1/fields/sectionheader_1_text/value"/>
                                                        </h2>
                                                    </section>
                                                </xsl:if>
                                                <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                                                <div class="gen-tab-holder nav-tabs-custom    gen-container-item " tab-template="default" gen-class="" item-name="tabcontent_1">
                                                    <ul class="nav nav-tabs">
                                                        <xsl:if test="rows/content/tabcontent_1/fields/gerir_tarefas">
                                                            <li item-name="gerir_tarefas" class="active gen-fields-holder" rel="tab-tabcontent_1-gerir_tarefas">
                                                                <xsl:call-template name="get-active-tab">
                                                                    <xsl:with-param name="value" select="rows/content/tabcontent_1/fields/gerir_tarefas/value"/>
                                                                </xsl:call-template>
                                                                <a data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_1-gerir_tarefas">
                                                                    <i class="fa fa-tasks"/>
                                                                    <span>
                                                                        <xsl:value-of select="rows/content/tabcontent_1/fields/gerir_tarefas/label"/>
                                                                    </span>
                                                                </a>
                                                            </li>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/colaboradores">
                                                            <li item-name="colaboradores" class=" gen-fields-holder" rel="tab-tabcontent_1-colaboradores">
                                                                <xsl:call-template name="get-active-tab">
                                                                    <xsl:with-param name="value" select="rows/content/tabcontent_1/fields/colaboradores/value"/>
                                                                </xsl:call-template>
                                                                <a data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_1-colaboradores">
                                                                    <i class="fa fa-users"/>
                                                                    <span>
                                                                        <xsl:value-of select="rows/content/tabcontent_1/fields/colaboradores/label"/>
                                                                    </span>
                                                                </a>
                                                            </li>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/estatistica">
                                                            <li item-name="estatistica" class=" gen-fields-holder" rel="tab-tabcontent_1-estatistica">
                                                                <xsl:call-template name="get-active-tab">
                                                                    <xsl:with-param name="value" select="rows/content/tabcontent_1/fields/estatistica/value"/>
                                                                </xsl:call-template>
                                                                <a data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_1-estatistica">
                                                                    <i class="fa fa-line-chart"/>
                                                                    <span>
                                                                        <xsl:value-of select="rows/content/tabcontent_1/fields/estatistica/label"/>
                                                                    </span>
                                                                </a>
                                                            </li>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/minhas_tarefas">
                                                            <li item-name="minhas_tarefas" class=" gen-fields-holder" rel="tab-tabcontent_1-minhas_tarefas">
                                                                <xsl:call-template name="get-active-tab">
                                                                    <xsl:with-param name="value" select="rows/content/tabcontent_1/fields/minhas_tarefas/value"/>
                                                                </xsl:call-template>
                                                                <a data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_1-minhas_tarefas">
                                                                    <i class="fa fa-address-book-o"/>
                                                                    <span>
                                                                        <xsl:value-of select="rows/content/tabcontent_1/fields/minhas_tarefas/label"/>
                                                                    </span>
                                                                </a>
                                                            </li>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/disponiveis">
                                                            <li item-name="disponiveis" class=" gen-fields-holder" rel="tab-tabcontent_1-disponiveis">
                                                                <xsl:call-template name="get-active-tab">
                                                                    <xsl:with-param name="value" select="rows/content/tabcontent_1/fields/disponiveis/value"/>
                                                                </xsl:call-template>
                                                                <a data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_1-disponiveis">
                                                                    <i class="fa fa-calendar-check-o"/>
                                                                    <span>
                                                                        <xsl:value-of select="rows/content/tabcontent_1/fields/disponiveis/label"/>
                                                                    </span>
                                                                </a>
                                                            </li>
                                                        </xsl:if>
                                                    </ul>
                                                    <div class="tab-content">
                                                        <xsl:if test="rows/content/tabcontent_1/fields/gerir_tarefas">
                                                            <div class="tab-pane gen-rows-holder active" id="tab-tabcontent_1-gerir_tarefas" rel="tab-tabcontent_1-gerir_tarefas">
                                                                <xsl:call-template name="get-active-tab">
                                                                    <xsl:with-param name="value" select="rows/content/tabcontent_1/fields/gerir_tarefas/value"/>
                                                                    <xsl:with-param name="class" select="'tab-pane'"/>
                                                                </xsl:call-template>
                                                                <div class="row" id="row-d2728b6e">
                                                                    <div class="gen-column col-sm-12">
                                                                        <div class="gen-inner">
                                                                            <xsl:if test="rows/content/form_gerir_tarefa">
                                                                                <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_gerir_tarefa">
                                                                                    <div class="box-body">
                                                                                        <div role="form">
                                                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_gerir_tarefa/fields"/>
                                                                                            <xsl:if test="rows/content/form_gerir_tarefa/fields/organica_gerir_tarefa">
                                                                                                <div class="col-sm-3 form-group  gen-fields-holder" item-name="organica_gerir_tarefa" item-type="select">
                                                                                                    <label for="{rows/content/form_gerir_tarefa/fields/organica_gerir_tarefa/@name}">
                                                                                                        <xsl:value-of select="rows/content/form_gerir_tarefa/fields/organica_gerir_tarefa/label"/>
                                                                                                    </label>
                                                                                                    <select class="form-control select2 " id="form_gerir_tarefa_organica_gerir_tarefa" name="{rows/content/form_gerir_tarefa/fields/organica_gerir_tarefa/@name}">
                                                                                                        <xsl:call-template name="setAttributes">
                                                                                                            <xsl:with-param name="field" select="rows/content/form_gerir_tarefa/fields/organica_gerir_tarefa"/>
                                                                                                        </xsl:call-template>
                                                                                                        <xsl:for-each select="rows/content/form_gerir_tarefa/fields/organica_gerir_tarefa/list/option">
                                                                                                            <option value="{value}" label="{text}">
                                                                                                                <xsl:if test="@selected='true'">
                                                                                                                    <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                                                </xsl:if>
                                                                                                                <span>
                                                                                                                    <xsl:value-of select="text"/>
                                                                                                                </span>
                                                                                                            </option>
                                                                                                        </xsl:for-each>
                                                                                                    </select>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_gerir_tarefa/fields/numero_processo_gerir_tarefa">
                                                                                                <div class="form-group col-sm-3   gen-fields-holder" item-name="numero_processo_gerir_tarefa" item-type="text">
                                                                                                    <label for="{rows/content/form_gerir_tarefa/fields/numero_processo_gerir_tarefa/@name}">
                                                                                                        <span>
                                                                                                            <xsl:value-of select="rows/content/form_gerir_tarefa/fields/numero_processo_gerir_tarefa/label"/>
                                                                                                        </span>
                                                                                                    </label>
                                                                                                    <input type="text" value="{rows/content/form_gerir_tarefa/fields/numero_processo_gerir_tarefa/value}" class="form-control " id="{rows/content/form_gerir_tarefa/fields/numero_processo_gerir_tarefa/@name}" name="{rows/content/form_gerir_tarefa/fields/numero_processo_gerir_tarefa/@name}" maxlength="30" placeholder="">
                                                                                                        <xsl:call-template name="setAttributes">
                                                                                                            <xsl:with-param name="field" select="rows/content/form_gerir_tarefa/fields/numero_processo_gerir_tarefa"/>
                                                                                                        </xsl:call-template>
                                                                                                    </input>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_gerir_tarefa/fields/tipo_processo_gerir_tarefa">
                                                                                                <div class="col-sm-3 form-group  gen-fields-holder" item-name="tipo_processo_gerir_tarefa" item-type="select">
                                                                                                    <label for="{rows/content/form_gerir_tarefa/fields/tipo_processo_gerir_tarefa/@name}">
                                                                                                        <xsl:value-of select="rows/content/form_gerir_tarefa/fields/tipo_processo_gerir_tarefa/label"/>
                                                                                                    </label>
                                                                                                    <select class="form-control select2 " id="form_gerir_tarefa_tipo_processo_gerir_tarefa" name="{rows/content/form_gerir_tarefa/fields/tipo_processo_gerir_tarefa/@name}">
                                                                                                        <xsl:call-template name="setAttributes">
                                                                                                            <xsl:with-param name="field" select="rows/content/form_gerir_tarefa/fields/tipo_processo_gerir_tarefa"/>
                                                                                                        </xsl:call-template>
                                                                                                        <xsl:for-each select="rows/content/form_gerir_tarefa/fields/tipo_processo_gerir_tarefa/list/option">
                                                                                                            <option value="{value}" label="{text}">
                                                                                                                <xsl:if test="@selected='true'">
                                                                                                                    <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                                                </xsl:if>
                                                                                                                <span>
                                                                                                                    <xsl:value-of select="text"/>
                                                                                                                </span>
                                                                                                            </option>
                                                                                                        </xsl:for-each>
                                                                                                    </select>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_gerir_tarefa/fields/data_inicio_gerir_tarefa">
                                                                                                <div class="form-group col-sm-3  gen-fields-holder" item-name="data_inicio_gerir_tarefa" item-type="date">
                                                                                                    <label for="{rows/content/form_gerir_tarefa/fields/data_inicio_gerir_tarefa/@name}">
                                                                                                        <span>
                                                                                                            <xsl:value-of select="rows/content/form_gerir_tarefa/fields/data_inicio_gerir_tarefa/label"/>
                                                                                                        </span>
                                                                                                    </label>
                                                                                                    <div class="input-group">
                                                                                                        <input type="text" value="{rows/content/form_gerir_tarefa/fields/data_inicio_gerir_tarefa/value}" class="form-control gen-date " id="form_gerir_tarefa-data_inicio_gerir_tarefa" name="{rows/content/form_gerir_tarefa/fields/data_inicio_gerir_tarefa/@name}" format="IGRP_datePicker" maxlength="30">
                                                                                                            <xsl:call-template name="setAttributes">
                                                                                                                <xsl:with-param name="field" select="rows/content/form_gerir_tarefa/fields/data_inicio_gerir_tarefa"/>
                                                                                                            </xsl:call-template>
                                                                                                        </input>
                                                                                                        <span class="input-group-btn gen-date-icon">
                                                                                                            <span class="btn btn-default">
                                                                                                                <i class="fa fa-calendar"/>
                                                                                                            </span>
                                                                                                        </span>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_gerir_tarefa/fields/data_fim_gerir_tarefa">
                                                                                                <div class="form-group col-sm-3  gen-fields-holder" item-name="data_fim_gerir_tarefa" item-type="date">
                                                                                                    <label for="{rows/content/form_gerir_tarefa/fields/data_fim_gerir_tarefa/@name}">
                                                                                                        <span>
                                                                                                            <xsl:value-of select="rows/content/form_gerir_tarefa/fields/data_fim_gerir_tarefa/label"/>
                                                                                                        </span>
                                                                                                    </label>
                                                                                                    <div class="input-group">
                                                                                                        <input type="text" value="{rows/content/form_gerir_tarefa/fields/data_fim_gerir_tarefa/value}" class="form-control gen-date " id="form_gerir_tarefa-data_fim_gerir_tarefa" name="{rows/content/form_gerir_tarefa/fields/data_fim_gerir_tarefa/@name}" format="IGRP_datePicker" maxlength="30">
                                                                                                            <xsl:call-template name="setAttributes">
                                                                                                                <xsl:with-param name="field" select="rows/content/form_gerir_tarefa/fields/data_fim_gerir_tarefa"/>
                                                                                                            </xsl:call-template>
                                                                                                        </input>
                                                                                                        <span class="input-group-btn gen-date-icon">
                                                                                                            <span class="btn btn-default">
                                                                                                                <i class="fa fa-calendar"/>
                                                                                                            </span>
                                                                                                        </span>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_gerir_tarefa/fields/prioridade_gerir_tarefa">
                                                                                                <div class="col-sm-3 form-group  gen-fields-holder" item-name="prioridade_gerir_tarefa" item-type="select">
                                                                                                    <label for="{rows/content/form_gerir_tarefa/fields/prioridade_gerir_tarefa/@name}">
                                                                                                        <xsl:value-of select="rows/content/form_gerir_tarefa/fields/prioridade_gerir_tarefa/label"/>
                                                                                                    </label>
                                                                                                    <select class="form-control select2 " id="form_gerir_tarefa_prioridade_gerir_tarefa" name="{rows/content/form_gerir_tarefa/fields/prioridade_gerir_tarefa/@name}">
                                                                                                        <xsl:call-template name="setAttributes">
                                                                                                            <xsl:with-param name="field" select="rows/content/form_gerir_tarefa/fields/prioridade_gerir_tarefa"/>
                                                                                                        </xsl:call-template>
                                                                                                        <xsl:for-each select="rows/content/form_gerir_tarefa/fields/prioridade_gerir_tarefa/list/option">
                                                                                                            <option value="{value}" label="{text}">
                                                                                                                <xsl:if test="@selected='true'">
                                                                                                                    <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                                                </xsl:if>
                                                                                                                <span>
                                                                                                                    <xsl:value-of select="text"/>
                                                                                                                </span>
                                                                                                            </option>
                                                                                                        </xsl:for-each>
                                                                                                    </select>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_gerir_tarefa/fields/pesquisa_gerir_tarefa">
                                                                                                <div class="form-group col-sm-3   gen-fields-holder" item-name="pesquisa_gerir_tarefa" item-type="text">
                                                                                                    <label for="{rows/content/form_gerir_tarefa/fields/pesquisa_gerir_tarefa/@name}">
                                                                                                        <span>
                                                                                                            <xsl:value-of select="rows/content/form_gerir_tarefa/fields/pesquisa_gerir_tarefa/label"/>
                                                                                                        </span>
                                                                                                    </label>
                                                                                                    <input type="text" value="{rows/content/form_gerir_tarefa/fields/pesquisa_gerir_tarefa/value}" class="form-control " id="{rows/content/form_gerir_tarefa/fields/pesquisa_gerir_tarefa/@name}" name="{rows/content/form_gerir_tarefa/fields/pesquisa_gerir_tarefa/@name}" maxlength="30" placeholder="">
                                                                                                        <xsl:call-template name="setAttributes">
                                                                                                            <xsl:with-param name="field" select="rows/content/form_gerir_tarefa/fields/pesquisa_gerir_tarefa"/>
                                                                                                        </xsl:call-template>
                                                                                                    </input>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                        </div>
                                                                                    </div>
                                                                                    <xsl:apply-templates select="rows/content/form_gerir_tarefa/tools-bar" mode="form-buttons"/>
                                                                                </div>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/table_gerir_tarefas">
                                                                                <div class="box box-table-contents gen-container-item " gen-class="" item-name="table_gerir_tarefas">
                                                                                    <div class="box-body table-box">
                                                                                        <xsl:apply-templates mode="form-hidden-fields" select="rows/content/table_gerir_tarefas/fields"/>
                                                                                        <table id="table_gerir_tarefas" class="table table-striped gen-data-table IGRP_contextmenu " exports="null">
                                                                                            <thead>
                                                                                                <tr>
                                                                                                    <xsl:if test="rows/content/table_gerir_tarefas/fields/numero_processo_tabela">
                                                                                                        <th align="left" class=" gen-fields-holder">
                                                                                                            <span>
                                                                                                                <xsl:value-of select="rows/content/table_gerir_tarefas/fields/numero_processo_tabela/label"/>
                                                                                                            </span>
                                                                                                        </th>
                                                                                                    </xsl:if>
                                                                                                    <xsl:if test="rows/content/table_gerir_tarefas/fields/tipo">
                                                                                                        <th align="left" class=" gen-fields-holder">
                                                                                                            <span>
                                                                                                                <xsl:value-of select="rows/content/table_gerir_tarefas/fields/tipo/label"/>
                                                                                                            </span>
                                                                                                        </th>
                                                                                                    </xsl:if>
                                                                                                    <xsl:if test="rows/content/table_gerir_tarefas/fields/desc_tarefa">
                                                                                                        <th align="left" class=" gen-fields-holder">
                                                                                                            <span>
                                                                                                                <xsl:value-of select="rows/content/table_gerir_tarefas/fields/desc_tarefa/label"/>
                                                                                                            </span>
                                                                                                        </th>
                                                                                                    </xsl:if>
                                                                                                    <xsl:if test="rows/content/table_gerir_tarefas/fields/atribuido_por">
                                                                                                        <th align="left" class=" gen-fields-holder">
                                                                                                            <span>
                                                                                                                <xsl:value-of select="rows/content/table_gerir_tarefas/fields/atribuido_por/label"/>
                                                                                                            </span>
                                                                                                        </th>
                                                                                                    </xsl:if>
                                                                                                    <xsl:if test="rows/content/table_gerir_tarefas/fields/atribuido_a">
                                                                                                        <th align="left" class=" gen-fields-holder">
                                                                                                            <span>
                                                                                                                <xsl:value-of select="rows/content/table_gerir_tarefas/fields/atribuido_a/label"/>
                                                                                                            </span>
                                                                                                        </th>
                                                                                                    </xsl:if>
                                                                                                    <xsl:if test="rows/content/table_gerir_tarefas/fields/data_entrada">
                                                                                                        <th align="left" class=" gen-fields-holder">
                                                                                                            <span>
                                                                                                                <xsl:value-of select="rows/content/table_gerir_tarefas/fields/data_entrada/label"/>
                                                                                                            </span>
                                                                                                        </th>
                                                                                                    </xsl:if>
                                                                                                </tr>
                                                                                            </thead>
                                                                                            <tbody>
                                                                                                <xsl:for-each select="rows/content/table_gerir_tarefas/table/value/row[not(@total='yes')]">
                                                                                                    <tr>
                                                                                                        <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                                                                        <xsl:if test="numero_processo_tabela">
                                                                                                            <td align="left" data-row="{position()}" data-title="{../../fields/numero_processo_tabela/label}" class="text" item-name="numero_processo_tabela">
                                                                                                                <span class="">
                                                                                                                    <xsl:value-of select="numero_processo_tabela"/>
                                                                                                                </span>
                                                                                                            </td>
                                                                                                        </xsl:if>
                                                                                                        <xsl:if test="tipo">
                                                                                                            <td align="left" data-row="{position()}" data-title="{../../fields/tipo/label}" class="text" item-name="tipo">
                                                                                                                <span class="">
                                                                                                                    <xsl:value-of select="tipo"/>
                                                                                                                </span>
                                                                                                            </td>
                                                                                                        </xsl:if>
                                                                                                        <xsl:if test="desc_tarefa">
                                                                                                            <td align="left" data-row="{position()}" data-title="{../../fields/desc_tarefa/label}" class="text" item-name="desc_tarefa">
                                                                                                                <span class="">
                                                                                                                    <xsl:value-of select="desc_tarefa"/>
                                                                                                                </span>
                                                                                                            </td>
                                                                                                        </xsl:if>
                                                                                                        <xsl:if test="atribuido_por">
                                                                                                            <td align="left" data-row="{position()}" data-title="{../../fields/atribuido_por/label}" class="text" item-name="atribuido_por">
                                                                                                                <span class="">
                                                                                                                    <xsl:value-of select="atribuido_por"/>
                                                                                                                </span>
                                                                                                            </td>
                                                                                                        </xsl:if>
                                                                                                        <xsl:if test="atribuido_a">
                                                                                                            <td align="left" data-row="{position()}" data-title="{../../fields/atribuido_a/label}" class="text" item-name="atribuido_a">
                                                                                                                <span class="">
                                                                                                                    <xsl:value-of select="atribuido_a"/>
                                                                                                                </span>
                                                                                                            </td>
                                                                                                        </xsl:if>
                                                                                                        <xsl:if test="data_entrada">
                                                                                                            <td align="left" data-row="{position()}" data-title="{../../fields/data_entrada/label}" class="text" item-name="data_entrada">
                                                                                                                <span class="">
                                                                                                                    <xsl:value-of select="data_entrada"/>
                                                                                                                </span>
                                                                                                            </td>
                                                                                                        </xsl:if>
                                                                                                    </tr>
                                                                                                </xsl:for-each>
                                                                                            </tbody>
                                                                                        </table>
                                                                                    </div>
                                                                                    <xsl:apply-templates select="rows/content/table_gerir_tarefas/table/context-menu" mode="table-context-menu"/>
                                                                                </div>
                                                                            </xsl:if>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/colaboradores">
                                                            <div class="tab-pane gen-rows-holder " id="tab-tabcontent_1-colaboradores" rel="tab-tabcontent_1-colaboradores">
                                                                <xsl:call-template name="get-active-tab">
                                                                    <xsl:with-param name="value" select="rows/content/tabcontent_1/fields/colaboradores/value"/>
                                                                    <xsl:with-param name="class" select="'tab-pane'"/>
                                                                </xsl:call-template>
                                                                <div class="row" id="row-ba23fd89">
                                                                    <div class="gen-column col-sm-12">
                                                                        <div class="gen-inner">
                                                                            <xsl:if test="rows/content/form_colaboradores">
                                                                                <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_colaboradores">
                                                                                    <div class="box-body">
                                                                                        <div role="form">
                                                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_colaboradores/fields"/>
                                                                                            <xsl:if test="rows/content/form_colaboradores/fields/organica_colaborador">
                                                                                                <div class="col-sm-3 form-group  gen-fields-holder" item-name="organica_colaborador" item-type="select">
                                                                                                    <label for="{rows/content/form_colaboradores/fields/organica_colaborador/@name}">
                                                                                                        <xsl:value-of select="rows/content/form_colaboradores/fields/organica_colaborador/label"/>
                                                                                                    </label>
                                                                                                    <select class="form-control select2 " id="form_colaboradores_organica_colaborador" name="{rows/content/form_colaboradores/fields/organica_colaborador/@name}">
                                                                                                        <xsl:call-template name="setAttributes">
                                                                                                            <xsl:with-param name="field" select="rows/content/form_colaboradores/fields/organica_colaborador"/>
                                                                                                        </xsl:call-template>
                                                                                                        <xsl:for-each select="rows/content/form_colaboradores/fields/organica_colaborador/list/option">
                                                                                                            <option value="{value}" label="{text}">
                                                                                                                <xsl:if test="@selected='true'">
                                                                                                                    <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                                                </xsl:if>
                                                                                                                <span>
                                                                                                                    <xsl:value-of select="text"/>
                                                                                                                </span>
                                                                                                            </option>
                                                                                                        </xsl:for-each>
                                                                                                    </select>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_colaboradores/fields/numero_processo_colaborador">
                                                                                                <div class="form-group col-sm-3   gen-fields-holder" item-name="numero_processo_colaborador" item-type="text">
                                                                                                    <label for="{rows/content/form_colaboradores/fields/numero_processo_colaborador/@name}">
                                                                                                        <span>
                                                                                                            <xsl:value-of select="rows/content/form_colaboradores/fields/numero_processo_colaborador/label"/>
                                                                                                        </span>
                                                                                                    </label>
                                                                                                    <input type="text" value="{rows/content/form_colaboradores/fields/numero_processo_colaborador/value}" class="form-control " id="{rows/content/form_colaboradores/fields/numero_processo_colaborador/@name}" name="{rows/content/form_colaboradores/fields/numero_processo_colaborador/@name}" maxlength="30" placeholder="">
                                                                                                        <xsl:call-template name="setAttributes">
                                                                                                            <xsl:with-param name="field" select="rows/content/form_colaboradores/fields/numero_processo_colaborador"/>
                                                                                                        </xsl:call-template>
                                                                                                    </input>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_colaboradores/fields/tipo_processo_colaborador">
                                                                                                <div class="col-sm-3 form-group  gen-fields-holder" item-name="tipo_processo_colaborador" item-type="select">
                                                                                                    <label for="{rows/content/form_colaboradores/fields/tipo_processo_colaborador/@name}">
                                                                                                        <xsl:value-of select="rows/content/form_colaboradores/fields/tipo_processo_colaborador/label"/>
                                                                                                    </label>
                                                                                                    <select class="form-control select2 " id="form_colaboradores_tipo_processo_colaborador" name="{rows/content/form_colaboradores/fields/tipo_processo_colaborador/@name}">
                                                                                                        <xsl:call-template name="setAttributes">
                                                                                                            <xsl:with-param name="field" select="rows/content/form_colaboradores/fields/tipo_processo_colaborador"/>
                                                                                                        </xsl:call-template>
                                                                                                        <xsl:for-each select="rows/content/form_colaboradores/fields/tipo_processo_colaborador/list/option">
                                                                                                            <option value="{value}" label="{text}">
                                                                                                                <xsl:if test="@selected='true'">
                                                                                                                    <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                                                </xsl:if>
                                                                                                                <span>
                                                                                                                    <xsl:value-of select="text"/>
                                                                                                                </span>
                                                                                                            </option>
                                                                                                        </xsl:for-each>
                                                                                                    </select>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_colaboradores/fields/tipo_etapa_colaborador">
                                                                                                <div class="col-sm-3 form-group  gen-fields-holder" item-name="tipo_etapa_colaborador" item-type="select">
                                                                                                    <label for="{rows/content/form_colaboradores/fields/tipo_etapa_colaborador/@name}">
                                                                                                        <xsl:value-of select="rows/content/form_colaboradores/fields/tipo_etapa_colaborador/label"/>
                                                                                                    </label>
                                                                                                    <select class="form-control select2 " id="form_colaboradores_tipo_etapa_colaborador" name="{rows/content/form_colaboradores/fields/tipo_etapa_colaborador/@name}">
                                                                                                        <xsl:call-template name="setAttributes">
                                                                                                            <xsl:with-param name="field" select="rows/content/form_colaboradores/fields/tipo_etapa_colaborador"/>
                                                                                                        </xsl:call-template>
                                                                                                        <xsl:for-each select="rows/content/form_colaboradores/fields/tipo_etapa_colaborador/list/option">
                                                                                                            <option value="{value}" label="{text}">
                                                                                                                <xsl:if test="@selected='true'">
                                                                                                                    <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                                                </xsl:if>
                                                                                                                <span>
                                                                                                                    <xsl:value-of select="text"/>
                                                                                                                </span>
                                                                                                            </option>
                                                                                                        </xsl:for-each>
                                                                                                    </select>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_colaboradores/fields/data_inicio_colaborador">
                                                                                                <div class="form-group col-sm-3  gen-fields-holder" item-name="data_inicio_colaborador" item-type="date">
                                                                                                    <label for="{rows/content/form_colaboradores/fields/data_inicio_colaborador/@name}">
                                                                                                        <span>
                                                                                                            <xsl:value-of select="rows/content/form_colaboradores/fields/data_inicio_colaborador/label"/>
                                                                                                        </span>
                                                                                                    </label>
                                                                                                    <div class="input-group">
                                                                                                        <input type="text" value="{rows/content/form_colaboradores/fields/data_inicio_colaborador/value}" class="form-control gen-date " id="form_colaboradores-data_inicio_colaborador" name="{rows/content/form_colaboradores/fields/data_inicio_colaborador/@name}" format="IGRP_datePicker" maxlength="30">
                                                                                                            <xsl:call-template name="setAttributes">
                                                                                                                <xsl:with-param name="field" select="rows/content/form_colaboradores/fields/data_inicio_colaborador"/>
                                                                                                            </xsl:call-template>
                                                                                                        </input>
                                                                                                        <span class="input-group-btn gen-date-icon">
                                                                                                            <span class="btn btn-default">
                                                                                                                <i class="fa fa-calendar"/>
                                                                                                            </span>
                                                                                                        </span>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_colaboradores/fields/data_fim_colaborador">
                                                                                                <div class="form-group col-sm-3  gen-fields-holder" item-name="data_fim_colaborador" item-type="date">
                                                                                                    <label for="{rows/content/form_colaboradores/fields/data_fim_colaborador/@name}">
                                                                                                        <span>
                                                                                                            <xsl:value-of select="rows/content/form_colaboradores/fields/data_fim_colaborador/label"/>
                                                                                                        </span>
                                                                                                    </label>
                                                                                                    <div class="input-group">
                                                                                                        <input type="text" value="{rows/content/form_colaboradores/fields/data_fim_colaborador/value}" class="form-control gen-date " id="form_colaboradores-data_fim_colaborador" name="{rows/content/form_colaboradores/fields/data_fim_colaborador/@name}" format="IGRP_datePicker" maxlength="30">
                                                                                                            <xsl:call-template name="setAttributes">
                                                                                                                <xsl:with-param name="field" select="rows/content/form_colaboradores/fields/data_fim_colaborador"/>
                                                                                                            </xsl:call-template>
                                                                                                        </input>
                                                                                                        <span class="input-group-btn gen-date-icon">
                                                                                                            <span class="btn btn-default">
                                                                                                                <i class="fa fa-calendar"/>
                                                                                                            </span>
                                                                                                        </span>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_colaboradores/fields/prioridade_colaborador">
                                                                                                <div class="col-sm-3 form-group  gen-fields-holder" item-name="prioridade_colaborador" item-type="select">
                                                                                                    <label for="{rows/content/form_colaboradores/fields/prioridade_colaborador/@name}">
                                                                                                        <xsl:value-of select="rows/content/form_colaboradores/fields/prioridade_colaborador/label"/>
                                                                                                    </label>
                                                                                                    <select class="form-control select2 " id="form_colaboradores_prioridade_colaborador" name="{rows/content/form_colaboradores/fields/prioridade_colaborador/@name}">
                                                                                                        <xsl:call-template name="setAttributes">
                                                                                                            <xsl:with-param name="field" select="rows/content/form_colaboradores/fields/prioridade_colaborador"/>
                                                                                                        </xsl:call-template>
                                                                                                        <xsl:for-each select="rows/content/form_colaboradores/fields/prioridade_colaborador/list/option">
                                                                                                            <option value="{value}" label="{text}">
                                                                                                                <xsl:if test="@selected='true'">
                                                                                                                    <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                                                </xsl:if>
                                                                                                                <span>
                                                                                                                    <xsl:value-of select="text"/>
                                                                                                                </span>
                                                                                                            </option>
                                                                                                        </xsl:for-each>
                                                                                                    </select>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                        </div>
                                                                                    </div>
                                                                                    <xsl:apply-templates select="rows/content/form_colaboradores/tools-bar" mode="form-buttons"/>
                                                                                </div>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/table__colaboradores">
                                                                                <div class="box box-table-contents gen-container-item " gen-class="" item-name="table__colaboradores">
                                                                                    <div class="box-body table-box">
                                                                                        <xsl:apply-templates mode="form-hidden-fields" select="rows/content/table__colaboradores/fields"/>
                                                                                        <table id="table__colaboradores" class="table table-striped gen-data-table IGRP_contextmenu " exports="null">
                                                                                            <thead>
                                                                                                <tr>
                                                                                                    <xsl:if test="rows/content/table__colaboradores/fields/nome_colab_tabela">
                                                                                                        <th align="left" class=" gen-fields-holder">
                                                                                                            <span>
                                                                                                                <xsl:value-of select="rows/content/table__colaboradores/fields/nome_colab_tabela/label"/>
                                                                                                            </span>
                                                                                                        </th>
                                                                                                    </xsl:if>
                                                                                                    <xsl:if test="rows/content/table__colaboradores/fields/contacto_colab_tabela">
                                                                                                        <th align="left" class=" gen-fields-holder">
                                                                                                            <span>
                                                                                                                <xsl:value-of select="rows/content/table__colaboradores/fields/contacto_colab_tabela/label"/>
                                                                                                            </span>
                                                                                                        </th>
                                                                                                    </xsl:if>
                                                                                                    <xsl:if test="rows/content/table__colaboradores/fields/n_tarefas_colab_tabela">
                                                                                                        <th align="left" class=" gen-fields-holder">
                                                                                                            <span>
                                                                                                                <xsl:value-of select="rows/content/table__colaboradores/fields/n_tarefas_colab_tabela/label"/>
                                                                                                            </span>
                                                                                                        </th>
                                                                                                    </xsl:if>
                                                                                                    <xsl:if test="rows/content/table__colaboradores/fields/n_atendimento_colab_tabela">
                                                                                                        <th align="left" class=" gen-fields-holder">
                                                                                                            <span>
                                                                                                                <xsl:value-of select="rows/content/table__colaboradores/fields/n_atendimento_colab_tabela/label"/>
                                                                                                            </span>
                                                                                                        </th>
                                                                                                    </xsl:if>
                                                                                                    <xsl:if test="rows/content/table__colaboradores/fields/media_tempo_colab_tabela">
                                                                                                        <th align="left" class=" gen-fields-holder">
                                                                                                            <span>
                                                                                                                <xsl:value-of select="rows/content/table__colaboradores/fields/media_tempo_colab_tabela/label"/>
                                                                                                            </span>
                                                                                                        </th>
                                                                                                    </xsl:if>
                                                                                                    <xsl:if test="rows/content/table__colaboradores/fields/ranking_colab_tabela">
                                                                                                        <th align="left" class=" gen-fields-holder">
                                                                                                            <span>
                                                                                                                <xsl:value-of select="rows/content/table__colaboradores/fields/ranking_colab_tabela/label"/>
                                                                                                            </span>
                                                                                                        </th>
                                                                                                    </xsl:if>
                                                                                                    <xsl:if test="rows/content/table__colaboradores/fields/percentagem_colab_tabela">
                                                                                                        <th align="left" class=" gen-fields-holder">
                                                                                                            <span>
                                                                                                                <xsl:value-of select="rows/content/table__colaboradores/fields/percentagem_colab_tabela/label"/>
                                                                                                            </span>
                                                                                                        </th>
                                                                                                    </xsl:if>
                                                                                                    <xsl:if test="rows/content/table__colaboradores/fields/foto_colab_tabela">
                                                                                                        <th align="left" class=" gen-fields-holder">
                                                                                                            <span>
                                                                                                                <xsl:value-of select="rows/content/table__colaboradores/fields/foto_colab_tabela/label"/>
                                                                                                            </span>
                                                                                                        </th>
                                                                                                    </xsl:if>
                                                                                                    <xsl:if test="rows/content/table__colaboradores/fields/param_colab_tabela">
                                                                                                        <th align="left" class=" gen-fields-holder">
                                                                                                            <span>
                                                                                                                <xsl:value-of select="rows/content/table__colaboradores/fields/param_colab_tabela/label"/>
                                                                                                            </span>
                                                                                                        </th>
                                                                                                    </xsl:if>
                                                                                                </tr>
                                                                                            </thead>
                                                                                            <tbody>
                                                                                                <xsl:for-each select="rows/content/table__colaboradores/table/value/row[not(@total='yes')]">
                                                                                                    <tr>
                                                                                                        <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                                                                        <xsl:if test="nome_colab_tabela">
                                                                                                            <td align="left" data-row="{position()}" data-title="{../../fields/nome_colab_tabela/label}" class="text" item-name="nome_colab_tabela">
                                                                                                                <span class="">
                                                                                                                    <xsl:value-of select="nome_colab_tabela"/>
                                                                                                                </span>
                                                                                                            </td>
                                                                                                        </xsl:if>
                                                                                                        <xsl:if test="contacto_colab_tabela">
                                                                                                            <td align="left" data-row="{position()}" data-title="{../../fields/contacto_colab_tabela/label}" class="text" item-name="contacto_colab_tabela">
                                                                                                                <span class="">
                                                                                                                    <xsl:value-of select="contacto_colab_tabela"/>
                                                                                                                </span>
                                                                                                            </td>
                                                                                                        </xsl:if>
                                                                                                        <xsl:if test="n_tarefas_colab_tabela">
                                                                                                            <td align="left" data-row="{position()}" data-title="{../../fields/n_tarefas_colab_tabela/label}" class="text" item-name="n_tarefas_colab_tabela">
                                                                                                                <span class="">
                                                                                                                    <xsl:value-of select="n_tarefas_colab_tabela"/>
                                                                                                                </span>
                                                                                                            </td>
                                                                                                        </xsl:if>
                                                                                                        <xsl:if test="n_atendimento_colab_tabela">
                                                                                                            <td align="left" data-row="{position()}" data-title="{../../fields/n_atendimento_colab_tabela/label}" class="text" item-name="n_atendimento_colab_tabela">
                                                                                                                <span class="">
                                                                                                                    <xsl:value-of select="n_atendimento_colab_tabela"/>
                                                                                                                </span>
                                                                                                            </td>
                                                                                                        </xsl:if>
                                                                                                        <xsl:if test="media_tempo_colab_tabela">
                                                                                                            <td align="left" data-row="{position()}" data-title="{../../fields/media_tempo_colab_tabela/label}" class="text" item-name="media_tempo_colab_tabela">
                                                                                                                <span class="">
                                                                                                                    <xsl:value-of select="media_tempo_colab_tabela"/>
                                                                                                                </span>
                                                                                                            </td>
                                                                                                        </xsl:if>
                                                                                                        <xsl:if test="ranking_colab_tabela">
                                                                                                            <td align="left" data-row="{position()}" data-title="{../../fields/ranking_colab_tabela/label}" class="text" item-name="ranking_colab_tabela">
                                                                                                                <span class="">
                                                                                                                    <xsl:value-of select="ranking_colab_tabela"/>
                                                                                                                </span>
                                                                                                            </td>
                                                                                                        </xsl:if>
                                                                                                        <xsl:if test="percentagem_colab_tabela">
                                                                                                            <td align="left" data-row="{position()}" data-title="{../../fields/percentagem_colab_tabela/label}" class="text" item-name="percentagem_colab_tabela">
                                                                                                                <span class="">
                                                                                                                    <xsl:value-of select="percentagem_colab_tabela"/>
                                                                                                                </span>
                                                                                                            </td>
                                                                                                        </xsl:if>
                                                                                                        <xsl:if test="foto_colab_tabela">
                                                                                                            <td align="left" data-row="{position()}" data-title="{../../fields/foto_colab_tabela/label}" class="text" item-name="foto_colab_tabela">
                                                                                                                <span class="">
                                                                                                                    <xsl:value-of select="foto_colab_tabela"/>
                                                                                                                </span>
                                                                                                            </td>
                                                                                                        </xsl:if>
                                                                                                        <xsl:if test="param_colab_tabela">
                                                                                                            <td align="left" data-row="{position()}" data-title="{../../fields/param_colab_tabela/label}" class="text" item-name="param_colab_tabela">
                                                                                                                <span class="">
                                                                                                                    <xsl:value-of select="param_colab_tabela"/>
                                                                                                                </span>
                                                                                                            </td>
                                                                                                        </xsl:if>
                                                                                                    </tr>
                                                                                                </xsl:for-each>
                                                                                            </tbody>
                                                                                        </table>
                                                                                    </div>
                                                                                    <xsl:apply-templates select="rows/content/table__colaboradores/table/context-menu" mode="table-context-menu"/>
                                                                                </div>
                                                                            </xsl:if>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/estatistica">
                                                            <div class="tab-pane gen-rows-holder " id="tab-tabcontent_1-estatistica" rel="tab-tabcontent_1-estatistica">
                                                                <xsl:call-template name="get-active-tab">
                                                                    <xsl:with-param name="value" select="rows/content/tabcontent_1/fields/estatistica/value"/>
                                                                    <xsl:with-param name="class" select="'tab-pane'"/>
                                                                </xsl:call-template>
                                                                <div class="row" id="row-31a79c6b">
                                                                    <div class="gen-column col-sm-12">
                                                                        <div class="gen-inner">
                                                                            <xsl:if test="rows/content/view_estatistica">
                                                                                <div class="box clearfix view-block gen-container-item " has-img="true" gen-class="" item-name="view_estatistica">
                                                                                    <div class="box-body">
                                                                                        <xsl:if test="rows/content/view_estatistica/fields/view_estatistica_img">
                                                                                            <img src="{rows/content/view_estatistica/fields/view_estatistica_img/value}"/>
                                                                                        </xsl:if>
                                                                                        <div class="view-body clearfix ">
                                                                                            <xsl:if test="rows/content/view_estatistica/fields/n_tarefas_cocluidas_view_estatistica">
                                                                                                <div class="view-item gen-fields-holder" item-name="n_tarefas_cocluidas_view_estatistica">
                                                                                                    <span class="view-label">
                                                                                                        <xsl:value-of select="rows/content/view_estatistica/fields/n_tarefas_cocluidas_view_estatistica/label"/>
                                                                                                    </span>
                                                                                                    <span class="view-value">
                                                                                                        <xsl:value-of select="rows/content/view_estatistica/fields/n_tarefas_cocluidas_view_estatistica/value"/>
                                                                                                    </span>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/view_estatistica/fields/n_tarefas_pendentes_view_estatistica">
                                                                                                <div class="view-item gen-fields-holder" item-name="n_tarefas_pendentes_view_estatistica">
                                                                                                    <span class="view-label">
                                                                                                        <xsl:value-of select="rows/content/view_estatistica/fields/n_tarefas_pendentes_view_estatistica/label"/>
                                                                                                    </span>
                                                                                                    <span class="view-value">
                                                                                                        <xsl:value-of select="rows/content/view_estatistica/fields/n_tarefas_pendentes_view_estatistica/value"/>
                                                                                                    </span>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/view_estatistica/fields/n_atendimento_dia_view_estatistica">
                                                                                                <div class="view-item gen-fields-holder" item-name="n_atendimento_dia_view_estatistica">
                                                                                                    <span class="view-label">
                                                                                                        <xsl:value-of select="rows/content/view_estatistica/fields/n_atendimento_dia_view_estatistica/label"/>
                                                                                                    </span>
                                                                                                    <span class="view-value">
                                                                                                        <xsl:value-of select="rows/content/view_estatistica/fields/n_atendimento_dia_view_estatistica/value"/>
                                                                                                    </span>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/view_estatistica/fields/media_tempo_view_estatistica">
                                                                                                <div class="view-item gen-fields-holder" item-name="media_tempo_view_estatistica">
                                                                                                    <span class="view-label">
                                                                                                        <xsl:value-of select="rows/content/view_estatistica/fields/media_tempo_view_estatistica/label"/>
                                                                                                    </span>
                                                                                                    <span class="view-value">
                                                                                                        <xsl:value-of select="rows/content/view_estatistica/fields/media_tempo_view_estatistica/value"/>
                                                                                                    </span>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/view_estatistica/fields/posicao_ranking_view_estatistica">
                                                                                                <div class="view-item gen-fields-holder" item-name="posicao_ranking_view_estatistica">
                                                                                                    <span class="view-label">
                                                                                                        <xsl:value-of select="rows/content/view_estatistica/fields/posicao_ranking_view_estatistica/label"/>
                                                                                                    </span>
                                                                                                    <span class="view-value">
                                                                                                        <xsl:value-of select="rows/content/view_estatistica/fields/posicao_ranking_view_estatistica/value"/>
                                                                                                    </span>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/form_estatistica">
                                                                                <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_estatistica">
                                                                                    <div class="box-body">
                                                                                        <div role="form">
                                                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_estatistica/fields"/>
                                                                                            <xsl:if test="rows/content/form_estatistica/fields/data_inicio_estatistica">
                                                                                                <div class="form-group col-sm-3  gen-fields-holder" item-name="data_inicio_estatistica" item-type="date">
                                                                                                    <label for="{rows/content/form_estatistica/fields/data_inicio_estatistica/@name}">
                                                                                                        <span>
                                                                                                            <xsl:value-of select="rows/content/form_estatistica/fields/data_inicio_estatistica/label"/>
                                                                                                        </span>
                                                                                                    </label>
                                                                                                    <div class="input-group">
                                                                                                        <input type="text" value="{rows/content/form_estatistica/fields/data_inicio_estatistica/value}" class="form-control gen-date " id="form_estatistica-data_inicio_estatistica" name="{rows/content/form_estatistica/fields/data_inicio_estatistica/@name}" format="IGRP_datePicker" maxlength="30">
                                                                                                            <xsl:call-template name="setAttributes">
                                                                                                                <xsl:with-param name="field" select="rows/content/form_estatistica/fields/data_inicio_estatistica"/>
                                                                                                            </xsl:call-template>
                                                                                                        </input>
                                                                                                        <span class="input-group-btn gen-date-icon">
                                                                                                            <span class="btn btn-default">
                                                                                                                <i class="fa fa-calendar"/>
                                                                                                            </span>
                                                                                                        </span>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_estatistica/fields/data_fim_estatistica">
                                                                                                <div class="form-group col-sm-3  gen-fields-holder" item-name="data_fim_estatistica" item-type="date">
                                                                                                    <label for="{rows/content/form_estatistica/fields/data_fim_estatistica/@name}">
                                                                                                        <span>
                                                                                                            <xsl:value-of select="rows/content/form_estatistica/fields/data_fim_estatistica/label"/>
                                                                                                        </span>
                                                                                                    </label>
                                                                                                    <div class="input-group">
                                                                                                        <input type="text" value="{rows/content/form_estatistica/fields/data_fim_estatistica/value}" class="form-control gen-date " id="form_estatistica-data_fim_estatistica" name="{rows/content/form_estatistica/fields/data_fim_estatistica/@name}" format="IGRP_datePicker" maxlength="30">
                                                                                                            <xsl:call-template name="setAttributes">
                                                                                                                <xsl:with-param name="field" select="rows/content/form_estatistica/fields/data_fim_estatistica"/>
                                                                                                            </xsl:call-template>
                                                                                                        </input>
                                                                                                        <span class="input-group-btn gen-date-icon">
                                                                                                            <span class="btn btn-default">
                                                                                                                <i class="fa fa-calendar"/>
                                                                                                            </span>
                                                                                                        </span>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_estatistica/fields/numero_processo_estatistica">
                                                                                                <div class="form-group col-sm-3   gen-fields-holder" item-name="numero_processo_estatistica" item-type="text">
                                                                                                    <label for="{rows/content/form_estatistica/fields/numero_processo_estatistica/@name}">
                                                                                                        <span>
                                                                                                            <xsl:value-of select="rows/content/form_estatistica/fields/numero_processo_estatistica/label"/>
                                                                                                        </span>
                                                                                                    </label>
                                                                                                    <input type="text" value="{rows/content/form_estatistica/fields/numero_processo_estatistica/value}" class="form-control " id="{rows/content/form_estatistica/fields/numero_processo_estatistica/@name}" name="{rows/content/form_estatistica/fields/numero_processo_estatistica/@name}" maxlength="30" placeholder="">
                                                                                                        <xsl:call-template name="setAttributes">
                                                                                                            <xsl:with-param name="field" select="rows/content/form_estatistica/fields/numero_processo_estatistica"/>
                                                                                                        </xsl:call-template>
                                                                                                    </input>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_estatistica/fields/prioridade_estatistica">
                                                                                                <div class="col-sm-3 form-group  gen-fields-holder" item-name="prioridade_estatistica" item-type="select">
                                                                                                    <label for="{rows/content/form_estatistica/fields/prioridade_estatistica/@name}">
                                                                                                        <xsl:value-of select="rows/content/form_estatistica/fields/prioridade_estatistica/label"/>
                                                                                                    </label>
                                                                                                    <select class="form-control select2 " id="form_estatistica_prioridade_estatistica" name="{rows/content/form_estatistica/fields/prioridade_estatistica/@name}">
                                                                                                        <xsl:call-template name="setAttributes">
                                                                                                            <xsl:with-param name="field" select="rows/content/form_estatistica/fields/prioridade_estatistica"/>
                                                                                                        </xsl:call-template>
                                                                                                        <xsl:for-each select="rows/content/form_estatistica/fields/prioridade_estatistica/list/option">
                                                                                                            <option value="{value}" label="{text}">
                                                                                                                <xsl:if test="@selected='true'">
                                                                                                                    <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                                                </xsl:if>
                                                                                                                <span>
                                                                                                                    <xsl:value-of select="text"/>
                                                                                                                </span>
                                                                                                            </option>
                                                                                                        </xsl:for-each>
                                                                                                    </select>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_estatistica/fields/tipo_processo_estatistica">
                                                                                                <div class="col-sm-3 form-group  gen-fields-holder" item-name="tipo_processo_estatistica" item-type="select">
                                                                                                    <label for="{rows/content/form_estatistica/fields/tipo_processo_estatistica/@name}">
                                                                                                        <xsl:value-of select="rows/content/form_estatistica/fields/tipo_processo_estatistica/label"/>
                                                                                                    </label>
                                                                                                    <select class="form-control select2 " id="form_estatistica_tipo_processo_estatistica" name="{rows/content/form_estatistica/fields/tipo_processo_estatistica/@name}">
                                                                                                        <xsl:call-template name="setAttributes">
                                                                                                            <xsl:with-param name="field" select="rows/content/form_estatistica/fields/tipo_processo_estatistica"/>
                                                                                                        </xsl:call-template>
                                                                                                        <xsl:for-each select="rows/content/form_estatistica/fields/tipo_processo_estatistica/list/option">
                                                                                                            <option value="{value}" label="{text}">
                                                                                                                <xsl:if test="@selected='true'">
                                                                                                                    <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                                                </xsl:if>
                                                                                                                <span>
                                                                                                                    <xsl:value-of select="text"/>
                                                                                                                </span>
                                                                                                            </option>
                                                                                                        </xsl:for-each>
                                                                                                    </select>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_estatistica/fields/estado_estatistica">
                                                                                                <div class="col-sm-3 form-group  gen-fields-holder" item-name="estado_estatistica" item-type="select">
                                                                                                    <label for="{rows/content/form_estatistica/fields/estado_estatistica/@name}">
                                                                                                        <xsl:value-of select="rows/content/form_estatistica/fields/estado_estatistica/label"/>
                                                                                                    </label>
                                                                                                    <select class="form-control select2 " id="form_estatistica_estado_estatistica" name="{rows/content/form_estatistica/fields/estado_estatistica/@name}">
                                                                                                        <xsl:call-template name="setAttributes">
                                                                                                            <xsl:with-param name="field" select="rows/content/form_estatistica/fields/estado_estatistica"/>
                                                                                                        </xsl:call-template>
                                                                                                        <xsl:for-each select="rows/content/form_estatistica/fields/estado_estatistica/list/option">
                                                                                                            <option value="{value}" label="{text}">
                                                                                                                <xsl:if test="@selected='true'">
                                                                                                                    <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                                                </xsl:if>
                                                                                                                <span>
                                                                                                                    <xsl:value-of select="text"/>
                                                                                                                </span>
                                                                                                            </option>
                                                                                                        </xsl:for-each>
                                                                                                    </select>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                        </div>
                                                                                    </div>
                                                                                    <xsl:apply-templates select="rows/content/form_estatistica/tools-bar" mode="form-buttons"/>
                                                                                </div>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/table_estatistica">
                                                                                <div class="box box-table-contents gen-container-item " gen-class="" item-name="table_estatistica">
                                                                                    <div class="box-body table-box">
                                                                                        <xsl:apply-templates mode="form-hidden-fields" select="rows/content/table_estatistica/fields"/>
                                                                                        <table id="table_estatistica" class="table table-striped gen-data-table  " exports="null">
                                                                                            <thead>
                                                                                                <tr>
                                                                                                    <xsl:if test="rows/content/table_estatistica/fields/n_processo_estat_tabela">
                                                                                                        <th align="left" class=" gen-fields-holder">
                                                                                                            <span>
                                                                                                                <xsl:value-of select="rows/content/table_estatistica/fields/n_processo_estat_tabela/label"/>
                                                                                                            </span>
                                                                                                        </th>
                                                                                                    </xsl:if>
                                                                                                    <xsl:if test="rows/content/table_estatistica/fields/tipo_estatistica_tabela">
                                                                                                        <th align="left" class=" gen-fields-holder">
                                                                                                            <span>
                                                                                                                <xsl:value-of select="rows/content/table_estatistica/fields/tipo_estatistica_tabela/label"/>
                                                                                                            </span>
                                                                                                        </th>
                                                                                                    </xsl:if>
                                                                                                    <xsl:if test="rows/content/table_estatistica/fields/desc_tarefa_estat_tabela">
                                                                                                        <th align="left" class=" gen-fields-holder">
                                                                                                            <span>
                                                                                                                <xsl:value-of select="rows/content/table_estatistica/fields/desc_tarefa_estat_tabela/label"/>
                                                                                                            </span>
                                                                                                        </th>
                                                                                                    </xsl:if>
                                                                                                    <xsl:if test="rows/content/table_estatistica/fields/data_entrada_estat_tabela">
                                                                                                        <th align="left" class=" gen-fields-holder">
                                                                                                            <span>
                                                                                                                <xsl:value-of select="rows/content/table_estatistica/fields/data_entrada_estat_tabela/label"/>
                                                                                                            </span>
                                                                                                        </th>
                                                                                                    </xsl:if>
                                                                                                    <xsl:if test="rows/content/table_estatistica/fields/data_conclusao_estat_tabela">
                                                                                                        <th align="left" class=" gen-fields-holder">
                                                                                                            <span>
                                                                                                                <xsl:value-of select="rows/content/table_estatistica/fields/data_conclusao_estat_tabela/label"/>
                                                                                                            </span>
                                                                                                        </th>
                                                                                                    </xsl:if>
                                                                                                </tr>
                                                                                            </thead>
                                                                                            <tbody>
                                                                                                <xsl:for-each select="rows/content/table_estatistica/table/value/row[not(@total='yes')]">
                                                                                                    <tr>
                                                                                                        <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                                                                        <xsl:if test="n_processo_estat_tabela">
                                                                                                            <td align="left" data-row="{position()}" data-title="{../../fields/n_processo_estat_tabela/label}" class="text" item-name="n_processo_estat_tabela">
                                                                                                                <span class="">
                                                                                                                    <xsl:value-of select="n_processo_estat_tabela"/>
                                                                                                                </span>
                                                                                                            </td>
                                                                                                        </xsl:if>
                                                                                                        <xsl:if test="tipo_estatistica_tabela">
                                                                                                            <td align="left" data-row="{position()}" data-title="{../../fields/tipo_estatistica_tabela/label}" class="text" item-name="tipo_estatistica_tabela">
                                                                                                                <span class="">
                                                                                                                    <xsl:value-of select="tipo_estatistica_tabela"/>
                                                                                                                </span>
                                                                                                            </td>
                                                                                                        </xsl:if>
                                                                                                        <xsl:if test="desc_tarefa_estat_tabela">
                                                                                                            <td align="left" data-row="{position()}" data-title="{../../fields/desc_tarefa_estat_tabela/label}" class="text" item-name="desc_tarefa_estat_tabela">
                                                                                                                <span class="">
                                                                                                                    <xsl:value-of select="desc_tarefa_estat_tabela"/>
                                                                                                                </span>
                                                                                                            </td>
                                                                                                        </xsl:if>
                                                                                                        <xsl:if test="data_entrada_estat_tabela">
                                                                                                            <td align="left" data-row="{position()}" data-title="{../../fields/data_entrada_estat_tabela/label}" class="text" item-name="data_entrada_estat_tabela">
                                                                                                                <span class="">
                                                                                                                    <xsl:value-of select="data_entrada_estat_tabela"/>
                                                                                                                </span>
                                                                                                            </td>
                                                                                                        </xsl:if>
                                                                                                        <xsl:if test="data_conclusao_estat_tabela">
                                                                                                            <td align="left" data-row="{position()}" data-title="{../../fields/data_conclusao_estat_tabela/label}" class="text" item-name="data_conclusao_estat_tabela">
                                                                                                                <span class="">
                                                                                                                    <xsl:value-of select="data_conclusao_estat_tabela"/>
                                                                                                                </span>
                                                                                                            </td>
                                                                                                        </xsl:if>
                                                                                                    </tr>
                                                                                                </xsl:for-each>
                                                                                            </tbody>
                                                                                        </table>
                                                                                    </div>
                                                                                </div>
                                                                            </xsl:if>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/minhas_tarefas">
                                                            <div class="tab-pane gen-rows-holder " id="tab-tabcontent_1-minhas_tarefas" rel="tab-tabcontent_1-minhas_tarefas">
                                                                <xsl:call-template name="get-active-tab">
                                                                    <xsl:with-param name="value" select="rows/content/tabcontent_1/fields/minhas_tarefas/value"/>
                                                                    <xsl:with-param name="class" select="'tab-pane'"/>
                                                                </xsl:call-template>
                                                                <div class="row" id="row-26cffbd7">
                                                                    <div class="gen-column col-sm-12">
                                                                        <div class="gen-inner">
                                                                            <xsl:if test="rows/content/form_minhas_tarefas">
                                                                                <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_minhas_tarefas">
                                                                                    <div class="box-body">
                                                                                        <div role="form">
                                                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_minhas_tarefas/fields"/>
                                                                                            <xsl:if test="rows/content/form_minhas_tarefas/fields/organica_minhas_tarefas">
                                                                                                <div class="col-sm-3 form-group  gen-fields-holder" item-name="organica_minhas_tarefas" item-type="select">
                                                                                                    <label for="{rows/content/form_minhas_tarefas/fields/organica_minhas_tarefas/@name}">
                                                                                                        <xsl:value-of select="rows/content/form_minhas_tarefas/fields/organica_minhas_tarefas/label"/>
                                                                                                    </label>
                                                                                                    <select class="form-control select2 " id="form_minhas_tarefas_organica_minhas_tarefas" name="{rows/content/form_minhas_tarefas/fields/organica_minhas_tarefas/@name}">
                                                                                                        <xsl:call-template name="setAttributes">
                                                                                                            <xsl:with-param name="field" select="rows/content/form_minhas_tarefas/fields/organica_minhas_tarefas"/>
                                                                                                        </xsl:call-template>
                                                                                                        <xsl:for-each select="rows/content/form_minhas_tarefas/fields/organica_minhas_tarefas/list/option">
                                                                                                            <option value="{value}" label="{text}">
                                                                                                                <xsl:if test="@selected='true'">
                                                                                                                    <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                                                </xsl:if>
                                                                                                                <span>
                                                                                                                    <xsl:value-of select="text"/>
                                                                                                                </span>
                                                                                                            </option>
                                                                                                        </xsl:for-each>
                                                                                                    </select>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_minhas_tarefas/fields/numero_processo_minhas_tarefas">
                                                                                                <div class="form-group col-sm-3   gen-fields-holder" item-name="numero_processo_minhas_tarefas" item-type="text">
                                                                                                    <label for="{rows/content/form_minhas_tarefas/fields/numero_processo_minhas_tarefas/@name}">
                                                                                                        <span>
                                                                                                            <xsl:value-of select="rows/content/form_minhas_tarefas/fields/numero_processo_minhas_tarefas/label"/>
                                                                                                        </span>
                                                                                                    </label>
                                                                                                    <input type="text" value="{rows/content/form_minhas_tarefas/fields/numero_processo_minhas_tarefas/value}" class="form-control " id="{rows/content/form_minhas_tarefas/fields/numero_processo_minhas_tarefas/@name}" name="{rows/content/form_minhas_tarefas/fields/numero_processo_minhas_tarefas/@name}" maxlength="30" placeholder="">
                                                                                                        <xsl:call-template name="setAttributes">
                                                                                                            <xsl:with-param name="field" select="rows/content/form_minhas_tarefas/fields/numero_processo_minhas_tarefas"/>
                                                                                                        </xsl:call-template>
                                                                                                    </input>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_minhas_tarefas/fields/tipo_processo_minhas_tarefas">
                                                                                                <div class="col-sm-3 form-group  gen-fields-holder" item-name="tipo_processo_minhas_tarefas" item-type="select">
                                                                                                    <label for="{rows/content/form_minhas_tarefas/fields/tipo_processo_minhas_tarefas/@name}">
                                                                                                        <xsl:value-of select="rows/content/form_minhas_tarefas/fields/tipo_processo_minhas_tarefas/label"/>
                                                                                                    </label>
                                                                                                    <select class="form-control select2 " id="form_minhas_tarefas_tipo_processo_minhas_tarefas" name="{rows/content/form_minhas_tarefas/fields/tipo_processo_minhas_tarefas/@name}">
                                                                                                        <xsl:call-template name="setAttributes">
                                                                                                            <xsl:with-param name="field" select="rows/content/form_minhas_tarefas/fields/tipo_processo_minhas_tarefas"/>
                                                                                                        </xsl:call-template>
                                                                                                        <xsl:for-each select="rows/content/form_minhas_tarefas/fields/tipo_processo_minhas_tarefas/list/option">
                                                                                                            <option value="{value}" label="{text}">
                                                                                                                <xsl:if test="@selected='true'">
                                                                                                                    <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                                                </xsl:if>
                                                                                                                <span>
                                                                                                                    <xsl:value-of select="text"/>
                                                                                                                </span>
                                                                                                            </option>
                                                                                                        </xsl:for-each>
                                                                                                    </select>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_minhas_tarefas/fields/data_inicio_minhas_tarefas">
                                                                                                <div class="form-group col-sm-3  gen-fields-holder" item-name="data_inicio_minhas_tarefas" item-type="date">
                                                                                                    <label for="{rows/content/form_minhas_tarefas/fields/data_inicio_minhas_tarefas/@name}">
                                                                                                        <span>
                                                                                                            <xsl:value-of select="rows/content/form_minhas_tarefas/fields/data_inicio_minhas_tarefas/label"/>
                                                                                                        </span>
                                                                                                    </label>
                                                                                                    <div class="input-group">
                                                                                                        <input type="text" value="{rows/content/form_minhas_tarefas/fields/data_inicio_minhas_tarefas/value}" class="form-control gen-date " id="form_minhas_tarefas-data_inicio_minhas_tarefas" name="{rows/content/form_minhas_tarefas/fields/data_inicio_minhas_tarefas/@name}" format="IGRP_datePicker" maxlength="30">
                                                                                                            <xsl:call-template name="setAttributes">
                                                                                                                <xsl:with-param name="field" select="rows/content/form_minhas_tarefas/fields/data_inicio_minhas_tarefas"/>
                                                                                                            </xsl:call-template>
                                                                                                        </input>
                                                                                                        <span class="input-group-btn gen-date-icon">
                                                                                                            <span class="btn btn-default">
                                                                                                                <i class="fa fa-calendar"/>
                                                                                                            </span>
                                                                                                        </span>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_minhas_tarefas/fields/data_fim_minhas_tarefas">
                                                                                                <div class="form-group col-sm-3  gen-fields-holder" item-name="data_fim_minhas_tarefas" item-type="date">
                                                                                                    <label for="{rows/content/form_minhas_tarefas/fields/data_fim_minhas_tarefas/@name}">
                                                                                                        <span>
                                                                                                            <xsl:value-of select="rows/content/form_minhas_tarefas/fields/data_fim_minhas_tarefas/label"/>
                                                                                                        </span>
                                                                                                    </label>
                                                                                                    <div class="input-group">
                                                                                                        <input type="text" value="{rows/content/form_minhas_tarefas/fields/data_fim_minhas_tarefas/value}" class="form-control gen-date " id="form_minhas_tarefas-data_fim_minhas_tarefas" name="{rows/content/form_minhas_tarefas/fields/data_fim_minhas_tarefas/@name}" format="IGRP_datePicker" maxlength="30">
                                                                                                            <xsl:call-template name="setAttributes">
                                                                                                                <xsl:with-param name="field" select="rows/content/form_minhas_tarefas/fields/data_fim_minhas_tarefas"/>
                                                                                                            </xsl:call-template>
                                                                                                        </input>
                                                                                                        <span class="input-group-btn gen-date-icon">
                                                                                                            <span class="btn btn-default">
                                                                                                                <i class="fa fa-calendar"/>
                                                                                                            </span>
                                                                                                        </span>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_minhas_tarefas/fields/prioridade_minhas_tarefas">
                                                                                                <div class="col-sm-3 form-group  gen-fields-holder" item-name="prioridade_minhas_tarefas" item-type="select">
                                                                                                    <label for="{rows/content/form_minhas_tarefas/fields/prioridade_minhas_tarefas/@name}">
                                                                                                        <xsl:value-of select="rows/content/form_minhas_tarefas/fields/prioridade_minhas_tarefas/label"/>
                                                                                                    </label>
                                                                                                    <select class="form-control select2 " id="form_minhas_tarefas_prioridade_minhas_tarefas" name="{rows/content/form_minhas_tarefas/fields/prioridade_minhas_tarefas/@name}">
                                                                                                        <xsl:call-template name="setAttributes">
                                                                                                            <xsl:with-param name="field" select="rows/content/form_minhas_tarefas/fields/prioridade_minhas_tarefas"/>
                                                                                                        </xsl:call-template>
                                                                                                        <xsl:for-each select="rows/content/form_minhas_tarefas/fields/prioridade_minhas_tarefas/list/option">
                                                                                                            <option value="{value}" label="{text}">
                                                                                                                <xsl:if test="@selected='true'">
                                                                                                                    <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                                                </xsl:if>
                                                                                                                <span>
                                                                                                                    <xsl:value-of select="text"/>
                                                                                                                </span>
                                                                                                            </option>
                                                                                                        </xsl:for-each>
                                                                                                    </select>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_minhas_tarefas/fields/pesquisa_minhas_tarefas">
                                                                                                <div class="form-group col-sm-3   gen-fields-holder" item-name="pesquisa_minhas_tarefas" item-type="text">
                                                                                                    <label for="{rows/content/form_minhas_tarefas/fields/pesquisa_minhas_tarefas/@name}">
                                                                                                        <span>
                                                                                                            <xsl:value-of select="rows/content/form_minhas_tarefas/fields/pesquisa_minhas_tarefas/label"/>
                                                                                                        </span>
                                                                                                    </label>
                                                                                                    <input type="text" value="{rows/content/form_minhas_tarefas/fields/pesquisa_minhas_tarefas/value}" class="form-control " id="{rows/content/form_minhas_tarefas/fields/pesquisa_minhas_tarefas/@name}" name="{rows/content/form_minhas_tarefas/fields/pesquisa_minhas_tarefas/@name}" maxlength="30" placeholder="">
                                                                                                        <xsl:call-template name="setAttributes">
                                                                                                            <xsl:with-param name="field" select="rows/content/form_minhas_tarefas/fields/pesquisa_minhas_tarefas"/>
                                                                                                        </xsl:call-template>
                                                                                                    </input>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                        </div>
                                                                                    </div>
                                                                                    <xsl:apply-templates select="rows/content/form_minhas_tarefas/tools-bar" mode="form-buttons"/>
                                                                                </div>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/table_minhas_tarefas">
                                                                                <div class="box box-table-contents gen-container-item " gen-class="" item-name="table_minhas_tarefas">
                                                                                    <div class="box-body table-box">
                                                                                        <xsl:apply-templates mode="form-hidden-fields" select="rows/content/table_minhas_tarefas/fields"/>
                                                                                        <table id="table_minhas_tarefas" class="table table-striped gen-data-table IGRP_contextmenu " exports="null">
                                                                                            <thead>
                                                                                                <tr>
                                                                                                    <xsl:if test="rows/content/table_minhas_tarefas/fields/tipo_tabela_minhas_tarefas">
                                                                                                        <th align="left" class=" gen-fields-holder">
                                                                                                            <span>
                                                                                                                <xsl:value-of select="rows/content/table_minhas_tarefas/fields/tipo_tabela_minhas_tarefas/label"/>
                                                                                                            </span>
                                                                                                        </th>
                                                                                                    </xsl:if>
                                                                                                    <xsl:if test="rows/content/table_minhas_tarefas/fields/desc_tarefa_tabela_minhas_tarefas">
                                                                                                        <th align="left" class=" gen-fields-holder">
                                                                                                            <span>
                                                                                                                <xsl:value-of select="rows/content/table_minhas_tarefas/fields/desc_tarefa_tabela_minhas_tarefas/label"/>
                                                                                                            </span>
                                                                                                        </th>
                                                                                                    </xsl:if>
                                                                                                    <xsl:if test="rows/content/table_minhas_tarefas/fields/atribuido_por_tabela_minhas_tarefas">
                                                                                                        <th align="left" class=" gen-fields-holder">
                                                                                                            <span>
                                                                                                                <xsl:value-of select="rows/content/table_minhas_tarefas/fields/atribuido_por_tabela_minhas_tarefas/label"/>
                                                                                                            </span>
                                                                                                        </th>
                                                                                                    </xsl:if>
                                                                                                    <xsl:if test="rows/content/table_minhas_tarefas/fields/data_entrada_tabela_minhas_tarefas">
                                                                                                        <th align="left" class=" gen-fields-holder">
                                                                                                            <span>
                                                                                                                <xsl:value-of select="rows/content/table_minhas_tarefas/fields/data_entrada_tabela_minhas_tarefas/label"/>
                                                                                                            </span>
                                                                                                        </th>
                                                                                                    </xsl:if>
                                                                                                    <xsl:if test="rows/content/table_minhas_tarefas/fields/espera_tabela_minhas_tarefas">
                                                                                                        <th align="left" class=" gen-fields-holder">
                                                                                                            <span>
                                                                                                                <xsl:value-of select="rows/content/table_minhas_tarefas/fields/espera_tabela_minhas_tarefas/label"/>
                                                                                                            </span>
                                                                                                        </th>
                                                                                                    </xsl:if>
                                                                                                </tr>
                                                                                            </thead>
                                                                                            <tbody>
                                                                                                <xsl:for-each select="rows/content/table_minhas_tarefas/table/value/row[not(@total='yes')]">
                                                                                                    <tr>
                                                                                                        <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                                                                        <xsl:if test="tipo_tabela_minhas_tarefas">
                                                                                                            <td align="left" data-row="{position()}" data-title="{../../fields/tipo_tabela_minhas_tarefas/label}" class="text" item-name="tipo_tabela_minhas_tarefas">
                                                                                                                <span class="">
                                                                                                                    <xsl:value-of select="tipo_tabela_minhas_tarefas"/>
                                                                                                                </span>
                                                                                                            </td>
                                                                                                        </xsl:if>
                                                                                                        <xsl:if test="desc_tarefa_tabela_minhas_tarefas">
                                                                                                            <td align="left" data-row="{position()}" data-title="{../../fields/desc_tarefa_tabela_minhas_tarefas/label}" class="text" item-name="desc_tarefa_tabela_minhas_tarefas">
                                                                                                                <span class="">
                                                                                                                    <xsl:value-of select="desc_tarefa_tabela_minhas_tarefas"/>
                                                                                                                </span>
                                                                                                            </td>
                                                                                                        </xsl:if>
                                                                                                        <xsl:if test="atribuido_por_tabela_minhas_tarefas">
                                                                                                            <td align="left" data-row="{position()}" data-title="{../../fields/atribuido_por_tabela_minhas_tarefas/label}" class="text" item-name="atribuido_por_tabela_minhas_tarefas">
                                                                                                                <span class="">
                                                                                                                    <xsl:value-of select="atribuido_por_tabela_minhas_tarefas"/>
                                                                                                                </span>
                                                                                                            </td>
                                                                                                        </xsl:if>
                                                                                                        <xsl:if test="data_entrada_tabela_minhas_tarefas">
                                                                                                            <td align="left" data-row="{position()}" data-title="{../../fields/data_entrada_tabela_minhas_tarefas/label}" class="text" item-name="data_entrada_tabela_minhas_tarefas">
                                                                                                                <span class="">
                                                                                                                    <xsl:value-of select="data_entrada_tabela_minhas_tarefas"/>
                                                                                                                </span>
                                                                                                            </td>
                                                                                                        </xsl:if>
                                                                                                        <xsl:if test="espera_tabela_minhas_tarefas">
                                                                                                            <td align="left" data-row="{position()}" data-title="{../../fields/espera_tabela_minhas_tarefas/label}" class="text" item-name="espera_tabela_minhas_tarefas">
                                                                                                                <span class="">
                                                                                                                    <xsl:value-of select="espera_tabela_minhas_tarefas"/>
                                                                                                                </span>
                                                                                                            </td>
                                                                                                        </xsl:if>
                                                                                                    </tr>
                                                                                                </xsl:for-each>
                                                                                            </tbody>
                                                                                        </table>
                                                                                    </div>
                                                                                    <xsl:apply-templates select="rows/content/table_minhas_tarefas/table/context-menu" mode="table-context-menu"/>
                                                                                </div>
                                                                            </xsl:if>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/disponiveis">
                                                            <div class="tab-pane gen-rows-holder " id="tab-tabcontent_1-disponiveis" rel="tab-tabcontent_1-disponiveis">
                                                                <xsl:call-template name="get-active-tab">
                                                                    <xsl:with-param name="value" select="rows/content/tabcontent_1/fields/disponiveis/value"/>
                                                                    <xsl:with-param name="class" select="'tab-pane'"/>
                                                                </xsl:call-template>
                                                                <div class="row" id="row-0bbc5523">
                                                                    <div class="gen-column col-sm-12">
                                                                        <div class="gen-inner">
                                                                            <xsl:if test="rows/content/form_disponiveis">
                                                                                <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_disponiveis">
                                                                                    <div class="box-body">
                                                                                        <div role="form">
                                                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_disponiveis/fields"/>
                                                                                            <xsl:if test="rows/content/form_disponiveis/fields/organica_form_disponiveis">
                                                                                                <div class="col-sm-3 form-group  gen-fields-holder" item-name="organica_form_disponiveis" item-type="select">
                                                                                                    <label for="{rows/content/form_disponiveis/fields/organica_form_disponiveis/@name}">
                                                                                                        <xsl:value-of select="rows/content/form_disponiveis/fields/organica_form_disponiveis/label"/>
                                                                                                    </label>
                                                                                                    <select class="form-control select2 " id="form_disponiveis_organica_form_disponiveis" name="{rows/content/form_disponiveis/fields/organica_form_disponiveis/@name}">
                                                                                                        <xsl:call-template name="setAttributes">
                                                                                                            <xsl:with-param name="field" select="rows/content/form_disponiveis/fields/organica_form_disponiveis"/>
                                                                                                        </xsl:call-template>
                                                                                                        <xsl:for-each select="rows/content/form_disponiveis/fields/organica_form_disponiveis/list/option">
                                                                                                            <option value="{value}" label="{text}">
                                                                                                                <xsl:if test="@selected='true'">
                                                                                                                    <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                                                </xsl:if>
                                                                                                                <span>
                                                                                                                    <xsl:value-of select="text"/>
                                                                                                                </span>
                                                                                                            </option>
                                                                                                        </xsl:for-each>
                                                                                                    </select>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_disponiveis/fields/numero_processo_form_disponiveis">
                                                                                                <div class="form-group col-sm-3   gen-fields-holder" item-name="numero_processo_form_disponiveis" item-type="text">
                                                                                                    <label for="{rows/content/form_disponiveis/fields/numero_processo_form_disponiveis/@name}">
                                                                                                        <span>
                                                                                                            <xsl:value-of select="rows/content/form_disponiveis/fields/numero_processo_form_disponiveis/label"/>
                                                                                                        </span>
                                                                                                    </label>
                                                                                                    <input type="text" value="{rows/content/form_disponiveis/fields/numero_processo_form_disponiveis/value}" class="form-control " id="{rows/content/form_disponiveis/fields/numero_processo_form_disponiveis/@name}" name="{rows/content/form_disponiveis/fields/numero_processo_form_disponiveis/@name}" maxlength="30" placeholder="">
                                                                                                        <xsl:call-template name="setAttributes">
                                                                                                            <xsl:with-param name="field" select="rows/content/form_disponiveis/fields/numero_processo_form_disponiveis"/>
                                                                                                        </xsl:call-template>
                                                                                                    </input>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_disponiveis/fields/tipo_processo_form_disponiveis">
                                                                                                <div class="col-sm-3 form-group  gen-fields-holder" item-name="tipo_processo_form_disponiveis" item-type="select">
                                                                                                    <label for="{rows/content/form_disponiveis/fields/tipo_processo_form_disponiveis/@name}">
                                                                                                        <xsl:value-of select="rows/content/form_disponiveis/fields/tipo_processo_form_disponiveis/label"/>
                                                                                                    </label>
                                                                                                    <select class="form-control select2 " id="form_disponiveis_tipo_processo_form_disponiveis" name="{rows/content/form_disponiveis/fields/tipo_processo_form_disponiveis/@name}">
                                                                                                        <xsl:call-template name="setAttributes">
                                                                                                            <xsl:with-param name="field" select="rows/content/form_disponiveis/fields/tipo_processo_form_disponiveis"/>
                                                                                                        </xsl:call-template>
                                                                                                        <xsl:for-each select="rows/content/form_disponiveis/fields/tipo_processo_form_disponiveis/list/option">
                                                                                                            <option value="{value}" label="{text}">
                                                                                                                <xsl:if test="@selected='true'">
                                                                                                                    <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                                                </xsl:if>
                                                                                                                <span>
                                                                                                                    <xsl:value-of select="text"/>
                                                                                                                </span>
                                                                                                            </option>
                                                                                                        </xsl:for-each>
                                                                                                    </select>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_disponiveis/fields/data_inicio_form_disponiveis">
                                                                                                <div class="form-group col-sm-3  gen-fields-holder" item-name="data_inicio_form_disponiveis" item-type="date">
                                                                                                    <label for="{rows/content/form_disponiveis/fields/data_inicio_form_disponiveis/@name}">
                                                                                                        <span>
                                                                                                            <xsl:value-of select="rows/content/form_disponiveis/fields/data_inicio_form_disponiveis/label"/>
                                                                                                        </span>
                                                                                                    </label>
                                                                                                    <div class="input-group">
                                                                                                        <input type="text" value="{rows/content/form_disponiveis/fields/data_inicio_form_disponiveis/value}" class="form-control gen-date " id="form_disponiveis-data_inicio_form_disponiveis" name="{rows/content/form_disponiveis/fields/data_inicio_form_disponiveis/@name}" format="IGRP_datePicker" maxlength="30">
                                                                                                            <xsl:call-template name="setAttributes">
                                                                                                                <xsl:with-param name="field" select="rows/content/form_disponiveis/fields/data_inicio_form_disponiveis"/>
                                                                                                            </xsl:call-template>
                                                                                                        </input>
                                                                                                        <span class="input-group-btn gen-date-icon">
                                                                                                            <span class="btn btn-default">
                                                                                                                <i class="fa fa-calendar"/>
                                                                                                            </span>
                                                                                                        </span>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_disponiveis/fields/data_fim_form_disponiveis">
                                                                                                <div class="form-group col-sm-3  gen-fields-holder" item-name="data_fim_form_disponiveis" item-type="date">
                                                                                                    <label for="{rows/content/form_disponiveis/fields/data_fim_form_disponiveis/@name}">
                                                                                                        <span>
                                                                                                            <xsl:value-of select="rows/content/form_disponiveis/fields/data_fim_form_disponiveis/label"/>
                                                                                                        </span>
                                                                                                    </label>
                                                                                                    <div class="input-group">
                                                                                                        <input type="text" value="{rows/content/form_disponiveis/fields/data_fim_form_disponiveis/value}" class="form-control gen-date " id="form_disponiveis-data_fim_form_disponiveis" name="{rows/content/form_disponiveis/fields/data_fim_form_disponiveis/@name}" format="IGRP_datePicker" maxlength="30">
                                                                                                            <xsl:call-template name="setAttributes">
                                                                                                                <xsl:with-param name="field" select="rows/content/form_disponiveis/fields/data_fim_form_disponiveis"/>
                                                                                                            </xsl:call-template>
                                                                                                        </input>
                                                                                                        <span class="input-group-btn gen-date-icon">
                                                                                                            <span class="btn btn-default">
                                                                                                                <i class="fa fa-calendar"/>
                                                                                                            </span>
                                                                                                        </span>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_disponiveis/fields/prioridade_form_disponiveis">
                                                                                                <div class="col-sm-3 form-group  gen-fields-holder" item-name="prioridade_form_disponiveis" item-type="select">
                                                                                                    <label for="{rows/content/form_disponiveis/fields/prioridade_form_disponiveis/@name}">
                                                                                                        <xsl:value-of select="rows/content/form_disponiveis/fields/prioridade_form_disponiveis/label"/>
                                                                                                    </label>
                                                                                                    <select class="form-control select2 " id="form_disponiveis_prioridade_form_disponiveis" name="{rows/content/form_disponiveis/fields/prioridade_form_disponiveis/@name}">
                                                                                                        <xsl:call-template name="setAttributes">
                                                                                                            <xsl:with-param name="field" select="rows/content/form_disponiveis/fields/prioridade_form_disponiveis"/>
                                                                                                        </xsl:call-template>
                                                                                                        <xsl:for-each select="rows/content/form_disponiveis/fields/prioridade_form_disponiveis/list/option">
                                                                                                            <option value="{value}" label="{text}">
                                                                                                                <xsl:if test="@selected='true'">
                                                                                                                    <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                                                </xsl:if>
                                                                                                                <span>
                                                                                                                    <xsl:value-of select="text"/>
                                                                                                                </span>
                                                                                                            </option>
                                                                                                        </xsl:for-each>
                                                                                                    </select>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_disponiveis/fields/pesquisar_form_disponiveis">
                                                                                                <div class="form-group col-sm-3   gen-fields-holder" item-name="pesquisar_form_disponiveis" item-type="text">
                                                                                                    <label for="{rows/content/form_disponiveis/fields/pesquisar_form_disponiveis/@name}">
                                                                                                        <span>
                                                                                                            <xsl:value-of select="rows/content/form_disponiveis/fields/pesquisar_form_disponiveis/label"/>
                                                                                                        </span>
                                                                                                    </label>
                                                                                                    <input type="text" value="{rows/content/form_disponiveis/fields/pesquisar_form_disponiveis/value}" class="form-control " id="{rows/content/form_disponiveis/fields/pesquisar_form_disponiveis/@name}" name="{rows/content/form_disponiveis/fields/pesquisar_form_disponiveis/@name}" maxlength="30" placeholder="">
                                                                                                        <xsl:call-template name="setAttributes">
                                                                                                            <xsl:with-param name="field" select="rows/content/form_disponiveis/fields/pesquisar_form_disponiveis"/>
                                                                                                        </xsl:call-template>
                                                                                                    </input>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                        </div>
                                                                                    </div>
                                                                                    <xsl:apply-templates select="rows/content/form_disponiveis/tools-bar" mode="form-buttons"/>
                                                                                </div>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/table_disponiveis">
                                                                                <div class="box box-table-contents gen-container-item " gen-class="" item-name="table_disponiveis">
                                                                                    <div class="box-body table-box">
                                                                                        <xsl:apply-templates mode="form-hidden-fields" select="rows/content/table_disponiveis/fields"/>
                                                                                        <table id="table_disponiveis" class="table table-striped gen-data-table IGRP_contextmenu " exports="null">
                                                                                            <thead>
                                                                                                <tr>
                                                                                                    <xsl:if test="rows/content/table_disponiveis/fields/tarefas_tabela_disponiveis">
                                                                                                        <th align="left" class=" gen-fields-holder">
                                                                                                            <span>
                                                                                                                <xsl:value-of select="rows/content/table_disponiveis/fields/tarefas_tabela_disponiveis/label"/>
                                                                                                            </span>
                                                                                                        </th>
                                                                                                    </xsl:if>
                                                                                                    <xsl:if test="rows/content/table_disponiveis/fields/categorias_processo_tabela_disponiveis">
                                                                                                        <th align="left" class=" gen-fields-holder">
                                                                                                            <span>
                                                                                                                <xsl:value-of select="rows/content/table_disponiveis/fields/categorias_processo_tabela_disponiveis/label"/>
                                                                                                            </span>
                                                                                                        </th>
                                                                                                    </xsl:if>
                                                                                                    <xsl:if test="rows/content/table_disponiveis/fields/data_entrada_tabela_disponiveis">
                                                                                                        <th align="left" class=" gen-fields-holder">
                                                                                                            <span>
                                                                                                                <xsl:value-of select="rows/content/table_disponiveis/fields/data_entrada_tabela_disponiveis/label"/>
                                                                                                            </span>
                                                                                                        </th>
                                                                                                    </xsl:if>
                                                                                                    <th class="igrp-table-ctx-th"/>
                                                                                                </tr>
                                                                                            </thead>
                                                                                            <tbody>
                                                                                                <xsl:for-each select="rows/content/table_disponiveis/table/value/row[not(@total='yes')]">
                                                                                                    <tr>
                                                                                                        <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                                                                        <xsl:if test="tarefas_tabela_disponiveis">
                                                                                                            <td align="left" data-row="{position()}" data-title="{../../fields/tarefas_tabela_disponiveis/label}" class="text" item-name="tarefas_tabela_disponiveis">
                                                                                                                <span class="">
                                                                                                                    <xsl:value-of select="tarefas_tabela_disponiveis"/>
                                                                                                                </span>
                                                                                                            </td>
                                                                                                        </xsl:if>
                                                                                                        <xsl:if test="categorias_processo_tabela_disponiveis">
                                                                                                            <td align="left" data-row="{position()}" data-title="{../../fields/categorias_processo_tabela_disponiveis/label}" class="text" item-name="categorias_processo_tabela_disponiveis">
                                                                                                                <span class="">
                                                                                                                    <xsl:value-of select="categorias_processo_tabela_disponiveis"/>
                                                                                                                </span>
                                                                                                            </td>
                                                                                                        </xsl:if>
                                                                                                        <xsl:if test="data_entrada_tabela_disponiveis">
                                                                                                            <td align="left" data-row="{position()}" data-title="{../../fields/data_entrada_tabela_disponiveis/label}" class="text" item-name="data_entrada_tabela_disponiveis">
                                                                                                                <span class="">
                                                                                                                    <xsl:value-of select="data_entrada_tabela_disponiveis"/>
                                                                                                                </span>
                                                                                                            </td>
                                                                                                        </xsl:if>
                                                                                                        <td class="igrp-table-ctx-td">
                                                                                                            <xsl:apply-templates select="../../context-menu" mode="table-context-inline">
                                                                                                                <xsl:with-param name="row-params" select="context-menu"/>
                                                                                                            </xsl:apply-templates>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </xsl:for-each>
                                                                                            </tbody>
                                                                                        </table>
                                                                                    </div>
                                                                                </div>
                                                                            </xsl:if>
                                                                        </div>
                                                                    </div>
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
                        </div>
                    </div>
                    <xsl:call-template name="IGRP-bottom"/>
                </form>
                <!-- TABCONTENT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/tabs/igrp.tabs.js?v={$version}"/>
                <!-- FORM JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js?v={$version}"/>
                <!-- TABLE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/table/igrp.table.js?v={$version}"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/bootstrap-contextmenu.js?v={$version}"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/table.contextmenu.js?v={$version}"/>
                <!-- SELECT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js?v={$version}"/>
                <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js?v={$version}"/>
                <!-- DATE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/datetimepicker.js?v={$version}"/>
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/dtp.init.js?v={$version}"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1506683324327"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1506683324327"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1506683324327"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1506683324327"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1506683324328"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1506683324332"/>
</xsl:stylesheet>
