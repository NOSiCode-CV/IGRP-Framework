<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/>
  <xsl:template match="/">
    <html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">
      <head>
        <xsl:call-template name="igrp-head"/>
        <style/>
      </head>
      <body class="">
        <div id="layout-wrapper">
          <xsl:call-template name="igrp-header"/>
          <xsl:call-template name="igrp-sidebar"/>
          <div class="main-content">
            <div class="page-content">
              <div class="container-fluid">
                <xsl:call-template name="igrp-page-title"/>
                <div class="igrp-page-contents">
                  <div class="row " id="row-59b27ecc">
                    <div class="gen-column col-md-12">
                      <div class="gen-inner">
                        <xsl:if test="rows/content/sectionheader_1">
                          <section class="content-header igrp-section-header gen-container-item " gen-class="" item-name="sectionheader_1">
                            <h4 class="mb-0 disable-output-escaping h4">
                              <xsl:value-of disable-output-escaping="yes" select="rows/content/sectionheader_1/fields/sectionheader_1_text/value"/>
                            </h4>
                          </section>
                        </xsl:if>
                      </div>
                    </div>
                  </div>
                  <div class="row " id="row-d178a26b">
                    <div class="gen-column col-md-6">
                      <div class="gen-inner">
                        <xsl:if test="rows/content/chart_bar_1">
                          <xsl:call-template name="igrp-charts" gen-class="" class="gen-container-item " item-name="chart_bar_1">
                            <xsl:call-template name="box-header">
                              <xsl:with-param name="title" select="rows/content/chart_bar_1/@title"/>
                              <xsl:with-param name="collapsible" select="'undefined'"/>
                              <xsl:with-param name="collapsed" select="''"/>
                            </xsl:call-template>
                            <xsl:with-param name="charts" select="rows/content/chart_bar_1"/>
                            <xsl:with-param name="library" select="'chartjs'"/>
                          </xsl:call-template>
                        </xsl:if>
                        <xsl:if test="rows/content/chart_pie_1">
                          <xsl:call-template name="igrp-charts" gen-class="" class="gen-container-item " item-name="chart_pie_1">
                            <xsl:call-template name="box-header">
                              <xsl:with-param name="title" select="rows/content/chart_pie_1/@title"/>
                              <xsl:with-param name="collapsible" select="'undefined'"/>
                              <xsl:with-param name="collapsed" select="''"/>
                            </xsl:call-template>
                            <xsl:with-param name="charts" select="rows/content/chart_pie_1"/>
                            <xsl:with-param name="library" select="'chartjs'"/>
                          </xsl:call-template>
                        </xsl:if>
                      </div>
                    </div>
                    <div class="gen-column col-md-6">
                      <div class="gen-inner">
                        <xsl:if test="rows/content/chart_line_1">
                          <xsl:call-template name="igrp-charts" gen-class="" class="gen-container-item " item-name="chart_line_1">
                            <xsl:call-template name="box-header">
                              <xsl:with-param name="title" select="rows/content/chart_line_1/@title"/>
                              <xsl:with-param name="collapsible" select="'undefined'"/>
                              <xsl:with-param name="collapsed" select="''"/>
                            </xsl:call-template>
                            <xsl:with-param name="charts" select="rows/content/chart_line_1"/>
                            <xsl:with-param name="library" select="'chartjs'"/>
                          </xsl:call-template>
                        </xsl:if>
                      </div>
                    </div>
                  </div>
                  <div class="row " id="row-9f402016">
                    <div class="gen-column col-md-12">
                      <div class="gen-inner">
                        <xsl:if test="rows/content/sectionheader_2">
                          <section class="content-header igrp-section-header gen-container-item " gen-class="" item-name="sectionheader_2">
                            <h4 class="mb-0 disable-output-escaping h4">
                              <xsl:value-of disable-output-escaping="yes" select="rows/content/sectionheader_2/fields/sectionheader_2_text/value"/>
                            </h4>
                          </section>
                        </xsl:if>
                      </div>
                    </div>
                  </div>
                  <div class="row " id="row-29278294">
                    <div class="gen-column col-md-6">
                      <div class="gen-inner">
                        <xsl:if test="rows/content/chart_bar_2">
                          <xsl:call-template name="igrp-charts" gen-class="" class="gen-container-item " item-name="chart_bar_2">
                            <xsl:call-template name="box-header">
                              <xsl:with-param name="title" select="rows/content/chart_bar_2/@title"/>
                              <xsl:with-param name="collapsible" select="'undefined'"/>
                              <xsl:with-param name="collapsed" select="''"/>
                            </xsl:call-template>
                            <xsl:with-param name="charts" select="rows/content/chart_bar_2"/>
                            <xsl:with-param name="library" select="'apexcharts'"/>
                          </xsl:call-template>
                        </xsl:if>
                        <xsl:if test="rows/content/chart_pie_3">
                          <xsl:call-template name="igrp-charts" gen-class="" class="gen-container-item " item-name="chart_pie_3">
                            <xsl:call-template name="box-header">
                              <xsl:with-param name="title" select="rows/content/chart_pie_3/@title"/>
                              <xsl:with-param name="collapsible" select="'undefined'"/>
                              <xsl:with-param name="collapsed" select="''"/>
                            </xsl:call-template>
                            <xsl:with-param name="charts" select="rows/content/chart_pie_3"/>
                            <xsl:with-param name="library" select="'apexcharts'"/>
                          </xsl:call-template>
                        </xsl:if>
                      </div>
                    </div>
                    <div class="gen-column col-md-6">
                      <div class="gen-inner">
                        <xsl:if test="rows/content/chart_line_2">
                          <xsl:call-template name="igrp-charts" gen-class="" class="gen-container-item " item-name="chart_line_2">
                            <xsl:call-template name="box-header">
                              <xsl:with-param name="title" select="rows/content/chart_line_2/@title"/>
                              <xsl:with-param name="collapsible" select="'undefined'"/>
                              <xsl:with-param name="collapsed" select="''"/>
                            </xsl:call-template>
                            <xsl:with-param name="charts" select="rows/content/chart_line_2"/>
                            <xsl:with-param name="library" select="'apexcharts'"/>
                          </xsl:call-template>
                        </xsl:if>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <xsl:call-template name="igrp-footer"/>
          </div>
        </div>
        <xsl:call-template name="igrp-page-helpers"/>
        <xsl:call-template name="igrp-scripts"/>
        <!-- CHART-BAR JS INCLUDES -->
        <script type="text/javascript" src="{$path}/plugins/charts/igrp.charts.utils.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/plugins/charts/chartjs/chartjs.min.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/plugins/charts/chartjs/igrp.chartjs.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/plugins/charts/apexcharts2/apexcharts.min.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/plugins/charts/apexcharts2/igrp.apexcharts.js?v={$version}"/>
        <!-- CHART-LINE JS INCLUDES -->
        <!-- CHART-PIE JS INCLUDES -->
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=16"/>
  <xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=16"/>
  <xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=16"/>
  <xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=16"/>
  <xsl:include href="../../../xsl/tmpl/parts.common.xsl?v=16"/>
  <xsl:include href="../../../xsl/tmpl/parts.head.xsl?v=16"/>
  <xsl:include href="../../../xsl/tmpl/parts.header.xsl?v=16"/>
  <xsl:include href="../../../xsl/tmpl/parts.scripts.xsl?v=16"/>
  <xsl:include href="../../../xsl/tmpl/parts.footer.xsl?v=16"/>
  <xsl:include href="../../../xsl/tmpl/parts.sidebar.xsl?v=16"/>
  <xsl:include href="../../../xsl/tmpl/parts.charts.xsl?v=16"/>
</xsl:stylesheet>
