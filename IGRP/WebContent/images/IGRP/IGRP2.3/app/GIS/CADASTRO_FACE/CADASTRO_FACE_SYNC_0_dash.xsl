<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
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
                <!-- SELECT CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.min.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.style.css"/>
                <!-- DATE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/datetimepicker/css/datetimepicker.css"/>
                <style/>
            </head>
            <body class="{$bodyClass} sidebar-off">
                <xsl:call-template name="IGRP-topmenu"/>
                <form method="POST" class="IGRP-form" name="formular_default">
                    <div class="container-fluid">
                        <div class="row">
                            <xsl:call-template name="IGRP-sidebar"/>
                            <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
                                <div class="content">
                                    <div class="row">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/page_title">
                                                    <section class="content-header gen-container-item " gen-class="" item-name="page_title">
                                                        <h2>
                                                            <xsl:value-of select="rows/content/page_title/fields/page_title_text/value"/>
                                                        </h2>
                                                    </section>
                                                </xsl:if>
                                                <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/form_1">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/form_1/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                                                <xsl:if test="rows/content/form_1/fields/ilha">
                                                                    <div class="col-md-2 form-group  gen-fields-holder" item-name="ilha" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/ilha/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/ilha/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 IGRP_change" id="form_1_ilha" name="{rows/content/form_1/fields/ilha/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/ilha/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/cidadezona">
                                                                    <div class="col-md-2 form-group  gen-fields-holder" item-name="cidadezona" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/cidadezona/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/cidadezona/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 IGRP_change" id="form_1_cidadezona" name="{rows/content/form_1/fields/cidadezona/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/cidadezona/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/bairrolugar">
                                                                    <div class="col-md-2 form-group  gen-fields-holder" item-name="bairrolugar" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/bairrolugar/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/bairrolugar/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_bairrolugar" name="{rows/content/form_1/fields/bairrolugar/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/bairrolugar/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/data_inicio">
                                                                    <div class="form-group col-md-2  gen-fields-holder" item-name="data_inicio" item-type="date">
                                                                        <label for="{rows/content/form_1/fields/data_inicio/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/data_inicio/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_1/fields/data_inicio/value}" class="form-control gen-date" id="form_1-data_inicio" name="{rows/content/form_1/fields/data_inicio/@name}" format="IGRP_datePicker" maxlength="30"/>
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-default">
                                                                                    <i class="fa fa-calendar"/>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/data_fim">
                                                                    <div class="form-group col-md-2  gen-fields-holder" item-name="data_fim" item-type="date">
                                                                        <label for="{rows/content/form_1/fields/data_fim/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/data_fim/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_1/fields/data_fim/value}" class="form-control gen-date" id="form_1-data_fim" name="{rows/content/form_1/fields/data_fim/@name}" format="IGRP_datePicker" maxlength="30"/>
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-default">
                                                                                    <i class="fa fa-calendar"/>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                            </div>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="gen-column col-md-3">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/sb_total_device">
                                                    <div class="small-box panel {rows/content/sb_total_device/fields/sb_total_device_bg/value} gen-container-item " gen-class="" item-name="sb_total_device">
                                                        <div class="panel-heading clearfix">
                                                            <div class="sb-icon">
                                                                <i class="fa {rows/content/sb_total_device/fields/sb_total_device_icn/value} fa-3x"/>
                                                            </div>
                                                            <div class="col-xs-12 text-right pull-right sb-contents">
                                                                <div class="huge">
                                                                    <xsl:value-of select="rows/content/sb_total_device/fields/sb_total_device_val/value"/>
                                                                </div>
                                                                <div>
                                                                    <xsl:value-of select="rows/content/sb_total_device/fields/sb_total_device_tit/value"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <xsl:if test="rows/content/sb_total_device/fields/sb_total_device_lbl/value and rows/content/sb_total_device/fields/sb_total_device_lbl/value != ''">
                                                            <a href="{rows/content/sb_total_device/fields/sb_total_device_url/value}" target="_self" class="{rows/content/sb_total_device/fields/sb_total_device_bg/value}-text">
                                                                <div class="panel-footer">
                                                                    <span class="pull-left">
                                                                        <xsl:value-of select="rows/content/sb_total_device/fields/sb_total_device_lbl/value"/>
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
                                                <xsl:if test="rows/content/sb_export_device_avg">
                                                    <div class="small-box panel {rows/content/sb_export_device_avg/fields/sb_export_device_avg_bg/value} gen-container-item " gen-class="" item-name="sb_export_device_avg">
                                                        <div class="panel-heading clearfix">
                                                            <div class="sb-icon">
                                                                <i class="fa {rows/content/sb_export_device_avg/fields/sb_export_device_avg_icn/value} fa-3x"/>
                                                            </div>
                                                            <div class="col-xs-12 text-right pull-right sb-contents">
                                                                <div class="huge">
                                                                    <xsl:value-of select="rows/content/sb_export_device_avg/fields/sb_export_device_avg_val/value"/>
                                                                </div>
                                                                <div>
                                                                    <xsl:value-of select="rows/content/sb_export_device_avg/fields/sb_export_device_avg_tit/value"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <xsl:if test="rows/content/sb_export_device_avg/fields/sb_export_device_avg_lbl/value and rows/content/sb_export_device_avg/fields/sb_export_device_avg_lbl/value != ''">
                                                            <a href="{rows/content/sb_export_device_avg/fields/sb_export_device_avg_url/value}" target="_self" class="{rows/content/sb_export_device_avg/fields/sb_export_device_avg_bg/value}-text">
                                                                <div class="panel-footer">
                                                                    <span class="pull-left">
                                                                        <xsl:value-of select="rows/content/sb_export_device_avg/fields/sb_export_device_avg_lbl/value"/>
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
                                                <xsl:if test="rows/content/sb_regist_by_export">
                                                    <div class="small-box panel {rows/content/sb_regist_by_export/fields/sb_regist_by_export_bg/value} gen-container-item " gen-class="" item-name="sb_regist_by_export">
                                                        <div class="panel-heading clearfix">
                                                            <div class="sb-icon">
                                                                <i class="fa {rows/content/sb_regist_by_export/fields/sb_regist_by_export_icn/value} fa-3x"/>
                                                            </div>
                                                            <div class="col-xs-12 text-right pull-right sb-contents">
                                                                <div class="huge">
                                                                    <xsl:value-of select="rows/content/sb_regist_by_export/fields/sb_regist_by_export_val/value"/>
                                                                </div>
                                                                <div>
                                                                    <xsl:value-of select="rows/content/sb_regist_by_export/fields/sb_regist_by_export_tit/value"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <xsl:if test="rows/content/sb_regist_by_export/fields/sb_regist_by_export_lbl/value and rows/content/sb_regist_by_export/fields/sb_regist_by_export_lbl/value != ''">
                                                            <a href="{rows/content/sb_regist_by_export/fields/sb_regist_by_export_url/value}" target="_self" class="{rows/content/sb_regist_by_export/fields/sb_regist_by_export_bg/value}-text">
                                                                <div class="panel-footer">
                                                                    <span class="pull-left">
                                                                        <xsl:value-of select="rows/content/sb_regist_by_export/fields/sb_regist_by_export_lbl/value"/>
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
                                                <xsl:if test="rows/content/sb_sync_by_record">
                                                    <div class="small-box panel {rows/content/sb_sync_by_record/fields/sb_sync_by_record_bg/value} gen-container-item " gen-class="" item-name="sb_sync_by_record">
                                                        <div class="panel-heading clearfix">
                                                            <div class="sb-icon">
                                                                <i class="fa {rows/content/sb_sync_by_record/fields/sb_sync_by_record_icn/value} fa-3x"/>
                                                            </div>
                                                            <div class="col-xs-12 text-right pull-right sb-contents">
                                                                <div class="huge">
                                                                    <xsl:value-of select="rows/content/sb_sync_by_record/fields/sb_sync_by_record_val/value"/>
                                                                </div>
                                                                <div>
                                                                    <xsl:value-of select="rows/content/sb_sync_by_record/fields/sb_sync_by_record_tit/value"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <xsl:if test="rows/content/sb_sync_by_record/fields/sb_sync_by_record_lbl/value and rows/content/sb_sync_by_record/fields/sb_sync_by_record_lbl/value != ''">
                                                            <a href="{rows/content/sb_sync_by_record/fields/sb_sync_by_record_url/value}" target="_self" class="{rows/content/sb_sync_by_record/fields/sb_sync_by_record_bg/value}-text">
                                                                <div class="panel-footer">
                                                                    <span class="pull-left">
                                                                        <xsl:value-of select="rows/content/sb_sync_by_record/fields/sb_sync_by_record_lbl/value"/>
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
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/registos_synced">
                                                    <div class="box gen-container-item " gen-structure="graphic" gen-class="" item-name="registos_synced">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/registos_synced/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <xsl:call-template name="igrp-graph">
                                                                <xsl:with-param name="table" select="rows/content/registos_synced"/>
                                                                <xsl:with-param name="chart_type" select="'line'"/>
                                                                <xsl:with-param name="height" select="'250'"/>
                                                                <xsl:with-param name="title" select="'Registos Sincronizados'"/>
                                                                <xsl:with-param name="url" select="rows/content/registos_synced/url"/>
                                                            </xsl:call-template>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="gen-column col-md-6">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/export_evolv">
                                                    <div class="box gen-container-item " gen-structure="graphic" gen-class="" item-name="export_evolv">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/export_evolv/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <xsl:call-template name="igrp-graph">
                                                                <xsl:with-param name="table" select="rows/content/export_evolv"/>
                                                                <xsl:with-param name="chart_type" select="'stackedarea'"/>
                                                                <xsl:with-param name="height" select="'400'"/>
                                                                <xsl:with-param name="title" select="'Evolução de Export'"/>
                                                                <xsl:with-param name="url" select="rows/content/export_evolv/url"/>
                                                            </xsl:call-template>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                        <div class="gen-column col-md-6">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/media_registos_por__tipo">
                                                    <div class="box gen-container-item " gen-structure="graphic" gen-class="" item-name="media_registos_por__tipo">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/media_registos_por__tipo/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <xsl:call-template name="igrp-graph">
                                                                <xsl:with-param name="table" select="rows/content/media_registos_por__tipo"/>
                                                                <xsl:with-param name="chart_type" select="'column'"/>
                                                                <xsl:with-param name="height" select="'400'"/>
                                                                <xsl:with-param name="title" select="'Média de Registos por Conteúdo'"/>
                                                                <xsl:with-param name="url" select="rows/content/media_registos_por__tipo/url"/>
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
                <!-- SELECT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js"/>
                <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js"/>
                <!-- DATE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/datetimepicker.js"/>
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/dtp.init.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1485167529869"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1485167529869"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1485167529869"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1485167529869"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1485167529869"/>
    <xsl:include href="../../xsl/tmpl/IGRP-charts.tmpl.xsl?v=1485167529871"/>
</xsl:stylesheet>