<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- MAPCHART CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/highcharts/highmaps/highmap.css"/>
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
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/map_cons">
                                                    <div class="box gen-container-item " item-name="map_cons">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/map_cons/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <div id="highmap-map_cons" class="igrp-highmaps" style="height: 500px; margin: 0 auto" basemap="{rows/content/map_cons/fields/map_cons_basemap/value}" data="{rows/content/map_cons/fields/map_cons_data/value}" config="{rows/content/map_cons/fields/map_cons_config/value}"/></div>
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
                <!-- MAPCHART JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/highcharts/highcharts.js"/>
                <script type="text/javascript" src="{$path}/plugins/highcharts/highcharts-more.js"/>
                <script type="text/javascript" src="{$path}/plugins/highcharts/highmaps/map.js"/>
                <script type="text/javascript" src="{$path}/plugins/highcharts/highmaps/data.js"/>
                <script type="text/javascript" src="{$path}/plugins/highcharts/highmaps/drilldown.js"/>
                <script type="text/javascript" src="{$path}/plugins/highcharts/highmaps/highmap.controller.js"/>
                <script type="text/javascript" src="{$path}/plugins/highcharts/igrp.charts.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1483618897237"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1483618897237"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1483618897237"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1483618897237"/>
</xsl:stylesheet>