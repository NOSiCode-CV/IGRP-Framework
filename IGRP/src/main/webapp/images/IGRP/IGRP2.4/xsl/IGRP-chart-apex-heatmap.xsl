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
                            <h4 class="card-title mb-0">Basic Heatmap Chart</h4>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <div class="live-preview">
                              <div id="basic_heatmap" data-colors='["--vz-success", "--vz-card-bg-custom"]' class="apex-charts" dir="ltr"></div>
                            </div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>
                      <!-- end col -->
                      <div class="col-xl-6">
                        <div class="card">
                          <div class="card-header">
                            <h4 class="card-title mb-0">Heatmap - Multiple Series</h4>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <div id="multiple_heatmap" data-colors='["--vz-primary", "--vz-secondary", "--vz-success", "--vz-info", "--vz-warning", "--vz-danger", "--vz-dark", "--vz-primary", "--vz-card-bg-custom"]' class="apex-charts" dir="ltr"></div>
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
                            <h4 class="card-title mb-0">Heatmap Color Range</h4>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <div id="color_heatmap" data-colors='["--vz-info", "--vz-success", "--vz-primary", "--vz-warning"]' class="apex-charts" dir="ltr"></div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>
                      <!-- end col -->
                      <div class="col-xl-6">
                        <div class="card">
                          <div class="card-header">
                            <h4 class="card-title mb-0">Heatmap - Range Without Shades</h4>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <div id="shades_heatmap" data-colors='["--vz-info", "--vz-primary"]' class="apex-charts" dir="ltr"></div>
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

        <!-- heatmapscharts init -->
        <script src="{$themePath}/assets/js/pages/apexcharts-heatmap.init.js"></script>



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
<xsl:include href="../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1515664208567"/>

</xsl:stylesheet>
