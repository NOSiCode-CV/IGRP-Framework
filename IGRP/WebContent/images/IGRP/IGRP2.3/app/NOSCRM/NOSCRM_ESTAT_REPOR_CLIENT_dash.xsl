<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" encoding="ISO-8859-1" omit-xml-declaration="yes" method="html" />
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head" />
                <!-- FORM CSS INCLUDES -->
                <link type="text/css" href="{$path}/core/igrp/form/igrp.forms.css" rel="stylesheet" />
                <!-- CHART CSS INCLUDES -->
                <link type="text/css" href="{$path}/plugins/highcharts/igrp.charts.css" rel="stylesheet" />
                <!-- DATE CSS INCLUDES -->
                <link type="text/css" href="{$path}/plugins/datetimepicker/css/datetimepicker.css" rel="stylesheet" />
                <style />
            </head>
            <body class="{$bodyClass} sidebar-off">
                <xsl:call-template name="IGRP-topmenu" />
                <form class="IGRP-form" name="formular_default" method="POST" enctype="multipart/form-data">
                    <div class="container-fluid">
                        <div class="row">
                            <xsl:call-template name="IGRP-sidebar" />
                            <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
                                <div class="content">
                                    <div class="row">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:apply-templates select="rows/content/messages" mode="igrp-messages" />
                                                <xsl:if test="rows/content/form_1">
                                                    <div class="box igrp-forms gen-container-item " item-name="form_1" gen-class="">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates select="rows/content/form_1/fields" mode="form-hidden-fields" />
                                                                <xsl:if test="rows/content/form_1/fields/data_inicio">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-type="date" required="required" item-name="data_inicio">
                                                                        <label for="{rows/content/form_1/fields/data_inicio/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/data_inicio/label" />
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" class="form-control gen-date " required="required" name="{rows/content/form_1/fields/data_inicio/@name}" value="{rows/content/form_1/fields/data_inicio/value}" id="form_1-data_inicio" maxlength="30" format="IGRP_datePicker" />
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-primary">
                                                                                    <i class="fa fa-calendar" />
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/data_fim">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-type="date" required="required" item-name="data_fim">
                                                                        <label for="{rows/content/form_1/fields/data_fim/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/data_fim/label" />
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" class="form-control gen-date IGRP_change" required="required" name="{rows/content/form_1/fields/data_fim/@name}" value="{rows/content/form_1/fields/data_fim/value}" id="form_1-data_fim" maxlength="30" format="IGRP_datePicker" />
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-danger">
                                                                                    <i class="fa fa-calendar" />
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                            </div>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons" />
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/chart_1">
                                                    <div class="box gen-container-item " item-name="chart_1" gen-class="" gen-structure="graphic">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/chart_1/@title" />
                                                            <xsl:with-param name="collapsible" select="'true'" />
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <xsl:call-template name="igrp-graph">
                                                                <xsl:with-param name="table" select="rows/content/chart_1" />
                                                                <xsl:with-param name="chart_type" select="rows/content/chart_1/chart_type" />
                                                                <xsl:with-param name="height" select="'250'" />
                                                                <xsl:with-param name="title" select="'Evolução de Cliente'" />
                                                                <xsl:with-param name="url" select="rows/content/chart_1/url" />
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
                    <xsl:call-template name="IGRP-bottom" />
                </form>
                <!-- FORM JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js" />
                <!-- CHART JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/highcharts/highcharts.js" />
                <script type="text/javascript" src="{$path}/plugins/highcharts/highcharts-more.js" />
                <script type="text/javascript" src="{$path}/plugins/highcharts/exporting.js" />
                <script type="text/javascript" src="{$path}/plugins/highcharts/funnel.js" />
                <script type="text/javascript" src="{$path}/plugins/highcharts/igrp.charts.js" />
                <!-- DATE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/datetimepicker.js" />
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/dtp.init.js" />
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1488996899929" />
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1488996899929" />
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1488996899929" />
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1488996899929" />
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1488996899930" />
    <xsl:include href="../../xsl/tmpl/IGRP-charts.tmpl.xsl?v=1488996899930" />
</xsl:stylesheet>