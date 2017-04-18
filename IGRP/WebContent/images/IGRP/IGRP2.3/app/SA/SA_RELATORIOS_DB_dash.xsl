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
                <!-- SELECT CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.min.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.style.css"/>
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
                                                <xsl:if test="rows/content/form_1">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                                                <xsl:if test="rows/content/form_1/fields/periodo">
                                                                    <div class="col-md-3  gen-fields-holder" item-name="periodo" item-type="radiolist">
                                                                        <div class="form-group">
                                                                            <label>
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/form_1/fields/periodo/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <xsl:for-each select="rows/content/form_1/fields/periodo/list/option">
                                                                                <div class="radio">
                                                                                    <label>
                                                                                        <input type="radio" name="{../../@name}" value="{value}" class="radiolist" label="{text}">
                                                                                            <xsl:if test="@selected='true'">
                                                                                                <xsl:attribute name="checked">checked</xsl:attribute>
                                                                                            </xsl:if>
                                                                                        </input>
                                                                                        <span>
                                                                                            <xsl:value-of select="text"/>
                                                                                        </span>
                                                                                    </label>
                                                                                </div>
                                                                            </xsl:for-each>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/organica">
                                                                    <div class="col-md-6 form-group  gen-fields-holder" item-name="organica" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/organica/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/organica/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_organica" name="{rows/content/form_1/fields/organica/@name}" multiple="multiple">
                                                                            <xsl:for-each select="rows/content/form_1/fields/organica/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/opcao_filtro">
                                                                    <div class="col-md-3  gen-fields-holder" item-name="opcao_filtro" item-type="radiolist">
                                                                        <div class="form-group">
                                                                            <label>
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/form_1/fields/opcao_filtro/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <xsl:for-each select="rows/content/form_1/fields/opcao_filtro/list/option">
                                                                                <div class="radio">
                                                                                    <label>
                                                                                        <input type="radio" name="{../../@name}" value="{value}" class="radiolist" label="{text}">
                                                                                            <xsl:if test="@selected='true'">
                                                                                                <xsl:attribute name="checked">checked</xsl:attribute>
                                                                                            </xsl:if>
                                                                                        </input>
                                                                                        <span>
                                                                                            <xsl:value-of select="text"/>
                                                                                        </span>
                                                                                    </label>
                                                                                </div>
                                                                            </xsl:for-each>
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
                                                <xsl:if test="rows/content/total_atende">
                                                    <div class="statbox_container gen-container-item " gen-class="" item-name="total_atende">
                                                        <div class="statbox {rows/content/total_atende/fields/total_atende_bg/value}">
                                                            <div class="boxchart">
                                                                <canvas/>
                                                            </div>
                                                            <div class="number">
                                                                <xsl:value-of select="rows/content/total_atende/fields/total_atende_val/value"/>
                                                                <i class="fa {rows/content/total_atende/fields/total_atende_icn/value}" aria-hidden="true"/>
                                                            </div>
                                                            <div class="title">
                                                                <xsl:value-of select="rows/content/total_atende/fields/total_atende_tit/value"/>
                                                            </div>
                                                            <div class="footer">
                                                                <a href="{rows/content/total_atende/fields/total_atende_url/value}" target="modal">
                                                                    <xsl:value-of select="rows/content/total_atende/fields/total_atende_txt/value"/>
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                        <div class="gen-column col-md-3">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/total_avalia">
                                                    <div class="statbox_container gen-container-item " gen-class="" item-name="total_avalia">
                                                        <div class="statbox {rows/content/total_avalia/fields/total_avalia_bg/value}">
                                                            <div class="boxchart">
                                                                <canvas/>
                                                            </div>
                                                            <div class="number">
                                                                <xsl:value-of select="rows/content/total_avalia/fields/total_avalia_val/value"/>
                                                                <i class="fa {rows/content/total_avalia/fields/total_avalia_icn/value}" aria-hidden="true"/>
                                                            </div>
                                                            <div class="title">
                                                                <xsl:value-of select="rows/content/total_avalia/fields/total_avalia_tit/value"/>
                                                            </div>
                                                            <div class="footer">
                                                                <a href="{rows/content/total_avalia/fields/total_avalia_url/value}" target="modal">
                                                                    <xsl:value-of select="rows/content/total_avalia/fields/total_avalia_txt/value"/>
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                        <div class="gen-column col-md-3">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/t_atende_s_ava">
                                                    <div class="statbox_container gen-container-item " gen-class="" item-name="t_atende_s_ava">
                                                        <div class="statbox {rows/content/t_atende_s_ava/fields/t_atende_s_ava_bg/value}">
                                                            <div class="boxchart">
                                                                <canvas/>
                                                            </div>
                                                            <div class="number">
                                                                <xsl:value-of select="rows/content/t_atende_s_ava/fields/t_atende_s_ava_val/value"/>
                                                                <i class="fa {rows/content/t_atende_s_ava/fields/t_atende_s_ava_icn/value}" aria-hidden="true"/>
                                                            </div>
                                                            <div class="title">
                                                                <xsl:value-of select="rows/content/t_atende_s_ava/fields/t_atende_s_ava_tit/value"/>
                                                            </div>
                                                            <div class="footer">
                                                                <a href="{rows/content/t_atende_s_ava/fields/t_atende_s_ava_url/value}" target="modal">
                                                                    <xsl:value-of select="rows/content/t_atende_s_ava/fields/t_atende_s_ava_txt/value"/>
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                        <div class="gen-column col-md-3">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/total_aval_sem_serv">
                                                    <div class="statbox_container gen-container-item " gen-class="" item-name="total_aval_sem_serv">
                                                        <div class="statbox {rows/content/total_aval_sem_serv/fields/total_aval_sem_serv_bg/value}">
                                                            <div class="boxchart">
                                                                <canvas/>
                                                            </div>
                                                            <div class="number">
                                                                <xsl:value-of select="rows/content/total_aval_sem_serv/fields/total_aval_sem_serv_val/value"/>
                                                                <i class="fa {rows/content/total_aval_sem_serv/fields/total_aval_sem_serv_icn/value}" aria-hidden="true"/>
                                                            </div>
                                                            <div class="title">
                                                                <xsl:value-of select="rows/content/total_aval_sem_serv/fields/total_aval_sem_serv_tit/value"/>
                                                            </div>
                                                            <div class="footer">
                                                                <a href="{rows/content/total_aval_sem_serv/fields/total_aval_sem_serv_url/value}" target="modal">
                                                                    <xsl:value-of select="rows/content/total_aval_sem_serv/fields/total_aval_sem_serv_txt/value"/>
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/avaliacao_por_org">
                                                    <div class="box gen-container-item " gen-structure="graphic" gen-class="" item-name="avaliacao_por_org">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/avaliacao_por_org/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <xsl:call-template name="igrp-graph">
                                                                <xsl:with-param name="table" select="rows/content/avaliacao_por_org"/>
                                                                <xsl:with-param name="chart_type" select="'column'"/>
                                                                <xsl:with-param name="height" select="'250'"/>
                                                                <xsl:with-param name="title" select="'Atendimento Por Orgânica'"/>
                                                                <xsl:with-param name="url" select="rows/content/avaliacao_por_org/url"/>
                                                            </xsl:call-template>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="gen-column col-md-5">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/serv_mais_atend">
                                                    <div class="box gen-container-item " gen-structure="graphic" gen-class="" item-name="serv_mais_atend">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/serv_mais_atend/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <xsl:call-template name="igrp-graph">
                                                                <xsl:with-param name="table" select="rows/content/serv_mais_atend"/>
                                                                <xsl:with-param name="chart_type" select="'pie'"/>
                                                                <xsl:with-param name="height" select="'250'"/>
                                                                <xsl:with-param name="title" select="'Serviços mais atendidos'"/>
                                                                <xsl:with-param name="url" select="rows/content/serv_mais_atend/url"/>
                                                            </xsl:call-template>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                        <div class="gen-column col-md-7">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/atend_avalia">
                                                    <div class="box gen-container-item " gen-structure="graphic" gen-class="" item-name="atend_avalia">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/atend_avalia/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <xsl:call-template name="igrp-graph">
                                                                <xsl:with-param name="table" select="rows/content/atend_avalia"/>
                                                                <xsl:with-param name="chart_type" select="'column'"/>
                                                                <xsl:with-param name="height" select="'250'"/>
                                                                <xsl:with-param name="title" select="'Atendimento Por Grau'"/>
                                                                <xsl:with-param name="url" select="rows/content/atend_avalia/url"/>
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
                                                <xsl:if test="rows/content/serv_mais_atend_org">
                                                    <div class="box gen-container-item " gen-structure="graphic" gen-class="" item-name="serv_mais_atend_org">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/serv_mais_atend_org/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <xsl:call-template name="igrp-graph">
                                                                <xsl:with-param name="table" select="rows/content/serv_mais_atend_org"/>
                                                                <xsl:with-param name="chart_type" select="'column'"/>
                                                                <xsl:with-param name="height" select="'250'"/>
                                                                <xsl:with-param name="title" select="'Top 3 Serviços mais atendido por Orgânica'"/>
                                                                <xsl:with-param name="url" select="rows/content/serv_mais_atend_org/url"/>
                                                            </xsl:call-template>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner"/></div>
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
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1487161165271"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1487161165271"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1487161165271"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1487161165271"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1487161165271"/>
    <xsl:include href="../../xsl/tmpl/IGRP-charts.tmpl.xsl?v=1487161165271"/>
</xsl:stylesheet>