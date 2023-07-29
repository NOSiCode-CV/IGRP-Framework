<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/>

  <xsl:template match="/">
    <html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">
      <head>

        <!-- page includes css -->
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />



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
                    <div class="alert alert-danger" role="alert">
                        This is <strong>Select2</strong> page in wihch we have used <b>jQuery</b> with cdn link!
                    </div>

                    <div class="row">
                      <div class="col-lg-12">
                        <div class="card">
                          <div class="card-header">
                            <h5 class="card-title mb-0">Basic Select2</h5>
                          </div>
                          <div class="card-body">
                            <p class="text-muted">Use <code>js-example-basic-single</code>,                              <code>js-example-basic-multiple</code>,                              <code>js-example-data-array</code>,                              <code>js-example-templating</code>,                              <code>select-flag-templating</code>,  class to show select2 example.</p>
                            <div class="row g-4">
                              <div class="col-lg-4">
                                <h6 class="fw-semibold">Basic Select</h6>
                                <select class="js-example-basic-single" name="state">
                                  <option value="AL">Alabama</option>
                                  <option value="MA">Madrid</option>
                                  <option value="TO">Toronto</option>
                                  <option value="LO">Londan</option>
                                  <option value="WY">Wyoming</option>
                                </select>
                              </div>
                              <div class="col-lg-4">
                                <h6 class="fw-semibold">Multi Select</h6>
                                <select class="js-example-basic-multiple" name="states[]" multiple="multiple">
                                  <optgroup label="UK">
                                    <option value="London">London</option>
                                    <option value="Manchester" selected="">Manchester</option>
                                    <option value="Liverpool">Liverpool</option>
                                  </optgroup>
                                  <optgroup label="FR">
                                    <option value="Paris">Paris</option>
                                    <option value="Lyon">Lyon</option>
                                    <option value="Marseille">Marseille</option>
                                  </optgroup>
                                  <optgroup label="SP">
                                    <option value="Madrid" selected="">Madrid</option>
                                    <option value="Barcelona">Barcelona</option>
                                    <option value="Malaga">Malaga</option>
                                  </optgroup>
                                  <optgroup label="CA">
                                    <option value="Montreal">Montreal</option>
                                    <option value="Toronto">Toronto</option>
                                    <option value="Vancouver">Vancouver</option>
                                  </optgroup>
                                </select>
                              </div>
                              <div class="col-lg-4">
                                <h6 class="fw-semibold">Ajax Select</h6>
                                <select class="js-example-data-array" name="state"></select>
                              </div>
                              <!--end col-->
                              <div class="col-lg-4">
                                <h6 class="fw-semibold">Templating</h6>
                                <select class="form-control js-example-templating">
                                  <optgroup label="Alaskan/Hawaiian Time Zone">
                                    <option value="AK">Alaska</option>
                                    <option value="HI">Hawaii</option>
                                  </optgroup>
                                  <optgroup label="Pacific Time Zone">
                                    <option value="CA">California</option>
                                    <option value="NV">Nevada</option>
                                    <option value="OR">Oregon</option>
                                    <option value="WA">Washington</option>
                                  </optgroup>
                                </select>
                              </div>                              <!--end col-->
                              <div class="col-lg-4">
                                <h6 class="fw-semibold">Selections Templating</h6>
                                <select class="form-control select-flag-templating">
                                  <optgroup label="Alaskan/Hawaiian Time Zone">
                                    <option value="AK">Alaska</option>
                                    <option value="HI">Hawaii</option>
                                  </optgroup>
                                  <optgroup label="Pacific Time Zone">
                                    <option value="CA">California</option>
                                    <option value="NV">Nevada</option>
                                    <option value="OR">Oregon</option>
                                    <option value="WA">Washington</option>
                                  </optgroup>
                                </select>
                              </div>                              <!--end col-->
                            </div>
                            <!--end row-->
                          </div>
                        </div>
                      </div>                      <!--end col-->
                    </div>                    <!--end row-->

                    <div class="row">
                      <div class="col-lg-12">
                        <div class="card">
                          <div class="card-header">
                            <h5 class="card-title mb-0">Disabling a Select2 Control</h5>
                          </div>
                          <div class="card-body">
                            <p class="text-muted">Select2 will respond to the disabled attribute on <code>&lt;select&gt;</code> elements. You can also initialize Select2 with disabled: true to get the same effect.</p>
                            <div class="vstack gap-3">
                              <select class="js-example-disabled" name="state">
                                <option value="AL">Alabama</option>
                                <option value="MA">Madrid</option>
                                <option value="TO">Toronto</option>
                                <option value="LO">Londan</option>
                                <option value="WY">Wyoming</option>
                              </select>
                              <select class="js-example-disabled-multi" name="states[]" multiple="multiple">
                                <optgroup label="UK">
                                  <option value="London">London</option>
                                  <option value="Manchester" selected="">Manchester</option>
                                  <option value="Liverpool">Liverpool</option>
                                </optgroup>
                                <optgroup label="FR">
                                  <option value="Paris">Paris</option>
                                  <option value="Lyon">Lyon</option>
                                  <option value="Marseille">Marseille</option>
                                </optgroup>
                                <optgroup label="SP">
                                  <option value="Madrid" selected="">Madrid</option>
                                  <option value="Barcelona">Barcelona</option>
                                  <option value="Malaga">Malaga</option>
                                </optgroup>
                                <optgroup label="CA">
                                  <option value="Montreal">Montreal</option>
                                  <option value="Toronto">Toronto</option>
                                  <option value="Vancouver">Vancouver</option>
                                </optgroup>
                              </select>
                            </div>
                            <div class="hstack gap-2 mt-3">
                              <button type="button" class="js-programmatic-enable btn btn-primary">
                                            Enable
                              </button>
                              <button type="button" class="js-programmatic-disable btn btn-success">
                                            Disable
                              </button>
                            </div>
                          </div>
                        </div>
                      </div>                      <!--end col-->
                    </div>                    <!--end row-->

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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.8/js/select2.min.js" defer=""></script>

        <!--jquery cdn-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <!--select2 cdn-->
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

        <script src="{$themePath}/assets/js/pages/select2.init.js"></script>


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
