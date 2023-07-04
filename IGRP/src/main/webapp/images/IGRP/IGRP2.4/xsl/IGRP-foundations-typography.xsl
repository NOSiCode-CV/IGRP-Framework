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
                                <div class="card-header">
                                    <h4 class="card-title mb-0">Font Family</h4>
                                </div><!-- end card header -->

                                <div class="card-body">
                                    <div class="live-preview">
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="text-muted">
                                                    <p>Body Font Family</p>
                                                    <div>
                                                        <p class="display-4 text-dark fw-medium">Aa</p>
                                                    </div>
                                                    <div>
                                                        <p class="mb-2">Font Family</p>
                                                        <h5 class="mb-0">"Poppins", sans-serif</h5>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-sm-6">
                                                <div class="text-muted mt-4 mt-sm-0">
                                                    <p>Heading Font Family</p>
                                                    <div>
                                                        <h1 class="display-4 text-dark fw-medium">Aa</h1>
                                                    </div>
                                                    <div>
                                                        <p class="mb-2">Font Family</p>
                                                        <h5 class="mb-0">"Poppins", sans-serif</h5>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div><!-- end card-body -->
                            </div><!-- end card -->

                            <div class="card">
                                <div class="card-header align-items-center d-flex">
                                    <h4 class="card-title mb-0 flex-grow-1">Headings</h4>
                                    <div class="flex-shrink-0">
                                        <div class="form-check form-switch form-switch-right form-switch-md">
                                            <label for="heading-showcode" class="form-label text-muted">Show Code</label>
                                            <input class="form-check-input code-switcher" type="checkbox" id="heading-showcode"></input>
                                        </div>
                                    </div>
                                </div><!-- end card header -->

                                <div class="card-body">

                                    <p class="text-muted">All HTML headings, <code>&lt;h1&gt;</code> through <code>&lt;h6&gt;</code>, are available.</p>

                                    <div class="live-preview">
                                        <h1 class="mb-3">h1. Bootstrap heading <small class="text-muted">Semibold 2.03125rem (32.5px)</small></h1>
                                        <h2 class="mb-3">h2. Bootstrap heading <small class="text-muted">Semibold 1.625rem (26px)</small></h2>
                                        <h3 class="mb-3">h3. Bootstrap heading <small class="text-muted">Semibold 1.42188rem (22.8px)</small></h3>
                                        <h4 class="mb-3">h4. Bootstrap heading <small class="text-muted">Semibold 1.21875rem (19.5px)</small></h4>
                                        <h5 class="mb-3">h5. Bootstrap heading <small class="text-muted">Semibold 1.01563rem (16.25px)</small></h5>
                                        <h6 class="mb-1">h6. Bootstrap heading <small class="text-muted">Semibold 0.8125rem (13px)</small></h6>
                                    </div>

                                    <div class="d-none code-view">
                                        <pre class="language-markup" style="height: 275px;">
<code>&lt;!-- Headings --&gt;
&lt;h1 class=&quot;mb-3&quot;&gt;h1. Bootstrap heading &lt;small class=&quot;text-muted&quot;&gt;Semibold 2.03125rem (32.5px)&lt;/small&gt;&lt;/h1&gt;</code>

<code>&lt;h2 class=&quot;mb-3&quot;&gt;h2. Bootstrap heading &lt;small class=&quot;text-muted&quot;&gt;Semibold 1.625rem (26px)&lt;/small&gt;&lt;/h2&gt;</code>

<code>&lt;h3 class=&quot;mb-3&quot;&gt;h3. Bootstrap heading &lt;small class=&quot;text-muted&quot;&gt;Semibold 1.42188rem (22.8px)&lt;/small&gt;&lt;/h3&gt;</code>

<code>&lt;h4 class=&quot;mb-3&quot;&gt;h4. Bootstrap heading &lt;small class=&quot;text-muted&quot;&gt;Semibold 1.21875rem (19.5px)&lt;/small&gt;&lt;/h4&gt;</code>

<code>&lt;h5 class=&quot;mb-3&quot;&gt;h5. Bootstrap heading &lt;small class=&quot;text-muted&quot;&gt;Semibold 1.01563rem (16.25px)&lt;/small&gt;&lt;/h5&gt;</code>

<code>&lt;h6 class=&quot;mb-1&quot;&gt;h6. Bootstrap heading &lt;small class=&quot;text-muted&quot;&gt;Semibold 0.8125rem (13px)&lt;/small&gt;&lt;/h6&gt;</code></pre>
                                    </div>
                                </div><!-- end card-body -->
                            </div><!-- end card -->
                        </div>
                        <!-- end col -->

                        <div class="col-xxl-6">
                            <div class="card">
                                <div class="card-header align-items-center d-flex">
                                    <h4 class="card-title mb-0 flex-grow-1">Display Headings</h4>
                                    <div class="flex-shrink-0">
                                        <div class="form-check form-switch form-switch-right form-switch-md">
                                            <label for="displayheading-showcode" class="form-label text-muted">Show Code</label>
                                            <input class="form-check-input code-switcher" type="checkbox" id="displayheading-showcode"></input>
                                        </div>
                                    </div>
                                </div><!-- end card header -->

                                <div class="card-body">

                                    <p class="text-muted">Traditional heading elements are designed to work best in the meat of your page content.</p>

                                    <div class="live-preview">
                                        <h1 class="display-1 mb-4">Display 1</h1>
                                        <h1 class="display-2 mb-4">Display 2</h1>
                                        <h1 class="display-3 mb-4">Display 3</h1>
                                        <h1 class="display-4 mb-4">Display 4</h1>
                                        <h1 class="display-5 mb-4">Display 5</h1>
                                        <h1 class="display-6 mb-0">Display 6</h1>
                                    </div>

                                    <div class="d-none code-view">
                                        <pre class="language-markup">
<code>&lt;!-- Display Headings --&gt;
&lt;h1 class=&quot;display-1&quot;&gt;Display 1&lt;/h1&gt;</code>

<code>&lt;h1 class=&quot;display-2&quot;&gt;Display 2&lt;/h1&gt;</code>

<code>&lt;h1 class=&quot;display-3&quot;&gt;Display 3&lt;/h1&gt;</code>

<code>&lt;h1 class=&quot;display-4&quot;&gt;Display 4&lt;/h1&gt;</code>

<code>&lt;h1 class=&quot;display-5&quot;&gt;Display 5&lt;/h1&gt;</code>

<code>&lt;h1 class=&quot;display-6&quot;&gt;Display 6&lt;/h1&gt;</code></pre>
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
                                    <h4 class="card-title mb-0 flex-grow-1">Blockquotes</h4>
                                    <div class="flex-shrink-0">
                                        <div class="form-check form-switch form-switch-right form-switch-md">
                                            <label for="blockquotes-showcode" class="form-label text-muted">Show Code</label>
                                            <input class="form-check-input code-switcher" type="checkbox" id="blockquotes-showcode"></input>
                                        </div>
                                    </div>
                                </div><!-- end card header -->

                                <div class="card-body">
                                    <p class="text-muted">Use <code>&lt;blockquote class="blockquote"&gt;</code> class for quoting blocks of content from another source within your document .</p>

                                    <div class="live-preview">
                                        <div class="row">
                                            <div class="col-xxl-6">
                                                <div>
                                                    <blockquote class="blockquote fs-14 mb-0">
                                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
                                                        <footer class="blockquote-footer mt-0">Someone famous in <cite title="Source Title">Source Title</cite></footer>
                                                    </blockquote>
                                                </div>
                                            </div><!-- end col -->
                                            <div class="col-xxl-6">
                                                <div class="mt-4 mt-lg-0">
                                                    <blockquote class="blockquote blockquote-reverse fs-14 mb-0">
                                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
                                                        <footer class="blockquote-footer mt-0">Someone famous in <cite title="Source Title">Source Title</cite></footer>
                                                    </blockquote>
                                                </div>
                                            </div><!-- end col -->
                                        </div><!-- end row -->
                                    </div>

                                    <div class="d-none code-view">
                                        <pre class="language-markup"><code>&lt;!-- Blockquotes --&gt;
&lt;blockquote class=&quot;blockquote fs-14&quot;&gt;
    &lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.&lt;/p&gt;
    &lt;footer class=&quot;blockquote-footer mt-0&quot;&gt;Someone famous in &lt;cite title=&quot;Source Title&quot;&gt;Source Title&lt;/cite&gt;&lt;/footer&gt;
&lt;/blockquote&gt;</code>

<code>&lt;blockquote class=&quot;blockquote blockquote-reverse fs-14&quot;&gt;
    &lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.&lt;/p&gt;
    &lt;footer class=&quot;blockquote-footer mt-0&quot;&gt;Someone famous in &lt;cite title=&quot;Source Title&quot;&gt;Source Title&lt;/cite&gt;&lt;/footer&gt;
&lt;/blockquote&gt;</code></pre>
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
                                    <h4 class="card-title mb-0 flex-grow-1">Blockquote Background Color</h4>
                                    <div class="flex-shrink-0">
                                        <div class="form-check form-switch form-switch-right form-switch-md">
                                            <label for="blockquotes-bgcolor-showcode" class="form-label text-muted">Show Code</label>
                                            <input class="form-check-input code-switcher" type="checkbox" id="blockquotes-bgcolor-showcode"></input>
                                        </div>
                                    </div>
                                </div><!-- end card header -->

                                <div class="card-body">
                                    <p class="text-muted text-muted">Use <code>blockquote-</code> class with the below-mentioned color variation to set the blockquote background color.</p>
                                    <div class="live-preview">
                                        <div class="row gy-4">
                                            <div class="col-xl-4 col-md-6">
                                                <blockquote class="blockquote custom-blockquote blockquote-primary rounded mb-0">
                                                    <p class="text-dark mb-2">Custom Blockquote Primary Example</p>
                                                    <footer class="blockquote-footer mt-0">Angie Burt <cite title="Source Title">Designer</cite></footer>
                                                </blockquote>
                                            </div>

                                            <div class="col-xl-4 col-md-6">
                                                <blockquote class="blockquote custom-blockquote blockquote-secondary rounded mb-0">
                                                    <p class="text-dark mb-2">Custom Blockquote Secondary Example</p>
                                                    <footer class="blockquote-footer mt-0">Angie Burt <cite title="Source Title">Designer</cite></footer>
                                                </blockquote>
                                            </div>

                                            <div class="col-xl-4 col-md-6">
                                                <blockquote class="blockquote custom-blockquote blockquote-success rounded mb-0">
                                                    <p class="text-dark mb-2">Custom Blockquote Success Example</p>
                                                    <footer class="blockquote-footer mt-0">Angie Burt <cite title="Source Title">Designer</cite></footer>
                                                </blockquote>
                                            </div>

                                            <div class="col-xl-4 col-md-6">
                                                <blockquote class="blockquote custom-blockquote blockquote-info rounded mb-0">
                                                    <p class="text-dark mb-2">Custom Blockquote Info Example</p>
                                                    <footer class="blockquote-footer mt-0">Angie Burt <cite title="Source Title">Designer</cite></footer>
                                                </blockquote>
                                            </div>

                                            <div class="col-xl-4 col-md-6">
                                                <blockquote class="blockquote custom-blockquote blockquote-danger rounded mb-0">
                                                    <p class="text-dark mb-2">Custom Blockquote Danger Example</p>
                                                    <footer class="blockquote-footer mt-0">Angie Burt <cite title="Source Title">Designer</cite></footer>
                                                </blockquote>
                                            </div>

                                            <div class="col-xl-4 col-md-6">
                                                <blockquote class="blockquote custom-blockquote blockquote-warning rounded mb-0">
                                                    <p class="text-dark mb-2">Custom Blockquote Warning Example</p>
                                                    <footer class="blockquote-footer mt-0">Angie Burt <cite title="Source Title">Designer</cite></footer>
                                                </blockquote>
                                            </div>

                                            <div class="col-xl-4 col-md-6">
                                                <blockquote class="blockquote custom-blockquote blockquote-dark rounded mb-0">
                                                    <p class="text-dark mb-2">Custom Blockquote Dark Example</p>
                                                    <footer class="blockquote-footer mt-0">Angie Burt <cite title="Source Title">Designer</cite></footer>
                                                </blockquote>
                                            </div>
                                        </div><!-- end row -->
                                    </div>

                                    <div class="d-none code-view">
                                        <pre class="language-markup" style="height: 275px"><code>&lt;!-- Blockquote Background Color --&gt;
&lt;blockquote class=&quot;blockquote custom-blockquote blockquote-primary rounded mb-0&quot;&gt;
    &lt;p class=&quot;text-dark mb-2&quot;&gt;Custom Blockquote Primary Example&lt;/p&gt;
    &lt;footer class=&quot;blockquote-footer mt-0&quot;&gt;Angie Burt &lt;cite title=&quot;Source Title&quot;&gt;Designer&lt;/cite&gt;&lt;/footer&gt;
&lt;/blockquote&gt;</code>

<code>&lt;blockquote class=&quot;blockquote custom-blockquote blockquote-secondary rounded mb-0&quot;&gt;
    &lt;p class=&quot;text-dark mb-2&quot;&gt;Custom Blockquote Secondary Example&lt;/p&gt;
    &lt;footer class=&quot;blockquote-footer mt-0&quot;&gt;Angie Burt &lt;cite title=&quot;Source Title&quot;&gt;Designer&lt;/cite&gt;&lt;/footer&gt;
&lt;/blockquote&gt;</code>

<code>&lt;blockquote class=&quot;blockquote custom-blockquote blockquote-success rounded mb-0&quot;&gt;
    &lt;p class=&quot;text-dark mb-2&quot;&gt;Custom Blockquote Success Example&lt;/p&gt;
    &lt;footer class=&quot;blockquote-footer mt-0&quot;&gt;Angie Burt &lt;cite title=&quot;Source Title&quot;&gt;Designer&lt;/cite&gt;&lt;/footer&gt;
&lt;/blockquote&gt;</code>

<code>&lt;blockquote class=&quot;blockquote custom-blockquote blockquote-info rounded mb-0&quot;&gt;
    &lt;p class=&quot;text-dark mb-2&quot;&gt;Custom Blockquote Info Example&lt;/p&gt;
    &lt;footer class=&quot;blockquote-footer mt-0&quot;&gt;Angie Burt &lt;cite title=&quot;Source Title&quot;&gt;Designer&lt;/cite&gt;&lt;/footer&gt;
&lt;/blockquote&gt;</code>

<code>&lt;blockquote class=&quot;blockquote custom-blockquote blockquote-danger rounded mb-0&quot;&gt;
    &lt;p class=&quot;text-dark mb-2&quot;&gt;Custom Blockquote Danger Example&lt;/p&gt;
    &lt;footer class=&quot;blockquote-footer mt-0&quot;&gt;Angie Burt &lt;cite title=&quot;Source Title&quot;&gt;Designer&lt;/cite&gt;&lt;/footer&gt;
&lt;/blockquote&gt;</code>

<code>&lt;blockquote class=&quot;blockquote custom-blockquote blockquote-warning rounded mb-0&quot;&gt;
    &lt;p class=&quot;text-dark mb-2&quot;&gt;Custom Blockquote Warning Example&lt;/p&gt;
    &lt;footer class=&quot;blockquote-footer mt-0&quot;&gt;Angie Burt &lt;cite title=&quot;Source Title&quot;&gt;Designer&lt;/cite&gt;&lt;/footer&gt;
&lt;/blockquote&gt;</code>

<code>&lt;blockquote class=&quot;blockquote custom-blockquote blockquote-dark rounded mb-0&quot;&gt;
    &lt;p class=&quot;text-dark mb-2&quot;&gt;Custom Blockquote Dark Example&lt;/p&gt;
    &lt;footer class=&quot;blockquote-footer mt-0&quot;&gt;Angie Burt &lt;cite title=&quot;Source Title&quot;&gt;Designer&lt;/cite&gt;&lt;/footer&gt;
&lt;/blockquote&gt;</code></pre>
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
                                    <h4 class="card-title mb-0 flex-grow-1">Blockquote Border Color</h4>
                                    <div class="flex-shrink-0">
                                        <div class="form-check form-switch form-switch-right form-switch-md">
                                            <label for="blockquotes-bordercolor-showcode" class="form-label text-muted">Show Code</label>
                                            <input class="form-check-input code-switcher" type="checkbox" id="blockquotes-bordercolor-showcode"></input>
                                        </div>
                                    </div>
                                </div><!-- end card header -->

                                <div class="card-body">
                                    <p class="text-muted text-muted">Use <code>blockquote-outline</code> class to set blockquote border color.</p>
                                    <div class="live-preview">
                                        <div class="row gy-4">

                                            <div class="col-xl-4 col-md-6">
                                                <blockquote class="blockquote custom-blockquote blockquote-outline blockquote-primary rounded mb-0">
                                                    <p class="text-dark mb-2">Custom Blockquote Outline Primary Example</p>
                                                    <footer class="blockquote-footer mt-0">Angie Burt <cite title="Source Title">Designer</cite></footer>
                                                </blockquote>
                                            </div>

                                            <div class="col-xl-4 col-md-6">
                                                <blockquote class="blockquote custom-blockquote blockquote-outline blockquote-secondary rounded mb-0">
                                                    <p class="text-dark mb-2">Custom Blockquote Outline Secondary Example</p>
                                                    <footer class="blockquote-footer mt-0">Angie Burt <cite title="Source Title">Designer</cite></footer>
                                                </blockquote>
                                            </div>

                                            <div class="col-xl-4 col-md-6">
                                                <blockquote class="blockquote custom-blockquote blockquote-outline blockquote-success rounded mb-0">
                                                    <p class="text-dark mb-2">Custom Blockquote Outline Success Example</p>
                                                    <footer class="blockquote-footer mt-0">Angie Burt <cite title="Source Title">Designer</cite></footer>
                                                </blockquote>
                                            </div>

                                            <div class="col-xl-4 col-md-6">
                                                <blockquote class="blockquote custom-blockquote blockquote-outline blockquote-info rounded mb-0">
                                                    <p class="text-dark mb-2">Custom Blockquote Outline Info Example</p>
                                                    <footer class="blockquote-footer mt-0">Angie Burt <cite title="Source Title">Designer</cite></footer>
                                                </blockquote>
                                            </div>

                                            <div class="col-xl-4 col-md-6">
                                                <blockquote class="blockquote custom-blockquote blockquote-outline blockquote-danger rounded mb-0">
                                                    <p class="text-dark mb-2">Custom Blockquote Outline Danger Example</p>
                                                    <footer class="blockquote-footer mt-0">Angie Burt <cite title="Source Title">Designer</cite></footer>
                                                </blockquote>
                                            </div>

                                            <div class="col-xl-4 col-md-6">
                                                <blockquote class="blockquote custom-blockquote blockquote-outline blockquote-warning rounded mb-0">
                                                    <p class="text-dark mb-2">Custom Blockquote Outline Warning Example</p>
                                                    <footer class="blockquote-footer mt-0">Angie Burt <cite title="Source Title">Designer</cite></footer>
                                                </blockquote>
                                            </div>

                                            <div class="col-xl-4 col-md-6">
                                                <blockquote class="blockquote custom-blockquote blockquote-outline blockquote-dark rounded mb-0">
                                                    <p class="text-dark mb-2">Custom Blockquote Outline Dark Example</p>
                                                    <footer class="blockquote-footer mt-0">Angie Burt <cite title="Source Title">Designer</cite></footer>
                                                </blockquote>
                                            </div>
                                        </div><!-- end row -->
                                    </div>

                                    <div class="d-none code-view">
                                        <pre class="language-markup" style="height: 275px;"><code>&lt;!-- Blockquote Border Color --&gt;
&lt;blockquote class=&quot;blockquote custom-blockquote blockquote-outline blockquote-primary rounded mb-0&quot;&gt;
    &lt;p class=&quot;text-dark mb-2&quot;&gt;Custom Blockquote Outline Primary Example&lt;/p&gt;
    &lt;footer class=&quot;blockquote-footer mt-0&quot;&gt;Angie Burt &lt;cite title=&quot;Source Title&quot;&gt;Designer&lt;/cite&gt;&lt;/footer&gt;
&lt;/blockquote&gt;</code>

<code>&lt;blockquote class=&quot;blockquote custom-blockquote blockquote-outline blockquote-secondary rounded mb-0&quot;&gt;
    &lt;p class=&quot;text-dark mb-2&quot;&gt;Custom Blockquote Outline Secondary Example&lt;/p&gt;
    &lt;footer class=&quot;blockquote-footer mt-0&quot;&gt;Angie Burt &lt;cite title=&quot;Source Title&quot;&gt;Designer&lt;/cite&gt;&lt;/footer&gt;
&lt;/blockquote&gt;</code>

<code>&lt;blockquote class=&quot;blockquote custom-blockquote blockquote-outline blockquote-success rounded mb-0&quot;&gt;
    &lt;p class=&quot;text-dark mb-2&quot;&gt;Custom Blockquote Outline Success Example&lt;/p&gt;
    &lt;footer class=&quot;blockquote-footer mt-0&quot;&gt;Angie Burt &lt;cite title=&quot;Source Title&quot;&gt;Designer&lt;/cite&gt;&lt;/footer&gt;
&lt;/blockquote&gt;</code>

<code>&lt;blockquote class=&quot;blockquote custom-blockquote blockquote-outline blockquote-info rounded mb-0&quot;&gt;
    &lt;p class=&quot;text-dark mb-2&quot;&gt;Custom Blockquote Outline Info Example&lt;/p&gt;
    &lt;footer class=&quot;blockquote-footer mt-0&quot;&gt;Angie Burt &lt;cite title=&quot;Source Title&quot;&gt;Designer&lt;/cite&gt;&lt;/footer&gt;
&lt;/blockquote&gt;</code>

<code>&lt;blockquote class=&quot;blockquote custom-blockquote blockquote-outline blockquote-danger rounded mb-0&quot;&gt;
    &lt;p class=&quot;text-dark mb-2&quot;&gt;Custom Blockquote Outline Danger Example&lt;/p&gt;
    &lt;footer class=&quot;blockquote-footer mt-0&quot;&gt;Angie Burt &lt;cite title=&quot;Source Title&quot;&gt;Designer&lt;/cite&gt;&lt;/footer&gt;
&lt;/blockquote&gt;</code>

<code>&lt;blockquote class=&quot;blockquote custom-blockquote blockquote-outline blockquote-warning rounded mb-0&quot;&gt;
    &lt;p class=&quot;text-dark mb-2&quot;&gt;Custom Blockquote Outline Warning Example&lt;/p&gt;
    &lt;footer class=&quot;blockquote-footer mt-0&quot;&gt;Angie Burt &lt;cite title=&quot;Source Title&quot;&gt;Designer&lt;/cite&gt;&lt;/footer&gt;
&lt;/blockquote&gt;</code>

<code>&lt;blockquote class=&quot;blockquote custom-blockquote blockquote-outline blockquote-dark rounded mb-0&quot;&gt;
    &lt;p class=&quot;text-dark mb-2&quot;&gt;Custom Blockquote Outline Dark Example&lt;/p&gt;
    &lt;footer class=&quot;blockquote-footer mt-0&quot;&gt;Angie Burt &lt;cite title=&quot;Source Title&quot;&gt;Designer&lt;/cite&gt;&lt;/footer&gt;
&lt;/blockquote&gt;</code></pre>
                                    </div>
                                </div><!-- end card-body -->
                            </div><!-- end card -->
                        </div>
                        <!-- end col -->
                    </div>
                    <!-- end row -->

                    <div class="row">
                        <div class="col-xxl-6">
                            <div class="card">
                                <div class="card-header align-items-center d-flex">
                                    <h4 class="card-title mb-0 flex-grow-1">Inline Text Elements</h4>
                                    <div class="flex-shrink-0">
                                        <div class="form-check form-switch form-switch-right form-switch-md">
                                            <label for="inlinetext-elements-showcode" class="form-label text-muted">Show Code</label>
                                            <input class="form-check-input code-switcher" type="checkbox" id="inlinetext-elements-showcode"></input>
                                        </div>
                                    </div>
                                </div><!-- end card header -->

                                <div class="card-body">
                                    <p class="text-muted">Styling for inline HTML5 elements.</p>
                                    <div class="live-preview">
                                        <p class="lead">
                                            Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.
                                        </p>
                                        <p>You can use the mark tag to <mark>highlight</mark> text.</p>
                                        <p><del>This line of text is meant to be treated as deleted text.</del></p>
                                        <p><s>This line of text is meant to be treated as no longer accurate.</s></p>
                                        <p><ins>This line of text is meant to be treated as an addition to the document.</ins></p>
                                        <p><u>This line of text will render as underlined</u></p>
                                        <p><small>This line of text is meant to be treated as fine print.</small></p>
                                        <p><strong>This line rendered as bold text.</strong></p>
                                        <p class="mb-0"><em>This line rendered as italicized text.</em></p>
                                    </div>

                                    <div class="d-none code-view">
                                        <pre class="language-markup">
<code>&lt;p class=&quot;lead&quot;&gt;Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.&lt;/p&gt;</code>

<code>&lt;p&gt;You can use the mark tag to &lt;mark&gt;highlight&lt;/mark&gt; text.&lt;/p&gt;</code>

<code>&lt;p&gt;&lt;del&gt;This line of text is meant to be treated as deleted text.&lt;/del&gt;&lt;/p&gt;</code>

<code>&lt;p&gt;&lt;s&gt;This line of text is meant to be treated as no longer accurate.&lt;/s&gt;&lt;/p&gt;</code>

<code>&lt;p&gt;&lt;ins&gt;This line of text is meant to be treated as an addition to the document.&lt;/ins&gt;&lt;/p&gt;</code>

<code>&lt;p&gt;&lt;u&gt;This line of text will render as underlined&lt;/u&gt;&lt;/p&gt;</code>

<code>&lt;p&gt;&lt;small&gt;This line of text is meant to be treated as fine print.&lt;/small&gt;&lt;/p&gt;</code>

<code>&lt;p&gt;&lt;strong&gt;This line rendered as bold text.&lt;/strong&gt;&lt;/p&gt;</code>

<code>&lt;p&gt;&lt;em&gt;This line rendered as italicized text.&lt;/em&gt;&lt;/p&gt;</code></pre>
                                    </div>
                                </div><!-- end card-body -->
                            </div><!-- end card -->
                        </div>
                        <!-- end col -->

                        <div class="col-xxl-6">
                            <div class="card">
                                <div class="card-header align-items-center d-flex">
                                    <h4 class="card-title mb-0 flex-grow-1">Unstyled List</h4>
                                    <div class="flex-shrink-0">
                                        <div class="form-check form-switch form-switch-right form-switch-md">
                                            <label for="unstyledlist-showcode" class="form-label text-muted">Show Code</label>
                                            <input class="form-check-input code-switcher" type="checkbox" id="unstyledlist-showcode"></input>
                                        </div>
                                    </div>
                                </div><!-- end card header -->

                                <div class="card-body">
                                    <p class="text-muted">Use <code>list-unstyled</code> class Remove the default list-style and left margin on list
                                        items (immediate children only). <strong>This only applies to immediate
                                            children list items</strong>, meaning you will need to add the class
                                        for any nested lists.</p>

                                    <div class="live-preview">
                                        <ul class="list-unstyled mb-0">
                                            <li>Integer molestie lorem at massa</li>
                                            <li>Nulla volutpat aliquam velit
                                                <ul>
                                                    <li>Phasellus iaculis neque</li>
                                                    <li>Purus sodales ultricies</li>
                                                    <li>Vestibulum laoreet porttitor sem</li>
                                                </ul>
                                            </li>
                                            <li>Faucibus porta lacus fringilla vel</li>
                                        </ul>
                                    </div>

                                    <div class="d-none code-view">
                                        <pre class="language-markup" style="height: 200px;">
<code>&lt;ul class=&quot;list-unstyled&quot;&gt;
    &lt;li&gt;Integer molestie lorem at massa&lt;/li&gt;
    &lt;li&gt;Nulla volutpat aliquam velit
        &lt;ul&gt;
            &lt;li&gt;Phasellus iaculis neque&lt;/li&gt;
            &lt;li&gt;Purus sodales ultricies&lt;/li&gt;
            &lt;li&gt;Vestibulum laoreet porttitor sem&lt;/li&gt;
        &lt;/ul&gt;
    &lt;/li&gt;
    &lt;li&gt;Faucibus porta lacus fringilla vel&lt;/li&gt;
&lt;/ul&gt;</code></pre>
                                    </div>
                                </div><!-- end card-body -->
                            </div><!-- end card -->

                            <div class="card">
                                <div class="card-header align-items-center d-flex">
                                    <h4 class="card-title mb-0 flex-grow-1">Inline List</h4>
                                    <div class="flex-shrink-0">
                                        <div class="form-check form-switch form-switch-right form-switch-md">
                                            <label for="inlinelist-elements-showcode" class="form-label text-muted">Show Code</label>
                                            <input class="form-check-input code-switcher" type="checkbox" id="inlinelist-elements-showcode"></input>
                                        </div>
                                    </div>
                                </div><!-- end card header -->

                                <div class="card-body">
                                    <p class="text-muted">Use <code>list-inline</code> and
                                        <code>list-inline-item</code> class combination to remove a list’s bullets and apply some
                                        light margin.
                                    </p>

                                    <div class="live-preview">
                                        <ul class="list-inline mb-0">
                                            <li class="list-inline-item">Lorem ipsum</li>
                                            <li class="list-inline-item">Phasellus iaculis</li>
                                            <li class="list-inline-item">Nulla volutpat</li>
                                        </ul>
                                    </div>

                                    <div class="d-none code-view">
                                        <pre class="language-markup">
<code>&lt;ul class=&quot;list-inline&quot;&gt;
    &lt;li class=&quot;list-inline-item&quot;&gt;Lorem ipsum&lt;/li&gt;
    &lt;li class=&quot;list-inline-item&quot;&gt;Phasellus iaculis&lt;/li&gt;
    &lt;li class=&quot;list-inline-item&quot;&gt;Nulla volutpat&lt;/li&gt;
&lt;/ul&gt;</code></pre>
                                    </div>
                                </div><!-- end card-body -->
                            </div><!-- end card -->
                        </div>
                        <!-- end col -->
                    </div>
                    <!-- end row -->

                    <div class="row">
                        <div class="col-xl-12">
                            <div class="card">
                                <div class="card-header align-items-center d-flex">
                                    <h4 class="card-title mb-0 flex-grow-1">Description List Alignment</h4>
                                    <div class="flex-shrink-0">
                                        <div class="form-check form-switch form-switch-right form-switch-md">
                                            <label for="desclist-alignment-showcode" class="form-label text-muted">Show Code</label>
                                            <input class="form-check-input code-switcher" type="checkbox" id="desclist-alignment-showcode"></input>
                                        </div>
                                    </div>
                                </div><!-- end card header -->

                                <div class="card-body">
                                    <p class="text-muted">Align terms and descriptions
                                        horizontally by using our grid system’s predefined classes (or semantic
                                        mixins). For longer terms, you can optionally add a <code>.text-truncate</code> class to
                                        truncate the text with an ellipsis.</p>

                                    <div class="live-preview">
                                        <dl class="row mb-0">
                                            <dt class="col-sm-3">Description lists</dt>
                                            <dd class="col-sm-9">A description list is perfect for defining terms.</dd>

                                            <dt class="col-sm-3">Euismod</dt>
                                            <dd class="col-sm-9">Vestibulum id ligula porta felis euismod semper eget lacinia odio sem nec elit.</dd>
                                            <dd class="col-sm-9 offset-sm-3">Donec id elit non mi porta gravida at eget metus.</dd>

                                            <dt class="col-sm-3">Malesuada porta</dt>
                                            <dd class="col-sm-9">Etiam porta sem malesuada magna mollis euismod.</dd>

                                            <dt class="col-sm-3 text-truncate">Truncated term is truncated</dt>
                                            <dd class="col-sm-9">Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</dd>

                                            <dt class="col-sm-3">Nesting</dt>
                                            <dd class="col-sm-9 mb-0">
                                                <dl class="row mb-0">
                                                    <dt class="col-sm-4">Nested definition list</dt>
                                                    <dd class="col-sm-8">Aenean posuere, tortor sed cursus feugiat, nunc augue blandit nunc.</dd>
                                                </dl>
                                            </dd>
                                        </dl>
                                    </div>

                                    <div class="d-none code-view">
                                        <pre class="language-markup" style="height: 275px;"><code>&lt;dl class=&quot;row mb-0&quot;&gt;
    &lt;dt class=&quot;col-sm-3&quot;&gt;Description lists&lt;/dt&gt;
    &lt;dd class=&quot;col-sm-9&quot;&gt;A description list is perfect for defining terms.&lt;/dd&gt;

    &lt;dt class=&quot;col-sm-3&quot;&gt;Euismod&lt;/dt&gt;
    &lt;dd class=&quot;col-sm-9&quot;&gt;Vestibulum id ligula porta felis euismod semper eget lacinia odio sem nec elit.&lt;/dd&gt;
    &lt;dd class=&quot;col-sm-9 offset-sm-3&quot;&gt;Donec id elit non mi porta gravida at eget metus.&lt;/dd&gt;

    &lt;dt class=&quot;col-sm-3&quot;&gt;Malesuada porta&lt;/dt&gt;
    &lt;dd class=&quot;col-sm-9&quot;&gt;Etiam porta sem malesuada magna mollis euismod.&lt;/dd&gt;

    &lt;dt class=&quot;col-sm-3 text-truncate&quot;&gt;Truncated term is truncated&lt;/dt&gt;
    &lt;dd class=&quot;col-sm-9&quot;&gt;Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.&lt;/dd&gt;

    &lt;dt class=&quot;col-sm-3&quot;&gt;Nesting&lt;/dt&gt;
    &lt;dd class=&quot;col-sm-9 mb-0&quot;&gt;
        &lt;dl class=&quot;row mb-0&quot;&gt;
            &lt;dt class=&quot;col-sm-4&quot;&gt;Nested definition list&lt;/dt&gt;
            &lt;dd class=&quot;col-sm-8&quot;&gt;Aenean posuere, tortor sed cursus feugiat, nunc augue blandit nunc.&lt;/dd&gt;
        &lt;/dl&gt;
    &lt;/dd&gt;
&lt;/dl&gt;</code></pre>
                                    </div>
                                </div><!-- end card-body -->
                            </div><!-- end card -->
                        </div>
                        <!-- end col -->
                    </div>
                    <!-- end row -->

                    <div class="row">
                        <div class="col-xxl-6">
                            <div class="card">
                                <div class="card-header align-items-center d-flex">
                                    <h4 class="card-title mb-0 flex-grow-1">Text Wrapping and Overflow</h4>
                                    <div class="flex-shrink-0">
                                        <div class="form-check form-switch form-switch-right form-switch-md">
                                            <label for="textwrap-showcode" class="form-label text-muted">Show Code</label>
                                            <input class="form-check-input code-switcher" type="checkbox" id="textwrap-showcode"></input>
                                        </div>
                                    </div>
                                </div><!-- end card header -->

                                <div class="card-body">
                                    <div class="live-preview">
                                        <div>
                                            <p class="text-muted">Use <code>text-wrap</code> class to wrap the text.</p>
                                            <div class="badge bg-primary text-wrap" style="width: 6rem;">
                                                This text should wrap.
                                            </div>
                                        </div>
                                        <div class="mt-4">
                                            <p class="text-muted">Use <code>text-nowrap</code> class to prevent text from wrapping.</p>
                                            <div class="text-nowrap border bg-light mt-3" style="width: 8rem;">
                                                This text should overflow the parent.
                                            </div>
                                        </div>
                                    </div>

                                    <div class="d-none code-view">
                                        <pre class="language-markup"><code>&lt;!-- Text Wrap --&gt;
&lt;div class=&quot;badge bg-primary text-wrap&quot; style=&quot;width: 6rem;&quot;&gt;
    This text should wrap.
&lt;/div&gt;</code>

<code>&lt;!-- Text nowrap --&gt;
&lt;div class=&quot;text-nowrap border bg-light mt-3&quot; style=&quot;width: 8rem;&quot;&gt;
    This text should overflow the parent.
&lt;/div&gt;</code></pre>
                                    </div>
                                </div><!-- end card-body -->
                            </div><!-- end card -->

                            <div class="card">
                                <div class="card-header align-items-center d-flex">
                                    <h4 class="card-title mb-0 flex-grow-1">Word Break</h4>
                                    <div class="flex-shrink-0">
                                        <div class="form-check form-switch form-switch-right form-switch-md">
                                            <label for="wordbreak-showcode" class="form-label text-muted">Show Code</label>
                                            <input class="form-check-input code-switcher" type="checkbox" id="wordbreak-showcode"></input>
                                        </div>
                                    </div>
                                </div><!-- end card header -->

                                <div class="card-body">
                                    <div class="live-preview">
                                        <div>
                                            <p class="text-muted">Use <code>text-break</code> class to prevent long strings of text from breaking your components' layout.</p>
                                            <p class="text-break mb-0">mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm</p>
                                        </div>
                                    </div>

                                    <div class="d-none code-view">
                                        <pre class="language-markup">
<code>&lt;p class=&quot;text-break mb-0&quot;&gt;mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm&lt;/p&gt;;</code></pre>
                                    </div>
                                </div><!-- end card-body -->
                            </div><!-- end card -->
                        </div>
                        <!-- end col -->

                        <div class="col-xxl-6">
                            <div class="card">
                                <div class="card-header align-items-center d-flex">
                                    <h4 class="card-title mb-0 flex-grow-1">Font size</h4>
                                    <div class="flex-shrink-0">
                                        <div class="form-check form-switch form-switch-right form-switch-md">
                                            <label for="fontsize-showcode" class="form-label text-muted">Show Code</label>
                                            <input class="form-check-input code-switcher" type="checkbox" id="fontsize-showcode"></input>
                                        </div>
                                    </div>
                                </div><!-- end card header -->

                                <div class="card-body">
                                    <p class="text-muted">Use <code>fs-1</code>, <code>fs-2</code>, <code>fs-3</code>, <code>fs-4</code>, <code>fs-5</code>, or <code>fs-6</code>, class to change the font-size respectively.</p>
                                    <div class="live-preview">
                                        <p class="fs-1">.fs-1 text</p>
                                        <p class="fs-2">.fs-2 text</p>
                                        <p class="fs-3">.fs-3 text</p>
                                        <p class="fs-4">.fs-4 text</p>
                                        <p class="fs-5">.fs-5 text</p>
                                        <p class="fs-6">.fs-6 text</p>
                                    </div>

                                    <div class="d-none code-view">
                                        <pre class="language-markup"><code>&lt;p class=&quot;fs-1&quot;&gt;.fs-1 text&lt;/p&gt;</code>

<code>&lt;p class=&quot;fs-2&quot;&gt;.fs-2 text&lt;/p&gt;</code>

<code>&lt;p class=&quot;fs-3&quot;&gt;.fs-3 text&lt;/p&gt;</code>

<code>&lt;p class=&quot;fs-4&quot;&gt;.fs-4 text&lt;/p&gt;</code>

<code>&lt;p class=&quot;fs-5&quot;&gt;.fs-5 text&lt;/p&gt;</code>

<code>&lt;p class=&quot;fs-6&quot;&gt;.fs-6 text&lt;/p&gt;</code></pre>
                                    </div>
                                </div><!-- end card-body -->
                            </div><!-- end card -->
                        </div>
                        <!-- end col -->
                    </div>
                    <!-- end row -->

                    <div class="row">
                        <div class="col-xxl-6">
                            <div class="card">
                                <div class="card-header align-items-center d-flex">
                                    <h4 class="card-title mb-0 flex-grow-1">Font weight and italics</h4>
                                    <div class="flex-shrink-0">
                                        <div class="form-check form-switch form-switch-right form-switch-md">
                                            <label for="fontweight-showcode" class="form-label text-muted">Show Code</label>
                                            <input class="form-check-input code-switcher" type="checkbox" id="fontweight-showcode"></input>
                                        </div>
                                    </div>
                                </div><!-- end card header -->

                                <div class="card-body">
                                    <p class="text-muted">Use <code>fst-</code>with modifier class to change font-style and Use <code>fw-</code>with modifier class to change font-weight.</p>

                                    <div class="live-preview">
                                        <p class="fw-bold">Bold text.</p>
                                        <p class="fw-bolder">Bolder weight text (relative to the parent element).</p>
                                        <p class="fw-semibold">Semibold weight text.</p>
                                        <p class="fw-normal">Normal weight text.</p>
                                        <p class="fw-light">Light weight text.</p>
                                        <p class="fw-lighter">Lighter weight text (relative to the parent element).</p>
                                        <p class="fst-italic">Italic text.</p>
                                        <p class="fst-normal mb-0">Text with normal font style</p>
                                    </div>

                                    <div class="d-none code-view">
                                        <pre class="language-markup">
<code>&lt;p class=&quot;fw-bold&quot;&gt;Bold text.&lt;/p&gt;</code>

<code>&lt;p class=&quot;fw-bolder&quot;&gt;Bolder weight text (relative to the parent element).&lt;/p&gt;</code>

<code>&lt;p class=&quot;fw-normal&quot;&gt;Normal weight text.&lt;/p&gt;</code>

<code>&lt;p class=&quot;fw-light&quot;&gt;Light weight text.&lt;/p&gt;</code>

<code>&lt;p class=&quot;fw-lighter&quot;&gt;Lighter weight text (relative to the parent element).&lt;/p&gt;</code>

<code>&lt;p class=&quot;fst-italic&quot;&gt;Italic text.&lt;/p&gt;</code>

<code>&lt;p class=&quot;fst-normal mb-0&quot;&gt;Text with normal font style&lt;/p&gt;</code></pre>
                                    </div>
                                </div><!-- end card-body -->
                            </div><!-- end card -->
                        </div>
                        <!-- end col -->

                        <div class="col-xxl-6">
                            <div class="card">
                                <div class="card-header align-items-center d-flex">
                                    <h4 class="card-title mb-0 flex-grow-1">Line height</h4>
                                    <div class="flex-shrink-0">
                                        <div class="form-check form-switch form-switch-right form-switch-md">
                                            <label for="lineheight-showcode" class="form-label text-muted">Show Code</label>
                                            <input class="form-check-input code-switcher" type="checkbox" id="lineheight-showcode"></input>
                                        </div>
                                    </div>
                                </div><!-- end card header -->

                                <div class="card-body">
                                    <p class="text-muted">Use <code>lh-</code> with modifier class to change the line height of an element.</p>

                                    <div class="live-preview">
                                        <p class="lh-1">This is a long paragraph written to show how the line-height of an element is affected by our utilities. Classes are applied to the element itself or sometimes the parent element. These classes can be customized as needed with our utility API.</p>
                                        <p class="lh-sm">This is a long paragraph written to show how the line-height of an element is affected by our utilities. Classes are applied to the element itself or sometimes the parent element. These classes can be customized as needed with our utility API.</p>
                                        <p class="lh-base">This is a long paragraph written to show how the line-height of an element is affected by our utilities. Classes are applied to the element itself or sometimes the parent element.</p>
                                        <p class="lh-lg mb-0">This is a long paragraph written to show how the line-height of an element is affected by our utilities. Classes are applied to the element itself or sometimes the parent element.</p>
                                    </div>

                                    <div class="d-none code-view">
                                        <pre class="language-markup"><code>&lt;p class=&quot;lh-1&quot;&gt;This is a long paragraph written to show how the line-height of an element is affected by our utilities. Classes are applied to the element itself or sometimes the parent element. These classes can be customized as needed with our utility API.&lt;/p&gt;</code>

<code>&lt;p class=&quot;lh-sm&quot;&gt;This is a long paragraph written to show how the line-height of an element is affected by our utilities. Classes are applied to the element itself or sometimes the parent element. These classes can be customized as needed with our utility API.&lt;/p&gt;</code>

<code>&lt;p class=&quot;lh-base&quot;&gt;This is a long paragraph written to show how the line-height of an element is affected by our utilities. Classes are applied to the element itself or sometimes the parent element.&lt;/p&gt;</code>

<code>&lt;p class=&quot;lh-lg mb-0&quot;&gt;This is a long paragraph written to show how the line-height of an element is affected by our utilities. Classes are applied to the element itself or sometimes the parent element.&lt;/p&gt;</code></pre>
                                    </div>
                                </div><!-- end card-body -->
                            </div><!-- end card -->
                        </div>
                        <!-- end col -->
                    </div>
                    <!-- end row -->

                    <div class="row">
                        <div class="col-xxl-6">
                            <div class="card">
                                <div class="card-header align-items-center d-flex">
                                    <h4 class="card-title mb-0 flex-grow-1">Text Transform</h4>
                                    <div class="flex-shrink-0">
                                        <div class="form-check form-switch form-switch-right form-switch-md">
                                            <label for="texttransform-showcode" class="form-label text-muted">Show Code</label>
                                            <input class="form-check-input code-switcher" type="checkbox" id="texttransform-showcode"></input>
                                        </div>
                                    </div>
                                </div><!-- end card header -->

                                <div class="card-body">
                                    <p class="text-muted">Use <code>text-lowercase</code>, <code>text-uppercase</code>, or <code>text-capitalize</code> to transform the text.</p>
                                    <div class="live-preview">
                                        <p class="text-lowercase">Lowercased text.</p>
                                        <p class="text-uppercase">Uppercased text.</p>
                                        <p class="text-capitalize mb-0">CapiTaliZed text.</p>
                                    </div>

                                    <div class="d-none code-view">
                                        <pre class="language-markup"><code>&lt;p class=&quot;text-lowercase&quot;&gt;Lowercased text.&lt;/p&gt;</code>

<code>&lt;p class=&quot;text-uppercase&quot;&gt;Uppercased text.&lt;/p&gt;</code>

<code>&lt;p class=&quot;text-capitalize mb-0&quot;&gt;CapiTaliZed text.&lt;/p&gt;</code></pre>
                                    </div>
                                </div><!-- end card-body -->
                            </div><!-- end card -->
                        </div>
                        <!-- end col -->

                        <div class="col-xxl-6">
                            <div class="card">
                                <div class="card-header align-items-center d-flex">
                                    <h4 class="card-title mb-0 flex-grow-1">Text Decoration</h4>
                                    <div class="flex-shrink-0">
                                        <div class="form-check form-switch form-switch-right form-switch-md">
                                            <label for="textdecoration-showcode" class="form-label text-muted">Show Code</label>
                                            <input class="form-check-input code-switcher" type="checkbox" id="textdecoration-showcode"></input>
                                        </div>
                                    </div>
                                </div><!-- end card header -->

                                <div class="card-body">
                                    <p class="text-muted">Use <code>text-decoration-underline</code>, <code>text-decoration-line-through</code>, or <code>text-decoration-none</code> class to decorate text in components respectively.</p>

                                    <div class="live-preview">
                                        <p class="text-decoration-underline">This text has a line underneath it.</p>
                                        <p class="text-decoration-line-through">This text has a line going through it.</p>
                                        <a href="#" class="text-decoration-none">This link has its text decoration removed</a>
                                    </div>

                                    <div class="d-none code-view">
                                        <pre class="language-markup"><code>&lt;p class=&quot;text-decoration-underline&quot;&gt;This text has a line underneath it.&lt;/p&gt;</code>

<code>&lt;p class=&quot;text-decoration-line-through&quot;&gt;This text has a line going through it.&lt;/p&gt;</code>

<code>&lt;a href=&quot;#&quot; class=&quot;text-decoration-none&quot;&gt;This link has its text decoration removed&lt;/a&gt;</code></pre>
                                    </div>
                                </div><!-- end card-body -->
                            </div><!-- end card -->
                        </div>
                        <!-- end col -->
                    </div>
                    <!-- end row -->

                    <div class="row">
                        <div class="col-xxl-6">
                            <div class="card">
                                <div class="card-header align-items-center d-flex">
                                    <h4 class="card-title mb-0 flex-grow-1">Text Truncation</h4>
                                    <div class="flex-shrink-0">
                                        <div class="form-check form-switch form-switch-right form-switch-md">
                                            <label for="texttruncation-showcode" class="form-label text-muted">Show Code</label>
                                            <input class="form-check-input code-switcher" type="checkbox" id="texttruncation-showcode"></input>
                                        </div>
                                    </div>
                                </div><!-- end card header -->

                                <div class="card-body">
                                    <p class="text-muted">Use <code>text-truncate</code> class to truncate the text with an ellipsis. Requires <code>display: inline-block</code> or <code>display: block</code>.</p>

                                    <div class="live-preview">
                                        <!-- Block level -->
                                        <div class="row">
                                            <div class="col-2 text-truncate">
                                                This text is quite long, and will be truncated once displayed.
                                            </div>
                                        </div>

                                        <!-- Inline level -->
                                        <span class="d-inline-block text-truncate" style="max-width: 150px;">
                                            This text is quite long, and will be truncated once displayed.
                                        </span>
                                    </div>

                                    <div class="d-none code-view">
                                        <pre class="language-markup"><code>&lt;!-- Block level --&gt;
&lt;div class=&quot;row&quot;&gt;
    &lt;div class=&quot;col-2 text-truncate&quot;&gt;
        This text is quite long, and will be truncated once displayed.
    &lt;/div&gt;
&lt;/div&gt;</code>

<code>&lt;!-- Inline level --&gt;
&lt;span class=&quot;d-inline-block text-truncate&quot; style=&quot;max-width: 150px;&quot;&gt;
    This text is quite long, and will be truncated once displayed.
&lt;/span&gt;</code></pre>
                                    </div>
                                </div><!-- end card-body -->
                            </div><!-- end card -->
                        </div>
                        <!-- end col -->

                        <div class="col-xxl-6">
                            <div class="card">
                                <div class="card-header align-items-center d-flex">
                                    <h4 class="card-title mb-0 flex-grow-1">Visibility</h4>
                                    <div class="flex-shrink-0">
                                        <div class="form-check form-switch form-switch-right form-switch-md">
                                            <label for="visibility-showcode" class="form-label text-muted">Show Code</label>
                                            <input class="form-check-input code-switcher" type="checkbox" id="visibility-showcode"></input>
                                        </div>
                                    </div>
                                </div><!-- end card header -->

                                <div class="card-body">
                                    <p class="text-muted">Use <code>visible</code> or <code>invisible</code> class to show or to hide elements respectively.</p>

                                    <div class="live-preview">
                                        <div class="visible">text visible Lorem ipsum dolor sit amet</div>
                                        <div class="invisible">text invisible Lorem ipsum dolor sit amet</div>
                                    </div>

                                    <div class="d-none code-view">
                                        <pre class="language-markup"><code>&lt;div class=&quot;visible&quot;&gt;text visible Lorem ipsum dolor sit amet&lt;/div&gt;</code>

<code>&lt;div class=&quot;invisible&quot;&gt;text invisible Lorem ipsum dolor sit amet&lt;/div&gt;</code></pre>
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
                                    <h4 class="card-title mb-0 flex-grow-1">Clearfix</h4>
                                    <div class="flex-shrink-0">
                                        <div class="form-check form-switch form-switch-right form-switch-md">
                                            <label for="clearfix-showcode" class="form-label text-muted">Show Code</label>
                                            <input class="form-check-input code-switcher" type="checkbox" id="clearfix-showcode"></input>
                                        </div>
                                    </div>
                                </div><!-- end card header -->

                                <div class="card-body">
                                    <p class="text-muted">Use <code>clearfix</code> class to clear/set floated content within a container.</p>
                                    <div class="live-preview">
                                        <div class="bg-light clearfix p-3">
                                            <button type="button" class="btn btn-secondary float-start">Example Button floated left</button>
                                            <button type="button" class="btn btn-success float-end">Example Button floated right</button>
                                        </div>
                                    </div>

                                    <div class="d-none code-view">
                                        <pre class="language-markup"><code>&lt;div class=&quot;bg-light clearfix&quot;&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-secondary float-start&quot;&gt;Example Button floated left&lt;/button&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-secondary float-end&quot;&gt;Example Button floated right&lt;/button&gt;
&lt;/div&gt;</code></pre>
                                    </div>
                                </div><!-- end card-body -->
                            </div><!-- end card -->
                        </div>
                        <!-- end col -->
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
