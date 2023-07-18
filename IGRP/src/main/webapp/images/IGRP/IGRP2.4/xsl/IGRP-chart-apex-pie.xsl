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
                            <h4 class="card-title mb-0">Simple Pie Chart</h4>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <div id="simple_pie_chart" data-colors='["--vz-primary", "--vz-success", "--vz-warning", "--vz-danger", "--vz-info"]' class="apex-charts" dir="ltr"></div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>
                      <!-- end col -->

                      <div class="col-xl-6">
                        <div class="card">
                          <div class="card-header">
                            <h4 class="card-title mb-0">Simple Donut Chart</h4>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <div id="simple_dount_chart" data-colors='["--vz-primary", "--vz-success", "--vz-warning", "--vz-danger", "--vz-info"]' class="apex-charts" dir="ltr"></div>
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
                            <h4 class="card-title mb-0">Updating Donut Chart</h4>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <div>
                              <div id="updating_donut_chart" data-colors='["--vz-primary", "--vz-success", "--vz-warning", "--vz-danger", "--vz-info"]' class="apex-charts" dir="ltr"></div>

                              <div class="d-flex align-items-start flex-wrap gap-2 justify-content-center mt-4">
                                <button id="add" class="btn btn-light btn-sm">
                                                + ADD
                                </button>

                                <button id="remove" class="btn btn-light btn-sm">
                                                - REMOVE
                                </button>

                                <button id="randomize" class="btn btn-light btn-sm">
                                                RANDOMIZE
                                </button>

                                <button id="reset" class="btn btn-light btn-sm">
                                                RESET
                                </button>
                              </div>
                            </div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>
                      <!-- end col -->

                      <div class="col-xl-6">
                        <div class="card">
                          <div class="card-header">
                            <h4 class="card-title mb-0">Monochrome Pie Chart</h4>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <div id="monochrome_pie_chart" data-colors='["--vz-primary"]' class="apex-charts" dir="ltr"></div>
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
                            <h4 class="card-title mb-0">Gradient Donut Chart</h4>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <div id="gradient_chart" data-colors='["--vz-primary", "--vz-success", "--vz-warning", "--vz-danger", "--vz-info"]' class="apex-charts" dir="ltr"></div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>
                      <!-- end col -->

                      <div class="col-xl-6">
                        <div class="card">
                          <div class="card-header">
                            <h4 class="card-title mb-0">Patterned Donut Chart</h4>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <div id="pattern_chart" data-colors='["--vz-primary", "--vz-success", "--vz-warning", "--vz-danger", "--vz-info"]' class="apex-charts" dir="ltr"></div>
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
                            <h4 class="card-title mb-0">Pie Chart with Image Fill</h4>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <div id="image_pie_chart" data-colors='["--vz-primary", "--vz-success", "--vz-warning", "--vz-info"]' class="apex-charts" dir="ltr"></div>
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

        <!-- piecharts init -->
        <script src="{$themePath}/assets/js/pages/apexcharts-pie.init.js"></script>


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
