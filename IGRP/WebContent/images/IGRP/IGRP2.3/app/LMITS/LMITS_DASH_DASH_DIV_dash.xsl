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
                                                <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                                                <xsl:if test="rows/content/form_1">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                                                <xsl:if test="rows/content/form_1/fields/metrica">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="metrica" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/metrica/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/metrica/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_metrica" name="{rows/content/form_1/fields/metrica/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/metrica/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/ano">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="ano" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/ano/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/ano/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/ano/value}" class="form-control" id="{rows/content/form_1/fields/ano/@name}" name="{rows/content/form_1/fields/ano/@name}" maxlength="30"></input>
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
                                                                <xsl:if test="rows/content/form_1/fields/tipo_cobranca">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="tipo_cobranca" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/tipo_cobranca/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/tipo_cobranca/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_tipo_cobranca" name="{rows/content/form_1/fields/tipo_cobranca/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/tipo_cobranca/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/estado_divida">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="estado_divida" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/estado_divida/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/estado_divida/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_estado_divida" name="{rows/content/form_1/fields/estado_divida/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/estado_divida/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/data_de">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="data_de" item-type="date">
                                                                        <label for="{rows/content/form_1/fields/data_de/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/data_de/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_1/fields/data_de/value}" class="form-control gen-date" id="form_1-data_de" name="{rows/content/form_1/fields/data_de/@name}" format="IGRP_datePicker" maxlength="30"/>
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-default">
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
                                                                            <input type="text" value="{rows/content/form_1/fields/data_ate/value}" class="form-control gen-date" id="form_1-data_ate" name="{rows/content/form_1/fields/data_ate/@name}" format="IGRP_datePicker" maxlength="30"/>
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-default">
                                                                                    <i class="fa fa-calendar"/>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/zona">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="zona" item-type="lookup">
                                                                        <label for="{rows/content/form_1/fields/zona/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/zona/label"/>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_1/fields/zona/value}" class="form-control gen-lookup" id="form_1_zona" name="{rows/content/form_1/fields/zona/@name}" maxlength="30"/>
                                                                            <xsl:call-template name="lookup-tool">
                                                                                <xsl:with-param name="page" select="rows/page"/>
                                                                                <xsl:with-param name="ad_hoc" select="'1'"/>
                                                                                <xsl:with-param name="action" select="'LOOKUP'"/>
                                                                                <xsl:with-param name="name" select="rows/content/form_1/fields/zona/@name"/>
                                                                                <xsl:with-param name="js_lookup" select="rows/content/form_1/fields/zona/lookup"/>
                                                                                <xsl:with-param name="input-id" select="'form_1_zona'"/>
                                                                                <xsl:with-param name="btnClass" select="'default'"/>
                                                                            </xsl:call-template>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/utente">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="utente" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/utente/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/utente/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/utente/value}" class="form-control" id="{rows/content/form_1/fields/utente/@name}" name="{rows/content/form_1/fields/utente/@name}" maxlength="300"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/proprietario">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="proprietario" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/proprietario/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/proprietario/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/proprietario/value}" class="form-control" id="{rows/content/form_1/fields/proprietario/@name}" name="{rows/content/form_1/fields/proprietario/@name}" maxlength="300"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/matriz">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="matriz" item-type="lookup">
                                                                        <label for="{rows/content/form_1/fields/matriz/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/matriz/label"/>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_1/fields/matriz/value}" class="form-control gen-lookup" id="form_1_matriz" name="{rows/content/form_1/fields/matriz/@name}" maxlength="30"/>
                                                                            <xsl:call-template name="lookup-tool">
                                                                                <xsl:with-param name="page" select="rows/page"/>
                                                                                <xsl:with-param name="ad_hoc" select="'1'"/>
                                                                                <xsl:with-param name="action" select="'LOOKUP'"/>
                                                                                <xsl:with-param name="name" select="rows/content/form_1/fields/matriz/@name"/>
                                                                                <xsl:with-param name="js_lookup" select="rows/content/form_1/fields/matriz/lookup"/>
                                                                                <xsl:with-param name="input-id" select="'form_1_matriz'"/>
                                                                                <xsl:with-param name="btnClass" select="'default'"/>
                                                                            </xsl:call-template>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/nip">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="nip" item-type="lookup">
                                                                        <label for="{rows/content/form_1/fields/nip/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/nip/label"/>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_1/fields/nip/value}" class="form-control gen-lookup" id="form_1_nip" name="{rows/content/form_1/fields/nip/@name}" maxlength="30"/>
                                                                            <xsl:call-template name="lookup-tool">
                                                                                <xsl:with-param name="page" select="rows/page"/>
                                                                                <xsl:with-param name="ad_hoc" select="'1'"/>
                                                                                <xsl:with-param name="action" select="'LOOKUP'"/>
                                                                                <xsl:with-param name="name" select="rows/content/form_1/fields/nip/@name"/>
                                                                                <xsl:with-param name="js_lookup" select="rows/content/form_1/fields/nip/lookup"/>
                                                                                <xsl:with-param name="input-id" select="'form_1_nip'"/>
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
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="gen-column col-md-4">
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
                                        <div class="gen-column col-md-4">
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
                                        <div class="gen-column col-md-4">
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
                                    </div>
                                    <div class="row">
                                        <div class="gen-column col-md-4">
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
                                                                <xsl:with-param name="chart_type" select="'bar'"/>
                                                                <xsl:with-param name="height" select="'250'"/>
                                                                <xsl:with-param name="title" select="'Liquidados por Tipo Cobrança'"/>
                                                                <xsl:with-param name="url" select="rows/content/chart_2/url"/>
                                                            </xsl:call-template>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                        <div class="gen-column col-md-4">
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
                                                                <xsl:with-param name="chart_type" select="'bar'"/>
                                                                <xsl:with-param name="height" select="'250'"/>
                                                                <xsl:with-param name="title" select="'Dívida por Tipo Cobrança'"/>
                                                                <xsl:with-param name="url" select="rows/content/chart_3/url"/>
                                                            </xsl:call-template>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                        <div class="gen-column col-md-4">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/chart_4">
                                                    <div class="box gen-container-item " gen-structure="graphic" gen-class="" item-name="chart_4">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/chart_4/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <xsl:call-template name="igrp-graph">
                                                                <xsl:with-param name="table" select="rows/content/chart_4"/>
                                                                <xsl:with-param name="chart_type" select="'bar'"/>
                                                                <xsl:with-param name="height" select="'250'"/>
                                                                <xsl:with-param name="title" select="'Pagos por Tipo Cobrança'"/>
                                                                <xsl:with-param name="url" select="rows/content/chart_4/url"/>
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
                                                <xsl:if test="rows/content/chart_1">
                                                    <div class="box gen-container-item " gen-structure="graphic" gen-class="" item-name="chart_1">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/chart_1/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <xsl:call-template name="igrp-graph">
                                                                <xsl:with-param name="table" select="rows/content/chart_1"/>
                                                                <xsl:with-param name="chart_type" select="'column'"/>
                                                                <xsl:with-param name="height" select="'250'"/>
                                                                <xsl:with-param name="title" select="'Registos por: Tipo Cobrança e Estado da Dívida'"/>
                                                                <xsl:with-param name="url" select="rows/content/chart_1/url"/>
                                                            </xsl:call-template>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                        <div class="gen-column col-md-6">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/chart_9">
                                                    <div class="box gen-container-item " gen-structure="graphic" gen-class="" item-name="chart_9">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/chart_9/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <xsl:call-template name="igrp-graph">
                                                                <xsl:with-param name="table" select="rows/content/chart_9"/>
                                                                <xsl:with-param name="chart_type" select="'pie'"/>
                                                                <xsl:with-param name="height" select="'250'"/>
                                                                <xsl:with-param name="title" select="'Registos por Estado de Dívida'"/>
                                                                <xsl:with-param name="url" select="rows/content/chart_9/url"/>
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
                                                <xsl:if test="rows/content/chart_5">
                                                    <div class="box gen-container-item " gen-structure="graphic" gen-class="" item-name="chart_5">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/chart_5/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <xsl:call-template name="igrp-graph">
                                                                <xsl:with-param name="table" select="rows/content/chart_5"/>
                                                                <xsl:with-param name="chart_type" select="'line'"/>
                                                                <xsl:with-param name="height" select="'250'"/>
                                                                <xsl:with-param name="title" select="'Evolução de Estado de Pagamentos'"/>
                                                                <xsl:with-param name="url" select="rows/content/chart_5/url"/>
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
                                                <xsl:if test="rows/content/chart_6">
                                                    <div class="box gen-container-item " gen-structure="graphic" gen-class="" item-name="chart_6">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/chart_6/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <xsl:call-template name="igrp-graph">
                                                                <xsl:with-param name="table" select="rows/content/chart_6"/>
                                                                <xsl:with-param name="chart_type" select="'bar'"/>
                                                                <xsl:with-param name="height" select="'250'"/>
                                                                <xsl:with-param name="title" select="'Top 5 - Zonas maior potencial de receitas'"/>
                                                                <xsl:with-param name="url" select="rows/content/chart_6/url"/>
                                                            </xsl:call-template>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                        <div class="gen-column col-md-6">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/chart_7">
                                                    <div class="box gen-container-item " gen-structure="graphic" gen-class="" item-name="chart_7">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/chart_7/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <xsl:call-template name="igrp-graph">
                                                                <xsl:with-param name="table" select="rows/content/chart_7"/>
                                                                <xsl:with-param name="chart_type" select="'pie'"/>
                                                                <xsl:with-param name="height" select="'250'"/>
                                                                <xsl:with-param name="title" select="'Top 5 - Zonas com mais dívidas'"/>
                                                                <xsl:with-param name="url" select="rows/content/chart_7/url"/>
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
                                                <xsl:if test="rows/content/chart_8">
                                                    <div class="box gen-container-item " gen-structure="graphic" gen-class="" item-name="chart_8">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/chart_8/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <xsl:call-template name="igrp-graph">
                                                                <xsl:with-param name="table" select="rows/content/chart_8"/>
                                                                <xsl:with-param name="chart_type" select="'line'"/>
                                                                <xsl:with-param name="height" select="'250'"/>
                                                                <xsl:with-param name="title" select="'Prescrições Mensais'"/>
                                                                <xsl:with-param name="url" select="rows/content/chart_8/url"/>
                                                            </xsl:call-template>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                        <div class="gen-column col-md-6">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/chart_10">
                                                    <div class="box gen-container-item " gen-structure="graphic" gen-class="" item-name="chart_10">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/chart_10/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <xsl:call-template name="igrp-graph">
                                                                <xsl:with-param name="table" select="rows/content/chart_10"/>
                                                                <xsl:with-param name="chart_type" select="'pie'"/>
                                                                <xsl:with-param name="height" select="'250'"/>
                                                                <xsl:with-param name="title" select="'Taxa de Prescrição'"/>
                                                                <xsl:with-param name="url" select="rows/content/chart_10/url"/>
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
                <!-- LOOKUP JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/lookup/igrp.lookup.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1487427988087"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1487427988087"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1487427988087"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1487427988087"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1487427988088"/>
    <xsl:include href="../../xsl/tmpl/IGRP-charts.tmpl.xsl?v=1487427988088"/>
</xsl:stylesheet>