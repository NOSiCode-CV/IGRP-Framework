<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="IGRP-head"/>
        <!-- TABCONTENT CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/tabcontent/includes/igrp.tabs.css"/>
        <!-- CHART CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/chart/includes/igrp.charts.css"/>
        <style>
        </style>
      </head>
      <body class="{$bodyClass}">
        <xsl:call-template name="IGRP-topmenu"/>
        <form>
          <div class="container-fluid">
            <div class="row">
              <xsl:call-template name="IGRP-sidebar"/>
              <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
                <div class="content">
                  <div class="row">
                    <div class="gen-column col-md-12">
                      <div class="gen-inner">
                        <xsl:if  test="rows/content/box_1">
                          <div  class="box igrp-box-holder gen-container-item ">
                            <xsl:call-template name="box-header">
                              <xsl:with-param name="title" select="rows/content/box_1/@title"/>
                              <xsl:with-param name="collapsible" select="'true'"/>
                            </xsl:call-template>
                            <div class="box-body" gen-preserve-content="true">
                              <div >
                                <div class="row">
                                  <div class="gen-column col-md-12">
                                    <div class="gen-inner">
                                      <xsl:if test="rows/content/paragraph_2">
                                        <div class="gen-container-item ">
                                          <div class="box-body">
                                            <p>
                                              <xsl:value-of disable-output-escaping="yes" select="rows/content/paragraph_2/fields/text/value"/>
                                            </p>
                                          </div>
                                        </div>
                                      </xsl:if>
                                      <xsl:if test="rows/content/tabcontent_1">
                                        <div class="gen-tab-holder nav-tabs-custom gen-container-item " tab-template="default">
                                          <ul class="nav nav-tabs">
                                            <xsl:if test="rows/content/tabcontent_1/item[@name='tab_item_1']">
                                              <li class="active gen-fields-holder" rel="tab-tabcontent_1-tab_item_1">
                                                <a data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_1-tab_item_1">
                                                  <i class="fa fa-dot-circle-o"/>
                                                  <span gen-lbl-setter="true">
                                                    <xsl:value-of select="rows/content/tabcontent_1/item[@name='tab_item_1']/title"/>
                                                  </span>
                                                </a>
                                              </li>
                                            </xsl:if>
                                            <xsl:if test="rows/content/tabcontent_1/item[@name='tab_item_2']">
                                              <li class=" gen-fields-holder" rel="tab-tabcontent_1-tab_item_2">
                                                <a data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_1-tab_item_2">
                                                  <i class="fa fa-dot-circle-o"/>
                                                  <span gen-lbl-setter="true">
                                                    <xsl:value-of select="rows/content/tabcontent_1/item[@name='tab_item_2']/title"/>
                                                  </span>
                                                </a>
                                              </li>
                                            </xsl:if>
                                          </ul>
                                          <div class="tab-content">
                                            <xsl:if test="rows/content/tabcontent_1/item[@name='tab_item_1']">
                                              <div class="tab-pane gen-rows-holder active" id="tab-tabcontent_1-tab_item_1" rel="tab-tabcontent_1-tab_item_1">
                                                <div class="row">
                                                  <div class="gen-column col-md-6">
                                                    <div class="gen-inner">
                                                      <xsl:if test="rows/content/chart_1">
                                                        <div class="box gen-container-item " gen-structure="graphic">
                                                          <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/chart_1/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                          </xsl:call-template>
                                                          <div class="box-body">
                                                            <xsl:call-template name="igrp-graph">
                                                              <xsl:with-param name="table" select="rows/content/chart_1"/>
                                                              <xsl:with-param name="chart_type" select="'line'"/>
                                                              <xsl:with-param name="height" select="'250'"/>
                                                              <xsl:with-param name="title" select="'Chart 1'"/>
                                                              <xsl:with-param name="url" select="rows/content/chart_1/url"/>
                                                            </xsl:call-template>
                                                          </div>
                                                        </div>
                                                      </xsl:if>
                                                    </div>
                                                  </div>
                                                  <div class="gen-column col-md-6">
                                                    <div class="gen-inner">
                                                      <xsl:if test="rows/content/chart_2">
                                                        <div class="box gen-container-item " gen-structure="graphic">
                                                          <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/chart_2/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                          </xsl:call-template>
                                                          <div class="box-body">
                                                            <xsl:call-template name="igrp-graph">
                                                              <xsl:with-param name="table" select="rows/content/chart_2"/>
                                                              <xsl:with-param name="chart_type" select="'stackedarea'"/>
                                                              <xsl:with-param name="height" select="'250'"/>
                                                              <xsl:with-param name="title" select="'Chart 2'"/>
                                                              <xsl:with-param name="url" select="rows/content/chart_2/url"/>
                                                            </xsl:call-template>
                                                          </div>
                                                        </div>
                                                      </xsl:if>
                                                    </div>
                                                  </div>
                                                </div>
                                              </div>
                                            </xsl:if>
                                            <xsl:if test="rows/content/tabcontent_1/item[@name='tab_item_2']">
                                              <div class="tab-pane gen-rows-holder " id="tab-tabcontent_1-tab_item_2" rel="tab-tabcontent_1-tab_item_2">
                                                <div class="row">
                                                  <div class="gen-column col-md-12">
                                                    <div class="gen-inner"/>
                                                  </div>
                                                </div>
                                              </div>
                                            </xsl:if>
                                          </div>
                                        </div>
                                      </xsl:if>
                                    </div>
                                  </div>
                                </div>
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
        <!-- TABCONTENT JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/tabcontent/includes/igrp.tabs.js">
        </script>
        <!-- CHART JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/chart/includes/highcharts/highcharts.js">
        </script>
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/chart/includes/highcharts/highcharts-more.js">
        </script>
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/chart/includes/highcharts/exporting.js">
        </script>
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/chart/includes/highcharts/funnel.js">
        </script>
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/chart/includes/igrp.charts.js">
        </script>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1461332430963"/>
  <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1461332430963"/>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1461332430963"/>
  <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1461332430963"/>
  <xsl:include href="../../xsl/tmpl/IGRP-charts.tmpl.xsl?v=1461332430964"/>
</xsl:stylesheet>
