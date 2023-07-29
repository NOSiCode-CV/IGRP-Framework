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
                                                        <h4 class="card-title mb-0 flex-grow-1">Examples</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="default" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="default"></input>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">

                                                        <p class="text-muted mb-4">Use few flex utilities that allow even more flexibility and customization than before.</p>

                                                        <div class="live-preview">
                                                            <div class="d-flex align-items-start text-muted mb-4">
                                                                <div class="flex-shrink-0 me-3">
                                                                    <img src="{$themePath}/assets/images/users/avatar-2.jpg" class="avatar-sm rounded" alt="..."></img>
                                                                </div>

                                                                <div class="flex-grow-1">
                                                                    <h5 class="fs-14">Media heading</h5>
                                                This is some content from a media component. You can replace this with any content and adjust it as needed.
                                                                </div>
                                                            </div>

                                                            <div class="d-flex align-items-start text-muted mb-4">
                                                                <div class="flex-grow-1">
                                                                    <h5 class="fs-14">Media heading</h5>
                                                This is some content from a media component. You can replace this with any content and adjust it as needed.
                                                                </div>
                                                                <div class="flex-shrink-0 ms-3">
                                                                    <img src="{$themePath}/assets/images/users/avatar-3.jpg" class="avatar-sm rounded" alt="..."></img>
                                                                </div>
                                                            </div>

                                                            <div class="d-flex align-items-start text-muted">
                                                                <div class="flex-shrink-0 me-3">
                                                                    <img src="{$themePath}/assets/images/users/avatar-2.jpg" class="avatar-sm rounded" alt="..."></img>
                                                                </div>
                                                                <div class="flex-grow-1">
                                                                    <h5 class="fs-14">Media heading</h5>
                                                This is some content from a media component. You can replace this with any content and adjust it as needed.
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="height: 275px;">
                                                                <code>&lt;div class=&quot;d-flex align-items-start text-muted mb-4&quot;&gt;
    &lt;div class=&quot;flex-shrink-0 me-3&quot;&gt;
        &lt;img src=&quot;{$themePath}/assets/images/users/avatar-2.jpg&quot; class=&quot;avatar-sm rounded&quot; alt=&quot;...&quot;&gt;
    &lt;/div&gt;
    
    &lt;div class=&quot;flex-grow-1&quot;&gt;
        &lt;h5 class=&quot;fs-14&quot;&gt;Media heading&lt;/h5&gt;
        This is some content from a media component. You can replace this with any content and adjust it as needed.
    &lt;/div&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;div class=&quot;d-flex align-items-start text-muted mb-4&quot;&gt;
    &lt;div class=&quot;flex-grow-1&quot;&gt;
        &lt;h5 class=&quot;fs-14&quot;&gt;Media heading&lt;/h5&gt;
        This is some content from a media component. You can replace this with any content and adjust it as needed.
    &lt;/div&gt;
    &lt;div class=&quot;flex-shrink-0 ms-3&quot;&gt;
        &lt;img src=&quot;{$themePath}/assets/images/users/avatar-3.jpg&quot; class=&quot;avatar-sm rounded&quot; alt=&quot;...&quot;&gt;
    &lt;/div&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;div class=&quot;d-flex align-items-start text-muted&quot;&gt;
    &lt;div class=&quot;flex-shrink-0 me-3&quot;&gt;
        &lt;img src=&quot;{$themePath}/assets/images/users/avatar-2.jpg&quot; class=&quot;avatar-sm rounded&quot; alt=&quot;...&quot;&gt;
    &lt;/div&gt;
    &lt;div class=&quot;flex-grow-1&quot;&gt;
        &lt;h5 class=&quot;fs-14&quot;&gt;Media heading&lt;/h5&gt;
        This is some content from a media component. You can replace this with any content and adjust it as needed.
    &lt;/div&gt;
&lt;/div&gt;</code>
                                                            </pre>
                                                        </div>
                                                    </div>                                                    <!-- end card-body -->
                                                </div>                                                <!-- end card -->
                                            </div>
                                            <!-- end col -->

                                            <div class="col-xxl-6">
                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">Nesting Example</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="nestingmedia-showcode" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="nestingmedia-showcode"></input>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">
                                                        <p class="text-muted mb-4">Media objects can be infinitely nested, though we suggest you stop at some point. Place nested <code>d-flex align-items-start</code> within the <code>flex-grow-1</code> of a parent media object.</p>
                                                        <div class="live-preview">
                                                            <div class="d-flex align-items-start text-muted mb-4">
                                                                <div class="flex-shrink-0 me-3">
                                                                    <img src="{$themePath}/assets/images/users/avatar-2.jpg" class="avatar-sm rounded" alt="..."></img>
                                                                </div>
                                                                <div class="flex-grow-1">
                                                                    <h5 class="fs-14">Media heading</h5>
                                                This is some content from a media component. You can replace this with any content and adjust it as needed.
                                                                    <div class="d-flex align-items-start text-muted mt-3">
                                                                        <div class="flex-shrink-0 me-3">
                                                                            <img src="{$themePath}/assets/images/users/avatar-3.jpg" class="avatar-sm rounded" alt="..."></img>
                                                                        </div>
                                                                        <div class="flex-grow-1">
                                                                            <h5 class="fs-14">Media heading</h5>
                                                        This is some content from a media component. You can replace this with any content and adjust it as needed.
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="d-flex align-items-start text-muted">
                                                                <div class="flex-shrink-0 me-3">
                                                                    <img src="{$themePath}/assets/images/users/avatar-4.jpg" class="avatar-sm rounded" alt="..."></img>
                                                                </div>
                                                                <div class="flex-grow-1">
                                                                    <h5 class="fs-14">Media heading</h5>
                                                This is some content from a media component. You can replace this with any content and adjust it as needed.
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="height: 275px;">
                                                                <code>&lt;!-- Nesting Example --&gt;
&lt;div class=&quot;d-flex align-items-start text-muted mb-4&quot;&gt;
    &lt;div class=&quot;flex-shrink-0 me-3&quot;&gt;
        &lt;img src=&quot;{$themePath}/assets/images/users/avatar-2.jpg&quot; class=&quot;avatar-sm rounded&quot; alt=&quot;...&quot;&gt;
    &lt;/div&gt;
    &lt;div class=&quot;flex-grow-1&quot;&gt;
        &lt;h5 class=&quot;fs-14&quot;&gt;Media heading&lt;/h5&gt;
        This is some content from a media component. You can replace this with any content and adjust it as needed.
        &lt;div class=&quot;d-flex align-items-start text-muted mt-3&quot;&gt;
            &lt;div class=&quot;flex-shrink-0 me-3&quot;&gt;
                &lt;img src=&quot;{$themePath}/assets/images/users/avatar-3.jpg&quot; class=&quot;avatar-sm rounded&quot; alt=&quot;...&quot;&gt;
            &lt;/div&gt;
            &lt;div class=&quot;flex-grow-1&quot;&gt;
                &lt;h5 class=&quot;fs-14&quot;&gt;Media heading&lt;/h5&gt;
                This is some content from a media component. You can replace this with any content and adjust it as needed.
            &lt;/div&gt;
        &lt;/div&gt;
    &lt;/div&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;div class=&quot;d-flex align-items-start text-muted&quot;&gt;
    &lt;div class=&quot;flex-shrink-0 me-3&quot;&gt;
        &lt;img src=&quot;{$themePath}/assets/images/users/avatar-4.jpg&quot; class=&quot;avatar-sm rounded&quot; alt=&quot;...&quot;&gt;
    &lt;/div&gt;
    &lt;div class=&quot;flex-grow-1&quot;&gt;
        &lt;h5 class=&quot;fs-14&quot;&gt;Media heading&lt;/h5&gt;
        This is some content from a media component. You can replace this with any content and adjust it as needed.
    &lt;/div&gt;
&lt;/div&gt;</code>
                                                            </pre>
                                                        </div>
                                                    </div>                                                    <!-- end card-body -->
                                                </div>                                                <!-- end card -->
                                            </div>
                                            <!-- end col -->
                                        </div>
                                        <!-- end row -->

                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">Media Alignment</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="media-alignment-showcode" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="media-alignment-showcode"></input>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">

                                                        <p class="text-muted mb-4">The images or other media can be aligned top, middle, or bottom. The default is top aligned.</p>

                                                        <div class="live-preview">
                                                            <div class="d-flex align-items-start text-muted mb-4">
                                                                <div class="flex-shrink-0 me-3">
                                                                    <img src="{$themePath}/assets/images/users/avatar-2.jpg" class="avatar-sm rounded" alt="..."></img>
                                                                </div>

                                                                <div class="flex-grow-1">
                                                                    <h5 class="fs-14">Top Aligned media</h5>
                                                                    <p class="mb-1">Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
                                                                    <p class="mb-0">Donec sed odio dui. Nullam quis risus eget urna mollis ornare vel eu leo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p>
                                                                </div>
                                                            </div>

                                                            <div class="d-flex align-items-center text-muted mb-4">
                                                                <div class="flex-shrink-0 me-3">
                                                                    <img src="{$themePath}/assets/images/users/avatar-6.jpg" class="avatar-sm rounded" alt="..."></img>
                                                                </div>

                                                                <div class="flex-grow-1">
                                                                    <h5 class="fs-14">Center Aligned media</h5>
                                                                    <p class="mb-1">Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
                                                                    <p class="mb-0">Donec sed odio dui. Nullam quis risus eget urna mollis ornare vel eu leo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p>
                                                                </div>
                                                            </div>

                                                            <div class="d-flex align-items-end text-muted">
                                                                <div class="flex-shrink-0 me-3">
                                                                    <img src="{$themePath}/assets/images/users/avatar-8.jpg" class="avatar-sm rounded" alt="..."></img>
                                                                </div>

                                                                <div class="flex-grow-1">
                                                                    <h5 class="fs-14">Bottom Aligned media</h5>
                                                                    <p class="mb-1">Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
                                                                    <p class="mb-0">Donec sed odio dui. Nullam quis risus eget urna mollis ornare vel eu leo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="height: 275px;">
                                                                <code>&lt;!-- Media Alignment --&gt;
&lt;div class=&quot;d-flex align-items-start text-muted mb-4&quot;&gt;
    &lt;div class=&quot;flex-shrink-0 me-3&quot;&gt;
        &lt;img src=&quot;{$themePath}/assets/images/users/avatar-2.jpg&quot; class=&quot;avatar-sm rounded&quot; alt=&quot;...&quot;&gt;
    &lt;/div&gt;
    &lt;div class=&quot;flex-grow-1&quot;&gt;
        &lt;h5 class=&quot;fs-14&quot;&gt;Top Aligned media&lt;/h5&gt;
        &lt;p class=&quot;mb-1&quot;&gt;Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.&lt;/p&gt;
        &lt;p class=&quot;mb-0&quot;&gt;Donec sed odio dui. Nullam quis risus eget urna mollis ornare vel eu leo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.&lt;/p&gt;
    &lt;/div&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;div class=&quot;d-flex align-items-center text-muted mb-4&quot;&gt;
    &lt;div class=&quot;flex-shrink-0 me-3&quot;&gt;
        &lt;img src=&quot;{$themePath}/assets/images/users/avatar-6.jpg&quot; class=&quot;avatar-sm rounded&quot; alt=&quot;...&quot;&gt;
    &lt;/div&gt;
    &lt;div class=&quot;flex-grow-1&quot;&gt;
        &lt;h5 class=&quot;fs-14&quot;&gt;Center Aligned media&lt;/h5&gt;
        &lt;p class=&quot;mb-1&quot;&gt;Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.&lt;/p&gt;
        &lt;p class=&quot;mb-0&quot;&gt;Donec sed odio dui. Nullam quis risus eget urna mollis ornare vel eu leo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.&lt;/p&gt;
    &lt;/div&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;div class=&quot;d-flex align-items-end text-muted&quot;&gt;
    &lt;div class=&quot;flex-shrink-0 me-3&quot;&gt;
        &lt;img src=&quot;{$themePath}/assets/images/users/avatar-8.jpg&quot; class=&quot;avatar-sm rounded&quot; alt=&quot;...&quot;&gt;
    &lt;/div&gt;
    &lt;div class=&quot;flex-grow-1&quot;&gt;
        &lt;h5 class=&quot;fs-14&quot;&gt;Bottom Aligned media&lt;/h5&gt;
        &lt;p class=&quot;mb-1&quot;&gt;Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.&lt;/p&gt;
        &lt;p class=&quot;mb-0&quot;&gt;Donec sed odio dui. Nullam quis risus eget urna mollis ornare vel eu leo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.&lt;/p&gt;
    &lt;/div&gt;
&lt;/div&gt;</code>
                                                            </pre>
                                                        </div>
                                                    </div>                                                    <!-- end card-body -->
                                                </div>                                                <!-- end card -->
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
