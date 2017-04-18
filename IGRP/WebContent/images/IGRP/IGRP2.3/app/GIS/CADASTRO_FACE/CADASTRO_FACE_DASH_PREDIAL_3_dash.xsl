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
                <!-- TABLE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css"/>
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
                                                                <xsl:if test="rows/content/form_1/fields/objetivo">
                                                                    <div class="form-group col-md-2   gen-fields-holder" item-name="objetivo" item-type="number">
                                                                        <label for="{rows/content/form_1/fields/objetivo/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/objetivo/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="number" value="{rows/content/form_1/fields/objetivo/value}" class="form-control" id="{rows/content/form_1/fields/objetivo/@name}" name="{rows/content/form_1/fields/objetivo/@name}" maxlength="30"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/proposta_diaria">
                                                                    <div class="form-group col-md-2   gen-fields-holder" item-name="proposta_diaria" item-type="number">
                                                                        <label for="{rows/content/form_1/fields/proposta_diaria/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/proposta_diaria/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="number" value="{rows/content/form_1/fields/proposta_diaria/value}" class="form-control" id="{rows/content/form_1/fields/proposta_diaria/@name}" name="{rows/content/form_1/fields/proposta_diaria/@name}" maxlength="30"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/data_do_objetivo">
                                                                    <div class="form-group col-md-2  gen-fields-holder" item-name="data_do_objetivo" item-type="date">
                                                                        <label for="{rows/content/form_1/fields/data_do_objetivo/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/data_do_objetivo/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_1/fields/data_do_objetivo/value}" class="form-control gen-date" id="form_1-data_do_objetivo" name="{rows/content/form_1/fields/data_do_objetivo/@name}" format="IGRP_datePicker" maxlength="30"/>
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
                                        <div class="gen-column col-md-2">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/crl_goal">
                                                    <div class="circlestatbox-container gen-container-item " gen-class="" item-name="crl_goal">
                                                        <div class="circlestatbox {rows/content/crl_goal/fields/crl_goal_bg/value}">
                                                            <div class="header">
                                                                <xsl:value-of select="rows/content/crl_goal/fields/crl_goal_tit/value"/>
                                                            </div>
                                                            <span class="percent">
                                                                <xsl:value-of select="rows/content/crl_goal/fields/crl_goal_lbl/value"/>
                                                            </span>
                                                            <div class="circleStat">
                                                                <input type="text" value="{rows/content/crl_goal/fields/crl_goal_val/value}" class="circlestats-chart" readonly="readonly"/>
                                                            </div>
                                                            <div class="footer">
                                                                <a class="clickable" target="modal" style="display: block;" href="{rows/content/crl_goal/fields/crl_goal_url/value}">
                                                                    <span class="description">
                                                                        <xsl:value-of select="rows/content/crl_goal/fields/crl_goal_desc/value"/>
                                                                    </span>
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                        <div class="gen-column col-md-8">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/table_1">
                                                    <div class="box box-table-contents gen-container-item " gen-class="" item-name="table_1">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/table_1/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body table-box">
                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/table_1/fields"/>
                                                            <table id="table_1" class="table table-striped gen-data-table ">
                                                                <thead>
                                                                    <tr>
                                                                        <xsl:if test="rows/content/table_1/fields/periodo">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/periodo/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/proposta">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/proposta/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/realizada">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/realizada/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/necessaria">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/necessaria/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/table_1/table/value/row">
                                                                        <tr>
                                                                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                                            <xsl:if test="periodo">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/periodo/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="periodo"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="proposta">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/proposta/label}" class="number">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="proposta"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="realizada">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/realizada/label}" class="number">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="realizada"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="necessaria">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/necessaria/label}" class="number">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="necessaria"/>
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
                                        <div class="gen-column col-md-2">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/circl_7000">
                                                    <div class="circlestatbox-container gen-container-item " gen-class="" item-name="circl_7000">
                                                        <div class="circlestatbox {rows/content/circl_7000/fields/circl_7000_bg/value}">
                                                            <div class="header">
                                                                <xsl:value-of select="rows/content/circl_7000/fields/circl_7000_tit/value"/>
                                                            </div>
                                                            <span class="percent">
                                                                <xsl:value-of select="rows/content/circl_7000/fields/circl_7000_lbl/value"/>
                                                            </span>
                                                            <div class="circleStat">
                                                                <input type="text" value="{rows/content/circl_7000/fields/circl_7000_val/value}" class="circlestats-chart" readonly="readonly"/>
                                                            </div>
                                                            <div class="footer">
                                                                <a class="clickable" target="modal" style="display: block;" href="{rows/content/circl_7000/fields/circl_7000_url/value}">
                                                                    <span class="description">
                                                                        <xsl:value-of select="rows/content/circl_7000/fields/circl_7000_desc/value"/>
                                                                    </span>
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="gen-column col-md-6">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/chart_performance_usr">
                                                    <div class="box gen-container-item " gen-structure="graphic" gen-class="" item-name="chart_performance_usr">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/chart_performance_usr/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <xsl:call-template name="igrp-graph">
                                                                <xsl:with-param name="table" select="rows/content/chart_performance_usr"/>
                                                                <xsl:with-param name="chart_type" select="rows/content/chart_performance_usr/chart_type"/>
                                                                <xsl:with-param name="height" select="'250'"/>
                                                                <xsl:with-param name="title" select="'Performance Utilizadores'"/>
                                                                <xsl:with-param name="url" select="rows/content/chart_performance_usr/url"/>
                                                            </xsl:call-template>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                        <div class="gen-column col-md-6">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/chart_ritmo">
                                                    <div class="box gen-container-item " gen-structure="graphic" gen-class="" item-name="chart_ritmo">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/chart_ritmo/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <xsl:call-template name="igrp-graph">
                                                                <xsl:with-param name="table" select="rows/content/chart_ritmo"/>
                                                                <xsl:with-param name="chart_type" select="rows/content/chart_ritmo/chart_type"/>
                                                                <xsl:with-param name="height" select="'250'"/>
                                                                <xsl:with-param name="title" select="'Ritmo Ultimos 10 Dias'"/>
                                                                <xsl:with-param name="url" select="rows/content/chart_ritmo/url"/>
                                                            </xsl:call-template>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="gen-column col-md-3">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/circlestatbox_5">
                                                    <div class="circlestatbox-container gen-container-item " gen-class="" item-name="circlestatbox_5">
                                                        <div class="circlestatbox {rows/content/circlestatbox_5/fields/circlestatbox_5_bg/value}">
                                                            <div class="header">
                                                                <xsl:value-of select="rows/content/circlestatbox_5/fields/circlestatbox_5_tit/value"/>
                                                            </div>
                                                            <span class="percent">
                                                                <xsl:value-of select="rows/content/circlestatbox_5/fields/circlestatbox_5_lbl/value"/>
                                                            </span>
                                                            <div class="circleStat">
                                                                <input type="text" value="{rows/content/circlestatbox_5/fields/circlestatbox_5_val/value}" class="circlestats-chart" readonly="readonly"/>
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
                                        <div class="gen-column col-md-3">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/circlestatbox_2">
                                                    <div class="circlestatbox-container gen-container-item " gen-class="" item-name="circlestatbox_2">
                                                        <div class="circlestatbox {rows/content/circlestatbox_2/fields/circlestatbox_2_bg/value}">
                                                            <div class="header">
                                                                <xsl:value-of select="rows/content/circlestatbox_2/fields/circlestatbox_2_tit/value"/>
                                                            </div>
                                                            <span class="percent">
                                                                <xsl:value-of select="rows/content/circlestatbox_2/fields/circlestatbox_2_lbl/value"/>
                                                            </span>
                                                            <div class="circleStat">
                                                                <input type="text" value="{rows/content/circlestatbox_2/fields/circlestatbox_2_val/value}" class="circlestats-chart" readonly="readonly"/>
                                                            </div>
                                                            <div class="footer">
                                                                <a class="clickable" target="modal" style="display: block;" href="{rows/content/circlestatbox_2/fields/circlestatbox_2_url/value}">
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
                                        <div class="gen-column col-md-3">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/circlestatbox_3">
                                                    <div class="circlestatbox-container gen-container-item " gen-class="" item-name="circlestatbox_3">
                                                        <div class="circlestatbox {rows/content/circlestatbox_3/fields/circlestatbox_3_bg/value}">
                                                            <div class="header">
                                                                <xsl:value-of select="rows/content/circlestatbox_3/fields/circlestatbox_3_tit/value"/>
                                                            </div>
                                                            <span class="percent">
                                                                <xsl:value-of select="rows/content/circlestatbox_3/fields/circlestatbox_3_lbl/value"/>
                                                            </span>
                                                            <div class="circleStat">
                                                                <input type="text" value="{rows/content/circlestatbox_3/fields/circlestatbox_3_val/value}" class="circlestats-chart" readonly="readonly"/>
                                                            </div>
                                                            <div class="footer">
                                                                <a class="clickable" target="modal" style="display: block;" href="{rows/content/circlestatbox_3/fields/circlestatbox_3_url/value}">
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
                                        <div class="gen-column col-md-3">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/circlestatbox_4">
                                                    <div class="circlestatbox-container gen-container-item " gen-class="" item-name="circlestatbox_4">
                                                        <div class="circlestatbox {rows/content/circlestatbox_4/fields/circlestatbox_4_bg/value}">
                                                            <div class="header">
                                                                <xsl:value-of select="rows/content/circlestatbox_4/fields/circlestatbox_4_tit/value"/>
                                                            </div>
                                                            <span class="percent">
                                                                <xsl:value-of select="rows/content/circlestatbox_4/fields/circlestatbox_4_lbl/value"/>
                                                            </span>
                                                            <div class="circleStat">
                                                                <input type="text" value="{rows/content/circlestatbox_4/fields/circlestatbox_4_val/value}" class="circlestats-chart" readonly="readonly"/>
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
                <!-- TABLE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/table/jquery.dataTables.min.js"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/dataTables.bootstrap.min.js"/>
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
                <!-- RULES -->
                <script src="{$path}/core/igrp/IGRP.rules.class.js"/>
                <script>
$.IGRP.rules.set({"p_ilha":[{"name":"Change Ilha","event":"change","condition":"notnull","value":"","value2":"","patern":"","patern_custom":"","action":"remote_combobox","targets":"cidadezona","procedure":"cadastro.STATS_CONFIG.SQL_CIDADE_ZONA","msg_type":"","msg":"","opposite":"","isTable":false},{"name":"Load Ilha","event":"load","condition":"notnull","value":"","value2":"","patern":"","patern_custom":"","action":"remote_combobox","targets":"cidadezona","procedure":"cadastro.STATS_CONFIG.SQL_CIDADE_ZONA","msg_type":"","msg":"","opposite":"","isTable":false}],"p_cidadezona":[{"name":"change  CIDADE","event":"change","condition":"notnull","value":"","value2":"","patern":"","patern_custom":"","action":"remote_combobox","targets":"bairrolugar","procedure":"cadastro.STATS_CONFIG.SQL_bairro_lugar","msg_type":"","msg":"","opposite":"","isTable":false},{"name":"Load Cidade","event":"load","condition":"notnull","value":"","value2":"","patern":"","patern_custom":"","action":"remote_combobox","targets":"bairrolugar","procedure":"cadastro.STATS_CONFIG.SQL_bairro_lugar","msg_type":"","msg":"","opposite":"","isTable":false}]});</script>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1488470091021"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1488470091021"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1488470091021"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1488470091021"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1488470091021"/>
    <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1488470091022"/>
    <xsl:include href="../../xsl/tmpl/IGRP-charts.tmpl.xsl?v=1488470091022"/>
</xsl:stylesheet>