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
                      <div class="col-lg-6">
                        <div class="card">
                          <div class="card-header">
                            <h4 class="card-title mb-0">Nested Sortables List</h4>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <p class="text-muted">Use <code>nested-list nested-sortable</code> class to list-group class to set a nested list with sortable items.</p>

                            <div class="list-group col nested-list nested-sortable">
                              <div class="list-group-item nested-1">Item 1.1</div>
                              <div class="list-group-item nested-1">Item 1.2
                                <div class="list-group nested-list nested-sortable">
                                  <div class="list-group-item nested-2">Item 2.1</div>
                                  <div class="list-group-item nested-2">Item 2.2
                                    <div class="list-group nested-list nested-sortable">
                                      <div class="list-group-item nested-3">Item 3.1</div>
                                      <div class="list-group-item nested-3">Item 3.2</div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                              <div class="list-group-item nested-1">Item 1.3
                                <div class="list-group nested-list nested-sortable">
                                  <div class="list-group-item nested-2">Item 2.1</div>
                                  <div class="list-group-item nested-2">Item 2.2</div>
                                </div>
                              </div>
                            </div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>
                      <!-- end col -->

                      <div class="col-lg-6">
                        <div class="card">
                          <div class="card-header">
                            <h4 class="card-title mb-0">Nested Sortables List with Handle</h4>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <p class="text-muted">Use <code>nested-list nested-sortable-handle</code> class to list-group class to set a nested list with sortable items.</p>

                            <div class="list-group col nested-list nested-sortable-handle">
                              <div class="list-group-item nested-1">
                                <i class="ri-drag-move-fill align-bottom handle"></i>Item 1.1
                                <div class="list-group nested-list nested-sortable-handle">
                                  <div class="list-group-item nested-2">
                                    <i class="ri-drag-move-fill align-bottom handle"></i>Item 2.1</div>
                                  <div class="list-group-item nested-2">
                                    <i class="ri-drag-move-fill align-bottom handle"></i>Item 2.2
                                    <div class="list-group nested-list nested-sortable-handle">
                                      <div class="list-group-item nested-3">
                                        <i class="ri-drag-move-fill align-bottom handle"></i>Item 3.1</div>
                                      <div class="list-group-item nested-3">
                                        <i class="ri-drag-move-fill align-bottom handle"></i>Item 3.2</div>
                                      <div class="list-group-item nested-3">
                                        <i class="ri-drag-move-fill align-bottom handle"></i>Item 3.3</div>
                                      <div class="list-group-item nested-3">
                                        <i class="ri-drag-move-fill align-bottom handle"></i>Item 3.4</div>
                                    </div>
                                  </div>
                                  <div class="list-group-item nested-2">
                                    <i class="ri-drag-move-fill align-bottom handle"></i>Item 2.3</div>
                                  <div class="list-group-item nested-2">
                                    <i class="ri-drag-move-fill align-bottom handle"></i>Item 2.4</div>
                                </div>
                              </div>
                            </div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>
                      <!-- end col -->
                    </div>
                    <!-- end row -->

                    <div class="row">
                      <div class="col-lg-6">
                        <div class="card">
                          <div class="card-header">
                            <h4 class="card-title mb-0">Folder Structure Nested List</h4>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <p class="text-muted">Use <code>nested-list nested-sortable</code> class to list-group class to set a nested list with sortable items where icons are given within list-group-item.</p>

                            <div class="list-group col nested-list nested-sortable">
                              <div class="list-group-item nested-1">
                                <i class="mdi mdi-folder fs-16 align-middle text-warning me-2"></i> assets
                                <div class="list-group nested-list nested-sortable">
                                  <div class="list-group-item nested-2">
                                    <i class="mdi mdi-folder fs-16 align-middle text-warning me-2"></i> css
                                    <div class="list-group nested-list nested-sortable">
                                      <div class="list-group-item nested-3">
                                        <i class="mdi mdi-language-css3 fs-16 align-middle text-secondary me-2"></i> style.css</div>
                                      <div class="list-group-item nested-3">
                                        <i class="mdi mdi-language-css3 fs-16 align-middle text-secondary me-2"></i> style.min.css</div>
                                    </div>
                                  </div>
                                  <div class="list-group-item nested-2">
                                    <i class="mdi mdi-folder fs-16 align-middle text-warning me-2"></i> Images
                                    <div class="list-group nested-list nested-sortable">
                                      <div class="list-group-item nested-3">
                                        <i class="mdi mdi-image fs-16 align-middle text-info me-2"></i> logo.png</div>
                                    </div>
                                  </div>
                                  <div class="list-group-item nested-2">
                                    <i class="mdi mdi-folder fs-16 align-middle text-warning me-2"></i> js
                                    <div class="list-group nested-list nested-sortable">
                                      <div class="list-group-item nested-3">
                                        <i class="mdi mdi-language-javascript fs-16 align-middle text-warning me-2"></i> app.js</div>
                                    </div>
                                  </div>
                                  <div class="list-group-item nested-2">
                                    <i class="mdi mdi-language-html5 fs-16 align-middle text-danger me-2"></i> index.html</div>
                                </div>
                              </div>
                            </div>

                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>
                      <!-- end col -->

                      <div class="col-lg-6">
                        <div class="card">
                          <div class="card-header">
                            <h4 class="card-title mb-0">Navigation Nested List</h4>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <p class="text-muted">Use <code>nested-list nested-sortable</code> class to list-group class to set a nested list with sortable items where the list is shown with navigation.</p>

                            <div class="list-group nested-list nested-sortable">
                              <div class="list-group-item nested-1">
                                <i class="ri-dashboard-2-line fs-16 align-middle text-primary me-2"></i> Dashboards
                                <div class="list-group nested-list nested-sortable">
                                  <div class="list-group-item nested-2">Analytics</div>
                                  <div class="list-group-item nested-2">CRM</div>
                                </div>
                              </div>
                              <div class="list-group-item nested-1">
                                <i class="ri-apps-2-line fs-16 align-middle text-primary me-2"></i> Apps
                                <div class="list-group nested-list nested-sortable">
                                  <div class="list-group-item nested-2">Calendar</div>
                                  <div class="list-group-item nested-2">Chat</div>
                                  <div class="list-group-item nested-2">Email</div>
                                </div>
                              </div>
                              <div class="list-group-item nested-1">
                                <i class="ri-account-circle-line fs-16 align-middle text-primary me-2"></i> Authentication
                                <div class="list-group nested-list nested-sortable">
                                  <div class="list-group-item nested-2">Sign In</div>
                                  <div class="list-group-item nested-2">Sign Up</div>
                                </div>
                              </div>
                            </div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>
                      <!-- end col -->
                    </div>
                    <!-- end row -->
                    <div class="row">
                      <div class="col-lg-6">
                        <div class="card">
                          <div class="card-header">
                            <h4 class="card-title mb-0">Team Nested List</h4>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <p class="text-muted">Use <code>nested-list nested-sortable</code> class to list-group class to set a nested list with sortable items where images are attached within a list-group-item div element.</p>
                            <div class="list-group nested-list nested-sortable">
                              <div class="list-group-item nested-1">
                                <div class="d-flex align-items-center">
                                  <div class="avatar-xs flex-shrink-0 me-3">
                                    <img src="{$themePath}/assets/images/users/avatar-1.jpg" alt="" class="img-fluid rounded-circle"></img>
                                  </div>
                                  <div class="flex-grow-1">
                                    <h5 class="fs-14 mb-0">Daryl Wolcott</h5>
                                    <p class="text-muted mb-0">CEO</p>
                                  </div>
                                </div>
                                <div class="list-group nested-list nested-sortable">
                                  <div class="list-group-item nested-2">
                                    <div class="d-flex align-items-center">
                                      <div class="avatar-xs flex-shrink-0 me-3">
                                        <img src="{$themePath}/assets/images/users/avatar-2.jpg" alt="" class="img-fluid rounded-circle"></img>
                                      </div>
                                      <div class="flex-grow-1">
                                        <h5 class="fs-14 mb-0">Jacob Stanfield</h5>
                                        <p class="text-muted mb-0">Project Manager</p>
                                      </div>
                                    </div>

                                    <div class="list-group nested-list nested-sortable">
                                      <div class="list-group-item nested-3">
                                        <div class="d-flex align-items-center">
                                          <div class="avatar-xs flex-shrink-0 me-3">
                                            <img src="{$themePath}/assets/images/users/avatar-3.jpg" alt="" class="img-fluid rounded-circle"></img>
                                          </div>
                                          <div class="flex-grow-1">
                                            <h5 class="fs-14 mb-0">David Houser</h5>
                                            <p class="text-muted mb-0">Lead Designer</p>
                                          </div>
                                        </div>
                                        <div class="list-group nested-list nested-sortable">
                                          <div class="list-group-item nested-4">
                                            <div class="d-flex align-items-center">
                                              <div class="avatar-xs flex-shrink-0 me-3">
                                                <div class="avatar-title rounded-circle">
                                                  <i class="ri-user-2-fill"></i>
                                                </div>
                                              </div>
                                              <div class="flex-grow-1">
                                                <h5 class="fs-14 mb-0">Jame Baker</h5>
                                                <p class="text-muted mb-0">UI/UX Designer</p>
                                              </div>
                                            </div>
                                          </div>
                                        </div>
                                      </div>
                                    </div>

                                    <div class="list-group nested-list nested-sortable">
                                      <div class="list-group-item nested-3">
                                        <div class="d-flex align-items-center">
                                          <div class="avatar-xs flex-shrink-0 me-3">
                                            <img src="{$themePath}/assets/images/users/avatar-4.jpg" alt="" class="img-fluid rounded-circle"></img>
                                          </div>
                                          <div class="flex-grow-1">
                                            <h5 class="fs-14 mb-0">Mickie Reyes</h5>
                                            <p class="text-muted mb-0">Frontend Developer</p>
                                          </div>
                                        </div>
                                        <div class="list-group nested-list nested-sortable">
                                          <div class="list-group-item nested-4">
                                            <div class="d-flex align-items-center">
                                              <div class="avatar-xs flex-shrink-0 me-3">
                                                <div class="avatar-title rounded-circle">
                                                  <i class="ri-user-2-fill"></i>
                                                </div>
                                              </div>
                                              <div class="flex-grow-1">
                                                <h5 class="fs-14 mb-0">Thomas Perez</h5>
                                                <p class="text-muted mb-0">Developer</p>
                                              </div>
                                            </div>
                                          </div>
                                          <div class="list-group-item nested-4">
                                            <div class="d-flex align-items-center">
                                              <div class="avatar-xs flex-shrink-0 me-3">
                                                <div class="avatar-title rounded-circle">
                                                  <img src="{$themePath}/assets/images/users/avatar-5.jpg" alt="" class="img-fluid rounded-circle"></img>
                                                </div>
                                              </div>
                                              <div class="flex-grow-1">
                                                <h5 class="fs-14 mb-0">Kim Wilson</h5>
                                                <p class="text-muted mb-0">Developer</p>
                                              </div>
                                            </div>
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                    <div class="list-group nested-list nested-sortable">
                                      <div class="list-group-item nested-3">
                                        <div class="d-flex align-items-center">
                                          <div class="avatar-xs flex-shrink-0 me-3">
                                            <img src="{$themePath}/assets/images/users/avatar-6.jpg" alt="" class="img-fluid rounded-circle"></img>
                                          </div>
                                          <div class="flex-grow-1">
                                            <h5 class="fs-14 mb-0">Galen Coble</h5>
                                            <p class="text-muted mb-0">Backend Developer</p>
                                          </div>
                                        </div>
                                        <div class="list-group nested-list nested-sortable">
                                          <div class="list-group-item nested-4">
                                            <div class="d-flex align-items-center">
                                              <div class="avatar-xs flex-shrink-0 me-3">
                                                <img src="{$themePath}/assets/images/users/avatar-7.jpg" alt="" class="img-fluid rounded-circle"></img>
                                              </div>
                                              <div class="flex-grow-1">
                                                <h5 class="fs-14 mb-0">Jean Wood</h5>
                                                <p class="text-muted mb-0">Developer</p>
                                              </div>
                                            </div>
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <!-- end nested list -->
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

        <!-- sortablejs -->
        <script src="{$path}/libs/sortablejs/Sortable.min.js"></script>

        <!-- nestable init js -->
        <script src="{$themePath}/assets/js/pages/nestable.init.js"></script>

        <!-- prismjs plugin -->
        <script src="{$path}/libs/prismjs/prism.js"></script>


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
