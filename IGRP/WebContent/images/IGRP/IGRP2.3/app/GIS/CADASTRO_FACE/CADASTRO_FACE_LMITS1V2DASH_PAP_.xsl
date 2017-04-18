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
                                                <xsl:if test="rows/content/form_2">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_2">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/form_2/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_2/fields"/>
                                                                <xsl:if test="rows/content/form_2/fields/ilha">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="ilha" item-type="select">
                                                                        <label for="{rows/content/form_2/fields/ilha/@name}">
                                                                            <xsl:value-of select="rows/content/form_2/fields/ilha/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_2_ilha" name="{rows/content/form_2/fields/ilha/@name}">
                                                                            <xsl:for-each select="rows/content/form_2/fields/ilha/list/option">
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
                                                                <xsl:if test="rows/content/form_2/fields/cidade_zona">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="cidade_zona" item-type="select">
                                                                        <label for="{rows/content/form_2/fields/cidade_zona/@name}">
                                                                            <xsl:value-of select="rows/content/form_2/fields/cidade_zona/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 IGRP_change" id="form_2_cidade_zona" name="{rows/content/form_2/fields/cidade_zona/@name}">
                                                                            <xsl:for-each select="rows/content/form_2/fields/cidade_zona/list/option">
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
                                                                <xsl:if test="rows/content/form_2/fields/bairro_lugar">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="bairro_lugar" item-type="select">
                                                                        <label for="{rows/content/form_2/fields/bairro_lugar/@name}">
                                                                            <xsl:value-of select="rows/content/form_2/fields/bairro_lugar/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_2_bairro_lugar" name="{rows/content/form_2/fields/bairro_lugar/@name}">
                                                                            <xsl:for-each select="rows/content/form_2/fields/bairro_lugar/list/option">
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
                                                                <xsl:if test="rows/content/form_2/fields/de">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="de" item-type="date">
                                                                        <label for="{rows/content/form_2/fields/de/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_2/fields/de/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_2/fields/de/value}" class="form-control gen-date " id="form_2-de" name="{rows/content/form_2/fields/de/@name}" format="IGRP_datePicker" maxlength="30"/>
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-default">
                                                                                    <i class="fa fa-calendar"/>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_2/fields/ate">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="ate" item-type="date">
                                                                        <label for="{rows/content/form_2/fields/ate/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_2/fields/ate/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_2/fields/ate/value}" class="form-control gen-date " id="form_2-ate" name="{rows/content/form_2/fields/ate/@name}" format="IGRP_datePicker" maxlength="30"/>
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-default">
                                                                                    <i class="fa fa-calendar"/>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_2/fields/estado_etapa">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="estado_etapa" item-type="select">
                                                                        <label for="{rows/content/form_2/fields/estado_etapa/@name}">
                                                                            <xsl:value-of select="rows/content/form_2/fields/estado_etapa/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_2_estado_etapa" name="{rows/content/form_2/fields/estado_etapa/@name}">
                                                                            <xsl:for-each select="rows/content/form_2/fields/estado_etapa/list/option">
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
                                                                <xsl:if test="rows/content/form_2/fields/estado_nip">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="estado_nip" item-type="select">
                                                                        <label for="{rows/content/form_2/fields/estado_nip/@name}">
                                                                            <xsl:value-of select="rows/content/form_2/fields/estado_nip/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_2_estado_nip" name="{rows/content/form_2/fields/estado_nip/@name}">
                                                                            <xsl:for-each select="rows/content/form_2/fields/estado_nip/list/option">
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
                                                        <xsl:apply-templates select="rows/content/form_2/tools-bar" mode="form-buttons"/>
                                                    </div>
                                                </xsl:if>
                                                <div class="box igrp-box-holder gen-container-item " gen-class="" item-name="box_3">
                                                    <xsl:call-template name="box-header">
                                                        <xsl:with-param name="title" select="rows/content/box_3/@title"/>
                                                        <xsl:with-param name="collapsible" select="'true'"/>
                                                    </xsl:call-template>
                                                    <div class="box-body" gen-preserve-content="true">
                                                        <div>
                                                            <div class="row">
                                                                <div class="gen-column col-md-4">
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
                                                                                        <a class="clickable" target="_self" style="display: block;" href="{rows/content/circlestatbox_1/fields/circlestatbox_1_url/value}">
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
                                                                <div class="gen-column col-md-4">
                                                                    <div class="gen-inner">
                                                                        <xsl:if test="rows/content/circlestatbox_2">
                                                                            <div class="circlestatbox-container csb-small gen-container-item " gen-class="" item-name="circlestatbox_2">
                                                                                <div class="circlestatbox {rows/content/circlestatbox_2/fields/circlestatbox_2_bg/value}">
                                                                                    <div class="header">
                                                                                        <xsl:value-of select="rows/content/circlestatbox_2/fields/circlestatbox_2_tit/value"/>
                                                                                    </div>
                                                                                    <span class="percent">
                                                                                        <xsl:value-of select="rows/content/circlestatbox_2/fields/circlestatbox_2_lbl/value"/>
                                                                                    </span>
                                                                                    <div class="circleStat">
                                                                                        <input type="text" value="{rows/content/circlestatbox_2/fields/circlestatbox_2_val/value}" size="small" class="circlestats-chart" readonly="readonly"/>
                                                                                    </div>
                                                                                    <div class="footer">
                                                                                        <a class="clickable" target="_self" style="display: block;" href="{rows/content/circlestatbox_2/fields/circlestatbox_2_url/value}">
                                                                                            <span class="description">
                                                                                                <xsl:value-of select="rows/content/circlestatbox_2/fields/circlestatbox_2_desc/value"/>
                                                                                            </span>
                                                                                        </a>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </xsl:if>
                                                                    </div>
                                                                </div>
                                                                <div class="gen-column col-md-4">
                                                                    <div class="gen-inner">
                                                                        <xsl:if test="rows/content/circlestatbox_3">
                                                                            <div class="circlestatbox-container csb-small gen-container-item " gen-class="" item-name="circlestatbox_3">
                                                                                <div class="circlestatbox {rows/content/circlestatbox_3/fields/circlestatbox_3_bg/value}">
                                                                                    <div class="header">
                                                                                        <xsl:value-of select="rows/content/circlestatbox_3/fields/circlestatbox_3_tit/value"/>
                                                                                    </div>
                                                                                    <span class="percent">
                                                                                        <xsl:value-of select="rows/content/circlestatbox_3/fields/circlestatbox_3_lbl/value"/>
                                                                                    </span>
                                                                                    <div class="circleStat">
                                                                                        <input type="text" value="{rows/content/circlestatbox_3/fields/circlestatbox_3_val/value}" size="small" class="circlestats-chart" readonly="readonly"/>
                                                                                    </div>
                                                                                    <div class="footer">
                                                                                        <a class="clickable" target="_self" style="display: block;" href="{rows/content/circlestatbox_3/fields/circlestatbox_3_url/value}">
                                                                                            <span class="description">
                                                                                                <xsl:value-of select="rows/content/circlestatbox_3/fields/circlestatbox_3_desc/value"/>
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
                                                                        <xsl:if test="rows/content/circlestatbox_7">
                                                                            <div class="circlestatbox-container csb-small gen-container-item " gen-class="" item-name="circlestatbox_7">
                                                                                <div class="circlestatbox {rows/content/circlestatbox_7/fields/circlestatbox_7_bg/value}">
                                                                                    <div class="header">
                                                                                        <xsl:value-of select="rows/content/circlestatbox_7/fields/circlestatbox_7_tit/value"/>
                                                                                    </div>
                                                                                    <span class="percent">
                                                                                        <xsl:value-of select="rows/content/circlestatbox_7/fields/circlestatbox_7_lbl/value"/>
                                                                                    </span>
                                                                                    <div class="circleStat">
                                                                                        <input type="text" value="{rows/content/circlestatbox_7/fields/circlestatbox_7_val/value}" size="small" class="circlestats-chart" readonly="readonly"/>
                                                                                    </div>
                                                                                    <div class="footer">
                                                                                        <a class="clickable" target="modal" style="display: block;" href="{rows/content/circlestatbox_7/fields/circlestatbox_7_url/value}">
                                                                                            <span class="description">
                                                                                                <xsl:value-of select="rows/content/circlestatbox_7/fields/circlestatbox_7_desc/value"/>
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
                                                                        <xsl:if test="rows/content/circlestatbox_8">
                                                                            <div class="circlestatbox-container csb-small gen-container-item " gen-class="" item-name="circlestatbox_8">
                                                                                <div class="circlestatbox {rows/content/circlestatbox_8/fields/circlestatbox_8_bg/value}">
                                                                                    <div class="header">
                                                                                        <xsl:value-of select="rows/content/circlestatbox_8/fields/circlestatbox_8_tit/value"/>
                                                                                    </div>
                                                                                    <span class="percent">
                                                                                        <xsl:value-of select="rows/content/circlestatbox_8/fields/circlestatbox_8_lbl/value"/>
                                                                                    </span>
                                                                                    <div class="circleStat">
                                                                                        <input type="text" value="{rows/content/circlestatbox_8/fields/circlestatbox_8_val/value}" size="small" class="circlestats-chart" readonly="readonly"/>
                                                                                    </div>
                                                                                    <div class="footer">
                                                                                        <a class="clickable" target="modal" style="display: block;" href="{rows/content/circlestatbox_8/fields/circlestatbox_8_url/value}">
                                                                                            <span class="description">
                                                                                                <xsl:value-of select="rows/content/circlestatbox_8/fields/circlestatbox_8_desc/value"/>
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
                                                <div class="box igrp-box-holder gen-container-item hidden" gen-class="hidden" item-name="box_2">
                                                    <xsl:call-template name="box-header">
                                                        <xsl:with-param name="title" select="rows/content/box_2/@title"/>
                                                        <xsl:with-param name="collapsible" select="'true'"/>
                                                    </xsl:call-template>
                                                    <div class="box-body" gen-preserve-content="true">
                                                        <div>
                                                            <div class="row">
                                                                <div class="gen-column col-md-4">
                                                                    <div class="gen-inner">
                                                                        <xsl:if test="rows/content/circlestatbox_4">
                                                                            <div class="circlestatbox-container csb-small gen-container-item " gen-class="" item-name="circlestatbox_4">
                                                                                <div class="circlestatbox {rows/content/circlestatbox_4/fields/circlestatbox_4_bg/value}">
                                                                                    <div class="header">
                                                                                        <xsl:value-of select="rows/content/circlestatbox_4/fields/circlestatbox_4_tit/value"/>
                                                                                    </div>
                                                                                    <span class="percent">
                                                                                        <xsl:value-of select="rows/content/circlestatbox_4/fields/circlestatbox_4_lbl/value"/>
                                                                                    </span>
                                                                                    <div class="circleStat">
                                                                                        <input type="text" value="{rows/content/circlestatbox_4/fields/circlestatbox_4_val/value}" size="small" class="circlestats-chart" readonly="readonly"/>
                                                                                    </div>
                                                                                    <div class="footer">
                                                                                        <a class="clickable" target="modal" style="display: block;" href="{rows/content/circlestatbox_4/fields/circlestatbox_4_url/value}">
                                                                                            <span class="description">
                                                                                                <xsl:value-of select="rows/content/circlestatbox_4/fields/circlestatbox_4_desc/value"/>
                                                                                            </span>
                                                                                        </a>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </xsl:if>
                                                                    </div>
                                                                </div>
                                                                <div class="gen-column col-md-4">
                                                                    <div class="gen-inner">
                                                                        <xsl:if test="rows/content/circlestatbox_5">
                                                                            <div class="circlestatbox-container csb-small gen-container-item " gen-class="" item-name="circlestatbox_5">
                                                                                <div class="circlestatbox {rows/content/circlestatbox_5/fields/circlestatbox_5_bg/value}">
                                                                                    <div class="header">
                                                                                        <xsl:value-of select="rows/content/circlestatbox_5/fields/circlestatbox_5_tit/value"/>
                                                                                    </div>
                                                                                    <span class="percent">
                                                                                        <xsl:value-of select="rows/content/circlestatbox_5/fields/circlestatbox_5_lbl/value"/>
                                                                                    </span>
                                                                                    <div class="circleStat">
                                                                                        <input type="text" value="{rows/content/circlestatbox_5/fields/circlestatbox_5_val/value}" size="small" class="circlestats-chart" readonly="readonly"/>
                                                                                    </div>
                                                                                    <div class="footer">
                                                                                        <a class="clickable" target="modal" style="display: block;" href="{rows/content/circlestatbox_5/fields/circlestatbox_5_url/value}">
                                                                                            <span class="description">
                                                                                                <xsl:value-of select="rows/content/circlestatbox_5/fields/circlestatbox_5_desc/value"/>
                                                                                            </span>
                                                                                        </a>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </xsl:if>
                                                                    </div>
                                                                </div>
                                                                <div class="gen-column col-md-4">
                                                                    <div class="gen-inner">
                                                                        <xsl:if test="rows/content/circlestatbox_6">
                                                                            <div class="circlestatbox-container csb-small gen-container-item " gen-class="" item-name="circlestatbox_6">
                                                                                <div class="circlestatbox {rows/content/circlestatbox_6/fields/circlestatbox_6_bg/value}">
                                                                                    <div class="header">
                                                                                        <xsl:value-of select="rows/content/circlestatbox_6/fields/circlestatbox_6_tit/value"/>
                                                                                    </div>
                                                                                    <span class="percent">
                                                                                        <xsl:value-of select="rows/content/circlestatbox_6/fields/circlestatbox_6_lbl/value"/>
                                                                                    </span>
                                                                                    <div class="circleStat">
                                                                                        <input type="text" value="{rows/content/circlestatbox_6/fields/circlestatbox_6_val/value}" size="small" class="circlestats-chart" readonly="readonly"/>
                                                                                    </div>
                                                                                    <div class="footer">
                                                                                        <a class="clickable" target="modal" style="display: block;" href="{rows/content/circlestatbox_6/fields/circlestatbox_6_url/value}">
                                                                                            <span class="description">
                                                                                                <xsl:value-of select="rows/content/circlestatbox_6/fields/circlestatbox_6_desc/value"/>
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
                <!-- SELECT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js"/>
                <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js"/>
                <!-- DATE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/datetimepicker.js"/>
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/dtp.init.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1491301766699"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1491301766699"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1491301766699"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1491301766699"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1491301766699"/>
</xsl:stylesheet>