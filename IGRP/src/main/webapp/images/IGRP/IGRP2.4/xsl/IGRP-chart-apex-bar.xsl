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
                            <h4 class="card-title mb-0">Basic Bar Chart</h4>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <div id="bar_chart" data-colors='["--vz-success"]' class="apex-charts" dir="ltr"></div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>
                      <!-- end col -->
                      <div class="col-xl-6">
                        <div class="card">
                          <div class="card-header">
                            <h4 class="card-title mb-0">Custom DataLabels Bar</h4>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <div id="custom_datalabels_bar" data-colors='["--vz-primary", "--vz-secondary", "--vz-success", "--vz-info", "--vz-warning", "--vz-danger", "--vz-dark", "--vz-primary", "--vz-success", "--vz-secondary"]' class="apex-charts" dir="ltr"></div>
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
                            <h4 class="card-title mb-0">Stacked Bar Charts</h4>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <div id="stacked_bar" data-colors='["--vz-primary", "--vz-success", "--vz-warning", "--vz-danger", "--vz-info"]' class="apex-charts" dir="ltr"></div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>
                      <!-- end col -->
                      <div class="col-xl-6">
                        <div class="card">
                          <div class="card-header">
                            <h4 class="card-title mb-0">Stacked Bars 100</h4>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <div id="stacked_bar_100" data-colors='["--vz-primary", "--vz-success", "--vz-warning", "--vz-danger", "--vz-info"]' class="apex-charts" dir="ltr"></div>
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
                            <h4 class="card-title mb-0">Bar with Negative Values</h4>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <div id="negative_bars" data-colors='["--vz-primary", "--vz-success"]' class="apex-charts" dir="ltr"></div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>
                      <!-- end col -->
                      <div class="col-xl-6">
                        <div class="card">
                          <div class="card-header">
                            <h4 class="card-title mb-0">Bar with Markers</h4>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <div id="bar_markers" data-colors='["--vz-success", "--vz-primary"]' class="apex-charts" dir="ltr"></div>
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
                            <h4 class="card-title mb-0">Reversed Bar Chart</h4>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <div id="reversed_bars" data-colors='["--vz-info"]' class="apex-charts" dir="ltr"></div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>
                      <!-- end col -->
                      <div class="col-xl-6">
                        <div class="card">
                          <div class="card-header">
                            <h4 class="card-title mb-0">Patterned Chart</h4>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <div id="patterned_bars" data-colors='["--vz-primary", "--vz-success", "--vz-warning", "--vz-danger"]' class="apex-charts" dir="ltr"></div>
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
                            <h4 class="card-title mb-0">Grouped Bar Chart</h4>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <div id="grouped_bar" data-colors='["--vz-primary", "--vz-success"]' class="apex-charts" dir="ltr"></div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>
                      <!-- end col -->
                      <div class="col-xl-6">
                        <div class="card">
                          <div class="card-header">
                            <h4 class="card-title mb-0">Bar with Images</h4>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <div class="live-preview">
                              <div id="bar_images" class="apex-charts" dir="ltr"></div>
                            </div>
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

        <!-- barcharts init -->
        <script src="{$themePath}/assets/js/pages/apexcharts-bar.init.js"></script>

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
