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

                                    <div class="container-fluid">

                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">Single Button Dropdown</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="dropdown-base-example" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="dropdown-base-example"/>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">
                                                        <p class="text-muted">Use <code>btn</code> class at to create a dropdown
                                        toggle with &lt;button&gt; element.
                                                        </p>
                                                        <div class="live-preview">
                                                            <div class="d-flex flex-wrap gap-3">
                                                                <div class="dropdown">
                                                                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                                                    Dropdown button
                                                                    </button>
                                                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                                                        <a class="dropdown-item" href="#">Action</a>
                                                                        <a class="dropdown-item" href="#">Another action</a>
                                                                        <a class="dropdown-item" href="#">Something else here</a>
                                                                    </div>
                                                                </div>

                                                                <div class="dropdown">
                                                                    <a href="#" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                                    Dropdown link
                                                                    </a>

                                                                    <div class="dropdown-menu">
                                                                        <a class="dropdown-item" href="#">Action</a>
                                                                        <a class="dropdown-item" href="#">Another action</a>
                                                                        <a class="dropdown-item" href="#">Something else here</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="height: 375px;">
                                                                <code>&lt;!-- Single Button Dropdown --&gt;
&lt;div class=&quot;dropdown&quot;&gt;
    &lt;button class=&quot;btn btn-secondary dropdown-toggle&quot; type=&quot;button&quot; id=&quot;dropdownMenuButton&quot; data-bs-toggle=&quot;dropdown&quot; aria-expanded=&quot;false&quot;&gt;
        Dropdown button 
    &lt;/button&gt;
    &lt;div class=&quot;dropdown-menu&quot; aria-labelledby=&quot;dropdownMenuButton&quot;&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Another action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Something else here&lt;/a&gt;
    &lt;/div&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;div class=&quot;dropdown&quot;&gt;
    &lt;a href=&quot;#&quot; class=&quot;btn btn-secondary dropdown-toggle&quot; data-bs-toggle=&quot;dropdown&quot; aria-expanded=&quot;false&quot;&gt;
        Dropdown link 
    &lt;/a&gt;
    &lt;div class=&quot;dropdown-menu&quot;&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Another action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Something else here&lt;/a&gt;
    &lt;/div&gt;
&lt;/div&gt;</code>
                                                            </pre>
                                                        </div>
                                                    </div>                                                    <!-- end card-body -->
                                                </div>                                                <!-- end card -->
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">Dropdown Color Variant</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="dropdown-variant" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="dropdown-variant"/>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">
                                                        <p class="text-muted">Use <code>btn-</code> class with below mentioned variation to color dropdown toggle.</p>
                                                        <div class="live-preview">
                                                            <div class="d-flex flex-wrap gap-3">
                                                                <div class="btn-group">
                                                                    <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Primary</button>
                                                                    <div class="dropdown-menu">
                                                                        <a class="dropdown-item" href="#">Action</a>
                                                                        <a class="dropdown-item" href="#">Another action</a>
                                                                        <a class="dropdown-item" href="#">Something else here</a>
                                                                        <div class="dropdown-divider"></div>
                                                                        <a class="dropdown-item" href="#">Separated link</a>
                                                                    </div>
                                                                </div>                                                                <!-- /btn-group -->
                                                                <div class="btn-group">
                                                                    <button type="button" class="btn btn-success dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Success</button>
                                                                    <div class="dropdown-menu">
                                                                        <a class="dropdown-item" href="#">Action</a>
                                                                        <a class="dropdown-item" href="#">Another action</a>
                                                                        <a class="dropdown-item" href="#">Something else here</a>
                                                                        <div class="dropdown-divider"></div>
                                                                        <a class="dropdown-item" href="#">Separated link</a>
                                                                    </div>
                                                                </div>                                                                <!-- /btn-group -->
                                                                <div class="btn-group">
                                                                    <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Light</button>
                                                                    <div class="dropdown-menu">
                                                                        <a class="dropdown-item" href="#">Action</a>
                                                                        <a class="dropdown-item" href="#">Another action</a>
                                                                        <a class="dropdown-item" href="#">Something else here</a>
                                                                        <div class="dropdown-divider"></div>
                                                                        <a class="dropdown-item" href="#">Separated link</a>
                                                                    </div>
                                                                </div>                                                                <!-- /btn-group -->
                                                                <div class="btn-group">
                                                                    <button type="button" class="btn btn-info dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Info</button>
                                                                    <div class="dropdown-menu">
                                                                        <a class="dropdown-item" href="#">Action</a>
                                                                        <a class="dropdown-item" href="#">Another action</a>
                                                                        <a class="dropdown-item" href="#">Something else here</a>
                                                                        <div class="dropdown-divider"></div>
                                                                        <a class="dropdown-item" href="#">Separated link</a>
                                                                    </div>
                                                                </div>                                                                <!-- /btn-group -->
                                                                <div class="btn-group">
                                                                    <button type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Secondary</button>
                                                                    <div class="dropdown-menu">
                                                                        <a class="dropdown-item" href="#">Action</a>
                                                                        <a class="dropdown-item" href="#">Another action</a>
                                                                        <a class="dropdown-item" href="#">Something else here</a>
                                                                        <div class="dropdown-divider"></div>
                                                                        <a class="dropdown-item" href="#">Separated link</a>
                                                                    </div>
                                                                </div>                                                                <!-- /btn-group -->
                                                                <div class="btn-group">
                                                                    <button type="button" class="btn btn-warning dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Warning</button>
                                                                    <div class="dropdown-menu">
                                                                        <a class="dropdown-item" href="#">Action</a>
                                                                        <a class="dropdown-item" href="#">Another action</a>
                                                                        <a class="dropdown-item" href="#">Something else here</a>
                                                                        <div class="dropdown-divider"></div>
                                                                        <a class="dropdown-item" href="#">Separated link</a>
                                                                    </div>
                                                                </div>                                                                <!-- /btn-group -->
                                                                <div class="btn-group">
                                                                    <button type="button" class="btn btn-danger dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Danger</button>
                                                                    <div class="dropdown-menu">
                                                                        <a class="dropdown-item" href="#">Action</a>
                                                                        <a class="dropdown-item" href="#">Another action</a>
                                                                        <a class="dropdown-item" href="#">Something else here</a>
                                                                        <div class="dropdown-divider"></div>
                                                                        <a class="dropdown-item" href="#">Separated link</a>
                                                                    </div>
                                                                </div>                                                                <!-- /btn-group -->
                                                                <div class="btn-group">
                                                                    <button type="button" class="btn btn-dark dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dark</button>
                                                                    <div class="dropdown-menu">
                                                                        <a class="dropdown-item" href="#">Action</a>
                                                                        <a class="dropdown-item" href="#">Another action</a>
                                                                        <a class="dropdown-item" href="#">Something else here</a>
                                                                        <div class="dropdown-divider"></div>
                                                                        <a class="dropdown-item" href="#">Separated link</a>
                                                                    </div>
                                                                </div>                                                                <!-- /btn-group -->
                                                            </div>
                                                        </div>

                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="height: 375px;">
                                                                <code>&lt;!-- Dropdown Variant --&gt;
&lt;div class=&quot;btn-group&quot;&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-primary dropdown-toggle&quot; data-bs-toggle=&quot;dropdown&quot; aria-haspopup=&quot;true&quot; aria-expanded=&quot;false&quot;&gt;Primary&lt;/button&gt;
    &lt;div class=&quot;dropdown-menu&quot;&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Another action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Something else here&lt;/a&gt;
        &lt;div class=&quot;dropdown-divider&quot;&gt;&lt;/div&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Separated link&lt;/a&gt;
    &lt;/div&gt;
&lt;/div&gt;&lt;!-- /btn-group --&gt;</code>

                                                                <code>&lt;div class=&quot;btn-group&quot;&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-success dropdown-toggle&quot; data-bs-toggle=&quot;dropdown&quot; aria-haspopup=&quot;true&quot; aria-expanded=&quot;false&quot;&gt;Success&lt;/button&gt;
    &lt;div class=&quot;dropdown-menu&quot;&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Another action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Something else here&lt;/a&gt;
        &lt;div class=&quot;dropdown-divider&quot;&gt;&lt;/div&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Separated link&lt;/a&gt;
    &lt;/div&gt;
&lt;/div&gt;&lt;!-- /btn-group --&gt;</code>

                                                                <code>&lt;div class=&quot;btn-group&quot;&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-light dropdown-toggle&quot; data-bs-toggle=&quot;dropdown&quot; aria-haspopup=&quot;true&quot; aria-expanded=&quot;false&quot;&gt;Light&lt;/button&gt;
    &lt;div class=&quot;dropdown-menu&quot;&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Another action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Something else here&lt;/a&gt;
        &lt;div class=&quot;dropdown-divider&quot;&gt;&lt;/div&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Separated link&lt;/a&gt;
    &lt;/div&gt;
&lt;/div&gt;&lt;!-- /btn-group --&gt;</code>

                                                                <code>&lt;div class=&quot;btn-group&quot;&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-info dropdown-toggle&quot; data-bs-toggle=&quot;dropdown&quot; aria-haspopup=&quot;true&quot; aria-expanded=&quot;false&quot;&gt;Info&lt;/button&gt;
    &lt;div class=&quot;dropdown-menu&quot;&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Another action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Something else here&lt;/a&gt;
        &lt;div class=&quot;dropdown-divider&quot;&gt;&lt;/div&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Separated link&lt;/a&gt;
    &lt;/div&gt;
&lt;/div&gt;&lt;!-- /btn-group --&gt;</code>

                                                                <code>&lt;div class=&quot;btn-group&quot;&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-secondary dropdown-toggle&quot; data-bs-toggle=&quot;dropdown&quot; aria-haspopup=&quot;true&quot; aria-expanded=&quot;false&quot;&gt;Secondary&lt;/button&gt;
    &lt;div class=&quot;dropdown-menu&quot;&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Another action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Something else here&lt;/a&gt;
        &lt;div class=&quot;dropdown-divider&quot;&gt;&lt;/div&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Separated link&lt;/a&gt;
    &lt;/div&gt;
&lt;/div&gt;&lt;!-- /btn-group --&gt;</code>

                                                                <code>&lt;div class=&quot;btn-group&quot;&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-warning dropdown-toggle&quot; data-bs-toggle=&quot;dropdown&quot; aria-haspopup=&quot;true&quot; aria-expanded=&quot;false&quot;&gt;Warning&lt;/button&gt;
    &lt;div class=&quot;dropdown-menu&quot;&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Another action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Something else here&lt;/a&gt;
        &lt;div class=&quot;dropdown-divider&quot;&gt;&lt;/div&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Separated link&lt;/a&gt;
    &lt;/div&gt;
&lt;/div&gt;&lt;!-- /btn-group --&gt;</code>

                                                                <code>&lt;div class=&quot;btn-group&quot;&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-danger dropdown-toggle&quot; data-bs-toggle=&quot;dropdown&quot; aria-haspopup=&quot;true&quot; aria-expanded=&quot;false&quot;&gt;Danger&lt;/button&gt;
    &lt;div class=&quot;dropdown-menu&quot;&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Another action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Something else here&lt;/a&gt;
        &lt;div class=&quot;dropdown-divider&quot;&gt;&lt;/div&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Separated link&lt;/a&gt;
    &lt;/div&gt;
&lt;/div&gt;&lt;!-- /btn-group --&gt;</code>

                                                                <code>&lt;div class=&quot;btn-group&quot;&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-dark dropdown-toggle&quot; data-bs-toggle=&quot;dropdown&quot; aria-haspopup=&quot;true&quot; aria-expanded=&quot;false&quot;&gt;Dark&lt;/button&gt;
    &lt;div class=&quot;dropdown-menu&quot;&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Another action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Something else here&lt;/a&gt;
        &lt;div class=&quot;dropdown-divider&quot;&gt;&lt;/div&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Separated link&lt;/a&gt;
    &lt;/div&gt;
&lt;/div&gt;&lt;!-- /btn-group --&gt;</code>
                                                            </pre>
                                                        </div>
                                                    </div>                                                    <!-- end card-body -->
                                                </div>                                                <!-- end card -->
                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">Split Button Dropdown</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="spilt-button-dropdown" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="spilt-button-dropdown"/>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">
                                                        <p class="text-muted">Use <code>dropdown-toggle-split</code> to create split button dropdowns as a single button dropdown. </p>
                                                        <div class="live-preview">
                                                            <div class="d-flex flex-wrap gap-3">
                                                                <div class="btn-group">
                                                                    <button type="button" class="btn btn-primary">Primary</button>
                                                                    <button type="button" class="btn btn-primary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
                                                                    <div class="dropdown-menu">
                                                                        <a class="dropdown-item" href="#">Action</a>
                                                                        <a class="dropdown-item" href="#">Another action</a>
                                                                        <a class="dropdown-item" href="#">Something else here</a>
                                                                        <div class="dropdown-divider"></div>
                                                                        <a class="dropdown-item" href="#">Separated link</a>
                                                                    </div>
                                                                </div>                                                                <!-- /btn-group -->

                                                                <div class="btn-group">
                                                                    <button type="button" class="btn btn-success">Success</button>
                                                                    <button type="button" class="btn btn-success dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
                                                                    <div class="dropdown-menu">
                                                                        <a class="dropdown-item" href="#">Action</a>
                                                                        <a class="dropdown-item" href="#">Another action</a>
                                                                        <a class="dropdown-item" href="#">Something else here</a>
                                                                        <div class="dropdown-divider"></div>
                                                                        <a class="dropdown-item" href="#">Separated link</a>
                                                                    </div>
                                                                </div>                                                                <!-- /btn-group -->

                                                                <div class="btn-group">
                                                                    <button type="button" class="btn btn-light">Light</button>
                                                                    <button type="button" class="btn btn-light dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
                                                                    <div class="dropdown-menu">
                                                                        <a class="dropdown-item" href="#">Action</a>
                                                                        <a class="dropdown-item" href="#">Another action</a>
                                                                        <a class="dropdown-item" href="#">Something else here</a>
                                                                        <div class="dropdown-divider"></div>
                                                                        <a class="dropdown-item" href="#">Separated link</a>
                                                                    </div>
                                                                </div>                                                                <!-- /btn-group -->

                                                                <div class="btn-group">
                                                                    <button type="button" class="btn btn-info">Info</button>
                                                                    <button type="button" class="btn btn-info dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
                                                                    <div class="dropdown-menu">
                                                                        <a class="dropdown-item" href="#">Action</a>
                                                                        <a class="dropdown-item" href="#">Another action</a>
                                                                        <a class="dropdown-item" href="#">Something else here</a>
                                                                        <div class="dropdown-divider"></div>
                                                                        <a class="dropdown-item" href="#">Separated link</a>
                                                                    </div>
                                                                </div>                                                                <!-- /btn-group -->

                                                                <div class="btn-group">
                                                                    <button type="button" class="btn btn-secondary">Secondary</button>
                                                                    <button type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
                                                                    <div class="dropdown-menu">
                                                                        <a class="dropdown-item" href="#">Action</a>
                                                                        <a class="dropdown-item" href="#">Another action</a>
                                                                        <a class="dropdown-item" href="#">Something else here</a>
                                                                        <div class="dropdown-divider"></div>
                                                                        <a class="dropdown-item" href="#">Separated link</a>
                                                                    </div>
                                                                </div>                                                                <!-- /btn-group -->

                                                                <div class="btn-group">
                                                                    <button type="button" class="btn btn-warning">Warning</button>
                                                                    <button type="button" class="btn btn-warning dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
                                                                    <div class="dropdown-menu">
                                                                        <a class="dropdown-item" href="#">Action</a>
                                                                        <a class="dropdown-item" href="#">Another action</a>
                                                                        <a class="dropdown-item" href="#">Something else here</a>
                                                                        <div class="dropdown-divider"></div>
                                                                        <a class="dropdown-item" href="#">Separated link</a>
                                                                    </div>
                                                                </div>                                                                <!-- /btn-group -->

                                                                <div class="btn-group">
                                                                    <button type="button" class="btn btn-danger">Danger</button>
                                                                    <button type="button" class="btn btn-danger dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
                                                                    <div class="dropdown-menu">
                                                                        <a class="dropdown-item" href="#">Action</a>
                                                                        <a class="dropdown-item" href="#">Another action</a>
                                                                        <a class="dropdown-item" href="#">Something else here</a>
                                                                        <div class="dropdown-divider"></div>
                                                                        <a class="dropdown-item" href="#">Separated link</a>
                                                                    </div>
                                                                </div>                                                                <!-- /btn-group -->

                                                                <div class="btn-group">
                                                                    <button type="button" class="btn btn-dark">Dark</button>
                                                                    <button type="button" class="btn btn-dark dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
                                                                    <div class="dropdown-menu">
                                                                        <a class="dropdown-item" href="#">Action</a>
                                                                        <a class="dropdown-item" href="#">Another action</a>
                                                                        <a class="dropdown-item" href="#">Something else here</a>
                                                                        <div class="dropdown-divider"></div>
                                                                        <a class="dropdown-item" href="#">Separated link</a>
                                                                    </div>
                                                                </div>                                                                <!-- /btn-group -->
                                                            </div>
                                                        </div>

                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="height: 375px;">
                                                                <code>&lt;!-- Split Button Dropdown --&gt;
&lt;div class=&quot;btn-group&quot;&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-primary&quot;&gt;Primary&lt;/button&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-primary dropdown-toggle dropdown-toggle-split&quot; data-bs-toggle=&quot;dropdown&quot; aria-haspopup=&quot;true&quot; aria-expanded=&quot;false&quot;&gt;&lt;/button&gt;
    &lt;div class=&quot;dropdown-menu&quot;&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Another action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Something else here&lt;/a&gt;
        &lt;div class=&quot;dropdown-divider&quot;&gt;&lt;/div&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Separated link&lt;/a&gt;
    &lt;/div&gt;
&lt;/div&gt;&lt;!-- /btn-group --&gt;</code>

                                                                <code>&lt;div class=&quot;btn-group&quot;&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-success&quot;&gt;Success&lt;/button&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-success dropdown-toggle dropdown-toggle-split&quot; data-bs-toggle=&quot;dropdown&quot; aria-haspopup=&quot;true&quot; aria-expanded=&quot;false&quot;&gt;&lt;/button&gt;
    &lt;div class=&quot;dropdown-menu&quot;&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Another action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Something else here&lt;/a&gt;
        &lt;div class=&quot;dropdown-divider&quot;&gt;&lt;/div&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Separated link&lt;/a&gt;
    &lt;/div&gt;
&lt;/div&gt;&lt;!-- /btn-group --&gt;</code>

                                                                <code>&lt;div class=&quot;btn-group&quot;&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-light&quot;&gt;Light&lt;/button&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-light dropdown-toggle dropdown-toggle-split&quot; data-bs-toggle=&quot;dropdown&quot; aria-haspopup=&quot;true&quot; aria-expanded=&quot;false&quot;&gt;&lt;/button&gt;
    &lt;div class=&quot;dropdown-menu&quot;&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Another action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Something else here&lt;/a&gt;
        &lt;div class=&quot;dropdown-divider&quot;&gt;&lt;/div&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Separated link&lt;/a&gt;
    &lt;/div&gt;
&lt;/div&gt;&lt;!-- /btn-group --&gt;</code>

                                                                <code>&lt;div class=&quot;btn-group&quot;&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-info&quot;&gt;Info&lt;/button&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-info dropdown-toggle dropdown-toggle-split&quot; data-bs-toggle=&quot;dropdown&quot; aria-haspopup=&quot;true&quot; aria-expanded=&quot;false&quot;&gt;&lt;/button&gt;
    &lt;div class=&quot;dropdown-menu&quot;&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Another action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Something else here&lt;/a&gt;
        &lt;div class=&quot;dropdown-divider&quot;&gt;&lt;/div&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Separated link&lt;/a&gt;
    &lt;/div&gt;
&lt;/div&gt;&lt;!-- /btn-group --&gt;</code>


                                                                <code>&lt;div class=&quot;btn-group&quot;&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-secondary&quot;&gt;Secondary&lt;/button&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-secondary dropdown-toggle dropdown-toggle-split&quot; data-bs-toggle=&quot;dropdown&quot; aria-haspopup=&quot;true&quot; aria-expanded=&quot;false&quot;&gt;&lt;/button&gt;
    &lt;div class=&quot;dropdown-menu&quot;&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Another action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Something else here&lt;/a&gt;
        &lt;div class=&quot;dropdown-divider&quot;&gt;&lt;/div&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Separated link&lt;/a&gt;
    &lt;/div&gt;
&lt;/div&gt;&lt;!-- /btn-group --&gt;</code>

                                                                <code>&lt;div class=&quot;btn-group&quot;&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-warning&quot;&gt;Warning&lt;/button&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-warning dropdown-toggle dropdown-toggle-split&quot; data-bs-toggle=&quot;dropdown&quot; aria-haspopup=&quot;true&quot; aria-expanded=&quot;false&quot;&gt;&lt;/button&gt;
    &lt;div class=&quot;dropdown-menu&quot;&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Another action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Something else here&lt;/a&gt;
        &lt;div class=&quot;dropdown-divider&quot;&gt;&lt;/div&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Separated link&lt;/a&gt;
    &lt;/div&gt;
&lt;/div&gt;&lt;!-- /btn-group --&gt;</code>

                                                                <code>&lt;div class=&quot;btn-group&quot;&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-danger&quot;&gt;Danger&lt;/button&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-danger dropdown-toggle dropdown-toggle-split&quot; data-bs-toggle=&quot;dropdown&quot; aria-haspopup=&quot;true&quot; aria-expanded=&quot;false&quot;&gt;&lt;/button&gt;
    &lt;div class=&quot;dropdown-menu&quot;&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Another action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Something else here&lt;/a&gt;
        &lt;div class=&quot;dropdown-divider&quot;&gt;&lt;/div&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Separated link&lt;/a&gt;
    &lt;/div&gt;
&lt;/div&gt;&lt;!-- /btn-group --&gt;</code>

                                                                <code>&lt;div class=&quot;btn-group&quot;&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-dark&quot;&gt;Dark&lt;/button&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-dark dropdown-toggle dropdown-toggle-split&quot; data-bs-toggle=&quot;dropdown&quot; aria-haspopup=&quot;true&quot; aria-expanded=&quot;false&quot;&gt;&lt;/button&gt;
    &lt;div class=&quot;dropdown-menu&quot;&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Another action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Something else here&lt;/a&gt;
        &lt;div class=&quot;dropdown-divider&quot;&gt;&lt;/div&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Separated link&lt;/a&gt;
    &lt;/div&gt;
&lt;/div&gt;&lt;!-- /btn-group --&gt;</code>
                                                            </pre>
                                                        </div>
                                                    </div>                                                    <!-- end card-body -->
                                                </div>                                                <!-- end card -->
                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">Dropdown Sizing</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="dropdown-size" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="dropdown-size"/>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">
                                                        <p class="text-muted">Use <code>btn-lg</code> class to create a large size dropdown
                                        button and <code>btn-sm</code> to create a small size dropdown button.</p>
                                                        <div class="live-preview">
                                                            <div class="d-flex flex-wrap gap-3 align-items-center">
                                                                <!-- Large button groups (default and split) -->
                                                                <div class="btn-group">
                                                                    <button class="btn btn-primary btn-lg dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    Large button
                                                                    </button>
                                                                    <div class="dropdown-menu">
                                                                        <a class="dropdown-item" href="#">Action</a>
                                                                        <a class="dropdown-item" href="#">Another action</a>
                                                                        <a class="dropdown-item" href="#">Something else here</a>
                                                                        <div class="dropdown-divider"></div>
                                                                        <a class="dropdown-item" href="#">Separated link</a>
                                                                    </div>
                                                                </div>

                                                                <div class="btn-group">
                                                                    <button class="btn btn-light btn-lg" type="button">
                                                    Large split button
                                                                    </button>
                                                                    <button type="button" class="btn btn-lg btn-light dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
                                                                    <div class="dropdown-menu">
                                                                        <a class="dropdown-item" href="#">Action</a>
                                                                        <a class="dropdown-item" href="#">Another action</a>
                                                                        <a class="dropdown-item" href="#">Something else here</a>
                                                                        <div class="dropdown-divider"></div>
                                                                        <a class="dropdown-item" href="#">Separated link</a>
                                                                    </div>
                                                                </div>

                                                                <!-- Small button groups (default and split) -->
                                                                <div class="btn-group">
                                                                    <button class="btn btn-primary btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    Small button
                                                                    </button>
                                                                    <div class="dropdown-menu">
                                                                        <a class="dropdown-item" href="#">Action</a>
                                                                        <a class="dropdown-item" href="#">Another action</a>
                                                                        <a class="dropdown-item" href="#">Something else here</a>
                                                                        <div class="dropdown-divider"></div>
                                                                        <a class="dropdown-item" href="#">Separated link</a>
                                                                    </div>
                                                                </div>

                                                                <div class="btn-group">
                                                                    <button class="btn btn-light btn-sm" type="button">
                                                    Small split button
                                                                    </button>
                                                                    <button type="button" class="btn btn-sm btn-light dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
                                                                    <div class="dropdown-menu">
                                                                        <a class="dropdown-item" href="#">Action</a>
                                                                        <a class="dropdown-item" href="#">Another action</a>
                                                                        <a class="dropdown-item" href="#">Something else here</a>
                                                                        <div class="dropdown-divider"></div>
                                                                        <a class="dropdown-item" href="#">Separated link</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="height: 375px;">
                                                                <code>&lt;!-- Dropdown Sizing --&gt;
&lt;div class=&quot;btn-group&quot;&gt;
    &lt;button class=&quot;btn btn-primary btn-lg dropdown-toggle&quot; type=&quot;button&quot; data-bs-toggle=&quot;dropdown&quot; aria-haspopup=&quot;true&quot; aria-expanded=&quot;false&quot;&gt;
        Large button
    &lt;/button&gt;
    &lt;div class=&quot;dropdown-menu&quot;&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Another action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Something else here&lt;/a&gt;
        &lt;div class=&quot;dropdown-divider&quot;&gt;&lt;/div&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Separated link&lt;/a&gt;
    &lt;/div&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;div class=&quot;btn-group&quot;&gt;
    &lt;button class=&quot;btn btn-light btn-lg&quot; type=&quot;button&quot;&gt;
        Large split button
    &lt;/button&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-lg btn-light dropdown-toggle dropdown-toggle-split&quot; data-bs-toggle=&quot;dropdown&quot; aria-haspopup=&quot;true&quot; aria-expanded=&quot;false&quot;&gt;
    &lt;/button&gt;
    &lt;div class=&quot;dropdown-menu&quot;&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Another action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Something else here&lt;/a&gt;
        &lt;div class=&quot;dropdown-divider&quot;&gt;&lt;/div&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Separated link&lt;/a&gt;
    &lt;/div&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;div class=&quot;btn-group&quot;&gt;
    &lt;button class=&quot;btn btn-primary btn-sm dropdown-toggle&quot; type=&quot;button&quot; data-bs-toggle=&quot;dropdown&quot; aria-haspopup=&quot;true&quot; aria-expanded=&quot;false&quot;&gt;
        Small button
    &lt;/button&gt;
    &lt;div class=&quot;dropdown-menu&quot;&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Another action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Something else here&lt;/a&gt;
        &lt;div class=&quot;dropdown-divider&quot;&gt;&lt;/div&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Separated link&lt;/a&gt;
    &lt;/div&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;div class=&quot;btn-group&quot;&gt;
    &lt;button class=&quot;btn btn-light btn-sm&quot; type=&quot;button&quot;&gt;
        Small split button
    &lt;/button&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-sm btn-light dropdown-toggle dropdown-toggle-split&quot; data-bs-toggle=&quot;dropdown&quot; aria-haspopup=&quot;true&quot; aria-expanded=&quot;false&quot;&gt;
    &lt;/button&gt;
    &lt;div class=&quot;dropdown-menu&quot;&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Another action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Something else here&lt;/a&gt;
        &lt;div class=&quot;dropdown-divider&quot;&gt;&lt;/div&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Separated link&lt;/a&gt;
    &lt;/div&gt;
&lt;/div&gt;</code>
                                                            </pre>
                                                        </div>
                                                    </div>                                                    <!-- end card-body -->
                                                </div>                                                <!-- end card -->
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">Dark Dropdowns</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="dark-dropdowns" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="dark-dropdowns"/>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">
                                                        <p class="text-muted">Use <code>dropdown-menu-dark</code> class onto an existing dropdown-menu to create dropdown items dark.</p>
                                                        <div class="live-preview">
                                                            <div class="dropdown">
                                                                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton2" data-bs-toggle="dropdown" aria-expanded="false">
                                                Dropdown button
                                                                </button>
                                                                <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdownMenuButton2">
                                                                    <li>
                                                                        <a class="dropdown-item active" href="#">Action</a>
                                                                    </li>
                                                                    <li>
                                                                        <a class="dropdown-item" href="#">Another action</a>
                                                                    </li>
                                                                    <li>
                                                                        <a class="dropdown-item" href="#">Something else here</a>
                                                                    </li>
                                                                    <li>
                                                                        <hr class="dropdown-divider"/>
                                                                    </li>
                                                                    <li>
                                                                        <a class="dropdown-item" href="#">Separated link</a>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>

                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="height: 200px;">
                                                                <code>&lt;!-- Dark Dropdowns --&gt;
&lt;div class=&quot;dropdown&quot;&gt;
    &lt;button class=&quot;btn btn-secondary dropdown-toggle&quot; type=&quot;button&quot; id=&quot;dropdownMenuButton2&quot; data-bs-toggle=&quot;dropdown&quot; aria-expanded=&quot;false&quot;&gt;
        Dropdown button
    &lt;/button&gt;
    &lt;ul class=&quot;dropdown-menu dropdown-menu-dark&quot; aria-labelledby=&quot;dropdownMenuButton2&quot;&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item active&quot; href=&quot;#&quot;&gt;Action&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Another action&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Something else here&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;
            &lt;hr class=&quot;dropdown-divider&quot;&gt;
        &lt;/li&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Separated link&lt;/a&gt;&lt;/li&gt;
    &lt;/ul&gt;
&lt;/div&gt;</code>
                                                            </pre>
                                                        </div>
                                                    </div>                                                    <!-- end card-body -->
                                                </div>                                                <!-- end card -->
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">Alignment options</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="alignment-options" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="alignment-options"/>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">
                                                        <p class="text-muted">Dropdown demo with various <code>dropdown alignment</code> options.</p>
                                                        <div class="live-preview">
                                                            <div class="d-flex flex-wrap gap-3">
                                                                <div class="btn-group">
                                                                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                                                    Dropdown
                                                                    </button>
                                                                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                                        <li>
                                                                            <a class="dropdown-item" href="#">Menu item</a>
                                                                        </li>
                                                                        <li>
                                                                            <a class="dropdown-item" href="#">Menu item</a>
                                                                        </li>
                                                                        <li>
                                                                            <a class="dropdown-item" href="#">Menu item</a>
                                                                        </li>
                                                                    </ul>
                                                                </div>

                                                                <div class="btn-group">
                                                                    <button type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                                    Right-aligned menu
                                                                    </button>
                                                                    <ul class="dropdown-menu dropdown-menu-end">
                                                                        <li>
                                                                            <a class="dropdown-item" href="#">Menu item</a>
                                                                        </li>
                                                                        <li>
                                                                            <a class="dropdown-item" href="#">Menu item</a>
                                                                        </li>
                                                                        <li>
                                                                            <a class="dropdown-item" href="#">Menu item</a>
                                                                        </li>
                                                                    </ul>
                                                                </div>

                                                                <div class="btn-group">
                                                                    <button type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown" data-bs-display="static" aria-expanded="false">
                                                    Left-aligned, right-aligned lg
                                                                    </button>
                                                                    <ul class="dropdown-menu dropdown-menu-lg-end">
                                                                        <li>
                                                                            <a class="dropdown-item" href="#">Menu item</a>
                                                                        </li>
                                                                        <li>
                                                                            <a class="dropdown-item" href="#">Menu item</a>
                                                                        </li>
                                                                        <li>
                                                                            <a class="dropdown-item" href="#">Menu item</a>
                                                                        </li>
                                                                    </ul>
                                                                </div>

                                                                <div class="btn-group">
                                                                    <button type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown" data-bs-display="static" aria-expanded="false">
                                                    Right-aligned, left-aligned lg
                                                                    </button>
                                                                    <ul class="dropdown-menu dropdown-menu-end dropdown-menu-lg-start">
                                                                        <li>
                                                                            <a class="dropdown-item" href="#">Menu item</a>
                                                                        </li>
                                                                        <li>
                                                                            <a class="dropdown-item" href="#">Menu item</a>
                                                                        </li>
                                                                        <li>
                                                                            <a class="dropdown-item" href="#">Menu item</a>
                                                                        </li>
                                                                    </ul>
                                                                </div>

                                                                <div class="btn-group dropstart">
                                                                    <button type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                                    Dropstart
                                                                    </button>
                                                                    <ul class="dropdown-menu">
                                                                        <li>
                                                                            <a class="dropdown-item" href="#">Menu item</a>
                                                                        </li>
                                                                        <li>
                                                                            <a class="dropdown-item" href="#">Menu item</a>
                                                                        </li>
                                                                        <li>
                                                                            <a class="dropdown-item" href="#">Menu item</a>
                                                                        </li>
                                                                    </ul>
                                                                </div>

                                                                <div class="btn-group dropend">
                                                                    <button type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                                    Dropend
                                                                    </button>
                                                                    <ul class="dropdown-menu">
                                                                        <li>
                                                                            <a class="dropdown-item" href="#">Menu item</a>
                                                                        </li>
                                                                        <li>
                                                                            <a class="dropdown-item" href="#">Menu item</a>
                                                                        </li>
                                                                        <li>
                                                                            <a class="dropdown-item" href="#">Menu item</a>
                                                                        </li>
                                                                    </ul>
                                                                </div>

                                                                <div class="btn-group dropup">
                                                                    <button type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                                    Dropup
                                                                    </button>
                                                                    <ul class="dropdown-menu">
                                                                        <li>
                                                                            <a class="dropdown-item" href="#">Menu item</a>
                                                                        </li>
                                                                        <li>
                                                                            <a class="dropdown-item" href="#">Menu item</a>
                                                                        </li>
                                                                        <li>
                                                                            <a class="dropdown-item" href="#">Menu item</a>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="height: 275px;">
                                                                <code>&lt;!-- Alignment options --&gt;
&lt;div class=&quot;btn-group&quot;&gt;
    &lt;button class=&quot;btn btn-secondary dropdown-toggle&quot; type=&quot;button&quot; id=&quot;dropdownMenuButton&quot; data-bs-toggle=&quot;dropdown&quot; aria-expanded=&quot;false&quot;&gt;
        Dropdown
    &lt;/button&gt;
    &lt;ul class=&quot;dropdown-menu&quot; aria-labelledby=&quot;dropdownMenuButton&quot;&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Menu item&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Menu item&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Menu item&lt;/a&gt;&lt;/li&gt;
    &lt;/ul&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;div class=&quot;btn-group&quot;&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-secondary dropdown-toggle&quot; data-bs-toggle=&quot;dropdown&quot; aria-expanded=&quot;false&quot;&gt;
        Right-aligned menu
    &lt;/button&gt;
    &lt;ul class=&quot;dropdown-menu dropdown-menu-end&quot;&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Menu item&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Menu item&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Menu item&lt;/a&gt;&lt;/li&gt;
    &lt;/ul&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;div class=&quot;btn-group&quot;&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-secondary dropdown-toggle&quot; data-bs-toggle=&quot;dropdown&quot; data-bs-display=&quot;static&quot; aria-expanded=&quot;false&quot;&gt;
        Left-aligned, right-aligned lg
    &lt;/button&gt;
    &lt;ul class=&quot;dropdown-menu dropdown-menu-lg-end&quot;&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Menu item&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Menu item&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Menu item&lt;/a&gt;&lt;/li&gt;
    &lt;/ul&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;div class=&quot;btn-group&quot;&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-secondary dropdown-toggle&quot; data-bs-toggle=&quot;dropdown&quot; data-bs-display=&quot;static&quot; aria-expanded=&quot;false&quot;&gt;
        Right-aligned, left-aligned lg
    &lt;/button&gt;
    &lt;ul class=&quot;dropdown-menu dropdown-menu-end dropdown-menu-lg-start&quot;&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Menu item&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Menu item&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Menu item&lt;/a&gt;&lt;/li&gt;
    &lt;/ul&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;div class=&quot;btn-group dropstart&quot;&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-secondary dropdown-toggle&quot; data-bs-toggle=&quot;dropdown&quot; aria-expanded=&quot;false&quot;&gt;
        Dropstart
    &lt;/button&gt;
    &lt;ul class=&quot;dropdown-menu&quot;&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Menu item&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Menu item&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Menu item&lt;/a&gt;&lt;/li&gt;
    &lt;/ul&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;div class=&quot;btn-group dropend&quot;&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-secondary dropdown-toggle&quot; data-bs-toggle=&quot;dropdown&quot; aria-expanded=&quot;false&quot;&gt;
        Dropend
    &lt;/button&gt;
    &lt;ul class=&quot;dropdown-menu&quot;&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Menu item&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Menu item&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Menu item&lt;/a&gt;&lt;/li&gt;
    &lt;/ul&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;div class=&quot;btn-group dropup&quot;&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-secondary dropdown-toggle&quot; data-bs-toggle=&quot;dropdown&quot; aria-expanded=&quot;false&quot;&gt;
        Dropup
    &lt;/button&gt;
    &lt;ul class=&quot;dropdown-menu&quot;&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Menu item&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Menu item&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Menu item&lt;/a&gt;&lt;/li&gt;
    &lt;/ul&gt;
&lt;/div&gt;</code>
                                                            </pre>
                                                        </div>
                                                    </div>                                                    <!-- end card-body -->
                                                </div>                                                <!-- end card -->
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">Dropdown Options</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="dropdown-options" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="dropdown-options"/>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">
                                                        <p class="text-muted">Use <code>data-bs-offset</code> or
                                                            <code>data-bs-reference</code> to change the position of the dropdown.
                                                        </p>

                                                        <div class="live-preview">
                                                            <div class="d-flex flex-wrap gap-3">
                                                                <div class="dropdown me-1">
                                                                    <button type="button" class="btn btn-secondary dropdown-toggle" id="dropdownMenuOffset" data-bs-toggle="dropdown" aria-expanded="false" data-bs-offset="10,20">
                                                    Offset
                                                                    </button>
                                                                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuOffset">
                                                                        <li>
                                                                            <a class="dropdown-item" href="#">Action</a>
                                                                        </li>
                                                                        <li>
                                                                            <a class="dropdown-item" href="#">Another action</a>
                                                                        </li>
                                                                        <li>
                                                                            <a class="dropdown-item" href="#">Something else here</a>
                                                                        </li>
                                                                    </ul>
                                                                </div>

                                                                <div class="btn-group">
                                                                    <button type="button" class="btn btn-secondary">Reference</button>
                                                                    <button type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split" id="dropdownMenuReference" data-bs-toggle="dropdown" aria-expanded="false" data-bs-reference="parent">
                                                                        <span class="visually-hidden">Toggle Dropdown</span>
                                                                    </button>
                                                                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuReference">
                                                                        <li>
                                                                            <a class="dropdown-item" href="#">Action</a>
                                                                        </li>
                                                                        <li>
                                                                            <a class="dropdown-item" href="#">Another action</a>
                                                                        </li>
                                                                        <li>
                                                                            <a class="dropdown-item" href="#">Something else here</a>
                                                                        </li>
                                                                        <li>
                                                                            <hr class="dropdown-divider"/>
                                                                        </li>
                                                                        <li>
                                                                            <a class="dropdown-item" href="#">Separated link</a>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="height: 275px;">
                                                                <code>&lt;!-- Dropdown Options --&gt;
&lt;div class=&quot;dropdown&quot;&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-secondary dropdown-toggle&quot; id=&quot;dropdownMenuOffset&quot; data-bs-toggle=&quot;dropdown&quot; aria-expanded=&quot;false&quot; data-bs-offset=&quot;10,20&quot;&gt;
        Offset
    &lt;/button&gt;
    &lt;ul class=&quot;dropdown-menu&quot; aria-labelledby=&quot;dropdownMenuOffset&quot;&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Action&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Another action&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Something else here&lt;/a&gt;&lt;/li&gt;
    &lt;/ul&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;div class=&quot;btn-group&quot;&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-secondary&quot;&gt;Reference&lt;/button&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-secondary dropdown-toggle dropdown-toggle-split&quot; id=&quot;dropdownMenuReference&quot; data-bs-toggle=&quot;dropdown&quot; aria-expanded=&quot;false&quot; data-bs-reference=&quot;parent&quot;&gt;
        &lt;span class=&quot;visually-hidden&quot;&gt;Toggle Dropdown&lt;/span&gt;
    &lt;/button&gt;
    &lt;ul class=&quot;dropdown-menu&quot; aria-labelledby=&quot;dropdownMenuReference&quot;&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Action&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Another action&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Something else here&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;
            &lt;hr class=&quot;dropdown-divider&quot;&gt;
        &lt;/li&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Separated link&lt;/a&gt;&lt;/li&gt;
    &lt;/ul&gt;
&lt;/div&gt;</code>
                                                            </pre>
                                                        </div>
                                                    </div>                                                    <!-- end card-body -->
                                                </div>                                                <!-- end card -->
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">Auto Close Behavior</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="auto-close-behavior" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="auto-close-behavior"/>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">
                                                        <p class="text-muted">By default, the dropdown menu is closed when clicking inside or outside the dropdown menu. You can use the <code>autoClose</code> option to change this behavior of the dropdown.</p>
                                                        <div class="live-preview">
                                                            <div class="d-flex flex-wrap gap-3">
                                                                <div class="btn-group">
                                                                    <button class="btn btn-light dropdown-toggle" type="button" id="defaultDropdown" data-bs-toggle="dropdown" data-bs-auto-close="true" aria-expanded="false">
                                                    Default dropdown
                                                                    </button>
                                                                    <ul class="dropdown-menu" aria-labelledby="defaultDropdown">
                                                                        <li>
                                                                            <a class="dropdown-item" href="javascript:void(0);">Menu item</a>
                                                                        </li>
                                                                        <li>
                                                                            <a class="dropdown-item" href="javascript:void(0);">Menu item</a>
                                                                        </li>
                                                                        <li>
                                                                            <a class="dropdown-item" href="javascript:void(0);">Menu item</a>
                                                                        </li>
                                                                    </ul>
                                                                </div>

                                                                <div class="btn-group">
                                                                    <button class="btn btn-light dropdown-toggle" type="button" id="dropdownMenuClickableOutside" data-bs-toggle="dropdown" data-bs-auto-close="inside" aria-expanded="false">
                                                    Clickable outside
                                                                    </button>
                                                                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuClickableOutside">
                                                                        <li>
                                                                            <a class="dropdown-item" href="javascript:void(0);">Menu item</a>
                                                                        </li>
                                                                        <li>
                                                                            <a class="dropdown-item" href="javascript:void(0);">Menu item</a>
                                                                        </li>
                                                                        <li>
                                                                            <a class="dropdown-item" href="javascript:void(0);">Menu item</a>
                                                                        </li>
                                                                    </ul>
                                                                </div>

                                                                <div class="btn-group">
                                                                    <button class="btn btn-light dropdown-toggle" type="button" id="dropdownMenuClickableInside" data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-expanded="false">
                                                    Clickable inside
                                                                    </button>
                                                                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuClickableInside">
                                                                        <li>
                                                                            <a class="dropdown-item" href="javascript:void(0);">Menu item</a>
                                                                        </li>
                                                                        <li>
                                                                            <a class="dropdown-item" href="javascript:void(0);">Menu item</a>
                                                                        </li>
                                                                        <li>
                                                                            <a class="dropdown-item" href="javascript:void(0);">Menu item</a>
                                                                        </li>
                                                                    </ul>
                                                                </div>

                                                                <div class="btn-group">
                                                                    <button class="btn btn-light dropdown-toggle" type="button" id="dropdownMenuClickable" data-bs-toggle="dropdown" data-bs-auto-close="false" aria-expanded="false">
                                                    Manual close
                                                                    </button>
                                                                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuClickable">
                                                                        <li>
                                                                            <a class="dropdown-item" href="javascript:void(0);">Menu item</a>
                                                                        </li>
                                                                        <li>
                                                                            <a class="dropdown-item" href="javascript:void(0);">Menu item</a>
                                                                        </li>
                                                                        <li>
                                                                            <a class="dropdown-item" href="javascript:void(0);">Menu item</a>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="height: 275px;">
                                                                <code>&lt;!-- Default dropdown --&gt;
&lt;div class=&quot;btn-group&quot;&gt;
    &lt;button class=&quot;btn btn-light dropdown-toggle&quot; type=&quot;button&quot; id=&quot;defaultDropdown&quot; data-bs-toggle=&quot;dropdown&quot; data-bs-auto-close=&quot;true&quot; aria-expanded=&quot;false&quot;&gt;
        Default dropdown
    &lt;/button&gt;
    &lt;ul class=&quot;dropdown-menu&quot; aria-labelledby=&quot;defaultDropdown&quot;&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;javascript:void(0);&quot;&gt;Menu item&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;javascript:void(0);&quot;&gt;Menu item&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;javascript:void(0);&quot;&gt;Menu item&lt;/a&gt;&lt;/li&gt;
    &lt;/ul&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;!-- Clickable outside dropdown --&gt;
&lt;div class=&quot;btn-group&quot;&gt;
    &lt;button class=&quot;btn btn-light dropdown-toggle&quot; type=&quot;button&quot; id=&quot;dropdownMenuClickableOutside&quot; data-bs-toggle=&quot;dropdown&quot; data-bs-auto-close=&quot;inside&quot; aria-expanded=&quot;false&quot;&gt;
        Clickable outside
    &lt;/button&gt;
    &lt;ul class=&quot;dropdown-menu&quot; aria-labelledby=&quot;dropdownMenuClickableOutside&quot;&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;javascript:void(0);&quot;&gt;Menu item&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;javascript:void(0);&quot;&gt;Menu item&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;javascript:void(0);&quot;&gt;Menu item&lt;/a&gt;&lt;/li&gt;
    &lt;/ul&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;!-- Clickable inside dropdown --&gt;
&lt;div class=&quot;btn-group&quot;&gt;
    &lt;button class=&quot;btn btn-light dropdown-toggle&quot; type=&quot;button&quot; id=&quot;dropdownMenuClickableInside&quot; data-bs-toggle=&quot;dropdown&quot; data-bs-auto-close=&quot;outside&quot; aria-expanded=&quot;false&quot;&gt;
        Clickable inside
    &lt;/button&gt;
    &lt;ul class=&quot;dropdown-menu&quot; aria-labelledby=&quot;dropdownMenuClickableInside&quot;&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;javascript:void(0);&quot;&gt;Menu item&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;javascript:void(0);&quot;&gt;Menu item&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;javascript:void(0);&quot;&gt;Menu item&lt;/a&gt;&lt;/li&gt;
    &lt;/ul&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;!-- Clickable inside dropdown --&gt;
    &lt;div class=&quot;btn-group&quot;&gt;
    &lt;button class=&quot;btn btn-light dropdown-toggle&quot; type=&quot;button&quot; id=&quot;dropdownMenuClickable&quot; data-bs-toggle=&quot;dropdown&quot; data-bs-auto-close=&quot;false&quot; aria-expanded=&quot;false&quot;&gt;
        Manual close
    &lt;/button&gt;
    &lt;ul class=&quot;dropdown-menu&quot; aria-labelledby=&quot;dropdownMenuClickable&quot;&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;javascript:void(0);&quot;&gt;Menu item&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;javascript:void(0);&quot;&gt;Menu item&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a class=&quot;dropdown-item&quot; href=&quot;javascript:void(0);&quot;&gt;Menu item&lt;/a&gt;&lt;/li&gt;
    &lt;/ul&gt;
&lt;/div&gt;</code>
                                                            </pre>
                                                        </div>
                                                    </div>                                                    <!-- end card-body -->
                                                </div>                                                <!-- end card -->
                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">Dropdown Menu Item Color</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="dropdown-menu-item-color" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="dropdown-menu-item-color"/>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">
                                                        <p class="text-muted">Example of dropdown menu and dropdown item color.</p>
                                                        <div class="live-preview">
                                                            <div class="row">
                                                                <div class="col-xxl-3">
                                                                    <div>
                                                                        <h6 class="font-size-13 mb-3">Dropdown Menu Success link example
                                                                        </h6>
                                                                        <div class="clearfix">
                                                                            <div class="dropdown-menu d-inline-block position-relative dropdownmenu-success" style="z-index: 1;">
                                                                                <a class="dropdown-item" href="#">Action</a>
                                                                                <a class="dropdown-item" href="#">Another action</a>
                                                                                <a class="dropdown-item active" href="#">Something else here</a>
                                                                                <div class="dropdown-divider"></div>
                                                                                <a class="dropdown-item" href="#">Separated link</a>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->

                                                                <div class="col-lg-9">
                                                                    <div class="mt-lg-0 mt-3">
                                                                        <h6 class="font-size-13 mb-0">Dropdown Menu link Color example</h6>
                                                                        <div>
                                                                            <div class="row">
                                                                                <div class="col-lg-4 col-sm-6">
                                                                                    <div class="mt-3">
                                                                                        <p class="font-size-13 mb-2">Dropdown menu Primary link</p>
                                                                                        <div class="btn-group">
                                                                                            <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">Primary</button>
                                                                                            <div class="dropdown-menu dropdownmenu-primary">
                                                                                                <a class="dropdown-item" href="#">Action</a>
                                                                                                <a class="dropdown-item" href="#">Another action</a>
                                                                                                <a class="dropdown-item" href="#">Something else here</a>
                                                                                                <div class="dropdown-divider"></div>
                                                                                                <a class="dropdown-item" href="#">Separated link</a>
                                                                                            </div>
                                                                                        </div>                                                                                        <!-- btn-group -->
                                                                                    </div>
                                                                                </div>
                                                                                <!--end col-->
                                                                                <div class="col-lg-4 col-sm-6">
                                                                                    <div class="mt-3">
                                                                                        <p class="font-size-13 mb-2">Dropdown menu Secondary link</p>
                                                                                        <div class="btn-group">
                                                                                            <button type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">Secondary</button>
                                                                                            <div class="dropdown-menu dropdownmenu-secondary">
                                                                                                <a class="dropdown-item" href="#">Action</a>
                                                                                                <a class="dropdown-item" href="#">Another action</a>
                                                                                                <a class="dropdown-item" href="#">Something else here</a>
                                                                                                <div class="dropdown-divider"></div>
                                                                                                <a class="dropdown-item" href="#">Separated link</a>
                                                                                            </div>
                                                                                        </div>                                                                                        <!-- btn-group -->
                                                                                    </div>
                                                                                </div>
                                                                                <!--end col-->
                                                                                <div class="col-lg-4 col-sm-6">
                                                                                    <div class="mt-3">
                                                                                        <p class="font-size-13 mb-2">Dropdown menu Success link</p>
                                                                                        <div class="btn-group">
                                                                                            <button type="button" class="btn btn-success dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">Success</button>
                                                                                            <div class="dropdown-menu dropdownmenu-success">
                                                                                                <a class="dropdown-item" href="#">Action</a>
                                                                                                <a class="dropdown-item" href="#">Another action</a>
                                                                                                <a class="dropdown-item" href="#">Something else here</a>
                                                                                                <div class="dropdown-divider"></div>
                                                                                                <a class="dropdown-item" href="#">Separated link</a>
                                                                                            </div>
                                                                                        </div>                                                                                        <!-- btn-group -->
                                                                                    </div>
                                                                                </div>
                                                                                <!--end col-->
                                                                                <div class="col-lg-4 col-sm-6">
                                                                                    <div class="mt-3">
                                                                                        <p class="font-size-13 mb-2">Dropdown menu Warning link</p>
                                                                                        <div class="btn-group">
                                                                                            <button type="button" class="btn btn-warning dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">Warning</button>
                                                                                            <div class="dropdown-menu dropdownmenu-warning">
                                                                                                <a class="dropdown-item" href="#">Action</a>
                                                                                                <a class="dropdown-item" href="#">Another action</a>
                                                                                                <a class="dropdown-item" href="#">Something else here</a>
                                                                                                <div class="dropdown-divider"></div>
                                                                                                <a class="dropdown-item" href="#">Separated link</a>
                                                                                            </div>
                                                                                        </div>                                                                                        <!-- btn-group -->
                                                                                    </div>
                                                                                </div>
                                                                                <!--end col-->
                                                                                <div class="col-lg-4 col-sm-6">
                                                                                    <div class="mt-3">
                                                                                        <p class="font-size-13 mb-2">Dropdown menu Info link</p>
                                                                                        <div class="btn-group">
                                                                                            <button type="button" class="btn btn-info dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">Info</button>
                                                                                            <div class="dropdown-menu dropdownmenu-info">
                                                                                                <a class="dropdown-item" href="#">Action</a>
                                                                                                <a class="dropdown-item" href="#">Another action</a>
                                                                                                <a class="dropdown-item" href="#">Something else here</a>
                                                                                                <div class="dropdown-divider"></div>
                                                                                                <a class="dropdown-item" href="#">Separated link</a>
                                                                                            </div>
                                                                                        </div>                                                                                        <!-- btn-group -->
                                                                                    </div>
                                                                                </div>
                                                                                <!--end col-->
                                                                                <div class="col-lg-4 col-sm-6">
                                                                                    <div class="mt-3">
                                                                                        <p class="font-size-13 mb-2">Dropdown menu Danger link</p>
                                                                                        <div class="btn-group">
                                                                                            <button type="button" class="btn btn-danger dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">Danger</button>
                                                                                            <div class="dropdown-menu dropdownmenu-danger">
                                                                                                <a class="dropdown-item" href="#">Action</a>
                                                                                                <a class="dropdown-item" href="#">Another action</a>
                                                                                                <a class="dropdown-item" href="#">Something else here</a>
                                                                                                <div class="dropdown-divider"></div>
                                                                                                <a class="dropdown-item" href="#">Separated link</a>
                                                                                            </div>
                                                                                        </div>                                                                                        <!-- btn-group -->
                                                                                    </div>
                                                                                </div>
                                                                                <!--end col-->
                                                                            </div>
                                                                            <!--end row-->

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->
                                                            </div>
                                                            <!--end row-->
                                                        </div>

                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="height: 275px;">
                                                                <code>&lt;!-- Dropdown Menu Item Color --&gt;
&lt;div class=&quot;btn-group&quot;&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-primary dropdown-toggle&quot; data-bs-toggle=&quot;dropdown&quot; aria-expanded=&quot;false&quot;&gt;Primary&lt;/button&gt;
    &lt;div class=&quot;dropdown-menu dropdownmenu-primary&quot;&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Another action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Something else here&lt;/a&gt;
        &lt;div class=&quot;dropdown-divider&quot;&gt;&lt;/div&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Separated link&lt;/a&gt;
    &lt;/div&gt;
&lt;/div&gt;&lt;!-- btn-group --&gt;</code>

                                                                <code>&lt;div class=&quot;btn-group&quot;&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-secondary dropdown-toggle&quot; data-bs-toggle=&quot;dropdown&quot; aria-expanded=&quot;false&quot;&gt;Secondary&lt;/button&gt;
    &lt;div class=&quot;dropdown-menu dropdownmenu-secondary&quot;&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Another action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Something else here&lt;/a&gt;
        &lt;div class=&quot;dropdown-divider&quot;&gt;&lt;/div&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Separated link&lt;/a&gt;
    &lt;/div&gt;
&lt;/div&gt;&lt;!-- btn-group --&gt;</code>

                                                                <code>&lt;div class=&quot;btn-group&quot;&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-success dropdown-toggle&quot; data-bs-toggle=&quot;dropdown&quot; aria-expanded=&quot;false&quot;&gt;Success&lt;/button&gt;
    &lt;div class=&quot;dropdown-menu dropdownmenu-success&quot;&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Another action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Something else here&lt;/a&gt;
        &lt;div class=&quot;dropdown-divider&quot;&gt;&lt;/div&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Separated link&lt;/a&gt;
    &lt;/div&gt;
&lt;/div&gt;&lt;!-- btn-group --&gt;</code>

                                                                <code>&lt;div class=&quot;btn-group&quot;&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-warning dropdown-toggle&quot; data-bs-toggle=&quot;dropdown&quot; aria-expanded=&quot;false&quot;&gt;Warning&lt;/button&gt;
    &lt;div class=&quot;dropdown-menu dropdownmenu-warning&quot;&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Another action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Something else here&lt;/a&gt;
        &lt;div class=&quot;dropdown-divider&quot;&gt;&lt;/div&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Separated link&lt;/a&gt;
    &lt;/div&gt;
&lt;/div&gt;&lt;!-- btn-group --&gt;</code>

                                                                <code>&lt;div class=&quot;btn-group&quot;&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-info dropdown-toggle&quot; data-bs-toggle=&quot;dropdown&quot; aria-expanded=&quot;false&quot;&gt;Info&lt;/button&gt;
    &lt;div class=&quot;dropdown-menu dropdownmenu-info&quot;&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Another action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Something else here&lt;/a&gt;
        &lt;div class=&quot;dropdown-divider&quot;&gt;&lt;/div&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Separated link&lt;/a&gt;
    &lt;/div&gt;
&lt;/div&gt;&lt;!-- btn-group --&gt;</code>

                                                                <code>&lt;div class=&quot;btn-group&quot;&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-danger dropdown-toggle&quot; data-bs-toggle=&quot;dropdown&quot; aria-expanded=&quot;false&quot;&gt;Danger&lt;/button&gt;
    &lt;div class=&quot;dropdown-menu dropdownmenu-danger&quot;&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Another action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Something else here&lt;/a&gt;
        &lt;div class=&quot;dropdown-divider&quot;&gt;&lt;/div&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Separated link&lt;/a&gt;
    &lt;/div&gt;
&lt;/div&gt;&lt;!-- btn-group --&gt;</code>
                                                            </pre>
                                                        </div>
                                                    </div>                                                    <!-- end card-body -->
                                                </div>                                                <!-- end card -->
                                            </div>
                                            <!--end col-->
                                        </div>
                                        <!--end row-->


                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">Menu Content</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="menu-content" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="menu-content"/>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">
                                                        <p class="text-muted">Example of dropdown menu containing
                                                            <code>Headers, Text and Forms</code> content.
                                                        </p>
                                                        <div class="live-preview">
                                                            <div class="d-flex flex-wrap gap-2">
                                                                <!-- Header -->
                                                                <div class="btn-group">
                                                                    <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    Header
                                                                    </button>
                                                                    <div class="dropdown-menu">
                                                                        <div class="dropdown-header noti-title">
                                                                            <h5 class="font-size-13 text-muted text-truncate mb-0">Welcome Jessie!</h5>
                                                                        </div>
                                                                        <!-- item-->
                                                                        <a class="dropdown-item" href="#">Action</a>
                                                                        <a class="dropdown-item" href="#">Another action</a>
                                                                        <a class="dropdown-item" href="#">Something else here</a>
                                                                        <div class="dropdown-divider"></div>
                                                                        <a class="dropdown-item" href="#">Separated link</a>
                                                                    </div>
                                                                </div>

                                                                <!-- Text -->
                                                                <div class="btn-group">
                                                                    <button type="button" class="btn btn-success dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    Text
                                                                    </button>
                                                                    <div class="dropdown-menu dropdown-menu-md p-3">
                                                                        <p>
                                                        Some example text that's free-flowing within the dropdown menu.
                                                                        </p>
                                                                        <p class="mb-0">
                                                        And this is more example text.
                                                                        </p>
                                                                    </div>
                                                                </div>

                                                                <!-- Forms -->
                                                                <div class="btn-group">
                                                                    <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    Forms
                                                                    </button>
                                                                    <div class="dropdown-menu dropdown-menu-md p-4">
                                                                        <form>
                                                                            <div class="mb-2">
                                                                                <label class="form-label" for="exampleDropdownFormEmail">Email address</label>
                                                                                <input type="email" class="form-control" id="exampleDropdownFormEmail" placeholder="email@example.com"/>
                                                                            </div>
                                                                            <div class="mb-2">
                                                                                <label class="form-label" for="exampleDropdownFormPassword">Password</label>
                                                                                <input type="password" class="form-control" id="exampleDropdownFormPassword" placeholder="Password"/>
                                                                            </div>
                                                                            <div class="mb-2">
                                                                                <div class="form-check custom-checkbox">
                                                                                    <input type="checkbox" class="form-check-input" id="rememberdropdownCheck"/>
                                                                                    <label class="form-check-label" for="rememberdropdownCheck">Remember me</label>
                                                                                </div>
                                                                            </div>
                                                                            <button type="submit" class="btn btn-primary">Sign in</button>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="height: 275px;">
                                                                <code>&lt;!-- Menu Content --&gt;
&lt;div class=&quot;btn-group&quot;&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-primary dropdown-toggle&quot; data-bs-toggle=&quot;dropdown&quot; aria-haspopup=&quot;true&quot; aria-expanded=&quot;false&quot;&gt;
        Header 
    &lt;/button&gt;
    &lt;div class=&quot;dropdown-menu&quot;&gt;
        &lt;div class=&quot;dropdown-header noti-title&quot;&gt;
            &lt;h5 class=&quot;font-size-13 text-muted text-truncate mn-0&quot;&gt;Welcome Jessie!&lt;/h5&gt;
        &lt;/div&gt;
        &lt;!-- item--&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Another action&lt;/a&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Something else here&lt;/a&gt;
        &lt;div class=&quot;dropdown-divider&quot;&gt;&lt;/div&gt;
        &lt;a class=&quot;dropdown-item&quot; href=&quot;#&quot;&gt;Separated link&lt;/a&gt;
    &lt;/div&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;!-- text Content --&gt;
&lt;div class=&quot;btn-group&quot;&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-success dropdown-toggle&quot; data-bs-toggle=&quot;dropdown&quot; aria-haspopup=&quot;true&quot; aria-expanded=&quot;false&quot;&gt;
        Text 
    &lt;/button&gt;
    &lt;div class=&quot;dropdown-menu dropdown-menu-md p-3&quot;&gt;
        &lt;p&gt;
            Some example text that's free-flowing within the dropdown menu.
        &lt;/p&gt;
        &lt;p class=&quot;mb-0&quot;&gt;
            And this is more example text.
        &lt;/p&gt;
    &lt;/div&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;!-- Forms Content --&gt;
&lt;div class=&quot;btn-group&quot;&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-light dropdown-toggle&quot; data-bs-toggle=&quot;dropdown&quot; aria-haspopup=&quot;true&quot; aria-expanded=&quot;false&quot;&gt;
        Forms 
    &lt;/button&gt;
    &lt;div class=&quot;dropdown-menu dropdown-menu-md p-4&quot;&gt;
        &lt;form&gt;
            &lt;div class=&quot;mb-2&quot;&gt;
                &lt;label class=&quot;form-label&quot; for=&quot;exampleDropdownFormEmail&quot;&gt;Email address&lt;/label&gt;
                &lt;input type=&quot;email&quot; class=&quot;form-control&quot; id=&quot;exampleDropdownFormEmail&quot; placeholder=&quot;email@example.com&quot;&gt;
            &lt;/div&gt;
            &lt;div class=&quot;mb-2&quot;&gt;
                &lt;label class=&quot;form-label&quot; for=&quot;exampleDropdownFormPassword&quot;&gt;Password&lt;/label&gt;
                &lt;input type=&quot;password&quot; class=&quot;form-control&quot; id=&quot;exampleDropdownFormPassword&quot; placeholder=&quot;Password&quot;&gt;
            &lt;/div&gt;
            &lt;div class=&quot;mb-2&quot;&gt;
                &lt;div class=&quot;form-check custom-checkbox&quot;&gt;
                    &lt;input type=&quot;checkbox&quot; class=&quot;form-check-input&quot; id=&quot;rememberdropdownCheck&quot;&gt;
                    &lt;label class=&quot;form-check-label&quot; for=&quot;rememberdropdownCheck&quot;&gt;Remember me&lt;/label&gt;
                &lt;/div&gt;
            &lt;/div&gt;
            &lt;button type=&quot;submit&quot; class=&quot;btn btn-primary&quot;&gt;Sign in&lt;/button&gt;
        &lt;/form&gt;
    &lt;/div&gt;
&lt;/div&gt;</code>
                                                            </pre>
                                                        </div>
                                                    </div>                                                    <!-- end card-body -->
                                                </div>                                                <!-- end card -->
                                            </div>
                                            <!--end col-->
                                        </div>
                                        <!--end row-->


                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">Notifications</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="default" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="default"/>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">
                                                        <p class="text-muted">Dropdown with notification containing multiple tabs.</p>
                                                        <div class="live-preview">
                                                            <div class="row g-3">
                                                                <div class="col-xxl-3 col-lg-5 col-md-6">
                                                                    <div class="dropdown-menu dropdown-menu-lg dropdown-menu-end p-0 d-inline-block position-relative w-100" aria-labelledby="page-header-notifications-dropdown" style="z-index: 1;">
                                                                        <div class="dropdown-head bg-primary bg-pattern rounded-top">
                                                                            <div class="p-3">
                                                                                <div class="row align-items-center">
                                                                                    <div class="col">
                                                                                        <h6 class="m-0 fs-16 fw-semibold text-white"> Notifications </h6>
                                                                                    </div>
                                                                                    <div class="col-auto dropdown-tabs">
                                                                                        <span class="badge badge-soft-light fs-13" data-key="t-view-all"> 4 New</span>
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                            <div class="px-2 pt-2">
                                                                                <ul class="nav nav-tabs dropdown-tabs nav-tabs-custom" data-dropdown-tabs="true" id="notificationItemsTab1" role="tablist">
                                                                                    <li class="nav-item waves-effect waves-light">
                                                                                        <a class="nav-link active" data-bs-toggle="tab" href="#all-noti-tab1" role="tab" aria-selected="true">
                                                                        All (4)
                                                                                        </a>
                                                                                    </li>
                                                                                    <li class="nav-item waves-effect waves-light">
                                                                                        <a class="nav-link" data-bs-toggle="tab" href="#messages-tab1" role="tab" aria-selected="false">
                                                                        Messages
                                                                                        </a>
                                                                                    </li>
                                                                                    <li class="nav-item waves-effect waves-light">
                                                                                        <a class="nav-link" data-bs-toggle="tab" href="#alerts-tab1" role="tab" aria-selected="false">
                                                                        Alerts
                                                                                        </a>
                                                                                    </li>
                                                                                </ul>
                                                                            </div>
                                                                        </div>

                                                                        <div class="tab-content" id="notificationItemsTabContent4">
                                                                            <div class="tab-pane fade show active py-2 ps-2" id="all-noti-tab1" role="tabpanel">
                                                                                <div data-simplebar="" style="max-height: 300px;" class="pe-2">
                                                                                    <div class="text-reset notification-item d-block dropdown-item">
                                                                                        <div class="d-flex">
                                                                                            <div class="flex-shrink-0 avatar-xs me-3">
                                                                                                <span class="avatar-title bg-soft-info text-info rounded-circle fs-16">
                                                                                                    <i class="bx bx-badge-check"></i>
                                                                                                </span>
                                                                                            </div>
                                                                                            <div class="flex-1">
                                                                                                <h6 class="mt-0 mb-2 lh-base">Your
                                                                                                    <b>Elite</b> author Graphic Optimization
                                                                                                    <span class="text-secondary">reward</span>
                                                                                is ready!
                                                                                                </h6>
                                                                                                <p class="mb-0 fs-11 fw-medium text-uppercase text-muted">
                                                                                                    <span>
                                                                                                        <i class="mdi mdi-clock-outline"></i> Just 30 sec ago</span>
                                                                                                </p>
                                                                                            </div>
                                                                                            <div class="px-2 fs-16">
                                                                                                <input class="form-check-input" type="checkbox"/>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="text-reset notification-item d-block dropdown-item">
                                                                                        <div class="d-flex">
                                                                                            <img src="{$themePath}/assets/images/users/avatar-2.jpg" class="me-3 rounded-circle avatar-xs" alt="user-pic"/>
                                                                                            <div class="flex-1">
                                                                                                <a href="#!">
                                                                                                    <h6 class="mt-0 mb-1 fs-13 fw-semibold"> Angela Bernier</h6>
                                                                                                </a>
                                                                                                <div class="fs-13 text-muted">
                                                                                                    <p class="mb-1">Answered to your comment on the cash flow forecast's graph 🔔.</p>
                                                                                                </div>
                                                                                                <p class="mb-0 fs-11 fw-medium text-uppercase text-muted">
                                                                                                    <span>
                                                                                                        <i class="mdi mdi-clock-outline"></i> 48 min ago</span>
                                                                                                </p>
                                                                                            </div>
                                                                                            <div class="px-2 fs-16">
                                                                                                <input class="form-check-input" type="checkbox"/>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="text-reset notification-item d-block dropdown-item">
                                                                                        <div class="d-flex">
                                                                                            <div class="flex-shrink-0 avatar-xs me-3">
                                                                                                <span class="avatar-title bg-soft-danger text-danger rounded-circle fs-16">
                                                                                                    <i class='bx bx-message-square-dots'></i>
                                                                                                </span>
                                                                                            </div>
                                                                                            <div class="flex-1">
                                                                                                <h6 class="mt-0 mb-2 fs-13 lh-base">You have received <b class="text-success">20</b> new messages in the conversation</h6>
                                                                                                <p class="mb-0 fs-11 fw-medium text-uppercase text-muted">
                                                                                                    <span>
                                                                                                        <i class="mdi mdi-clock-outline"></i> 2 hrs ago</span>
                                                                                                </p>
                                                                                            </div>
                                                                                            <div class="px-2 fs-16">
                                                                                                <input class="form-check-input" type="checkbox"/>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="text-reset notification-item d-block dropdown-item">
                                                                                        <div class="d-flex">
                                                                                            <img src="{$themePath}/assets/images/users/avatar-8.jpg" class="me-3 rounded-circle avatar-xs" alt="user-pic"/>
                                                                                            <div class="flex-1">
                                                                                                <a href="#!">
                                                                                                    <h6 class="mt-0 mb-1 fs-13 fw-semibold"> Maureen Gibson</h6>
                                                                                                </a>
                                                                                                <div class="fs-13 text-muted">
                                                                                                    <p class="mb-1">We talked about a project on linkedin.</p>
                                                                                                </div>
                                                                                                <p class="mb-0 fs-11 fw-medium text-uppercase text-muted">
                                                                                                    <span>
                                                                                                        <i class="mdi mdi-clock-outline"></i> 4 hrs ago</span>
                                                                                                </p>
                                                                                            </div>
                                                                                            <div class="px-2 fs-16">
                                                                                                <input class="form-check-input" type="checkbox"/>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="my-3 text-center">
                                                                                        <button type="button" class="btn btn-soft-success waves-effect waves-light">
                                                                        View All Notifications <i class="ri-arrow-right-line align-middle"></i>
                                                                                        </button>
                                                                                    </div>
                                                                                </div>

                                                                            </div>

                                                                            <div class="tab-pane fade py-2 ps-2" id="messages-tab1" role="tabpanel" aria-labelledby="messages-tab">
                                                                                <div data-simplebar="" style="max-height: 300px;" class="pe-2">
                                                                                    <div class="text-reset notification-item d-block dropdown-item">
                                                                                        <div class="d-flex">
                                                                                            <img src="{$themePath}/assets/images/users/avatar-3.jpg" class="me-3 rounded-circle avatar-xs" alt="user-pic"/>
                                                                                            <div class="flex-1">
                                                                                                <a href="#!">
                                                                                                    <h6 class="mt-0 mb-1 fs-13 fw-semibold"> James Lemire</h6>
                                                                                                </a>
                                                                                                <div class="fs-13 text-muted">
                                                                                                    <p class="mb-1">We talked about a project on linkedin.</p>
                                                                                                </div>
                                                                                                <p class="mb-0 fs-11 fw-medium text-uppercase text-muted">
                                                                                                    <span>
                                                                                                        <i class="mdi mdi-clock-outline"></i> 30 min ago</span>
                                                                                                </p>
                                                                                            </div>
                                                                                            <div class="px-2 fs-16">
                                                                                                <input class="form-check-input" type="checkbox"/>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="text-reset notification-item d-block dropdown-item">
                                                                                        <div class="d-flex">
                                                                                            <img src="{$themePath}/assets/images/users/avatar-2.jpg" class="me-3 rounded-circle avatar-xs" alt="user-pic"/>
                                                                                            <div class="flex-1">
                                                                                                <a href="#!">
                                                                                                    <h6 class="mt-0 mb-1 fs-13 fw-semibold"> Angela Bernier</h6>
                                                                                                </a>
                                                                                                <div class="fs-13 text-muted">
                                                                                                    <p class="mb-1">Answered to your comment on the cash flow forecast's graph 🔔.</p>
                                                                                                </div>
                                                                                                <p class="mb-0 fs-11 fw-medium text-uppercase text-muted">
                                                                                                    <span>
                                                                                                        <i class="mdi mdi-clock-outline"></i> 2 hrs ago</span>
                                                                                                </p>
                                                                                            </div>
                                                                                            <div class="px-2 fs-16">
                                                                                                <input class="form-check-input" type="checkbox"/>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="text-reset notification-item d-block dropdown-item">
                                                                                        <div class="d-flex">
                                                                                            <img src="{$themePath}/assets/images/users/avatar-6.jpg" class="me-3 rounded-circle avatar-xs" alt="user-pic"/>
                                                                                            <div class="flex-1">
                                                                                                <a href="#!">
                                                                                                    <h6 class="mt-0 mb-1 fs-13 fw-semibold"> Kenneth Brown</h6>
                                                                                                </a>
                                                                                                <div class="fs-13 text-muted">
                                                                                                    <p class="mb-1">Mentionned you in his comment on 📃 invoice #12501.</p>
                                                                                                </div>
                                                                                                <p class="mb-0 fs-11 fw-medium text-uppercase text-muted">
                                                                                                    <span>
                                                                                                        <i class="mdi mdi-clock-outline"></i> 10 hrs ago</span>
                                                                                                </p>
                                                                                            </div>
                                                                                            <div class="px-2 fs-16">
                                                                                                <input class="form-check-input" type="checkbox"/>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="text-reset notification-item d-block dropdown-item">
                                                                                        <div class="d-flex">
                                                                                            <img src="{$themePath}/assets/images/users/avatar-8.jpg" class="me-3 rounded-circle avatar-xs" alt="user-pic"/>
                                                                                            <div class="flex-1">
                                                                                                <a href="#!">
                                                                                                    <h6 class="mt-0 mb-1 fs-13 fw-semibold"> Maureen Gibson</h6>
                                                                                                </a>
                                                                                                <div class="fs-13 text-muted">
                                                                                                    <p class="mb-1">We talked about a project on linkedin.</p>
                                                                                                </div>
                                                                                                <p class="mb-0 fs-11 fw-medium text-uppercase text-muted">
                                                                                                    <span>
                                                                                                        <i class="mdi mdi-clock-outline"></i> 3 days ago</span>
                                                                                                </p>
                                                                                            </div>
                                                                                            <div class="px-2 fs-16">
                                                                                                <input class="form-check-input" type="checkbox"/>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="my-3 text-center">
                                                                                        <button type="button" class="btn btn-soft-success waves-effect waves-light">View
                                                                        All Messages <i class="ri-arrow-right-line align-middle"></i>
                                                                                        </button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="tab-pane fade p-4" id="alerts-tab1" role="tabpanel" aria-labelledby="alerts-tab">
                                                                                <div class="w-25 pt-3 mx-auto">
                                                                                    <img src="{$themePath}/assets/images/svg/bell.svg" class="img-fluid" alt="user-pic"/>
                                                                                </div>
                                                                                <div class="text-center pb-5 mt-2">
                                                                                    <h6 class="fs-18 fw-semibold lh-base">Hey! You have no any notifications </h6>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->

                                                                <div class="col-xxl-3 col-lg-5 col-md-6">
                                                                    <div class="dropdown-menu dropdown-menu-lg dropdown-menu-end p-0 d-inline-block position-relative w-100" aria-labelledby="page-header-notifications-dropdown" style="z-index: 1;">
                                                                        <div class="dropdown-head bg-success bg-pattern rounded-top">
                                                                            <div class="p-3">
                                                                                <div class="row align-items-center">
                                                                                    <div class="col">
                                                                                        <h6 class="m-0 fs-16 fw-semibold text-white"> Notifications </h6>
                                                                                    </div>
                                                                                    <div class="col-auto dropdown-tabs">
                                                                                        <span class="badge badge-soft-light fs-13" data-key="t-view-all"> 4 New</span>
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                            <div class="px-2 pt-2">
                                                                                <ul class="nav nav-tabs dropdown-tabs nav-tabs-custom" data-dropdown-tabs="true" id="notificationItemsTab2" role="tablist">
                                                                                    <li class="nav-item waves-effect waves-light">
                                                                                        <a class="nav-link active" data-bs-toggle="tab" href="#all-noti-tab2" role="tab" aria-selected="true">
                                                                        All (4)
                                                                                        </a>
                                                                                    </li>
                                                                                    <li class="nav-item waves-effect waves-light">
                                                                                        <a class="nav-link" data-bs-toggle="tab" href="#messages-tab2" role="tab" aria-selected="false">
                                                                        Messages
                                                                                        </a>
                                                                                    </li>
                                                                                    <li class="nav-item waves-effect waves-light">
                                                                                        <a class="nav-link" data-bs-toggle="tab" href="#alerts-tab2" role="tab" aria-selected="false">
                                                                        Alerts
                                                                                        </a>
                                                                                    </li>
                                                                                </ul>
                                                                            </div>
                                                                        </div>

                                                                        <div class="tab-content" id="notificationItemsTabContent1">
                                                                            <div class="tab-pane fade show active py-2 ps-2" id="all-noti-tab2" role="tabpanel">
                                                                                <div data-simplebar="" style="max-height: 300px;" class="pe-2">
                                                                                    <div class="text-reset notification-item d-block dropdown-item">
                                                                                        <div class="d-flex">
                                                                                            <div class="flex-shrink-0 avatar-xs me-3">
                                                                                                <span class="avatar-title bg-soft-info text-info rounded-circle fs-16">
                                                                                                    <i class="bx bx-badge-check"></i>
                                                                                                </span>
                                                                                            </div>
                                                                                            <div class="flex-1">
                                                                                                <h6 class="mt-0 mb-2 lh-base">Your
                                                                                                    <b>Elite</b> author Graphic Optimization
                                                                                                    <span class="text-secondary">reward</span>
                                                                                is ready!
                                                                                                </h6>
                                                                                                <p class="mb-0 fs-11 fw-medium text-uppercase text-muted">
                                                                                                    <span>
                                                                                                        <i class="mdi mdi-clock-outline"></i> Just 30 sec ago</span>
                                                                                                </p>
                                                                                            </div>
                                                                                            <div class="px-2 fs-16">
                                                                                                <input class="form-check-input" type="checkbox"/>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="text-reset notification-item d-block dropdown-item">
                                                                                        <div class="d-flex">
                                                                                            <img src="{$themePath}/assets/images/users/avatar-2.jpg" class="me-3 rounded-circle avatar-xs" alt="user-pic"/>
                                                                                            <div class="flex-1">
                                                                                                <a href="#!">
                                                                                                    <h6 class="mt-0 mb-1 fs-13 fw-semibold"> Angela Bernier</h6>
                                                                                                </a>
                                                                                                <div class="fs-13 text-muted">
                                                                                                    <p class="mb-1">Answered to your comment on the cash flow forecast's graph 🔔.</p>
                                                                                                </div>
                                                                                                <p class="mb-0 fs-11 fw-medium text-uppercase text-muted">
                                                                                                    <span>
                                                                                                        <i class="mdi mdi-clock-outline"></i> 48 min ago</span>
                                                                                                </p>
                                                                                            </div>
                                                                                            <div class="px-2 fs-16">
                                                                                                <input class="form-check-input" type="checkbox"/>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="text-reset notification-item d-block dropdown-item">
                                                                                        <div class="d-flex">
                                                                                            <div class="flex-shrink-0 avatar-xs me-3">
                                                                                                <span class="avatar-title bg-soft-danger text-danger rounded-circle fs-16">
                                                                                                    <i class='bx bx-message-square-dots'></i>
                                                                                                </span>
                                                                                            </div>
                                                                                            <div class="flex-1">
                                                                                                <h6 class="mt-0 mb-2 fs-13 lh-base">You have received <b class="text-success">20</b> new messages in the conversation</h6>
                                                                                                <p class="mb-0 fs-11 fw-medium text-uppercase text-muted">
                                                                                                    <span>
                                                                                                        <i class="mdi mdi-clock-outline"></i> 2 hrs ago</span>
                                                                                                </p>
                                                                                            </div>
                                                                                            <div class="px-2 fs-16">
                                                                                                <input class="form-check-input" type="checkbox"/>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="text-reset notification-item d-block dropdown-item">
                                                                                        <div class="d-flex">
                                                                                            <img src="{$themePath}/assets/images/users/avatar-8.jpg" class="me-3 rounded-circle avatar-xs" alt="user-pic"/>
                                                                                            <div class="flex-1">
                                                                                                <a href="#!">
                                                                                                    <h6 class="mt-0 mb-1 fs-13 fw-semibold"> Maureen Gibson</h6>
                                                                                                </a>
                                                                                                <div class="fs-13 text-muted">
                                                                                                    <p class="mb-1">We talked about a project on linkedin.</p>
                                                                                                </div>
                                                                                                <p class="mb-0 fs-11 fw-medium text-uppercase text-muted">
                                                                                                    <span>
                                                                                                        <i class="mdi mdi-clock-outline"></i> 4 hrs ago</span>
                                                                                                </p>
                                                                                            </div>
                                                                                            <div class="px-2 fs-16">
                                                                                                <input class="form-check-input" type="checkbox"/>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="my-3 text-center">
                                                                                        <button type="button" class="btn btn-soft-success waves-effect waves-light">View
                                                                        All Notifications <i class="ri-arrow-right-line align-middle"></i>
                                                                                        </button>
                                                                                    </div>
                                                                                </div>

                                                                            </div>

                                                                            <div class="tab-pane fade py-2 ps-2" id="messages-tab2" role="tabpanel" aria-labelledby="messages-tab">
                                                                                <div data-simplebar="" style="max-height: 300px;" class="pe-2">
                                                                                    <div class="text-reset notification-item d-block dropdown-item">
                                                                                        <div class="d-flex">
                                                                                            <img src="{$themePath}/assets/images/users/avatar-3.jpg" class="me-3 rounded-circle avatar-xs" alt="user-pic"/>
                                                                                            <div class="flex-1">
                                                                                                <a href="#!">
                                                                                                    <h6 class="mt-0 mb-1 fs-13 fw-semibold"> James Lemire</h6>
                                                                                                </a>
                                                                                                <div class="fs-13 text-muted">
                                                                                                    <p class="mb-1">We talked about a project on linkedin.</p>
                                                                                                </div>
                                                                                                <p class="mb-0 fs-11 fw-medium text-uppercase text-muted">
                                                                                                    <span>
                                                                                                        <i class="mdi mdi-clock-outline"></i> 30 min ago</span>
                                                                                                </p>
                                                                                            </div>
                                                                                            <div class="px-2 fs-16">
                                                                                                <input class="form-check-input" type="checkbox"/>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="text-reset notification-item d-block dropdown-item">
                                                                                        <div class="d-flex">
                                                                                            <img src="{$themePath}/assets/images/users/avatar-2.jpg" class="me-3 rounded-circle avatar-xs" alt="user-pic"/>
                                                                                            <div class="flex-1">
                                                                                                <a href="#!">
                                                                                                    <h6 class="mt-0 mb-1 fs-13 fw-semibold">Angela Bernier</h6>
                                                                                                </a>
                                                                                                <div class="fs-13 text-muted">
                                                                                                    <p class="mb-1">Answered to your comment on the cash flow forecast's graph 🔔.</p>
                                                                                                </div>
                                                                                                <p class="mb-0 fs-11 fw-medium text-uppercase text-muted">
                                                                                                    <span>
                                                                                                        <i class="mdi mdi-clock-outline"></i>2 hrs ago</span>
                                                                                                </p>
                                                                                            </div>
                                                                                            <div class="px-2 fs-16">
                                                                                                <input class="form-check-input" type="checkbox"/>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="text-reset notification-item d-block dropdown-item">
                                                                                        <div class="d-flex">
                                                                                            <img src="{$themePath}/assets/images/users/avatar-6.jpg" class="me-3 rounded-circle avatar-xs" alt="user-pic"/>
                                                                                            <div class="flex-1">
                                                                                                <a href="#!">
                                                                                                    <h6 class="mt-0 mb-1 fs-13 fw-semibold">Kenneth Brown</h6>
                                                                                                </a>
                                                                                                <div class="fs-13 text-muted">
                                                                                                    <p class="mb-1">Mentionned you in his comment on 📃 invoice #12501.</p>
                                                                                                </div>
                                                                                                <p class="mb-0 fs-11 fw-medium text-uppercase text-muted">
                                                                                                    <span>
                                                                                                        <i class="mdi mdi-clock-outline"></i> 10 hrs ago</span>
                                                                                                </p>
                                                                                            </div>
                                                                                            <div class="px-2 fs-16">
                                                                                                <input class="form-check-input" type="checkbox"/>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="text-reset notification-item d-block dropdown-item">
                                                                                        <div class="d-flex">
                                                                                            <img src="{$themePath}/assets/images/users/avatar-8.jpg" class="me-3 rounded-circle avatar-xs" alt="user-pic"/>
                                                                                            <div class="flex-1">
                                                                                                <a href="#!">
                                                                                                    <h6 class="mt-0 mb-1 fs-13 fw-semibold"> Maureen Gibson</h6>
                                                                                                </a>
                                                                                                <div class="fs-13 text-muted">
                                                                                                    <p class="mb-1">We talked about a project on linkedin.</p>
                                                                                                </div>
                                                                                                <p class="mb-0 fs-11 fw-medium text-uppercase text-muted">
                                                                                                    <span>
                                                                                                        <i class="mdi mdi-clock-outline"></i>3 days ago</span>
                                                                                                </p>
                                                                                            </div>
                                                                                            <div class="px-2 fs-16">
                                                                                                <input class="form-check-input" type="checkbox"/>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="my-3 text-center">
                                                                                        <button type="button" class="btn btn-soft-success waves-effect waves-light">View All Messages <i class="ri-arrow-right-line align-middle"></i>
                                                                                        </button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="tab-pane fade p-4" id="alerts-tab2" role="tabpanel" aria-labelledby="alerts-tab">
                                                                                <div class="w-25 pt-3 mx-auto">
                                                                                    <img src="{$themePath}/assets/images/svg/bell.svg" class="img-fluid" alt="user-pic"/>
                                                                                </div>
                                                                                <div class="text-center pb-5 mt-2">
                                                                                    <h6 class="fs-18 fw-semibold lh-base">Hey! You have no any notifications </h6>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->

                                                                <div class="col-xxl-3 col-lg-5 col-md-6">
                                                                    <div class="dropdown-menu dropdown-menu-lg dropdown-menu-end p-0 d-inline-block position-relative w-100" aria-labelledby="page-header-notifications-dropdown" style="z-index: 1;">
                                                                        <div class="dropdown-head bg-secondary bg-pattern rounded-top">
                                                                            <div class="p-3">
                                                                                <div class="row align-items-center">
                                                                                    <div class="col">
                                                                                        <h6 class="m-0 fs-16 fw-semibold text-white"> Notifications </h6>
                                                                                    </div>
                                                                                    <div class="col-auto dropdown-tabs">
                                                                                        <span class="badge badge-soft-light fs-13" data-key="t-view-all"> 4 New</span>
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                            <div class="px-2 pt-2">
                                                                                <ul class="nav nav-tabs dropdown-tabs nav-tabs-custom" data-dropdown-tabs="true" id="notificationItemsTab3" role="tablist">
                                                                                    <li class="nav-item waves-effect waves-light">
                                                                                        <a class="nav-link active" data-bs-toggle="tab" href="#all-noti-tab3" role="tab" aria-selected="true">
                                                                        All (4)
                                                                                        </a>
                                                                                    </li>
                                                                                    <li class="nav-item waves-effect waves-light">
                                                                                        <a class="nav-link" data-bs-toggle="tab" href="#messages-tab3" role="tab" aria-selected="false">
                                                                        Messages
                                                                                        </a>
                                                                                    </li>
                                                                                    <li class="nav-item waves-effect waves-light">
                                                                                        <a class="nav-link" data-bs-toggle="tab" href="#alerts-tab3" role="tab" aria-selected="false">
                                                                        Alerts
                                                                                        </a>
                                                                                    </li>
                                                                                </ul>
                                                                            </div>
                                                                        </div>

                                                                        <div class="tab-content" id="notificationItemsTabContent3">
                                                                            <div class="tab-pane fade show active py-2 ps-2" id="all-noti-tab3" role="tabpanel">
                                                                                <div data-simplebar="" style="max-height: 300px;" class="pe-2">
                                                                                    <div class="text-reset notification-item d-block dropdown-item">
                                                                                        <div class="d-flex">
                                                                                            <div class="flex-shrink-0 avatar-xs me-3">
                                                                                                <span class="avatar-title bg-soft-info text-info rounded-circle fs-16">
                                                                                                    <i class="bx bx-badge-check"></i>
                                                                                                </span>
                                                                                            </div>
                                                                                            <div class="flex-1">
                                                                                                <h6 class="mt-0 mb-2 lh-base">Your
                                                                                                    <b>Elite</b> author Graphic Optimization
                                                                                                    <span class="text-secondary">reward</span>
                                                                                is ready!
                                                                                                </h6>
                                                                                                <p class="mb-0 fs-11 fw-medium text-uppercase text-muted">
                                                                                                    <span>
                                                                                                        <i class="mdi mdi-clock-outline"></i>
                                                                                    Just 30 sec ago</span>
                                                                                                </p>
                                                                                            </div>
                                                                                            <div class="px-2 fs-16">
                                                                                                <input class="form-check-input" type="checkbox"/>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="text-reset notification-item d-block dropdown-item">
                                                                                        <div class="d-flex">
                                                                                            <img src="{$themePath}/assets/images/users/avatar-2.jpg" class="me-3 rounded-circle avatar-xs" alt="user-pic"/>
                                                                                            <div class="flex-1">
                                                                                                <a href="#!">
                                                                                                    <h6 class="mt-0 mb-1 fs-13 fw-semibold">Angela Bernier</h6>
                                                                                                </a>
                                                                                                <div class="fs-13 text-muted">
                                                                                                    <p class="mb-1">Answered to your comment on the cash flow forecast's graph 🔔.</p>
                                                                                                </div>
                                                                                                <p class="mb-0 fs-11 fw-medium text-uppercase text-muted">
                                                                                                    <span>
                                                                                                        <i class="mdi mdi-clock-outline"></i>48 min ago</span>
                                                                                                </p>
                                                                                            </div>
                                                                                            <div class="px-2 fs-16">
                                                                                                <input class="form-check-input" type="checkbox"/>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="text-reset notification-item d-block dropdown-item">
                                                                                        <div class="d-flex">
                                                                                            <div class="flex-shrink-0 avatar-xs me-3">
                                                                                                <span class="avatar-title bg-soft-danger text-danger rounded-circle fs-16">
                                                                                                    <i class='bx bx-message-square-dots'></i>
                                                                                                </span>
                                                                                            </div>
                                                                                            <div class="flex-1">
                                                                                                <h6 class="mt-0 mb-2 fs-13 lh-base">You have received <b class="text-success">20</b> new messages in the conversation</h6>
                                                                                                <p class="mb-0 fs-11 fw-medium text-uppercase text-muted">
                                                                                                    <span>
                                                                                                        <i class="mdi mdi-clock-outline"></i> 2 hrs ago</span>
                                                                                                </p>
                                                                                            </div>
                                                                                            <div class="px-2 fs-16">
                                                                                                <input class="form-check-input" type="checkbox"/>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="text-reset notification-item d-block dropdown-item">
                                                                                        <div class="d-flex">
                                                                                            <img src="{$themePath}/assets/images/users/avatar-8.jpg" class="me-3 rounded-circle avatar-xs" alt="user-pic"/>
                                                                                            <div class="flex-1">
                                                                                                <a href="#!">
                                                                                                    <h6 class="mt-0 mb-1 fs-13 fw-semibold">Maureen Gibson</h6>
                                                                                                </a>
                                                                                                <div class="fs-13 text-muted">
                                                                                                    <p class="mb-1">We talked about a project on linkedin.</p>
                                                                                                </div>
                                                                                                <p class="mb-0 fs-11 fw-medium text-uppercase text-muted">
                                                                                                    <span>
                                                                                                        <i class="mdi mdi-clock-outline"></i> 4 hrs ago</span>
                                                                                                </p>
                                                                                            </div>
                                                                                            <div class="px-2 fs-16">
                                                                                                <input class="form-check-input" type="checkbox"/>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="my-3 text-center">
                                                                                        <button type="button" class="btn btn-soft-success waves-effect waves-light">View All Notifications <i class="ri-arrow-right-line align-middle"></i>
                                                                                        </button>
                                                                                    </div>
                                                                                </div>

                                                                            </div>

                                                                            <div class="tab-pane fade py-2 ps-2" id="messages-tab3" role="tabpanel" aria-labelledby="messages-tab">
                                                                                <div data-simplebar="" style="max-height: 300px;" class="pe-2">
                                                                                    <div class="text-reset notification-item d-block dropdown-item">
                                                                                        <div class="d-flex">
                                                                                            <img src="{$themePath}/assets/images/users/avatar-3.jpg" class="me-3 rounded-circle avatar-xs" alt="user-pic"/>
                                                                                            <div class="flex-1">
                                                                                                <a href="#!">
                                                                                                    <h6 class="mt-0 mb-1 fs-13 fw-semibold">James Lemire</h6>
                                                                                                </a>
                                                                                                <div class="fs-13 text-muted">
                                                                                                    <p class="mb-1">We talked about a project on linkedin.</p>
                                                                                                </div>
                                                                                                <p class="mb-0 fs-11 fw-medium text-uppercase text-muted">
                                                                                                    <span>
                                                                                                        <i class="mdi mdi-clock-outline"></i> 30 min ago</span>
                                                                                                </p>
                                                                                            </div>
                                                                                            <div class="px-2 fs-16">
                                                                                                <input class="form-check-input" type="checkbox"/>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="text-reset notification-item d-block dropdown-item">
                                                                                        <div class="d-flex">
                                                                                            <img src="{$themePath}/assets/images/users/avatar-2.jpg" class="me-3 rounded-circle avatar-xs" alt="user-pic"/>
                                                                                            <div class="flex-1">
                                                                                                <a href="#!">
                                                                                                    <h6 class="mt-0 mb-1 fs-13 fw-semibold">Angela Bernier</h6>
                                                                                                </a>
                                                                                                <div class="fs-13 text-muted">
                                                                                                    <p class="mb-1">Answered to your comment on the cash flow forecast's graph 🔔.</p>
                                                                                                </div>
                                                                                                <p class="mb-0 fs-11 fw-medium text-uppercase text-muted">
                                                                                                    <span>
                                                                                                        <i class="mdi mdi-clock-outline"></i> 2 hrs ago</span>
                                                                                                </p>
                                                                                            </div>
                                                                                            <div class="px-2 fs-16">
                                                                                                <input class="form-check-input" type="checkbox"/>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="text-reset notification-item d-block dropdown-item">
                                                                                        <div class="d-flex">
                                                                                            <img src="{$themePath}/assets/images/users/avatar-6.jpg" class="me-3 rounded-circle avatar-xs" alt="user-pic"/>
                                                                                            <div class="flex-1">
                                                                                                <a href="#!">
                                                                                                    <h6 class="mt-0 mb-1 fs-13 fw-semibold">Kenneth Brown</h6>
                                                                                                </a>
                                                                                                <div class="fs-13 text-muted">
                                                                                                    <p class="mb-1">Mentionned you in his comment on 📃 invoice #12501.</p>
                                                                                                </div>
                                                                                                <p class="mb-0 fs-11 fw-medium text-uppercase text-muted">
                                                                                                    <span>
                                                                                                        <i class="mdi mdi-clock-outline"></i> 10 hrs ago</span>
                                                                                                </p>
                                                                                            </div>
                                                                                            <div class="px-2 fs-16">
                                                                                                <input class="form-check-input" type="checkbox"/>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="text-reset notification-item d-block dropdown-item">
                                                                                        <div class="d-flex">
                                                                                            <img src="{$themePath}/assets/images/users/avatar-8.jpg" class="me-3 rounded-circle avatar-xs" alt="user-pic"/>
                                                                                            <div class="flex-1">
                                                                                                <a href="#!">
                                                                                                    <h6 class="mt-0 mb-1 fs-13 fw-semibold"> Maureen Gibson</h6>
                                                                                                </a>
                                                                                                <div class="fs-13 text-muted">
                                                                                                    <p class="mb-1">We talked about a project on linkedin.</p>
                                                                                                </div>
                                                                                                <p class="mb-0 fs-11 fw-medium text-uppercase text-muted">
                                                                                                    <span>
                                                                                                        <i class="mdi mdi-clock-outline"></i> 3 days ago</span>
                                                                                                </p>
                                                                                            </div>
                                                                                            <div class="px-2 fs-16">
                                                                                                <input class="form-check-input" type="checkbox"/>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="my-3 text-center">
                                                                                        <button type="button" class="btn btn-soft-success waves-effect waves-light">View All Messages <i class="ri-arrow-right-line align-middle"></i>
                                                                                        </button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="tab-pane fade p-4" id="alerts-tab3" role="tabpanel" aria-labelledby="alerts-tab">
                                                                                <div class="w-25 pt-3 mx-auto">
                                                                                    <img src="{$themePath}/assets/images/svg/bell.svg" class="img-fluid" alt="user-pic"/>
                                                                                </div>
                                                                                <div class="text-center pb-5 mt-2">
                                                                                    <h6 class="fs-18 fw-semibold lh-base">Hey! You have no any notifications </h6>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->
                                                            </div>
                                                            <!--end row-->
                                                        </div>

                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="height: 275px;">
                                                                <code>&lt;!-- Notifications --&gt;
&lt;div class=&quot;dropdown-menu dropdown-menu-lg dropdown-menu-end p-0 d-inline-block position-relative&quot; aria-labelledby=&quot;page-header-notifications-dropdown&quot; style=&quot;z-index: 1;&quot;&gt;
    &lt;div class=&quot;dropdown-head bg-primary bg-pattern rounded-top&quot;&gt;
        &lt;div class=&quot;p-3&quot;&gt;
            &lt;div class=&quot;row align-items-center&quot;&gt;
                &lt;div class=&quot;col&quot;&gt;
                    &lt;h6 class=&quot;m-0 fs-16 fw-semibold text-white&quot;&gt; Notifications &lt;/h6&gt;
                &lt;/div&gt;
                &lt;div class=&quot;col-auto dropdown-tabs&quot;&gt;
                    &lt;span class=&quot;badge badge-soft-light fs-13&quot; data-key=&quot;t-view-all&quot;&gt; 4 New&lt;/span&gt;
                &lt;/div&gt;
            &lt;/div&gt;
        &lt;/div&gt;

        &lt;div class=&quot;px-2 pt-2&quot;&gt;
            &lt;ul class=&quot;nav nav-tabs dropdown-tabs nav-tabs-custom&quot; data-dropdown-tabs=&quot;true&quot; id=&quot;notificationItemsTab&quot; role=&quot;tablist&quot;&gt;
                &lt;li class=&quot;nav-item waves-effect waves-light&quot;&gt;
                    &lt;a class=&quot;nav-link active&quot; data-bs-toggle=&quot;tab&quot; href=&quot;#all-noti-tab1&quot; role=&quot;tab&quot; aria-selected=&quot;true&quot;&gt;
                        All (4)
                    &lt;/a&gt;
                &lt;/li&gt;
                &lt;li class=&quot;nav-item waves-effect waves-light&quot;&gt;
                    &lt;a class=&quot;nav-link&quot; data-bs-toggle=&quot;tab&quot; href=&quot;#messages-tab1&quot; role=&quot;tab&quot; aria-selected=&quot;false&quot;&gt;
                        Messages
                    &lt;/a&gt;
                &lt;/li&gt;
                &lt;li class=&quot;nav-item waves-effect waves-light&quot;&gt;
                    &lt;a class=&quot;nav-link&quot; data-bs-toggle=&quot;tab&quot; href=&quot;#alerts-tab1&quot; role=&quot;tab&quot; aria-selected=&quot;false&quot;&gt;
                        Alerts
                    &lt;/a&gt;
                &lt;/li&gt;
            &lt;/ul&gt;
        &lt;/div&gt;                                    
    &lt;/div&gt;

    &lt;div class=&quot;tab-content&quot; id=&quot;notificationItemsTabContent&quot;&gt;
        &lt;div class=&quot;tab-pane fade show active py-2 ps-2&quot; id=&quot;all-noti-tab1&quot; role=&quot;tabpanel&quot; aria-labelledby=&quot;updates-tab&quot;&gt;
            &lt;div data-simplebar style=&quot;max-height: 300px;&quot; class=&quot;pe-2&quot;&gt;
                &lt;a href=&quot;#!&quot; class=&quot;text-reset notification-item d-block dropdown-item&quot;&gt;
                    &lt;div class=&quot;d-flex&quot;&gt;
                        &lt;div class=&quot;avatar-xs me-3&quot;&gt;
                            &lt;span class=&quot;avatar-title bg-soft-info text-info rounded-circle fs-16&quot;&gt;
                                &lt;i class=&quot;bx bx-badge-check&quot;&gt;&lt;/i&gt;
                            &lt;/span&gt;
                        &lt;/div&gt;
                        &lt;div class=&quot;flex-1&quot;&gt;
                            &lt;h6 class=&quot;mt-0 mb-2 lh-base&quot;&gt;Your &lt;b&gt;Elite&lt;/b&gt; author Graphic Optimization &lt;span class=&quot;text-secondary&quot;&gt;reward&lt;/span&gt; is ready!&lt;/h6&gt;
                            &lt;p class=&quot;mb-0 fs-11 fw-medium text-uppercase text-muted&quot;&gt;
                                &lt;span&gt;&lt;i class=&quot;mdi mdi-clock-outline&quot;&gt;&lt;/i&gt; Just 30 sec ago&lt;/span&gt;
                            &lt;/p&gt;
                        &lt;/div&gt;
                        &lt;div class=&quot;px-2 fs-16&quot;&gt;
                            &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot;&gt;
                        &lt;/div&gt;
                    &lt;/div&gt;
                &lt;/a&gt;

                &lt;a href=&quot;#!&quot; class=&quot;text-reset notification-item d-block dropdown-item&quot;&gt;
                    &lt;div class=&quot;d-flex&quot;&gt;
                        &lt;img src=&quot;{$themePath}/assets/images/users/avatar-2.jpg&quot; class=&quot;me-3 rounded-circle avatar-xs&quot; alt=&quot;user-pic&quot;&gt;
                        &lt;div class=&quot;flex-1&quot;&gt;
                            &lt;h6 class=&quot;mt-0 mb-1 fs-13 fw-semibold&quot;&gt;Angela Bernier&lt;/h6&gt;
                            &lt;div class=&quot;fs-13 text-muted&quot;&gt;
                                &lt;p class=&quot;mb-1&quot;&gt;Answered to your comment on the cash flow forecast's graph 🔔.&lt;/p&gt;
                            &lt;/div&gt;
                            &lt;p class=&quot;mb-0 fs-11 fw-medium text-uppercase text-muted&quot;&gt;
                                &lt;span&gt;&lt;i class=&quot;mdi mdi-clock-outline&quot;&gt;&lt;/i&gt; 48 min ago&lt;/span&gt;
                            &lt;/p&gt;
                        &lt;/div&gt;
                        &lt;div class=&quot;px-2 fs-16&quot;&gt;
                            &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot;&gt;
                        &lt;/div&gt;
                    &lt;/div&gt;
                &lt;/a&gt;

                &lt;a href=&quot;#!&quot; class=&quot;text-reset notification-item d-block dropdown-item&quot;&gt;
                    &lt;div class=&quot;d-flex&quot;&gt;
                        &lt;div class=&quot;avatar-xs me-3&quot;&gt;
                            &lt;span class=&quot;avatar-title bg-soft-danger text-danger rounded-circle fs-16&quot;&gt;
                                &lt;i class='bx bx-message-square-dots' &gt;&lt;/i&gt;
                            &lt;/span&gt;
                        &lt;/div&gt;
                        &lt;div class=&quot;flex-1&quot;&gt;
                            &lt;h6 class=&quot;mt-0 mb-2 fs-13 lh-base&quot;&gt;You have received &lt;b class=&quot;text-success&quot;&gt;20&lt;/b&gt; new messages in the conversation&lt;/h6&gt;
                            &lt;p class=&quot;mb-0 fs-11 fw-medium text-uppercase text-muted&quot;&gt;
                                &lt;span&gt;&lt;i class=&quot;mdi mdi-clock-outline&quot;&gt;&lt;/i&gt; 2 hrs ago&lt;/span&gt;
                            &lt;/p&gt;
                        &lt;/div&gt;
                        &lt;div class=&quot;px-2 fs-16&quot;&gt;
                            &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot;&gt;
                        &lt;/div&gt;
                    &lt;/div&gt;
                &lt;/a&gt;

                &lt;a href=&quot;#!&quot; class=&quot;text-reset notification-item d-block dropdown-item&quot;&gt;
                    &lt;div class=&quot;d-flex&quot;&gt;
                        &lt;img src=&quot;{$themePath}/assets/images/users/avatar-8.jpg&quot; class=&quot;me-3 rounded-circle avatar-xs&quot; alt=&quot;user-pic&quot;&gt;
                        &lt;div class=&quot;flex-1&quot;&gt;
                            &lt;h6 class=&quot;mt-0 mb-1 fs-13 fw-semibold&quot;&gt;Maureen Gibson&lt;/h6&gt;
                            &lt;div class=&quot;fs-13 text-muted&quot;&gt;
                                &lt;p class=&quot;mb-1&quot;&gt;We talked about a project on linkedin.&lt;/p&gt;
                            &lt;/div&gt;
                            &lt;p class=&quot;mb-0 fs-11 fw-medium text-uppercase text-muted&quot;&gt;
                                &lt;span&gt;&lt;i class=&quot;mdi mdi-clock-outline&quot;&gt;&lt;/i&gt; 4 hrs ago&lt;/span&gt;
                            &lt;/p&gt;
                        &lt;/div&gt;
                        &lt;div class=&quot;px-2 fs-16&quot;&gt;
                            &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot;&gt;
                        &lt;/div&gt;
                    &lt;/div&gt;
                &lt;/a&gt;

                &lt;div class=&quot;my-3 text-center&quot;&gt;
                    &lt;button type=&quot;button&quot; class=&quot;btn btn-soft-success waves-effect waves-light&quot;&gt;View All Notifications &lt;i class=&quot;ri-arrow-right-line align-middle&quot;&gt;&lt;/i&gt;&lt;/button&gt;
                &lt;/div&gt;
            &lt;/div&gt;

        &lt;/div&gt;

        &lt;div class=&quot;tab-pane fade py-2 ps-2&quot; id=&quot;messages-tab1&quot; role=&quot;tabpanel&quot; aria-labelledby=&quot;messages-tab&quot;&gt;
            &lt;div data-simplebar style=&quot;max-height: 300px;&quot; class=&quot;pe-2&quot;&gt;
                &lt;a href=&quot;#!&quot; class=&quot;text-reset notification-item d-block dropdown-item&quot;&gt;
                    &lt;div class=&quot;d-flex&quot;&gt;
                        &lt;img src=&quot;{$themePath}/assets/images/users/avatar-3.jpg&quot; class=&quot;me-3 rounded-circle avatar-xs&quot; alt=&quot;user-pic&quot;&gt;
                        &lt;div class=&quot;flex-1&quot;&gt;
                            &lt;h6 class=&quot;mt-0 mb-1 fs-13 fw-semibold&quot;&gt;James Lemire&lt;/h6&gt;
                            &lt;div class=&quot;fs-13 text-muted&quot;&gt;
                                &lt;p class=&quot;mb-1&quot;&gt;We talked about a project on linkedin.&lt;/p&gt;
                            &lt;/div&gt;
                            &lt;p class=&quot;mb-0 fs-11 fw-medium text-uppercase text-muted&quot;&gt;
                                &lt;span&gt;&lt;i class=&quot;mdi mdi-clock-outline&quot;&gt;&lt;/i&gt; 30 min ago&lt;/span&gt;
                            &lt;/p&gt;
                        &lt;/div&gt;
                        &lt;div class=&quot;px-2 fs-16&quot;&gt;
                            &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot;&gt;
                        &lt;/div&gt;
                    &lt;/div&gt;
                &lt;/a&gt;

                &lt;a href=&quot;#!&quot; class=&quot;text-reset notification-item d-block dropdown-item&quot;&gt;
                    &lt;div class=&quot;d-flex&quot;&gt;
                        &lt;img src=&quot;{$themePath}/assets/images/users/avatar-2.jpg&quot; class=&quot;me-3 rounded-circle avatar-xs&quot; alt=&quot;user-pic&quot;&gt;
                        &lt;div class=&quot;flex-1&quot;&gt;
                            &lt;h6 class=&quot;mt-0 mb-1 fs-13 fw-semibold&quot;&gt;Angela Bernier&lt;/h6&gt;
                            &lt;div class=&quot;fs-13 text-muted&quot;&gt;
                                &lt;p class=&quot;mb-1&quot;&gt;Answered to your comment on the cash flow forecast's graph 🔔.&lt;/p&gt;
                            &lt;/div&gt;
                            &lt;p class=&quot;mb-0 fs-11 fw-medium text-uppercase text-muted&quot;&gt;
                                &lt;span&gt;&lt;i class=&quot;mdi mdi-clock-outline&quot;&gt;&lt;/i&gt; 2 hrs ago&lt;/span&gt;
                            &lt;/p&gt;
                        &lt;/div&gt;
                        &lt;div class=&quot;px-2 fs-16&quot;&gt;
                            &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot;&gt;
                        &lt;/div&gt;
                    &lt;/div&gt;
                &lt;/a&gt;

                &lt;a href=&quot;#!&quot; class=&quot;text-reset notification-item d-block dropdown-item&quot;&gt;
                    &lt;div class=&quot;d-flex&quot;&gt;
                        &lt;img src=&quot;{$themePath}/assets/images/users/avatar-6.jpg&quot; class=&quot;me-3 rounded-circle avatar-xs&quot; alt=&quot;user-pic&quot;&gt;
                        &lt;div class=&quot;flex-1&quot;&gt;
                            &lt;h6 class=&quot;mt-0 mb-1 fs-13 fw-semibold&quot;&gt;Kenneth Brown&lt;/h6&gt;
                            &lt;div class=&quot;fs-13 text-muted&quot;&gt;
                                &lt;p class=&quot;mb-1&quot;&gt;Mentionned you in his comment on 📃 invoice #12501.&lt;/p&gt;
                            &lt;/div&gt;
                            &lt;p class=&quot;mb-0 fs-11 fw-medium text-uppercase text-muted&quot;&gt;
                                &lt;span&gt;&lt;i class=&quot;mdi mdi-clock-outline&quot;&gt;&lt;/i&gt; 10 hrs ago&lt;/span&gt;
                            &lt;/p&gt;
                        &lt;/div&gt;
                        &lt;div class=&quot;px-2 fs-16&quot;&gt;
                            &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot;&gt;
                        &lt;/div&gt;
                    &lt;/div&gt;
                &lt;/a&gt;

                &lt;a href=&quot;#!&quot; class=&quot;text-reset notification-item d-block dropdown-item&quot;&gt;
                    &lt;div class=&quot;d-flex&quot;&gt;
                        &lt;img src=&quot;{$themePath}/assets/images/users/avatar-8.jpg&quot; class=&quot;me-3 rounded-circle avatar-xs&quot; alt=&quot;user-pic&quot;&gt;
                        &lt;div class=&quot;flex-1&quot;&gt;
                            &lt;h6 class=&quot;mt-0 mb-1 fs-13 fw-semibold&quot;&gt;Maureen Gibson&lt;/h6&gt;
                            &lt;div class=&quot;fs-13 text-muted&quot;&gt;
                                &lt;p class=&quot;mb-1&quot;&gt;We talked about a project on linkedin.&lt;/p&gt;
                            &lt;/div&gt;
                            &lt;p class=&quot;mb-0 fs-11 fw-medium text-uppercase text-muted&quot;&gt;
                                &lt;span&gt;&lt;i class=&quot;mdi mdi-clock-outline&quot;&gt;&lt;/i&gt; 3 days ago&lt;/span&gt;
                            &lt;/p&gt;
                        &lt;/div&gt;
                        &lt;div class=&quot;px-2 fs-16&quot;&gt;
                            &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot;&gt;
                        &lt;/div&gt;
                    &lt;/div&gt;
                &lt;/a&gt;

                &lt;div class=&quot;my-3 text-center&quot;&gt;
                    &lt;button type=&quot;button&quot; class=&quot;btn btn-soft-success waves-effect waves-light&quot;&gt;View All Messages &lt;i class=&quot;ri-arrow-right-line align-middle&quot;&gt;&lt;/i&gt;&lt;/button&gt;
                &lt;/div&gt;
            &lt;/div&gt;
        &lt;/div&gt;
        &lt;div class=&quot;tab-pane fade p-4&quot; id=&quot;alerts-tab1&quot; role=&quot;tabpanel&quot; aria-labelledby=&quot;alerts-tab&quot;&gt;
            &lt;div class=&quot;w-25 pt-3 mx-auto&quot;&gt;
                &lt;img src=&quot;{$themePath}/assets/images/svg/bell.svg&quot; class=&quot;img-fluid&quot; alt=&quot;user-pic&quot;&gt;
            &lt;/div&gt;
            &lt;div class=&quot;text-center pb-5 mt-2&quot;&gt;
                &lt;h6 class=&quot;fs-18 fw-semibold lh-base&quot;&gt;Hey! You have no any notifications &lt;/h6&gt;
            &lt;/div&gt;
        &lt;/div&gt;
    &lt;/div&gt;
&lt;/div&gt;</code>
                                                            </pre>
                                                        </div>
                                                    </div>                                                    <!-- end card-body -->
                                                </div>                                                <!-- end card -->
                                            </div>
                                            <!--end col-->
                                        </div>
                                        <!--end row-->



                                    </div>                                    <!-- container-fluid -->
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
