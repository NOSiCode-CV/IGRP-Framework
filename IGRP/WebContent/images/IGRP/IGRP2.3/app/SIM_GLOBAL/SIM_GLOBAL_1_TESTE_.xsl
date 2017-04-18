<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- FORM CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/form/igrp.forms.css"/>
                <!-- CHART CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/highcharts/igrp.charts.css"/>
                <!-- TABCONTENT CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/tabs/igrp.tabs.css"/>
                <!-- STATBOX CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/statbox/statbox.css"/>
                <!-- QUICKBUTTONBOX CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/quickbuttonbox/quickbuttonbox.css"/>
                <!-- CIRCLESTATBOX CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/circlestatbox/circlestatbox.css"/>
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
                                                <div class="gen-tab-holder nav-tabs-custom gen-container-item " tab-template="default" gen-class="" item-name="tabcontent_1">
                                                    <ul class="nav nav-tabs">
                                                        <xsl:if test="rows/content/tabcontent_1/fields/tab_item_1">
                                                            <li item-name="tab_item_1" class="active gen-fields-holder" rel="tab-tabcontent_1-tab_item_1">
                                                                <a data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_1-tab_item_1">
                                                                    <i class="fa fa-angle-right"/>
                                                                    <span>
                                                                        <xsl:value-of select="rows/content/tabcontent_1/fields/tab_item_1/label"/>
                                                                    </span>
                                                                </a>
                                                            </li>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/tab_item_2">
                                                            <li item-name="tab_item_2" class=" gen-fields-holder" rel="tab-tabcontent_1-tab_item_2">
                                                                <a data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_1-tab_item_2">
                                                                    <i class="fa fa-angle-right"/>
                                                                    <span>
                                                                        <xsl:value-of select="rows/content/tabcontent_1/fields/tab_item_2/label"/>
                                                                    </span>
                                                                </a>
                                                            </li>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/tab_item_3">
                                                            <li item-name="tab_item_3" class=" gen-fields-holder" rel="tab-tabcontent_1-tab_item_3">
                                                                <a data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_1-tab_item_3">
                                                                    <i class="fa fa-angle-right"/>
                                                                    <span>
                                                                        <xsl:value-of select="rows/content/tabcontent_1/fields/tab_item_3/label"/>
                                                                    </span>
                                                                </a>
                                                            </li>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/tab_item_4">
                                                            <li item-name="tab_item_4" class=" gen-fields-holder" rel="tab-tabcontent_1-tab_item_4">
                                                                <a data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_1-tab_item_4">
                                                                    <i class="fa fa-angle-right"/>
                                                                    <span>
                                                                        <xsl:value-of select="rows/content/tabcontent_1/fields/tab_item_4/label"/>
                                                                    </span>
                                                                </a>
                                                            </li>
                                                        </xsl:if>
                                                    </ul>
                                                    <div class="tab-content">
                                                        <xsl:if test="rows/content/tabcontent_1/fields/tab_item_1">
                                                            <div class="tab-pane gen-rows-holder active" id="tab-tabcontent_1-tab_item_1" rel="tab-tabcontent_1-tab_item_1">
                                                                <div class="row">
                                                                    <div class="gen-column col-md-12">
                                                                        <div class="gen-inner">
                                                                            <xsl:if test="rows/content/statbox_1">
                                                                                <div class="statbox_container gen-container-item " gen-class="" item-name="statbox_1">
                                                                                    <div class="statbox {rows/content/statbox_1/fields/statbox_1_bg/value}">
                                                                                        <div class="boxchart">
                                                                                            <canvas/>
                                                                                        </div>
                                                                                        <div class="number">
                                                                                            <xsl:value-of select="rows/content/statbox_1/fields/statbox_1_val/value"/>
                                                                                            <i class="fa {rows/content/statbox_1/fields/statbox_1_icn/value}" aria-hidden="true"/>
                                                                                        </div>
                                                                                        <div class="title">
                                                                                            <xsl:value-of select="rows/content/statbox_1/fields/statbox_1_tit/value"/>
                                                                                        </div>
                                                                                        <div class="footer">
                                                                                            <a href="{rows/content/statbox_1/fields/statbox_1_url/value}" target="modal">
                                                                                                <xsl:value-of select="rows/content/statbox_1/fields/statbox_1_txt/value"/>
                                                                                            </a>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </xsl:if>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/tab_item_2">
                                                            <div class="tab-pane gen-rows-holder " id="tab-tabcontent_1-tab_item_2" rel="tab-tabcontent_1-tab_item_2">
                                                                <div class="row">
                                                                    <div class="gen-column col-md-12">
                                                                        <div class="gen-inner">
                                                                            <xsl:if test="rows/content/statbox_2">
                                                                                <div class="statbox_container gen-container-item " gen-class="" item-name="statbox_2">
                                                                                    <div class="statbox {rows/content/statbox_2/fields/statbox_2_bg/value}">
                                                                                        <div class="boxchart">
                                                                                            <canvas/>
                                                                                        </div>
                                                                                        <div class="number">
                                                                                            <xsl:value-of select="rows/content/statbox_2/fields/statbox_2_val/value"/>
                                                                                            <i class="fa {rows/content/statbox_2/fields/statbox_2_icn/value}" aria-hidden="true"/>
                                                                                        </div>
                                                                                        <div class="title">
                                                                                            <xsl:value-of select="rows/content/statbox_2/fields/statbox_2_tit/value"/>
                                                                                        </div>
                                                                                        <div class="footer">
                                                                                            <a href="{rows/content/statbox_2/fields/statbox_2_url/value}" target="modal">
                                                                                                <xsl:value-of select="rows/content/statbox_2/fields/statbox_2_txt/value"/>
                                                                                            </a>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </xsl:if>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/tab_item_3">
                                                            <div class="tab-pane gen-rows-holder " id="tab-tabcontent_1-tab_item_3" rel="tab-tabcontent_1-tab_item_3">
                                                                <div class="row">
                                                                    <div class="gen-column col-md-12">
                                                                        <div class="gen-inner">
                                                                            <xsl:if test="rows/content/quickbuttonbox_1">
                                                                                <div class="quick-button-box gen-container-item " gen-class="" item-name="quickbuttonbox_1">
                                                                                    <a href="{rows/content/quickbuttonbox_1/fields/quickbuttonbox_1_url/value}" target="modal" class="quick-button metro {rows/content/quickbuttonbox_1/fields/quickbuttonbox_1_bg/value}">
                                                                                        <i class="fa {rows/content/quickbuttonbox_1/fields/quickbuttonbox_1_icn/value}" aria-hidden="true"/>
                                                                                        <p>
                                                                                            <xsl:value-of select="rows/content/quickbuttonbox_1/fields/quickbuttonbox_1_tit/value"/>
                                                                                        </p>
                                                                                        <span class="badge">
                                                                                            <xsl:value-of select="rows/content/quickbuttonbox_1/fields/quickbuttonbox_1_val/value"/>
                                                                                        </span>
                                                                                    </a>
                                                                                </div>
                                                                            </xsl:if>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/tab_item_4">
                                                            <div class="tab-pane gen-rows-holder " id="tab-tabcontent_1-tab_item_4" rel="tab-tabcontent_1-tab_item_4">
                                                                <div class="row">
                                                                    <div class="gen-column col-md-12">
                                                                        <div class="gen-inner">
                                                                            <xsl:if test="rows/content/circlestatbox_1">
                                                                                <div class="circlestatbox-container csb-small gen-container-item " gen-class="" item-name="circlestatbox_1">
                                                                                    <div class="circlestatbox {rows/content/circlestatbox_1/fields/circlestatbox_1_bg/value}">
                                                                                        <div class="header">
                                                                                            <xsl:value-of select="rows/content/circlestatbox_1/fields/circlestatbox_1_tit/value"/>
                                                                                        </div>
                                                                                        <span class="percent">
                                                                                            <xsl:value-of select="rows/content/circlestatbox_1/fields/circlestatbox_1_lbl/value"/>
                                                                                        </span>
                                                                                        <div class="circleStat">
                                                                                            <input type="text" value="{rows/content/circlestatbox_1/fields/circlestatbox_1_val/value}" size="small" class="circlestats-chart" readonly="readonly"/>
                                                                                        </div>
                                                                                        <div class="footer">
                                                                                            <a class="clickable" target="modal" style="display: block;" href="{rows/content/circlestatbox_1/fields/circlestatbox_1_url/value}">
                                                                                                <span class="description">
                                                                                                    <xsl:value-of select="rows/content/circlestatbox_1/fields/circlestatbox_1_desc/value"/>
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
                                                        </xsl:if>
                                                    </div>
                                                </div>
                                                <xsl:if test="rows/content/page_title">
                                                    <section class="content-header gen-container-item " gen-class="" item-name="page_title">
                                                        <h2>
                                                            <xsl:value-of select="rows/content/page_title/fields/page_title_text/value"/>
                                                        </h2>
                                                    </section>
                                                </xsl:if>
                                                <xsl:if test="rows/content/form_1">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                                                <xsl:if test="rows/content/form_1/fields/nome">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="nome" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/nome/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/nome/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/nome/value}" class="form-control " id="{rows/content/form_1/fields/nome/@name}" name="{rows/content/form_1/fields/nome/@name}" maxlength="30" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/apelido">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="apelido" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/apelido/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/apelido/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/apelido/value}" class="form-control " id="{rows/content/form_1/fields/apelido/@name}" name="{rows/content/form_1/fields/apelido/@name}" maxlength="30" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/email_1">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="email_1" item-type="email">
                                                                        <label for="{rows/content/form_1/fields/email_1/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/email_1/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="email" value="{rows/content/form_1/fields/email_1/value}" class="form-control " id="{rows/content/form_1/fields/email_1/@name}" name="{rows/content/form_1/fields/email_1/@name}" maxlength="30" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/palavra_passe">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="palavra_passe" item-type="password">
                                                                        <label for="{rows/content/form_1/fields/palavra_passe/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/palavra_passe/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="password" value="{rows/content/form_1/fields/palavra_passe/value}" class="form-control " id="{rows/content/form_1/fields/palavra_passe/@name}" name="{rows/content/form_1/fields/palavra_passe/@name}" maxlength="30" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/comfirmar_pw">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="comfirmar_pw" item-type="password">
                                                                        <label for="{rows/content/form_1/fields/comfirmar_pw/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/comfirmar_pw/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="password" value="{rows/content/form_1/fields/comfirmar_pw/value}" class="form-control " id="{rows/content/form_1/fields/comfirmar_pw/@name}" name="{rows/content/form_1/fields/comfirmar_pw/@name}" maxlength="30" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/select">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="select" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/select/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/select/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_select" name="{rows/content/form_1/fields/select/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/select/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/lookup_1">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="lookup_1" item-type="lookup">
                                                                        <label for="{rows/content/form_1/fields/lookup_1/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/lookup_1/label"/>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_1/fields/lookup_1/value}" class="form-control gen-lookup " id="form_1_lookup_1" name="{rows/content/form_1/fields/lookup_1/@name}" maxlength="30"/>
                                                                            <xsl:call-template name="lookup-tool">
                                                                                <xsl:with-param name="page" select="rows/page"/>
                                                                                <xsl:with-param name="ad_hoc" select="'1'"/>
                                                                                <xsl:with-param name="action" select="'LOOKUP'"/>
                                                                                <xsl:with-param name="name" select="rows/content/form_1/fields/lookup_1/@name"/>
                                                                                <xsl:with-param name="js_lookup" select="rows/content/form_1/fields/lookup_1/lookup"/>
                                                                                <xsl:with-param name="input-id" select="'form_1_lookup_1'"/>
                                                                                <xsl:with-param name="btnClass" select="'default'"/>
                                                                            </xsl:call-template>
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
                                                                <div class="gen-column col-md-12">
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
                                                                                        <xsl:with-param name="title" select="'Chart'"/>
                                                                                        <xsl:with-param name="url" select="rows/content/chart_1/url"/>
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
                <!-- TABCONTENT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/tabs/igrp.tabs.js"/>
                <!-- CIRCLESTATBOX JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/circlestatbox/jquery.knob.modified.js"/>
                <script type="text/javascript" src="{$path}/plugins/circlestatbox/igrp.circlestatbox.init.js"/>
                <!-- SELECT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js"/>
                <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js"/>
                <!-- LOOKUP JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/lookup/igrp.lookup.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1491579351687"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1491579351687"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1491579351687"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1491579351687"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1491579351688"/>
    <xsl:include href="../../xsl/tmpl/IGRP-charts.tmpl.xsl?v=1491579351688"/>
</xsl:stylesheet>