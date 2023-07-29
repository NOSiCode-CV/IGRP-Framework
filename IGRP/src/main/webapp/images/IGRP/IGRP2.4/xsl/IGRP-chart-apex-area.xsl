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
                            <h4 class="card-title mb-0">Basic Area Chart</h4>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <div id="area_chart_basic" data-colors='["--vz-success"]' class="apex-charts" dir="ltr"></div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>
                      <!-- end col -->

                      <div class="col-xl-6">
                        <div class="card">
                          <div class="card-header">
                            <h4 class="card-title mb-0">Spline Area Chart</h4>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <div id="area_chart_spline" data-colors='["--vz-primary", "--vz-success"]' class="apex-charts" dir="ltr"></div>
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
                            <h4 class="card-title mb-0">Area Chart - Datetime X - Axis Chart</h4>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <div>
                              <div class="toolbar d-flex align-items-start justify-content-center flex-wrap gap-2">
                                <button type="button" class="btn btn-soft-primary timeline-btn btn-sm" id="one_month">
                                                1M
                                </button>
                                <button type="button" class="btn btn-soft-primary timeline-btn btn-sm" id="six_months">
                                                6M
                                </button>
                                <button type="button" class="btn btn-soft-primary timeline-btn btn-sm active" id="one_year">
                                                1Y
                                </button>
                                <button type="button" class="btn btn-soft-primary timeline-btn btn-sm" id="all">
                                                ALL
                                </button>
                              </div>
                              <div id="area_chart_datetime" data-colors='["--vz-info"]' class="apex-charts" dir="ltr"></div>
                            </div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>
                      <!-- end col -->

                      <div class="col-xl-6">
                        <div class="card">
                          <div class="card-header">
                            <h4 class="card-title mb-0">Area with Negative Values Chart</h4>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <div id="area_chart_negative" data-colors='["--vz-success", "--vz-info"]' class="apex-charts" dir="ltr"></div>
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
                            <h4 class="card-title mb-0">Area Chart - Github Style</h4>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <div>
                              <div class="bg-light">
                                <div id="area_chart-months" data-colors='["--vz-danger"]' class="apex-charts" dir="ltr"></div>
                              </div>

                              <div class="github-style d-flex align-items-center my-2">
                                <div class="flex-shrink-0 me-2">
                                  <img class="avatar-sm rounded" src="{$themePath}/assets/images/users/avatar-2.jpg" data-hovercard-user-id="634573" alt="" />
                                </div>
                                <div class="flex-grow-1">
                                  <a class="font-size-14 text-dark fw-medium">coder</a>
                                  <div class="cmeta text-muted font-size-11">
                                    <span class="commits text-dark fw-medium"></span> commits
                                  </div>
                                </div>
                              </div>

                              <div class="bg-light">
                                <div id="area_chart-years" data-colors='["--vz-success"]' class="apex-charts" dir="ltr"></div>
                              </div>
                            </div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>
                      <!-- end col -->

                      <div class="col-xl-6">
                        <div class="card">
                          <div class="card-header">
                            <h4 class="card-title mb-0">Stacked Area Chart</h4>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <div id="area_chart_stacked" data-colors='["--vz-success", "--vz-info", "--vz-light"]' class="apex-charts" dir="ltr"></div>
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
                            <h4 class="card-title mb-0">Irregular Timeseries Chart</h4>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <div id="area_chart_irregular" data-colors='["--vz-primary", "--vz-warning", "--vz-success"]' class="apex-charts" dir="ltr"></div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>
                      <!-- end col -->

                      <div class="col-xl-6">
                        <div class="card">
                          <div class="card-header">
                            <h4 class="card-title mb-0">Area Chart With Null Values Chart</h4>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <div id="area-missing-null-value" data-colors='["--vz-success"]' class="apex-charts" dir="ltr"></div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>
                      <!-- end col -->
                    </div>
                    <!-- end row -->

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
        <!-- for basic area chart -->
        <script src="https://img.themesbrand.com/velzon/apexchart-js/stock-prices.js"></script>
        <!-- for github style chart -->
        <script src="https://img.themesbrand.com/velzon/apexchart-js/github-data.js"></script>
        <!-- for irregular timeseries chart -->
        <script src="https://img.themesbrand.com/velzon/apexchart-js/irregular-data-series.js"></script>
        <script src="{$path}/libs/moment/moment.js"></script>

        <!-- areacharts init -->
        <script src="{$themePath}/assets/js/pages/apexcharts-area.init.js"></script>

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
  <xsl:include href="../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1515664208567"/>

</xsl:stylesheet>
