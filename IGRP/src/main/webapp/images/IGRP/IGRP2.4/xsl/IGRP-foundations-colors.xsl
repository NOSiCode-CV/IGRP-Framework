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
                      <div class="col-12">
                        <div class="card">
                          <div class="card-header">
                            <h4 class="card-title">Colors Options</h4>
                            <p class="mb-0 text-muted">Use diffrent <code>color style</code> to color your
                                        element with a given table.</p>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <div class="table-responsive">
                              <table class="table table-bordered table-striped table-nowrap align-middle mb-0">
                                <thead>
                                  <tr>
                                    <th scope="col">
                                                        Colors
                                    </th>
                                    <th scope="col" colspan="2" class="text-center">
                                                        Background <br/>
 Gradient
                                    </th>
                                    <th scope="col" colspan="2" class="text-center">
                                                        Background <br/>
 Color
                                    </th>
                                    <th scope="col" colspan="2" class="text-center">
                                                        Background <br/>
 Soft
                                    </th>
                                    <th scope="col" colspan="2" class="text-center">
                                                        Border <br/>
 Colors
                                    </th>
                                    <th scope="col" colspan="2" class="text-center">
                                                        Text <br/>
 Colors
                                    </th>
                                  </tr>
                                </thead>
                                <tbody>

                                  <tr>
                                    <th class="" scope="row">
                                                        Primary
                                    </th>
                                    <td style="width: 100px;">
                                      <code>.bg-gradient</code>
                                    </td>
                                    <td style="width: 180px;">
                                      <div class="bg-primary bg-gradient p-2"></div>
                                    </td>
                                    <td style="width: 100px;">
                                      <code>.bg-primary</code>
                                    </td>
                                    <td style="width: 180px;">
                                      <div class="bg-primary p-2"></div>
                                    </td>
                                    <td style="width: 100px;">
                                      <code>.bg-soft-primary</code>
                                    </td>
                                    <td style="width: 180px;">
                                      <div class="bg-soft-primary p-2"></div>
                                    </td>
                                    <td style="width: 100px;">
                                      <code>.border-primary</code>
                                    </td>
                                    <td style="width: 180px;">
                                      <div class="border border-primary p-2"></div>
                                    </td>
                                    <td style="width: 100px;">
                                      <code>.text-primary</code>
                                    </td>
                                    <td style="width: 100px;">
                                      <div class="text-primary">text-primary</div>
                                    </td>
                                  </tr>


                                  <tr>
                                    <th class="" scope="row">
                                                        Secondary
                                    </th>
                                    <td>
                                      <code>.bg-gradient</code>
                                    </td>
                                    <td>
                                      <div class="bg-secondary bg-gradient p-2"></div>
                                    </td>
                                    <td>
                                      <code>.bg-secondary</code>
                                    </td>
                                    <td>
                                      <div class="bg-secondary p-2"></div>
                                    </td>
                                    <td>
                                      <code>.bg-soft-secondary</code>
                                    </td>
                                    <td>
                                      <div class="bg-soft-secondary p-2"></div>
                                    </td>
                                    <td>
                                      <code>.border-secondary</code>
                                    </td>
                                    <td>
                                      <div class="border border-secondary p-2"></div>
                                    </td>
                                    <td>
                                      <code>.text-secondary</code>
                                    </td>
                                    <td>
                                      <div class="text-secondary">text-secondary</div>
                                    </td>
                                  </tr>

                                  <tr>
                                    <th class="" scope="row">
                                                        Success
                                    </th>
                                    <td>
                                      <code>.bg-gradient</code>
                                    </td>
                                    <td>
                                      <div class="bg-success bg-gradient p-2 align-self-center"></div>
                                    </td>
                                    <td>
                                      <code>.bg-success</code>
                                    </td>
                                    <td>
                                      <div class="bg-success p-2"></div>
                                    </td>
                                    <td>
                                      <code>.bg-soft-success</code>
                                    </td>
                                    <td>
                                      <div class="bg-soft-success p-2"></div>
                                    </td>
                                    <td>
                                      <code>.border-success</code>
                                    </td>
                                    <td>
                                      <div class="border border-success p-2"></div>
                                    </td>
                                    <td>
                                      <code>.text-success</code>
                                    </td>
                                    <td>
                                      <div class="text-success">text-success</div>
                                    </td>
                                  </tr>

                                  <tr>
                                    <th class="" scope="row">
                                                        Info
                                    </th>
                                    <td>
                                      <code>.bg-gradient</code>
                                    </td>
                                    <td>
                                      <div class="bg-info bg-gradient p-2"></div>
                                    </td>
                                    <td>
                                      <code>.bg-info</code>
                                    </td>
                                    <td>
                                      <div class="bg-info p-2"></div>
                                    </td>
                                    <td>
                                      <code>.bg-soft-info</code>
                                    </td>
                                    <td>
                                      <div class="bg-soft-info p-2"></div>
                                    </td>
                                    <td>
                                      <code>.border-info</code>
                                    </td>
                                    <td>
                                      <div class="border border-info p-2"></div>
                                    </td>
                                    <td>
                                      <code>.text-info</code>
                                    </td>
                                    <td>
                                      <div class="text-info">text-info</div>
                                    </td>
                                  </tr>

                                  <tr>
                                    <th class="" scope="row">
                                                        Warning
                                    </th>
                                    <td>
                                      <code>.bg-gradient</code>
                                    </td>
                                    <td>
                                      <div class="bg-warning bg-gradient p-2"></div>
                                    </td>
                                    <td>
                                      <code>.bg-warning</code>
                                    </td>
                                    <td>
                                      <div class="bg-warning p-2"></div>
                                    </td>
                                    <td>
                                      <code>.bg-soft-warning</code>
                                    </td>
                                    <td>
                                      <div class="bg-soft-warning p-2"></div>
                                    </td>
                                    <td>
                                      <code>.border-warning</code>
                                    </td>
                                    <td>
                                      <div class="border border-warning p-2"></div>
                                    </td>
                                    <td>
                                      <code>.text-warning</code>
                                    </td>
                                    <td>
                                      <div class="text-warning">text-warning</div>
                                    </td>
                                  </tr>

                                  <tr>
                                    <th class="" scope="row">
                                                        Danger
                                    </th>
                                    <td>
                                      <code>.bg-gradient</code>
                                    </td>
                                    <td>
                                      <div class="bg-danger bg-gradient p-2"></div>
                                    </td>
                                    <td>
                                      <code>.bg-danger</code>
                                    </td>
                                    <td>
                                      <div class="bg-danger p-2"></div>
                                    </td>
                                    <td>
                                      <code>.bg-soft-danger</code>
                                    </td>
                                    <td>
                                      <div class="bg-soft-danger p-2"></div>
                                    </td>
                                    <td>
                                      <code>.border-danger</code>
                                    </td>
                                    <td>
                                      <div class="border border-danger p-2"></div>
                                    </td>
                                    <td>
                                      <code>.text-danger</code>
                                    </td>
                                    <td>
                                      <div class="text-danger">text-danger</div>
                                    </td>
                                  </tr>

                                  <tr>
                                    <th class="" scope="row">
                                                        Dark
                                    </th>
                                    <td>
                                      <code>.bg-gradient</code>
                                    </td>
                                    <td>
                                      <div class="bg-dark bg-gradient p-2"></div>
                                    </td>
                                    <td>
                                      <code>.bg-dark</code>
                                    </td>
                                    <td>
                                      <div class="bg-dark p-2"></div>
                                    </td>
                                    <td>
                                      <code>.bg-soft-dark</code>
                                    </td>
                                    <td>
                                      <div class="bg-soft-dark p-2"></div>
                                    </td>
                                    <td>
                                      <code>.border-dark</code>
                                    </td>
                                    <td>
                                      <div class="border border-dark p-2"></div>
                                    </td>
                                    <td>
                                      <code>.text-dark</code>
                                    </td>
                                    <td>
                                      <div class="text-dark">text-dark</div>
                                    </td>
                                  </tr>

                                  <tr>
                                    <th class="" scope="row">
                                                        Light
                                    </th>
                                    <td>
                                      <code>.bg-gradient</code>
                                    </td>
                                    <td>
                                      <div class="bg-light bg-gradient p-2"></div>
                                    </td>
                                    <td>
                                      <code>.bg-light</code>
                                    </td>
                                    <td>
                                      <div class="bg-light p-2"></div>
                                    </td>
                                    <td>
                                      <code>.bg-soft-light</code>
                                    </td>
                                    <td>
                                      <div class="bg-soft-light p-2"></div>
                                    </td>
                                    <td>
                                      <code>.border-light</code>
                                    </td>
                                    <td>
                                      <div class="border border-light p-2"></div>
                                    </td>
                                    <td>
                                      <code>.text-light</code>
                                    </td>
                                    <td>
                                      <div class="text-light bg-dark">text-light</div>
                                    </td>
                                  </tr>


                                  <tr>
                                    <th class="" scope="row">
                                                        Body
                                    </th>
                                    <td>
                                      <div class="text-center">-</div>
                                    </td>
                                    <td>
                                      <div class="text-center">-</div>
                                    </td>
                                    <td>
                                      <code>.bg-body</code>
                                    </td>
                                    <td>
                                      <div class="bg-body p-2"></div>
                                    </td>
                                    <td>
                                      <div class="text-center">-</div>
                                    </td>
                                    <td>
                                      <div class="text-center">-</div>
                                    </td>
                                    <td>
                                      <div class="text-center">-</div>
                                    </td>
                                    <td>
                                      <div class="text-center">-</div>
                                    </td>
                                    <td>
                                      <code>.text-body</code>
                                    </td>
                                    <td>
                                      <div class="text-body">text-body</div>
                                    </td>
                                  </tr>

                                  <tr>
                                    <th class="" scope="row">
                                                        Muted
                                    </th>
                                    <td>
                                      <div class="text-center">-</div>
                                    </td>
                                    <td>
                                      <div class="text-center">-</div>
                                    </td>
                                    <td>
                                      <div class="text-center">-</div>
                                    </td>
                                    <td>
                                      <div class="text-center">-</div>
                                    </td>
                                    <td>
                                      <div class="text-center">-</div>
                                    </td>
                                    <td>
                                      <div class="text-center">-</div>
                                    </td>
                                    <td>
                                      <div class="text-center">-</div>
                                    </td>
                                    <td>
                                      <div class="text-center">-</div>
                                    </td>
                                    <td>
                                      <code>.text-muted</code>
                                    </td>
                                    <td>
                                      <div class="text-muted">text-muted</div>
                                    </td>
                                  </tr>

                                  <tr>
                                    <th class="" scope="row">
                                                        White
                                    </th>
                                    <td>
                                      <div class="text-center">-</div>
                                    </td>
                                    <td>
                                      <div class="text-center">-</div>
                                    </td>
                                    <td>
                                      <div class="text-center">-</div>
                                    </td>
                                    <td>
                                      <div class="text-center">-</div>
                                    </td>
                                    <td>
                                      <div class="text-center">-</div>
                                    </td>
                                    <td>
                                      <div class="text-center">-</div>
                                    </td>
                                    <td>
                                      <div class="text-center">-</div>
                                    </td>
                                    <td>
                                      <div class="text-center">-</div>
                                    </td>
                                    <td>
                                      <code>.text-white</code>
                                    </td>
                                    <td>
                                      <div class="text-white bg-dark">text-white</div>
                                    </td>
                                  </tr>

                                  <tr>
                                    <th class="" scope="row">
                                                        White-50
                                    </th>
                                    <td>
                                      <div class="text-center">-</div>
                                    </td>
                                    <td>
                                      <div class="text-center">-</div>
                                    </td>
                                    <td>
                                      <div class="text-center">-</div>
                                    </td>
                                    <td>
                                      <div class="text-center">-</div>
                                    </td>
                                    <td>
                                      <div class="text-center">-</div>
                                    </td>
                                    <td>
                                      <div class="text-center">-</div>
                                    </td>
                                    <td>
                                      <div class="text-center">-</div>
                                    </td>
                                    <td>
                                      <div class="text-center">-</div>
                                    </td>
                                    <td>
                                      <code>.text-white-50</code>
                                    </td>
                                    <td>
                                      <div class="text-white-50 bg-dark">text-white-50</div>
                                    </td>
                                  </tr>

                                  <tr>
                                    <th class="" scope="row">
                                                        Black-50
                                    </th>
                                    <td>
                                      <div class="text-center">-</div>
                                    </td>
                                    <td>
                                      <div class="text-center">-</div>
                                    </td>
                                    <td>
                                      <div class="text-center">-</div>
                                    </td>
                                    <td>
                                      <div class="text-center">-</div>
                                    </td>
                                    <td>
                                      <div class="text-center">-</div>
                                    </td>
                                    <td>
                                      <div class="text-center">-</div>
                                    </td>
                                    <td>
                                      <div class="text-center">-</div>
                                    </td>
                                    <td>
                                      <div class="text-center">-</div>
                                    </td>
                                    <td>
                                      <code>.text-black-50</code>
                                    </td>
                                    <td>
                                      <div class="text-black-50">text-black-50</div>
                                    </td>
                                  </tr>

                                  <tr>
                                    <th class="" scope="row">
                                                        Opacity-10
                                    </th>
                                    <td>
                                      <div class="text-center">-</div>
                                    </td>
                                    <td>
                                      <div class="text-center">-</div>
                                    </td>
                                    <td>
                                      <div class="text-center">
                                        <code>.bg-opacity-10</code>
                                      </div>
                                    </td>
                                    <td>
                                      <div class="text-center">
                                        <div class="bg-primary bg-opacity-10 p-2"></div>
                                      </div>
                                    </td>
                                    <td>
                                      <div class="text-center">-</div>
                                    </td>
                                    <td>
                                      <div class="text-center">-</div>
                                    </td>
                                    <td>
                                      <code>.border-opacity-10</code>
                                    </td>
                                    <td>
                                      <div class="border border-primary border-opacity-10 p-2"></div>
                                    </td>
                                    <td>
                                      <div class="text-center">-</div>
                                    </td>
                                    <td>
                                      <div class="text-center">-</div>
                                    </td>
                                  </tr>

                                  <tr>
                                    <th class="" scope="row">
                                                        Opacity-25
                                    </th>
                                    <td>
                                      <div class="text-center">
                                        <code>.opacity-25</code>
                                      </div>
                                    </td>
                                    <td>
                                      <div class="text-center">
                                        <div class="bg-primary opacity-25 p-2"></div>
                                      </div>
                                    </td>
                                    <td>
                                      <div class="text-center">
                                        <code>.bg-opacity-25</code>
                                      </div>
                                    </td>
                                    <td>
                                      <div class="text-center">
                                        <div class="bg-primary bg-opacity-25 p-2"></div>
                                      </div>
                                    </td>
                                    <td>
                                      <div class="text-center">-</div>
                                    </td>
                                    <td>
                                      <div class="text-center">-</div>
                                    </td>
                                    <td>
                                      <code>.border-opacity-25</code>
                                    </td>
                                    <td>
                                      <div class="border border-primary border-opacity-25 p-2"></div>
                                    </td>
                                    <td>
                                      <code>.text-opacity-25</code>
                                    </td>
                                    <td>
                                      <div class="text-opacity-25 text-primary">text-opacity-25</div>
                                    </td>
                                  </tr>

                                  <tr>
                                    <th class="" scope="row">
                                                        Opacity-50
                                    </th>
                                    <td>
                                      <div class="text-center">
                                        <code>.opacity-50</code>
                                      </div>
                                    </td>
                                    <td>
                                      <div class="text-center">
                                        <div class="bg-primary opacity-50 p-2"></div>
                                      </div>
                                    </td>
                                    <td>
                                      <div class="text-center">
                                        <code>.bg-opacity-50</code>
                                      </div>
                                    </td>
                                    <td>
                                      <div class="text-center">
                                        <div class="bg-primary bg-opacity-50 p-2"></div>
                                      </div>
                                    </td>
                                    <td>
                                      <div class="text-center">-</div>
                                    </td>
                                    <td>
                                      <div class="text-center">-</div>
                                    </td>
                                    <td>
                                      <code>.border-opacity-50</code>
                                    </td>
                                    <td>
                                      <div class="border border-primary border-opacity-50 p-2"></div>
                                    </td>
                                    <td>
                                      <code>.text-opacity-50</code>
                                    </td>
                                    <td>
                                      <div class="text-opacity-50 text-primary">text-opacity-50</div>
                                    </td>
                                  </tr>

                                  <tr>
                                    <th class="" scope="row">
                                                        Opacity-75
                                    </th>
                                    <td>
                                      <div class="text-center">
                                        <code>.opacity-75</code>
                                      </div>
                                    </td>
                                    <td>
                                      <div class="text-center">
                                        <div class="bg-primary opacity-75 p-2"></div>
                                      </div>
                                    </td>
                                    <td>
                                      <div class="text-center">
                                        <code>.bg-opacity-75</code>
                                      </div>
                                    </td>
                                    <td>
                                      <div class="text-center">
                                        <div class="bg-primary bg-opacity-75 p-2"></div>
                                      </div>
                                    </td>
                                    <td>
                                      <div class="text-center">-</div>
                                    </td>
                                    <td>
                                      <div class="text-center">-</div>
                                    </td>
                                    <td>
                                      <code>.border-opacity-75</code>
                                    </td>
                                    <td>
                                      <div class="border border-primary border-opacity-75 p-2"></div>
                                    </td>
                                    <td>
                                      <code>.text-opacity-75</code>
                                    </td>
                                    <td>
                                      <div class="text-opacity-75 text-primary">text-opacity-75</div>
                                    </td>
                                  </tr>

                                  <tr>
                                    <th class="" scope="row">
                                                        Opacity-100
                                    </th>
                                    <td>
                                      <div class="text-center">
                                        <code>.opacity-100</code>
                                      </div>
                                    </td>
                                    <td>
                                      <div class="text-center">
                                        <div class="bg-primary opacity-100 p-2"></div>
                                      </div>
                                    </td>
                                    <td>
                                      <div class="text-center">
                                        <code>.bg-opacity-100</code>
                                      </div>
                                    </td>
                                    <td>
                                      <div class="text-center">
                                        <div class="bg-primary bg-opacity-100 p-2"></div>
                                      </div>
                                    </td>
                                    <td>
                                      <div class="text-center">-</div>
                                    </td>
                                    <td>
                                      <div class="text-center">-</div>
                                    </td>
                                    <td>
                                      <code>.border-opacity-100</code>
                                    </td>
                                    <td>
                                      <div class="border border-primary border-opacity-100 p-2"></div>
                                    </td>
                                    <td>
                                      <code>.text-opacity-100</code>
                                    </td>
                                    <td>
                                      <div class="text-opacity-100 text-primary">text-opacity-100</div>
                                    </td>
                                  </tr>

                                </tbody>
                              </table>
                            </div>
                          </div>                          <!-- end card body -->
                        </div>                        <!-- end card -->
                      </div>                      <!-- end col -->
                    </div>                    <!-- end row -->

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

        <!-- Masonry plugin -->
        <script src="{$path}/libs/masonry-layout/masonry.pkgd.min.js"></script>

        <script src="{$themePath}/assets/js/pages/card.init.js"></script>

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
