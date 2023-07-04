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
                      <div class="col-xxl-6">
                        <div class="card">
                          <div class="card-header align-items-center d-flex">
                            <h4 class="card-title mb-0 flex-grow-1">Default Badges</h4>
                            <div class="flex-shrink-0">
                              <div class="form-check form-switch form-switch-right form-switch-md">
                                <label for="default" class="form-label text-muted">Show Code</label>
                                <input class="form-check-input code-switcher" type="checkbox" id="default"/>
                              </div>
                            </div>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <p class="text-muted">Use the <code>badge</code> class to set a default badge.</p>
                            <div class="live-preview">

                              <div class="d-flex flex-wrap gap-2">
                                <span class="badge text-bg-primary">Primary</span>
                                <span class="badge text-bg-secondary">Secondary</span>
                                <span class="badge text-bg-success">Success</span>
                                <span class="badge text-bg-info">Info</span>
                                <span class="badge text-bg-warning">Warning</span>
                                <span class="badge text-bg-danger">Danger</span>
                                <span class="badge text-bg-dark">Dark</span>
                                <span class="badge text-bg-light">Light</span>
                              </div>
                            </div>

                            <div class="d-none code-view">
                              <pre class="language-markup" style="height: 200px;">
                                <code>&lt;span class=&quot;badge text-bg-primary&quot;&gt;Primary&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge text-bg-secondary&quot;&gt;Secondary&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge text-bg-success&quot;&gt;Success&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge text-bg-info&quot;&gt;Info&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge text-bg-warning&quot;&gt;Warning&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge text-bg-danger&quot;&gt;Danger&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge text-bg-dark&quot;&gt;Dark&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge text-bg-light&quot;&gt;Light&lt;/span&gt;</code>
                              </pre>
                            </div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>

                      <div class="col-xxl-6">
                        <div class="card">
                          <div class="card-header align-items-center d-flex">
                            <h4 class="card-title mb-0 flex-grow-1">Soft Badges </h4>
                            <div class="flex-shrink-0">
                              <div class="form-check form-switch form-switch-right form-switch-md">
                                <label for="soft-badges" class="form-label text-muted">Show Code</label>
                                <input class="form-check-input code-switcher" type="checkbox" id="soft-badges"/>
                              </div>
                            </div>
                          </div>                          <!-- end card header -->

                          <div class="card-body">

                            <p class="text-muted">Use the <code>badge-soft-</code> class with the
                                        below-mentioned variation to create a softer badge.
                            </p>

                            <div class="live-preview">

                              <div class="d-flex flex-wrap gap-2">
                                <span class="badge badge-soft-primary">Primary</span>
                                <span class="badge badge-soft-secondary">Secondary</span>
                                <span class="badge badge-soft-success">Success</span>
                                <span class="badge badge-soft-info">Info</span>
                                <span class="badge badge-soft-warning">Warning</span>
                                <span class="badge badge-soft-danger">Danger</span>
                                <span class="badge badge-soft-dark">Dark</span>
                                <span class="badge badge-soft-light text-dark">Light</span>
                              </div>
                            </div>

                            <div class="d-none code-view">
                              <pre class="language-markup" style="height: 200px;">
                                <code>&lt;span class=&quot;badge badge-soft-primary&quot;&gt;Primary&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge badge-soft-secondary&quot;&gt;Secondary&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge badge-soft-success&quot;&gt;Success&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge badge-soft-info&quot;&gt;Info&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge badge-soft-warning&quot;&gt;Warning&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge badge-soft-danger&quot;&gt;Danger&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge badge-soft-dark&quot;&gt;Dark&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge badge-soft-light&quot;&gt;Light&lt;/span&gt;</code>
                              </pre>
                            </div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>
                    </div>

                    <div class="row">
                      <div class="col-xxl-6">
                        <div class="card">
                          <div class="card-header align-items-center d-flex">
                            <h4 class="card-title mb-0 flex-grow-1">Outline Badges </h4>
                            <div class="flex-shrink-0">
                              <div class="form-check form-switch form-switch-right form-switch-md">
                                <label for="outline-badges" class="form-label text-muted">Show Code</label>
                                <input class="form-check-input code-switcher" type="checkbox" id="outline-badges"/>
                              </div>
                            </div>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <p class="text-muted">Use the <code>badge-outline-</code> class with the
                                        below-mentioned variation to create a badge with the outline.
                            </p>
                            <div class="live-preview">

                              <div class="d-flex flex-wrap gap-2">
                                <a href="#" class="badge badge-outline-primary">Primary</a>
                                <span class="badge badge-outline-secondary">Secondary</span>
                                <span class="badge badge-outline-success">Success</span>
                                <span class="badge badge-outline-info">Info</span>
                                <span class="badge badge-outline-warning">Warning</span>
                                <span class="badge badge-outline-danger">Danger</span>
                                <span class="badge badge-outline-dark">Dark</span>
                                <span class="badge badge-outline-light text-dark">Light</span>
                              </div>

                            </div>

                            <div class="d-none code-view">
                              <pre class="language-markup" style="height: 200px;">
                                <code>&lt;span class=&quot;badge badge-outline-primary&quot;&gt;Primary&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge badge-outline-secondary&quot;&gt;Secondary&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge badge-outline-success&quot;&gt;Success&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge badge-outline-info&quot;&gt;Info&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge badge-outline-warning&quot;&gt;Warning&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge badge-outline-danger&quot;&gt;Danger&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge badge-outline-dark&quot;&gt;Dark&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge badge-outline-light&quot;&gt;Light&lt;/span&gt;</code>
                              </pre>
                            </div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>

                      <div class="col-xxl-6">
                        <div class="card">
                          <div class="card-header align-items-center d-flex">
                            <h4 class="card-title mb-0 flex-grow-1">Rounded Pill Badges </h4>
                            <div class="flex-shrink-0">
                              <div class="form-check form-switch form-switch-right form-switch-md">
                                <label for="pill-badges" class="form-label text-muted">Show Code</label>
                                <input class="form-check-input code-switcher" type="checkbox" id="pill-badges"/>
                              </div>
                            </div>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <p class="text-muted">Use the <code>rounded-pill</code> class to make badges more rounded with a larger border-radius.</p>

                            <div class="live-preview">
                              <div class="d-flex flex-wrap gap-2">
                                <span class="badge rounded-pill text-bg-primary">Primary</span>
                                <span class="badge rounded-pill text-bg-secondary">Secondary</span>
                                <span class="badge rounded-pill text-bg-success">Success</span>
                                <span class="badge rounded-pill text-bg-info">Info</span>
                                <span class="badge rounded-pill text-bg-warning">Warning</span>
                                <span class="badge rounded-pill text-bg-danger">Danger</span>
                                <span class="badge rounded-pill text-bg-dark">Dark</span>
                                <span class="badge rounded-pill text-bg-light text-dark">Light</span>
                              </div>
                            </div>

                            <div class="d-none code-view">
                              <pre class="language-markup" style="height: 200px;">
                                <code>&lt;span class=&quot;badge rounded-pill text-bg-primary&quot;&gt;Primary&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge rounded-pill text-bg-secondary&quot;&gt;Secondary&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge rounded-pill text-bg-success&quot;&gt;Success&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge rounded-pill text-bg-info&quot;&gt;Info&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge rounded-pill text-bg-warning&quot;&gt;Warning&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge rounded-pill text-bg-danger&quot;&gt;Danger&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge rounded-pill text-bg-dark&quot;&gt;Dark&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge rounded-pill text-bg-light&quot;&gt;Light&lt;/span&gt;</code>
                              </pre>
                            </div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>
                    </div>

                    <div class="row">
                      <div class="col-xxl-6">
                        <div class="card">
                          <div class="card-header align-items-center d-flex">
                            <h4 class="card-title mb-0 flex-grow-1">Rounded Pill Badges with soft effect </h4>
                            <div class="flex-shrink-0">
                              <div class="form-check form-switch form-switch-right form-switch-md">
                                <label for="rounded-pill-badges" class="form-label text-muted">Show Code</label>
                                <input class="form-check-input code-switcher" type="checkbox" id="rounded-pill-badges"/>
                              </div>
                            </div>
                          </div>                          <!-- end card header -->

                          <div class="card-body">

                            <p class="text-muted">Use the <code>rounded-pill badge-soft-</code> class with the below-mentioned variation to create a badge more rounded with a soft background.</p>
                            <div class="live-preview">

                              <div class="d-flex flex-wrap gap-2">
                                <span class="badge rounded-pill badge-soft-primary">Primary</span>
                                <span class="badge rounded-pill badge-soft-secondary">Secondary</span>
                                <span class="badge rounded-pill badge-soft-success">Success</span>
                                <span class="badge rounded-pill badge-soft-info">Info</span>
                                <span class="badge rounded-pill badge-soft-warning">Warning</span>
                                <span class="badge rounded-pill badge-soft-danger">Danger</span>
                                <span class="badge rounded-pill badge-soft-dark">Dark</span>
                                <span class="badge rounded-pill badge-soft-light text-dark">Light</span>
                              </div>
                            </div>

                            <div class="d-none code-view">
                              <pre class="language-markup" style="height: 200px;">
                                <code>&lt;span class=&quot;badge rounded-pill badge-soft-primary&quot;&gt;Primary&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge rounded-pill badge-soft-secondary&quot;&gt;Secondary&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge rounded-pill badge-soft-success&quot;&gt;Success&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge rounded-pill badge-soft-info&quot;&gt;Info&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge rounded-pill badge-soft-warning&quot;&gt;Warning&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge rounded-pill badge-soft-danger&quot;&gt;Danger&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge rounded-pill badge-soft-dark&quot;&gt;Dark&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge rounded-pill badge-soft-light&quot;&gt;Light&lt;/span&gt;</code>
                              </pre>
                            </div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>

                      <div class="col-xxl-6">
                        <div class="card">
                          <div class="card-header align-items-center d-flex">
                            <h4 class="card-title mb-0 flex-grow-1">Soft Border Badges</h4>
                            <div class="flex-shrink-0">
                              <div class="form-check form-switch form-switch-right form-switch-md">
                                <label for="badges-soft-border" class="form-label text-muted">Show Code</label>
                                <input class="form-check-input code-switcher" type="checkbox" id="badges-soft-border"/>
                              </div>
                            </div>
                          </div>                          <!-- end card header -->

                          <div class="card-body">

                            <p class="text-muted">
                                        Use the <code>badge-border</code> and <code>badge-soft-</code> with below
                                        mentioned modifier classes to make badges with border &amp; soft backgorund.
                            </p>
                            <div class="live-preview">

                              <div class="d-flex flex-wrap gap-2">
                                <span class="badge badge-soft-primary badge-border">Primary</span>
                                <span class="badge badge-soft-secondary badge-border">Secondary</span>
                                <span class="badge badge-soft-success badge-border">Success</span>
                                <span class="badge badge-soft-danger badge-border">Danger</span>
                                <span class="badge badge-soft-warning badge-border">Warning</span>
                                <span class="badge badge-soft-info badge-border">Info</span>
                                <span class="badge badge-soft-dark badge-border">Dark</span>
                                <span class="badge badge-soft-light badge-border text-dark">Light</span>
                              </div>
                            </div>

                            <div class="d-none code-view">
                              <pre class="language-markup" style="height: 200px;">
                                <code>&lt;span class=&quot;badge badge-soft-primary badge-border&quot;&gt;Primary&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge badge-soft-secondary badge-border&quot;&gt;Secondary&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge badge-soft-success badge-border&quot;&gt;Success&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge badge-soft-info badge-border&quot;&gt;Info&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge badge-soft-warning badge-border&quot;&gt;Warning&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge badge-soft-danger badge-border&quot;&gt;Danger&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge badge-soft-dark badge-border&quot;&gt;Dark&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge badge-soft-light badge-border&quot;&gt;Light&lt;/span&gt;</code>
                              </pre>
                            </div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>


                    </div>

                    <div class="row">
                      <div class="col-xxl-6">
                        <div class="card">
                          <div class="card-header align-items-center d-flex">
                            <h4 class="card-title mb-0 flex-grow-1">Outline Pill Badges </h4>
                            <div class="flex-shrink-0">
                              <div class="form-check form-switch form-switch-right form-switch-md">
                                <label for="outline-pill-badges" class="form-label text-muted">Show Code</label>
                                <input class="form-check-input code-switcher" type="checkbox" id="outline-pill-badges"/>
                              </div>
                            </div>
                          </div>                          <!-- end card header -->

                          <div class="card-body">

                            <p class="text-muted">
                                        Use the <code>rounded-pill badge-outline-</code> class with the below-mentioned
                                        variation to create a outline Pill badge.
                            </p>

                            <div class="live-preview">

                              <div class="d-flex flex-wrap gap-2">
                                <span class="badge rounded-pill badge-outline-primary">Primary</span>
                                <span class="badge rounded-pill badge-outline-secondary">Secondary</span>
                                <span class="badge rounded-pill badge-outline-success">Success</span>
                                <span class="badge rounded-pill badge-outline-info">Info</span>
                                <span class="badge rounded-pill badge-outline-warning">Warning</span>
                                <span class="badge rounded-pill badge-outline-danger">Danger</span>
                                <span class="badge rounded-pill badge-outline-dark">Dark</span>
                                <span class="badge rounded-pill badge-outline-light text-dark">Light</span>
                              </div>



                            </div>

                            <div class="d-none code-view">
                              <pre class="language-markup" style="height: 200px;">
                                <code>&lt;span class=&quot;badge rounded-pill badge-outline-primary&quot;&gt;Primary&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge rounded-pill badge-outline-secondary&quot;&gt;Secondary&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge rounded-pill badge-outline-success&quot;&gt;Success&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge rounded-pill badge-outline-info&quot;&gt;Info&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge rounded-pill badge-outline-warning&quot;&gt;Warning&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge rounded-pill badge-outline-danger&quot;&gt;Danger&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge rounded-pill badge-outline-dark&quot;&gt;Dark&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge rounded-pill badge-outline-light&quot;&gt;Light&lt;/span&gt;</code>
                              </pre>
                            </div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>

                      <div class="col-xxl-6">
                        <div class="card">
                          <div class="card-header align-items-center d-flex">
                            <h4 class="card-title mb-0 flex-grow-1">Label Badges </h4>
                            <div class="flex-shrink-0">
                              <div class="form-check form-switch form-switch-right form-switch-md">
                                <label for="badges-label" class="form-label text-muted">Show Code</label>
                                <input class="form-check-input code-switcher" type="checkbox" id="badges-label"/>
                              </div>
                            </div>
                          </div>                          <!-- end card header -->

                          <div class="card-body">

                            <p class="text-muted">
                                        Use the <code>badge-label</code> class to create a badge with the label.
                            </p>

                            <div class="live-preview">
                              <div class="d-flex flex-wrap gap-2">
                                <span class="badge badge-label bg-primary">
                                  <i class="mdi mdi-circle-medium"></i> Primary</span>
                                <span class="badge badge-label bg-secondary">
                                  <i class="mdi mdi-circle-medium"></i> Secondary</span>
                                <span class="badge badge-label bg-success">
                                  <i class="mdi mdi-circle-medium"></i> Success</span>
                                <span class="badge badge-label bg-danger">
                                  <i class="mdi mdi-circle-medium"></i> Danger</span>
                                <span class="badge badge-label bg-warning">
                                  <i class="mdi mdi-circle-medium"></i> Warning</span>
                                <span class="badge badge-label bg-info">
                                  <i class="mdi mdi-circle-medium"></i> Info</span>

                                <span class="badge badge-label bg-dark">
                                  <i class="mdi mdi-circle-medium"></i> Dark</span>

                                <span class="badge badge-label bg-light text-dark">
                                  <i class="mdi mdi-circle-medium"></i> Light</span>
                              </div>
                            </div>

                            <div class="d-none code-view">
                              <pre class="language-markup" style="height: 200px;">
                                <code>&lt;span class=&quot;badge badge-label bg-primary&quot;&gt;&lt;i class=&quot;mdi mdi-circle-medium&quot;&gt;&lt;/i&gt; Primary&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge badge-label bg-secondary&quot;&gt;&lt;i class=&quot;mdi mdi-circle-medium&quot;&gt;&lt;/i&gt; Secondary&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge badge-label bg-success&quot;&gt;&lt;i class=&quot;mdi mdi-circle-medium&quot;&gt;&lt;/i&gt; Success&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge badge-label bg-danger&quot;&gt;&lt;i class=&quot;mdi mdi-circle-medium&quot;&gt;&lt;/i&gt; Danger&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge badge-label bg-warning&quot;&gt;&lt;i class=&quot;mdi mdi-circle-medium&quot;&gt;&lt;/i&gt; Warning&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge badge-label bg-info&quot;&gt;&lt;i class=&quot;mdi mdi-circle-medium&quot;&gt;&lt;/i&gt; Info&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge badge-label bg-dark&quot;&gt;&lt;i class=&quot;mdi mdi-circle-medium&quot;&gt;&lt;/i&gt; Dark&lt;/span&gt;</code>\

                                <code>&lt;span class=&quot;badge badge-label bg-light&quot;&gt;&lt;i class=&quot;mdi mdi-circle-medium&quot;&gt;&lt;/i&gt; Light&lt;/span&gt;</code>
                              </pre>
                            </div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>
                    </div>

                    <div class="row">
                      <div class="col-xxl-12">
                        <div class="card">
                          <div class="card-header align-items-center d-flex">
                            <h4 class="card-title mb-0 flex-grow-1">Gradient Badges</h4>
                            <div class="flex-shrink-0">
                              <div class="form-check form-switch form-switch-right form-switch-md">
                                <label for="badges-gradient" class="form-label text-muted">Show Code</label>
                                <input class="form-check-input code-switcher" type="checkbox" id="badges-gradient"/>
                              </div>
                            </div>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <p class="text-muted">
                                        Use the <code>badge-gradient-*</code> class to create a gradient styled badge.
                            </p>
                            <div class="live-preview">
                              <div class="d-flex flex-wrap gap-2">
                                <span class="badge badge-gradient-primary">Primary</span>
                                <span class="badge badge-gradient-secondary">Secondary</span>
                                <span class="badge badge-gradient-success">Success</span>
                                <span class="badge badge-gradient-danger">Danger</span>
                                <span class="badge badge-gradient-warning">Warning</span>
                                <span class="badge badge-gradient-info">Info</span>
                                <span class="badge badge-gradient-dark">Dark</span>
                              </div>
                            </div>

                            <div class="d-none code-view">
                              <pre class="language-markup" style="height: 200px;">
                                <code>&lt;span class=&quot;badge badge-gradient-primary&quot;&gt;Primary&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge badge-gradient-secondary&quot;&gt;Secondary&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge badge-gradient-success&quot;&gt;Success&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge badge-gradient-danger&quot;&gt;Danger&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge badge-gradient-warning&quot;&gt;Warning&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge badge-gradient-info&quot;&gt;Info&lt;/span&gt;</code>

                                <code>&lt;span class=&quot;badge badge-gradient-dark&quot;&gt;Dark&lt;/span&gt;</code>
                              </pre>
                            </div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>
                      <!--end col-->
                    </div>
                    <!--end row-->

                    <div class="row">
                      <div class="col-xxl-6">
                        <div class="card">
                          <div class="card-header align-items-center d-flex">
                            <h4 class="card-title mb-0 flex-grow-1">Button Position Badges</h4>
                            <div class="flex-shrink-0">
                              <div class="form-check form-switch form-switch-right form-switch-md">
                                <label for="button-position-badges" class="form-label text-muted">Show Code</label>
                                <input class="form-check-input code-switcher" type="checkbox" id="button-position-badges"/>
                              </div>
                            </div>
                          </div>                          <!-- end card header -->

                          <div class="card-body">

                            <p class="text-muted">Use the below utilities to modify a badge and position it in
                                        the corner of a link or button.</p>

                            <div class="live-preview">
                              <div class="d-flex flex-wrap gap-3">
                                <button type="button" class="btn btn-primary position-relative">
                                                Mails <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-success">+99
                                  <span class="visually-hidden">unread messages</span>
                                </span>
                              </button>

                              <button type="button" class="btn btn-light position-relative">
                                                Alerts <span class="position-absolute top-0 start-100 translate-middle badge border border-light rounded-circle bg-danger p-1">
                                <span class="visually-hidden">unread messages</span>
                              </span>
                            </button>

                            <button type="button" class="btn btn-primary position-relative p-0 avatar-xs rounded">
                              <span class="avatar-title bg-transparent">
                                <i class="bx bxs-envelope"></i>
                              </span>
                              <span class="position-absolute top-0 start-100 translate-middle badge border border-light rounded-circle bg-danger p-1">
                                <span class="visually-hidden">unread messages</span>
                              </span>
                            </button>

                            <button type="button" class="btn btn-light position-relative p-0 avatar-xs rounded-circle">
                              <span class="avatar-title bg-transparent text-reset">
                                <i class="bx bxs-bell"></i>
                              </span>
                            </button>

                            <button type="button" class="btn btn-light position-relative p-0 avatar-xs rounded-circle">
                              <span class="avatar-title bg-transparent text-reset">
                                <i class="bx bx-menu"></i>
                              </span>
                              <span class="position-absolute top-0 start-100 translate-middle badge border border-light rounded-circle bg-success p-1">
                                <span class="visually-hidden">unread messages</span>
                              </span>
                            </button>
                          </div>
                        </div>

                        <div class="d-none code-view">
                          <pre class="language-markup" style="height: 200px;">
                            <code>&lt;button type=&quot;button&quot; class=&quot;btn btn-primary position-relative&quot;&gt;
    Mails &lt;span class=&quot;position-absolute top-0 start-100 translate-middle badge rounded-pill bg-success&quot;&gt;+99 &lt;span class=&quot;visually-hidden&quot;&gt;unread messages&lt;/span&gt;&lt;/span&gt;
&lt;/button&gt;</code>

                            <code>&lt;button type=&quot;button&quot; class=&quot;btn btn-light position-relative&quot;&gt;
    Alerts &lt;span class=&quot;position-absolute top-0 start-100 translate-middle badge border border-light rounded-circle bg-danger p-1&quot;&gt;&lt;span class=&quot;visually-hidden&quot;&gt;unread messages&lt;/span&gt;&lt;/span&gt;
&lt;/button&gt;</code>

                            <code>&lt;button type=&quot;button&quot; class=&quot;btn btn-primary position-relative p-0 avatar-xs rounded&quot;&gt;
    &lt;span class=&quot;avatar-title bg-transparent&quot;&gt;
        &lt;i class=&quot;bx bxs-envelope&quot;&gt;&lt;/i&gt;
    &lt;/span&gt;
    &lt;span class=&quot;position-absolute top-0 start-100 translate-middle badge border border-light rounded-circle bg-danger p-1&quot;&gt;&lt;span class=&quot;visually-hidden&quot;&gt;unread messages&lt;/span&gt;&lt;/span&gt;
&lt;/button&gt;</code>

                            <code>&lt;button type=&quot;button&quot; class=&quot;btn btn-light position-relative p-0 avatar-xs rounded-circle&quot;&gt;
    &lt;span class=&quot;avatar-title bg-transparent text-reset&quot;&gt;
        &lt;i class=&quot;bx bxs-bell&quot;&gt;&lt;/i&gt;
    &lt;/span&gt;
&lt;/button&gt;</code>

                            <code>&lt;button type=&quot;button&quot; class=&quot;btn btn-light position-relative p-0 avatar-xs rounded-circle&quot;&gt;
    &lt;span class=&quot;avatar-title bg-transparent text-reset&quot;&gt;
        &lt;i class=&quot;bx bx-menu&quot;&gt;&lt;/i&gt;
    &lt;/span&gt;
    &lt;span class=&quot;position-absolute top-0 start-100 translate-middle badge border border-light rounded-circle bg-success p-1&quot;&gt;&lt;span class=&quot;visually-hidden&quot;&gt;unread messages&lt;/span&gt;&lt;/span&gt;
&lt;/button&gt;</code>
                          </pre>
                        </div>
                      </div>                      <!-- end card-body -->
                    </div>                    <!-- end card -->

                    <div class="card">
                      <div class="card-header align-items-center d-flex">
                        <h4 class="card-title mb-0 flex-grow-1">Badges With Button</h4>
                        <div class="flex-shrink-0">
                          <div class="form-check form-switch form-switch-right form-switch-md">
                            <label for="button-badge" class="form-label text-muted">Show Code</label>
                            <input class="form-check-input code-switcher" type="checkbox" id="button-badge"/>
                          </div>
                        </div>
                      </div>                      <!-- end card header -->

                      <div class="card-body">

                        <p class="text-muted">Badges can be used as part of buttons to provide a counter.</p>

                        <div class="live-preview">

                          <div class="d-flex flex-wrap gap-2">
                            <button type="button" class="btn btn-primary">
                                                Notifications <span class="badge bg-success ms-1">4</span>
                            </button>
                            <button type="button" class="btn btn-success">
                                                Messages <span class="badge bg-danger ms-1">2</span>
                            </button>
                            <button type="button" class="btn btn-outline-secondary">
                                                Draft <span class="badge bg-success ms-1">2</span>
                            </button>
                          </div>



                        </div>

                        <div class="d-none code-view">
                          <pre class="language-markup">
                            <code>&lt;button type=&quot;button&quot; class=&quot;btn btn-primary&quot;&gt;
    Notifications &lt;span class=&quot;badge bg-success ms-1&quot;&gt;4&lt;/span&gt;
&lt;/button&gt;</code>

                            <code>&lt;button type=&quot;button&quot; class=&quot;btn btn-success&quot;&gt;
    Messages &lt;span class=&quot;badge bg-danger ms-1&quot;&gt;2&lt;/span&gt;
&lt;/button&gt;</code>

                            <code>&lt;button type=&quot;button&quot; class=&quot;btn btn-outline-secondary&quot;&gt;
    Draft &lt;span class=&quot;badge bg-success ms-1&quot;&gt;2&lt;/span&gt;
&lt;/button&gt;
                            </code>
                          </pre>
                        </div>
                      </div>                      <!-- end card-body -->
                    </div>                    <!-- end card -->
                  </div>

                  <div class="col-xxl-6">
                    <div class="card">
                      <div class="card-header align-items-center d-flex">
                        <h4 class="card-title mb-0 flex-grow-1">Badges with Heading</h4>
                        <div class="flex-shrink-0">
                          <div class="form-check form-switch form-switch-right form-switch-md">
                            <label for="heading-badges" class="form-label text-muted">Show Code</label>
                            <input class="form-check-input code-switcher" type="checkbox" id="heading-badges"/>
                          </div>
                        </div>
                      </div>                      <!-- end card header -->

                      <div class="card-body">
                        <p class="text-muted">Example of the badge used in the HTML Heading.</p>

                        <div class="live-preview">

                          <h1>Example heading <span class="badge text-bg-secondary">New</span>
                          </h1>
                          <h2>Example heading <span class="badge text-bg-secondary">New</span>
                          </h2>
                          <h3>Example heading <span class="badge text-bg-secondary">New</span>
                          </h3>
                          <h4>Example heading <span class="badge text-bg-secondary">New</span>
                          </h4>
                          <h5>Example heading <span class="badge text-bg-secondary">New</span>
                          </h5>
                          <h6 class="mb-0">Example heading <span class="badge text-bg-secondary">New</span>
                          </h6>

                        </div>

                        <div class="d-none code-view">
                          <pre class="language-markup">
                            <code>&lt;h1&gt;Example heading &lt;span class=&quot;badge text-bg-secondary&quot;&gt;New&lt;/span&gt;&lt;/h1&gt;</code>

                            <code>&lt;h2&gt;Example heading &lt;span class=&quot;badge text-bg-secondary&quot;&gt;New&lt;/span&gt;&lt;/h2&gt;</code>

                            <code>&lt;h3&gt;Example heading &lt;span class=&quot;badge text-bg-secondary&quot;&gt;New&lt;/span&gt;&lt;/h3&gt;</code>

                            <code>&lt;h4&gt;Example heading &lt;span class=&quot;badge text-bg-secondary&quot;&gt;New&lt;/span&gt;&lt;/h4&gt;</code>

                            <code>&lt;h5&gt;Example heading &lt;span class=&quot;badge text-bg-secondary&quot;&gt;New&lt;/span&gt;&lt;/h5&gt;</code>

                            <code>&lt;h6&gt;Example heading &lt;span class=&quot;badge text-bg-secondary&quot;&gt;New&lt;/span&gt;&lt;/h6&gt;</code>
                          </pre>
                        </div>
                      </div>                      <!-- end card-body -->
                    </div>                    <!-- end card -->
                  </div>
                </div>

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
