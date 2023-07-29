<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes"
    doctype-system="about:legacy-compat" />

  <xsl:template match="/">
    <html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark"
      data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">
      <head>

        <!-- page includes css -->

        <xsl:call-template name="igrp-head" />

      </head>
      <body class="">
        <div id="layout-wrapper">
          <xsl:call-template name="igrp-header" />
          <xsl:call-template name="igrp-sidebar" />
          <div class="main-content">
            <div class="page-content">
              <div class="container-fluid">
                <xsl:call-template name="igrp-page-title" />
                <div class="igrp-page-contents">

                  <!-- page content -->
                  <div class="container-fluid">
                    <div class="row">
                      <div class="col-lg-12">
                        <div class="card">
                          <div class="card-header align-items-center d-flex">
                            <h4 class="card-title mb-0 flex-grow-1">Rater Js</h4>
                          </div>                          <!--
                          end card header -->

                          <div class="card-body">
                            <p class="text-muted">Rater-js is a star rating widget for the browser.
    here are the various examples of rating shown below with variation.</p>
                            <div class="live-preview">
                              <div class="table-responsive">
                                <table class="table align-middle mb-0">
                                  <thead>
                                    <tr>
                                      <th scope="col">Title</th>
                                      <th scope="col">Example</th>
                                      <th scope="col">Description</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <tr>
                                      <th scope="row">Basic Rater</th>
                                      <td>
                                        <div id="basic-rater" dir="ltr"></div>
                                      </td>
                                      <td>
                                        <pre>
                                          <code class="language-markup">&lt;div id="basic-rater" dir="ltr">&lt;/div></code>
                                        </pre>
                                      </td>
                                    </tr>
                                    <tr>
                                      <th scope="row">Rater with Step</th>
                                      <td>
                                        <div id="rater-step" dir="ltr"></div>
                                      </td>
                                      <td>
                                        <pre>
                                          <code class="language-markup">&lt;div id="rater-step" dir="ltr">&lt;/div></code>
                                        </pre>
                                      </td>
                                    </tr>
                                    <tr>
                                      <th scope="row">Custom Messages</th>
                                      <td>
                                        <div id="rater-message" dir="ltr"></div>
                                      </td>
                                      <td>
                                        <pre>
                                          <code class="language-markup">&lt;div id="rater-message" dir="ltr">&lt;/div></code>
                                        </pre>
                                      </td>
                                    </tr>
                                    <tr>
                                      <th scope="row">Example with unlimited number of stars.
    readOnly option is set to true.</th>
                                      <td>
                                        <div id="rater-unlimitedstar" dir="ltr"></div>
                                      </td>
                                      <td>
                                        <pre>
                                          <code class="language-markup">&lt;div id="rater-unlimitedstar" dir="ltr">&lt;/div></code>
                                        </pre>
                                      </td>
                                    </tr>
                                    <tr>
                                      <th scope="row">On Hover Event</th>
                                      <td>
                                        <div dir="ltr">
                                          <div id="rater-onhover" class="align-middle"></div>
                                          <span class="ratingnum badge bg-info align-middle ms-2"></span>
                                        </div>
                                      </td>
                                      <td>
                                        <pre>
                                          <code class="language-markup">&lt;div dir=&quot;ltr&quot;&gt;
    &lt;div id=&quot;rater-onhover&quot; class=&quot;align-middle&quot;&gt;&lt;/div&gt;
    &lt;span class=&quot;ratingnum badge bg-info align-middle ms-2&quot;&gt;&lt;/span&gt;
&lt;/div&gt;</code>
                                        </pre>
                                      </td>
                                    </tr>

                                    <tr>
                                      <th scope="row">Clear/Reset Rater</th>
                                      <td>
                                        <div dir="ltr">
                                          <div id="raterreset" class="align-middle"></div>
                                          <span class="clear-rating"></span>
                                          <button id="raterreset-button"
                                            class="btn btn-light btn-sm ms-2">Reset</button>
                                        </div>
                                      </td>
                                      <td>
                                        <pre>
                                          <code class="language-markup">&lt;div dir=&quot;ltr&quot;&gt;
    &lt;div id=&quot;raterreset&quot; class=&quot;align-middle&quot;&gt;&lt;/div&gt;
    &lt;span class=&quot;clear-rating&quot;&gt;&lt;/span&gt;
    &lt;button id=&quot;raterreset-button&quot; class=&quot;btn btn-light btn-sm ms-2&quot;&gt;Reset&lt;/button&gt;
&lt;/div&gt;</code>
                                        </pre>
                                      </td>
                                    </tr>
                                  </tbody>
                                </table>
                                <!-- end table -->
                              </div>
                              <!-- end table responsive -->
                            </div>

                            <div class="d-none code-view">
                              <pre>
                                <code class="language-markup">&lt;div data-simplebar style=&quot;max-height: 220px;&quot;&gt;
    ...
&lt;/div&gt;</code>
                              </pre>
                            </div>
                          </div>                          <!--
                          end card-body -->
                        </div>                        <!--
                        end card -->
                      </div>
                      <!-- end col -->
                    </div>
                    <!-- end row -->

                  </div>
                  <!-- container-fluid -->

                </div>
              </div>
            </div>
            <xsl:call-template name="igrp-footer" />
          </div>
        </div>

        <xsl:call-template name="igrp-page-helpers" />

        <!-- page includes JS -->

        <!-- prismjs plugin -->
        <script src="{$path}/libs/prismjs/prism.js"></script>


        <!-- rater-js plugin -->
        <script src="{$path}/libs/rater-js/index.js"></script>
        <!-- rating init -->
        <script src="{$themePath}/assets/js/pages/rating.init.js"></script>


        <xsl:call-template name="igrp-scripts" />


      </body>
    </html>
  </xsl:template>

  <xsl:include href="../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1515664208567" />
  <xsl:include href="../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1515664208567" />

  <xsl:include href="../xsl/tmpl/parts.common.xsl?v=1515664208567" />
  <xsl:include href="../xsl/tmpl/parts.head.xsl?v=1515664208567" />
  <xsl:include href="../xsl/tmpl/parts.scripts.xsl?v=1515664208567" />
  <xsl:include href="../xsl/tmpl/parts.footer.xsl?v=1515664208567" />
  <xsl:include href="../xsl/tmpl/parts.sidebar.xsl?v=1515664208567" />
  <xsl:include href="../xsl/tmpl/parts.header.xsl?v=1515664208567" />
  <xsl:include href="../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1515664208567"/>

</xsl:stylesheet>