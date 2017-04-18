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
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                                                <xsl:if test="rows/content/form_1/fields/aplicacao">
                                                                    <div class="col-md-2 form-group  gen-fields-holder" item-name="aplicacao" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/aplicacao/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/aplicacao/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_aplicacao" name="{rows/content/form_1/fields/aplicacao/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/aplicacao/list/option">
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
                                                                        <select class="form-control select2 " id="form_1_cidadezona" name="{rows/content/form_1/fields/cidadezona/@name}">
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
                                                                <xsl:if test="rows/content/form_1/fields/bairolugar">
                                                                    <div class="col-md-2 form-group  gen-fields-holder" item-name="bairolugar" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/bairolugar/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/bairolugar/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_bairolugar" name="{rows/content/form_1/fields/bairolugar/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/bairolugar/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/atos">
                                                                    <div class="col-md-2 form-group  gen-fields-holder" item-name="atos" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/atos/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/atos/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_atos" name="{rows/content/form_1/fields/atos/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/atos/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/dt_inicio">
                                                                    <div class="form-group col-md-2  gen-fields-holder" item-name="dt_inicio" item-type="date">
                                                                        <label for="{rows/content/form_1/fields/dt_inicio/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/dt_inicio/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_1/fields/dt_inicio/value}" class="form-control gen-date " id="form_1-dt_inicio" name="{rows/content/form_1/fields/dt_inicio/@name}" format="IGRP_datePicker" maxlength="30"/>
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
                                                                            <input type="text" value="{rows/content/form_1/fields/data_fim/value}" class="form-control gen-date " id="form_1-data_fim" name="{rows/content/form_1/fields/data_fim/@name}" format="IGRP_datePicker" maxlength="30"/>
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
                                                <xsl:if test="rows/content/total_pred">
                                                    <div class="small-box panel {rows/content/total_pred/fields/total_pred_bg/value} gen-container-item " gen-class="" item-name="total_pred">
                                                        <div class="panel-heading clearfix">
                                                            <div class="sb-icon">
                                                                <i class="fa {rows/content/total_pred/fields/total_pred_icn/value} fa-3x"/>
                                                            </div>
                                                            <div class="col-xs-12 text-right pull-right sb-contents">
                                                                <div class="huge">
                                                                    <xsl:value-of select="rows/content/total_pred/fields/total_pred_val/value"/>
                                                                </div>
                                                                <div>
                                                                    <xsl:value-of select="rows/content/total_pred/fields/total_pred_tit/value"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <xsl:if test="rows/content/total_pred/fields/total_pred_lbl/value and rows/content/total_pred/fields/total_pred_lbl/value != ''">
                                                            <a href="{rows/content/total_pred/fields/total_pred_url/value}" target="modal" class="{rows/content/total_pred/fields/total_pred_bg/value}-text">
                                                                <div class="panel-footer">
                                                                    <span class="pull-left">
                                                                        <xsl:value-of select="rows/content/total_pred/fields/total_pred_lbl/value"/>
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
                                                <xsl:if test="rows/content/smallbox_2">
                                                    <div class="small-box panel {rows/content/smallbox_2/fields/smallbox_2_bg/value} gen-container-item " gen-class="" item-name="smallbox_2">
                                                        <div class="panel-heading clearfix">
                                                            <div class="sb-icon">
                                                                <i class="fa {rows/content/smallbox_2/fields/smallbox_2_icn/value} fa-3x"/>
                                                            </div>
                                                            <div class="col-xs-12 text-right pull-right sb-contents">
                                                                <div class="huge">
                                                                    <xsl:value-of select="rows/content/smallbox_2/fields/smallbox_2_val/value"/>
                                                                </div>
                                                                <div>
                                                                    <xsl:value-of select="rows/content/smallbox_2/fields/smallbox_2_tit/value"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <xsl:if test="rows/content/smallbox_2/fields/smallbox_2_lbl/value and rows/content/smallbox_2/fields/smallbox_2_lbl/value != ''">
                                                            <a href="{rows/content/smallbox_2/fields/smallbox_2_url/value}" target="modal" class="{rows/content/smallbox_2/fields/smallbox_2_bg/value}-text">
                                                                <div class="panel-footer">
                                                                    <span class="pull-left">
                                                                        <xsl:value-of select="rows/content/smallbox_2/fields/smallbox_2_lbl/value"/>
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
                                                <xsl:if test="rows/content/smallbox_3">
                                                    <div class="small-box panel {rows/content/smallbox_3/fields/smallbox_3_bg/value} gen-container-item " gen-class="" item-name="smallbox_3">
                                                        <div class="panel-heading clearfix">
                                                            <div class="sb-icon">
                                                                <i class="fa {rows/content/smallbox_3/fields/smallbox_3_icn/value} fa-3x"/>
                                                            </div>
                                                            <div class="col-xs-12 text-right pull-right sb-contents">
                                                                <div class="huge">
                                                                    <xsl:value-of select="rows/content/smallbox_3/fields/smallbox_3_val/value"/>
                                                                </div>
                                                                <div>
                                                                    <xsl:value-of select="rows/content/smallbox_3/fields/smallbox_3_tit/value"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <xsl:if test="rows/content/smallbox_3/fields/smallbox_3_lbl/value and rows/content/smallbox_3/fields/smallbox_3_lbl/value != ''">
                                                            <a href="{rows/content/smallbox_3/fields/smallbox_3_url/value}" target="modal" class="{rows/content/smallbox_3/fields/smallbox_3_bg/value}-text">
                                                                <div class="panel-footer">
                                                                    <span class="pull-left">
                                                                        <xsl:value-of select="rows/content/smallbox_3/fields/smallbox_3_lbl/value"/>
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
                                                <xsl:if test="rows/content/smallbox_4">
                                                    <div class="small-box panel {rows/content/smallbox_4/fields/smallbox_4_bg/value} gen-container-item " gen-class="" item-name="smallbox_4">
                                                        <div class="panel-heading clearfix">
                                                            <div class="sb-icon">
                                                                <i class="fa {rows/content/smallbox_4/fields/smallbox_4_icn/value} fa-3x"/>
                                                            </div>
                                                            <div class="col-xs-12 text-right pull-right sb-contents">
                                                                <div class="huge">
                                                                    <xsl:value-of select="rows/content/smallbox_4/fields/smallbox_4_val/value"/>
                                                                </div>
                                                                <div>
                                                                    <xsl:value-of select="rows/content/smallbox_4/fields/smallbox_4_tit/value"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <xsl:if test="rows/content/smallbox_4/fields/smallbox_4_lbl/value and rows/content/smallbox_4/fields/smallbox_4_lbl/value != ''">
                                                            <a href="{rows/content/smallbox_4/fields/smallbox_4_url/value}" target="modal" class="{rows/content/smallbox_4/fields/smallbox_4_bg/value}-text">
                                                                <div class="panel-footer">
                                                                    <span class="pull-left">
                                                                        <xsl:value-of select="rows/content/smallbox_4/fields/smallbox_4_lbl/value"/>
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
                                        <div class="gen-column col-md-5">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/chart_1">
                                                    <div class="box gen-container-item " gen-structure="graphic" gen-class="" item-name="chart_1">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/chart_1/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <xsl:call-template name="igrp-graph">
                                                                <xsl:with-param name="table" select="rows/content/chart_1"/>
                                                                <xsl:with-param name="chart_type" select="rows/content/chart_1/chart_type"/>
                                                                <xsl:with-param name="height" select="'250'"/>
                                                                <xsl:with-param name="title" select="'Performance Utilizador Por Prédios Pedidos'"/>
                                                                <xsl:with-param name="url" select="rows/content/chart_1/url"/>
                                                            </xsl:call-template>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                        <div class="gen-column col-md-7">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/chart_3">
                                                    <div class="box gen-container-item " gen-structure="graphic" gen-class="" item-name="chart_3">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/chart_3/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <xsl:call-template name="igrp-graph">
                                                                <xsl:with-param name="table" select="rows/content/chart_3"/>
                                                                <xsl:with-param name="chart_type" select="rows/content/chart_3/chart_type"/>
                                                                <xsl:with-param name="height" select="'250'"/>
                                                                <xsl:with-param name="title" select="'Evolução de Prédios Pedidos'"/>
                                                                <xsl:with-param name="url" select="rows/content/chart_3/url"/>
                                                            </xsl:call-template>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/chart_2">
                                                    <div class="box gen-container-item " gen-structure="graphic" gen-class="" item-name="chart_2">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/chart_2/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <xsl:call-template name="igrp-graph">
                                                                <xsl:with-param name="table" select="rows/content/chart_2"/>
                                                                <xsl:with-param name="chart_type" select="rows/content/chart_2/chart_type"/>
                                                                <xsl:with-param name="height" select="'250'"/>
                                                                <xsl:with-param name="title" select="'Prédios Pedidos por Localização'"/>
                                                                <xsl:with-param name="url" select="rows/content/chart_2/url"/>
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
                <script type="text/javascript" src="{$path}/plugins/highcharts/funnel.js"/>
                <script type="text/javascript" src="{$path}/plugins/highcharts/igrp.charts.js"/>
                <!-- SELECT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js"/>
                <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js"/>
                <!-- DATE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/datetimepicker.js"/>
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/dtp.init.js"/>
                <!-- RULES -->
                <script src="{$path}/core/igrp/IGRP.rules.class.js"/>
                <script>
$.IGRP.rules.set({"p_aplicacao":[{"name":"Change App","event":"change","condition":"notnull","value":"","value2":"","patern":"","patern_custom":"","action":"remote_combobox","targets":"cidadezona","procedure":"LMITS.LMITS_STATS_CONFIG.SQL_CIDADE_ZONA","msg_type":"","msg":"","opposite":"","isTable":false},{"name":"Load Cidade Zona","event":"load","condition":"notnull","value":"","value2":"","patern":"","patern_custom":"","action":"remote_combobox","targets":"cidadezona","procedure":"LMITS.LMITS_STATS_CONFIG.SQL_CIDADE_ZONA","msg_type":"","msg":"","opposite":"","isTable":false}]});</script>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1491580350349"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1491580350349"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1491580350349"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1491580350349"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1491580350349"/>
    <xsl:include href="../../xsl/tmpl/IGRP-charts.tmpl.xsl?v=1491580350349"/>
</xsl:stylesheet>