<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/>

  <xsl:template match="/">
    <html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">
      <head>

        <!-- page includes css -->

        <!-- aos css -->
        <link rel="stylesheet" href="{$path}/libs/aos/aos.css" />

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
                            <div class="text-center">
                              <h4 class="card-title mb-0">Fade Animation</h4>
                            </div>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <div class="live-preview">
                              <div>
                                <div class="row">
                                  <div class="col-lg-6">
                                    <div class="p-4 pb-0 border mt-4">
                                      <h4 class="mb-4 text-center">Fade Up</h4>
                                      <pre>
                                        <code class="language-markup">&lt;div data-aos="fade-up">&lt;/div></code>
                                      </pre>

                                      <div class="row justify-content-center">
                                        <div class="col-sm-10 col-lg-8">
                                          <div data-aos="fade-up">
                                            <img src="{$themePath}/assets/images/mac-img.svg" alt="Mac Image" class="img-fluid"></img>
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                  <!-- end col -->
                                  <div class="col-lg-6">
                                    <div class="p-4 pb-0 border mt-4">
                                      <h4 class="mb-4 text-center">Fade Down</h4>
                                      <pre>
                                        <code class="language-markup">&lt;div data-aos="fade-down">&lt;/div></code>
                                      </pre>

                                      <div class="row justify-content-center">
                                        <div class="col-sm-10 col-lg-8">
                                          <div data-aos="fade-down">
                                            <img src="{$themePath}/assets/images/mac-img.svg" alt="Mac Image" class="img-fluid"></img>
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                  <!-- end col -->
                                </div>
                                <!-- end row -->

                                <div class="row">
                                  <div class="col-lg-6">
                                    <div class="p-4 pb-0 border mt-4">
                                      <h4 class="mb-4 text-center">Fade Right</h4>
                                      <pre>
                                        <code class="language-markup">&lt;div data-aos="fade-right">&lt;/div></code>
                                      </pre>

                                      <div class="row justify-content-center">
                                        <div class="col-sm-10 col-md-8">
                                          <div data-aos="fade-right">
                                            <img src="{$themePath}/assets/images/mac-img.svg" alt="Mac Image" class="img-fluid"></img>
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                  <!-- end col -->
                                  <div class="col-lg-6">
                                    <div class="p-4 pb-0 border mt-4">
                                      <h4 class="mb-4 text-center">Fade Left</h4>
                                      <pre>
                                        <code class="language-markup">&lt;div data-aos="fade-left">&lt;/div></code>
                                      </pre>

                                      <div class="row justify-content-center">
                                        <div class="col-sm-10 col-md-8">
                                          <div data-aos="fade-left">
                                            <img src="{$themePath}/assets/images/mac-img.svg" alt="Mac Image" class="img-fluid"></img>
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                  <!-- end col -->
                                </div>
                                <!-- end row -->

                                <div class="row">
                                  <div class="col-lg-6">
                                    <div class="p-4 pb-0 border mt-4">
                                      <h4 class="mb-4 text-center">Fade Up Right</h4>
                                      <pre>
                                        <code class="language-markup">&lt;div data-aos="fade-up-right">&lt;/div></code>
                                      </pre>

                                      <div class="row justify-content-center">
                                        <div class="col-sm-10 col-md-8">
                                          <div data-aos="fade-up-right">
                                            <img src="{$themePath}/assets/images/mac-img.svg" alt="Mac Image" class="img-fluid"></img>
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                  <!-- end col -->
                                  <div class="col-lg-6">
                                    <div class="p-4 pb-0 border mt-4">
                                      <h4 class="mb-4 text-center">Fade Up Left</h4>
                                      <pre>
                                        <code class="language-markup">&lt;div data-aos="fade-up-left">&lt;/div></code>
                                      </pre>

                                      <div class="row justify-content-center">
                                        <div class="col-sm-10 col-md-8">
                                          <div data-aos="fade-up-left">
                                            <img src="{$themePath}/assets/images/mac-img.svg" alt="Mac Image" class="img-fluid"></img>
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                  <!-- end col -->
                                </div>
                                <!-- end row -->

                                <div class="row">
                                  <div class="col-lg-6">
                                    <div class="p-4 pb-0 border mt-4">
                                      <h4 class="mb-4 text-center">Fade Down Right</h4>
                                      <pre>
                                        <code class="language-markup">&lt;div data-aos="fade-down-right">&lt;/div></code>
                                      </pre>

                                      <div class="row justify-content-center">
                                        <div class="col-sm-10 col-md-8">
                                          <div data-aos="fade-down-right">
                                            <img src="{$themePath}/assets/images/mac-img.svg" alt="Mac Image" class="img-fluid"></img>
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                  <!-- end col -->
                                  <div class="col-lg-6">
                                    <div class="p-4 pb-0 border mt-4">
                                      <h4 class="mb-4 text-center">Fade Down Left</h4>
                                      <pre>
                                        <code class="language-markup">&lt;div data-aos="fade-down-left">&lt;/div></code>
                                      </pre>

                                      <div class="row justify-content-center">
                                        <div class="col-sm-10 col-md-8">
                                          <div data-aos="fade-down-left">
                                            <img src="{$themePath}/assets/images/mac-img.svg" alt="Mac Image" class="img-fluid"></img>
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                  <!-- end col -->
                                </div>
                                <!-- end row -->
                              </div>
                            </div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>
                      <!-- end col -->
                    </div>
                    <!-- end row -->

                    <div class="row">
                      <div class="col-lg-12">
                        <div class="card">
                          <div class="card-header">
                            <div class="text-center">
                              <h4 class="card-title mb-0">Flip Animation</h4>
                            </div>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <div class="live-preview">
                              <div>
                                <div class="row">
                                  <div class="col-lg-6">
                                    <div class="p-4 pb-0 border mt-4">
                                      <h4 class="mb-4 text-center">Flip Left</h4>
                                      <pre>
                                        <code class="language-markup">&lt;div data-aos="flip-left">&lt;/div></code>
                                      </pre>

                                      <div class="row justify-content-center">
                                        <div class="col-sm-10 col-md-8">
                                          <div data-aos="flip-left">
                                            <img src="{$themePath}/assets/images/mac-img.svg" alt="Mac Image" class="img-fluid"></img>
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                  <!-- end col -->
                                  <div class="col-lg-6">
                                    <div class="p-4 pb-0 border mt-4">
                                      <h4 class="mb-4 text-center">Flip Right</h4>
                                      <pre>
                                        <code class="language-markup">&lt;div data-aos="flip-right">&lt;/div></code>
                                      </pre>

                                      <div class="row justify-content-center">
                                        <div class="col-sm-10 col-md-8">
                                          <div data-aos="flip-right">
                                            <img src="{$themePath}/assets/images/mac-img.svg" alt="Mac Image" class="img-fluid"></img>
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                  <!-- end col -->
                                </div>
                                <!-- end row -->

                                <div class="row">
                                  <div class="col-lg-6">
                                    <div class="p-4 pb-0 border mt-4">
                                      <h4 class="mb-4 text-center">Flip Up</h4>
                                      <pre>
                                        <code class="language-markup">&lt;div data-aos="flip-up">&lt;/div></code>
                                      </pre>

                                      <div class="row justify-content-center">
                                        <div class="col-sm-10 col-md-8">
                                          <div data-aos="flip-up">
                                            <img src="{$themePath}/assets/images/mac-img.svg" alt="Mac Image" class="img-fluid"></img>
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                  <!-- end col -->
                                  <div class="col-lg-6">
                                    <div class="p-4 pb-0 border mt-4">
                                      <h4 class="mb-4 text-center">Flip Down</h4>
                                      <pre>
                                        <code class="language-markup">&lt;div data-aos="flip-down">&lt;/div></code>
                                      </pre>

                                      <div class="row justify-content-center">
                                        <div class="col-sm-10 col-md-8">
                                          <div data-aos="flip-down">
                                            <img src="{$themePath}/assets/images/mac-img.svg" alt="Mac Image" class="img-fluid"></img>
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                  <!-- end col -->
                                </div>
                                <!-- end row -->

                              </div>
                            </div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>
                      <!-- end col -->
                    </div>
                    <!-- end row -->

                    <div class="row">
                      <div class="col-lg-12">
                        <div class="card">
                          <div class="card-header">
                            <div class="text-center">
                              <h4 class="card-title mb-0">Zoom Animation</h4>
                            </div>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <div class="live-preview">
                              <div>
                                <div class="row">
                                  <div class="col-lg-6">
                                    <div class="p-4 pb-0 border mt-4">
                                      <h4 class="mb-4 text-center">Zoom In</h4>
                                      <pre>
                                        <code class="language-markup">&lt;div data-aos="zoom-in">&lt;/div></code>
                                      </pre>

                                      <div class="row justify-content-center">
                                        <div class="col-sm-10 col-md-8">
                                          <div data-aos="zoom-in">
                                            <img src="{$themePath}/assets/images/mac-img.svg" alt="Mac Image" class="img-fluid"></img>
                                          </div>
                                        </div>
                                      </div>
                                    </div>

                                    <div class="p-4 pb-0 border mt-4">
                                      <h4 class="mb-4 text-center">Zoom In Up</h4>
                                      <pre>
                                        <code class="language-markup">&lt;div data-aos="zoom-in-up">&lt;/div></code>
                                      </pre>

                                      <div class="row justify-content-center">
                                        <div class="col-sm-10 col-md-8">
                                          <div data-aos="zoom-in-up">
                                            <img src="{$themePath}/assets/images/mac-img.svg" alt="Mac Image" class="img-fluid"></img>
                                          </div>
                                        </div>
                                      </div>
                                    </div>

                                    <div class="p-4 pb-0 border mt-4">
                                      <h4 class="mb-4 text-center">Zoom In Down</h4>
                                      <pre>
                                        <code class="language-markup">&lt;div data-aos="zoom-in-down">&lt;/div></code>
                                      </pre>

                                      <div class="row justify-content-center">
                                        <div class="col-sm-10 col-md-8">
                                          <div data-aos="zoom-in-down">
                                            <img src="{$themePath}/assets/images/mac-img.svg" alt="Mac Image" class="img-fluid"></img>
                                          </div>
                                        </div>
                                      </div>
                                    </div>

                                    <div class="p-4 pb-0 border mt-4">
                                      <h4 class="mb-4 text-center">Zoom In Right</h4>
                                      <pre>
                                        <code class="language-markup">&lt;div data-aos="zoom-in-right">&lt;/div></code>
                                      </pre>

                                      <div class="row justify-content-center">
                                        <div class="col-sm-10 col-md-8">
                                          <div data-aos="zoom-in-right">
                                            <img src="{$themePath}/assets/images/mac-img.svg" alt="Mac Image" class="img-fluid"></img>
                                          </div>
                                        </div>
                                      </div>
                                    </div>

                                    <div class="p-4 pb-0 border mt-4">
                                      <h4 class="mb-4 text-center">Zoom In Left</h4>
                                      <pre>
                                        <code class="language-markup">&lt;div data-aos="zoom-in-left">&lt;/div></code>
                                      </pre>

                                      <div class="row justify-content-center">
                                        <div class="col-sm-10 col-md-8">
                                          <div data-aos="zoom-in-left">
                                            <img src="{$themePath}/assets/images/mac-img.svg" alt="Mac Image" class="img-fluid"></img>
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                  <!-- end col -->
                                  <div class="col-lg-6">
                                    <div class="p-4 pb-0 border mt-4">
                                      <h4 class="mb-4 text-center">Zoom Out</h4>
                                      <pre>
                                        <code class="language-markup">&lt;div data-aos="zoom-in">&lt;/div></code>
                                      </pre>

                                      <div class="row justify-content-center">
                                        <div class="col-sm-10 col-md-8">
                                          <div data-aos="zoom-out">
                                            <img src="{$themePath}/assets/images/mac-img.svg" alt="Mac Image" class="img-fluid"></img>
                                          </div>
                                        </div>
                                      </div>
                                    </div>

                                    <div class="p-4 pb-0 border mt-4">
                                      <h4 class="mb-4 text-center">Zoom Out Up</h4>
                                      <pre>
                                        <code class="language-markup">&lt;div data-aos="zoom-out-up">&lt;/div></code>
                                      </pre>

                                      <div class="row justify-content-center">
                                        <div class="col-sm-10 col-md-8">
                                          <div data-aos="zoom-out-up">
                                            <img src="{$themePath}/assets/images/mac-img.svg" alt="Mac Image" class="img-fluid"></img>
                                          </div>
                                        </div>
                                      </div>
                                    </div>

                                    <div class="p-4 pb-0 border mt-4">
                                      <h4 class="mb-4 text-center">Zoom Out Down</h4>
                                      <pre>
                                        <code class="language-markup">&lt;div data-aos="zoom-out-down">&lt;/div></code>
                                      </pre>

                                      <div class="row justify-content-center">
                                        <div class="col-sm-10 col-md-8">
                                          <div data-aos="zoom-out-down">
                                            <img src="{$themePath}/assets/images/mac-img.svg" alt="Mac Image" class="img-fluid"></img>
                                          </div>
                                        </div>
                                      </div>
                                    </div>

                                    <div class="p-4 pb-0 border mt-4">
                                      <h4 class="mb-4 text-center">Zoom Out Right</h4>
                                      <pre>
                                        <code class="language-markup">&lt;div data-aos="zoom-out-right">&lt;/div></code>
                                      </pre>

                                      <div class="row justify-content-center">
                                        <div class="col-sm-10 col-md-8">
                                          <div data-aos="zoom-out-right">
                                            <img src="{$themePath}/assets/images/mac-img.svg" alt="Mac Image" class="img-fluid"></img>
                                          </div>
                                        </div>
                                      </div>
                                    </div>

                                    <div class="p-4 pb-0 border mt-4">
                                      <h4 class="mb-4 text-center">Zoom Out Left</h4>
                                      <pre>
                                        <code class="language-markup">&lt;div data-aos="zoom-out-left">&lt;/div></code>
                                      </pre>

                                      <div class="row justify-content-center">
                                        <div class="col-sm-10 col-md-8">
                                          <div data-aos="zoom-out-left">
                                            <img src="{$themePath}/assets/images/mac-img.svg" alt="Mac Image" class="img-fluid"></img>
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                  </div>                                  <!-- end col -->
                                </div>                                <!-- end row -->
                              </div>
                            </div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>                      <!-- end col -->
                    </div>                    <!-- end row -->

                    <div class="row">
                      <div class="col-lg-12">
                        <div class="card">
                          <div class="card-header">
                            <div class="text-center">
                              <h4 class="card-title mb-0">Animation Examples</h4>
                            </div>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <div class="live-preview">
                              <div>
                                <div class="row">
                                  <div class="col-lg-6">
                                    <div class="p-4 pb-0 border mt-4">
                                      <h4 class="mb-4 text-center">Duration</h4>
                                      <pre>
                                        <code class="language-markup">&lt;div data-aos="fade-up" data-aos-duration="3000">&lt;/div></code>
                                      </pre>

                                      <div class="row justify-content-center">
                                        <div class="col-sm-10 col-md-8">
                                          <div data-aos="fade-up" data-aos-duration="3000">
                                            <img src="{$themePath}/assets/images/mac-img.svg" alt="Mac Image" class="img-fluid"></img>
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                  <!-- end col -->
                                  <div class="col-lg-6">
                                    <div class="p-4 pb-0 border mt-4">
                                      <h4 class="mb-4 text-center">Easing="linear"</h4>
                                      <pre>
                                        <code class="language-markup">&lt;div data-aos="fade-down" data-aos-easing="linear" data-aos-duration="1500">&lt;/div></code>
                                      </pre>

                                      <div class="row justify-content-center">
                                        <div class="col-sm-10 col-md-8">
                                          <div data-aos="fade-down" data-aos-easing="linear" data-aos-duration="1500">
                                            <img src="{$themePath}/assets/images/mac-img.svg" alt="Mac Image" class="img-fluid"></img>
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                  <!-- end col -->
                                </div>
                                <!-- end row -->

                                <div class="row">
                                  <div class="col-lg-6">
                                    <div class="p-4 pb-0 border mt-4">
                                      <h4 class="mb-4 text-center">Offset</h4>
                                      <pre>
                                        <code class="language-markup">&lt;div data-aos="fade-right" data-aos-offset="300" data-aos-easing="ease-in-sine">&lt;/div></code>
                                      </pre>

                                      <div class="row justify-content-center">
                                        <div class="col-sm-10 col-md-8">
                                          <div data-aos="fade-right" data-aos-offset="300" data-aos-easing="ease-in-sine">
                                            <img src="{$themePath}/assets/images/mac-img.svg" alt="Mac Image" class="img-fluid"></img>
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                  <!-- end col -->
                                  <div class="col-lg-6">
                                    <div class="p-4 pb-0 border mt-4">
                                      <h4 class="mb-4 text-center">Offset</h4>
                                      <pre>
                                        <code class="language-markup">&lt;div data-aos="fade-left" data-aos-offset="500" data-aos-duration="500">&lt;/div></code>
                                      </pre>

                                      <div class="row justify-content-center">
                                        <div class="col-sm-10 col-md-8">
                                          <div data-aos="fade-left" data-aos-offset="500" data-aos-duration="500">
                                            <img src="{$themePath}/assets/images/mac-img.svg" alt="Mac Image" class="img-fluid"></img>
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                  <!-- end col -->
                                </div>
                                <!-- end row -->

                                <div class="row">
                                  <div class="col-lg-6">
                                    <div class="p-4 pb-0 border mt-4">
                                      <h4 class="mb-4 text-center">Easing="ease-in-back"</h4>
                                      <pre>
                                        <code class="language-markup">&lt;div data-aos="fade-zoom-in" data-aos-easing="ease-in-back" data-aos-delay="300" data-aos-offset="0">&lt;/div></code>
                                      </pre>

                                      <div class="row justify-content-center">
                                        <div class="col-sm-10 col-md-8">
                                          <div data-aos="fade-zoom-in" data-aos-easing="ease-in-back" data-aos-delay="300" data-aos-offset="0">
                                            <img src="{$themePath}/assets/images/mac-img.svg" alt="Mac Image" class="img-fluid"></img>
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                  <!-- end col -->
                                  <div class="col-lg-6">
                                    <div class="p-4 pb-0 border mt-4">
                                      <h4 class="mb-4 text-center">Easing="ease-out-cubic"</h4>
                                      <pre>
                                        <code class="language-markup">&lt;div data-aos="flip-left" data-aos-easing="ease-out-cubic" data-aos-duration="2000">&lt;/div></code>
                                      </pre>

                                      <div class="row justify-content-center">
                                        <div class="col-sm-10 col-md-8">
                                          <div data-aos="flip-left" data-aos-easing="ease-out-cubic" data-aos-duration="2000">
                                            <img src="{$themePath}/assets/images/mac-img.svg" alt="Mac Image" class="img-fluid"></img>
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                  <!-- end col -->
                                </div>
                                <!-- end row -->
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


        <xsl:call-template name="igrp-scripts"/>


        <!-- aos js -->
        <script src="{$path}/libs/aos/aos.js"></script>
        <!-- prismjs plugin -->
        <script src="{$path}/libs/prismjs/prism.js"></script>
        <!-- animation init -->
        <script src="{$themePath}/assets/js/pages/animation-aos.init.js"></script>



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
