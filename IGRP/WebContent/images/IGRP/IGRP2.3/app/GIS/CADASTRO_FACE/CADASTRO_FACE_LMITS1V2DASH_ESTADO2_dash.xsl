<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- FORM CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/form/igrp.forms.css"/>
                <!-- SMALLBOX CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/smallbox/smallbox.css"/>
                <!-- CHART CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/highcharts/igrp.charts.css"/>
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
                                                <xsl:if test="rows/content/form_filtro">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_filtro">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/form_filtro/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_filtro/fields"/>
                                                                <xsl:if test="rows/content/form_filtro/fields/ilha">
                                                                    <div class="col-md-2 form-group  gen-fields-holder" item-name="ilha" item-type="select">
                                                                        <label for="{rows/content/form_filtro/fields/ilha/@name}">
                                                                            <xsl:value-of select="rows/content/form_filtro/fields/ilha/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_filtro_ilha" name="{rows/content/form_filtro/fields/ilha/@name}">
                                                                            <xsl:for-each select="rows/content/form_filtro/fields/ilha/list/option">
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
                                                                <xsl:if test="rows/content/form_filtro/fields/cidadezona">
                                                                    <div class="col-md-2 form-group  gen-fields-holder" item-name="cidadezona" item-type="select">
                                                                        <label for="{rows/content/form_filtro/fields/cidadezona/@name}">
                                                                            <xsl:value-of select="rows/content/form_filtro/fields/cidadezona/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_filtro_cidadezona" name="{rows/content/form_filtro/fields/cidadezona/@name}">
                                                                            <xsl:for-each select="rows/content/form_filtro/fields/cidadezona/list/option">
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
                                                                <xsl:if test="rows/content/form_filtro/fields/bairrolugar">
                                                                    <div class="col-md-2 form-group  gen-fields-holder" item-name="bairrolugar" item-type="select">
                                                                        <label for="{rows/content/form_filtro/fields/bairrolugar/@name}">
                                                                            <xsl:value-of select="rows/content/form_filtro/fields/bairrolugar/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_filtro_bairrolugar" name="{rows/content/form_filtro/fields/bairrolugar/@name}">
                                                                            <xsl:for-each select="rows/content/form_filtro/fields/bairrolugar/list/option">
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
                                                                <xsl:if test="rows/content/form_filtro/fields/data_inicio">
                                                                    <div class="form-group col-md-2  gen-fields-holder" item-name="data_inicio" item-type="date">
                                                                        <label for="{rows/content/form_filtro/fields/data_inicio/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_filtro/fields/data_inicio/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_filtro/fields/data_inicio/value}" class="form-control gen-date" id="form_filtro-data_inicio" name="{rows/content/form_filtro/fields/data_inicio/@name}" format="IGRP_datePicker" maxlength="30"/>
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-default">
                                                                                    <i class="fa fa-calendar"/>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_filtro/fields/data_fim">
                                                                    <div class="form-group col-md-2  gen-fields-holder" item-name="data_fim" item-type="date">
                                                                        <label for="{rows/content/form_filtro/fields/data_fim/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_filtro/fields/data_fim/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_filtro/fields/data_fim/value}" class="form-control gen-date" id="form_filtro-data_fim" name="{rows/content/form_filtro/fields/data_fim/@name}" format="IGRP_datePicker" maxlength="30"/>
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-default">
                                                                                    <i class="fa fa-calendar"/>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_filtro/fields/natureza">
                                                                    <div class="col-md-2 form-group  gen-fields-holder" item-name="natureza" item-type="select">
                                                                        <label for="{rows/content/form_filtro/fields/natureza/@name}">
                                                                            <xsl:value-of select="rows/content/form_filtro/fields/natureza/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_filtro_natureza" name="{rows/content/form_filtro/fields/natureza/@name}">
                                                                            <xsl:for-each select="rows/content/form_filtro/fields/natureza/list/option">
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
                                                                <xsl:if test="rows/content/form_filtro/fields/tipo_predio">
                                                                    <div class="col-md-2 form-group  gen-fields-holder" item-name="tipo_predio" item-type="select">
                                                                        <label for="{rows/content/form_filtro/fields/tipo_predio/@name}">
                                                                            <xsl:value-of select="rows/content/form_filtro/fields/tipo_predio/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_filtro_tipo_predio" name="{rows/content/form_filtro/fields/tipo_predio/@name}">
                                                                            <xsl:for-each select="rows/content/form_filtro/fields/tipo_predio/list/option">
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
                                                                <xsl:if test="rows/content/form_filtro/fields/etapa">
                                                                    <div class="col-md-2 form-group  gen-fields-holder" item-name="etapa" item-type="select">
                                                                        <label for="{rows/content/form_filtro/fields/etapa/@name}">
                                                                            <xsl:value-of select="rows/content/form_filtro/fields/etapa/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_filtro_etapa" name="{rows/content/form_filtro/fields/etapa/@name}">
                                                                            <xsl:for-each select="rows/content/form_filtro/fields/etapa/list/option">
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
                                                                <xsl:if test="rows/content/form_filtro/fields/utilizador">
                                                                    <div class="col-md-2 form-group  gen-fields-holder" item-name="utilizador" item-type="select">
                                                                        <label for="{rows/content/form_filtro/fields/utilizador/@name}">
                                                                            <xsl:value-of select="rows/content/form_filtro/fields/utilizador/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_filtro_utilizador" name="{rows/content/form_filtro/fields/utilizador/@name}">
                                                                            <xsl:for-each select="rows/content/form_filtro/fields/utilizador/list/option">
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
                                                        <xsl:apply-templates select="rows/content/form_filtro/tools-bar" mode="form-buttons"/>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="gen-column col-md-3">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/sb_total_proc">
                                                    <div class="small-box panel {rows/content/sb_total_proc/fields/sb_total_proc_bg/value} gen-container-item " gen-class="" item-name="sb_total_proc">
                                                        <div class="panel-heading clearfix">
                                                            <div class="sb-icon">
                                                                <i class="fa {rows/content/sb_total_proc/fields/sb_total_proc_icn/value} fa-3x"/>
                                                            </div>
                                                            <div class="col-xs-12 text-right pull-right sb-contents">
                                                                <div class="huge">
                                                                    <xsl:value-of select="rows/content/sb_total_proc/fields/sb_total_proc_val/value"/>
                                                                </div>
                                                                <div>
                                                                    <xsl:value-of select="rows/content/sb_total_proc/fields/sb_total_proc_tit/value"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <xsl:if test="rows/content/sb_total_proc/fields/sb_total_proc_lbl/value and rows/content/sb_total_proc/fields/sb_total_proc_lbl/value != ''">
                                                            <a href="{rows/content/sb_total_proc/fields/sb_total_proc_url/value}" target="modal" class="{rows/content/sb_total_proc/fields/sb_total_proc_bg/value}-text">
                                                                <div class="panel-footer">
                                                                    <span class="pull-left">
                                                                        <xsl:value-of select="rows/content/sb_total_proc/fields/sb_total_proc_lbl/value"/>
                                                                    </span>
                                                                    <span class="pull-right">
                                                                        <i class="fa fa-arrow-circle-right"/>
                                                                    </span>
                                                                    <div class="clearfix"/></div>
                                                            </a>
                                                        </xsl:if>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                        <div class="gen-column col-md-3">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/sb_parecer">
                                                    <div class="small-box panel {rows/content/sb_parecer/fields/sb_parecer_bg/value} gen-container-item " gen-class="" item-name="sb_parecer">
                                                        <div class="panel-heading clearfix">
                                                            <div class="sb-icon">
                                                                <i class="fa {rows/content/sb_parecer/fields/sb_parecer_icn/value} fa-3x"/>
                                                            </div>
                                                            <div class="col-xs-12 text-right pull-right sb-contents">
                                                                <div class="huge">
                                                                    <xsl:value-of select="rows/content/sb_parecer/fields/sb_parecer_val/value"/>
                                                                </div>
                                                                <div>
                                                                    <xsl:value-of select="rows/content/sb_parecer/fields/sb_parecer_tit/value"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <xsl:if test="rows/content/sb_parecer/fields/sb_parecer_lbl/value and rows/content/sb_parecer/fields/sb_parecer_lbl/value != ''">
                                                            <a href="{rows/content/sb_parecer/fields/sb_parecer_url/value}" target="modal" class="{rows/content/sb_parecer/fields/sb_parecer_bg/value}-text">
                                                                <div class="panel-footer">
                                                                    <span class="pull-left">
                                                                        <xsl:value-of select="rows/content/sb_parecer/fields/sb_parecer_lbl/value"/>
                                                                    </span>
                                                                    <span class="pull-right">
                                                                        <i class="fa fa-arrow-circle-right"/>
                                                                    </span>
                                                                    <div class="clearfix"/></div>
                                                            </a>
                                                        </xsl:if>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                        <div class="gen-column col-md-3">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/sb_recur">
                                                    <div class="small-box panel {rows/content/sb_recur/fields/sb_recur_bg/value} gen-container-item " gen-class="" item-name="sb_recur">
                                                        <div class="panel-heading clearfix">
                                                            <div class="sb-icon">
                                                                <i class="fa {rows/content/sb_recur/fields/sb_recur_icn/value} fa-3x"/>
                                                            </div>
                                                            <div class="col-xs-12 text-right pull-right sb-contents">
                                                                <div class="huge">
                                                                    <xsl:value-of select="rows/content/sb_recur/fields/sb_recur_val/value"/>
                                                                </div>
                                                                <div>
                                                                    <xsl:value-of select="rows/content/sb_recur/fields/sb_recur_tit/value"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <xsl:if test="rows/content/sb_recur/fields/sb_recur_lbl/value and rows/content/sb_recur/fields/sb_recur_lbl/value != ''">
                                                            <a href="{rows/content/sb_recur/fields/sb_recur_url/value}" target="modal" class="{rows/content/sb_recur/fields/sb_recur_bg/value}-text">
                                                                <div class="panel-footer">
                                                                    <span class="pull-left">
                                                                        <xsl:value-of select="rows/content/sb_recur/fields/sb_recur_lbl/value"/>
                                                                    </span>
                                                                    <span class="pull-right">
                                                                        <i class="fa fa-arrow-circle-right"/>
                                                                    </span>
                                                                    <div class="clearfix"/></div>
                                                            </a>
                                                        </xsl:if>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                        <div class="gen-column col-md-3">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/sb_pendente">
                                                    <div class="small-box panel {rows/content/sb_pendente/fields/sb_pendente_bg/value} gen-container-item " gen-class="" item-name="sb_pendente">
                                                        <div class="panel-heading clearfix">
                                                            <div class="sb-icon">
                                                                <i class="fa {rows/content/sb_pendente/fields/sb_pendente_icn/value} fa-3x"/>
                                                            </div>
                                                            <div class="col-xs-12 text-right pull-right sb-contents">
                                                                <div class="huge">
                                                                    <xsl:value-of select="rows/content/sb_pendente/fields/sb_pendente_val/value"/>
                                                                </div>
                                                                <div>
                                                                    <xsl:value-of select="rows/content/sb_pendente/fields/sb_pendente_tit/value"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <xsl:if test="rows/content/sb_pendente/fields/sb_pendente_lbl/value and rows/content/sb_pendente/fields/sb_pendente_lbl/value != ''">
                                                            <a href="{rows/content/sb_pendente/fields/sb_pendente_url/value}" target="modal" class="{rows/content/sb_pendente/fields/sb_pendente_bg/value}-text">
                                                                <div class="panel-footer">
                                                                    <span class="pull-left">
                                                                        <xsl:value-of select="rows/content/sb_pendente/fields/sb_pendente_lbl/value"/>
                                                                    </span>
                                                                    <span class="pull-right">
                                                                        <i class="fa fa-arrow-circle-right"/>
                                                                    </span>
                                                                    <div class="clearfix"/></div>
                                                            </a>
                                                        </xsl:if>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="gen-column col-md-7">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/chart_parecer_users">
                                                    <div class="box gen-container-item " gen-structure="graphic" gen-class="" item-name="chart_parecer_users">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/chart_parecer_users/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <xsl:call-template name="igrp-graph">
                                                                <xsl:with-param name="table" select="rows/content/chart_parecer_users"/>
                                                                <xsl:with-param name="chart_type" select="'bar'"/>
                                                                <xsl:with-param name="height" select="'250'"/>
                                                                <xsl:with-param name="title" select="'Parecer de Utilizadores'"/>
                                                                <xsl:with-param name="url" select="rows/content/chart_parecer_users/url"/>
                                                            </xsl:call-template>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                        <div class="gen-column col-md-5">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/zonas_em_avaliacao">
                                                    <div class="box box-table-contents gen-container-item " gen-class="" item-name="zonas_em_avaliacao">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/zonas_em_avaliacao/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body table-box">
                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/zonas_em_avaliacao/fields"/>
                                                            <table id="zonas_em_avaliacao" class="table table-striped gen-data-table ">
                                                                <thead>
                                                                    <tr>
                                                                        <xsl:if test="rows/content/zonas_em_avaliacao/fields/zona">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/zonas_em_avaliacao/fields/zona/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/zonas_em_avaliacao/fields/predios">
                                                                            <th align="right" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/zonas_em_avaliacao/fields/predios/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/zonas_em_avaliacao/fields/percent_area">
                                                                            <th align="right" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/zonas_em_avaliacao/fields/percent_area/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/zonas_em_avaliacao/table/value/row">
                                                                        <tr>
                                                                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                                            <xsl:if test="zona">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/zona/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="zona"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="predios">
                                                                                <td align="right" data-row="{position()}" data-title="{../../fields/predios/label}" class="number">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="predios"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="percent_area">
                                                                                <td align="right" data-row="{position()}" data-title="{../../fields/percent_area/label}" class="number">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="percent_area"/>
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
                                    <div class="row">
                                        <div class="gen-column col-md-4">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/chart_predios_genero">
                                                    <div class="box gen-container-item " gen-structure="graphic" gen-class="" item-name="chart_predios_genero">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/chart_predios_genero/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <xsl:call-template name="igrp-graph">
                                                                <xsl:with-param name="table" select="rows/content/chart_predios_genero"/>
                                                                <xsl:with-param name="chart_type" select="'column'"/>
                                                                <xsl:with-param name="height" select="'250'"/>
                                                                <xsl:with-param name="title" select="'Predios Por Genero'"/>
                                                                <xsl:with-param name="url" select="rows/content/chart_predios_genero/url"/>
                                                            </xsl:call-template>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                        <div class="gen-column col-md-4">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/chart_terreno_fracao">
                                                    <div class="box gen-container-item " gen-structure="graphic" gen-class="" item-name="chart_terreno_fracao">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/chart_terreno_fracao/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <xsl:call-template name="igrp-graph">
                                                                <xsl:with-param name="table" select="rows/content/chart_terreno_fracao"/>
                                                                <xsl:with-param name="chart_type" select="'pie'"/>
                                                                <xsl:with-param name="height" select="'250'"/>
                                                                <xsl:with-param name="title" select="'Terrenos Vs Fração'"/>
                                                                <xsl:with-param name="url" select="rows/content/chart_terreno_fracao/url"/>
                                                            </xsl:call-template>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                        <div class="gen-column col-md-4">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/chart_predios_natureza">
                                                    <div class="box gen-container-item " gen-structure="graphic" gen-class="" item-name="chart_predios_natureza">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/chart_predios_natureza/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <xsl:call-template name="igrp-graph">
                                                                <xsl:with-param name="table" select="rows/content/chart_predios_natureza"/>
                                                                <xsl:with-param name="chart_type" select="'pie'"/>
                                                                <xsl:with-param name="height" select="'250'"/>
                                                                <xsl:with-param name="title" select="'Predios Por Natureza'"/>
                                                                <xsl:with-param name="url" select="rows/content/chart_predios_natureza/url"/>
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
                <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js"/>
                <!-- CHART JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/highcharts/highcharts.js"/>
                <script type="text/javascript" src="{$path}/plugins/highcharts/highcharts-more.js"/>
                <script type="text/javascript" src="{$path}/plugins/highcharts/exporting.js"/>
                <script type="text/javascript" src="{$path}/plugins/highcharts/igrp.charts.js"/>
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
$.IGRP.rules.set({"p_ilha":[{"name":"rulles_ilha","event":"change","condition":"notnull","value":"","value2":"","patern":"","patern_custom":"","action":"remote_combobox","targets":"cidadezona","procedure":"cadastro.stats_config.sql_cidade_zona","msg_type":"","msg":"","opposite":"","isTable":false},{"name":"rulles_ilha1","event":"load","condition":"notnull","value":"","value2":"","patern":"","patern_custom":"","action":"remote_combobox","targets":"cidadezona","procedure":"cadastro.stats_config.sql_cidade_zona","msg_type":"","msg":"","opposite":"","isTable":false},{"name":"rulles_ilha2","event":"change","condition":"null","value":"","value2":"","patern":"","patern_custom":"","action":"remote_combobox","targets":"cidadezona","procedure":"cadastro.stats_config.sql_cidade_zona","msg_type":"","msg":"","opposite":"","isTable":false},{"name":"rulles_ilha3","event":"load","condition":"null","value":"","value2":"","patern":"","patern_custom":"","action":"remote_combobox","targets":"cidadezona","procedure":"cadastro.stats_config.sql_cidade_zona","msg_type":"","msg":"","opposite":"","isTable":false}],"p_cidadezona":[{"name":"rulles_bairro","event":"change","condition":"notnull","value":"","value2":"","patern":"","patern_custom":"","action":"remote_combobox","targets":"bairrolugar","procedure":"cadastro.STATS_CONFIG.SQL_bairro_lugar","msg_type":"","msg":"","opposite":"","isTable":false},{"name":"rulles_bairro1","event":"load","condition":"notnull","value":"","value2":"","patern":"","patern_custom":"","action":"remote_combobox","targets":"bairrolugar","procedure":"cadastro.STATS_CONFIG.SQL_bairro_lugar","msg_type":"","msg":"","opposite":"","isTable":false},{"name":"rulles_bairro2","event":"change","condition":"null","value":"","value2":"","patern":"","patern_custom":"","action":"remote_combobox","targets":"bairrolugar","procedure":"cadastro.STATS_CONFIG.SQL_bairro_lugar","msg_type":"","msg":"","opposite":"","isTable":false},{"name":"rulles_bairro3","event":"load","condition":"null","value":"","value2":"","patern":"","patern_custom":"","action":"remote_combobox","targets":"bairrolugar","procedure":"cadastro.STATS_CONFIG.SQL_bairro_lugar","msg_type":"","msg":"","opposite":"","isTable":false}]});</script>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1486490766245"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1486490766245"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1486490766245"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1486490766245"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1486490766245"/>
    <xsl:include href="../../xsl/tmpl/IGRP-charts.tmpl.xsl?v=1486490766245"/>
    <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1486490766245"/>
</xsl:stylesheet>