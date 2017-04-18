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
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="ilha" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/ilha/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/ilha/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_ilha" name="{rows/content/form_1/fields/ilha/@name}">
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
                                                                <xsl:if test="rows/content/form_1/fields/cidade_lugar">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="cidade_lugar" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/cidade_lugar/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/cidade_lugar/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 IGRP_change" id="form_1_cidade_lugar" name="{rows/content/form_1/fields/cidade_lugar/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/cidade_lugar/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/bairro_lugar">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="bairro_lugar" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/bairro_lugar/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/bairro_lugar/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_bairro_lugar" name="{rows/content/form_1/fields/bairro_lugar/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/bairro_lugar/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/de">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="de" item-type="date">
                                                                        <label for="{rows/content/form_1/fields/de/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/de/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_1/fields/de/value}" class="form-control gen-date " id="form_1-de" name="{rows/content/form_1/fields/de/@name}" format="IGRP_datePicker" maxlength="30"/>
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-default">
                                                                                    <i class="fa fa-calendar"/>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/ate">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="ate" item-type="date">
                                                                        <label for="{rows/content/form_1/fields/ate/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/ate/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_1/fields/ate/value}" class="form-control gen-date " id="form_1-ate" name="{rows/content/form_1/fields/ate/@name}" format="IGRP_datePicker" maxlength="30"/>
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-default">
                                                                                    <i class="fa fa-calendar"/>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/tipo_predio">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="tipo_predio" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/tipo_predio/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/tipo_predio/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_tipo_predio" name="{rows/content/form_1/fields/tipo_predio/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/tipo_predio/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/estado_etapa">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="estado_etapa" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/estado_etapa/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/estado_etapa/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_estado_etapa" name="{rows/content/form_1/fields/estado_etapa/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/estado_etapa/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/estado_nip">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="estado_nip" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/estado_nip/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/estado_nip/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_estado_nip" name="{rows/content/form_1/fields/estado_nip/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/estado_nip/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/tipo_direito">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="tipo_direito" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/tipo_direito/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/tipo_direito/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_tipo_direito" name="{rows/content/form_1/fields/tipo_direito/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/tipo_direito/list/option">
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
                                                        <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/>
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
                                                                        <xsl:if test="rows/content/smallbox_1">
                                                                            <div class="small-box panel {rows/content/smallbox_1/fields/smallbox_1_bg/value} gen-container-item " gen-class="" item-name="smallbox_1">
                                                                                <div class="panel-heading clearfix">
                                                                                    <div class="sb-icon">
                                                                                        <i class="fa {rows/content/smallbox_1/fields/smallbox_1_icn/value} fa-3x"/>
                                                                                    </div>
                                                                                    <div class="col-xs-12 text-right pull-right sb-contents">
                                                                                        <div class="huge">
                                                                                            <xsl:value-of select="rows/content/smallbox_1/fields/smallbox_1_val/value"/>
                                                                                        </div>
                                                                                        <div>
                                                                                            <xsl:value-of select="rows/content/smallbox_1/fields/smallbox_1_tit/value"/>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <xsl:if test="rows/content/smallbox_1/fields/smallbox_1_lbl/value and rows/content/smallbox_1/fields/smallbox_1_lbl/value != ''">
                                                                                    <a href="{rows/content/smallbox_1/fields/smallbox_1_url/value}" target="modal" class="{rows/content/smallbox_1/fields/smallbox_1_bg/value}-text">
                                                                                        <div class="panel-footer">
                                                                                            <span class="pull-left">
                                                                                                <xsl:value-of select="rows/content/smallbox_1/fields/smallbox_1_lbl/value"/>
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
                                                                <div class="gen-column col-md-6">
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
                                                                <div class="gen-column col-md-6">
                                                                    <div class="gen-inner">
                                                                        <xsl:if test="rows/content/smallbox_5">
                                                                            <div class="small-box panel {rows/content/smallbox_5/fields/smallbox_5_bg/value} gen-container-item " gen-class="" item-name="smallbox_5">
                                                                                <div class="panel-heading clearfix">
                                                                                    <div class="sb-icon">
                                                                                        <i class="fa {rows/content/smallbox_5/fields/smallbox_5_icn/value} fa-3x"/>
                                                                                    </div>
                                                                                    <div class="col-xs-12 text-right pull-right sb-contents">
                                                                                        <div class="huge">
                                                                                            <xsl:value-of select="rows/content/smallbox_5/fields/smallbox_5_val/value"/>
                                                                                        </div>
                                                                                        <div>
                                                                                            <xsl:value-of select="rows/content/smallbox_5/fields/smallbox_5_tit/value"/>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <xsl:if test="rows/content/smallbox_5/fields/smallbox_5_lbl/value and rows/content/smallbox_5/fields/smallbox_5_lbl/value != ''">
                                                                                    <a href="{rows/content/smallbox_5/fields/smallbox_5_url/value}" target="modal" class="{rows/content/smallbox_5/fields/smallbox_5_bg/value}-text">
                                                                                        <div class="panel-footer">
                                                                                            <span class="pull-left">
                                                                                                <xsl:value-of select="rows/content/smallbox_5/fields/smallbox_5_lbl/value"/>
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
                <!-- SELECT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js"/>
                <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js"/>
                <!-- DATE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/datetimepicker.js"/>
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/dtp.init.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1490980365075"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1490980365075"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1490980365075"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1490980365075"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1490980365075"/>
</xsl:stylesheet>