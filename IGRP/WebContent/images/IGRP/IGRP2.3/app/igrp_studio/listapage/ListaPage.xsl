<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- INFOPANEL CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/infopanel/infopanel.css?v={$version}"/>
                <!-- TABLE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/datatable/dataTables.bootstrap.css?v={$version}"/>
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css?v={$version}"/>
                <!-- TOOLSBAR CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css?v={$version}"/>
                <!-- SELECT CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.min.css?v={$version}"/>
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.style.css?v={$version}"/>
                <style>#myappsTb thead,#myappsTb tr td i{  display:none}.box #myappsTb {    box-shadow: 0 0px 0px rgba(0,0,0,0.1);}.box #filtro{    box-shadow: 0 0px 0px rgba(0,0,0,0.1);}.isac{    box-shadow: 0 0px 0px rgba(0,0,0,0.1);}.igrp-box-holder.box&gt;.box-body {    padding: 10px 10px 0;}</style>
            </head>
            <body class="{$bodyClass} sidebar-off">
                <xsl:call-template name="IGRP-topmenu"/>
                <form method="POST" class="IGRP-form" name="formular_default" enctype="multipart/form-data">
                    <div class="container-fluid">
                        <div class="row">
                            <xsl:call-template name="IGRP-sidebar"/>
                            <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
                                <div class="content">
                                    <div class="row row-msg">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row " id="row-ef243093">
                                        <div class="gen-column col-sm-4">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/infopanel_1">
                                                    <div class="igrp-infopanel gen-container-item " gen-class="" item-name="infopanel_1">
                                                        <a href="{rows/content/infopanel_1/fields/infopanel_1_url/value}" target="_self" class="quick-stats__item {rows/content/infopanel_1/fields/infopanel_1_bg/value}">
                                                            <div class="quick-stats__info">
                                                                <h2>
                                                                    <xsl:value-of select="rows/content/infopanel_1/fields/infopanel_1_val/value"/>
                                                                </h2>
                                                                <small>
                                                                    <xsl:value-of select="rows/content/infopanel_1/fields/infopanel_1_title/value"/>
                                                                </small>
                                                            </div>
                                                            <div class="quick-stats__icon">
                                                                <i class="fa {rows/content/infopanel_1/fields/infopanel_1_icn/value} fa-3x"/>
                                                            </div>
                                                        </a>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                        <div class="gen-column col-sm-4">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/infopanel_2">
                                                    <div class="igrp-infopanel gen-container-item " gen-class="" item-name="infopanel_2">
                                                        <a href="{rows/content/infopanel_2/fields/infopanel_2_url/value}" target="_self" class="quick-stats__item {rows/content/infopanel_2/fields/infopanel_2_bg/value}">
                                                            <div class="quick-stats__info">
                                                                <h2>
                                                                    <xsl:value-of select="rows/content/infopanel_2/fields/infopanel_2_val/value"/>
                                                                </h2>
                                                                <small>
                                                                    <xsl:value-of select="rows/content/infopanel_2/fields/infopanel_2_title/value"/>
                                                                </small>
                                                            </div>
                                                            <div class="quick-stats__icon">
                                                                <i class="fa {rows/content/infopanel_2/fields/infopanel_2_icn/value} fa-3x"/>
                                                            </div>
                                                        </a>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                        <div class="gen-column col-sm-4">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/infopanel_3">
                                                    <div class="igrp-infopanel gen-container-item " gen-class="" item-name="infopanel_3">
                                                        <a href="{rows/content/infopanel_3/fields/infopanel_3_url/value}" target="_self" class="quick-stats__item {rows/content/infopanel_3/fields/infopanel_3_bg/value}">
                                                            <div class="quick-stats__info">
                                                                <h2>
                                                                    <xsl:value-of select="rows/content/infopanel_3/fields/infopanel_3_val/value"/>
                                                                </h2>
                                                                <small>
                                                                    <xsl:value-of select="rows/content/infopanel_3/fields/infopanel_3_title/value"/>
                                                                </small>
                                                            </div>
                                                            <div class="quick-stats__icon">
                                                                <i class="fa {rows/content/infopanel_3/fields/infopanel_3_icn/value} fa-3x"/>
                                                            </div>
                                                        </a>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row " id="row-58a0f6dd">
                                        <div class="gen-column col-sm-8">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/box_2">
                                                    <div class="box igrp-box-holder gen-container-item " gen-class="" item-name="box_2">
                                                        <div class="box-body" gen-preserve-content="true">
                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/box_2/fields"/>
                                                            <div>
                                                                <div class="row " id="row-c534c6c3">
                                                                    <div class="gen-column col-sm-12">
                                                                        <div class="gen-inner">
                                                                            <xsl:if test="rows/content/form_1">
                                                                                <div class="box igrp-forms gen-container-item " id="filtro" gen-class="" item-name="form_1">
                                                                                    <xsl:call-template name="box-header">
                                                                                        <xsl:with-param name="title" select="rows/content/form_1/@title"/>
                                                                                        <xsl:with-param name="collapsible" select="'false'"/>
                                                                                        <xsl:with-param name="collapsed" select="'false'"/>
                                                                                    </xsl:call-template>
                                                                                    <div class="box-body">
                                                                                        <div role="form">
                                                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                                                                            <xsl:if test="rows/content/form_1/fields/env_fk">
                                                                                                <div class="col-sm-3 form-group  gen-fields-holder" item-name="env_fk" item-type="select">
                                                                                                    <label for="{rows/content/form_1/fields/env_fk/@name}">
                                                                                                        <xsl:value-of select="rows/content/form_1/fields/env_fk/label"/>
                                                                                                    </label>
                                                                                                    <select class="form-control select2 IGRP_change" id="form_1_env_fk" name="{rows/content/form_1/fields/env_fk/@name}">
                                                                                                        <xsl:call-template name="setAttributes">
                                                                                                            <xsl:with-param name="field" select="rows/content/form_1/fields/env_fk"/>
                                                                                                        </xsl:call-template>
                                                                                                        <xsl:for-each select="rows/content/form_1/fields/env_fk/list/option">
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
                                                                                            <xsl:if test="rows/content/form_1/fields/link_btn_nova_pagina">
                                                                                                <div class="form-group col-sm-3 pull-right gen-fields-holder" item-name="link_btn_nova_pagina" item-type="link">
                                                                                                    <a href="{rows/content/form_1/fields/link_btn_nova_pagina/value}" class="link btn btn-success form-link" close="refresh" target="modal">
                                                                                                        <i class="fa fa-plus-square"/>
                                                                                                        <span>
                                                                                                            <span>
                                                                                                                <xsl:value-of select="rows/content/form_1/fields/link_btn_nova_pagina/label"/>
                                                                                                            </span>
                                                                                                        </span>
                                                                                                    </a>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_1/fields/crud_generator">
                                                                                                <div class="form-group col-sm-3 pull-right gen-fields-holder" item-name="crud_generator" item-type="link">
                                                                                                    <a href="{rows/content/form_1/fields/crud_generator/value}" class="link btn btn-warning form-link" close="refresh" target="modal">
                                                                                                        <i class="fa fa-gears"/>
                                                                                                        <span>
                                                                                                            <span>
                                                                                                                <xsl:value-of select="rows/content/form_1/fields/crud_generator/label"/>
                                                                                                            </span>
                                                                                                        </span>
                                                                                                    </a>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_1/fields/btn_import">
                                                                                                <div class="form-group col-sm-3 pull-right gen-fields-holder" item-name="btn_import" item-type="link">
                                                                                                    <a href="{rows/content/form_1/fields/btn_import/value}" class="link btn btn-danger form-link" close="refresh" target="modal">
                                                                                                        <i class="fa fa-upload"/>
                                                                                                        <span>
                                                                                                            <span>
                                                                                                                <xsl:value-of select="rows/content/form_1/fields/btn_import/label"/>
                                                                                                            </span>
                                                                                                        </span>
                                                                                                    </a>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                        </div>
                                                                                    </div>
                                                                                    <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/>
                                                                                </div>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/table_1">
                                                                                <div class="box box-table-contents gen-container-item isac" gen-class="isac" item-name="table_1">
                                                                                    <div class="box-body ">
                                                                                        <xsl:apply-templates mode="form-hidden-fields" select="rows/content/table_1/fields"/>
                                                                                        <div class="table-contents-head">
                                                                                            <div class="table-contents-inner"></div>
                                                                                        </div>
                                                                                        <div class="table-box">
                                                                                            <div class="table-box-inner">
                                                                                                <table id="table_1" class="table table-striped igrp-data-table IGRP_contextmenu " exports="null">
                                                                                                    <thead>
                                                                                                        <tr>
                                                                                                            <xsl:if test="rows/content/table_1/fields/status_page">
                                                                                                                <th class="bs-checkbox gen-fields-holder" align="center">
                                                                                                                    <span>Estado</span>
                                                                                                                    <input type="checkbox" class="IGRP_checkall" check-rel="status_page" data-title="Estado" data-toggle="tooltip"/>
                                                                                                                </th>
                                                                                                            </xsl:if>
                                                                                                            <xsl:if test="rows/content/table_1/fields/descricao_page">
                                                                                                                <th align="left" class=" gen-fields-holder">
                                                                                                                    <span>
                                                                                                                        <xsl:value-of select="rows/content/table_1/fields/descricao_page/label"/>
                                                                                                                    </span>
                                                                                                                </th>
                                                                                                            </xsl:if>
                                                                                                            <xsl:if test="rows/content/table_1/fields/nome_page">
                                                                                                                <th align="left" class=" gen-fields-holder">
                                                                                                                    <span>
                                                                                                                        <xsl:value-of select="rows/content/table_1/fields/nome_page/label"/>
                                                                                                                    </span>
                                                                                                                </th>
                                                                                                            </xsl:if>
                                                                                                            <th class="igrp-table-ctx-th"/>
                                                                                                        </tr>
                                                                                                    </thead>
                                                                                                    <tbody>
                                                                                                        <xsl:for-each select="rows/content/table_1/table/value/row[not(@total='yes')]">
                                                                                                            <tr>
                                                                                                                <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                                                                                <input type="hidden" name="p_id_page_fk" value="{id_page}"/>
                                                                                                                <input type="hidden" name="p_id_page_fk_desc" value="{id_page_desc}"/>
                                                                                                                <xsl:if test="status_page">
                                                                                                                    <td align="" data-row="{position()}" data-title="{../../label/status_page}" class="bs-checkbox" item-name="status_page">
                                                                                                                        <xsl:if test="status_page != '-0'">
                                                                                                                            <label class="checkbox-switch switch">
                                                                                                                                <input type="checkbox" name="p_status_page" value="{status_page}" check-rel="status_page">
                                                                                                                                    <xsl:if test="status_page_check=status_page">
                                                                                                                                        <xsl:attribute name="checked">checked</xsl:attribute>
                                                                                                                                    </xsl:if>
                                                                                                                                </input>
                                                                                                                                <span class="slider round"/>
                                                                                                                            </label>
                                                                                                                        </xsl:if>
                                                                                                                    </td>
                                                                                                                </xsl:if>
                                                                                                                <xsl:if test="descricao_page">
                                                                                                                    <td align="left" data-row="{position()}" data-title="{../../../fields/descricao_page/label}" class="text" item-name="descricao_page">
                                                                                                                        <span class="">
                                                                                                                            <xsl:value-of select="descricao_page"/>
                                                                                                                        </span>
                                                                                                                    </td>
                                                                                                                </xsl:if>
                                                                                                                <xsl:if test="nome_page">
                                                                                                                    <td align="left" data-row="{position()}" data-title="{../../../fields/nome_page/label}" class="text" item-name="nome_page">
                                                                                                                        <span class="">
                                                                                                                            <xsl:value-of select="nome_page"/>
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
                                                                                    </div>
                                                                                </div>
                                                                            </xsl:if>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                        <div class="gen-column col-sm-4">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/box_1">
                                                    <div class="box igrp-box-holder gen-container-item " gen-class="" item-name="box_1">
                                                        <div class="box-body" gen-preserve-content="true">
                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/box_1/fields"/>
                                                            <div>
                                                                <div class="row " id="row-49425d2a">
                                                                    <div class="gen-column col-sm-12">
                                                                        <div class="gen-inner">
                                                                            <xsl:if test="rows/content/myapps_list">
                                                                                <div class="box box-table-contents gen-container-item " id="myappsTb" gen-class="" item-name="myapps_list">
                                                                                    <xsl:call-template name="box-header">
                                                                                        <xsl:with-param name="title" select="rows/content/myapps_list/@title"/>
                                                                                        <xsl:with-param name="collapsible" select="'true'"/>
                                                                                        <xsl:with-param name="collapsed" select="'false'"/>
                                                                                    </xsl:call-template>
                                                                                    <div class="box-body ">
                                                                                        <xsl:apply-templates mode="form-hidden-fields" select="rows/content/myapps_list/fields"/>
                                                                                        <div class="table-contents-head">
                                                                                            <div class="table-contents-inner"></div>
                                                                                        </div>
                                                                                        <div class="table-box">
                                                                                            <div class="table-box-inner">
                                                                                                <table id="myapps_list" class="table " exports="null">
                                                                                                    <thead>
                                                                                                        <tr>
                                                                                                            <xsl:if test="rows/content/myapps_list/fields/icon">
                                                                                                                <th align="left" class=" gen-fields-holder">
                                                                                                                    <span>
                                                                                                                        <xsl:value-of select="rows/content/myapps_list/fields/icon/label"/>
                                                                                                                    </span>
                                                                                                                </th>
                                                                                                            </xsl:if>
                                                                                                            <xsl:if test="rows/content/myapps_list/fields/aplicacao">
                                                                                                                <th align="left" class=" gen-fields-holder">
                                                                                                                    <span>
                                                                                                                        <xsl:value-of select="rows/content/myapps_list/fields/aplicacao/label"/>
                                                                                                                    </span>
                                                                                                                </th>
                                                                                                            </xsl:if>
                                                                                                        </tr>
                                                                                                    </thead>
                                                                                                    <tbody>
                                                                                                        <xsl:for-each select="rows/content/myapps_list/table/value/row[not(@total='yes')]">
                                                                                                            <tr>
                                                                                                                <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                                                                                <xsl:if test="icon">
                                                                                                                    <td align="left" data-row="{position()}" data-title="{../../fields/icon/label}" class="img" item-name="icon">
                                                                                                                        <img class="table-img" src="{icon}"/>
                                                                                                                    </td>
                                                                                                                </xsl:if>
                                                                                                                <xsl:if test="aplicacao">
                                                                                                                    <td align="left" data-row="{position()}" data-title="{../../label/aplicacao}" class="link" item-name="aplicacao">
                                                                                                                        <xsl:choose>
                                                                                                                            <xsl:when test="aplicacao != ''">
                                                                                                                                <a href="{aplicacao}" class="link bClick btn btn-link " target-fields="" target="_self" name="aplicacao">
                                                                                                                                    <i class="fa fa-link"/>
                                                                                                                                    <span>
                                                                                                                                        <xsl:value-of select="aplicacao_desc"/>
                                                                                                                                    </span>
                                                                                                                                </a>
                                                                                                                            </xsl:when>
                                                                                                                            <xsl:otherwise>
                                                                                                                                <span>
                                                                                                                                    <xsl:value-of select="aplicacao_desc"/>
                                                                                                                                </span>
                                                                                                                            </xsl:otherwise>
                                                                                                                        </xsl:choose>
                                                                                                                    </td>
                                                                                                                </xsl:if>
                                                                                                            </tr>
                                                                                                        </xsl:for-each>
                                                                                                    </tbody>
                                                                                                </table>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/toolsbar_2">
                                                                                <div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder&gt;a.btn" gen-class="" item-name="toolsbar_2">
                                                                                    <div class="btns-holder  btn-group-justified" role="group">
                                                                                        <xsl:apply-templates select="rows/content/toolsbar_2" mode="gen-buttons">
                                                                                            <xsl:with-param name="vertical" select="'true'"/>
                                                                                            <xsl:with-param name="outline" select="'false'"/>
                                                                                        </xsl:apply-templates>
                                                                                    </div>
                                                                                </div>
                                                                            </xsl:if>
                                                                        </div>
                                                                    </div>
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
                    <xsl:call-template name="IGRP-bottom"/>
                </form>
                <!-- FORM JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js?v={$version}"/>
                <!-- TABLE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/table/datatable/jquery.dataTables.min.js?v={$version}"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/datatable/dataTables.bootstrap.min.js?v={$version}"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/igrp.table.js?v={$version}"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/bootstrap-contextmenu.js?v={$version}"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/table.contextmenu.js?v={$version}"/>
                <!-- SELECT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js?v={$version}"/>
                <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js?v={$version}"/>
                <!-- RULES -->
                <script src="{$path}/core/igrp/IGRP.rules.class.js"/>
                <script>
$.IGRP.rules.set({"p_env_fk":[{"name":"Show table","events":"load,change","isTable":false,"conditions":{"rules":[{"condition":"less","value":"1","value2":"10","patern":"","patern_custom":"","opposite":"1"}],"actions":[{"action":"hide","targets":"table_1","procedure":"","request_fields":"","msg_type":"info","msg":""}]}}]},'actionsList');</script>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1516551038603"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1516551038603"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1516551038603"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1516551038603"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1516551038603"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1516551038603"/>
</xsl:stylesheet>
