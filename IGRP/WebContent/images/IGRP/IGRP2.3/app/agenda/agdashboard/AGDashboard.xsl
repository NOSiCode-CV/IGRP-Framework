<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- FORM CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/form/igrp.forms.css"/>
                <!-- STATBOX CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/statbox/statbox.css"/>
                <!-- CHART CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/highcharts/igrp.charts.css"/>
                <!-- CIRCLESTATBOX CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/circlestatbox/circlestatbox.css"/>
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
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/form_1">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                                                <xsl:if test="rows/content/form_1/fields/entidade">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="entidade" item-type="lookup">
                                                                        <label for="{rows/content/form_1/fields/entidade/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/entidade/label"/>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_1/fields/entidade/value}" class="form-control gen-lookup " id="form_1_entidade" name="{rows/content/form_1/fields/entidade/@name}" maxlength="30"/>
                                                                            <xsl:call-template name="lookup-tool">
                                                                                <xsl:with-param name="page" select="rows/page"/>
                                                                                <xsl:with-param name="ad_hoc" select="'1'"/>
                                                                                <xsl:with-param name="action" select="'LOOKUP'"/>
                                                                                <xsl:with-param name="name" select="rows/content/form_1/fields/entidade/@name"/>
                                                                                <xsl:with-param name="js_lookup" select="rows/content/form_1/fields/entidade/lookup"/>
                                                                                <xsl:with-param name="input-id" select="'form_1_entidade'"/>
                                                                                <xsl:with-param name="btnClass" select="'primary'"/>
                                                                            </xsl:call-template>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/data_de_">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="data_de_" item-type="date">
                                                                        <label for="{rows/content/form_1/fields/data_de_/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/data_de_/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_1/fields/data_de_/value}" class="form-control gen-date " id="form_1-data_de_" name="{rows/content/form_1/fields/data_de_/@name}" format="IGRP_datePicker" maxlength="30"/>
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-primary">
                                                                                    <i class="fa fa-calendar"/>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/data_ate">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="data_ate" item-type="date">
                                                                        <label for="{rows/content/form_1/fields/data_ate/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/data_ate/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_1/fields/data_ate/value}" class="form-control gen-date " id="form_1-data_ate" name="{rows/content/form_1/fields/data_ate/@name}" format="IGRP_datePicker" maxlength="30"/>
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-primary">
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
                                                <div class="box igrp-box-holder gen-container-item " gen-class="" item-name="box_1">
                                                    <div class="box-body" gen-preserve-content="true">
                                                        <div>
                                                            <div class="row">
                                                                <div class="gen-column col-sm-4">
                                                                    <div class="gen-inner">
                                                                        <xsl:if test="rows/content/agendamentos_do_dia">
                                                                            <div class="statbox_container gen-container-item " gen-class="" item-name="agendamentos_do_dia">
                                                                                <div class="statbox {rows/content/agendamentos_do_dia/fields/agendamentos_do_dia_bg/value}">
                                                                                    <div class="boxchart">
                                                                                        <canvas/>
                                                                                    </div>
                                                                                    <div class="number">
                                                                                        <xsl:value-of select="rows/content/agendamentos_do_dia/fields/agendamentos_do_dia_val/value"/>
                                                                                        <i class="fa {rows/content/agendamentos_do_dia/fields/agendamentos_do_dia_icn/value}" aria-hidden="true"/>
                                                                                    </div>
                                                                                    <div class="title">
                                                                                        <xsl:value-of select="rows/content/agendamentos_do_dia/fields/agendamentos_do_dia_tit/value"/>
                                                                                    </div>
                                                                                    <div class="footer">
                                                                                        <a href="{rows/content/agendamentos_do_dia/fields/agendamentos_do_dia_url/value}" target="modal">
                                                                                            <xsl:value-of select="rows/content/agendamentos_do_dia/fields/agendamentos_do_dia_txt/value"/>
                                                                                        </a>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </xsl:if>
                                                                    </div>
                                                                </div>
                                                                <div class="gen-column col-sm-4">
                                                                    <div class="gen-inner">
                                                                        <xsl:if test="rows/content/agendamentos_atendidos">
                                                                            <div class="circlestatbox-container csb-small gen-container-item " gen-class="" item-name="agendamentos_atendidos">
                                                                                <div class="circlestatbox {rows/content/agendamentos_atendidos/fields/agendamentos_atendidos_bg/value}">
                                                                                    <div class="header">
                                                                                        <xsl:value-of select="rows/content/agendamentos_atendidos/fields/agendamentos_atendidos_tit/value"/>
                                                                                    </div>
                                                                                    <span class="percent">
                                                                                        <xsl:value-of select="rows/content/agendamentos_atendidos/fields/agendamentos_atendidos_lbl/value"/>
                                                                                    </span>
                                                                                    <div class="circleStat">
                                                                                        <input type="text" value="{rows/content/agendamentos_atendidos/fields/agendamentos_atendidos_val/value}" size="small" class="circlestats-chart" readonly="readonly"/>
                                                                                    </div>
                                                                                    <div class="footer">
                                                                                        <a class="clickable" target="modal" style="display: block;" href="{rows/content/agendamentos_atendidos/fields/agendamentos_atendidos_url/value}">
                                                                                            <span class="description">
                                                                                                <xsl:value-of select="rows/content/agendamentos_atendidos/fields/agendamentos_atendidos_desc/value"/>
                                                                                            </span>
                                                                                        </a>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </xsl:if>
                                                                    </div>
                                                                </div>
                                                                <div class="gen-column col-sm-4">
                                                                    <div class="gen-inner"/></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <xsl:if test="rows/content/chart_1">
                                                    <div class="box gen-container-item " gen-structure="graphic" gen-class="" item-name="chart_1">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/chart_1/@title"/>
                                                            <xsl:with-param name="collapsible" select="'false'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <xsl:call-template name="igrp-graph">
                                                                <xsl:with-param name="table" select="rows/content/chart_1"/>
                                                                <xsl:with-param name="chart_type" select="rows/content/chart_1/chart_type"/>
                                                                <xsl:with-param name="height" select="'250'"/>
                                                                <xsl:with-param name="title" select="'Agendamentos por balcão'"/>
                                                                <xsl:with-param name="url" select="rows/content/chart_1/url"/>
                                                            </xsl:call-template>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <div class="box igrp-box-holder gen-container-item " gen-class="" item-name="box_2">
                                                    <div class="box-body" gen-preserve-content="true">
                                                        <div>
                                                            <div class="row">
                                                                <div class="gen-column col-sm-6">
                                                                    <div class="gen-inner">
                                                                        <xsl:if test="rows/content/chart_2">
                                                                            <div class="box gen-container-item " gen-structure="graphic" gen-class="" item-name="chart_2">
                                                                                <xsl:call-template name="box-header">
                                                                                    <xsl:with-param name="title" select="rows/content/chart_2/@title"/>
                                                                                    <xsl:with-param name="collapsible" select="'false'"/>
                                                                                </xsl:call-template>
                                                                                <div class="box-body">
                                                                                    <xsl:call-template name="igrp-graph">
                                                                                        <xsl:with-param name="table" select="rows/content/chart_2"/>
                                                                                        <xsl:with-param name="chart_type" select="rows/content/chart_2/chart_type"/>
                                                                                        <xsl:with-param name="height" select="'250'"/>
                                                                                        <xsl:with-param name="title" select="'Agendamentos por assunto'"/>
                                                                                        <xsl:with-param name="url" select="rows/content/chart_2/url"/>
                                                                                    </xsl:call-template>
                                                                                </div>
                                                                            </div>
                                                                        </xsl:if>
                                                                    </div>
                                                                </div>
                                                                <div class="gen-column col-sm-6">
                                                                    <div class="gen-inner">
                                                                        <xsl:if test="rows/content/chart_3">
                                                                            <div class="box gen-container-item " gen-structure="graphic" gen-class="" item-name="chart_3">
                                                                                <xsl:call-template name="box-header">
                                                                                    <xsl:with-param name="title" select="rows/content/chart_3/@title"/>
                                                                                    <xsl:with-param name="collapsible" select="'false'"/>
                                                                                </xsl:call-template>
                                                                                <div class="box-body">
                                                                                    <xsl:call-template name="igrp-graph">
                                                                                        <xsl:with-param name="table" select="rows/content/chart_3"/>
                                                                                        <xsl:with-param name="chart_type" select="rows/content/chart_3/chart_type"/>
                                                                                        <xsl:with-param name="height" select="'250'"/>
                                                                                        <xsl:with-param name="title" select="'Agendamentos por estado'"/>
                                                                                        <xsl:with-param name="url" select="rows/content/chart_3/url"/>
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
                                                <xsl:if test="rows/content/chart_5">
                                                    <div class="box gen-container-item " gen-structure="graphic" gen-class="" item-name="chart_5">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/chart_5/@title"/>
                                                            <xsl:with-param name="collapsible" select="'false'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <xsl:call-template name="igrp-graph">
                                                                <xsl:with-param name="table" select="rows/content/chart_5"/>
                                                                <xsl:with-param name="chart_type" select="rows/content/chart_5/chart_type"/>
                                                                <xsl:with-param name="height" select="'250'"/>
                                                                <xsl:with-param name="title" select="'Agendamento por Serviço'"/>
                                                                <xsl:with-param name="url" select="rows/content/chart_5/url"/>
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
                <!-- CIRCLESTATBOX JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/circlestatbox/jquery.knob.modified.js"/>
                <script type="text/javascript" src="{$path}/plugins/circlestatbox/igrp.circlestatbox.init.js"/>
                <!-- LOOKUP JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/lookup/igrp.lookup.js"/>
                <!-- DATE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/datetimepicker.js"/>
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/dtp.init.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1501679937114"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1501679937114"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1501679937114"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1501679937114"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1501679937114"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-charts.tmpl.xsl?v=1501679937115"/>
</xsl:stylesheet>
