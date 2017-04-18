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
                                                <xsl:if test="rows/content/sectionheader_1">
                                                    <section class="content-header gen-container-item " gen-class="" item-name="sectionheader_1">
                                                        <h2>
                                                            <xsl:value-of select="rows/content/sectionheader_1/fields/sectionheader_1_text/value"/>
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
                                                                <xsl:if test="rows/content/form_1/fields/data_inicio">
                                                                    <div class="form-group col-md-2  gen-fields-holder" item-name="data_inicio" item-type="date">
                                                                        <label for="{rows/content/form_1/fields/data_inicio/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/data_inicio/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_1/fields/data_inicio/value}" class="form-control gen-date " id="form_1-data_inicio" name="{rows/content/form_1/fields/data_inicio/@name}" format="IGRP_datePicker" maxlength="30"/>
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
                                                                            <input type="text" value="{rows/content/form_1/fields/data_fim/value}" class="form-control gen-date " id="form_1-data_fim" name="{rows/content/form_1/fields/data_fim/@name}" format="IGRP_datePicker" maxlength="30"/>
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
                                        <div class="gen-column col-md-3">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/crl_lev">
                                                    <div class="circlestatbox-container csb-small gen-container-item " gen-class="" item-name="crl_lev">
                                                        <div class="circlestatbox {rows/content/crl_lev/fields/crl_lev_bg/value}">
                                                            <div class="header">
                                                                <xsl:value-of select="rows/content/crl_lev/fields/crl_lev_tit/value"/>
                                                            </div>
                                                            <span class="percent">
                                                                <xsl:value-of select="rows/content/crl_lev/fields/crl_lev_lbl/value"/>
                                                            </span>
                                                            <div class="circleStat">
                                                                <input type="text" value="{rows/content/crl_lev/fields/crl_lev_val/value}" size="small" class="circlestats-chart" readonly="readonly"/>
                                                            </div>
                                                            <div class="footer">
                                                                <a class="clickable" target="_self" style="display: block;" href="{rows/content/crl_lev/fields/crl_lev_url/value}">
                                                                    <span class="description">
                                                                        <xsl:value-of select="rows/content/crl_lev/fields/crl_lev_desc/value"/>
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
                                                <xsl:if test="rows/content/crl_eat">
                                                    <div class="circlestatbox-container csb-small gen-container-item " gen-class="" item-name="crl_eat">
                                                        <div class="circlestatbox {rows/content/crl_eat/fields/crl_eat_bg/value}">
                                                            <div class="header">
                                                                <xsl:value-of select="rows/content/crl_eat/fields/crl_eat_tit/value"/>
                                                            </div>
                                                            <span class="percent">
                                                                <xsl:value-of select="rows/content/crl_eat/fields/crl_eat_lbl/value"/>
                                                            </span>
                                                            <div class="circleStat">
                                                                <input type="text" value="{rows/content/crl_eat/fields/crl_eat_val/value}" size="small" class="circlestats-chart" readonly="readonly"/>
                                                            </div>
                                                            <div class="footer">
                                                                <a class="clickable" target="_self" style="display: block;" href="{rows/content/crl_eat/fields/crl_eat_url/value}">
                                                                    <span class="description">
                                                                        <xsl:value-of select="rows/content/crl_eat/fields/crl_eat_desc/value"/>
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
                                                <xsl:if test="rows/content/crl_consul">
                                                    <div class="circlestatbox-container csb-small gen-container-item " gen-class="" item-name="crl_consul">
                                                        <div class="circlestatbox {rows/content/crl_consul/fields/crl_consul_bg/value}">
                                                            <div class="header">
                                                                <xsl:value-of select="rows/content/crl_consul/fields/crl_consul_tit/value"/>
                                                            </div>
                                                            <span class="percent">
                                                                <xsl:value-of select="rows/content/crl_consul/fields/crl_consul_lbl/value"/>
                                                            </span>
                                                            <div class="circleStat">
                                                                <input type="text" value="{rows/content/crl_consul/fields/crl_consul_val/value}" size="small" class="circlestats-chart" readonly="readonly"/>
                                                            </div>
                                                            <div class="footer">
                                                                <a class="clickable" target="_self" style="display: block;" href="{rows/content/crl_consul/fields/crl_consul_url/value}">
                                                                    <span class="description">
                                                                        <xsl:value-of select="rows/content/crl_consul/fields/crl_consul_desc/value"/>
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
                                                <xsl:if test="rows/content/crl_cad">
                                                    <div class="circlestatbox-container csb-small gen-container-item " gen-class="" item-name="crl_cad">
                                                        <div class="circlestatbox {rows/content/crl_cad/fields/crl_cad_bg/value}">
                                                            <div class="header">
                                                                <xsl:value-of select="rows/content/crl_cad/fields/crl_cad_tit/value"/>
                                                            </div>
                                                            <span class="percent">
                                                                <xsl:value-of select="rows/content/crl_cad/fields/crl_cad_lbl/value"/>
                                                            </span>
                                                            <div class="circleStat">
                                                                <input type="text" value="{rows/content/crl_cad/fields/crl_cad_val/value}" size="small" class="circlestats-chart" readonly="readonly"/>
                                                            </div>
                                                            <div class="footer">
                                                                <a class="clickable" target="_self" style="display: block;" href="{rows/content/crl_cad/fields/crl_cad_url/value}">
                                                                    <span class="description">
                                                                        <xsl:value-of select="rows/content/crl_cad/fields/crl_cad_desc/value"/>
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
                                        <div class="gen-column col-md-7">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/tbl_progress_summay">
                                                    <div class="box box-table-contents gen-container-item " gen-class="" item-name="tbl_progress_summay">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/tbl_progress_summay/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body table-box">
                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/tbl_progress_summay/fields"/>
                                                            <table id="tbl_progress_summay" class="table table-striped gen-data-table " exports="">
                                                                <thead>
                                                                    <tr>
                                                                        <xsl:if test="rows/content/tbl_progress_summay/fields/etapa_description">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/tbl_progress_summay/fields/etapa_description/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/tbl_progress_summay/fields/prog_etapa">
                                                                            <th align="right" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/tbl_progress_summay/fields/prog_etapa/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/tbl_progress_summay/fields/prog_terrenos">
                                                                            <th align="right" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/tbl_progress_summay/fields/prog_terrenos/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/tbl_progress_summay/fields/prog_fraccoes">
                                                                            <th align="right" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/tbl_progress_summay/fields/prog_fraccoes/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/tbl_progress_summay/fields/prog_total">
                                                                            <th align="right" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/tbl_progress_summay/fields/prog_total/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/tbl_progress_summay/table/value/row">
                                                                        <tr>
                                                                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                                            <xsl:if test="etapa_description">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/etapa_description/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="etapa_description"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="prog_etapa">
                                                                                <td align="right" data-row="{position()}" data-title="{../../fields/prog_etapa/label}" class="number">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="prog_etapa"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="prog_terrenos">
                                                                                <td align="right" data-row="{position()}" data-title="{../../fields/prog_terrenos/label}" class="number">
                                                                                    <span class="lookup-parser">
                                                                                        <xsl:value-of select="prog_terrenos"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="prog_fraccoes">
                                                                                <td align="right" data-row="{position()}" data-title="{../../fields/prog_fraccoes/label}" class="number">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="prog_fraccoes"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="prog_total">
                                                                                <td align="right" data-row="{position()}" data-title="{../../fields/prog_total/label}" class="number">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="prog_total"/>
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
                                        <div class="gen-column col-md-5">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/tbl_comulative">
                                                    <div class="box box-table-contents gen-container-item " gen-class="" item-name="tbl_comulative">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/tbl_comulative/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body table-box">
                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/tbl_comulative/fields"/>
                                                            <table id="tbl_comulative" class="table table-striped gen-data-table " exports="">
                                                                <thead>
                                                                    <tr>
                                                                        <xsl:if test="rows/content/tbl_comulative/fields/cumul_description">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/tbl_comulative/fields/cumul_description/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/tbl_comulative/fields/cumul_terrenos">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/tbl_comulative/fields/cumul_terrenos/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/tbl_comulative/fields/cumul_fraccao">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/tbl_comulative/fields/cumul_fraccao/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/tbl_comulative/fields/cumul__grand_total">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/tbl_comulative/fields/cumul__grand_total/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/tbl_comulative/table/value/row">
                                                                        <tr>
                                                                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                                            <xsl:if test="cumul_description">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/cumul_description/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="cumul_description"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="cumul_terrenos">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/cumul_terrenos/label}" class="number">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="cumul_terrenos"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="cumul_fraccao">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/cumul_fraccao/label}" class="number">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="cumul_fraccao"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="cumul__grand_total">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/cumul__grand_total/label}" class="number">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="cumul__grand_total"/>
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
                                                <xsl:if test="rows/content/chart_dur_media">
                                                    <div class="box gen-container-item " gen-structure="graphic" gen-class="" item-name="chart_dur_media">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/chart_dur_media/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <xsl:call-template name="igrp-graph">
                                                                <xsl:with-param name="table" select="rows/content/chart_dur_media"/>
                                                                <xsl:with-param name="chart_type" select="rows/content/chart_dur_media/chart_type"/>
                                                                <xsl:with-param name="height" select="'250'"/>
                                                                <xsl:with-param name="title" select="'Duração Média (Dias)'"/>
                                                                <xsl:with-param name="url" select="rows/content/chart_dur_media/url"/>
                                                            </xsl:call-template>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                        <div class="gen-column col-md-5">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/chart_dur_media_pie">
                                                    <div class="box gen-container-item " gen-structure="graphic" gen-class="" item-name="chart_dur_media_pie">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/chart_dur_media_pie/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <xsl:call-template name="igrp-graph">
                                                                <xsl:with-param name="table" select="rows/content/chart_dur_media_pie"/>
                                                                <xsl:with-param name="chart_type" select="rows/content/chart_dur_media_pie/chart_type"/>
                                                                <xsl:with-param name="height" select="'250'"/>
                                                                <xsl:with-param name="title" select="'Duração Média (Dias)'"/>
                                                                <xsl:with-param name="url" select="rows/content/chart_dur_media_pie/url"/>
                                                            </xsl:call-template>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="gen-column col-md-7">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/chart_evol_mensal">
                                                    <div class="box gen-container-item " gen-structure="graphic" gen-class="" item-name="chart_evol_mensal">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/chart_evol_mensal/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <xsl:call-template name="igrp-graph">
                                                                <xsl:with-param name="table" select="rows/content/chart_evol_mensal"/>
                                                                <xsl:with-param name="chart_type" select="rows/content/chart_evol_mensal/chart_type"/>
                                                                <xsl:with-param name="height" select="'250'"/>
                                                                <xsl:with-param name="title" select="'Evolução Mensal'"/>
                                                                <xsl:with-param name="url" select="rows/content/chart_evol_mensal/url"/>
                                                            </xsl:call-template>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                        <div class="gen-column col-md-5">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/chart_last10">
                                                    <div class="box gen-container-item " gen-structure="graphic" gen-class="" item-name="chart_last10">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/chart_last10/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <xsl:call-template name="igrp-graph">
                                                                <xsl:with-param name="table" select="rows/content/chart_last10"/>
                                                                <xsl:with-param name="chart_type" select="rows/content/chart_last10/chart_type"/>
                                                                <xsl:with-param name="height" select="'250'"/>
                                                                <xsl:with-param name="title" select="'Evolução Últimos 10 Dias'"/>
                                                                <xsl:with-param name="url" select="rows/content/chart_last10/url"/>
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
                <!-- CIRCLESTATBOX JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/circlestatbox/jquery.knob.modified.js"/>
                <script type="text/javascript" src="{$path}/plugins/circlestatbox/igrp.circlestatbox.init.js"/>
                <!-- CHART JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/highcharts/highcharts.js"/>
                <script type="text/javascript" src="{$path}/plugins/highcharts/highcharts-more.js"/>
                <script type="text/javascript" src="{$path}/plugins/highcharts/exporting.js"/>
                <script type="text/javascript" src="{$path}/plugins/highcharts/funnel.js"/>
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
$.IGRP.rules.set({"p_ilha":[{"name":"rule_ilha1","event":"change","condition":"notnull","value":"","value2":"","patern":"","patern_custom":"","action":"remote_combobox","targets":"cidadezona","procedure":"cadastro.stats_config.sql_cidade_zona","msg_type":"","msg":"","opposite":"","isTable":false},{"name":"rule_ilha2","event":"change","condition":"null","value":"","value2":"","patern":"","patern_custom":"","action":"remote_combobox","targets":"cidadezona","procedure":"cadastro.stats_config.sql_cidade_zona","msg_type":"","msg":"","opposite":"","isTable":false},{"name":"rulles0","event":"load","condition":"notnull","value":"","value2":"","patern":"","patern_custom":"","action":"remote_combobox","targets":"cidadezona","procedure":"cadastro.stats_config.sql_cidade_zona","msg_type":"","msg":"","opposite":"","isTable":false},{"name":"rulles1","event":"load","condition":"null","value":"","value2":"","patern":"","patern_custom":"","action":"remote_combobox","targets":"cidadezona","procedure":"cadastro.stats_config.sql_cidade_zona","msg_type":"","msg":"","opposite":"","isTable":false}],"p_cidadezona":[{"name":"rule_cidade_zona","event":"change","condition":"notnull","value":"","value2":"","patern":"","patern_custom":"","action":"remote_combobox","targets":"bairrolugar","procedure":"cadastro.stats_config.sql_bairro_lugar","msg_type":"","msg":"","opposite":"","isTable":false},{"name":"rule_cidade_zona2","event":"change","condition":"null","value":"","value2":"","patern":"","patern_custom":"","action":"remote_combobox","targets":"bairrolugar","procedure":"cadastro.stats_config.sql_bairro_lugar","msg_type":"","msg":"","opposite":"","isTable":false},{"name":"rulles1","event":"load","condition":"notnull","value":"","value2":"","patern":"","patern_custom":"","action":"remote_combobox","targets":"bairrolugar","procedure":"cadastro.stats_config.sql_bairro_lugar","msg_type":"","msg":"","opposite":"","isTable":false},{"name":"rulles11","event":"load","condition":"null","value":"","value2":"","patern":"","patern_custom":"","action":"remote_combobox","targets":"bairrolugar","procedure":"cadastro.stats_config.sql_bairro_lugar","msg_type":"","msg":"","opposite":"","isTable":false}]});</script>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1490184920203"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1490184920203"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1490184920203"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1490184920203"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1490184920204"/>
    <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1490184920204"/>
    <xsl:include href="../../xsl/tmpl/IGRP-charts.tmpl.xsl?v=1490184920204"/>
</xsl:stylesheet>