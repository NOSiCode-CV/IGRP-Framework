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
                            <h4 class="card-title mb-0">Grid Options</h4>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <p class="text-muted">See how aspects of the Bootstrap grid system work across multiple devices with a handy table.</p>
                            <div class="table-responsive">
                              <table class="table table-bordered table-nowrap mb-0">
                                <thead>
                                  <tr>
                                    <th scope="col"></th>
                                    <th scope="col" class="text-center">
                                                        xs<br/>
                                    <span class="fw-normal">&lt;576px</span>
                                  </th>
                                  <th scope="col" class="text-center">
                                                        sm<br/>
                                  <span class="fw-normal">≥576px</span>
                                </th>
                                <th scope="col" class="text-center">
                                                        md<br/>
                                <span class="fw-normal">≥768px</span>
                              </th>
                              <th scope="col" class="text-center">
                                                        lg<br/>
                              <span class="fw-normal">≥992px</span>
                            </th>
                            <th scope="col" class="text-center">
                                                        xl<br/>
                            <span class="fw-normal">≥1200px</span>
                          </th>
                          <th scope="col" class="text-center">
                                                        xxl<br/>
                          <span class="fw-normal">≥1400px</span>
                        </th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <th class="text-nowrap" scope="row">Grid behavior</th>
                        <td>Horizontal at all times</td>
                        <td colspan="5">Collapsed to start, horizontal above breakpoints</td>
                      </tr>
                      <tr>
                        <th class="text-nowrap" scope="row">Max container width</th>
                        <td>None (auto)</td>
                        <td>540px</td>
                        <td>720px</td>
                        <td>960px</td>
                        <td>1140px</td>
                        <td>1320px</td>
                      </tr>
                      <tr>
                        <th class="text-nowrap" scope="row">Class prefix</th>
                        <td>
                          <code>col-</code>
                        </td>
                        <td>
                          <code>col-sm-</code>
                        </td>
                        <td>
                          <code>col-md-</code>
                        </td>
                        <td>
                          <code>col-lg-</code>
                        </td>
                        <td>
                          <code>col-xl-</code>
                        </td>
                        <td>
                          <code>col-xxl-</code>
                        </td>
                      </tr>
                      <tr>
                        <th class="text-nowrap" scope="row"># of columns</th>
                        <td colspan="6">12</td>
                      </tr>
                      <tr>
                        <th class="text-nowrap" scope="row">Gutter width</th>
                        <td colspan="6">24px (12px on each side of a column)</td>
                      </tr>
                      <tr>
                        <th class="text-nowrap" scope="row">Custom gutters</th>
                        <td colspan="6">Yes</td>
                      </tr>
                      <tr>
                        <th class="text-nowrap" scope="row">Nestable</th>
                        <td colspan="6">Yes</td>
                      </tr>
                      <tr>
                        <th class="text-nowrap" scope="row">Offsets</th>
                        <td colspan="6">Yes</td>
                      </tr>
                      <tr>
                        <th class="text-nowrap" scope="row">Column ordering</th>
                        <td colspan="6">Yes</td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>              <!-- end card body -->
            </div>            <!-- end card -->
          </div>          <!-- end col -->
        </div>        <!-- end row -->

        <div class="row">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-header align-items-center d-flex">
                <h4 class="card-title mb-0 flex-grow-1">Vertical alignment (align-items-start)</h4>
                <div class="flex-shrink-0">
                  <div class="form-check form-switch form-switch-right form-switch-md">
                    <label for="verticl-align-start" class="form-label text-muted">Show Code</label>
                    <input class="form-check-input code-switcher" type="checkbox" id="verticl-align-start"/>
                  </div>
                </div>
              </div>              <!-- end card header -->

              <div class="card-body">
                <p class="text-muted">Use <code>align-items-start</code> class to vertically align-items at the start.</p>
                <div class="live-preview">

                  <div class="bg-light p-3 text-center">
                    <div class="row align-items-start" style="min-height: 6rem;">
                      <div class="col-sm-4">
                        <div class="bg-soft-primary text-primary rounded p-2">
                                                        col-sm-4
                        </div>
                      </div>
                      <div class="col-sm-4">
                        <div class="bg-soft-primary text-primary rounded p-2 mt-2 mt-sm-0">
                                                        col-sm-4
                        </div>
                      </div>
                      <div class="col-sm-4">
                        <div class="bg-soft-primary text-primary rounded p-2 mt-2 mt-sm-0">
                                                        col-sm-4
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="d-none code-view">
                  <pre class="language-markup">
                    <code>&lt;!-- Vertical alignment (align-items-start) --&gt;
&lt;div class=&quot;row align-items-start&quot;&gt;
    &lt;div class=&quot;col-sm-4&quot;&gt;
        ...
    &lt;/div&gt;
    &lt;div class=&quot;col-sm-4&quot;&gt;
        ...
    &lt;/div&gt;
    &lt;div class=&quot;col-sm-4&quot;&gt;
        ...
    &lt;/div&gt;
&lt;/div&gt;</code>
                  </pre>
                </div>
              </div>              <!-- end card-body -->
            </div>            <!-- end card -->
          </div>
        </div>

        <div class="row">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-header align-items-center d-flex">
                <h4 class="card-title mb-0 flex-grow-1">Vertical alignment (align-items-center)</h4>
                <div class="flex-shrink-0">
                  <div class="form-check form-switch form-switch-right form-switch-md">
                    <label for="verticl-align-center" class="form-label text-muted">Show Code</label>
                    <input class="form-check-input code-switcher" type="checkbox" id="verticl-align-center"/>
                  </div>
                </div>
              </div>              <!-- end card header -->

              <div class="card-body">
                <p class="text-muted">Use <code>align-items-center</code> class to vertically align-items at the center.</p>

                <div class="live-preview">

                  <div class="bg-light p-3 text-center">
                    <div class="row align-items-center" style="min-height: 6rem;">
                      <div class="col-sm-4">
                        <div class="bg-soft-primary text-primary rounded p-2">
                                                        col-sm-4
                        </div>
                      </div>
                      <div class="col-sm-4">
                        <div class="bg-soft-primary text-primary rounded p-2 mt-2 mt-sm-0">
                                                        col-sm-4
                        </div>
                      </div>
                      <div class="col-sm-4">
                        <div class="bg-soft-primary text-primary rounded p-2 mt-2 mt-sm-0">
                                                        col-sm-4
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="d-none code-view">
                  <pre class="language-markup">
                    <code>&lt;!-- Vertical alignment (align-items-center) --&gt;
&lt;div class=&quot;row align-items-center&quot;&gt;
    &lt;div class=&quot;col-sm-4&quot;&gt;
        ...
    &lt;/div&gt;
    &lt;div class=&quot;col-sm-4&quot;&gt;
        ...
    &lt;/div&gt;
    &lt;div class=&quot;col-sm-4&quot;&gt;
        ...
    &lt;/div&gt;
&lt;/div&gt;</code>
                  </pre>
                </div>
              </div>              <!-- end card-body -->
            </div>            <!-- end card -->
          </div>
        </div>

        <div class="row">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-header align-items-center d-flex">
                <h4 class="card-title mb-0 flex-grow-1">Vertical alignment (align-items-end)</h4>
                <div class="flex-shrink-0">
                  <div class="form-check form-switch form-switch-right form-switch-md">
                    <label for="default" class="form-label text-muted">Show Code</label>
                    <input class="form-check-input code-switcher" type="checkbox" id="default"/>
                  </div>
                </div>
              </div>              <!-- end card header -->

              <div class="card-body">
                <p class="text-muted">Use <code>align-items-end</code> class to vertically align-items at the end.</p>
                <div class="live-preview">
                  <div class="bg-light p-3 text-center">
                    <div class="row align-items-end" style="min-height: 6rem;">
                      <div class="col-sm-4">
                        <div class="bg-soft-primary text-primary rounded p-2">
                                                        col-sm-4
                        </div>
                      </div>
                      <div class="col-sm-4">
                        <div class="bg-soft-primary text-primary rounded p-2 mt-2 mt-sm-0">
                                                        col-sm-4
                        </div>
                      </div>
                      <div class="col-sm-4">
                        <div class="bg-soft-primary text-primary rounded p-2 mt-2 mt-sm-0">
                                                        col-sm-4
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="d-none code-view">
                  <pre class="language-markup">
                    <code>&lt;!-- Vertical alignment (align-items-end) --&gt;
&lt;div class=&quot;row align-items-end&quot;&gt;
    &lt;div class=&quot;col-sm-4&quot;&gt;
        ...
    &lt;/div&gt;
    &lt;div class=&quot;col-sm-4&quot;&gt;
        ...
    &lt;/div&gt;
    &lt;div class=&quot;col-sm-4&quot;&gt;
        ...
    &lt;/div&gt;
&lt;/div&gt;</code>
                  </pre>
                </div>
              </div>              <!-- end card-body -->
            </div>            <!-- end card -->
          </div>
        </div>

        <div class="row">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-header align-items-center d-flex">
                <h4 class="card-title mb-0 flex-grow-1">Align Self</h4>
                <div class="flex-shrink-0">
                  <div class="form-check form-switch form-switch-right form-switch-md">
                    <label for="align-self" class="form-label text-muted">Show Code</label>
                    <input class="form-check-input code-switcher" type="checkbox" id="align-self"/>
                  </div>
                </div>
              </div>              <!-- end card header -->

              <div class="card-body">
                <p class="text-muted">Use the <code>align-self-start</code>,                  <code>align-self-center</code>, or <code>align-self-end</code> class respectively to vertically align items with a different position.</p>

                <div class="live-preview">
                  <div class="bg-light p-3 text-center">
                    <div class="row g-2" style="min-height: 9rem;">
                      <div class="col-sm-4 align-self-start">
                        <div class="bg-soft-primary text-primary rounded p-2">
                                                        align-self-start
                        </div>
                      </div>
                      <div class="col-sm-4 align-self-center">
                        <div class="bg-soft-primary text-primary rounded p-2">
                                                        align-self-center
                        </div>
                      </div>
                      <div class="col-sm-4 align-self-end">
                        <div class="bg-soft-primary text-primary rounded p-2">
                                                        align-self-end
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="d-none code-view">
                  <pre class="language-markup">
                    <code>&lt;!-- Align Self --&gt;
&lt;div class=&quot;row&quot;&gt;
    &lt;div class=&quot;col-sm-4 align-self-start&quot;&gt;
        ...
    &lt;/div&gt;
    &lt;div class=&quot;col-sm-4 align-self-center&quot;&gt;
        ...
    &lt;/div&gt;
    &lt;div class=&quot;col-sm-4 align-self-end&quot;&gt;
        ...
    &lt;/div&gt;
&lt;/div&gt;</code>
                  </pre>
                </div>
              </div>              <!-- end card-body -->
            </div>            <!-- end card -->
          </div>
        </div>

        <div class="row">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-header align-items-center d-flex">
                <h4 class="card-title mb-0 flex-grow-1">Horizontal Alignment</h4>
                <div class="flex-shrink-0">
                  <div class="form-check form-switch form-switch-right form-switch-md">
                    <label for="horizontal-align" class="form-label text-muted">Show Code</label>
                    <input class="form-check-input code-switcher" type="checkbox" id="horizontal-align"/>
                  </div>
                </div>
              </div>              <!-- end card header -->

              <div class="card-body">
                <p class="text-muted">Use the <code>justify-content-start</code>,                  <code>justify-content-center</code>, or <code>justify-content-end</code> class respectively to horizontally align items with a different position.</p>
                <div class="live-preview">
                  <div class="bg-light p-3 text-center">
                    <div class="row justify-content-start">
                      <div class="col-sm-4">
                        <div class="bg-soft-primary text-primary rounded p-2">
                                                        justify-content-start
                        </div>
                      </div>
                    </div>
                    <div class="row justify-content-center">
                      <div class="col-sm-4">
                        <div class="bg-soft-primary text-primary rounded p-2 mt-2 mt-sm-0">
                                                        justify-content-center
                        </div>
                      </div>
                    </div>
                    <div class="row justify-content-end">
                      <div class="col-sm-4">
                        <div class="bg-soft-primary text-primary rounded p-2 mt-2 mt-sm-0">
                                                        justify-content-end
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="d-none code-view">
                  <pre class="language-markup">
                    <code>&lt;!-- Horizontal Alignment --&gt;
&lt;div class=&quot;row justify-content-start&quot;&gt;
    &lt;div class=&quot;col-sm-4&quot;&gt;
        ...
    &lt;/div&gt;
&lt;/div&gt;</code>
                    <code>&lt;div class=&quot;row justify-content-center&quot;&gt;
    &lt;div class=&quot;col-sm-4&quot;&gt;
        ...
    &lt;/div&gt;
&lt;/div&gt;</code>
                    <code>&lt;div class=&quot;row justify-content-end&quot;&gt;
    &lt;div class=&quot;col-sm-4&quot;&gt;
        ...
    &lt;/div&gt;
&lt;/div&gt;</code>
                  </pre>
                </div>
              </div>              <!-- end card-body -->
            </div>            <!-- end card -->
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
