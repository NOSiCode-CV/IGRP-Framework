<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- CHART CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/highcharts/igrp.charts.css"/>
                <!-- TABLE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css"/>
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
                                                <xsl:if test="rows/content/chart_1">
                                                    <div class="box gen-container-item " gen-structure="graphic" gen-class="" item-name="chart_1">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/chart_1/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <xsl:call-template name="igrp-graph">
                                                                <xsl:with-param name="table" select="rows/content/chart_1"/>
                                                                <xsl:with-param name="chart_type" select="'pie'"/>
                                                                <xsl:with-param name="height" select="'400'"/>
                                                                <xsl:with-param name="title" select="'Pedido Passaporte por Estado'"/>
                                                                <xsl:with-param name="url" select="rows/content/chart_1/url"/>
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
                                                                        <xsl:if test="rows/content/table_1/fields/entidade">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/entidade/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/registado">
                                                                            <th align="right" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/registado/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/por_pagar">
                                                                            <th align="right" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/por_pagar/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/por_validar_rni">
                                                                            <th align="right" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/por_validar_rni/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/por_validar_siidef">
                                                                            <th align="right" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/por_validar_siidef/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/entregue_ao_utente">
                                                                            <th align="right" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/entregue_ao_utente/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/por_entregar">
                                                                            <th align="right" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/por_entregar/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <th class="igrp-table-ctx-th"/>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/table_1/table/value/row">
                                                                        <tr>
                                                                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                                            <xsl:if test="entidade">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/entidade/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="entidade"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="registado">
                                                                                <td align="right" data-row="{position()}" data-title="{../../fields/registado/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="registado"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="por_pagar">
                                                                                <td align="right" data-row="{position()}" data-title="{../../fields/por_pagar/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="por_pagar"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="por_validar_rni">
                                                                                <td align="right" data-row="{position()}" data-title="{../../fields/por_validar_rni/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="por_validar_rni"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="por_validar_siidef">
                                                                                <td align="right" data-row="{position()}" data-title="{../../fields/por_validar_siidef/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="por_validar_siidef"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="entregue_ao_utente">
                                                                                <td align="right" data-row="{position()}" data-title="{../../fields/entregue_ao_utente/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="entregue_ao_utente"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="por_entregar">
                                                                                <td align="right" data-row="{position()}" data-title="{../../fields/por_entregar/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="por_entregar"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <td class="igrp-table-ctx-td">
                                                                                <xsl:apply-templates select="../../context-menu" mode="table-context-inline">
                                                                                    <xsl:with-param name="row-params" select="context-menu"/>
                                                                                </xsl:apply-templates>
                                                                            </td>
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
                                        <div class="gen-column col-md-12">
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
                                                                <xsl:with-param name="chart_type" select="'column'"/>
                                                                <xsl:with-param name="height" select="'500'"/>
                                                                <xsl:with-param name="title" select="'Pedido Passaporte por Entidade'"/>
                                                                <xsl:with-param name="url" select="rows/content/chart_2/url"/>
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
                                                <xsl:if test="rows/content/processo_recusado">
                                                    <div class="box box-table-contents gen-container-item " gen-class="" item-name="processo_recusado">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/processo_recusado/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body table-box">
                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/processo_recusado/fields"/>
                                                            <table id="processo_recusado" class="table table-striped gen-data-table ">
                                                                <thead>
                                                                    <tr>
                                                                        <xsl:if test="rows/content/processo_recusado/fields/entidade_rec">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/processo_recusado/fields/entidade_rec/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/processo_recusado/fields/registado_rec">
                                                                            <th align="right" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/processo_recusado/fields/registado_rec/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/processo_recusado/fields/validado">
                                                                            <th align="right" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/processo_recusado/fields/validado/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/processo_recusado/fields/recusado_siidef">
                                                                            <th align="right" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/processo_recusado/fields/recusado_siidef/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/processo_recusado/fields/recusado_incm">
                                                                            <th align="right" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/processo_recusado/fields/recusado_incm/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/processo_recusado/table/value/row">
                                                                        <tr>
                                                                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                                            <xsl:if test="entidade_rec">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/entidade_rec/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="entidade_rec"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="registado_rec">
                                                                                <td align="right" data-row="{position()}" data-title="{../../fields/registado_rec/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="registado_rec"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="validado">
                                                                                <td align="right" data-row="{position()}" data-title="{../../fields/validado/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="validado"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="recusado_siidef">
                                                                                <td align="right" data-row="{position()}" data-title="{../../fields/recusado_siidef/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="recusado_siidef"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="recusado_incm">
                                                                                <td align="right" data-row="{position()}" data-title="{../../fields/recusado_incm/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="recusado_incm"/>
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
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/processo_recusado_graf">
                                                    <div class="box gen-container-item " gen-structure="graphic" gen-class="" item-name="processo_recusado_graf">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/processo_recusado_graf/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <xsl:call-template name="igrp-graph">
                                                                <xsl:with-param name="table" select="rows/content/processo_recusado_graf"/>
                                                                <xsl:with-param name="chart_type" select="'pie'"/>
                                                                <xsl:with-param name="height" select="'400'"/>
                                                                <xsl:with-param name="title" select="'Processo Recusado por Estado'"/>
                                                                <xsl:with-param name="url" select="rows/content/processo_recusado_graf/url"/>
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
                <!-- CHART JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/highcharts/highcharts.js"/>
                <script type="text/javascript" src="{$path}/plugins/highcharts/highcharts-more.js"/>
                <script type="text/javascript" src="{$path}/plugins/highcharts/exporting.js"/>
                <script type="text/javascript" src="{$path}/plugins/highcharts/igrp.charts.js"/>
                <!-- TABLE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/table/jquery.dataTables.min.js"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/dataTables.bootstrap.min.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1487955666778"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1487955666778"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1487955666778"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1487955666778"/>
    <xsl:include href="../../xsl/tmpl/IGRP-charts.tmpl.xsl?v=1487955666780"/>
    <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1487955666780"/>
</xsl:stylesheet>