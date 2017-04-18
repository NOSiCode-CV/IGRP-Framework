<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- VIEW CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/view/igrp.view.css"/>
                <!-- TABLE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css"/>
                <!-- CHART CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/highcharts/igrp.charts.css"/>
                <!-- DATE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/datetimepicker/css/datetimepicker.css"/>
                <style/>
            </head>
            <body class="{$bodyClass} sidebar-off">
                <xsl:call-template name="IGRP-topmenu"/>
                <form method="POST" class="IGRP-form" name="formular_default">
                    <div class="container-fluid">
                        <div class="row">
                            <xsl:call-template name="IGRP-sidebar"/>
                            <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
                                <div class="content">
                                    <div class="row">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                                                <xsl:if test="rows/content/view_1">
                                                    <div class="box clearfix view-block gen-container-item " has-img="false" gen-class="" item-name="view_1">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/view_1/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <xsl:if test="rows/content/view_1/fields/view_img">
                                                                <img src="{rows/content/view_1/fields/view_img}"/>
                                                            </xsl:if>
                                                            <div class="view-body clearfix ">
                                                                <xsl:if test="rows/content/view_1/fields/nome_f">
                                                                    <div class="view-item gen-fields-holder">
                                                                        <span class="view-label">
                                                                            <xsl:value-of select="rows/content/view_1/fields/nome_f/label"/>
                                                                        </span>
                                                                        <span class="view-value">
                                                                            <xsl:value-of select="rows/content/view_1/fields/nome_f/value"/>
                                                                        </span>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/view_1/fields/device_f">
                                                                    <div class="view-item gen-fields-holder">
                                                                        <a href="{rows/content/view_1/fields/device_f/value}" target="_self">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/view_1/fields/device_f/label"/>
                                                                            </span>
                                                                        </a>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/view_1/fields/utilizador_f">
                                                                    <div class="view-item gen-fields-holder">
                                                                        <span class="view-label">
                                                                            <xsl:value-of select="rows/content/view_1/fields/utilizador_f/label"/>
                                                                        </span>
                                                                        <span class="view-value">
                                                                            <xsl:value-of select="rows/content/view_1/fields/utilizador_f/value"/>
                                                                        </span>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/view_1/fields/data_criacao_f">
                                                                    <div class="view-item gen-fields-holder">
                                                                        <span class="view-label">
                                                                            <xsl:value-of select="rows/content/view_1/fields/data_criacao_f/label"/>
                                                                        </span>
                                                                        <span class="view-value">
                                                                            <xsl:value-of select="rows/content/view_1/fields/data_criacao_f/value"/>
                                                                        </span>
                                                                    </div>
                                                                </xsl:if>
                                                            </div>
                                                            <!-- <div class="view-buttons clearfix"  gen-id="drop-zone" gen-only-type="button" gen-field-template="button"></div> -->
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="gen-column col-md-7">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/content">
                                                    <div class="box box-table-contents gen-container-item " gen-class="" item-name="content">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/content/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body table-box">
                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/content/fields"/>
                                                            <table id="content" class="table table-striped gen-data-table ">
                                                                <thead>
                                                                    <tr>
                                                                        <xsl:if test="rows/content/content/fields/name">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/content/fields/name/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/content/fields/tipo">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/content/fields/tipo/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/content/fields/ult_sync">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/content/fields/ult_sync/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/content/fields/registos">
                                                                            <th align="right" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/content/fields/registos/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/content/table/value/row">
                                                                        <tr>
                                                                            <xsl:if test="name">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/name/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="name"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="tipo">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/tipo/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="tipo"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="ult_sync">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/ult_sync/label}" class="date">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="ult_sync"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="registos">
                                                                                <td align="right" data-row="{position()}" data-title="{../../label/registos}" class="link">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="registos != ''">
                                                                                            <a href="{registos}" class="link bClick" target="_self" name="registos">
                                                                                                <xsl:value-of select="registos_desc" disable-output-escaping="yes"/>
                                                                                            </a>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <span>
                                                                                                <xsl:value-of select="registos_desc" disable-output-escaping="yes"/>
                                                                                            </span>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
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
                                                <xsl:if test="rows/content/chart_registo_tipo">
                                                    <div class="box gen-container-item " gen-structure="graphic" gen-class="" item-name="chart_registo_tipo">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/chart_registo_tipo/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <xsl:call-template name="igrp-graph">
                                                                <xsl:with-param name="table" select="rows/content/chart_registo_tipo"/>
                                                                <xsl:with-param name="chart_type" select="'bar'"/>
                                                                <xsl:with-param name="height" select="'250'"/>
                                                                <xsl:with-param name="title" select="'Registos por Conteúdo'"/>
                                                                <xsl:with-param name="url" select="rows/content/chart_registo_tipo/url"/>
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
                <!-- TABLE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/table/jquery.dataTables.min.js"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/dataTables.bootstrap.min.js"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/bootstrap-contextmenu.js"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/table.contextmenu.js"/>
                <!-- CHART JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/highcharts/highcharts.js"/>
                <script type="text/javascript" src="{$path}/plugins/highcharts/highcharts-more.js"/>
                <script type="text/javascript" src="{$path}/plugins/highcharts/exporting.js"/>
                <script type="text/javascript" src="{$path}/plugins/highcharts/igrp.charts.js"/>
                <!-- DATE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/datetimepicker.js"/>
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/dtp.init.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1484680263469"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1484680263469"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1484680263469"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1484680263469"/>
    <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1484680263469"/>
    <xsl:include href="../../xsl/tmpl/IGRP-charts.tmpl.xsl?v=1484680263469"/>
</xsl:stylesheet>