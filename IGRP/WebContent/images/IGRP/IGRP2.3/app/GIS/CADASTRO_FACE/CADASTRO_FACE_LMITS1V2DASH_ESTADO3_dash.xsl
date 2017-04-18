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
                <!-- MAPCHART CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/highcharts/highmaps/highmap.css"/>
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
                                                                    <div class="col-md-2 form-group  gen-fields-holder" item-name="ilha" item-type="select">
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
                                                                    <div class="col-md-2 form-group  gen-fields-holder" item-name="cidadezona" item-type="select">
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
                                                                    <div class="col-md-2 form-group  gen-fields-holder" item-name="bairrolugar" item-type="select">
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
                                                                    <div class="form-group col-md-2  gen-fields-holder" item-name="data_inicio" item-type="date">
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
                                                                    <div class="form-group col-md-2  gen-fields-holder" item-name="data_fim" item-type="date">
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
                                                <div class="box igrp-box-holder gen-container-item " gen-class="" item-name="box_1">
                                                    <xsl:call-template name="box-header">
                                                        <xsl:with-param name="title" select="rows/content/box_1/@title"/>
                                                        <xsl:with-param name="collapsible" select="'true'"/>
                                                    </xsl:call-template>
                                                    <div class="box-body" gen-preserve-content="true">
                                                        <div>
                                                            <div class="row">
                                                                <div class="gen-column col-md-6">
                                                                    <div class="gen-inner">
                                                                        <xsl:if test="rows/content/circl_cadastro_diff">
                                                                            <div class="circlestatbox-container gen-container-item " gen-class="" item-name="circl_cadastro_diff">
                                                                                <div class="circlestatbox {rows/content/circl_cadastro_diff/fields/circl_cadastro_diff_bg/value}">
                                                                                    <div class="header">
                                                                                        <xsl:value-of select="rows/content/circl_cadastro_diff/fields/circl_cadastro_diff_tit/value"/>
                                                                                    </div>
                                                                                    <span class="percent">
                                                                                        <xsl:value-of select="rows/content/circl_cadastro_diff/fields/circl_cadastro_diff_lbl/value"/>
                                                                                    </span>
                                                                                    <div class="circleStat">
                                                                                        <input type="text" value="{rows/content/circl_cadastro_diff/fields/circl_cadastro_diff_val/value}" class="circlestats-chart" readonly="readonly"/>
                                                                                    </div>
                                                                                    <div class="footer">
                                                                                        <a class="clickable" target="modal" style="display: block;" href="{rows/content/circl_cadastro_diff/fields/circl_cadastro_diff_url/value}">
                                                                                            <span class="description">
                                                                                                <xsl:value-of select="rows/content/circl_cadastro_diff/fields/circl_cadastro_diff_desc/value"/>
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
                                                                        <xsl:if test="rows/content/circl_cadastra">
                                                                            <div class="circlestatbox-container gen-container-item " gen-class="" item-name="circl_cadastra">
                                                                                <div class="circlestatbox {rows/content/circl_cadastra/fields/circl_cadastra_bg/value}">
                                                                                    <div class="header">
                                                                                        <xsl:value-of select="rows/content/circl_cadastra/fields/circl_cadastra_tit/value"/>
                                                                                    </div>
                                                                                    <span class="percent">
                                                                                        <xsl:value-of select="rows/content/circl_cadastra/fields/circl_cadastra_lbl/value"/>
                                                                                    </span>
                                                                                    <div class="circleStat">
                                                                                        <input type="text" value="{rows/content/circl_cadastra/fields/circl_cadastra_val/value}" class="circlestats-chart" readonly="readonly"/>
                                                                                    </div>
                                                                                    <div class="footer">
                                                                                        <a class="clickable" target="modal" style="display: block;" href="{rows/content/circl_cadastra/fields/circl_cadastra_url/value}">
                                                                                            <span class="description">
                                                                                                <xsl:value-of select="rows/content/circl_cadastra/fields/circl_cadastra_desc/value"/>
                                                                                            </span>
                                                                                        </a>
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
                                        <div class="gen-column col-md-6">
                                            <div class="gen-inner">
                                                <div class="box igrp-box-holder gen-container-item " gen-class="" item-name="box_2">
                                                    <xsl:call-template name="box-header">
                                                        <xsl:with-param name="title" select="rows/content/box_2/@title"/>
                                                        <xsl:with-param name="collapsible" select="'true'"/>
                                                    </xsl:call-template>
                                                    <div class="box-body" gen-preserve-content="true">
                                                        <div>
                                                            <div class="row">
                                                                <div class="gen-column col-md-6">
                                                                    <div class="gen-inner">
                                                                        <xsl:if test="rows/content/circl_por_registar">
                                                                            <div class="circlestatbox-container gen-container-item " gen-class="" item-name="circl_por_registar">
                                                                                <div class="circlestatbox {rows/content/circl_por_registar/fields/circl_por_registar_bg/value}">
                                                                                    <div class="header">
                                                                                        <xsl:value-of select="rows/content/circl_por_registar/fields/circl_por_registar_tit/value"/>
                                                                                    </div>
                                                                                    <span class="percent">
                                                                                        <xsl:value-of select="rows/content/circl_por_registar/fields/circl_por_registar_lbl/value"/>
                                                                                    </span>
                                                                                    <div class="circleStat">
                                                                                        <input type="text" value="{rows/content/circl_por_registar/fields/circl_por_registar_val/value}" class="circlestats-chart" readonly="readonly"/>
                                                                                    </div>
                                                                                    <div class="footer">
                                                                                        <a class="clickable" target="modal" style="display: block;" href="{rows/content/circl_por_registar/fields/circl_por_registar_url/value}">
                                                                                            <span class="description">
                                                                                                <xsl:value-of select="rows/content/circl_por_registar/fields/circl_por_registar_desc/value"/>
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
                                                                        <xsl:if test="rows/content/circl_registada">
                                                                            <div class="circlestatbox-container gen-container-item " gen-class="" item-name="circl_registada">
                                                                                <div class="circlestatbox {rows/content/circl_registada/fields/circl_registada_bg/value}">
                                                                                    <div class="header">
                                                                                        <xsl:value-of select="rows/content/circl_registada/fields/circl_registada_tit/value"/>
                                                                                    </div>
                                                                                    <span class="percent">
                                                                                        <xsl:value-of select="rows/content/circl_registada/fields/circl_registada_lbl/value"/>
                                                                                    </span>
                                                                                    <div class="circleStat">
                                                                                        <input type="text" value="{rows/content/circl_registada/fields/circl_registada_val/value}" class="circlestats-chart" readonly="readonly"/>
                                                                                    </div>
                                                                                    <div class="footer">
                                                                                        <a class="clickable" target="modal" style="display: block;" href="{rows/content/circl_registada/fields/circl_registada_url/value}">
                                                                                            <span class="description">
                                                                                                <xsl:value-of select="rows/content/circl_registada/fields/circl_registada_desc/value"/>
                                                                                            </span>
                                                                                        </a>
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
                                    <div class="row">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/mapchart_1">
                                                    <div class="box gen-container-item " gen-class="" item-name="mapchart_1">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/mapchart_1/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <div id="highmap-mapchart_1" class="igrp-highmaps" style="margin: 0 auto" map-height="350" basemap="{rows/content/mapchart_1/fields/mapchart_1_basemap/value}" data="{rows/content/mapchart_1/fields/mapchart_1_data/value}" config="{rows/content/mapchart_1/fields/mapchart_1_config/value}"/></div>
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
                <!-- MAPCHART JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/highcharts/highcharts.js"/>
                <script type="text/javascript" src="{$path}/plugins/highcharts/highcharts-more.js"/>
                <script type="text/javascript" src="{$path}/plugins/highcharts/highmaps/map.js"/>
                <script type="text/javascript" src="{$path}/plugins/highcharts/highmaps/data.js"/>
                <script type="text/javascript" src="{$path}/plugins/highcharts/highmaps/drilldown.js"/>
                <script type="text/javascript" src="{$path}/plugins/highcharts/highmaps/highmap.controller.js"/>
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
                    $.IGRP.rules.set({
                        "p_cidadezona": [
                            {
                                "action": "remote_combobox",
                                "condition": "notnull",
                                "event": "change",
                                "isTable": false,
                                "msg": "",
                                "msg_type": "",
                                "name": "change",
                                "opposite": "",
                                "patern": "",
                                "patern_custom": "",
                                "procedure": "cadastro.STATS_CONFIG.SQL_bairro_lugar",
                                "targets": "bairrolugar",
                                "value": "",
                                "value2": ""
                            },
                            {
                                "action": "remote_combobox",
                                "condition": "null",
                                "event": "change",
                                "isTable": false,
                                "msg": "",
                                "msg_type": "",
                                "name": "rulles_bairro",
                                "opposite": "",
                                "patern": "",
                                "patern_custom": "",
                                "procedure": "cadastro.STATS_CONFIG.SQL_bairro_lugar",
                                "targets": "bairrolugar",
                                "value": "",
                                "value2": ""
                            }
                        ],
                        "p_ilha": [
                            {
                                "action": "remote_combobox",
                                "condition": "null",
                                "event": "change",
                                "isTable": false,
                                "msg": "",
                                "msg_type": "",
                                "name": "rulles1",
                                "opposite": "",
                                "patern": "",
                                "patern_custom": "",
                                "procedure": "cadastro.stats_config.sql_cidade_zona",
                                "targets": "cidadezona",
                                "value": "",
                                "value2": ""
                            },
                            
                            {
                                "action": "remote_combobox",
                                "condition": "notnull",
                                "event": "change",
                                "isTable": false,
                                "msg": "",
                                "msg_type": "",
                                "name": "rulles3",
                                "opposite": "",
                                "patern": "",
                                "patern_custom": "",
                                "procedure": "cadastro.stats_config.sql_cidade_zona",
                                "targets": "cidadezona",
                                "value": "",
                                "value2": ""
                            }
                        ]
                    });
<!-- $.IGRP.rules.set({"p_ilha":[{"name":"rulles1","event":"change","condition":"null","value":"","value2":"","patern":"","patern_custom":"","action":"remote_combobox","targets":"cidadezona","procedure":"cadastro.stats_config.sql_cidade_zona","msg_type":"","msg":"","opposite":"","isTable":false},{"name":"rulles2","event":"load","condition":"null","value":"","value2":"","patern":"","patern_custom":"","action":"remote_combobox","targets":"cidadezona","procedure":"cadastro.stats_config.sql_cidade_zona","msg_type":"","msg":"","opposite":"","isTable":false},{"name":"rulles3","event":"change","condition":"notnull","value":"","value2":"","patern":"","patern_custom":"","action":"remote_combobox","targets":"cidadezona","procedure":"cadastro.stats_config.sql_cidade_zona","msg_type":"","msg":"","opposite":"","isTable":false},{"name":"rulles4","event":"load","condition":"notnull","value":"","value2":"","patern":"","patern_custom":"","action":"remote_combobox","targets":"cidadezona","procedure":"cadastro.stats_config.sql_cidade_zona","msg_type":"","msg":"","opposite":"","isTable":false}],"p_cidadezona":[{"name":"change","event":"change","condition":"notnull","value":"","value2":"","patern":"","patern_custom":"","action":"remote_combobox","targets":"bairrolugar","procedure":"cadastro.STATS_CONFIG.SQL_bairro_lugar","msg_type":"","msg":"","opposite":"","isTable":false},{"name":"rulles_bairro","event":"change","condition":"null","value":"","value2":"","patern":"","patern_custom":"","action":"remote_combobox","targets":"bairrolugar","procedure":"cadastro.STATS_CONFIG.SQL_bairro_lugar","msg_type":"","msg":"","opposite":"","isTable":false}]}); --></script>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1487088305796"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1487088305796"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1487088305796"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1487088305796"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1487088305796"/>
</xsl:stylesheet>