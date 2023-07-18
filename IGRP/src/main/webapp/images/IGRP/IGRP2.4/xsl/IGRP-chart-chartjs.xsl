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

                  <!-- page content -->

                  <div class="container-fluid">
                    <div class="row">
                        <div class="col-xl-6">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title mb-0">Line Chart</h4>
                                </div>
                                <div class="card-body">
                                    <canvas id="lineChart" class="chartjs-chart" data-colors='["--vz-primary-rgb, 0.2", "--vz-primary", "--vz-success-rgb, 0.2", "--vz-success"]'></canvas>
                                </div>
                            </div>
                        </div> <!-- end col -->

                        <div class="col-xl-6">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title mb-0">Bar Chart</h4>
                                </div>
                                <div class="card-body">
                                    <canvas id="bar" class="chartjs-chart" data-colors='["--vz-primary-rgb, 0.8", "--vz-primary-rgb, 0.9"]'></canvas>

                                </div>
                            </div>
                        </div> <!-- end col -->
                    </div> <!-- end row -->

                    <div class="row">
                        <div class="col-xl-6">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title mb-0">Pie Chart</h4>
                                </div>
                                <div class="card-body">
                                    <canvas id="pieChart" class="chartjs-chart" data-colors='["--vz-success", "--vz-light"]'></canvas>
                                </div>
                            </div>
                        </div> <!-- end col -->

                        <div class="col-xl-6">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title mb-0">Donut Chart</h4>
                                </div>
                                <div class="card-body">
                                    <canvas id="doughnut" class="chartjs-chart" data-colors='["--vz-primary", "--vz-light"]'></canvas>
                                </div>
                            </div>
                        </div> <!-- end col -->
                    </div> <!-- end row -->

                    <div class="row">
                        <div class="col-xl-6">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title mb-0">Polar Chart</h4>
                                </div>
                                <div class="card-body">
                                    <canvas id="polarArea" class="chartjs-chart" data-colors='["--vz-danger", "--vz-success", "--vz-warning", "--vz-primary"]'> </canvas>
                                </div>
                            </div>
                        </div> <!-- end col -->

                        <div class="col-xl-6">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title mb-0">Radar Chart</h4>
                                </div>
                                <div class="card-body">
                                    <canvas id="radar" class="chartjs-chart" data-colors='["--vz-success-rgb, 0.2", "--vz-success", "--vz-primary-rgb, 0.2", "--vz-primary"]'></canvas>
                                </div>
                            </div>
                        </div> <!-- end col -->
                    </div> <!-- end row -->

                </div>
                <!-- container-fluid -->

                </div>
              </div>
            </div>
            <xsl:call-template name="igrp-footer"/>
          </div>
        </div>
        <xsl:call-template name="igrp-page-helpers"/>

        <!-- page includes JS -->

        <!-- Chart JS -->
    <script src="{$path}/libs/chart.js/chart.min.js"></script>

    <!-- chartjs init -->
    <script src="{$themePath}/assets/js/pages/chartjs.init.js"></script>


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
  <xsl:include href="../xsl/tmpl/IGRP-functions.tmpl.xsl?v=22"/>
  <xsl:include href="../xsl/tmpl/IGRP-variables.tmpl.xsl?v=22"/>
  <xsl:include href="../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=22"/>
  <xsl:include href="../xsl/tmpl/IGRP-utils.tmpl.xsl?v=22"/>
  <xsl:include href="../xsl/tmpl/parts.common.xsl?v=22"/>
  <xsl:include href="../xsl/tmpl/parts.head.xsl?v=22"/>
  <xsl:include href="../xsl/tmpl/parts.header.xsl?v=22"/>
  <xsl:include href="../xsl/tmpl/parts.scripts.xsl?v=22"/>
  <xsl:include href="../xsl/tmpl/parts.footer.xsl?v=22"/>
  <xsl:include href="../xsl/tmpl/parts.sidebar.xsl?v=22"/>
  <xsl:include href="../xsl/tmpl/parts.charts.xsl?v=22"/>
</xsl:stylesheet>
