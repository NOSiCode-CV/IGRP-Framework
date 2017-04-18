<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- FORM CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/form/igrp.forms.css"/>
                <!-- CIRCLESTATBOX CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/circlestatbox/circlestatbox.css"/>
                <!-- TABLE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css"/>
                <!-- SELECT CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.min.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.style.css"/>
                <!-- DATE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/datetimepicker/css/datetimepicker.css"/>
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
                                    <div class="row">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="gen-column col-1-1">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/page_title">
                                                    <section class="content-header gen-container-item " gen-class="" item-name="page_title">
                                                        <h2>
                                                            <xsl:value-of select="rows/content/page_title/fields/page_title_text/value"/>
                                                        </h2>
                                                    </section>
                                                </xsl:if>
                                                <xsl:if test="rows/content/filtro">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="filtro">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/filtro/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/filtro/fields"/>
                                                                <xsl:if test="rows/content/filtro/fields/ilha">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="ilha" item-type="select">
                                                                        <label for="{rows/content/filtro/fields/ilha/@name}">
                                                                            <xsl:value-of select="rows/content/filtro/fields/ilha/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="filtro_ilha" name="{rows/content/filtro/fields/ilha/@name}">
                                                                            <xsl:for-each select="rows/content/filtro/fields/ilha/list/option">
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
                                                                <xsl:if test="rows/content/filtro/fields/cidadezona">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="cidadezona" item-type="select">
                                                                        <label for="{rows/content/filtro/fields/cidadezona/@name}">
                                                                            <xsl:value-of select="rows/content/filtro/fields/cidadezona/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="filtro_cidadezona" name="{rows/content/filtro/fields/cidadezona/@name}">
                                                                            <xsl:for-each select="rows/content/filtro/fields/cidadezona/list/option">
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
                                                                <xsl:if test="rows/content/filtro/fields/bairrolugar">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="bairrolugar" item-type="select">
                                                                        <label for="{rows/content/filtro/fields/bairrolugar/@name}">
                                                                            <xsl:value-of select="rows/content/filtro/fields/bairrolugar/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="filtro_bairrolugar" name="{rows/content/filtro/fields/bairrolugar/@name}">
                                                                            <xsl:for-each select="rows/content/filtro/fields/bairrolugar/list/option">
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
                                                                <xsl:if test="rows/content/filtro/fields/data_inicio">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="data_inicio" item-type="date">
                                                                        <label for="{rows/content/filtro/fields/data_inicio/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/filtro/fields/data_inicio/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/filtro/fields/data_inicio/value}" class="form-control gen-date" id="filtro-data_inicio" name="{rows/content/filtro/fields/data_inicio/@name}" format="IGRP_datePicker" maxlength="30"/>
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-default">
                                                                                    <i class="fa fa-calendar"/>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/filtro/fields/data_fim">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="data_fim" item-type="date">
                                                                        <label for="{rows/content/filtro/fields/data_fim/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/filtro/fields/data_fim/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/filtro/fields/data_fim/value}" class="form-control gen-date" id="filtro-data_fim" name="{rows/content/filtro/fields/data_fim/@name}" format="IGRP_datePicker" maxlength="30"/>
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-default">
                                                                                    <i class="fa fa-calendar"/>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/filtro/fields/natureza">
                                                                    <div class="col-md-2 form-group  gen-fields-holder" item-name="natureza" item-type="select">
                                                                        <label for="{rows/content/filtro/fields/natureza/@name}">
                                                                            <xsl:value-of select="rows/content/filtro/fields/natureza/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="filtro_natureza" name="{rows/content/filtro/fields/natureza/@name}">
                                                                            <xsl:for-each select="rows/content/filtro/fields/natureza/list/option">
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
                                                                <xsl:if test="rows/content/filtro/fields/tipo_predio">
                                                                    <div class="col-md-2 form-group  gen-fields-holder" item-name="tipo_predio" item-type="select">
                                                                        <label for="{rows/content/filtro/fields/tipo_predio/@name}">
                                                                            <xsl:value-of select="rows/content/filtro/fields/tipo_predio/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="filtro_tipo_predio" name="{rows/content/filtro/fields/tipo_predio/@name}">
                                                                            <xsl:for-each select="rows/content/filtro/fields/tipo_predio/list/option">
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
                                                        <xsl:apply-templates select="rows/content/filtro/tools-bar" mode="form-buttons"/>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="gen-column col-md-6">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/circl_pol_sem_ev">
                                                    <div class="circlestatbox-container gen-container-item " gen-class="" item-name="circl_pol_sem_ev">
                                                        <div class="circlestatbox {rows/content/circl_pol_sem_ev/fields/circl_pol_sem_ev_bg/value}">
                                                            <div class="header">
                                                                <xsl:value-of select="rows/content/circl_pol_sem_ev/fields/circl_pol_sem_ev_tit/value"/>
                                                            </div>
                                                            <span class="percent">
                                                                <xsl:value-of select="rows/content/circl_pol_sem_ev/fields/circl_pol_sem_ev_lbl/value"/>
                                                            </span>
                                                            <div class="circleStat">
                                                                <input type="text" value="{rows/content/circl_pol_sem_ev/fields/circl_pol_sem_ev_val/value}" class="circlestats-chart" readonly="readonly"/>
                                                            </div>
                                                            <div class="footer">
                                                                <a class="clickable" target="modal" style="display: block;" href="{rows/content/circl_pol_sem_ev/fields/circl_pol_sem_ev_url/value}">
                                                                    <span class="description">
                                                                        <xsl:value-of select="rows/content/circl_pol_sem_ev/fields/circl_pol_sem_ev_desc/value"/>
                                                                    </span>
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                        <div class="gen-column col-md-6">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/circl_pol_mat">
                                                    <div class="circlestatbox-container gen-container-item " gen-class="" item-name="circl_pol_mat">
                                                        <div class="circlestatbox {rows/content/circl_pol_mat/fields/circl_pol_mat_bg/value}">
                                                            <div class="header">
                                                                <xsl:value-of select="rows/content/circl_pol_mat/fields/circl_pol_mat_tit/value"/>
                                                            </div>
                                                            <span class="percent">
                                                                <xsl:value-of select="rows/content/circl_pol_mat/fields/circl_pol_mat_lbl/value"/>
                                                            </span>
                                                            <div class="circleStat">
                                                                <input type="text" value="{rows/content/circl_pol_mat/fields/circl_pol_mat_val/value}" class="circlestats-chart" readonly="readonly"/>
                                                            </div>
                                                            <div class="footer">
                                                                <a class="clickable" target="modal" style="display: block;" href="{rows/content/circl_pol_mat/fields/circl_pol_mat_url/value}">
                                                                    <span class="description">
                                                                        <xsl:value-of select="rows/content/circl_pol_mat/fields/circl_pol_mat_desc/value"/>
                                                                    </span>
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="gen-column col-md-6">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/table_2">
                                                    <div class="box box-table-contents gen-container-item " gen-class="" item-name="table_2">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/table_2/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body table-box">
                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/table_2/fields"/>
                                                            <table id="table_2" class="table table-striped gen-data-table ">
                                                                <thead>
                                                                    <tr>
                                                                        <xsl:if test="rows/content/table_2/fields/description">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_2/fields/description/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_2/fields/total_1">
                                                                            <th align="left" class=" gen-fields-holder text-right">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_2/fields/total_1/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/table_2/table/value/row">
                                                                        <tr>
                                                                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                                            <xsl:if test="description">
                                                                                <td align="left" data-row="{position()}" data-title="{../../label/description}" class="link">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="description != ''">
                                                                                            <a href="{description}" class="link bClick" target="_self" name="description">
                                                                                                <xsl:value-of select="description_desc" disable-output-escaping="yes"/>
                                                                                            </a>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <span>
                                                                                                <xsl:value-of select="description_desc" disable-output-escaping="yes"/>
                                                                                            </span>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="total_1">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/total_1/label}" class="text text-right">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="total_1"/>
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
                                        <div class="gen-column col-md-6">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/table_1">
                                                    <div class="box box-table-contents gen-container-item " gen-class="" item-name="table_1">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/table_1/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body table-box">
                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/table_1/fields"/>
                                                            <table id="table_1" class="table table-striped gen-data-table ">
                                                                <thead>
                                                                    <tr>
                                                                        <xsl:if test="rows/content/table_1/fields/descricao">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/descricao/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/total">
                                                                            <th align="left" class=" gen-fields-holder text-right">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/total/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/table_1/table/value/row">
                                                                        <tr>
                                                                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                                            <xsl:if test="descricao">
                                                                                <td align="left" data-row="{position()}" data-title="{../../label/descricao}" class="link">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="descricao != ''">
                                                                                            <a href="{descricao}" class="link bClick" target="modal" name="descricao">
                                                                                                <xsl:value-of select="descricao_desc" disable-output-escaping="yes"/>
                                                                                            </a>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <span>
                                                                                                <xsl:value-of select="descricao_desc" disable-output-escaping="yes"/>
                                                                                            </span>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="total">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/total/label}" class="text text-right">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="total"/>
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
                            </div>
                        </div>
                    </div>
                    <xsl:call-template name="IGRP-bottom"/>
                </form>
                <!-- FORM JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js"/>
                <!-- CIRCLESTATBOX JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/circlestatbox/jquery.knob.modified.js"/>
                <script type="text/javascript" src="{$path}/plugins/circlestatbox/igrp.circlestatbox.init.js"/>
                <!-- TABLE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/table/jquery.dataTables.min.js"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/dataTables.bootstrap.min.js"/>
                <!-- SELECT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js"/>
                <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js"/>
                <!-- DATE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/datetimepicker.js"/>
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/dtp.init.js"/>
                <!-- RULES -->
                <script src="{$path}/core/igrp/IGRP.rules.class.js"/>
                <script>
$.IGRP.rules.set({"p_ilha":[{"name":"ilha","event":"load","condition":"notnull","value":"","value2":"","patern":"","patern_custom":"","action":"remote_combobox","targets":"cidadezona","procedure":"cadastro.stats_config.sql_cidade_zona","msg_type":"","msg":"","opposite":"","isTable":false},{"name":"cidade_change","event":"change","condition":"null","value":"","value2":"","patern":"","patern_custom":"","action":"remote_combobox","targets":"cidadezona","procedure":"cadastro.stats_config.sql_cidade_zona","msg_type":"","msg":"","opposite":"","isTable":false}],"p_cidadezona":[{"name":"cidade_zona","event":"change","condition":"notnull","value":"","value2":"","patern":"","patern_custom":"","action":"remote_combobox","targets":"bairrolugar","procedure":"cadastro.STATS_CONFIG.SQL_bairro_lugar","msg_type":"","msg":"","opposite":"","isTable":false}]});</script>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1486055862951"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1486055862951"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1486055862951"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1486055862951"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1486055862952"/>
    <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1486055862952"/>
</xsl:stylesheet>