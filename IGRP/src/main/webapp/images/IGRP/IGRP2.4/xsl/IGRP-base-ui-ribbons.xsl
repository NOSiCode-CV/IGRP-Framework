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
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header align-items-center d-flex">
                                    <h4 class="card-title mb-0 flex-grow-1">Rounded Ribbon</h4>
                                    <div class="flex-shrink-0">
                                        <div class="form-check form-switch form-switch-right form-switch-md">
                                            <label for="rounded-ribbon-showcode" class="form-label text-muted">Show Code</label>
                                            <input class="form-check-input code-switcher" type="checkbox" id="rounded-ribbon-showcode"></input>
                                        </div>
                                    </div>
                                </div><!-- end card header -->

                                <div class="card-body">

                                    <div class="live-preview">
                                        <div class="row g-3">
                                            <p class="text-muted">Use <code>round-shape</code> class to show round-shaped ribbon.</p>
                                            <div class="col-xxl-4">
                                                <div class="card ribbon-box border shadow-none mb-lg-0">
                                                    <div class="card-body">
                                                        <div class="ribbon ribbon-primary round-shape">Primary</div>
                                                        <h5 class="fs-14 text-end">Rounded Ribbon</h5>

                                                        <div class="ribbon-content mt-4 text-muted">
                                                            <p class="mb-0">Quisque nec turpis at urna dictum luctus. Suspendisse convallis dignissim eros at volutpat. In egestas
                                                                mattis dui. Aliquam mattis dictum aliquet. Nulla sapien mauris, eleifend et sem ac, commodo dapibus odio.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xxl-4">
                                                <div class="card ribbon-box border shadow-none mb-lg-0">
                                                    <div class="card-body">
                                                        <div class="ribbon ribbon-success round-shape">Success</div>
                                                        <h5 class="fs-14 text-end">Rounded Ribbon</h5>
                                                        <div class="ribbon-content mt-4 text-muted">
                                                            <p class="mb-0">Quisque nec turpis at urna dictum luctus. Suspendisse convallis dignissim eros at volutpat. In egestas
                                                                mattis dui. Aliquam mattis dictum aliquet. Nulla sapien mauris, eleifend et sem ac, commodo dapibus odio.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xxl-4">
                                                <!-- Right Ribbon -->
                                                <div class="card ribbon-box border shadow-none right mb-lg-0">
                                                    <div class="card-body">
                                                        <div class="ribbon ribbon-info round-shape">Info</div>
                                                        <h5 class="fs-14 text-start">Rounded Ribbon Right</h5>
                                                        <div class="ribbon-content mt-4 text-muted">
                                                            <p class="mb-0">Quisque nec turpis at urna dictum luctus. Suspendisse convallis dignissim eros at volutpat. In egestas
                                                                mattis dui. Aliquam mattis dictum aliquet. Nulla sapien mauris, eleifend et sem ac, commodo dapibus odio.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- end row -->
                                    </div>

                                    <div class="d-none code-view">
                                        <pre class="language-markup" style="height: 275px;"><code>&lt;!-- Rounded Ribbon --&gt;
&lt;div class=&quot;card ribbon-box border shadow-none mb-lg-0&quot;&gt;
    &lt;div class=&quot;card-body&quot;&gt;
        &lt;div class=&quot;ribbon ribbon-primary round-shape&quot;&gt;Primary&lt;/div&gt;
        &lt;h5 class=&quot;fs-14 text-end&quot;&gt;Rounded Ribbon&lt;/h5&gt;
        &lt;div class=&quot;ribbon-content mt-4 text-muted&quot;&gt;
            &lt;p class=&quot;mb-0&quot;&gt;Quisque nec turpis at urna dictum luctus. Suspendisse convallis dignissim eros at volutpat. In egestas
                mattis dui. Aliquam mattis dictum aliquet. Nulla sapien mauris, eleifend et sem ac, commodo dapibus odio.&lt;/p&gt;
        &lt;/div&gt;
    &lt;/div&gt;
&lt;/div&gt;</code>

<code>&lt;div class=&quot;card ribbon-box border shadow-none mb-lg-0&quot;&gt;
    &lt;div class=&quot;card-body&quot;&gt;
        &lt;div class=&quot;ribbon ribbon-success round-shape&quot;&gt;Success&lt;/div&gt;
        &lt;h5 class=&quot;fs-14 text-end&quot;&gt;Rounded Ribbon&lt;/h5&gt;
        &lt;div class=&quot;ribbon-content mt-4 text-muted&quot;&gt;
            &lt;p class=&quot;mb-0&quot;&gt;Quisque nec turpis at urna dictum luctus. Suspendisse convallis dignissim eros at volutpat. In egestas
                mattis dui. Aliquam mattis dictum aliquet. Nulla sapien mauris, eleifend et sem ac, commodo dapibus odio.&lt;/p&gt;
        &lt;/div&gt;
    &lt;/div&gt;
&lt;/div&gt;</code>

<code>&lt;!-- Right Ribbon --&gt;
&lt;div class=&quot;card ribbon-box border shadow-none right mb-lg-0&quot;&gt;
    &lt;div class=&quot;card-body&quot;&gt;
        &lt;div class=&quot;ribbon ribbon-info round-shape&quot;&gt;Info&lt;/div&gt;
        &lt;h5 class=&quot;fs-14 text-start&quot;&gt;Rounded Ribbon Right&lt;/h5&gt;
        &lt;div class=&quot;ribbon-content mt-4 text-muted&quot;&gt;
            &lt;p class=&quot;mb-0&quot;&gt;Quisque nec turpis at urna dictum luctus. Suspendisse convallis dignissim eros at volutpat. In egestas
                mattis dui. Aliquam mattis dictum aliquet. Nulla sapien mauris, eleifend et sem ac, commodo dapibus odio.&lt;/p&gt;
        &lt;/div&gt;
    &lt;/div&gt;
&lt;/div&gt;</code></pre>
                                    </div>
                                </div><!-- end card-body -->
                            </div><!-- end card -->
                        </div>
                        <!-- end col -->
                    </div>
                    <!-- end row -->

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header align-items-center d-flex">
                                    <h4 class="card-title mb-0 flex-grow-1">Ribbon Shape</h4>
                                    <div class="flex-shrink-0">
                                        <div class="form-check form-switch form-switch-right form-switch-md">
                                            <label for="shape-ribbon-showcode" class="form-label text-muted">Show Code</label>
                                            <input class="form-check-input code-switcher" type="checkbox" id="shape-ribbon-showcode"></input>
                                        </div>
                                    </div>
                                </div><!-- end card header -->

                                <div class="card-body">

                                    <div class="live-preview">
                                        <div class="row g-3">
                                            <p class="text-muted">Use <code>ribbon-shape</code> class to show ribbon shaped ribbon.</p>
                                            <div class="col-xxl-4">
                                                <div class="card ribbon-box border shadow-none mb-lg-0">
                                                    <div class="card-body">
                                                        <div class="ribbon ribbon-primary ribbon-shape">Primary</div>
                                                        <h5 class="fs-14 text-end">Ribbon Shape</h5>
                                                        <div class="ribbon-content text-muted mt-4">
                                                            <p class="mb-0">Quisque nec turpis at urna dictum luctus. Suspendisse convallis dignissim eros at volutpat. In egestas
                                                                mattis dui. Aliquam mattis dictum aliquet. Nulla sapien mauris, eleifend et sem ac, commodo dapibus odio.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xxl-4">
                                                <div class="card ribbon-box border shadow-none mb-lg-0">
                                                    <div class="card-body">
                                                        <div class="ribbon ribbon-success ribbon-shape">Success</div>
                                                        <h5 class="fs-14 text-end">Ribbon Shape</h5>
                                                        <div class="ribbon-content text-muted mt-4">
                                                            <p class="mb-0">Quisque nec turpis at urna dictum luctus. Suspendisse convallis dignissim eros at volutpat. In egestas
                                                                mattis dui. Aliquam mattis dictum aliquet. Nulla sapien mauris, eleifend et sem ac, commodo dapibus odio.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xxl-4">
                                                <div class="card ribbon-box border shadow-none mb-lg-0 right">
                                                    <div class="card-body">
                                                        <div class="ribbon ribbon-info ribbon-shape">Info</div>
                                                        <h5 class="fs-14 text-start">Ribbon Shape Right</h5>
                                                        <div class="ribbon-content text-muted mt-4">
                                                            <p class="mb-0">Quisque nec turpis at urna dictum luctus. Suspendisse convallis dignissim eros at volutpat. In egestas
                                                                mattis dui. Aliquam mattis dictum aliquet. Nulla sapien mauris, eleifend et sem ac, commodo dapibus odio.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- end row -->
                                    </div>

                                    <div class="d-none code-view">
                                        <pre class="language-markup" style="height: 275px;"><code>&lt;!-- Ribbon Shape --&gt;
&lt;div class=&quot;card ribbon-box border shadow-none mb-lg-0&quot;&gt;
    &lt;div class=&quot;card-body&quot;&gt;
        &lt;div class=&quot;ribbon ribbon-primary ribbon-shape&quot;&gt;Primary&lt;/div&gt;
        &lt;h5 class=&quot;fs-14 text-end&quot;&gt;Ribbon Shape&lt;/h5&gt;
        &lt;div class=&quot;ribbon-content text-muted mt-4&quot;&gt;
            &lt;p class=&quot;mb-0&quot;&gt;Quisque nec turpis at urna dictum luctus. Suspendisse convallis dignissim eros at volutpat. In egestas
                mattis dui. Aliquam mattis dictum aliquet. Nulla sapien mauris, eleifend et sem ac, commodo dapibus odio.&lt;/p&gt;
        &lt;/div&gt;
    &lt;/div&gt;
&lt;/div&gt;</code>

<code>&lt;div class=&quot;card ribbon-box border shadow-none mb-lg-0&quot;&gt;
    &lt;div class=&quot;card-body&quot;&gt;
        &lt;div class=&quot;ribbon ribbon-success ribbon-shape&quot;&gt;Success&lt;/div&gt;
        &lt;h5 class=&quot;fs-14 text-end&quot;&gt;Ribbon Shape&lt;/h5&gt;
        &lt;div class=&quot;ribbon-content text-muted mt-4&quot;&gt;
            &lt;p class=&quot;mb-0&quot;&gt;Quisque nec turpis at urna dictum luctus. Suspendisse convallis dignissim eros at volutpat. In egestas
                mattis dui. Aliquam mattis dictum aliquet. Nulla sapien mauris, eleifend et sem ac, commodo dapibus odio.&lt;/p&gt;
        &lt;/div&gt;
    &lt;/div&gt;
&lt;/div&gt;</code>

<code>&lt;div class=&quot;card ribbon-box border shadow-none mb-lg-0 right&quot;&gt;
    &lt;div class=&quot;card-body&quot;&gt;
        &lt;div class=&quot;ribbon ribbon-info ribbon-shape&quot;&gt;Info&lt;/div&gt;
        &lt;h5 class=&quot;fs-14 text-start&quot;&gt;Ribbon Shape Right&lt;/h5&gt;
        &lt;div class=&quot;ribbon-content text-muted mt-4&quot;&gt;
            &lt;p class=&quot;mb-0&quot;&gt;Quisque nec turpis at urna dictum luctus. Suspendisse convallis dignissim eros at volutpat. In egestas
                mattis dui. Aliquam mattis dictum aliquet. Nulla sapien mauris, eleifend et sem ac, commodo dapibus odio.&lt;/p&gt;
        &lt;/div&gt;
    &lt;/div&gt;
&lt;/div&gt;</code></pre>
                                    </div>
                                </div><!-- end card-body -->
                            </div><!-- end card -->
                        </div>
                        <!-- end col -->
                    </div>
                    <!-- end row -->

                    <div class="row">
                        <div class="col-lg-12">

                            <div class="card">

                                <div class="card-header align-items-center d-flex">
                                    <h4 class="card-title mb-0 flex-grow-1">Filled Ribbons</h4>
                                    <div class="flex-shrink-0">
                                        <div class="form-check form-switch form-switch-right form-switch-md">
                                            <label for="ribbons01-showcode" class="form-label text-muted">Show Code</label>
                                            <input class="form-check-input code-switcher" type="checkbox" id="ribbons01-showcode"></input>
                                        </div>
                                    </div>
                                </div><!-- end card header -->

                                <div class="card-body">

                                    <div class="live-preview">
                                        <div class="row g-3">
                                            <p class="text-muted">Use <code>ribbon-fill</code> class to show fill-shaped ribbon.</p>
                                            <div class="col-xxl-4">
                                                <div class="card ribbon-box border ribbon-fill shadow-none mb-lg-0">
                                                    <div class="card-body">
                                                        <div class="ribbon ribbon-primary">New</div>
                                                        <h5 class="fs-14 text-end">Fill Ribbon</h5>
                                                        <div class="ribbon-content mt-3 text-muted">
                                                            <p class="mb-0">Quisque nec turpis at urna dictum luctus. Suspendisse convallis dignissim eros at volutpat. In egestas
                                                                mattis dui. Aliquam mattis dictum aliquet. Nulla sapien mauris, eleifend et sem ac, commodo dapibus odio.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--end col-->

                                            <div class="col-xxl-4">
                                                <div class="card ribbon-box border ribbon-fill shadow-none mb-lg-0">
                                                    <div class="card-body">
                                                        <div class="ribbon ribbon-success">Sale</div>
                                                        <h5 class="fs-14 text-end">Fill Ribbon</h5>
                                                        <div class="ribbon-content mt-3 text-muted">
                                                            <p class="mb-0">Quisque nec turpis at urna dictum luctus. Suspendisse convallis dignissim eros at volutpat. In egestas
                                                                mattis dui. Aliquam mattis dictum aliquet. Nulla sapien mauris, eleifend et sem ac, commodo dapibus odio.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--end col-->

                                            <div class="col-xxl-4">
                                                <!-- Right Ribbon -->
                                                <div class="card ribbon-box border ribbon-fill shadow-none right mb-lg-0">
                                                    <div class="card-body">
                                                        <div class="ribbon ribbon-info">New</div>
                                                        <h5 class="fs-14 text-start">Fill Ribbon Right</h5>
                                                        <div class="ribbon-content mt-3 text-muted">
                                                            <p class="mb-0">Quisque nec turpis at urna dictum luctus. Suspendisse convallis dignissim eros at volutpat. In egestas
                                                                mattis dui. Aliquam mattis dictum aliquet. Nulla sapien mauris, eleifend et sem ac, commodo dapibus odio.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--end col-->
                                        </div>
                                        <!-- end row -->
                                    </div>

                                    <div class="d-none code-view">
                                        <pre class="language-markup" style="height: 275px;"><code>&lt;div class=&quot;card ribbon-box border ribbon-fill shadow-none mb-lg-0&quot;&gt;
    &lt;div class=&quot;card-body&quot;&gt;
        &lt;div class=&quot;ribbon ribbon-primary&quot;&gt;- 10 %&lt;/div&gt;
        &lt;h5 class=&quot;fs-14 text-end&quot;&gt;Fill Ribbon&lt;/h5&gt;
        &lt;div class=&quot;ribbon-content mt-5 text-muted&quot;&gt;
            &lt;p class=&quot;mb-0&quot;&gt;Quisque nec turpis at urna dictum luctus. Suspendisse convallis dignissim eros at volutpat. In egestas
                mattis dui. Aliquam mattis dictum aliquet. Nulla sapien mauris, eleifend et sem ac, commodo dapibus odio.&lt;/p&gt;
        &lt;/div&gt;
    &lt;/div&gt;
&lt;/div&gt;</code>

<code>&lt;div class=&quot;card ribbon-box border ribbon-fill shadow-none mb-lg-0&quot;&gt;
    &lt;div class=&quot;card-body&quot;&gt;
        &lt;div class=&quot;ribbon ribbon-success&quot;&gt;- 20 %&lt;/div&gt;
        &lt;h5 class=&quot;fs-14 text-end&quot;&gt;Fill Ribbon&lt;/h5&gt;
        &lt;div class=&quot;ribbon-content mt-5 text-muted&quot;&gt;
            &lt;p class=&quot;mb-0&quot;&gt;Quisque nec turpis at urna dictum luctus. Suspendisse convallis dignissim eros at volutpat. In egestas
                mattis dui. Aliquam mattis dictum aliquet. Nulla sapien mauris, eleifend et sem ac, commodo dapibus odio.&lt;/p&gt;
        &lt;/div&gt;
    &lt;/div&gt;
&lt;/div&gt;</code>

<code>&lt;!-- Right Ribbon --&gt;
&lt;div class=&quot;card ribbon-box border ribbon-fill shadow-none right mb-lg-0&quot;&gt;
    &lt;div class=&quot;card-body&quot;&gt;
        &lt;div class=&quot;ribbon ribbon-info&quot;&gt;- 30 %&lt;/div&gt;
        &lt;h5 class=&quot;fs-14 text-start&quot;&gt;Fill Ribbon Right&lt;/h5&gt;
        &lt;div class=&quot;ribbon-content mt-5 text-muted&quot;&gt;
            &lt;p class=&quot;mb-0&quot;&gt;Quisque nec turpis at urna dictum luctus. Suspendisse convallis dignissim eros at volutpat. In egestas
                mattis dui. Aliquam mattis dictum aliquet. Nulla sapien mauris, eleifend et sem ac, commodo dapibus odio.&lt;/p&gt;
        &lt;/div&gt;
    &lt;/div&gt;
&lt;/div&gt;</code></pre>
                                    </div>
                                </div><!-- end card-body -->
                            </div><!-- end card -->
                        </div>
                        <!-- end col -->
                    </div>
                    <!-- end row -->

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header align-items-center d-flex">
                                    <h4 class="card-title mb-0 flex-grow-1">Boxed Ribbons</h4>
                                    <div class="flex-shrink-0">
                                        <div class="form-check form-switch form-switch-right form-switch-md">
                                            <label for="ribbon-example-showcode" class="form-label text-muted">Show Code</label>
                                            <input class="form-check-input code-switcher" type="checkbox" id="ribbon-example-showcode"></input>
                                        </div>
                                    </div>
                                </div><!-- end card header -->

                                <div class="card-body">

                                    <div class="live-preview">
                                        <div class="row g-3">
                                            <p class="text-muted">Use <code>ribbon-box</code> class with <code>ribbon-two</code> class at child element to show below-mentioned shaped ribbon.</p>
                                            <div class="col-xxl-4">
                                                <div class="card ribbon-box border shadow-none mb-lg-0">
                                                    <div class="card-body text-muted">
                                                        <div class="ribbon-two ribbon-two-primary"><span>Basic</span></div>
                                                        <h5 class="fs-14 text-end mb-3">Box Ribbon</h5>
                                                        <p class="mb-0">Quisque nec turpis at urna dictum luctus. Suspendisse convallis dignissim eros at volutpat. In egestas mattis dui. Aliquam mattis dictum aliquet. Nulla sapien mauris, eleifend et sem ac, commodo dapibus odio. Vivamus pretium nec odio cursus.</p>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xxl-4">
                                                <div class="card ribbon-box border shadow-none mb-lg-0">
                                                    <div class="card-body text-muted">
                                                        <div class="ribbon-two ribbon-two-success"><span>Standard</span></div>
                                                        <h5 class="fs-14 text-end mb-3">Box Ribbon</h5>
                                                        <p class="mb-0">Quisque nec turpis at urna dictum luctus. Suspendisse convallis dignissim eros at volutpat. In egestas mattis dui. Aliquam mattis dictum aliquet. Nulla sapien mauris, eleifend et sem ac, commodo dapibus odio. Vivamus pretium nec odio cursus.</p>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xxl-4">
                                                <!-- Right Ribbon -->
                                                <div class="card ribbon-box border shadow-none mb-lg-0 right">
                                                    <div class="card-body text-muted">
                                                        <div class="ribbon-two ribbon-two-info"><span>Premium</span></div>
                                                        <h5 class="fs-14 mb-3">Box Ribbon Right</h5>
                                                        <p class="mb-0">Quisque nec turpis at urna dictum luctus. Suspendisse convallis dignissim eros at volutpat. In egestas mattis dui. Aliquam mattis dictum aliquet. Nulla sapien mauris, eleifend et sem ac, commodo dapibus odio. Vivamus pretium nec odio cursus elementum ornare.</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- end row -->
                                    </div>

                                    <div class="d-none code-view">
                                        <pre class="language-markup" style="height: 275px;"><code>&lt;div class=&quot;card ribbon-box border shadow-none mb-lg-0&quot;&gt;
    &lt;div class=&quot;card-body text-muted&quot;&gt;
        &lt;div class=&quot;ribbon-two ribbon-two-primary&quot;&gt;&lt;span&gt;Primary&lt;/span&gt;&lt;/div&gt;
        &lt;p class=&quot;mb-0&quot;&gt;Quisque nec turpis at urna dictum luctus. Suspendisse convallis dignissim eros at volutpat. In egestas mattis dui. Aliquam mattis dictum aliquet. Nulla sapien mauris, eleifend et sem ac, commodo dapibus odio. Vivamus pretium nec odio cursus.&lt;/p&gt;
    &lt;/div&gt;
&lt;/div&gt;</code>

<code>&lt;div class=&quot;card ribbon-box border shadow-none mb-lg-0&quot;&gt;
    &lt;div class=&quot;card-body text-muted&quot;&gt;
        &lt;div class=&quot;ribbon-two ribbon-two-success&quot;&gt;&lt;span&gt;Success&lt;/span&gt;&lt;/div&gt;
        &lt;p class=&quot;mb-0&quot;&gt;Quisque nec turpis at urna dictum luctus. Suspendisse convallis dignissim eros at volutpat. In egestas mattis dui. Aliquam mattis dictum aliquet. Nulla sapien mauris, eleifend et sem ac, commodo dapibus odio. Vivamus pretium nec odio cursus.&lt;/p&gt;
    &lt;/div&gt;
&lt;/div&gt;</code>

<code>&lt;div class=&quot;card ribbon-box border shadow-none mb-lg-0&quot;&gt;
    &lt;div class=&quot;card-body text-muted&quot;&gt;
        &lt;div class=&quot;ribbon-two ribbon-two-success&quot;&gt;&lt;span&gt;Success&lt;/span&gt;&lt;/div&gt;
        &lt;p class=&quot;mb-0&quot;&gt;Quisque nec turpis at urna dictum luctus. Suspendisse convallis dignissim eros at volutpat. In egestas mattis dui. Aliquam mattis dictum aliquet. Nulla sapien mauris, eleifend et sem ac, commodo dapibus odio. Vivamus pretium nec odio cursus.&lt;/p&gt;
    &lt;/div&gt;
&lt;/div&gt;</code></pre>
                                    </div>
                                </div><!-- end card-body -->
                            </div><!-- end card -->
                        </div>
                        <!-- end col -->
                    </div>
                    <!-- end row -->

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header align-items-center d-flex">
                                    <h4 class="card-title mb-0 flex-grow-1">Ribbons</h4>
                                    <div class="flex-shrink-0">
                                        <div class="form-check form-switch form-switch-right form-switch-md">
                                            <label for="ribbon-three-showcode" class="form-label text-muted">Show Code</label>
                                            <input class="form-check-input code-switcher" type="checkbox" id="ribbon-three-showcode"></input>
                                        </div>
                                    </div>
                                </div><!-- end card header -->

                                <div class="card-body">

                                    <div class="live-preview">
                                        <div class="row g-3">
                                            <p class="text-muted">Use <code>ribbon-box</code> class with <code>ribbon-three</code> class at child element to show below-mentioned shaped ribbon.</p>
                                            <div class="col-xxl-4">
                                                <div class="card ribbon-box border shadow-none mb-lg-0">
                                                    <div class="card-body text-muted">
                                                        <span class="ribbon-three ribbon-three-primary"><span>Featured</span></span>
                                                        <h5 class="fs-14 text-end mb-3">Ribbon Shape</h5>
                                                        <p class="mb-0">Quisque nec turpis at urna dictum luctus. Suspendisse convallis dignissim eros at volutpat. In egestas mattis dui. Aliquam mattis dictum aliquet. Nulla sapien mauris, eleifend et sem ac, commodo dapibus odio. Vivamus pretium nec odio cursus.</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--end col-->

                                            <div class="col-xxl-4">
                                                <div class="card ribbon-box border shadow-none mb-lg-0">
                                                    <div class="card-body text-muted">
                                                        <span class="ribbon-three ribbon-three-success"><span>Featured</span></span>
                                                        <h5 class="fs-14 text-end mb-3">Ribbon Shape</h5>
                                                        <p class="mb-0">Quisque nec turpis at urna dictum luctus. Suspendisse convallis dignissim eros at volutpat. In egestas mattis dui. Aliquam mattis dictum aliquet. Nulla sapien mauris, eleifend et sem ac, commodo dapibus odio. Vivamus pretium nec odio cursus.</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--end col-->

                                            <div class="col-xxl-4">
                                                <div class="card ribbon-box border shadow-none mb-lg-0 right">
                                                    <div class="card-body text-muted">
                                                        <span class="ribbon-three ribbon-three-info"><span>Featured</span></span>
                                                        <h5 class="fs-14 mb-3">Ribbon Right Shape</h5>
                                                        <p class="mb-0">Quisque nec turpis at urna dictum luctus. Suspendisse convallis dignissim eros at volutpat. In egestas mattis dui. Aliquam mattis dictum aliquet. Nulla sapien mauris, eleifend et sem ac, commodo dapibus odio. Vivamus pretium nec odio cursus.</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--end col-->
                                        </div>
                                        <!-- end row -->
                                    </div>

                                    <div class="d-none code-view">
                                        <pre class="language-markup" style="height: 275px;"><code>&lt;div class=&quot;card ribbon-box border shadow-none mb-lg-0&quot;&gt;
    &lt;div class=&quot;card-body text-muted&quot;&gt;
        &lt;span class=&quot;ribbon-three ribbon-three-primary&quot;&gt;&lt;span&gt;Primary&lt;/span&gt;&lt;/span&gt;
        &lt;p class=&quot;mb-0&quot;&gt;Quisque nec turpis at urna dictum luctus. Suspendisse convallis dignissim eros at volutpat. In egestas mattis dui. Aliquam mattis dictum aliquet. Nulla sapien mauris, eleifend et sem ac, commodo dapibus odio. Vivamus pretium nec odio cursus.&lt;/p&gt;
    &lt;/div&gt;
&lt;/div&gt;</code>

<code>&lt;div class=&quot;card ribbon-box border shadow-none mb-lg-0&quot;&gt;
    &lt;div class=&quot;card-body text-muted&quot;&gt;
        &lt;div class=&quot;ribbon-three ribbon-three-success&quot;&gt;&lt;span&gt;Success&lt;/span&gt;&lt;/div&gt;
        &lt;p class=&quot;mb-0&quot;&gt;Quisque nec turpis at urna dictum luctus. Suspendisse convallis dignissim eros at volutpat. In egestas mattis dui. Aliquam mattis dictum aliquet. Nulla sapien mauris, eleifend et sem ac, commodo dapibus odio. Vivamus pretium nec odio cursus.&lt;/p&gt;
    &lt;/div&gt;
&lt;/div&gt;</code>

<code>&lt;div class=&quot;card ribbon-box border shadow-none mb-lg-0&quot;&gt;
    &lt;div class=&quot;card-body text-muted&quot;&gt;
        &lt;div class=&quot;ribbon-three ribbon-three-info&quot;&gt;&lt;span&gt;Success&lt;/span&gt;&lt;/div&gt;
        &lt;p class=&quot;mb-0&quot;&gt;Quisque nec turpis at urna dictum luctus. Suspendisse convallis dignissim eros at volutpat. In egestas mattis dui. Aliquam mattis dictum aliquet. Nulla sapien mauris, eleifend et sem ac, commodo dapibus odio. Vivamus pretium nec odio cursus.&lt;/p&gt;
    &lt;/div&gt;
&lt;/div&gt;</code></pre>
                                    </div>
                                </div><!-- end card-body -->
                            </div><!-- end card -->
                        </div>
                        <!-- end col -->
                    </div>
                    <!-- end row -->

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header align-items-center d-flex">
                                    <h4 class="card-title mb-0 flex-grow-1">Ribbons Hover</h4>
                                    <div class="flex-shrink-0">
                                        <div class="form-check form-switch form-switch-right form-switch-md">
                                            <label for="ribbon-hover-showcode" class="form-label text-muted">Show Code</label>
                                            <input class="form-check-input code-switcher" type="checkbox" id="ribbon-hover-showcode"></input>
                                        </div>
                                    </div>
                                </div><!-- end card header -->

                                <div class="card-body">
                                    <div class="live-preview">
                                        <div class="row g-3">
                                            <p class="text-muted">Use <code>trending-ribbon</code> class to show ribbon with hovering effect.</p>
                                            <div class="col-xxl-4">
                                                <div class="card ribbon-box border shadow-none overflow-hidden mb-lg-0">
                                                    <div class="card-body text-muted">
                                                        <div class="ribbon ribbon-info ribbon-shape trending-ribbon">
                                                            <span class="trending-ribbon-text">Trending</span> <i class="ri-flashlight-fill text-white align-bottom float-end ms-1"></i>
                                                        </div>
                                                        <h5 class="fs-14 text-end mb-3">Ribbon Shape</h5>
                                                        <p class="mb-0">Quisque nec turpis at urna dictum luctus. Suspendisse convallis dignissim eros at volutpat. In egestas mattis dui. Aliquam mattis dictum aliquet. Nulla sapien mauris, eleifend et sem ac, commodo dapibus odio. Vivamus pretium nec odio cursus.</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--end col-->

                                            <div class="col-xxl-4">
                                                <div class="card ribbon-box border shadow-none overflow-hidden mb-lg-0">
                                                    <div class="card-body text-muted">
                                                        <div class="ribbon ribbon-info ribbon-shape trending-ribbon">
                                                            <span class="trending-ribbon-text">Trending</span> <i class="ri-flashlight-fill text-white align-bottom float-end ms-1"></i>
                                                        </div>
                                                        <h5 class="fs-14 text-end mb-3">Ribbon Shape</h5>
                                                        <p class="mb-0">Quisque nec turpis at urna dictum luctus. Suspendisse convallis dignissim eros at volutpat. In egestas mattis dui. Aliquam mattis dictum aliquet. Nulla sapien mauris, eleifend et sem ac, commodo dapibus odio. Vivamus pretium nec odio cursus.</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--end col-->

                                            <div class="col-xxl-4">
                                                <div class="card ribbon-box right border shadow-none overflow-hidden mb-lg-0">
                                                    <div class="card-body text-muted">
                                                        <div class="ribbon ribbon-info ribbon-shape trending-ribbon">
                                                            <i class="ri-flashlight-fill text-white align-bottom float-start me-1"></i> <span class="trending-ribbon-text">Trending</span>
                                                        </div>
                                                        <h5 class="fs-14 mb-3">Ribbon Right Shape</h5>
                                                        <p class="mb-0">Quisque nec turpis at urna dictum luctus. Suspendisse convallis dignissim eros at volutpat. In egestas mattis dui. Aliquam mattis dictum aliquet. Nulla sapien mauris, eleifend et sem ac, commodo dapibus odio. Vivamus pretium nec odio cursus.</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--end col-->
                                        </div>
                                        <!-- end row -->
                                    </div>
                                    <div class="d-none code-view">
                                        <pre class="language-markup" style="height: 275px;"><code>&lt;div class=&quot;card ribbon-box border shadow-none overflow-hidden&quot;&gt;
    &lt;div class=&quot;card-body text-muted&quot;&gt;
        &lt;div class=&quot;ribbon ribbon-info ribbon-shape trending-ribbon&quot;&gt;
            &lt;span class=&quot;trending-ribbon-text&quot;&gt;Trending&lt;/span&gt; &lt;i class=&quot;ri-flashlight-fill text-white align-bottom float-end ms-1&quot;&gt;&lt;/i&gt;
        &lt;/div&gt;
        &lt;h5 class=&quot;fs-14 text-end mb-3&quot;&gt;Ribbon Shape&lt;/h5&gt;
        &lt;p class=&quot;mb-0&quot;&gt;Quisque nec turpis at urna dictum luctus. Suspendisse convallis dignissim eros at volutpat. In egestas mattis dui. Aliquam mattis dictum aliquet. Nulla sapien mauris, eleifend et sem ac, commodo dapibus odio. Vivamus pretium nec odio cursus.&lt;/p&gt;
    &lt;/div&gt;
&lt;/div&gt;</code>

<code>&lt;div class=&quot;card ribbon-box border shadow-none overflow-hidden&quot;&gt;
    &lt;div class=&quot;card-body text-muted&quot;&gt;
        &lt;div class=&quot;ribbon ribbon-info ribbon-shape trending-ribbon&quot;&gt;
            &lt;span class=&quot;trending-ribbon-text&quot;&gt;Trending&lt;/span&gt; &lt;i class=&quot;ri-flashlight-fill text-white align-bottom float-end ms-1&quot;&gt;&lt;/i&gt;
        &lt;/div&gt;
        &lt;h5 class=&quot;fs-14 text-end mb-3&quot;&gt;Ribbon Shape&lt;/h5&gt;
        &lt;p class=&quot;mb-0&quot;&gt;Quisque nec turpis at urna dictum luctus. Suspendisse convallis dignissim eros at volutpat. In egestas mattis dui. Aliquam mattis dictum aliquet. Nulla sapien mauris, eleifend et sem ac, commodo dapibus odio. Vivamus pretium nec odio cursus.&lt;/p&gt;
    &lt;/div&gt;
&lt;/div&gt;</code>

<code>&lt;div class=&quot;card ribbon-box right border shadow-none overflow-hidden&quot;&gt;
    &lt;div class=&quot;card-body text-muted&quot;&gt;
        &lt;div class=&quot;ribbon ribbon-info ribbon-shape trending-ribbon&quot;&gt;
            &lt;i class=&quot;ri-flashlight-fill text-white align-bottom float-start me-1&quot;&gt;&lt;/i&gt; &lt;span class=&quot;trending-ribbon-text&quot;&gt;Trending&lt;/span&gt;
        &lt;/div&gt;
        &lt;h5 class=&quot;fs-14 mb-3&quot;&gt;Ribbon Right Shape&lt;/h5&gt;
        &lt;p class=&quot;mb-0&quot;&gt;Quisque nec turpis at urna dictum luctus. Suspendisse convallis dignissim eros at volutpat. In egestas mattis dui. Aliquam mattis dictum aliquet. Nulla sapien mauris, eleifend et sem ac, commodo dapibus odio. Vivamus pretium nec odio cursus.&lt;/p&gt;
    &lt;/div&gt;
&lt;/div&gt;</code></pre>
                                    </div>
                                </div><!-- end card-body -->
                            </div><!-- end card -->
                        </div><!-- end col -->
                    </div><!-- end row -->

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
