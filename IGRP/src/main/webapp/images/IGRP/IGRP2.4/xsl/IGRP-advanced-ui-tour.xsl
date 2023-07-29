<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/>

  <xsl:template match="/">
    <html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">
      <head>

        <!-- page includes css -->

        <!-- shepherd.js css -->
        <link rel="stylesheet" href="{$path}/libs/shepherd.js/css/shepherd.css"/>

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
                      <div class="col-lg-12">
                        <div class="card">
                          <div class="card-header">
                            <h4 class="card-title mb-0">Shepherdjs</h4>
                          </div>
                          <!-- end card header -->

                          <div class="card-body">

                            <p class="text-muted mb-4">Use when you want to help users along getting accustomed to your user interface or Use when you want to notify your users of new or unfamiliar features.</p>

                            <div>
                              <div class="row justify-content-center">
                                <div class="col-lg-5">
                                  <div class="text-center mt-4 mb-5">
                                    <div class="py-3 px-2 d-inline-block" id="logo-tour">
                                      <img src="{$themePath}/assets/images/logo-dark.svg" class="card-logo card-logo-dark" alt="logo" height="50">
                                        <img src="{$themePath}/assets/images/logo-white.svg" class="card-logo card-logo-light" alt="logo" height="50" >
                                        </img>
                                      </img>
                                    </div>
                                    <h5 class="fs-16">Responsive Admin Dashboard Template</h5>
                                    <p class="text-muted">Vestibulum auctor tincidunt semper. Phasellus ut vulputate lacus. Suspendisse ultricies mi eros, sit amet tempor nulla varius sed dapibus in tellus.</p>
                                    <div class="hstack gap-2 justify-content-center">
                                      <button type="button" class="btn btn-primary btn-sm">View more</button>
                                      <button type="button" class="btn btn-success btn-sm">Email us</button>
                                    </div>
                                  </div>
                                </div>
                                <!-- end col -->
                              </div>
                              <!-- end row -->

                              <div class="row justify-content-center">
                                <div class="col-xxl-9 col-lg-10 col-sm-8">
                                  <div class="row">
                                    <div class="col-lg-4">
                                      <div class="card border shadow-none">
                                        <div class="card-body text-center">
                                          <div class="avatar-md mx-auto mb-4" id="register-tour">
                                            <div class="avatar-title bg-light rounded-circle text-primary fs-24">
                                              <i class="ri-edit-box-line"></i>
                                            </div>
                                          </div>
                                          <h5>Free register</h5>
                                          <p class="text-muted mb-0">Get your Free Velzon account now.</p>
                                        </div>
                                      </div>
                                    </div>
                                    <!-- end col -->
                                    <div class="col-lg-4">
                                      <div class="card border shadow-none">
                                        <div class="card-body text-center">
                                          <div class="avatar-md mx-auto mb-4" id="login-tour">
                                            <div class="avatar-title bg-light rounded-circle text-primary fs-24">
                                              <i class="ri-user-shared-line"></i>
                                            </div>
                                          </div>
                                          <h5>Log in account</h5>
                                          <p class="text-muted mb-0">Sign in to continue to Velzon.</p>
                                        </div>
                                      </div>
                                    </div>
                                    <!-- end col -->
                                    <div class="col-lg-4">
                                      <div class="card border shadow-none">
                                        <div class="card-body text-center">
                                          <div class="avatar-md mx-auto mb-4" id="getproduct-tour">
                                            <div class="avatar-title bg-light rounded-circle text-primary fs-24">
                                              <i class="ri-file-download-line"></i>
                                            </div>
                                          </div>
                                          <h5>Get Product</h5>
                                          <p class="text-muted mb-0">Sign in to continue to Velzon.</p>
                                        </div>
                                      </div>
                                    </div>
                                    <!-- end col -->
                                  </div>
                                  <!-- end row -->
                                </div>
                                <!-- end col -->
                              </div>
                              <!-- end row -->

                              <div class="text-center my-4">
                                <button class="btn btn-success" id="thankyou-tour">Thank you !</button>
                              </div>
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

        <!-- prismjs plugin -->
        <script src="{$path}/libs/prismjs/prism.js"></script>


        <!-- shepherd js -->
        <script src="{$path}/libs/shepherd.js/js/shepherd.min.js"></script>

        <!-- tour init -->
        <script src="{$themePath}/assets/js/pages/tour.init.js"></script>



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
