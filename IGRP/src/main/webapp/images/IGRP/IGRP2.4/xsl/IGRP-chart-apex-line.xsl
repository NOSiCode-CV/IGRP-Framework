<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/>

  <xsl:template match="/">
    <html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">
      <head>

        <!-- page includes css -->


        <xsl:call-template name="igrp-head"/>

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
                            <h4 class="card-title mb-0">Basic Line Chart</h4>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <div id="line_chart_basic" data-colors='["--vz-primary"]' class="apex-charts" dir="ltr"></div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>
                      <!-- end col -->
                      <div class="col-xl-6">
                        <div class="card">
                          <div class="card-header">
                            <h4 class="card-title mb-0">Zoomable Timeseries</h4>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <div id="line_chart_zoomable" data-colors='["--vz-success"]' class="apex-charts" dir="ltr"></div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>
                      <!-- end col -->
                    </div>
                    <!-- end row -->

                    <div class="row">
                      <div class="col-xl-6">
                        <div class="card">
                          <div class="card-header">
                            <h4 class="card-title mb-0">Line with Data Labels</h4>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <div id="line_chart_datalabel" data-colors='["--vz-primary", "--vz-success"]' class="apex-charts" dir="ltr"></div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>
                      <!-- end col -->
                      <div class="col-xl-6">
                        <div class="card">
                          <div class="card-header">
                            <h4 class="card-title mb-0">Dashed Line</h4>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <div id="line_chart_dashed" data-colors='["--vz-primary", "--vz-danger", "--vz-success"]' class="apex-charts" dir="ltr"></div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>
                      <!-- end col -->
                    </div>
                    <!-- end row -->

                    <div class="row">
                      <div class="col-xl-6">
                        <div class="card">
                          <div class="card-header">
                            <h4 class="card-title mb-0">Line with Annotations</h4>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <div id="line_chart_annotations" data-colors='["--vz-primary"]' class="apex-charts" dir="ltr"></div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>
                      <!-- end col -->

                      <div class="col-xl-6">
                        <div class="card">
                          <div class="card-header">
                            <h4 class="card-title mb-0">Brush Charts</h4>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <div>
                              <div id="brushchart_line2" data-colors='["--vz-danger"]' class="apex-charts" dir="ltr"></div>
                              <div id="brushchart_line" data-colors='["--vz-info"]' class="apex-charts" dir="ltr"></div>
                            </div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>
                      <!-- end col -->
                    </div>
                    <!-- end row -->

                    <div class="row">

                      <div class="col-xl-6">
                        <div class="card">
                          <div class="card-header">
                            <h4 class="card-title mb-0">Stepline Charts</h4>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <div id="line_chart_stepline" data-colors='["--vz-success"]' class="apex-charts" dir="ltr"></div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>
                      <!-- end col -->

                      <div class="col-xl-6">
                        <div class="card">
                          <div class="card-header">
                            <h4 class="card-title mb-0">Gradient Charts</h4>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <div id="line_chart_gradient" data-colors='["--vz-success"]' class="apex-charts" dir="ltr"></div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>
                      <!-- end col -->
                    </div>
                    <!-- end row -->

                    <div class="row">

                      <div class="col-xl-6">
                        <div class="card">
                          <div class="card-header">
                            <h4 class="card-title mb-0">Missing Data/ Null Value Charts</h4>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <div id="line_chart_missing_data" data-colors='["--vz-primary", "--vz-danger", "--vz-success"]' class="apex-charts" dir="ltr"></div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>
                      <!-- end col -->

                      <div class="col-xl-6">
                        <div class="card">
                          <div class="card-header">
                            <h4 class="card-title mb-0">Realtimes Charts</h4>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <div id="line_chart_realtime" data-colors='["--vz-success"]' class="apex-charts" dir="ltr"></div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>
                      <!-- end col -->
                    </div>
                    <!-- end row -->

                    <div class="row">

                      <div class="col-xl-6">
                        <div class="card">
                          <div class="card-header">
                            <h4 class="card-title mb-0">Syncing Charts</h4>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <div>
                              <div id="chart-syncing-line" data-colors='["--vz-primary"]' class="apex-charts" dir="ltr"></div>
                              <div id="chart-syncing-line2" data-colors='["--vz-warning"]' class="apex-charts" dir="ltr"></div>
                              <div id="chart-syncing-area" data-colors='["--vz-success"]' class="apex-charts" dir="ltr"></div>
                            </div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>
                      <!-- end col -->
                    </div>

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
        <!-- apexcharts -->
        <script src="{$path}/libs/apexcharts/apexcharts.min.js"></script>

        <script src="https://img.themesbrand.com/velzon/apexchart-js/stock-prices.js"></script>

        <!-- linecharts init -->
        <script src="{$themePath}/assets/js/pages/apexcharts-line.init.js"></script>


        <xsl:call-template name="igrp-scripts"/>



      </body>
    </html>
  </xsl:template>

  <xsl:include href="../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1515664208567"/>
  <xsl:include href="../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1515664208567"/>

  <xsl:include href="../xsl/tmpl/parts.common.xsl?v=1515664208567"/>
  <xsl:include href="../xsl/tmpl/parts.head.xsl?v=1515664208567"/>
  <xsl:include href="../xsl/tmpl/parts.scripts.xsl?v=1515664208567"/>
  <xsl:include href="../xsl/tmpl/parts.footer.xsl?v=1515664208567"/>
  <xsl:include href="../xsl/tmpl/parts.sidebar.xsl?v=1515664208567"/>
  <xsl:include href="../xsl/tmpl/parts.header.xsl?v=1515664208567"/>

</xsl:stylesheet>
