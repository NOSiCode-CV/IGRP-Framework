
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
                          <div class="card-header align-items-center d-flex">
                            <h4 class="card-title mb-0 flex-grow-1">Default Table</h4>
                            <div class="flex-shrink-0">
                              <div class="form-check form-switch form-switch-right form-switch-md">
                                <label for="default-showcode" class="form-label text-muted">Show Code</label>
                                <input class="form-check-input code-switcher" type="checkbox" id="default-showcode"/>
                              </div>
                            </div>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <p class="text-muted">Use <code>table</code> class to show bootstrap-based default table.</p>
                            <div class="live-preview">
                              <div class="table-responsive">
                                <table class="table align-middle table-nowrap mb-0">
                                  <thead>
                                    <tr>
                                      <th scope="col">ID</th>
                                      <th scope="col">Customer</th>
                                      <th scope="col">Date</th>
                                      <th scope="col">Invoice</th>
                                      <th scope="col">Action</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <tr>
                                      <th scope="row">
                                        <a href="#" class="fw-medium">#VZ2110</a>
                                      </th>
                                      <td>Bobby Davis</td>
                                      <td>October 15, 2021</td>
                                      <td>$2,300</td>
                                      <td>
                                        <a href="javascript:void(0);" class="link-success">View More <i class="ri-arrow-right-line align-middle"></i>
                                        </a>
                                      </td>
                                    </tr>
                                    <tr>
                                      <th scope="row">
                                        <a href="#" class="fw-medium">#VZ2109</a>
                                      </th>
                                      <td>Christopher Neal</td>
                                      <td>October 7, 2021</td>
                                      <td>$5,500</td>
                                      <td>
                                        <a href="javascript:void(0);" class="link-success">View More <i class="ri-arrow-right-line align-middle"></i>
                                        </a>
                                      </td>
                                    </tr>
                                    <tr>
                                      <th scope="row">
                                        <a href="#" class="fw-medium">#VZ2108</a>
                                      </th>
                                      <td>Monkey Karry</td>
                                      <td>October 5, 2021</td>
                                      <td>$2,420</td>
                                      <td>
                                        <a href="javascript:void(0);" class="link-success">View More <i class="ri-arrow-right-line align-middle"></i>
                                        </a>
                                      </td>
                                    </tr>
                                    <tr>
                                      <th scope="row">
                                        <a href="#" class="fw-medium">#VZ2107</a>
                                      </th>
                                      <td>James White</td>
                                      <td>October 2, 2021</td>
                                      <td>$7,452</td>
                                      <td>
                                        <a href="javascript:void(0);" class="link-success">View More <i class="ri-arrow-right-line align-middle"></i>
                                        </a>
                                      </td>
                                    </tr>
                                  </tbody>
                                </table>
                              </div>
                            </div>

                            <div class="d-none code-view">
                              <pre class="language-markup" style="height: 275px;">
                                <code>&lt;table class=&quot;table table-nowrap&quot;&gt;
    &lt;thead&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;col&quot;&gt;ID&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Customer&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Date&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Invoice&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Action&lt;/th&gt;
        &lt;/tr&gt;
    &lt;/thead&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;&lt;a href=&quot;#&quot; class=&quot;fw-semibold&quot;&gt;#VZ2110&lt;/a&gt;&lt;/th&gt;
            &lt;td&gt;Bobby Davis&lt;/td&gt;
            &lt;td&gt;October 15, 2021&lt;/td&gt;
            &lt;td&gt;$2,300&lt;/td&gt;
            &lt;td&gt;&lt;a href=&quot;javascript:void(0);&quot; class=&quot;link-success&quot;&gt;View More &lt;i class=&quot;ri-arrow-right-line align-middle&quot;&gt;&lt;/i&gt;&lt;/a&gt;&lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;&lt;a href=&quot;#&quot; class=&quot;fw-semibold&quot;&gt;#VZ2109&lt;/a&gt;&lt;/th&gt;
            &lt;td&gt;Christopher Neal&lt;/td&gt;
            &lt;td&gt;October 7, 2021&lt;/td&gt;
            &lt;td&gt;$5,500&lt;/td&gt;
            &lt;td&gt;&lt;a href=&quot;javascript:void(0);&quot; class=&quot;link-success&quot;&gt;View More &lt;i class=&quot;ri-arrow-right-line align-middle&quot;&gt;&lt;/i&gt;&lt;/a&gt;&lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;&lt;a href=&quot;#&quot; class=&quot;fw-semibold&quot;&gt;#VZ2108&lt;/a&gt;&lt;/th&gt;
            &lt;td&gt;Monkey Karry&lt;/td&gt;
            &lt;td&gt;October 5, 2021&lt;/td&gt;
            &lt;td&gt;$2,420&lt;/td&gt;
            &lt;td&gt;&lt;a href=&quot;javascript:void(0);&quot; class=&quot;link-success&quot;&gt;View More &lt;i class=&quot;ri-arrow-right-line align-middle&quot;&gt;&lt;/i&gt;&lt;/a&gt;&lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;&lt;a href=&quot;#&quot; class=&quot;fw-semibold&quot;&gt;#VZ2107&lt;/a&gt;&lt;/th&gt;
            &lt;td&gt;James White&lt;/td&gt;
            &lt;td&gt;October 2, 2021&lt;/td&gt;
            &lt;td&gt;$7,452&lt;/td&gt;
            &lt;td&gt;&lt;a href=&quot;javascript:void(0);&quot; class=&quot;link-success&quot;&gt;View More &lt;i class=&quot;ri-arrow-right-line align-middle&quot;&gt;&lt;/i&gt;&lt;/a&gt;&lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;</code>
                              </pre>
                            </div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>
                      <!-- end col -->

                      <div class="col-xl-6">
                        <div class="card">
                          <div class="card-header align-items-center d-flex">
                            <h4 class="card-title mb-0 flex-grow-1">Striped Rows</h4>
                            <div class="flex-shrink-0">
                              <div class="form-check form-switch form-switch-right form-switch-md">
                                <label for="striped-rows-showcode" class="form-label text-muted">Show Code</label>
                                <input class="form-check-input code-switcher" type="checkbox" id="striped-rows-showcode"/>
                              </div>
                            </div>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <p class="text-muted">Use <code>table-striped</code> class to add zebra-striping to any table row within the &lt;tbody&gt;.</p>
                            <div class="live-preview">
                              <div class="table-responsive">
                                <table class="table table-striped table-nowrap align-middle mb-0">
                                  <thead>
                                    <tr>
                                      <th scope="col">ID</th>
                                      <th scope="col">Customer</th>
                                      <th scope="col">Date</th>
                                      <th scope="col">Invoice</th>
                                      <th scope="col">Action</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <tr>
                                      <td class="fw-medium">01</td>
                                      <td>Bobby Davis</td>
                                      <td>Nov 14, 2021</td>
                                      <td>$2,410</td>
                                      <td>
                                        <span class="badge bg-success">Confirmed</span>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td class="fw-medium">02</td>
                                      <td>Christopher Neal</td>
                                      <td>Nov 21, 2021</td>
                                      <td>$1,450</td>
                                      <td>
                                        <span class="badge bg-warning">Waiting</span>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td class="fw-medium">03</td>
                                      <td>Monkey Karry</td>
                                      <td>Nov 24, 2021</td>
                                      <td>$3,500</td>
                                      <td>
                                        <span class="badge bg-success">Confirmed</span>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td class="fw-medium">04</td>
                                      <td>Aaron James</td>
                                      <td>Nov 25, 2021</td>
                                      <td>$6,875</td>
                                      <td>
                                        <span class="badge bg-danger">Cancelled</span>
                                      </td>
                                    </tr>
                                  </tbody>
                                </table>
                              </div>
                            </div>
                            <div class="d-none code-view">
                              <pre class="language-markup" style="height: 275px;">
                                <code>&lt;!-- Striped Rows --&gt;
&lt;table class=&quot;table table-striped&quot;&gt;
    &lt;thead&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;col&quot;&gt;Id&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Customer&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Date&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Invoice&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Action&lt;/th&gt;
        &lt;/tr&gt;
    &lt;/thead&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;1&lt;/th&gt;
            &lt;td&gt;Bobby Davis&lt;/td&gt;
            &lt;td&gt;Nov 14, 2021&lt;/td&gt;
            &lt;td&gt;$2,410&lt;/td&gt;
            &lt;td&gt;&lt;span class=&quot;badge bg-success&quot;&gt;Confirmed&lt;/span&gt;&lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;2&lt;/th&gt;
            &lt;td&gt;Christopher Neal&lt;/td&gt;
            &lt;td&gt;Nov 21, 2021&lt;/td&gt;
            &lt;td&gt;$1,450&lt;/td&gt;
            &lt;td&gt;&lt;span class=&quot;badge bg-warning&quot;&gt;Waiting&lt;/span&gt;&lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;3&lt;/th&gt;
            &lt;td&gt;Monkey Karry&lt;/td&gt;
            &lt;td&gt;Nov 24, 2021&lt;/td&gt;
            &lt;td&gt;$3,500&lt;/td&gt;
            &lt;td&gt;&lt;span class=&quot;badge bg-success&quot;&gt;Confirmed&lt;/span&gt;&lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;4&lt;/th&gt;
            &lt;td&gt;Aaron James&lt;/td&gt;
            &lt;td&gt;Nov 25, 2021&lt;/td&gt;
            &lt;td&gt;$6,875&lt;/td&gt;
            &lt;td&gt;&lt;span class=&quot;badge bg-danger&quot;&gt;Cancelled&lt;/span&gt;&lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;</code>
                              </pre>
                            </div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>
                      <!-- end col -->
                    </div>
                    <!-- end row -->

                    <div class="row">
                      <div class="col-xl-12">
                        <div class="card">
                          <div class="card-header align-items-center d-flex">
                            <h4 class="card-title mb-0 flex-grow-1">Striped columns</h4>

                            <div class="flex-shrink-0">
                              <div class="form-check form-switch form-switch-right form-switch-md">
                                <label for="card-tables-showcode" class="form-label text-muted">Show Code</label>
                                <input class="form-check-input code-switcher" type="checkbox" id="card-tables-showcode"/>
                              </div>
                            </div>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <p class="text-muted mb-4">Use .<code>table-striped-columns</code> to add zebra-striping to any table column.</p>

                            <div class="live-preview">
                              <div class="table-responsive table-card">
                                <table class="table align-middle table-nowrap table-striped-columns mb-0">
                                  <thead class="table-light">
                                    <tr>
                                      <th scope="col" style="width: 46px;">
                                        <div class="form-check">
                                          <input class="form-check-input" type="checkbox" value="" id="cardtableCheck"/>
                                          <label class="form-check-label" for="cardtableCheck"></label>
                                        </div>
                                      </th>
                                      <th scope="col">ID</th>
                                      <th scope="col">Name</th>
                                      <th scope="col">Date</th>
                                      <th scope="col">Total</th>
                                      <th scope="col">Status</th>
                                      <th scope="col" style="width: 150px;">Action</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <tr>
                                      <td>
                                        <div class="form-check">
                                          <input class="form-check-input" type="checkbox" value="" id="cardtableCheck01"/>
                                          <label class="form-check-label" for="cardtableCheck01"></label>
                                        </div>
                                      </td>
                                      <td>
                                        <a href="#" class="fw-medium">#VL2110</a>
                                      </td>
                                      <td>William Elmore</td>
                                      <td>07 Oct, 2021</td>
                                      <td>$24.05</td>
                                      <td>
                                        <span class="badge bg-success">Paid</span>
                                      </td>
                                      <td>
                                        <button type="button" class="btn btn-sm btn-light">Details</button>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td>
                                        <div class="form-check">
                                          <input class="form-check-input" type="checkbox" value="" id="cardtableCheck02"/>
                                          <label class="form-check-label" for="cardtableCheck02"></label>
                                        </div>
                                      </td>
                                      <td>
                                        <a href="#" class="fw-medium">#VL2109</a>
                                      </td>
                                      <td>Georgie Winters</td>
                                      <td>07 Oct, 2021</td>
                                      <td>$26.15</td>
                                      <td>
                                        <span class="badge bg-success">Paid</span>
                                      </td>
                                      <td>
                                        <button type="button" class="btn btn-sm btn-light">Details</button>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td>
                                        <div class="form-check">
                                          <input class="form-check-input" type="checkbox" value="" id="cardtableCheck03"/>
                                          <label class="form-check-label" for="cardtableCheck03"></label>
                                        </div>
                                      </td>
                                      <td>
                                        <a href="#" class="fw-medium">#VL2108</a>
                                      </td>
                                      <td>Whitney Meier</td>
                                      <td>06 Oct, 2021</td>
                                      <td>$21.25</td>
                                      <td>
                                        <span class="badge bg-danger">Refund</span>
                                      </td>
                                      <td>
                                        <button type="button" class="btn btn-sm btn-light">Details</button>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td>
                                        <div class="form-check">
                                          <input class="form-check-input" type="checkbox" value="" id="cardtableCheck04"/>
                                          <label class="form-check-label" for="cardtableCheck04"></label>
                                        </div>
                                      </td>
                                      <td>
                                        <a href="#" class="fw-medium">#VL2107</a>
                                      </td>
                                      <td>Justin Maier</td>
                                      <td>05 Oct, 2021</td>
                                      <td>$25.03</td>
                                      <td>
                                        <span class="badge bg-success">Paid</span>
                                      </td>
                                      <td>
                                        <button type="button" class="btn btn-sm btn-light">Details</button>
                                      </td>
                                    </tr>
                                  </tbody>
                                </table>
                              </div>
                            </div>
                            <div class="d-none code-view">
                              <pre class="language-markup" style="height: 275px;">
                                <code>&lt;div class=&quot;table-responsive table-card&quot;&gt;
    &lt;table class=&quot;table table-nowrap table-striped-columns mb-0&quot;&gt;
        &lt;thead class=&quot;table-light&quot;&gt;
            &lt;tr&gt;
                &lt;th scope=&quot;col&quot;&gt;
                    &lt;div class=&quot;form-check&quot;&gt;
                        &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; value=&quot;&quot; id=&quot;cardtableCheck&quot;&gt;
                        &lt;label class=&quot;form-check-label&quot; for=&quot;cardtableCheck&quot;&gt;&lt;/label&gt;
                    &lt;/div&gt;
                &lt;/th&gt;
                &lt;th scope=&quot;col&quot;&gt;Id&lt;/th&gt;
                &lt;th scope=&quot;col&quot;&gt;Name&lt;/th&gt;
                &lt;th scope=&quot;col&quot;&gt;Date&lt;/th&gt;
                &lt;th scope=&quot;col&quot;&gt;Total&lt;/th&gt;
                &lt;th scope=&quot;col&quot;&gt;Status&lt;/th&gt;
                &lt;th scope=&quot;col&quot;&gt;Action&lt;/th&gt;   
            &lt;/tr&gt;
        &lt;/thead&gt;
        &lt;tbody&gt;
            &lt;tr&gt;
                &lt;td&gt;
                    &lt;div class=&quot;form-check&quot;&gt;
                        &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; value=&quot;&quot; id=&quot;cardtableCheck01&quot;&gt;
                        &lt;label class=&quot;form-check-label&quot; for=&quot;cardtableCheck01&quot;&gt;&lt;/label&gt;
                    &lt;/div&gt;
                &lt;/td&gt;
                &lt;td&gt;&lt;a href=&quot;#&quot; class=&quot;fw-semibold&quot;&gt;#VL2110&lt;/a&gt;&lt;/td&gt;
                &lt;td&gt;William Elmore&lt;/td&gt;
                &lt;td&gt;07 Oct, 2021&lt;/td&gt;
                &lt;td&gt;$24.05&lt;/td&gt;
                &lt;td&gt;&lt;span class=&quot;badge bg-success&quot;&gt;Paid&lt;/span&gt;&lt;/td&gt;
                &lt;td&gt;
                    &lt;button type=&quot;button&quot; class=&quot;btn btn-sm btn-light&quot;&gt;Details&lt;/button&gt;
                &lt;/td&gt;
            &lt;/tr&gt;
            &lt;tr&gt;
                &lt;td&gt;
                    &lt;div class=&quot;form-check&quot;&gt;
                        &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; value=&quot;&quot; id=&quot;cardtableCheck02&quot;&gt;
                        &lt;label class=&quot;form-check-label&quot; for=&quot;cardtableCheck02&quot;&gt;&lt;/label&gt;
                    &lt;/div&gt;
                &lt;/td&gt;
                &lt;td&gt;&lt;a href=&quot;#&quot; class=&quot;fw-semibold&quot;&gt;#VL2109&lt;/a&gt;&lt;/td&gt;
                &lt;td&gt;Georgie Winters&lt;/td&gt;
                &lt;td&gt;07 Oct, 2021&lt;/td&gt;
                &lt;td&gt;$26.15&lt;/td&gt;
                &lt;td&gt;&lt;span class=&quot;badge bg-success&quot;&gt;Paid&lt;/span&gt;&lt;/td&gt;
                &lt;td&gt;
                    &lt;button type=&quot;button&quot; class=&quot;btn btn-sm btn-light&quot;&gt;Details&lt;/button&gt;
                &lt;/td&gt;
            &lt;/tr&gt;
            &lt;tr&gt;
                &lt;td&gt;
                    &lt;div class=&quot;form-check&quot;&gt;
                        &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; value=&quot;&quot; id=&quot;cardtableCheck03&quot;&gt;
                        &lt;label class=&quot;form-check-label&quot; for=&quot;cardtableCheck03&quot;&gt;&lt;/label&gt;
                    &lt;/div&gt;
                &lt;/td&gt;
                &lt;td&gt;&lt;a href=&quot;#&quot; class=&quot;fw-semibold&quot;&gt;#VL2108&lt;/a&gt;&lt;/td&gt;
                &lt;td&gt;Whitney Meier&lt;/td&gt;
                &lt;td&gt;06 Oct, 2021&lt;/td&gt;
                &lt;td&gt;$21.25&lt;/td&gt;
                &lt;td&gt;&lt;span class=&quot;badge bg-danger&quot;&gt;Refund&lt;/span&gt;&lt;/td&gt;
                &lt;td&gt;
                    &lt;button type=&quot;button&quot; class=&quot;btn btn-sm btn-light&quot;&gt;Details&lt;/button&gt;
                &lt;/td&gt;
            &lt;/tr&gt;
            &lt;tr&gt;
                &lt;td&gt;
                    &lt;div class=&quot;form-check&quot;&gt;
                        &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; value=&quot;&quot; id=&quot;cardtableCheck04&quot;&gt;
                        &lt;label class=&quot;form-check-label&quot; for=&quot;cardtableCheck04&quot;&gt;&lt;/label&gt;
                    &lt;/div&gt;
                &lt;/td&gt;
                &lt;td&gt;&lt;a href=&quot;#&quot; class=&quot;fw-semibold&quot;&gt;#VL2107&lt;/a&gt;&lt;/td&gt;
                &lt;td&gt;Justin Maier&lt;/td&gt;
                &lt;td&gt;05 Oct, 2021&lt;/td&gt;
                &lt;td&gt;$25.03&lt;/td&gt;
                &lt;td&gt;&lt;span class=&quot;badge bg-success&quot;&gt;Paid&lt;/span&gt;&lt;/td&gt;
                &lt;td&gt;
                    &lt;button type=&quot;button&quot; class=&quot;btn btn-sm btn-light&quot;&gt;Details&lt;/button&gt;
                &lt;/td&gt;
            &lt;/tr&gt;
        &lt;/tbody&gt;
    &lt;/table&gt;
&lt;/div&gt;</code>
                              </pre>
                            </div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>                      <!-- end col -->
                    </div>                    <!-- end row -->

                    <div class="row">
                      <div class="col-lg-12">
                        <div class="card">
                          <div class="card-header align-items-center d-flex">
                            <h4 class="card-title mb-0 flex-grow-1">Tables Colors</h4>
                            <div class="flex-shrink-0">
                              <div class="form-check form-switch form-switch-right form-switch-md">
                                <label for="striped-colors-showcode" class="form-label text-muted">Show Code</label>
                                <input class="form-check-input code-switcher" type="checkbox" id="striped-colors-showcode"/>
                              </div>
                            </div>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <p class="text-muted">Use <code>table-dark</code> class to set dark color table body and <code>table-success</code> class to set success color table body respectively. use <code>table-</code> class with different color variation to set required table body color.</p>
                            <div class="live-preview">
                              <div class="row">
                                <div class="col-xl-6">
                                  <div class="table-responsive">
                                    <table class="table table-dark table-striped table-nowrap mb-0">
                                      <thead>
                                        <tr>
                                          <th scope="col">ID</th>
                                          <th scope="col">Customer</th>
                                          <th scope="col">Date</th>
                                          <th scope="col">Invoice</th>
                                        </tr>
                                      </thead>
                                      <tbody>
                                        <tr>
                                          <td class="fw-medium">01</td>
                                          <td>Bobby Davis</td>
                                          <td>Nov 14, 2021</td>
                                          <td>$2,410</td>
                                        </tr>
                                        <tr>
                                          <td class="fw-medium">02</td>
                                          <td>Christopher Neal</td>
                                          <td>Nov 21, 2021</td>
                                          <td>$1,450</td>
                                        </tr>
                                        <tr>
                                          <td class="fw-medium">03</td>
                                          <td>Monkey Karry</td>
                                          <td>Nov 24, 2021</td>
                                          <td>$3,500</td>
                                        </tr>
                                        <tr>
                                          <td class="fw-medium">04</td>
                                          <td>Aaron James</td>
                                          <td>Nov 25, 2021</td>
                                          <td>$6,875</td>
                                        </tr>
                                      </tbody>
                                    </table>
                                  </div>
                                </div>
                                <!--end col-->

                                <div class="col-xl-6">
                                  <div class="table-responsive mt-4 mt-xl-0">
                                    <table class="table table-success table-striped table-nowrap align-middle mb-0">
                                      <thead>
                                        <tr>
                                          <th scope="col">ID</th>
                                          <th scope="col">Invoice</th>
                                          <th scope="col">Amount</th>
                                          <th scope="col">Date</th>
                                          <th scope="col">Status</th>
                                          <th scope="col">Action</th>
                                        </tr>
                                      </thead>
                                      <tbody>
                                        <tr>
                                          <td class="fw-medium">01</td>
                                          <td>Basic Plan</td>
                                          <td>$860</td>
                                          <td>Nov 22, 2021</td>
                                          <td>
                                            <i class="ri-checkbox-circle-line align-middle text-success"></i> Subscribed</td>
                                          <td>
                                            <div class="hstack gap-3 flex-wrap">
                                              <a href="javascript:void(0);" class="link-success fs-15">
                                                <i class="ri-edit-2-line"></i>
                                              </a>
                                              <a href="javascript:void(0);" class="link-danger fs-15">
                                                <i class="ri-delete-bin-line"></i>
                                              </a>
                                            </div>
                                          </td>
                                        </tr>
                                        <tr>
                                          <td class="fw-medium">02</td>
                                          <td>Premium Plan</td>
                                          <td>$1200</td>
                                          <td>Nov 10, 2021</td>
                                          <td>
                                            <i class="ri-close-circle-line align-middle text-danger"></i> Unsubscribed</td>
                                          <td>
                                            <div class="hstack gap-3 flex-wrap">
                                              <a href="javascript:void(0);" class="link-success fs-15">
                                                <i class="ri-edit-2-line"></i>
                                              </a>
                                              <a href="javascript:void(0);" class="link-danger fs-15">
                                                <i class="ri-delete-bin-line"></i>
                                              </a>
                                            </div>
                                          </td>
                                        </tr>
                                        <tr>
                                          <td class="fw-medium">03</td>
                                          <td>Basic Plan</td>
                                          <td>$860</td>
                                          <td>Nov 19, 2021</td>
                                          <td>
                                            <i class="ri-checkbox-circle-line align-middle text-success"></i> Subscribed</td>
                                          <td>
                                            <div class="hstack gap-3 flex-wrap">
                                              <a href="javascript:void(0);" class="link-success fs-15">
                                                <i class="ri-edit-2-line"></i>
                                              </a>
                                              <a href="javascript:void(0);" class="link-danger fs-15">
                                                <i class="ri-delete-bin-line"></i>
                                              </a>
                                            </div>
                                          </td>
                                        </tr>
                                        <tr>
                                          <td class="fw-medium">04</td>
                                          <td>Corporate Plan</td>
                                          <td>$1599</td>
                                          <td>Nov 22, 2021</td>
                                          <td>
                                            <i class="ri-checkbox-circle-line align-middle text-success"></i> Subscribed</td>
                                          <td>
                                            <div class="hstack gap-3 flex-wrap">
                                              <a href="javascript:void(0);" class="link-success fs-15">
                                                <i class="ri-edit-2-line"></i>
                                              </a>
                                              <a href="javascript:void(0);" class="link-danger fs-15">
                                                <i class="ri-delete-bin-line"></i>
                                              </a>
                                            </div>
                                          </td>
                                        </tr>
                                      </tbody>
                                    </table>
                                  </div>
                                </div>
                                <!--end col-->
                              </div>
                              <!--end row-->
                            </div>
                            <div class="d-none code-view">
                              <pre class="language-markup" style="height: 275px;">
                                <code>&lt;!-- Table Dark --&gt;
&lt;table class=&quot;table table-dark table-striped table-nowrap&quot;&gt;
    &lt;thead&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;col&quot;&gt;Id&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Customer&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Date&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Invoice&lt;/th&gt;
        &lt;/tr&gt;
    &lt;/thead&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;1&lt;/th&gt;
            &lt;td&gt;Bobby Davis&lt;/td&gt;
            &lt;td&gt;Nov 14, 2021&lt;/td&gt;
            &lt;td&gt;$2,410&lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;2&lt;/th&gt;
            &lt;td&gt;Christopher Neal&lt;/td&gt;
            &lt;td&gt;Nov 21, 2021&lt;/td&gt;
            &lt;td&gt;$1,450&lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;3&lt;/th&gt;
            &lt;td&gt;Monkey Karry&lt;/td&gt;
            &lt;td&gt;Nov 24, 2021&lt;/td&gt;
            &lt;td&gt;$3,500&lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;4&lt;/th&gt;
            &lt;td&gt;Aaron James&lt;/td&gt;
            &lt;td&gt;Nov 25, 2021&lt;/td&gt;
            &lt;td&gt;$6,875&lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;</code>

                                <code>&lt;table class=&quot;table table-success table-striped align-middle table-nowrap mb-0&quot;&gt;
    &lt;thead&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;col&quot;&gt;Id&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Invoice&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Amount&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Date&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Status&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Action&lt;/th&gt;
        &lt;/tr&gt;
    &lt;/thead&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;1&lt;/th&gt;
            &lt;td&gt;Basic Plan&lt;/td&gt;
            &lt;td&gt;$860&lt;/td&gt;
            &lt;td&gt;Nov 22, 2021&lt;/td&gt;
            &lt;td&gt;&lt;i class=&quot;ri-checkbox-circle-line align-middle text-success&quot;&gt;&lt;/i&gt; Subscribed&lt;/td&gt;
            &lt;td&gt;
                &lt;div class=&quot;hstack gap-3 flex-wrap&quot;&gt;
                    &lt;a href=&quot;javascript:void(0);&quot; class=&quot;link-success fs-15&quot;&gt;&lt;i class=&quot;ri-edit-2-line&quot;&gt;&lt;/i&gt;&lt;/a&gt;
                    &lt;a href=&quot;javascript:void(0);&quot; class=&quot;link-danger fs-15&quot;&gt;&lt;i class=&quot;ri-delete-bin-line&quot;&gt;&lt;/i&gt;&lt;/a&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;2&lt;/th&gt;
            &lt;td&gt;Premium Plan&lt;/td&gt;
            &lt;td&gt;$1200&lt;/td&gt;
            &lt;td&gt;Nov 10, 2021&lt;/td&gt;
            &lt;td&gt;&lt;i class=&quot;ri-close-circle-line align-middle text-danger&quot;&gt;&lt;/i&gt; Unsubscribed&lt;/td&gt;
            &lt;td&gt;
                &lt;div class=&quot;hstack gap-3 flex-wrap&quot;&gt;
                    &lt;a href=&quot;javascript:void(0);&quot; class=&quot;link-success fs-15&quot;&gt;&lt;i class=&quot;ri-edit-2-line&quot;&gt;&lt;/i&gt;&lt;/a&gt;
                    &lt;a href=&quot;javascript:void(0);&quot; class=&quot;link-danger fs-15&quot;&gt;&lt;i class=&quot;ri-delete-bin-line&quot;&gt;&lt;/i&gt;&lt;/a&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;3&lt;/th&gt;
            &lt;td&gt;Basic Plan&lt;/td&gt;
            &lt;td&gt;$860&lt;/td&gt;
            &lt;td&gt;Nov 19, 2021&lt;/td&gt;
            &lt;td&gt;&lt;i class=&quot;ri-checkbox-circle-line align-middle text-success&quot;&gt;&lt;/i&gt; Subscribed&lt;/td&gt;
            &lt;td&gt;
                &lt;div class=&quot;hstack gap-3 flex-wrap&quot;&gt;
                    &lt;a href=&quot;javascript:void(0);&quot; class=&quot;link-success fs-15&quot;&gt;&lt;i class=&quot;ri-edit-2-line&quot;&gt;&lt;/i&gt;&lt;/a&gt;
                    &lt;a href=&quot;javascript:void(0);&quot; class=&quot;link-danger fs-15&quot;&gt;&lt;i class=&quot;ri-delete-bin-line&quot;&gt;&lt;/i&gt;&lt;/a&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;4&lt;/th&gt;
            &lt;td&gt;Corporate Plan&lt;/td&gt;
            &lt;td&gt;$1599&lt;/td&gt;
            &lt;td&gt;Nov 22, 2021&lt;/td&gt;
            &lt;td&gt;&lt;i class=&quot;ri-checkbox-circle-line align-middle text-success&quot;&gt;&lt;/i&gt; Subscribed&lt;/td&gt;
            &lt;td&gt;
                &lt;div class=&quot;hstack gap-3 flex-wrap&quot;&gt;
                    &lt;a href=&quot;javascript:void(0);&quot; class=&quot;link-success fs-15&quot;&gt;&lt;i class=&quot;ri-edit-2-line&quot;&gt;&lt;/i&gt;&lt;/a&gt;
                    &lt;a href=&quot;javascript:void(0);&quot; class=&quot;link-danger fs-15&quot;&gt;&lt;i class=&quot;ri-delete-bin-line&quot;&gt;&lt;/i&gt;&lt;/a&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;</code>
                              </pre>
                            </div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>
                      <!-- end col -->
                    </div>
                    <!--end row-->

                    <div class="row">
                      <div class="col-lg-12">
                        <div class="card">
                          <div class="card-header align-items-center d-flex">
                            <h4 class="card-title mb-0 flex-grow-1">Hoverable Rows</h4>
                            <div class="flex-shrink-0">
                              <div class="form-check form-switch form-switch-right form-switch-md">
                                <label for="hover-rows-showcode" class="form-label text-muted">Show Code</label>
                                <input class="form-check-input code-switcher" type="checkbox" id="hover-rows-showcode"/>
                              </div>
                            </div>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <p class="text-muted">Use <code>table-hover</code> class to enable a hover state on table rows within a &lt;tbody&gt;.</p>

                            <div class="live-preview">
                              <div class="row">
                                <div class="col-xl-6">
                                  <div class="table-responsive">
                                    <table class="table table-hover align-middle table-nowrap mb-0">
                                      <thead>
                                        <tr>
                                          <th scope="col" style="width: 25px;">
                                            <div class="form-check">
                                              <input class="form-check-input" type="checkbox" id="checkAll" value="option1"/>
                                            </div>
                                          </th>
                                          <th scope="col">Order ID</th>
                                          <th scope="col">Shop</th>
                                          <th scope="col">Customer</th>
                                          <th scope="col">Price</th>
                                          <th scope="col">Action</th>
                                        </tr>
                                      </thead>
                                      <tbody>
                                        <tr>
                                          <th scope="row">
                                            <div class="form-check">
                                              <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option1" checked=""/>
                                            </div>
                                          </th>
                                          <td>#541254265</td>
                                          <td>Amezon</td>
                                          <td>Cleo Carson</td>
                                          <td>$4,521</td>
                                          <td>
                                            <a href="javascript:void(0);">
                                              <i class="ri-download-2-line fs-17 lh-1 align-middle"></i>
                                            </a>
                                          </td>
                                        </tr>
                                        <tr>
                                          <th scope="row">
                                            <div class="form-check">
                                              <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="option1" checked=""/>
                                            </div>
                                          </th>
                                          <td>#744145235</td>
                                          <td>Shoppers</td>
                                          <td>Juston Eichmann</td>
                                          <td>$7,546</td>
                                          <td>
                                            <a href="javascript:void(0);">
                                              <i class="ri-download-2-line fs-17 lh-1 align-middle"></i>
                                            </a>
                                          </td>
                                        </tr>
                                        <tr>
                                          <th scope="row">
                                            <div class="form-check">
                                              <input class="form-check-input" type="checkbox" id="inlineCheckbox4" value="option1"/>
                                            </div>
                                          </th>
                                          <td>#9855126598</td>
                                          <td>Flipkart</td>
                                          <td>Bettie Johson</td>
                                          <td>$1,350</td>
                                          <td>
                                            <a href="javascript:void(0);">
                                              <i class="ri-download-2-line fs-17 lh-1 align-middle"></i>
                                            </a>
                                          </td>
                                        </tr>
                                        <tr>
                                          <th scope="row">
                                            <div class="form-check">
                                              <input class="form-check-input" type="checkbox" id="inlineCheckbox5" value="option1"/>
                                            </div>
                                          </th>
                                          <td>#847512653</td>
                                          <td>Shoppers</td>
                                          <td>Maritza Blanda</td>
                                          <td>$4,521</td>
                                          <td>
                                            <a href="javascript:void(0);">
                                              <i class="ri-download-2-line fs-17 lh-1 align-middle"></i>
                                            </a>
                                          </td>
                                        </tr>
                                      </tbody>
                                    </table>
                                  </div>
                                </div>
                                <!--end col-->

                                <div class="col-xl-6">
                                  <div class="table-responsive mt-4 mt-xl-0">
                                    <table class="table table-hover table-striped align-middle table-nowrap mb-0">
                                      <thead>
                                        <tr>
                                          <th scope="col">ID</th>
                                          <th scope="col">Invoice</th>
                                          <th scope="col">Amount</th>
                                          <th scope="col">Date</th>
                                          <th scope="col">Status</th>
                                          <th scope="col">Action</th>
                                        </tr>
                                      </thead>
                                      <tbody>
                                        <tr>
                                          <td class="fw-medium">01</td>
                                          <td>Basic Plan</td>
                                          <td>$860</td>
                                          <td>Nov 22, 2021</td>
                                          <td>
                                            <i class="ri-checkbox-circle-line align-middle text-success"></i> Subscribed</td>
                                          <td>
                                            <div class="form-check form-switch">
                                              <input class="form-check-input" type="checkbox" role="switch" id="SwitchCheck1" checked=""/>
                                              <label class="form-check-label ms-2" for="SwitchCheck1">Yes/No</label>
                                            </div>
                                          </td>
                                        </tr>
                                        <tr>
                                          <td class="fw-medium">02</td>
                                          <td>Premium Plan</td>
                                          <td>$1200</td>
                                          <td>Nov 10, 2021</td>
                                          <td>
                                            <i class="ri-close-circle-line align-middle text-danger"></i> Unsubscribed</td>
                                          <td>
                                            <div class="form-check form-switch">
                                              <input class="form-check-input" type="checkbox" role="switch" id="SwitchCheck2"/>
                                              <label class="form-check-label ms-2" for="SwitchCheck2">Yes/No</label>
                                            </div>
                                          </td>
                                        </tr>
                                        <tr>
                                          <td class="fw-medium">03</td>
                                          <td>Basic Plan</td>
                                          <td>$860</td>
                                          <td>Nov 19, 2021</td>
                                          <td>
                                            <i class="ri-checkbox-circle-line align-middle text-success"></i> Subscribed</td>
                                          <td>
                                            <div class="form-check form-switch">
                                              <input class="form-check-input" type="checkbox" role="switch" id="SwitchCheck3"/>
                                              <label class="form-check-label ms-2" for="SwitchCheck3">Yes/No</label>
                                            </div>
                                          </td>
                                        </tr>
                                        <tr>
                                          <td class="fw-medium">04</td>
                                          <td>Corporate Plan</td>
                                          <td>$1599</td>
                                          <td>Nov 22, 2021</td>
                                          <td>
                                            <i class="ri-checkbox-circle-line align-middle text-success"></i> Subscribed</td>
                                          <td>
                                            <div class="form-check form-switch">
                                              <input class="form-check-input" type="checkbox" role="switch" id="SwitchCheck4" checked=""/>
                                              <label class="form-check-label ms-2" for="SwitchCheck4">Yes/No</label>
                                            </div>
                                          </td>
                                        </tr>
                                      </tbody>
                                    </table>
                                  </div>
                                </div>
                                <!--end col-->
                              </div>
                              <!--end row-->
                            </div>
                            <div class="d-none code-view">
                              <pre class="language-markup" style="height: 275px;">
                                <code>&lt;!-- Hoverable Rows --&gt;
&lt;table class=&quot;table table-hover table-nowrap mb-0&quot;&gt;
    &lt;thead&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;col&quot;&gt;
                &lt;div class=&quot;form-check&quot;&gt;
                    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; id=&quot;checkAll&quot; value=&quot;option1&quot;&gt;
                &lt;/div&gt;
            &lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Order ID&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Shop&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Customer&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Price&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Action&lt;/th&gt;
        &lt;/tr&gt;
    &lt;/thead&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;
                &lt;div class=&quot;form-check&quot;&gt;
                    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; id=&quot;inlineCheckbox2&quot; value=&quot;option1&quot; checked&gt;
                &lt;/div&gt;
            &lt;/th&gt;
            &lt;td&gt;#541254265&lt;/td&gt;
            &lt;td&gt;Amezon&lt;/td&gt;
            &lt;td&gt;Cleo Carson&lt;/td&gt;
            &lt;td&gt;$4,521&lt;/td&gt;
            &lt;td&gt;&lt;a href=&quot;javascript:void(0);&quot;&gt;&lt;i class=&quot;ri-download-2-line&quot;&gt;&lt;/i&gt;&lt;/a&gt;&lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;
                &lt;div class=&quot;form-check&quot;&gt;
                    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; id=&quot;inlineCheckbox3&quot; value=&quot;option1&quot; checked&gt;
                &lt;/div&gt;
            &lt;/th&gt;
            &lt;td&gt;#744145235&lt;/td&gt;
            &lt;td&gt;Shoppers&lt;/td&gt;
            &lt;td&gt;Juston Eichmann&lt;/td&gt;
            &lt;td&gt;$7,546&lt;/td&gt;
            &lt;td&gt;&lt;a href=&quot;javascript:void(0);&quot;&gt;&lt;i class=&quot;ri-download-2-line&quot;&gt;&lt;/i&gt;&lt;/a&gt;&lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;
                &lt;div class=&quot;form-check&quot;&gt;
                    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; id=&quot;inlineCheckbox4&quot; value=&quot;option1&quot;&gt;
                &lt;/div&gt;
            &lt;/th&gt;
            &lt;td&gt;#9855126598&lt;/td&gt;
            &lt;td&gt;Flipkart&lt;/td&gt;
            &lt;td&gt;Bettie Johson&lt;/td&gt;
            &lt;td&gt;$1,350&lt;/td&gt;
            &lt;td&gt;&lt;a href=&quot;javascript:void(0);&quot;&gt;&lt;i class=&quot;ri-download-2-line&quot;&gt;&lt;/i&gt;&lt;/a&gt;&lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;
                &lt;div class=&quot;form-check&quot;&gt;
                    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; id=&quot;inlineCheckbox5&quot; value=&quot;option1&quot;&gt;
                &lt;/div&gt;
            &lt;/th&gt;
            &lt;td&gt;#847512653&lt;/td&gt;
            &lt;td&gt;Shoppers&lt;/td&gt;
            &lt;td&gt;Maritza Blanda&lt;/td&gt;
            &lt;td&gt;$4,521&lt;/td&gt;
            &lt;td&gt;&lt;a href=&quot;javascript:void(0);&quot;&gt;&lt;i class=&quot;ri-download-2-line&quot;&gt;&lt;/i&gt;&lt;/a&gt;&lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;</code>

                                <code>&lt;table class=&quot;table table-hover table-striped align-middle table-nowrap mb-0&quot;&gt;
    &lt;thead&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;col&quot;&gt;Id&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Invoice&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Amount&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Date&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Status&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Action&lt;/th&gt;
        &lt;/tr&gt;
    &lt;/thead&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;1&lt;/th&gt;
            &lt;td&gt;Basic Plan&lt;/td&gt;
            &lt;td&gt;$860&lt;/td&gt;
            &lt;td&gt;Nov 22, 2021&lt;/td&gt;
            &lt;td&gt;&lt;i class=&quot;ri-checkbox-circle-line align-middle text-success&quot;&gt;&lt;/i&gt; Subscribed&lt;/td&gt;
            &lt;td&gt;
                &lt;div class=&quot;form-check form-switch&quot;&gt;
                    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; role=&quot;switch&quot; id=&quot;SwitchCheck1&quot; checked=&quot;&quot;&gt;
                    &lt;label class=&quot;form-check-label&quot; for=&quot;SwitchCheck1&quot;&gt;Yes/No&lt;/label&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;2&lt;/th&gt;
            &lt;td&gt;Premium Plan&lt;/td&gt;
            &lt;td&gt;$1200&lt;/td&gt;
            &lt;td&gt;Nov 10, 2021&lt;/td&gt;
            &lt;td&gt;&lt;i class=&quot;ri-close-circle-line align-middle text-danger&quot;&gt;&lt;/i&gt; Unsubscribed&lt;/td&gt;
            &lt;td&gt;
                &lt;div class=&quot;form-check form-switch&quot;&gt;
                    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; role=&quot;switch&quot; id=&quot;SwitchCheck2&quot;&gt;
                    &lt;label class=&quot;form-check-label&quot; for=&quot;SwitchCheck2&quot;&gt;Yes/No&lt;/label&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;3&lt;/th&gt;
            &lt;td&gt;Basic Plan&lt;/td&gt;
            &lt;td&gt;$860&lt;/td&gt;
            &lt;td&gt;Nov 19, 2021&lt;/td&gt;
            &lt;td&gt;&lt;i class=&quot;ri-checkbox-circle-line align-middle text-success&quot;&gt;&lt;/i&gt; Subscribed&lt;/td&gt;
            &lt;td&gt;
                &lt;div class=&quot;form-check form-switch&quot;&gt;
                    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; role=&quot;switch&quot; id=&quot;SwitchCheck3&quot;&gt;
                    &lt;label class=&quot;form-check-label&quot; for=&quot;SwitchCheck3&quot;&gt;Yes/No&lt;/label&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;4&lt;/th&gt;
            &lt;td&gt;Corporate Plan&lt;/td&gt;
            &lt;td&gt;$1599&lt;/td&gt;
            &lt;td&gt;Nov 22, 2021&lt;/td&gt;
            &lt;td&gt;&lt;i class=&quot;ri-checkbox-circle-line align-middle text-success&quot;&gt;&lt;/i&gt; Subscribed&lt;/td&gt;
            &lt;td&gt;
                &lt;div class=&quot;form-check form-switch&quot;&gt;
                    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; role=&quot;switch&quot; id=&quot;SwitchCheck4&quot; checked=&quot;&quot;&gt;
                    &lt;label class=&quot;form-check-label&quot; for=&quot;SwitchCheck4&quot;&gt;Yes/No&lt;/label&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;</code>
                              </pre>
                            </div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>
                      <!-- end col -->
                    </div>
                    <!--end row-->

                    <div class="row">
                      <div class="col-xl-12">
                        <div class="card">
                          <div class="card-header align-items-center d-flex">
                            <h4 class="card-title mb-0 flex-grow-1">Card Tables</h4>

                            <div class="flex-shrink-0">
                              <div class="form-check form-switch form-switch-right form-switch-md">
                                <label for="card-tables-showcode" class="form-label text-muted">Show Code</label>
                                <input class="form-check-input code-switcher" type="checkbox" id="card-tables-showcode"/>
                              </div>
                            </div>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <p class="text-muted mb-4">Use <code>table-card</code> class to show card-based table within a &lt;tbody&gt;.</p>

                            <div class="live-preview">
                              <div class="table-responsive table-card">
                                <table class="table align-middle table-nowrap mb-0">
                                  <thead class="table-light">
                                    <tr>
                                      <th scope="col" style="width: 46px;">
                                        <div class="form-check">
                                          <input class="form-check-input" type="checkbox" value="" id="cardtableCheck"/>
                                          <label class="form-check-label" for="cardtableCheck"></label>
                                        </div>
                                      </th>
                                      <th scope="col">ID</th>
                                      <th scope="col">Name</th>
                                      <th scope="col">Date</th>
                                      <th scope="col">Total</th>
                                      <th scope="col">Status</th>
                                      <th scope="col" style="width: 150px;">Action</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <tr>
                                      <td>
                                        <div class="form-check">
                                          <input class="form-check-input" type="checkbox" value="" id="cardtableCheck01"/>
                                          <label class="form-check-label" for="cardtableCheck01"></label>
                                        </div>
                                      </td>
                                      <td>
                                        <a href="#" class="fw-medium">#VL2110</a>
                                      </td>
                                      <td>William Elmore</td>
                                      <td>07 Oct, 2021</td>
                                      <td>$24.05</td>
                                      <td>
                                        <span class="badge bg-success">Paid</span>
                                      </td>
                                      <td>
                                        <button type="button" class="btn btn-sm btn-light">Details</button>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td>
                                        <div class="form-check">
                                          <input class="form-check-input" type="checkbox" value="" id="cardtableCheck02"/>
                                          <label class="form-check-label" for="cardtableCheck02"></label>
                                        </div>
                                      </td>
                                      <td>
                                        <a href="#" class="fw-medium">#VL2109</a>
                                      </td>
                                      <td>Georgie Winters</td>
                                      <td>07 Oct, 2021</td>
                                      <td>$26.15</td>
                                      <td>
                                        <span class="badge bg-success">Paid</span>
                                      </td>
                                      <td>
                                        <button type="button" class="btn btn-sm btn-light">Details</button>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td>
                                        <div class="form-check">
                                          <input class="form-check-input" type="checkbox" value="" id="cardtableCheck03"/>
                                          <label class="form-check-label" for="cardtableCheck03"></label>
                                        </div>
                                      </td>
                                      <td>
                                        <a href="#" class="fw-medium">#VL2108</a>
                                      </td>
                                      <td>Whitney Meier</td>
                                      <td>06 Oct, 2021</td>
                                      <td>$21.25</td>
                                      <td>
                                        <span class="badge bg-danger">Refund</span>
                                      </td>
                                      <td>
                                        <button type="button" class="btn btn-sm btn-light">Details</button>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td>
                                        <div class="form-check">
                                          <input class="form-check-input" type="checkbox" value="" id="cardtableCheck04"/>
                                          <label class="form-check-label" for="cardtableCheck04"></label>
                                        </div>
                                      </td>
                                      <td>
                                        <a href="#" class="fw-medium">#VL2107</a>
                                      </td>
                                      <td>Justin Maier</td>
                                      <td>05 Oct, 2021</td>
                                      <td>$25.03</td>
                                      <td>
                                        <span class="badge bg-success">Paid</span>
                                      </td>
                                      <td>
                                        <button type="button" class="btn btn-sm btn-light">Details</button>
                                      </td>
                                    </tr>
                                  </tbody>
                                </table>
                              </div>
                            </div>
                            <div class="d-none code-view">
                              <pre class="language-markup" style="height: 275px;">
                                <code>&lt;div class=&quot;table-responsive table-card&quot;&gt;
    &lt;table class=&quot;table table-nowrap mb-0&quot;&gt;
        &lt;thead class=&quot;table-light&quot;&gt;
            &lt;tr&gt;
                &lt;th scope=&quot;col&quot;&gt;
                    &lt;div class=&quot;form-check&quot;&gt;
                        &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; value=&quot;&quot; id=&quot;cardtableCheck&quot;&gt;
                        &lt;label class=&quot;form-check-label&quot; for=&quot;cardtableCheck&quot;&gt;&lt;/label&gt;
                    &lt;/div&gt;
                &lt;/th&gt;
                &lt;th scope=&quot;col&quot;&gt;Id&lt;/th&gt;
                &lt;th scope=&quot;col&quot;&gt;Name&lt;/th&gt;
                &lt;th scope=&quot;col&quot;&gt;Date&lt;/th&gt;
                &lt;th scope=&quot;col&quot;&gt;Total&lt;/th&gt;
                &lt;th scope=&quot;col&quot;&gt;Status&lt;/th&gt;
                &lt;th scope=&quot;col&quot;&gt;Action&lt;/th&gt;
            &lt;/tr&gt;
        &lt;/thead&gt;
        &lt;tbody&gt;
            &lt;tr&gt;
                &lt;td&gt;
                    &lt;div class=&quot;form-check&quot;&gt;
                        &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; value=&quot;&quot; id=&quot;cardtableCheck01&quot;&gt;
                        &lt;label class=&quot;form-check-label&quot; for=&quot;cardtableCheck01&quot;&gt;&lt;/label&gt;
                    &lt;/div&gt;
                &lt;/td&gt;
                &lt;td&gt;&lt;a href=&quot;#&quot; class=&quot;fw-semibold&quot;&gt;#VL2110&lt;/a&gt;&lt;/td&gt;
                &lt;td&gt;William Elmore&lt;/td&gt;
                &lt;td&gt;07 Oct, 2021&lt;/td&gt;
                &lt;td&gt;$24.05&lt;/td&gt;
                &lt;td&gt;&lt;span class=&quot;badge bg-success&quot;&gt;Paid&lt;/span&gt;&lt;/td&gt;
                &lt;td&gt;
                    &lt;button type=&quot;button&quot; class=&quot;btn btn-sm btn-light&quot;&gt;Details&lt;/button&gt;
                &lt;/td&gt;
            &lt;/tr&gt;
            &lt;tr&gt;
                &lt;td&gt;
                    &lt;div class=&quot;form-check&quot;&gt;
                        &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; value=&quot;&quot; id=&quot;cardtableCheck02&quot;&gt;
                        &lt;label class=&quot;form-check-label&quot; for=&quot;cardtableCheck02&quot;&gt;&lt;/label&gt;
                    &lt;/div&gt;
                &lt;/td&gt;
                &lt;td&gt;&lt;a href=&quot;#&quot; class=&quot;fw-semibold&quot;&gt;#VL2109&lt;/a&gt;&lt;/td&gt;
                &lt;td&gt;Georgie Winters&lt;/td&gt;
                &lt;td&gt;07 Oct, 2021&lt;/td&gt;
                &lt;td&gt;$26.15&lt;/td&gt;
                &lt;td&gt;&lt;span class=&quot;badge bg-success&quot;&gt;Paid&lt;/span&gt;&lt;/td&gt;
                &lt;td&gt;
                    &lt;button type=&quot;button&quot; class=&quot;btn btn-sm btn-light&quot;&gt;Details&lt;/button&gt;
                &lt;/td&gt;
            &lt;/tr&gt;
            &lt;tr&gt;
                &lt;td&gt;
                    &lt;div class=&quot;form-check&quot;&gt;
                        &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; value=&quot;&quot; id=&quot;cardtableCheck03&quot;&gt;
                        &lt;label class=&quot;form-check-label&quot; for=&quot;cardtableCheck03&quot;&gt;&lt;/label&gt;
                    &lt;/div&gt;
                &lt;/td&gt;
                &lt;td&gt;&lt;a href=&quot;#&quot; class=&quot;fw-semibold&quot;&gt;#VL2108&lt;/a&gt;&lt;/td&gt;
                &lt;td&gt;Whitney Meier&lt;/td&gt;
                &lt;td&gt;06 Oct, 2021&lt;/td&gt;
                &lt;td&gt;$21.25&lt;/td&gt;
                &lt;td&gt;&lt;span class=&quot;badge bg-danger&quot;&gt;Refund&lt;/span&gt;&lt;/td&gt;
                &lt;td&gt;
                    &lt;button type=&quot;button&quot; class=&quot;btn btn-sm btn-light&quot;&gt;Details&lt;/button&gt;
                &lt;/td&gt;
            &lt;/tr&gt;
            &lt;tr&gt;
                &lt;td&gt;
                    &lt;div class=&quot;form-check&quot;&gt;
                        &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; value=&quot;&quot; id=&quot;cardtableCheck04&quot;&gt;
                        &lt;label class=&quot;form-check-label&quot; for=&quot;cardtableCheck04&quot;&gt;&lt;/label&gt;
                    &lt;/div&gt;
                &lt;/td&gt;
                &lt;td&gt;&lt;a href=&quot;#&quot; class=&quot;fw-semibold&quot;&gt;#VL2107&lt;/a&gt;&lt;/td&gt;
                &lt;td&gt;Justin Maier&lt;/td&gt;
                &lt;td&gt;05 Oct, 2021&lt;/td&gt;
                &lt;td&gt;$25.03&lt;/td&gt;
                &lt;td&gt;&lt;span class=&quot;badge bg-success&quot;&gt;Paid&lt;/span&gt;&lt;/td&gt;
                &lt;td&gt;
                    &lt;button type=&quot;button&quot; class=&quot;btn btn-sm btn-light&quot;&gt;Details&lt;/button&gt;
                &lt;/td&gt;
            &lt;/tr&gt;
        &lt;/tbody&gt;
    &lt;/table&gt;
&lt;/div&gt;</code>
                              </pre>
                            </div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>                      <!-- end col -->
                    </div>                    <!-- end row -->

                    <div class="row">
                      <div class="col-xl-6">
                        <div class="card">
                          <div class="card-header align-items-center d-flex">
                            <h4 class="card-title mb-0 flex-grow-1">Active Tables</h4>
                            <div class="flex-shrink-0">
                              <div class="form-check form-switch form-switch-right form-switch-md">
                                <label for="active-tables-showcode" class="form-label text-muted">Show Code</label>
                                <input class="form-check-input code-switcher" type="checkbox" id="active-tables-showcode"/>
                              </div>
                            </div>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <p class="text-muted">Use <code>table-active</code> class to highlight a table row or cell.</p>

                            <div class="live-preview">
                              <div class="table-responsive">
                                <table class="table align-middle table-nowrap mb-0">
                                  <thead>
                                    <tr>
                                      <th scope="col" style="width: 42px;">
                                        <div class="form-check">
                                          <input class="form-check-input" type="checkbox" value="" id="activetableCheck"/>
                                          <label class="form-check-label" for="activetableCheck"></label>
                                        </div>
                                      </th>
                                      <th scope="col">Order ID</th>
                                      <th scope="col">Shop</th>
                                      <th scope="col">Customer</th>
                                      <th scope="col">Price</th>
                                      <th scope="col">Action</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <tr>
                                      <th scope="row">
                                        <div class="form-check">
                                          <input class="form-check-input" type="checkbox" value="" id="activetableCheck01" checked=""/>
                                          <label class="form-check-label" for="activetableCheck01"></label>
                                        </div>
                                      </th>
                                      <td>#541254265</td>
                                      <td>Amezon</td>
                                      <td>Cleo Carson</td>
                                      <td>$4,521</td>
                                      <td>
                                        <a href="javascript:void(0);">
                                          <i class="ri-download-2-line fs-17 lh-1 align-middle"></i>
                                        </a>
                                      </td>
                                    </tr>
                                    <tr class="table-active">
                                      <th scope="row">
                                        <div class="form-check">
                                          <input class="form-check-input" type="checkbox" value="" id="activetableCheck02" checked=""/>
                                          <label class="form-check-label" for="activetableCheck02"></label>
                                        </div>
                                      </th>
                                      <td>#744145235</td>
                                      <td>Shoppers</td>
                                      <td>Juston Eichmann</td>
                                      <td>$7,546</td>
                                      <td>
                                        <a href="javascript:void(0);">
                                          <i class="ri-download-2-line fs-17 lh-1 align-middle"></i>
                                        </a>
                                      </td>
                                    </tr>
                                    <tr>
                                      <th scope="row">
                                        <div class="form-check">
                                          <input class="form-check-input" type="checkbox" value="" id="activetableCheck03"/>
                                          <label class="form-check-label" for="activetableCheck03"></label>
                                        </div>
                                      </th>
                                      <td>#9855126598</td>
                                      <td>Flipkart</td>
                                      <td>Bettie Johson</td>
                                      <td>$1,350</td>
                                      <td>
                                        <a href="javascript:void(0);">
                                          <i class="ri-download-2-line fs-17 lh-1 align-middle"></i>
                                        </a>
                                      </td>
                                    </tr>
                                    <tr>
                                      <th scope="row">
                                        <div class="form-check">
                                          <input class="form-check-input" type="checkbox" value="" id="activetableCheck04"/>
                                          <label class="form-check-label" for="activetableCheck04"></label>
                                        </div>
                                      </th>
                                      <td>#847512653</td>
                                      <td>Shoppers</td>
                                      <td class="table-active">Maritza Blanda</td>
                                      <td>$4,521</td>
                                      <td>
                                        <a href="javascript:void(0);">
                                          <i class="ri-download-2-line fs-17 lh-1 align-middle"></i>
                                        </a>
                                      </td>
                                    </tr>
                                  </tbody>
                                </table>
                              </div>
                            </div>
                            <div class="d-none code-view">
                              <pre class="language-markup" style="height: 275px;">
                                <code>&lt;!-- Active Tables --&gt;
&lt;table class=&quot;table table-nowrap mb-0&quot;&gt;
    &lt;thead&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;col&quot;&gt;
                &lt;div class=&quot;form-check&quot;&gt;
                    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; value=&quot;&quot; id=&quot;activetableCheck&quot;&gt;
                    &lt;label class=&quot;form-check-label&quot; for=&quot;activetableCheck&quot;&gt;&lt;/label&gt;
                &lt;/div&gt;
            &lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Order ID&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Shop&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Customer&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Price&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Action&lt;/th&gt;
        &lt;/tr&gt;
    &lt;/thead&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;
                &lt;div class=&quot;form-check&quot;&gt;
                    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; value=&quot;&quot; id=&quot;activetableCheck01&quot; checked&gt;
                    &lt;label class=&quot;form-check-label&quot; for=&quot;activetableCheck01&quot;&gt;&lt;/label&gt;
                &lt;/div&gt;
            &lt;/th&gt;
            &lt;td&gt;#541254265&lt;/td&gt;
            &lt;td&gt;Amezon&lt;/td&gt;
            &lt;td&gt;Cleo Carson&lt;/td&gt;
            &lt;td&gt;$4,521&lt;/td&gt;
            &lt;td&gt;&lt;a href=&quot;javascript:void(0);&quot;&gt;&lt;i class=&quot;ri-download-2-line&quot;&gt;&lt;/i&gt;&lt;/a&gt;&lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr class=&quot;table-active&quot;&gt;
            &lt;th scope=&quot;row&quot;&gt;
                &lt;div class=&quot;form-check&quot;&gt;
                    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; value=&quot;&quot; id=&quot;activetableCheck02&quot; checked&gt;
                    &lt;label class=&quot;form-check-label&quot; for=&quot;activetableCheck02&quot;&gt;&lt;/label&gt;
                &lt;/div&gt;
            &lt;/th&gt;
            &lt;td&gt;#744145235&lt;/td&gt;
            &lt;td&gt;Shoppers&lt;/td&gt;
            &lt;td&gt;Juston Eichmann&lt;/td&gt;
            &lt;td&gt;$7,546&lt;/td&gt;
            &lt;td&gt;&lt;a href=&quot;javascript:void(0);&quot;&gt;&lt;i class=&quot;ri-download-2-line&quot;&gt;&lt;/i&gt;&lt;/a&gt;&lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;
                &lt;div class=&quot;form-check&quot;&gt;
                    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; value=&quot;&quot; id=&quot;activetableCheck03&quot;&gt;
                    &lt;label class=&quot;form-check-label&quot; for=&quot;activetableCheck03&quot;&gt;&lt;/label&gt;
                &lt;/div&gt;
            &lt;/th&gt;
            &lt;td&gt;#9855126598&lt;/td&gt;
            &lt;td&gt;Flipkart&lt;/td&gt;
            &lt;td&gt;Bettie Johson&lt;/td&gt;
            &lt;td&gt;$1,350&lt;/td&gt;
            &lt;td&gt;&lt;a href=&quot;javascript:void(0);&quot;&gt;&lt;i class=&quot;ri-download-2-line&quot;&gt;&lt;/i&gt;&lt;/a&gt;&lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;
                &lt;div class=&quot;form-check&quot;&gt;
                    &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; value=&quot;&quot; id=&quot;activetableCheck04&quot;&gt;
                    &lt;label class=&quot;form-check-label&quot; for=&quot;activetableCheck04&quot;&gt;&lt;/label&gt;
                &lt;/div&gt;
            &lt;/th&gt;
            &lt;td&gt;#847512653&lt;/td&gt;
            &lt;td&gt;Shoppers&lt;/td&gt;
            &lt;td class=&quot;table-active&quot;&gt;Maritza Blanda&lt;/td&gt;
            &lt;td&gt;$4,521&lt;/td&gt;
            &lt;td&gt;&lt;a href=&quot;javascript:void(0);&quot;&gt;&lt;i class=&quot;ri-download-2-line&quot;&gt;&lt;/i&gt;&lt;/a&gt;&lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;</code>
                              </pre>
                            </div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>
                      <!-- end col -->

                      <div class="col-xl-6">
                        <div class="card">
                          <div class="card-header align-items-center d-flex">
                            <h4 class="card-title mb-0 flex-grow-1">Bordered Tables</h4>
                            <div class="flex-shrink-0">
                              <div class="form-check form-switch form-switch-right form-switch-md">
                                <label for="bordered-tables-showcode" class="form-label text-muted">Show Code</label>
                                <input class="form-check-input code-switcher" type="checkbox" id="bordered-tables-showcode"/>
                              </div>
                            </div>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <p class="text-muted">Use <code>table-bordered</code> class to show borders on all sides of the table and cells.</p>

                            <div class="live-preview">
                              <div class="table-responsive">
                                <table class="table table-bordered align-middle table-nowrap mb-0">
                                  <thead>
                                    <tr>
                                      <th scope="col">ID</th>
                                      <th scope="col">Title</th>
                                      <th scope="col">Status</th>
                                      <th scope="col">Assignee</th>
                                      <th scope="col">Price</th>
                                      <th scope="col"></th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <tr>
                                      <td class="fw-medium">01</td>
                                      <td>Implement new UX</td>
                                      <td>
                                        <span class="badge badge-soft-primary">Backlog</span>
                                      </td>
                                      <td>Lanora Sandoval</td>
                                      <td>$4,521</td>
                                      <td>
                                        <div class="dropdown">
                                          <a href="#" role="button" id="dropdownMenuLink1" data-bs-toggle="dropdown" aria-expanded="false">
                                            <i class="ri-more-2-fill"></i>
                                          </a>

                                          <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink1">
                                            <li>
                                              <a class="dropdown-item" href="#">View</a>
                                            </li>
                                            <li>
                                              <a class="dropdown-item" href="#">Edit</a>
                                            </li>
                                            <li>
                                              <a class="dropdown-item" href="#">Delete</a>
                                            </li>
                                          </ul>
                                        </div>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td class="fw-medium">02</td>
                                      <td>Design syntax</td>
                                      <td>
                                        <span class="badge badge-soft-secondary">In Progress</span>
                                      </td>
                                      <td>Calvin Garrett</td>
                                      <td>$7,546</td>
                                      <td>
                                        <div class="dropdown">
                                          <a href="#" role="button" id="dropdownMenuLink2" data-bs-toggle="dropdown" aria-expanded="false">
                                            <i class="ri-more-2-fill"></i>
                                          </a>

                                          <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink2">
                                            <li>
                                              <a class="dropdown-item" href="#">View</a>
                                            </li>
                                            <li>
                                              <a class="dropdown-item" href="#">Edit</a>
                                            </li>
                                            <li>
                                              <a class="dropdown-item" href="#">Delete</a>
                                            </li>
                                          </ul>
                                        </div>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td class="fw-medium">03</td>
                                      <td>Configurable resources</td>
                                      <td>
                                        <span class="badge badge-soft-success">Done</span>
                                      </td>
                                      <td>Florence Guzman</td>
                                      <td>$1,350</td>
                                      <td>
                                        <div class="dropdown">
                                          <a href="#" role="button" id="dropdownMenuLink3" data-bs-toggle="dropdown" aria-expanded="false">
                                            <i class="ri-more-2-fill"></i>
                                          </a>

                                          <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink3">
                                            <li>
                                              <a class="dropdown-item" href="#">View</a>
                                            </li>
                                            <li>
                                              <a class="dropdown-item" href="#">Edit</a>
                                            </li>
                                            <li>
                                              <a class="dropdown-item" href="#">Delete</a>
                                            </li>
                                          </ul>
                                        </div>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td class="fw-medium">04</td>
                                      <td>Implement extensions</td>
                                      <td>
                                        <span class="badge badge-soft-secondary">In Progress</span>
                                      </td>
                                      <td>Maritza Blanda</td>
                                      <td>$4,521</td>
                                      <td>
                                        <div class="dropdown">
                                          <a href="#" role="button" id="dropdownMenuLink4" data-bs-toggle="dropdown" aria-expanded="false">
                                            <i class="ri-more-2-fill"></i>
                                          </a>

                                          <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink4">
                                            <li>
                                              <a class="dropdown-item" href="#">View</a>
                                            </li>
                                            <li>
                                              <a class="dropdown-item" href="#">Edit</a>
                                            </li>
                                            <li>
                                              <a class="dropdown-item" href="#">Delete</a>
                                            </li>
                                          </ul>
                                        </div>
                                      </td>
                                    </tr>
                                  </tbody>
                                </table>
                              </div>
                            </div>
                            <div class="d-none code-view">
                              <pre class="language-markup" style="height: 275px;">
                                <code>&lt;!-- Bordered Tables --&gt;
&lt;table class=&quot;table table-bordered table-nowrap&quot;&gt;
    &lt;thead&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;col&quot;&gt;Id&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Title&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Status&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Assignee&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Price&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;&lt;/th&gt;
        &lt;/tr&gt;
    &lt;/thead&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;1&lt;/th&gt;
            &lt;td&gt;Implement new UX&lt;/td&gt;
            &lt;td&gt;&lt;span class=&quot;badge badge-soft-primary&quot;&gt;Backlog&lt;/span&gt;&lt;/td&gt;
            &lt;td&gt;Lanora Sandoval&lt;/td&gt;
            &lt;td&gt;$4,521&lt;/td&gt;
            &lt;td&gt;
                &lt;div class=&quot;dropdown&quot;&gt;
                    &lt;a href=&quot;#&quot; role=&quot;button&quot; id=&quot;dropdownMenuLink&quot; data-bs-toggle=&quot;dropdown&quot; aria-expanded=&quot;false&quot;&gt;
                        &lt;i class=&quot;ri-more-2-fill&quot;&gt;&lt;/i&gt;
                    &lt;/a&gt;
                  
                    &lt;ul class=&quot;dropdown-menu&quot; aria-labelledby=&quot;dropdownMenuLink&quot;&gt;
                        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;View&lt;/a&gt;&lt;/li&gt;
                        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Edit&lt;/a&gt;&lt;/li&gt;
                        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Delete&lt;/a&gt;&lt;/li&gt;
                    &lt;/ul&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;2&lt;/th&gt;
            &lt;td&gt;Design syntax&lt;/td&gt;
            &lt;td&gt;&lt;span class=&quot;badge badge-soft-secondary&quot;&gt;In Progress&lt;/span&gt;&lt;/td&gt;
            &lt;td&gt;Calvin Garrett&lt;/td&gt;
            &lt;td&gt;$7,546&lt;/td&gt;
            &lt;td&gt;
                &lt;div class=&quot;dropdown&quot;&gt;
                    &lt;a href=&quot;#&quot; role=&quot;button&quot; id=&quot;dropdownMenuLink&quot; data-bs-toggle=&quot;dropdown&quot; aria-expanded=&quot;false&quot;&gt;
                        &lt;i class=&quot;ri-more-2-fill&quot;&gt;&lt;/i&gt;
                    &lt;/a&gt;
                  
                    &lt;ul class=&quot;dropdown-menu&quot; aria-labelledby=&quot;dropdownMenuLink&quot;&gt;
                        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;View&lt;/a&gt;&lt;/li&gt;
                        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Edit&lt;/a&gt;&lt;/li&gt;
                        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Delete&lt;/a&gt;&lt;/li&gt;
                    &lt;/ul&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;3&lt;/th&gt;
            &lt;td&gt;Configurable resources&lt;/td&gt;
            &lt;td&gt;&lt;span class=&quot;badge badge-soft-success&quot;&gt;Done&lt;/span&gt;&lt;/td&gt;
            &lt;td&gt;Florence Guzman&lt;/td&gt;
            &lt;td&gt;$1,350&lt;/td&gt;
            &lt;td&gt;
                &lt;div class=&quot;dropdown&quot;&gt;
                    &lt;a href=&quot;#&quot; role=&quot;button&quot; id=&quot;dropdownMenuLink&quot; data-bs-toggle=&quot;dropdown&quot; aria-expanded=&quot;false&quot;&gt;
                        &lt;i class=&quot;ri-more-2-fill&quot;&gt;&lt;/i&gt;
                    &lt;/a&gt;
                  
                    &lt;ul class=&quot;dropdown-menu&quot; aria-labelledby=&quot;dropdownMenuLink&quot;&gt;
                        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;View&lt;/a&gt;&lt;/li&gt;
                        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Edit&lt;/a&gt;&lt;/li&gt;
                        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Delete&lt;/a&gt;&lt;/li&gt;
                    &lt;/ul&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;4&lt;/th&gt;
            &lt;td&gt;Implement extensions&lt;/td&gt;
            &lt;td&gt;&lt;span class=&quot;badge badge-soft-secondary&quot;&gt;In Progress&lt;/span&gt;&lt;/td&gt;
            &lt;td&gt;Maritza Blanda&lt;/td&gt;
            &lt;td&gt;$4,521&lt;/td&gt;
            &lt;td&gt;
                &lt;div class=&quot;dropdown&quot;&gt;
                    &lt;a href=&quot;#&quot; role=&quot;button&quot; id=&quot;dropdownMenuLink&quot; data-bs-toggle=&quot;dropdown&quot; aria-expanded=&quot;false&quot;&gt;
                        &lt;i class=&quot;ri-more-2-fill&quot;&gt;&lt;/i&gt;
                    &lt;/a&gt;
                  
                    &lt;ul class=&quot;dropdown-menu&quot; aria-labelledby=&quot;dropdownMenuLink&quot;&gt;
                        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;View&lt;/a&gt;&lt;/li&gt;
                        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Edit&lt;/a&gt;&lt;/li&gt;
                        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Delete&lt;/a&gt;&lt;/li&gt;
                    &lt;/ul&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;</code>
                              </pre>
                            </div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>                      <!-- end col -->
                    </div>
                    <!--end row-->

                    <div class="row">
                      <div class="col-xl-6">
                        <div class="card">
                          <div class="card-header align-items-center d-flex">
                            <h4 class="card-title mb-0 flex-grow-1">Tables Border Colors</h4>
                            <div class="flex-shrink-0">
                              <div class="form-check form-switch form-switch-right form-switch-md">
                                <label for="tables-border-showcode" class="form-label text-muted">Show Code</label>
                                <input class="form-check-input code-switcher" type="checkbox" id="tables-border-showcode"/>
                              </div>
                            </div>
                          </div>                          <!-- end card header -->
                          <div class="card-body">
                            <p class="text-muted">Use <code>border-</code> class with color variation class to set table border color.</p>

                            <div class="live-preview">
                              <div class="table-responsive">
                                <table class="table table-bordered border-secondary table-nowrap align-middle mb-0">
                                  <thead>
                                    <tr>
                                      <th scope="col">ID</th>
                                      <th scope="col">Title</th>
                                      <th scope="col">Status</th>
                                      <th scope="col">Assignee</th>
                                      <th scope="col">Price</th>
                                      <th scope="col"></th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <tr>
                                      <td class="fw-medium">01</td>
                                      <td>Implement new UX</td>
                                      <td>
                                        <span class="badge badge-soft-primary">Backlog</span>
                                      </td>
                                      <td>Lanora Sandoval</td>
                                      <td>$4,521</td>
                                      <td>
                                        <div class="dropdown">
                                          <a href="#" role="button" id="dropdownMenuLink5" data-bs-toggle="dropdown" aria-expanded="false">
                                            <i class="ri-more-2-fill"></i>
                                          </a>

                                          <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink5">
                                            <li>
                                              <a class="dropdown-item" href="#">View</a>
                                            </li>
                                            <li>
                                              <a class="dropdown-item" href="#">Edit</a>
                                            </li>
                                            <li>
                                              <a class="dropdown-item" href="#">Delete</a>
                                            </li>
                                          </ul>
                                        </div>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td class="fw-medium">02</td>
                                      <td>Design syntax</td>
                                      <td>
                                        <span class="badge badge-soft-secondary">In Progress</span>
                                      </td>
                                      <td>Calvin Garrett</td>
                                      <td>$7,546</td>
                                      <td>
                                        <div class="dropdown">
                                          <a href="#" role="button" id="dropdownMenuLink6" data-bs-toggle="dropdown" aria-expanded="false">
                                            <i class="ri-more-2-fill"></i>
                                          </a>

                                          <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink6">
                                            <li>
                                              <a class="dropdown-item" href="#">View</a>
                                            </li>
                                            <li>
                                              <a class="dropdown-item" href="#">Edit</a>
                                            </li>
                                            <li>
                                              <a class="dropdown-item" href="#">Delete</a>
                                            </li>
                                          </ul>
                                        </div>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td class="fw-medium">03</td>
                                      <td>Configurable resources</td>
                                      <td>
                                        <span class="badge badge-soft-success">Done</span>
                                      </td>
                                      <td>Florence Guzman</td>
                                      <td>$1,350</td>
                                      <td>
                                        <div class="dropdown">
                                          <a href="#" role="button" id="dropdownMenuLink7" data-bs-toggle="dropdown" aria-expanded="false">
                                            <i class="ri-more-2-fill"></i>
                                          </a>

                                          <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink7">
                                            <li>
                                              <a class="dropdown-item" href="#">View</a>
                                            </li>
                                            <li>
                                              <a class="dropdown-item" href="#">Edit</a>
                                            </li>
                                            <li>
                                              <a class="dropdown-item" href="#">Delete</a>
                                            </li>
                                          </ul>
                                        </div>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td class="fw-medium">04</td>
                                      <td>Implement extensions</td>
                                      <td>
                                        <span class="badge badge-soft-secondary">In Progress</span>
                                      </td>
                                      <td>Maritza Blanda</td>
                                      <td>$4,521</td>
                                      <td>
                                        <div class="dropdown">
                                          <a href="#" role="button" id="dropdownMenuLink8" data-bs-toggle="dropdown" aria-expanded="false">
                                            <i class="ri-more-2-fill"></i>
                                          </a>

                                          <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink8">
                                            <li>
                                              <a class="dropdown-item" href="#">View</a>
                                            </li>
                                            <li>
                                              <a class="dropdown-item" href="#">Edit</a>
                                            </li>
                                            <li>
                                              <a class="dropdown-item" href="#">Delete</a>
                                            </li>
                                          </ul>
                                        </div>
                                      </td>
                                    </tr>
                                  </tbody>
                                </table>
                              </div>
                            </div>
                            <div class="d-none code-view">
                              <pre class="language-markup" style="height: 275px;">
                                <code>&lt;!-- Tables Border Colors --&gt;
&lt;table class=&quot;table table-bordered border-secondary table-nowrap&quot;&gt;
    &lt;thead&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;col&quot;&gt;Id&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Title&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Status&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Assignee&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Price&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;&lt;/th&gt;
        &lt;/tr&gt;
    &lt;/thead&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;1&lt;/th&gt;
            &lt;td&gt;Implement new UX&lt;/td&gt;
            &lt;td&gt;&lt;span class=&quot;badge badge-soft-primary&quot;&gt;Backlog&lt;/span&gt;&lt;/td&gt;
            &lt;td&gt;Lanora Sandoval&lt;/td&gt;
            &lt;td&gt;$4,521&lt;/td&gt;
            &lt;td&gt;
                &lt;div class=&quot;dropdown&quot;&gt;
                    &lt;a href=&quot;#&quot; role=&quot;button&quot; id=&quot;dropdownMenuLink&quot; data-bs-toggle=&quot;dropdown&quot; aria-expanded=&quot;false&quot;&gt;
                        &lt;i class=&quot;ri-more-2-fill&quot;&gt;&lt;/i&gt;
                    &lt;/a&gt;
                  
                    &lt;ul class=&quot;dropdown-menu&quot; aria-labelledby=&quot;dropdownMenuLink&quot;&gt;
                        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;View&lt;/a&gt;&lt;/li&gt;
                        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Edit&lt;/a&gt;&lt;/li&gt;
                        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Delete&lt;/a&gt;&lt;/li&gt;
                    &lt;/ul&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;2&lt;/th&gt;
            &lt;td&gt;Design syntax&lt;/td&gt;
            &lt;td&gt;&lt;span class=&quot;badge badge-soft-secondary&quot;&gt;In Progress&lt;/span&gt;&lt;/td&gt;
            &lt;td&gt;Calvin Garrett&lt;/td&gt;
            &lt;td&gt;$7,546&lt;/td&gt;
            &lt;td&gt;
                &lt;div class=&quot;dropdown&quot;&gt;
                    &lt;a href=&quot;#&quot; role=&quot;button&quot; id=&quot;dropdownMenuLink&quot; data-bs-toggle=&quot;dropdown&quot; aria-expanded=&quot;false&quot;&gt;
                        &lt;i class=&quot;ri-more-2-fill&quot;&gt;&lt;/i&gt;
                    &lt;/a&gt;
                  
                    &lt;ul class=&quot;dropdown-menu&quot; aria-labelledby=&quot;dropdownMenuLink&quot;&gt;
                        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;View&lt;/a&gt;&lt;/li&gt;
                        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Edit&lt;/a&gt;&lt;/li&gt;
                        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Delete&lt;/a&gt;&lt;/li&gt;
                    &lt;/ul&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;3&lt;/th&gt;
            &lt;td&gt;Configurable resources&lt;/td&gt;
            &lt;td&gt;&lt;span class=&quot;badge badge-soft-success&quot;&gt;Done&lt;/span&gt;&lt;/td&gt;
            &lt;td&gt;Florence Guzman&lt;/td&gt;
            &lt;td&gt;$1,350&lt;/td&gt;
            &lt;td&gt;
                &lt;div class=&quot;dropdown&quot;&gt;
                    &lt;a href=&quot;#&quot; role=&quot;button&quot; id=&quot;dropdownMenuLink&quot; data-bs-toggle=&quot;dropdown&quot; aria-expanded=&quot;false&quot;&gt;
                        &lt;i class=&quot;ri-more-2-fill&quot;&gt;&lt;/i&gt;
                    &lt;/a&gt;
                  
                    &lt;ul class=&quot;dropdown-menu&quot; aria-labelledby=&quot;dropdownMenuLink&quot;&gt;
                        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;View&lt;/a&gt;&lt;/li&gt;
                        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Edit&lt;/a&gt;&lt;/li&gt;
                        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Delete&lt;/a&gt;&lt;/li&gt;
                    &lt;/ul&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;4&lt;/th&gt;
            &lt;td&gt;Implement extensions&lt;/td&gt;
            &lt;td&gt;&lt;span class=&quot;badge badge-soft-secondary&quot;&gt;In Progress&lt;/span&gt;&lt;/td&gt;
            &lt;td&gt;Maritza Blanda&lt;/td&gt;
            &lt;td&gt;$4,521&lt;/td&gt;
            &lt;td&gt;
                &lt;div class=&quot;dropdown&quot;&gt;
                    &lt;a href=&quot;#&quot; role=&quot;button&quot; id=&quot;dropdownMenuLink&quot; data-bs-toggle=&quot;dropdown&quot; aria-expanded=&quot;false&quot;&gt;
                        &lt;i class=&quot;ri-more-2-fill&quot;&gt;&lt;/i&gt;
                    &lt;/a&gt;
                  
                    &lt;ul class=&quot;dropdown-menu&quot; aria-labelledby=&quot;dropdownMenuLink&quot;&gt;
                        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;View&lt;/a&gt;&lt;/li&gt;
                        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Edit&lt;/a&gt;&lt;/li&gt;
                        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Delete&lt;/a&gt;&lt;/li&gt;
                    &lt;/ul&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;</code>
                              </pre>
                            </div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>                      <!-- end col -->

                      <div class="col-xl-6">
                        <div class="card">
                          <div class="card-header align-items-center d-flex">
                            <h4 class="card-title mb-0 flex-grow-1">Tables Without Borders</h4>
                            <div class="flex-shrink-0">
                              <div class="form-check form-switch form-switch-right form-switch-md">
                                <label for="tables-without-border-showcode" class="form-label text-muted">Show Code</label>
                                <input class="form-check-input code-switcher" type="checkbox" id="tables-without-border-showcode"/>
                              </div>
                            </div>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <p class="text-muted">Use <code>table-borderless</code> to set a table without borders.</p>
                            <div class="live-preview">
                              <div class="table-responsive">
                                <table class="table table-borderless align-middle table-nowrap mb-0">
                                  <thead>
                                    <tr>
                                      <th scope="col">ID</th>
                                      <th scope="col">Name</th>
                                      <th scope="col">Job Title</th>
                                      <th scope="col">Date</th>
                                      <th scope="col">Status</th>
                                      <th scope="col"></th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <tr>
                                      <td class="fw-medium">01</td>
                                      <td>Annette Black</td>
                                      <td>Industrial Designer</td>
                                      <td>10, Nov 2021</td>
                                      <td>
                                        <span class="badge badge-soft-success">Active</span>
                                      </td>
                                      <td>
                                        <div class="hstack gap-3 fs-15">
                                          <a href="javascript:void(0);" class="link-primary">
                                            <i class="ri-settings-4-line"></i>
                                          </a>
                                          <a href="javascript:void(0);" class="link-danger">
                                            <i class="ri-delete-bin-5-line"></i>
                                          </a>
                                        </div>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td class="fw-medium">02</td>
                                      <td>Bessie Cooper</td>
                                      <td>Graphic Designer</td>
                                      <td>13, Nov 2021</td>
                                      <td>
                                        <span class="badge badge-soft-success">Active</span>
                                      </td>
                                      <td>
                                        <div class="hstack gap-3 fs-15">
                                          <a href="javascript:void(0);" class="link-primary">
                                            <i class="ri-settings-4-line"></i>
                                          </a>
                                          <a href="javascript:void(0);" class="link-danger">
                                            <i class="ri-delete-bin-5-line"></i>
                                          </a>
                                        </div>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td class="fw-medium">03</td>
                                      <td>Leslie Alexander</td>
                                      <td>Product Manager</td>
                                      <td>17, Nov 2021</td>
                                      <td>
                                        <span class="badge badge-soft-success">Active</span>
                                      </td>
                                      <td>
                                        <div class="hstack gap-3 fs-15">
                                          <a href="javascript:void(0);" class="link-primary">
                                            <i class="ri-settings-4-line"></i>
                                          </a>
                                          <a href="javascript:void(0);" class="link-danger">
                                            <i class="ri-delete-bin-5-line"></i>
                                          </a>
                                        </div>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td class="fw-medium">04</td>
                                      <td>Lenora Sandoval</td>
                                      <td>Applications Engineer</td>
                                      <td>25, Nov 2021</td>
                                      <td>
                                        <span class="badge badge-soft-danger">Disabled</span>
                                      </td>
                                      <td>
                                        <div class="hstack gap-3 fs-15">
                                          <a href="javascript:void(0);" class="link-primary">
                                            <i class="ri-settings-4-line"></i>
                                          </a>
                                          <a href="javascript:void(0);" class="link-danger">
                                            <i class="ri-delete-bin-5-line"></i>
                                          </a>
                                        </div>
                                      </td>
                                    </tr>
                                  </tbody>
                                </table>
                              </div>
                            </div>
                            <div class="d-none code-view">
                              <pre class="language-markup" style="height: 275px;">
                                <code>&lt;!-- Tables Without Borders --&gt;
&lt;table class=&quot;table table-borderless table-nowrap&quot;&gt;
    &lt;thead&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;col&quot;&gt;Id&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Name&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Job Title&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Date&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Status&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;&lt;/th&gt;
        &lt;/tr&gt;
    &lt;/thead&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;1&lt;/th&gt;
            &lt;td&gt;Annette Black&lt;/td&gt;
            &lt;td&gt;Industrial Designer&lt;/td&gt;
            &lt;td&gt;10, Nov 2021&lt;/td&gt;
            &lt;td&gt;&lt;span class=&quot;badge badge-soft-success&quot;&gt;Active&lt;/span&gt;&lt;/td&gt;
            &lt;td&gt;
                &lt;div class=&quot;hstack gap-3 fs-15&quot;&gt;
                    &lt;a href=&quot;javascript:void(0);&quot; class=&quot;link-primary&quot;&gt;&lt;i class=&quot;ri-settings-4-line&quot;&gt;&lt;/i&gt;&lt;/a&gt;
                    &lt;a href=&quot;javascript:void(0);&quot; class=&quot;link-danger&quot;&gt;&lt;i class=&quot;ri-delete-bin-5-line&quot;&gt;&lt;/i&gt;&lt;/a&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;2&lt;/th&gt;
            &lt;td&gt;Bessie Cooper&lt;/td&gt;
            &lt;td&gt;Graphic Designer&lt;/td&gt;
            &lt;td&gt;13, Nov 2021&lt;/td&gt;
            &lt;td&gt;&lt;span class=&quot;badge badge-soft-success&quot;&gt;Active&lt;/span&gt;&lt;/td&gt;
            &lt;td&gt;
                &lt;div class=&quot;hstack gap-3 fs-15&quot;&gt;
                    &lt;a href=&quot;javascript:void(0);&quot; class=&quot;link-primary&quot;&gt;&lt;i class=&quot;ri-settings-4-line&quot;&gt;&lt;/i&gt;&lt;/a&gt;
                    &lt;a href=&quot;javascript:void(0);&quot; class=&quot;link-danger&quot;&gt;&lt;i class=&quot;ri-delete-bin-5-line&quot;&gt;&lt;/i&gt;&lt;/a&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;3&lt;/th&gt;
            &lt;td&gt;Leslie Alexander&lt;/td&gt;
            &lt;td&gt;Product Manager&lt;/td&gt;
            &lt;td&gt;17, Nov 2021&lt;/td&gt;
            &lt;td&gt;&lt;span class=&quot;badge badge-soft-success&quot;&gt;Active&lt;/span&gt;&lt;/td&gt;
            &lt;td&gt;
                &lt;div class=&quot;hstack gap-3 fs-15&quot;&gt;
                    &lt;a href=&quot;javascript:void(0);&quot; class=&quot;link-primary&quot;&gt;&lt;i class=&quot;ri-settings-4-line&quot;&gt;&lt;/i&gt;&lt;/a&gt;
                    &lt;a href=&quot;javascript:void(0);&quot; class=&quot;link-danger&quot;&gt;&lt;i class=&quot;ri-delete-bin-5-line&quot;&gt;&lt;/i&gt;&lt;/a&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;4&lt;/th&gt;
            &lt;td&gt;Lenora Sandoval&lt;/td&gt;
            &lt;td&gt;Applications Engineer&lt;/td&gt;
            &lt;td&gt;25, Nov 2021&lt;/td&gt;
            &lt;td&gt;&lt;span class=&quot;badge badge-soft-danger&quot;&gt;Disabled&lt;/span&gt;&lt;/td&gt;
            &lt;td&gt;
                &lt;div class=&quot;hstack gap-3 fs-15&quot;&gt;
                    &lt;a href=&quot;javascript:void(0);&quot; class=&quot;link-primary&quot;&gt;&lt;i class=&quot;ri-settings-4-line&quot;&gt;&lt;/i&gt;&lt;/a&gt;
                    &lt;a href=&quot;javascript:void(0);&quot; class=&quot;link-danger&quot;&gt;&lt;i class=&quot;ri-delete-bin-5-line&quot;&gt;&lt;/i&gt;&lt;/a&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;</code>
                              </pre>
                            </div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>                      <!-- end col -->
                    </div>
                    <!--end row-->

                    <div class="row">
                      <div class="col-xl-6">
                        <div class="card">
                          <div class="card-header align-items-center d-flex">
                            <h4 class="card-title mb-0 flex-grow-1">Small Tables</h4>
                            <div class="flex-shrink-0">
                              <div class="form-check form-switch form-switch-right form-switch-md">
                                <label for="tables-small-showcode" class="form-label text-muted">Show Code</label>
                                <input class="form-check-input code-switcher" type="checkbox" id="tables-small-showcode"/>
                              </div>
                            </div>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <p class="text-muted">Use <code>table-sm</code> class to create any table more compact by cutting all cell padding in half.</p>

                            <div class="live-preview">
                              <div class="table-responsive">
                                <table class="table table-sm table-nowrap mb-0">
                                  <thead>
                                    <tr>
                                      <th scope="col">ID</th>
                                      <th scope="col">Title</th>
                                      <th scope="col">Status</th>
                                      <th scope="col">Assignee</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <tr>
                                      <td class="fw-medium">01</td>
                                      <td>Implement new UX</td>
                                      <td>
                                        <span class="badge badge-soft-primary">Backlog</span>
                                      </td>
                                      <td>Lanora Sandoval</td>
                                    </tr>
                                    <tr>
                                      <td class="fw-medium">02</td>
                                      <td>Design syntax</td>
                                      <td>
                                        <span class="badge badge-soft-secondary">In Progress</span>
                                      </td>
                                      <td>Calvin Garrett</td>
                                    </tr>
                                    <tr>
                                      <td class="fw-medium">03</td>
                                      <td>Configurable resources</td>
                                      <td>
                                        <span class="badge badge-soft-success">Done</span>
                                      </td>
                                      <td>Florence Guzman</td>
                                    </tr>
                                    <tr>
                                      <td class="fw-medium">04</td>
                                      <td>Implement extensions</td>
                                      <td>
                                        <span class="badge badge-soft-dark">Backlog</span>
                                      </td>
                                      <td>Maritza Blanda</td>
                                    </tr>
                                    <tr>
                                      <td class="fw-medium">05</td>
                                      <td>Applications Engineer</td>
                                      <td>
                                        <span class="badge badge-soft-success">Done</span>
                                      </td>
                                      <td>Leslie Alexander</td>
                                    </tr>
                                  </tbody>
                                </table>
                              </div>
                            </div>
                            <div class="d-none code-view">
                              <pre class="language-markup" style="height: 275px;">
                                <code>&lt;!-- Small Tables --&gt;
&lt;table class=&quot;table table-sm table-nowrap&quot;&gt;
    &lt;thead&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;col&quot;&gt;Id&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Title&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Status&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Assignee&lt;/th&gt;
        &lt;/tr&gt;
    &lt;/thead&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;1&lt;/th&gt;
            &lt;td&gt;Implement new UX&lt;/td&gt;
            &lt;td&gt;&lt;span class=&quot;badge badge-soft-primary&quot;&gt;Backlog&lt;/span&gt;&lt;/td&gt;
            &lt;td&gt;Lanora Sandoval&lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;2&lt;/th&gt;
            &lt;td&gt;Design syntax&lt;/td&gt;
            &lt;td&gt;&lt;span class=&quot;badge badge-soft-secondary&quot;&gt;In Progress&lt;/span&gt;&lt;/td&gt;
            &lt;td&gt;Calvin Garrett&lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;3&lt;/th&gt;
            &lt;td&gt;Configurable resources&lt;/td&gt;
            &lt;td&gt;&lt;span class=&quot;badge badge-soft-success&quot;&gt;Done&lt;/span&gt;&lt;/td&gt;
            &lt;td&gt;Florence Guzman&lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;4&lt;/th&gt;
            &lt;td&gt;Implement extensions&lt;/td&gt;
            &lt;td&gt;&lt;span class=&quot;badge badge-soft-dark&quot;&gt;Backlog&lt;/span&gt;&lt;/td&gt;
            &lt;td&gt;Maritza Blanda&lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;5&lt;/th&gt;
            &lt;td&gt;Applications Engineer&lt;/td&gt;&lt;td&gt;
            &lt;span class=&quot;badge badge-soft-success&quot;&gt;Done&lt;/span&gt;&lt;/td&gt;
            &lt;td&gt;Leslie Alexander&lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;</code>
                              </pre>
                            </div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>
                      <!-- end col -->

                      <div class="col-xl-6">
                        <div class="card">
                          <div class="card-header align-items-center d-flex">
                            <h4 class="card-title mb-0 flex-grow-1">Table Head</h4>
                            <div class="flex-shrink-0">
                              <div class="form-check form-switch form-switch-right form-switch-md">
                                <label for="tables-head-showcode" class="form-label text-muted">Show Code</label>
                                <input class="form-check-input code-switcher" type="checkbox" id="tables-head-showcode"/>
                              </div>
                            </div>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <p class="text-muted">Use <code>table-light</code> or <code>table-dark</code> class to create &lt;thead&gt; appear light or dark.</p>

                            <div class="live-preview">
                              <div class="table-responsive">
                                <table class="table align-middle table-nowrap mb-0">
                                  <thead class="table-light">
                                    <tr>
                                      <th scope="col">Student</th>
                                      <th scope="col">Course</th>
                                      <th scope="col">Author</th>
                                      <th scope="col">Payment</th>
                                      <th scope="col">Process</th>
                                      <th scope="col">Status</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <tr>
                                      <td>Milana Scot</td>
                                      <td>UI/UX design</td>
                                      <td>Mitchell Flores</td>
                                      <td>$450</td>
                                      <td>
                                        <div class="progress progress-sm">
                                          <div class="progress-bar bg-success" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                      </td>
                                      <td>
                                        <a href="javascript:void(0);" class="link-success">Confirmed</a>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td>Jassica Welsh</td>
                                      <td>3d Animation</td>
                                      <td>Dan Evgeni</td>
                                      <td>$860</td>
                                      <td>
                                        <div class="progress progress-sm">
                                          <div class="progress-bar bg-warning" role="progressbar" style="width: 65%" aria-valuenow="65" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                      </td>
                                      <td>
                                        <a href="javascript:void(0);" class="link-warning">Waiting</a>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td>Leslie Alexander</td>
                                      <td>Logotype Design</td>
                                      <td>Olimpia Jordan</td>
                                      <td>$450</td>
                                      <td>
                                        <div class="progress progress-sm">
                                          <div class="progress-bar bg-warning" role="progressbar" style="width: 35%" aria-valuenow="35" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                      </td>
                                      <td>
                                        <a href="javascript:void(0);" class="link-warning">Waiting</a>
                                      </td>
                                    </tr>
                                  </tbody>
                                </table>
                              </div>
                            </div>
                            <div class="d-none code-view">
                              <pre class="language-markup" style="height: 275px;">
                                <code>&lt;!-- Table Head --&gt;
&lt;table class=&quot;table align-middle table-nowrap mb-0&quot;&gt;
    &lt;thead class=&quot;table-light&quot;&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;col&quot;&gt;Student&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Course&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Author&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Payment&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Process&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Status&lt;/th&gt;
        &lt;/tr&gt;
    &lt;/thead&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;td&gt;Milana Scot&lt;/td&gt;
            &lt;td&gt;UI/UX design&lt;/td&gt;
            &lt;td&gt;Mitchell Flores&lt;/td&gt;
            &lt;td&gt;$450&lt;/td&gt;
            &lt;td&gt;
                &lt;div class=&quot;progress progress-sm&quot;&gt;
                    &lt;div class=&quot;progress-bar bg-success&quot; role=&quot;progressbar&quot; style=&quot;width: 100%&quot; aria-valuenow=&quot;100&quot; aria-valuemin=&quot;0&quot; aria-valuemax=&quot;100&quot;&gt;&lt;/div&gt;
                &lt;/div&gt;
            &lt;/td&gt;
            &lt;td&gt;&lt;a href=&quot;javascript:void(0);&quot; class=&quot;link-success&quot;&gt;Confirmed&lt;/a&gt;&lt;/td&gt;
        &lt;/tr&gt;   
        &lt;tr&gt;
            &lt;td&gt;Jassica Welsh&lt;/td&gt;
            &lt;td&gt;3d Animation&lt;/td&gt;
            &lt;td&gt;Dan Evgeni&lt;/td&gt;
            &lt;td&gt;$860&lt;/td&gt;
            &lt;td&gt;
                &lt;div class=&quot;progress progress-sm&quot;&gt;
                    &lt;div class=&quot;progress-bar bg-warning&quot; role=&quot;progressbar&quot; style=&quot;width: 65%&quot; aria-valuenow=&quot;65&quot; aria-valuemin=&quot;0&quot; aria-valuemax=&quot;100&quot;&gt;&lt;/div&gt;
                &lt;/div&gt;
            &lt;/td&gt;
            &lt;td&gt;&lt;a href=&quot;javascript:void(0);&quot; class=&quot;link-warning&quot;&gt;Waiting&lt;/a&gt;&lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;td&gt;Leslie Alexander&lt;/td&gt;
            &lt;td&gt;Logotype Design&lt;/td&gt;
            &lt;td&gt;Olimpia Jordan&lt;/td&gt;
            &lt;td&gt;$450&lt;/td&gt;
            &lt;td&gt;
                &lt;div class=&quot;progress progress-sm&quot;&gt;
                    &lt;div class=&quot;progress-bar bg-warning&quot; role=&quot;progressbar&quot; style=&quot;width: 35%&quot; aria-valuenow=&quot;35&quot; aria-valuemin=&quot;0&quot; aria-valuemax=&quot;100&quot;&gt;&lt;/div&gt;
                &lt;/div&gt;
            &lt;/td&gt;
            &lt;td&gt;&lt;a href=&quot;javascript:void(0);&quot; class=&quot;link-warning&quot;&gt;Waiting&lt;/a&gt;&lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;</code>
                              </pre>
                            </div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>                      <!-- end col -->
                    </div>
                    <!--end row-->

                    <div class="row">
                      <div class="col-xl-6">
                        <div class="card">
                          <div class="card-header align-items-center d-flex">
                            <h4 class="card-title mb-0 flex-grow-1">Table Foot</h4>
                            <div class="flex-shrink-0">
                              <div class="form-check form-switch form-switch-right form-switch-md">
                                <label for="tables-foot-showcode" class="form-label text-muted">Show Code</label>
                                <input class="form-check-input code-switcher" type="checkbox" id="tables-foot-showcode"/>
                              </div>
                            </div>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <p class="text-muted">Add <code>&lt;tbody&gt;</code> attribute to group footer content in an HTML table.</p>

                            <div class="live-preview">
                              <div class="table-responsive">
                                <table class="table table-nowrap mb-0">
                                  <thead class="table-light">
                                    <tr>
                                      <th scope="col">ID</th>
                                      <th scope="col">Name</th>
                                      <th scope="col">Job Title</th>
                                      <th scope="col">Date</th>
                                      <th scope="col">Payment</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <tr>
                                      <td class="fw-medium">01</td>
                                      <td>Annette Black</td>
                                      <td>Industrial Designer</td>
                                      <td>10, Nov 2021</td>
                                      <td>$450</td>
                                    </tr>
                                    <tr>
                                      <td class="fw-medium">02</td>
                                      <td>Bessie Cooper</td>
                                      <td>Graphic Designer</td>
                                      <td>13, Nov 2021</td>
                                      <td>$875</td>
                                    </tr>
                                    <tr>
                                      <td class="fw-medium">03</td>
                                      <td>Leslie Alexander</td>
                                      <td>Product Manager</td>
                                      <td>17, Nov 2021</td>
                                      <td>$410</td>
                                    </tr>
                                  </tbody>
                                  <tfoot class="table-light">
                                    <tr>
                                      <td colspan="4">Total</td>
                                      <td>$940</td>
                                    </tr>
                                  </tfoot>
                                </table>
                              </div>
                            </div>
                            <div class="d-none code-view">
                              <pre class="language-markup" style="height: 275px;">
                                <code>&lt;!-- Table Foot --&gt;
&lt;table class=&quot;table table-nowrap&quot;&gt;
    &lt;thead class=&quot;table-light &quot;&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;col&quot;&gt;Id&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Name&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Job Title&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Date&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Payment&lt;/th&gt;
        &lt;/tr&gt;
    &lt;/thead&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;1&lt;/th&gt;
            &lt;td&gt;Annette Black&lt;/td&gt;
            &lt;td&gt;Industrial Designer&lt;/td&gt;
            &lt;td&gt;10, Nov 2021&lt;/td&gt;
            &lt;td&gt;$450&lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;2&lt;/th&gt;
            &lt;td&gt;Bessie Cooper&lt;/td&gt;
            &lt;td&gt;Graphic Designer&lt;/td&gt;
            &lt;td&gt;13, Nov 2021&lt;/td&gt;
            &lt;td&gt;$875&lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;3&lt;/th&gt;
            &lt;td&gt;Leslie Alexander&lt;/td&gt;
            &lt;td&gt;Product Manager&lt;/td&gt;
            &lt;td&gt;17, Nov 2021&lt;/td&gt;
            &lt;td&gt;$410&lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
    &lt;tfoot class=&quot;table-light&quot;&gt;
        &lt;tr&gt;
            &lt;td colspan=&quot;4&quot;&gt;Total&lt;/td&gt;
            &lt;td&gt;$940&lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tfoot&gt;
&lt;/table&gt;</code>
                              </pre>
                            </div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>                      <!-- end col -->

                      <div class="col-xl-6">
                        <div class="card">
                          <div class="card-header align-items-center d-flex">
                            <h4 class="card-title mb-0 flex-grow-1">Captions</h4>
                            <div class="flex-shrink-0">
                              <div class="form-check form-switch form-switch-right form-switch-md">
                                <label for="tables-caption-showcode" class="form-label text-muted">Show Code</label>
                                <input class="form-check-input code-switcher" type="checkbox" id="tables-caption-showcode"/>
                              </div>
                            </div>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <p class="text-muted">You can also put the <code>&lt;caption&gt;</code> attribute on the top of the table with <code>caption-top</code> class.</p>

                            <div class="live-preview">
                              <div class="table-responsive">
                                <table class="table caption-top table-nowrap mb-0">
                                  <caption>List of users</caption>
                                  <thead class="table-light">
                                    <tr>
                                      <th scope="col">ID</th>
                                      <th scope="col">Student</th>
                                      <th scope="col">Course</th>
                                      <th scope="col">Author</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <tr>
                                      <td class="fw-medium">01</td>
                                      <td>Milana Scot</td>
                                      <td>UI/UX design</td>
                                      <td>Mitchell Flores</td>
                                    </tr>
                                    <tr>
                                      <td class="fw-medium">02</td>
                                      <td>Jassica Welsh</td>
                                      <td>3d Animation</td>
                                      <td>Dan Evgeni</td>
                                    </tr>
                                    <tr>
                                      <td class="fw-medium">03</td>
                                      <td>Leslie Alexander</td>
                                      <td>Logotype Design</td>
                                      <td>Olimpia Jordan</td>
                                    </tr>
                                  </tbody>
                                </table>
                              </div>
                            </div>
                            <div class="d-none code-view">
                              <pre class="language-markup" style="height: 275px;">
                                <code>&lt;!-- Captions --&gt;
&lt;table class=&quot;table caption-top table-nowrap&quot;&gt;
    &lt;thead class=&quot;table-light&quot;&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;col&quot;&gt;Id&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Name&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Job Title&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Date&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Payment&lt;/th&gt;  
        &lt;/tr&gt;
    &lt;/thead&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;1&lt;/th&gt;
            &lt;td&gt;Annette Black&lt;/td&gt;
            &lt;td&gt;Industrial Designer&lt;/td&gt;
            &lt;td&gt;10, Nov 2021&lt;/td&gt;
            &lt;td&gt;$450&lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;2&lt;/th&gt;
            &lt;td&gt;Bessie Cooper&lt;/td&gt;
            &lt;td&gt;Graphic Designer&lt;/td&gt;
            &lt;td&gt;13, Nov 2021&lt;/td&gt;
            &lt;td&gt;$875&lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;3&lt;/th&gt;
            &lt;td&gt;Leslie Alexander&lt;/td&gt;
            &lt;td&gt;Product Manager&lt;/td&gt;
            &lt;td&gt;17, Nov 2021&lt;/td&gt;
            &lt;td&gt;$410&lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
    &lt;tfoot class=&quot;table-light&quot;&gt;
        &lt;tr&gt;
            &lt;td colspan=&quot;4&quot;&gt;Total&lt;/td&gt;
            &lt;td&gt;$940&lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tfoot&gt;
&lt;/table&gt;</code>
                              </pre>
                            </div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>                      <!-- end col -->
                    </div>
                    <!--end row-->

                    <div class="row">
                      <div class="col-xl-6">
                        <div class="card">
                          <div class="card-header align-items-center d-flex">
                            <h4 class="card-title mb-0 flex-grow-1">Table Nesting</h4>
                            <div class="flex-shrink-0">
                              <div class="form-check form-switch form-switch-right form-switch-md">
                                <label for="tables-nesting-showcode" class="form-label text-muted">Show Code</label>
                                <input class="form-check-input code-switcher" type="checkbox" id="tables-nesting-showcode"/>
                              </div>
                            </div>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <p class="text-muted">Example of basic table nesting. Border styles, active styles, and table variants are not inherited by nested tables.</p>
                            <div class="live-preview">
                              <div class="table-responsive">
                                <table class="table table-nowrap mb-0">
                                  <thead class="table-light">
                                    <tr>
                                      <th scope="col">ID</th>
                                      <th scope="col">Name</th>
                                      <th scope="col">Job Title</th>
                                      <th scope="col">Date</th>
                                      <th scope="col">Payment</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <tr>
                                      <td class="fw-medium">01</td>
                                      <td>Annette Black</td>
                                      <td>Industrial Designer</td>
                                      <td>10, Nov 2021</td>
                                      <td>$450</td>
                                    </tr>
                                    <tr>
                                      <td colspan="5">
                                        <table class="table table-nowrap mb-0">
                                          <thead class="table-light">
                                            <tr>
                                              <th scope="col">ID</th>
                                              <th scope="col">Student</th>
                                              <th scope="col">Course</th>
                                              <th scope="col">Author</th>
                                            </tr>
                                          </thead>
                                          <tbody>
                                            <tr>
                                              <td class="fw-medium">I</td>
                                              <td>Milana Scot</td>
                                              <td>3d Animation</td>
                                              <td>James Black</td>
                                            </tr>
                                            <tr>
                                              <td class="fw-medium">II</td>
                                              <td>Juston Eichmann</td>
                                              <td>Design syntax</td>
                                              <td>Olimpia Jordan</td>
                                            </tr>
                                          </tbody>
                                        </table>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td class="fw-medium">02</td>
                                      <td>Bessie Cooper</td>
                                      <td>Graphic Designer</td>
                                      <td>13, Nov 2021</td>
                                      <td>$875</td>
                                    </tr>
                                    <tr>
                                      <td class="fw-medium">03</td>
                                      <td>Leslie Alexander</td>
                                      <td>Product Manager</td>
                                      <td>16, Nov 2021</td>
                                      <td>$410</td>
                                    </tr>
                                    <tr>
                                      <td class="fw-medium">04</td>
                                      <td>Bettie Johson</td>
                                      <td>Applications Engineer</td>
                                      <td>24, Nov 2021</td>
                                      <td>$620</td>
                                    </tr>
                                    <tr>
                                      <td class="fw-medium">05</td>
                                      <td>Monkey Karry</td>
                                      <td>Implement new UX</td>
                                      <td>25, Nov 2021</td>
                                      <td>$795</td>
                                    </tr>
                                  </tbody>
                                </table>
                              </div>
                            </div>
                            <div class="d-none code-view">
                              <pre class="language-markup" style="height: 275px;">
                                <code>&lt;!-- Table Nesting --&gt;
&lt;table class=&quot;table table-nowrap&quot;&gt;
    &lt;thead class=&quot;table-light&quot;&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;col&quot;&gt;#&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Name&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Job Title&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Date&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Payment&lt;/th&gt;
        &lt;/tr&gt;
    &lt;/thead&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;1&lt;/th&gt;
            &lt;td&gt;Annette Black&lt;/td&gt;
            &lt;td&gt;Industrial Designer&lt;/td&gt;
            &lt;td&gt;10, Nov 2021&lt;/td&gt;
            &lt;td&gt;$450&lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;td colspan=&quot;5&quot;&gt;
                &lt;table class=&quot;table table-nowrap mb-0&quot;&gt;
                    &lt;thead class=&quot;table-light&quot;&gt;
                        &lt;tr&gt;
                            &lt;th scope=&quot;col&quot;&gt;#&lt;/th&gt;
                            &lt;th scope=&quot;col&quot;&gt;Student&lt;/th&gt;
                            &lt;th scope=&quot;col&quot;&gt;Course&lt;/th&gt;
                            &lt;th scope=&quot;col&quot;&gt;Author&lt;/th&gt;
                        &lt;/tr&gt;
                    &lt;/thead&gt;
                    &lt;tbody&gt;
                        &lt;tr&gt;
                            &lt;th scope=&quot;row&quot;&gt;1&lt;/th&gt;
                            &lt;td&gt;Milana Scot&lt;/td&gt;
                            &lt;td&gt;3d Animation&lt;/td&gt;
                            &lt;td&gt;James Black&lt;/td&gt;
                        &lt;/tr&gt;
                        &lt;tr&gt;
                            &lt;th scope=&quot;row&quot;&gt;2&lt;/th&gt;
                            &lt;td&gt;Juston Eichmann&lt;/td&gt;
                            &lt;td&gt;Design syntax&lt;/td&gt;
                            &lt;td&gt;Olimpia Jordan&lt;/td&gt;
                        &lt;/tr&gt;
                    &lt;/tbody&gt;
                &lt;/table&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;2&lt;/th&gt;
            &lt;td&gt;Bessie Cooper&lt;/td&gt;
            &lt;td&gt;Graphic Designer&lt;/td&gt;
            &lt;td&gt;13, Nov 2021&lt;/td&gt;
            &lt;td&gt;$875&lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;3&lt;/th&gt;
            &lt;td&gt;Leslie Alexander&lt;/td&gt;
            &lt;td&gt;Product Manager&lt;/td&gt;
            &lt;td&gt;16, Nov 2021&lt;/td&gt;
            &lt;td&gt;$410&lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;4&lt;/th&gt;
            &lt;td&gt;Bettie Johson&lt;/td&gt;
            &lt;td&gt;Applications Engineer&lt;/td&gt;
            &lt;td&gt;24, Nov 2021&lt;/td&gt;
            &lt;td&gt;$620&lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;row&quot;&gt;5&lt;/th&gt;
            &lt;td&gt;Monkey Karry&lt;/td&gt;
            &lt;td&gt;Implement new UX&lt;/td&gt;
            &lt;td&gt;25, Nov 2021&lt;/td&gt;
            &lt;td&gt;$795&lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;</code>
                              </pre>
                            </div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>                      <!-- end col -->

                      <div class="col-xl-6">
                        <div class="card">
                          <div class="card-header align-items-center d-flex">
                            <h4 class="card-title mb-0 flex-grow-1">Variants</h4>
                            <div class="flex-shrink-0">
                              <div class="form-check form-switch form-switch-right form-switch-md">
                                <label for="variants-showcode" class="form-label text-muted">Show Code</label>
                                <input class="form-check-input code-switcher" type="checkbox" id="variants-showcode"/>
                              </div>
                            </div>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <p class="text-muted">Use <code>table-</code> class with below-mentioned color variation class within &lt;tr&gt; to set color on table row.</p>

                            <div class="live-preview">
                              <div class="table-responsive">
                                <table class="table table-nowrap mb-0">
                                  <thead>
                                    <tr>
                                      <th scope="col">#</th>
                                      <th scope="col">Name</th>
                                      <th scope="col">Position</th>
                                      <th scope="col">Department</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <tr>
                                      <td>Default</td>
                                      <td>Monkey Karry</td>
                                      <td>Medical Specialist</td>
                                      <td>Orthopedics</td>
                                    </tr>
                                    <tr class="table-primary">
                                      <td>Primary</td>
                                      <td>James White</td>
                                      <td>Medical Assistant</td>
                                      <td>Surgery</td>
                                    </tr>
                                    <tr class="table-secondary">
                                      <td>Secondary</td>
                                      <td>Aaron James</td>
                                      <td>Medical Specialist</td>
                                      <td>Neurology</td>
                                    </tr>
                                    <tr class="table-success">
                                      <td>Success</td>
                                      <td>Bettie Johson</td>
                                      <td>Medical Specialist</td>
                                      <td>Cardiology</td>
                                    </tr>
                                    <tr class="table-danger">
                                      <td>Danger</td>
                                      <td>Bessie Cooper</td>
                                      <td>Medical Assistant</td>
                                      <td>Surgery</td>
                                    </tr>
                                    <tr class="table-warning">
                                      <td>Warning</td>
                                      <td>Lenora Sandoval</td>
                                      <td>Medical Assistant</td>
                                      <td>Cardiology</td>
                                    </tr>
                                    <tr class="table-info">
                                      <td>Info</td>
                                      <td>Eric Pierce</td>
                                      <td>Medical Specialist</td>
                                      <td>Neurology</td>
                                    </tr>
                                    <tr class="table-light">
                                      <td>Light</td>
                                      <td>Ruth Zimmermann</td>
                                      <td>Medical Specialist</td>
                                      <td>Neurology</td>
                                    </tr>
                                    <tr class="table-dark">
                                      <td>Dark</td>
                                      <td>Leslie Alexander</td>
                                      <td>Medical Assistant</td>
                                      <td>Cardiology</td>
                                    </tr>
                                  </tbody>
                                </table>
                              </div>
                            </div>
                            <div class="d-none code-view">
                              <pre class="language-markup" style="height: 275px;">
                                <code>&lt;!-- Variants --&gt;
&lt;table class=&quot;table table-nowrap&quot;&gt;
    &lt;thead&gt;
        &lt;tr&gt;
            &lt;th scope=&quot;col&quot;&gt;#&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Name&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Position&lt;/th&gt;
            &lt;th scope=&quot;col&quot;&gt;Department&lt;/th&gt;
        &lt;/tr&gt;
    &lt;/thead&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;td&gt;Default&lt;/td&gt;
            &lt;td&gt;Monkey Karry&lt;/td&gt;
            &lt;td&gt;Medical Specialist&lt;/td&gt;
            &lt;td&gt;Orthopedics&lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr class=&quot;table-primary&quot;&gt;
            &lt;td&gt;Primary&lt;/td&gt;
            &lt;td&gt;James White&lt;/td&gt;
            &lt;td&gt;Medical Assistant&lt;/td&gt;
            &lt;td&gt;Surgery&lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr class=&quot;table-secondary&quot;&gt;
            &lt;td&gt;Secondary&lt;/td&gt;
            &lt;td&gt;Aaron James&lt;/td&gt;
            &lt;td&gt;Medical Specialist&lt;/td&gt;
            &lt;td&gt;Neurology&lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr class=&quot;table-success&quot;&gt;
            &lt;td&gt;Success&lt;/td&gt;
            &lt;td&gt;Bettie Johson&lt;/td&gt;
            &lt;td&gt;Medical Specialist&lt;/td&gt;
            &lt;td&gt;Cardiology&lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr class=&quot;table-danger&quot;&gt;
            &lt;td&gt;Danger&lt;/td&gt;
            &lt;td&gt;Bessie Cooper&lt;/td&gt;
            &lt;td&gt;Medical Assistant&lt;/td&gt;
            &lt;td&gt;Surgery&lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr class=&quot;table-warning&quot;&gt;
            &lt;td&gt;Warning&lt;/td&gt;
            &lt;td&gt;Lenora Sandoval&lt;/td&gt;
            &lt;td&gt;Medical Assistant&lt;/td&gt;
            &lt;td&gt;Cardiology&lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr class=&quot;table-info&quot;&gt;
            &lt;td&gt;Info&lt;/td&gt;
            &lt;td&gt;Eric Pierce&lt;/td&gt;
            &lt;td&gt;Medical Specialist&lt;/td&gt;
            &lt;td&gt;Neurology&lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr class=&quot;table-light&quot;&gt;
            &lt;td&gt;Light&lt;/td&gt;
            &lt;td&gt;Ruth Zimmermann&lt;/td&gt;
            &lt;td&gt;Medical Specialist&lt;/td&gt;
            &lt;td&gt;Neurology&lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr class=&quot;table-dark&quot;&gt;
            &lt;td&gt;Dark&lt;/td&gt;
            &lt;td&gt;Leslie Alexander&lt;/td&gt;
            &lt;td&gt;Medical Assistant&lt;/td&gt;
            &lt;td&gt;Cardiology&lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;</code>
                              </pre>
                            </div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>                      <!-- end col -->
                    </div>
                    <!--end row-->

                    <div class="row">
                      <div class="col-xl-12">
                        <div class="card">
                          <div class="card-header align-items-center d-flex">
                            <h4 class="card-title mb-0 flex-grow-1">Vertical alignment</h4>
                            <div class="flex-shrink-0">
                              <div class="form-check form-switch form-switch-right form-switch-md">
                                <label for="vertical-table-showcode" class="form-label text-muted">Show Code</label>
                                <input class="form-check-input code-switcher" type="checkbox" id="vertical-table-showcode"/>
                              </div>
                            </div>
                          </div>                          <!-- end card header -->

                          <div class="card-body">

                            <p class="text-muted">Table cells of <code>&lt;thead&gt;</code> are always vertical aligned to the bottom. Table cells in <code>&lt;tbody&gt;</code> inherit their alignment from <code>&lt;table&gt;</code> and are aligned to the the top by default. Use the vertical align classes to re-align where needed.</p>

                            <div class="live-preview">
                              <div class="table-responsive">
                                <table class="table align-middle">
                                  <thead>
                                    <tr>
                                      <th>Heading</th>
                                      <th>Heading</th>
                                      <th>Heading</th>
                                      <th>Heading</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <tr>
                                      <td>This cell inherits <code>vertical-align: middle;</code> from the table</td>
                                      <td>This cell inherits <code>vertical-align: middle;</code> from the table</td>
                                      <td>This cell inherits <code>vertical-align: middle;</code> from the table</td>
                                      <td>This here is some placeholder text, intended to take up quite a bit of vertical space, to demonstrate how the vertical alignment works in the preceding cells. Use the vertical align classes to re-align where needed. inherit their alignment from and are aligned to the the top by default.</td>
                                    </tr>
                                    <tr class="align-bottom">
                                      <td>This cell inherits <code>vertical-align: bottom;</code> from the table row</td>
                                      <td>This cell inherits <code>vertical-align: bottom;</code> from the table row</td>
                                      <td>This cell inherits <code>vertical-align: bottom;</code> from the table row</td>
                                      <td>This here is some placeholder text, intended to take up quite a bit of vertical space, to demonstrate how the vertical alignment works in the preceding cells. Use the vertical align classes to re-align where needed. inherit their alignment from and are aligned to the the top by default.</td>
                                    </tr>
                                    <tr>
                                      <td>This cell inherits <code>vertical-align: middle;</code> from the table</td>
                                      <td>This cell inherits <code>vertical-align: middle;</code> from the table</td>
                                      <td class="align-top">This cell is aligned to the top.</td>
                                      <td>This here is some placeholder text, intended to take up quite a bit of vertical space, to demonstrate how the vertical alignment works in the preceding cells. Use the vertical align classes to re-align where needed. inherit their alignment from and are aligned to the the top by default.</td>
                                    </tr>
                                  </tbody>
                                </table>
                              </div>
                            </div>
                            <div class="d-none code-view">
                              <pre class="language-markup" style="height: 275px;">
                                <code>&lt;!-- Vertical alignment --&gt;
&lt;div class=&quot;table-responsive&quot;&gt;
    &lt;table class=&quot;table align-middle&quot;&gt;
        &lt;thead&gt;
            &lt;tr&gt;
                ...
            &lt;/tr&gt;
        &lt;/thead&gt;
        &lt;tbody&gt;
            &lt;tr&gt;
                ...
            &lt;/tr&gt;
            &lt;tr class=&quot;align-bottom&quot;&gt;
                ...
            &lt;/tr&gt;
            &lt;tr&gt;
                &lt;td&gt;...&lt;/td&gt;
                &lt;td&gt;...&lt;/td&gt;
                &lt;td class=&quot;align-top&quot;&gt;This cell is aligned to the top.&lt;/td&gt;
                &lt;td&gt;...&lt;/td&gt;
            &lt;/tr&gt;
        &lt;/tbody&gt;
    &lt;/table&gt;
&lt;/div&gt;</code>
                              </pre>
                            </div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>                      <!-- end col -->
                    </div>
                    <!--end row-->

                    <div class="row">
                      <div class="col-xl-12">
                        <div class="card">
                          <div class="card-header align-items-center d-flex">
                            <h4 class="card-title mb-0 flex-grow-1">Responsive Tables</h4>
                            <div class="flex-shrink-0">
                              <div class="form-check form-switch form-switch-right form-switch-md">
                                <label for="responsive-table-showcode" class="form-label text-muted">Show Code</label>
                                <input class="form-check-input code-switcher" type="checkbox" id="responsive-table-showcode"/>
                              </div>
                            </div>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <p class="text-muted">Use <code>table-responsive</code> class to make any table responsive across all viewports. Responsive tables allow tables to be scrolled horizontally with ease.</p>
                            <div class="live-preview">
                              <div class="table-responsive">
                                <table class="table align-middle table-nowrap mb-0">
                                  <thead class="table-light">
                                    <tr>
                                      <th scope="col" style="width: 42px;">
                                        <div class="form-check">
                                          <input class="form-check-input" type="checkbox" value="" id="responsivetableCheck"/>
                                          <label class="form-check-label" for="responsivetableCheck"></label>
                                        </div>
                                      </th>
                                      <th scope="col">ID</th>
                                      <th scope="col">Date</th>
                                      <th scope="col">Status</th>
                                      <th scope="col">Customer</th>
                                      <th scope="col">Purchased</th>
                                      <th scope="col">Revenue</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <tr>
                                      <th scope="row">
                                        <div class="form-check">
                                          <input class="form-check-input" type="checkbox" value="" id="responsivetableCheck01"/>
                                          <label class="form-check-label" for="responsivetableCheck01"></label>
                                        </div>
                                      </th>
                                      <td>
                                        <a href="#" class="fw-medium">#VZ2110</a>
                                      </td>
                                      <td>10 Oct, 14:47</td>
                                      <td class="text-success">
                                        <i class="ri-checkbox-circle-line fs-17 align-middle"></i> Paid</td>
                                      <td>
                                        <div class="d-flex gap-2 align-items-center">
                                          <div class="flex-shrink-0">
                                            <img src="{$themePath}/assets/images/users/avatar-3.jpg" alt="" class="avatar-xs rounded-circle" />
                                          </div>
                                          <div class="flex-grow-1">
                                                                    Jordan Kennedy
                                          </div>
                                        </div>
                                      </td>
                                      <td>Mastering the grid</td>
                                      <td>$9.98</td>
                                    </tr>
                                    <tr>
                                      <th scope="row">
                                        <div class="form-check">
                                          <input class="form-check-input" type="checkbox" value="" id="responsivetableCheck02"/>
                                          <label class="form-check-label" for="responsivetableCheck02"></label>
                                        </div>
                                      </th>
                                      <td>
                                        <a href="#" class="fw-medium">#VZ2109</a>
                                      </td>
                                      <td>17 Oct, 02:10</td>
                                      <td class="text-success">
                                        <i class="ri-checkbox-circle-line fs-17 align-middle"></i> Paid</td>
                                      <td>
                                        <div class="d-flex gap-2 align-items-center">
                                          <div class="flex-shrink-0">
                                            <img src="{$themePath}/assets/images/users/avatar-4.jpg" alt="" class="avatar-xs rounded-circle" />
                                          </div>
                                          <div class="flex-grow-1">
                                                                    Jackson Graham
                                          </div>
                                        </div>
                                      </td>
                                      <td>Splashify</td>
                                      <td>$270.60</td>
                                    </tr>
                                    <tr>
                                      <th scope="row">
                                        <div class="form-check">
                                          <input class="form-check-input" type="checkbox" value="" id="responsivetableCheck03"/>
                                          <label class="form-check-label" for="responsivetableCheck03"></label>
                                        </div>
                                      </th>
                                      <td>
                                        <a href="#" class="fw-medium">#VZ2108</a>
                                      </td>
                                      <td>26 Oct, 08:20</td>
                                      <td class="text-primary">
                                        <i class="ri-refresh-line fs-17 align-middle"></i> Refunded</td>
                                      <td>
                                        <div class="d-flex gap-2 align-items-center">
                                          <div class="flex-shrink-0">
                                            <img src="{$themePath}/assets/images/users/avatar-5.jpg" alt="" class="avatar-xs rounded-circle" />
                                          </div>
                                          <div class="flex-grow-1">
                                                                    Lauren Trujillo
                                          </div>
                                        </div>
                                      </td>
                                      <td>Wireframing Kit for Figma</td>
                                      <td>$145.42</td>
                                    </tr>
                                    <tr>
                                      <th scope="row">
                                        <div class="form-check">
                                          <input class="form-check-input" type="checkbox" value="" id="responsivetableCheck04"/>
                                          <label class="form-check-label" for="responsivetableCheck04"></label>
                                        </div>
                                      </th>
                                      <td>
                                        <a href="#" class="fw-medium">#VZ2107</a>
                                      </td>
                                      <td>02 Nov, 04:52</td>
                                      <td class="text-danger">
                                        <i class="ri-close-circle-line fs-17 align-middle"></i> Cancel</td>
                                      <td>
                                        <div class="d-flex gap-2 align-items-center">
                                          <div class="flex-shrink-0">
                                            <img src="{$themePath}/assets/images/users/avatar-6.jpg" alt="" class="avatar-xs rounded-circle" />
                                          </div>
                                          <div class="flex-grow-1">
                                                                    Curtis Weaver
                                          </div>
                                        </div>
                                      </td>
                                      <td>Wireframing Kit for Figma</td>
                                      <td>$170.68</td>
                                    </tr>
                                    <tr>
                                      <th scope="row">
                                        <div class="form-check">
                                          <input class="form-check-input" type="checkbox" value="" id="responsivetableCheck05"/>
                                          <label class="form-check-label" for="responsivetableCheck05"></label>
                                        </div>
                                      </th>
                                      <td>
                                        <a href="#" class="fw-medium">#VZ2106</a>
                                      </td>
                                      <td>10 Nov, 07:20</td>
                                      <td class="text-success">
                                        <i class="ri-checkbox-circle-line fs-17 align-middle"></i> Paid</td>
                                      <td>
                                        <div class="d-flex gap-2 align-items-center">
                                          <div class="flex-shrink-0">
                                            <img src="{$themePath}/assets/images/users/avatar-1.jpg" alt="" class="avatar-xs rounded-circle" />
                                          </div>
                                          <div class="flex-grow-1">
                                                                    Jason schuller
                                          </div>
                                        </div>
                                      </td>
                                      <td>Splashify</td>
                                      <td>$350.87</td>
                                    </tr>
                                  </tbody>
                                  <tfoot class="table-light">
                                    <tr>
                                      <td colspan="6">Total</td>
                                      <td>$947.55</td>
                                    </tr>
                                  </tfoot>
                                </table>
                                <!-- end table -->
                              </div>
                              <!-- end table responsive -->
                            </div>
                            <div class="d-none code-view">
                              <pre class="language-markup" style="height: 275px;">
                                <code>&lt;div class=&quot;table-responsive&quot;&gt;
    &lt;table class=&quot;table align-middle mb-0&quot;&gt;
        &lt;thead class=&quot;table-light&quot;&gt;
            &lt;tr&gt;
                &lt;th scope=&quot;col&quot;&gt;
                    &lt;div class=&quot;form-check&quot;&gt;
                        &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; value=&quot;&quot; id=&quot;responsivetableCheck&quot;&gt;
                        &lt;label class=&quot;form-check-label&quot; for=&quot;responsivetableCheck&quot;&gt;&lt;/label&gt;
                    &lt;/div&gt;
                &lt;/th&gt;
                &lt;th scope=&quot;col&quot;&gt;#&lt;/th&gt;
                &lt;th scope=&quot;col&quot;&gt;Date&lt;/th&gt;
                &lt;th scope=&quot;col&quot;&gt;Status&lt;/th&gt;
                &lt;th scope=&quot;col&quot;&gt;Customer&lt;/th&gt;
                &lt;th scope=&quot;col&quot;&gt;Purchased&lt;/th&gt;
                &lt;th scope=&quot;col&quot;&gt;Revenue&lt;/th&gt;
            &lt;/tr&gt;
        &lt;/thead&gt;
        &lt;tbody&gt;
            &lt;tr&gt;
                &lt;th scope=&quot;row&quot;&gt;
                    &lt;div class=&quot;form-check&quot;&gt;
                        &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; value=&quot;&quot; id=&quot;responsivetableCheck01&quot;&gt;
                        &lt;label class=&quot;form-check-label&quot; for=&quot;responsivetableCheck01&quot;&gt;&lt;/label&gt;
                    &lt;/div&gt;
                &lt;/th&gt;
                &lt;td&gt;&lt;a href=&quot;#&quot; class=&quot;fw-semibold&quot;&gt;#VZ2110&lt;/a&gt;&lt;/td&gt;
                &lt;td&gt;10 Oct, 14:47&lt;/td&gt;
                &lt;td class=&quot;text-success&quot;&gt;&lt;i class=&quot;ri-checkbox-circle-line fs-17 align-middle&quot;&gt;&lt;/i&gt; Paid&lt;/td&gt;
                &lt;td&gt;
                    &lt;div class=&quot;d-flex gap-2 align-items-center&quot;&gt;
                        &lt;div class=&quot;flex-shrink-0&quot;&gt;
                            &lt;img src=&quot;{$themePath}/assets/images/users/avatar-3.jpg&quot; alt=&quot;&quot; class=&quot;avatar-xs rounded-circle&quot; /&gt;
                        &lt;/div&gt;
                        &lt;div class=&quot;flex-grow-1&quot;&gt;
                            Jordan Kennedy
                        &lt;/div&gt;
                    &lt;/div&gt;
                &lt;/td&gt;
                &lt;td&gt;Mastering the grid&lt;/td&gt;
                &lt;td&gt;$9.98&lt;/td&gt;
            &lt;/tr&gt;
            &lt;tr&gt;
                &lt;th scope=&quot;row&quot;&gt;
                    &lt;div class=&quot;form-check&quot;&gt;
                        &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; value=&quot;&quot; id=&quot;responsivetableCheck02&quot;&gt;
                        &lt;label class=&quot;form-check-label&quot; for=&quot;responsivetableCheck02&quot;&gt;&lt;/label&gt;
                    &lt;/div&gt;
                &lt;/th&gt;
                &lt;td&gt;&lt;a href=&quot;#&quot; class=&quot;fw-semibold&quot;&gt;#VZ2109&lt;/a&gt;&lt;/td&gt;
                &lt;td&gt;17 Oct, 02:10&lt;/td&gt;
                &lt;td class=&quot;text-success&quot;&gt;&lt;i class=&quot;ri-checkbox-circle-line fs-17 align-middle&quot;&gt;&lt;/i&gt; Paid&lt;/td&gt;
                &lt;td&gt;
                    &lt;div class=&quot;d-flex gap-2 align-items-center&quot;&gt;
                        &lt;div class=&quot;flex-shrink-0&quot;&gt;
                            &lt;img src=&quot;{$themePath}/assets/images/users/avatar-4.jpg&quot; alt=&quot;&quot; class=&quot;avatar-xs rounded-circle&quot; /&gt;
                        &lt;/div&gt;
                        &lt;div class=&quot;flex-grow-1&quot;&gt;
                            Jackson Graham
                        &lt;/div&gt;
                    &lt;/div&gt;
                &lt;/td&gt;
                &lt;td&gt;Splashify&lt;/td&gt;
                &lt;td&gt;$270.60&lt;/td&gt;
            &lt;/tr&gt;
            &lt;tr&gt;
                &lt;th scope=&quot;row&quot;&gt;
                    &lt;div class=&quot;form-check&quot;&gt;
                        &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; value=&quot;&quot; id=&quot;responsivetableCheck03&quot;&gt;
                        &lt;label class=&quot;form-check-label&quot; for=&quot;responsivetableCheck03&quot;&gt;&lt;/label&gt;
                    &lt;/div&gt;
                &lt;/th&gt;
                &lt;td&gt;&lt;a href=&quot;#&quot; class=&quot;fw-semibold&quot;&gt;#VZ2108&lt;/a&gt;&lt;/td&gt;
                &lt;td&gt;26 Oct, 08:20&lt;/td&gt;
                &lt;td class=&quot;text-primary&quot;&gt;&lt;i class=&quot;ri-refresh-line fs-17 align-middle&quot;&gt;&lt;/i&gt; Refunded&lt;/td&gt;
                &lt;td&gt;
                    &lt;div class=&quot;d-flex gap-2 align-items-center&quot;&gt;
                        &lt;div class=&quot;flex-shrink-0&quot;&gt;
                            &lt;img src=&quot;{$themePath}/assets/images/users/avatar-5.jpg&quot; alt=&quot;&quot; class=&quot;avatar-xs rounded-circle&quot; /&gt;
                        &lt;/div&gt;
                        &lt;div class=&quot;flex-grow-1&quot;&gt;
                            Lauren Trujillo
                        &lt;/div&gt;
                    &lt;/div&gt;
                &lt;/td&gt;
                &lt;td&gt;Wireframing Kit for Figma&lt;/td&gt;
                &lt;td&gt;$145.42&lt;/td&gt;
            &lt;/tr&gt;
            &lt;tr&gt;
                &lt;th scope=&quot;row&quot;&gt;
                    &lt;div class=&quot;form-check&quot;&gt;
                        &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; value=&quot;&quot; id=&quot;responsivetableCheck04&quot;&gt;
                        &lt;label class=&quot;form-check-label&quot; for=&quot;responsivetableCheck04&quot;&gt;&lt;/label&gt;
                    &lt;/div&gt;
                &lt;/th&gt;
                &lt;td&gt;&lt;a href=&quot;#&quot; class=&quot;fw-semibold&quot;&gt;#VZ2107&lt;/a&gt;&lt;/td&gt;
                &lt;td&gt;02 Nov, 04:52&lt;/td&gt;
                &lt;td class=&quot;text-danger&quot;&gt;&lt;i class=&quot;ri-close-circle-line fs-17 align-middle&quot;&gt;&lt;/i&gt; Cancel&lt;/td&gt;
                &lt;td&gt;
                    &lt;div class=&quot;d-flex gap-2 align-items-center&quot;&gt;
                        &lt;div class=&quot;flex-shrink-0&quot;&gt;
                            &lt;img src=&quot;{$themePath}/assets/images/users/avatar-6.jpg&quot; alt=&quot;&quot; class=&quot;avatar-xs rounded-circle&quot; /&gt;
                        &lt;/div&gt;
                        &lt;div class=&quot;flex-grow-1&quot;&gt;
                            Curtis Weaver
                        &lt;/div&gt;
                    &lt;/div&gt;
                &lt;/td&gt;
                &lt;td&gt;Wireframing Kit for Figma&lt;/td&gt;
                &lt;td&gt;$170.68&lt;/td&gt;
            &lt;/tr&gt;
            &lt;tr&gt;
                &lt;th scope=&quot;row&quot;&gt;
                    &lt;div class=&quot;form-check&quot;&gt;
                        &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; value=&quot;&quot; id=&quot;responsivetableCheck05&quot;&gt;
                        &lt;label class=&quot;form-check-label&quot; for=&quot;responsivetableCheck05&quot;&gt;&lt;/label&gt;
                    &lt;/div&gt;
                &lt;/th&gt;
                &lt;td&gt;&lt;a href=&quot;#&quot; class=&quot;fw-semibold&quot;&gt;#VZ2106&lt;/a&gt;&lt;/td&gt;
                &lt;td&gt;10 Nov, 07:20&lt;/td&gt;
                &lt;td class=&quot;text-success&quot;&gt;&lt;i class=&quot;ri-checkbox-circle-line fs-17 align-middle&quot;&gt;&lt;/i&gt; Paid&lt;/td&gt;
                &lt;td&gt;
                    &lt;div class=&quot;d-flex gap-2 align-items-center&quot;&gt;
                        &lt;div class=&quot;flex-shrink-0&quot;&gt;
                            &lt;img src=&quot;{$themePath}/assets/images/users/avatar-1.jpg&quot; alt=&quot;&quot; class=&quot;avatar-xs rounded-circle&quot; /&gt;
                        &lt;/div&gt;
                        &lt;div class=&quot;flex-grow-1&quot;&gt;
                            Jason schuller
                        &lt;/div&gt;
                    &lt;/div&gt;
                &lt;/td&gt;
                &lt;td&gt;Splashify&lt;/td&gt;
                &lt;td&gt;$350.87&lt;/td&gt;
            &lt;/tr&gt;
        &lt;/tbody&gt;
        &lt;tfoot class=&quot;table-light&quot;&gt;
            &lt;tr&gt;
                &lt;td colspan=&quot;6&quot;&gt;Total&lt;/td&gt;
                &lt;td&gt;$947.55&lt;/td&gt;
            &lt;/tr&gt;
        &lt;/tfoot&gt;
    &lt;/table&gt;
    &lt;!-- end table --&gt;
&lt;/div&gt;
&lt;!-- end table responsive --&gt;</code>
                              </pre>
                            </div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>                      <!-- end col -->
                    </div>
                    <!--end row-->

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
  <xsl:include href="../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1515664208567"/>

</xsl:stylesheet>
