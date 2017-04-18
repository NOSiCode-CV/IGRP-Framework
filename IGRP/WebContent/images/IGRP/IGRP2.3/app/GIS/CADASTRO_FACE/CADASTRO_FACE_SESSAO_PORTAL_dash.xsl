<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" encoding="ISO-8859-1" omit-xml-declaration="yes" method="html" />
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head" />
                <!-- FORM CSS INCLUDES -->
                <link type="text/css" href="{$path}/core/igrp/form/igrp.forms.css" rel="stylesheet" />
                <!-- TOOLSBAR CSS INCLUDES -->
                <link type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css" rel="stylesheet" />
                <!-- SMALLBOX CSS INCLUDES -->
                <link type="text/css" href="{$path}/plugins/smallbox/smallbox.css" rel="stylesheet" />
                <!-- CHART CSS INCLUDES -->
                <link type="text/css" href="{$path}/plugins/highcharts/igrp.charts.css" rel="stylesheet" />
                <!-- SELECT CSS INCLUDES -->
                <link type="text/css" href="{$path}/plugins/select2/select2.min.css" rel="stylesheet" />
                <link type="text/css" href="{$path}/plugins/select2/select2.style.css" rel="stylesheet" />
                <!-- DATE CSS INCLUDES -->
                <link type="text/css" href="{$path}/plugins/datetimepicker/css/datetimepicker.css" rel="stylesheet" />
                <style />
            </head>
            <body class="{$bodyClass} sidebar-off">
                <xsl:call-template name="IGRP-topmenu" />
                <form class="IGRP-form" name="formular_default" method="POST" enctype="multipart/form-data">
                    <div class="container-fluid">
                        <div class="row">
                            <xsl:call-template name="IGRP-sidebar" />
                            <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
                                <div class="content">
                                    <div class="row">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/sectionheader_1">
                                                    <section class="content-header gen-container-item " item-name="sectionheader_1" gen-class="">
                                                        <h2>
                                                            <xsl:value-of select="rows/content/sectionheader_1/fields/sectionheader_1_text/value" />
                                                        </h2>
                                                    </section>
                                                </xsl:if>
                                                <xsl:apply-templates select="rows/content/messages" mode="igrp-messages" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/form_1">
                                                    <div class="box igrp-forms gen-container-item " item-name="form_1" gen-class="">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates select="rows/content/form_1/fields" mode="form-hidden-fields" />
                                                                <xsl:if test="rows/content/form_1/fields/plaintext">
                                                                    <div class="col-md-12  form-group  gen-fields-holder" item-type="plaintext" item-name="plaintext">
                                                                        <xsl:value-of select="rows/content/form_1/fields/plaintext/value" />
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/ilha">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-type="select" item-name="ilha">
                                                                        <label for="{rows/content/form_1/fields/ilha/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/ilha/label" />
                                                                        </label>
                                                                        <select class="form-control select2 " name="{rows/content/form_1/fields/ilha/@name}" id="form_1_ilha">
                                                                            <xsl:for-each select="rows/content/form_1/fields/ilha/list/option">
                                                                                <option label="{text}" value="{value}">
                                                                                    <xsl:if test="@selected='true'">
                                                                                        <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                    </xsl:if>
                                                                                    <span>
                                                                                        <xsl:value-of select="text" />
                                                                                    </span>
                                                                                </option>
                                                                            </xsl:for-each>
                                                                        </select>
                                                                    </div>
                                                                </xsl:if>
                                                            </div>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons" />
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <div class="box igrp-box-holder gen-container-item " item-name="box_1" gen-class="">
                                                    <div class="box-body" gen-preserve-content="true">
                                                        <div>
                                                            <div class="row">
                                                                <div class="gen-column col-md-6">
                                                                    <div class="gen-inner">
                                                                        <xsl:if test="rows/content/toolsbar_1">
                                                                            <div class="toolsbar-holder boxed gen-container-item " gen-fields=".btns-holder a.btn" item-name="toolsbar_1" gen-class="" gen-structure="toolsbar">
                                                                                <div role="group" class="btns-holder  pull-right">
                                                                                    <xsl:apply-templates select="rows/content/toolsbar_1" mode="gen-buttons">
                                                                                        <xsl:with-param name="vertical" select="'true'" />
                                                                                    </xsl:apply-templates>
                                                                                </div>
                                                                            </div>
                                                                        </xsl:if>
                                                                    </div>
                                                                </div>
                                                                <div class="gen-column col-md-6">
                                                                    <div class="gen-inner">
                                                                        <xsl:if test="rows/content/form_2">
                                                                            <div class="box igrp-forms gen-container-item " item-name="form_2" gen-class="">
                                                                                <div class="box-body">
                                                                                    <div role="form">
                                                                                        <xsl:apply-templates select="rows/content/form_2/fields" mode="form-hidden-fields" />
                                                                                        <xsl:if test="rows/content/form_2/fields/data_inicio">
                                                                                            <div class="form-group col-md-6  gen-fields-holder" item-type="date" item-name="data_inicio">
                                                                                                <label for="{rows/content/form_2/fields/data_inicio/@name}">
                                                                                                    <span>
                                                                                                        <xsl:value-of select="rows/content/form_2/fields/data_inicio/label" />
                                                                                                    </span>
                                                                                                </label>
                                                                                                <div class="input-group">
                                                                                                    <input type="text" class="form-control gen-date" name="{rows/content/form_2/fields/data_inicio/@name}" value="{rows/content/form_2/fields/data_inicio/value}" id="form_2-data_inicio" maxlength="30" format="IGRP_datePicker" />
                                                                                                    <span class="input-group-btn gen-date-icon">
                                                                                                        <span class="btn btn-default">
                                                                                                            <i class="fa fa-calendar" />
                                                                                                        </span>
                                                                                                    </span>
                                                                                                </div>
                                                                                            </div>
                                                                                        </xsl:if>
                                                                                        <xsl:if test="rows/content/form_2/fields/data_fim">
                                                                                            <div class="form-group col-md-6  gen-fields-holder" item-type="date" item-name="data_fim">
                                                                                                <label for="{rows/content/form_2/fields/data_fim/@name}">
                                                                                                    <span>
                                                                                                        <xsl:value-of select="rows/content/form_2/fields/data_fim/label" />
                                                                                                    </span>
                                                                                                </label>
                                                                                                <div class="input-group">
                                                                                                    <input type="text" class="form-control gen-date" name="{rows/content/form_2/fields/data_fim/@name}" value="{rows/content/form_2/fields/data_fim/value}" id="form_2-data_fim" maxlength="30" format="IGRP_datePicker" />
                                                                                                    <span class="input-group-btn gen-date-icon">
                                                                                                        <span class="btn btn-default">
                                                                                                            <i class="fa fa-calendar" />
                                                                                                        </span>
                                                                                                    </span>
                                                                                                </div>
                                                                                            </div>
                                                                                        </xsl:if>
                                                                                    </div>
                                                                                </div>
                                                                                <xsl:apply-templates select="rows/content/form_2/tools-bar" mode="form-buttons" />
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
                                    <div class="row">
                                        <div class="gen-column col-md-3">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/smallbox_1">
                                                    <div class="small-box panel {rows/content/smallbox_1/fields/smallbox_1_bg/value} gen-container-item " item-name="smallbox_1" gen-class="">
                                                        <div class="panel-heading clearfix">
                                                            <div class="sb-icon">
                                                                <i class="fa {rows/content/smallbox_1/fields/smallbox_1_icn/value} fa-3x" />
                                                            </div>
                                                            <div class="col-xs-12 text-right pull-right sb-contents">
                                                                <div class="huge">
                                                                    <xsl:value-of select="rows/content/smallbox_1/fields/smallbox_1_val/value" />
                                                                </div>
                                                                <div>
                                                                    <xsl:value-of select="rows/content/smallbox_1/fields/smallbox_1_tit/value" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <xsl:if test="rows/content/smallbox_1/fields/smallbox_1_lbl/value and rows/content/smallbox_1/fields/smallbox_1_lbl/value != ''">
                                                            <a href="{rows/content/smallbox_1/fields/smallbox_1_url/value}" class="{rows/content/smallbox_1/fields/smallbox_1_bg/value}-text" target="modal">
                                                                <div class="panel-footer">
                                                                    <span class="pull-left">
                                                                        <xsl:value-of select="rows/content/smallbox_1/fields/smallbox_1_lbl/value" />
                                                                    </span>
                                                                    <span class="pull-right">
                                                                        <i class="fa fa-arrow-circle-right" />
                                                                    </span>
                                                                    <div class="clearfix" /></div>
                                                            </a>
                                                        </xsl:if>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                        <div class="gen-column col-md-3">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/smallbox_4">
                                                    <div class="small-box panel {rows/content/smallbox_4/fields/smallbox_4_bg/value} gen-container-item " item-name="smallbox_4" gen-class="">
                                                        <div class="panel-heading clearfix">
                                                            <div class="sb-icon">
                                                                <i class="fa {rows/content/smallbox_4/fields/smallbox_4_icn/value} fa-3x" />
                                                            </div>
                                                            <div class="col-xs-12 text-right pull-right sb-contents">
                                                                <div class="huge">
                                                                    <xsl:value-of select="rows/content/smallbox_4/fields/smallbox_4_val/value" />
                                                                </div>
                                                                <div>
                                                                    <xsl:value-of select="rows/content/smallbox_4/fields/smallbox_4_tit/value" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <xsl:if test="rows/content/smallbox_4/fields/smallbox_4_lbl/value and rows/content/smallbox_4/fields/smallbox_4_lbl/value != ''">
                                                            <a href="{rows/content/smallbox_4/fields/smallbox_4_url/value}" class="{rows/content/smallbox_4/fields/smallbox_4_bg/value}-text" target="modal">
                                                                <div class="panel-footer">
                                                                    <span class="pull-left">
                                                                        <xsl:value-of select="rows/content/smallbox_4/fields/smallbox_4_lbl/value" />
                                                                    </span>
                                                                    <span class="pull-right">
                                                                        <i class="fa fa-arrow-circle-right" />
                                                                    </span>
                                                                    <div class="clearfix" /></div>
                                                            </a>
                                                        </xsl:if>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                        <div class="gen-column col-md-3">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/smallbox_3">
                                                    <div class="small-box panel {rows/content/smallbox_3/fields/smallbox_3_bg/value} gen-container-item " item-name="smallbox_3" gen-class="">
                                                        <div class="panel-heading clearfix">
                                                            <div class="sb-icon">
                                                                <i class="fa {rows/content/smallbox_3/fields/smallbox_3_icn/value} fa-3x" />
                                                            </div>
                                                            <div class="col-xs-12 text-right pull-right sb-contents">
                                                                <div class="huge">
                                                                    <xsl:value-of select="rows/content/smallbox_3/fields/smallbox_3_val/value" />
                                                                </div>
                                                                <div>
                                                                    <xsl:value-of select="rows/content/smallbox_3/fields/smallbox_3_tit/value" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <xsl:if test="rows/content/smallbox_3/fields/smallbox_3_lbl/value and rows/content/smallbox_3/fields/smallbox_3_lbl/value != ''">
                                                            <a href="{rows/content/smallbox_3/fields/smallbox_3_url/value}" class="{rows/content/smallbox_3/fields/smallbox_3_bg/value}-text" target="modal">
                                                                <div class="panel-footer">
                                                                    <span class="pull-left">
                                                                        <xsl:value-of select="rows/content/smallbox_3/fields/smallbox_3_lbl/value" />
                                                                    </span>
                                                                    <span class="pull-right">
                                                                        <i class="fa fa-arrow-circle-right" />
                                                                    </span>
                                                                    <div class="clearfix" /></div>
                                                            </a>
                                                        </xsl:if>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                        <div class="gen-column col-md-3">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/smallbox_5">
                                                    <div class="small-box panel {rows/content/smallbox_5/fields/smallbox_5_bg/value} gen-container-item " item-name="smallbox_5" gen-class="">
                                                        <div class="panel-heading clearfix">
                                                            <div class="sb-icon">
                                                                <i class="fa {rows/content/smallbox_5/fields/smallbox_5_icn/value} fa-3x" />
                                                            </div>
                                                            <div class="col-xs-12 text-right pull-right sb-contents">
                                                                <div class="huge">
                                                                    <xsl:value-of select="rows/content/smallbox_5/fields/smallbox_5_val/value" />
                                                                </div>
                                                                <div>
                                                                    <xsl:value-of select="rows/content/smallbox_5/fields/smallbox_5_tit/value" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <xsl:if test="rows/content/smallbox_5/fields/smallbox_5_lbl/value and rows/content/smallbox_5/fields/smallbox_5_lbl/value != ''">
                                                            <a href="{rows/content/smallbox_5/fields/smallbox_5_url/value}" class="{rows/content/smallbox_5/fields/smallbox_5_bg/value}-text" target="modal">
                                                                <div class="panel-footer">
                                                                    <span class="pull-left">
                                                                        <xsl:value-of select="rows/content/smallbox_5/fields/smallbox_5_lbl/value" />
                                                                    </span>
                                                                    <span class="pull-right">
                                                                        <i class="fa fa-arrow-circle-right" />
                                                                    </span>
                                                                    <div class="clearfix" /></div>
                                                            </a>
                                                        </xsl:if>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="gen-column col-md-6">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/chart_1">
                                                    <div class="box gen-container-item " item-name="chart_1" gen-class="" gen-structure="graphic">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/chart_1/@title" />
                                                            <xsl:with-param name="collapsible" select="'true'" />
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <xsl:call-template name="igrp-graph">
                                                                <xsl:with-param name="table" select="rows/content/chart_1" />
                                                                <xsl:with-param name="chart_type" select="'column'" />
                                                                <xsl:with-param name="height" select="'250'" />
                                                                <xsl:with-param name="title" select="'Utilizadores'" />
                                                                <xsl:with-param name="url" select="rows/content/chart_1/url" />
                                                            </xsl:call-template>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                        <div class="gen-column col-md-6">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/chart_2">
                                                    <div class="box gen-container-item " item-name="chart_2" gen-class="" gen-structure="graphic">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/chart_2/@title" />
                                                            <xsl:with-param name="collapsible" select="'true'" />
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <xsl:call-template name="igrp-graph">
                                                                <xsl:with-param name="table" select="rows/content/chart_2" />
                                                                <xsl:with-param name="chart_type" select="'column'" />
                                                                <xsl:with-param name="height" select="'250'" />
                                                                <xsl:with-param name="title" select="'Utilizadores Por Perfil'" />
                                                                <xsl:with-param name="url" select="rows/content/chart_2/url" />
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
                                                <xsl:if test="rows/content/chart_4">
                                                    <div class="box gen-container-item " item-name="chart_4" gen-class="" gen-structure="graphic">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/chart_4/@title" />
                                                            <xsl:with-param name="collapsible" select="'true'" />
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <xsl:call-template name="igrp-graph">
                                                                <xsl:with-param name="table" select="rows/content/chart_4" />
                                                                <xsl:with-param name="chart_type" select="'bar'" />
                                                                <xsl:with-param name="height" select="'250'" />
                                                                <xsl:with-param name="title" select="'Média de Permanencia'" />
                                                                <xsl:with-param name="url" select="rows/content/chart_4/url" />
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
                    <xsl:call-template name="IGRP-bottom" />
                </form>
                <!-- FORM JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js" />
                <!-- CHART JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/highcharts/highcharts.js" />
                <script type="text/javascript" src="{$path}/plugins/highcharts/highcharts-more.js" />
                <script type="text/javascript" src="{$path}/plugins/highcharts/exporting.js" />
                <script type="text/javascript" src="{$path}/plugins/highcharts/igrp.charts.js" />
                <!-- SELECT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js" />
                <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js" />
                <!-- DATE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/datetimepicker.js" />
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/dtp.init.js" />
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1485434908472" />
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1485434908472" />
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1485434908472" />
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1485434908472" />
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1485434908472" />
    <xsl:include href="../../xsl/tmpl/IGRP-charts.tmpl.xsl?v=1485434908473" />
</xsl:stylesheet>