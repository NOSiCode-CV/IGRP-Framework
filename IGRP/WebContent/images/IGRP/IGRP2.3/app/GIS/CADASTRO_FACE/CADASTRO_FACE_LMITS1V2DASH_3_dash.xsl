<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- CHART CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/highcharts/igrp.charts.css"/>
                <!-- SMALLBOX CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/smallbox/smallbox.css"/>
                <!-- TABLE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css"/>
                <!-- SELECT CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.min.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.style.css"/>
                <!-- DATE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/datetimepicker/css/datetimepicker.css"/>
                <style/>
            </head>
            <body class="{$bodyClass}">
                <xsl:call-template name="IGRP-topmenu"/>
                <form method="POST" class="IGRP-form" name="formular_default">
                    <div class="container-fluid">
                        <div class="row">
                            <xsl:call-template name="IGRP-sidebar"/>
                            <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
                                <div class="content">
                                    <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                                    <div class="row">
                                        <div class="gen-column col-1-1">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/page_title">
                                                    <section class="content-header gen-container-item " item-name="page_title">
                                                        <h1>
                                                            <xsl:value-of select="rows/content/page_title/fields/page_title_text/value"/>
                                                        </h1>
                                                    </section>
                                                </xsl:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/form_1">
                                                    <div class="box igrp-forms gen-container-item " item-name="form_1">
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
                                                                <xsl:if test="rows/content/form_1/fields/natureza">
                                                                    <div class="col-md-2 form-group  gen-fields-holder" item-name="natureza" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/natureza/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/natureza/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_natureza" name="{rows/content/form_1/fields/natureza/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/natureza/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/tipo_predio">
                                                                    <div class="col-md-2 form-group  gen-fields-holder" item-name="tipo_predio" item-type="select">
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
                                                <xsl:if test="rows/content/smallbox_3">
                                                    <div class="small-box panel {rows/content/smallbox_3/fields/smallbox_3_bg/value} gen-container-item " item-name="smallbox_3">
                                                        <div class="panel-heading">
                                                            <div class="row">
                                                                <div class="col-xs-3">
                                                                    <i class="fa {rows/content/smallbox_3/fields/smallbox_3_icon/value} fa-5x"/>
                                                                </div>
                                                                <div class="col-xs-9 text-right">
                                                                    <div class="huge">
                                                                        <xsl:value-of select="rows/content/smallbox_3/fields/smallbox_3_value/value"/>
                                                                    </div>
                                                                    <div>
                                                                        <xsl:value-of select="rows/content/smallbox_3/fields/smallbox_3_sbtitle/value"/>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <a href="{rows/content/smallbox_3/fields/smallbox_3_link/value}" class="{rows/content/smallbox_3/fields/smallbox_3_bg/value}-text">
                                                            <div class="panel-footer">
                                                                <span class="pull-left">
                                                                    <xsl:value-of select="rows/content/smallbox_3/fields/smallbox_3_link_label/value"/>
                                                                </span>
                                                                <span class="pull-right">
                                                                    <i class="fa fa-arrow-circle-right"/>
                                                                </span>
                                                                <div class="clearfix"/></div>
                                                        </a>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                        <div class="gen-column col-md-3">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/smallbox_2">
                                                    <div class="small-box panel {rows/content/smallbox_2/fields/smallbox_2_bg/value} gen-container-item " item-name="smallbox_2">
                                                        <div class="panel-heading">
                                                            <div class="row">
                                                                <div class="col-xs-3">
                                                                    <i class="fa {rows/content/smallbox_2/fields/smallbox_2_icon/value} fa-5x"/>
                                                                </div>
                                                                <div class="col-xs-9 text-right">
                                                                    <div class="huge">
                                                                        <xsl:value-of select="rows/content/smallbox_2/fields/smallbox_2_value/value"/>
                                                                    </div>
                                                                    <div>
                                                                        <xsl:value-of select="rows/content/smallbox_2/fields/smallbox_2_sbtitle/value"/>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <a href="{rows/content/smallbox_2/fields/smallbox_2_link/value}" class="{rows/content/smallbox_2/fields/smallbox_2_bg/value}-text">
                                                            <div class="panel-footer">
                                                                <span class="pull-left">
                                                                    <xsl:value-of select="rows/content/smallbox_2/fields/smallbox_2_link_label/value"/>
                                                                </span>
                                                                <span class="pull-right">
                                                                    <i class="fa fa-arrow-circle-right"/>
                                                                </span>
                                                                <div class="clearfix"/></div>
                                                        </a>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                        <div class="gen-column col-md-3">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/smallbox_1">
                                                    <div class="small-box panel {rows/content/smallbox_1/fields/smallbox_1_bg/value} gen-container-item " item-name="smallbox_1">
                                                        <div class="panel-heading">
                                                            <div class="row">
                                                                <div class="col-xs-3">
                                                                    <i class="fa {rows/content/smallbox_1/fields/smallbox_1_icon/value} fa-5x"/>
                                                                </div>
                                                                <div class="col-xs-9 text-right">
                                                                    <div class="huge">
                                                                        <xsl:value-of select="rows/content/smallbox_1/fields/smallbox_1_value/value"/>
                                                                    </div>
                                                                    <div>
                                                                        <xsl:value-of select="rows/content/smallbox_1/fields/smallbox_1_sbtitle/value"/>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <a href="{rows/content/smallbox_1/fields/smallbox_1_link/value}" class="{rows/content/smallbox_1/fields/smallbox_1_bg/value}-text">
                                                            <div class="panel-footer">
                                                                <span class="pull-left">
                                                                    <xsl:value-of select="rows/content/smallbox_1/fields/smallbox_1_link_label/value"/>
                                                                </span>
                                                                <span class="pull-right">
                                                                    <i class="fa fa-arrow-circle-right"/>
                                                                </span>
                                                                <div class="clearfix"/></div>
                                                        </a>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                        <div class="gen-column col-md-3">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/sb_parc_user">
                                                    <div class="small-box panel {rows/content/sb_parc_user/fields/sb_parc_user_bg/value} gen-container-item " item-name="sb_parc_user">
                                                        <div class="panel-heading">
                                                            <div class="row">
                                                                <div class="col-xs-3">
                                                                    <i class="fa {rows/content/sb_parc_user/fields/sb_parc_user_icon/value} fa-5x"/>
                                                                </div>
                                                                <div class="col-xs-9 text-right">
                                                                    <div class="huge">
                                                                        <xsl:value-of select="rows/content/sb_parc_user/fields/sb_parc_user_value/value"/>
                                                                    </div>
                                                                    <div>
                                                                        <xsl:value-of select="rows/content/sb_parc_user/fields/sb_parc_user_sbtitle/value"/>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <a href="{rows/content/sb_parc_user/fields/sb_parc_user_link/value}" class="{rows/content/sb_parc_user/fields/sb_parc_user_bg/value}-text">
                                                            <div class="panel-footer">
                                                                <span class="pull-left">
                                                                    <xsl:value-of select="rows/content/sb_parc_user/fields/sb_parc_user_link_label/value"/>
                                                                </span>
                                                                <span class="pull-right">
                                                                    <i class="fa fa-arrow-circle-right"/>
                                                                </span>
                                                                <div class="clearfix"/></div>
                                                        </a>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="gen-column col-md-7">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/chart_1">
                                                    <div class="box gen-container-item " gen-structure="graphic" item-name="chart_1">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/chart_1/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <xsl:call-template name="igrp-graph">
                                                                <xsl:with-param name="table" select="rows/content/chart_1"/>
                                                                <xsl:with-param name="chart_type" select="'bar'"/>
                                                                <xsl:with-param name="height" select="'250'"/>
                                                                <xsl:with-param name="title" select="'Mapa Parecer'"/>
                                                                <xsl:with-param name="url" select="rows/content/chart_1/url"/>
                                                            </xsl:call-template>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                        <div class="gen-column col-md-5">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/zonas_em_consulta">
                                                    <div class="box box-table-contents gen-container-item " item-name="zonas_em_consulta">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/zonas_em_consulta/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body table-box">
                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/zonas_em_consulta/fields"/>
                                                            <table id="zonas_em_consulta" class="table table-striped gen-data-table ">
                                                                <thead>
                                                                    <tr>
                                                                        <xsl:if test="rows/content/zonas_em_consulta/fields/zona">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/zonas_em_consulta/fields/zona/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/zonas_em_consulta/fields/predios">
                                                                            <th align="right" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/zonas_em_consulta/fields/predios/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/zonas_em_consulta/fields/per_zona_em_consulta">
                                                                            <th align="right" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/zonas_em_consulta/fields/per_zona_em_consulta/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/zonas_em_consulta/table/value/row">
                                                                        <tr>
                                                                            <xsl:if test="zona">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/zona/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="zona"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="predios">
                                                                                <td align="right" data-row="{position()}" data-title="{../../fields/predios/label}" class="number">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="predios"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="per_zona_em_consulta">
                                                                                <td align="right" data-row="{position()}" data-title="{../../fields/per_zona_em_consulta/label}" class="number">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="per_zona_em_consulta"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                        </tr>
                                                                    </xsl:for-each>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="gen-column col-md-7">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/chart_parecer_user">
                                                    <div class="box gen-container-item " gen-structure="graphic" item-name="chart_parecer_user">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/chart_parecer_user/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <xsl:call-template name="igrp-graph">
                                                                <xsl:with-param name="table" select="rows/content/chart_parecer_user"/>
                                                                <xsl:with-param name="chart_type" select="'bar'"/>
                                                                <xsl:with-param name="height" select="'250'"/>
                                                                <xsl:with-param name="title" select="'Chart'"/>
                                                                <xsl:with-param name="url" select="rows/content/chart_parecer_user/url"/>
                                                            </xsl:call-template>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                        <div class="gen-column col-md-5">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/chart_parecer_tipos">
                                                    <div class="box gen-container-item " gen-structure="graphic" item-name="chart_parecer_tipos">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/chart_parecer_tipos/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <xsl:call-template name="igrp-graph">
                                                                <xsl:with-param name="table" select="rows/content/chart_parecer_tipos"/>
                                                                <xsl:with-param name="chart_type" select="'column'"/>
                                                                <xsl:with-param name="height" select="'250'"/>
                                                                <xsl:with-param name="title" select="'Parecers Por Tipo'"/>
                                                                <xsl:with-param name="url" select="rows/content/chart_parecer_tipos/url"/>
                                                            </xsl:call-template>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="gen-column col-md-4">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/chart_predios_natureza">
                                                    <div class="box gen-container-item " gen-structure="graphic" item-name="chart_predios_natureza">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/chart_predios_natureza/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <xsl:call-template name="igrp-graph">
                                                                <xsl:with-param name="table" select="rows/content/chart_predios_natureza"/>
                                                                <xsl:with-param name="chart_type" select="'pie'"/>
                                                                <xsl:with-param name="height" select="'250'"/>
                                                                <xsl:with-param name="title" select="'Predios Por Natureza'"/>
                                                                <xsl:with-param name="url" select="rows/content/chart_predios_natureza/url"/>
                                                            </xsl:call-template>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                        <div class="gen-column col-md-4">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/chart_terreno_fracao">
                                                    <div class="box gen-container-item " gen-structure="graphic" item-name="chart_terreno_fracao">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/chart_terreno_fracao/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <xsl:call-template name="igrp-graph">
                                                                <xsl:with-param name="table" select="rows/content/chart_terreno_fracao"/>
                                                                <xsl:with-param name="chart_type" select="'pie'"/>
                                                                <xsl:with-param name="height" select="'250'"/>
                                                                <xsl:with-param name="title" select="'Terrenos Vs Fração'"/>
                                                                <xsl:with-param name="url" select="rows/content/chart_terreno_fracao/url"/>
                                                            </xsl:call-template>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                        <div class="gen-column col-md-4">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/chart_predios_genero">
                                                    <div class="box gen-container-item " gen-structure="graphic" item-name="chart_predios_genero">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/chart_predios_genero/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <xsl:call-template name="igrp-graph">
                                                                <xsl:with-param name="table" select="rows/content/chart_predios_genero"/>
                                                                <xsl:with-param name="chart_type" select="'column'"/>
                                                                <xsl:with-param name="height" select="'250'"/>
                                                                <xsl:with-param name="title" select="'Predios Por Genero'"/>
                                                                <xsl:with-param name="url" select="rows/content/chart_predios_genero/url"/>
                                                            </xsl:call-template>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="gen-column col-md-5">
                                            <div class="gen-inner"/></div>
                                        <div class="gen-column col-md-7">
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
                <!-- TABLE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/table/jquery.dataTables.min.js"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/dataTables.bootstrap.min.js"/>
                <!-- SELECT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js"/>
                <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js"/>
                <!-- DATE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/datetimepicker.js"/>
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/dtp.init.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1481819339402"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1481819339402"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1481819339402"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1481819339402"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1481819339402"/>
    <xsl:include href="../../xsl/tmpl/IGRP-charts.tmpl.xsl?v=1481819339402"/>
    <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1481819339402"/>
</xsl:stylesheet>