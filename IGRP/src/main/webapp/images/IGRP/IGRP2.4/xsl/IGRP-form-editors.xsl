<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/>

    <xsl:template match="/">
        <html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">
            <head>

                <!-- page includes css -->
                <!-- quill css -->
                <link href="{$path}/libs/quill/quill.core.css" rel="stylesheet" type="text/css" />
                <link href="{$path}/libs/quill/quill.bubble.css" rel="stylesheet" type="text/css" />
                <link href="{$path}/libs/quill/quill.snow.css" rel="stylesheet" type="text/css" />


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
                                                        <h4 class="card-title mb-0">Ckeditor Classic Editor</h4>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">
                                                        <p class="text-muted">Use <code>ckeditor-classic</code> class to set ckeditor classic editor.</p>
                                                        <div class="ckeditor-classic"></div>
                                                    </div>                                                    <!-- end card-body -->
                                                </div>                                                <!-- end card -->
                                            </div>
                                            <!-- end col -->
                                        </div>
                                        <!-- end row -->

                                        <div class="row mt-2">
                                            <div class="col-lg-12">

                                                <div class="justify-content-between d-flex align-items-center mb-3">
                                                    <h5 class="mb-0 pb-1 text-decoration-underline">Quilljs Editor</h5>
                                                </div>
                                                <div class="card">
                                                    <div class="card-header">
                                                        <h4 class="card-title mb-0">Snow Editor</h4>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">
                                                        <p class="text-muted">Use <code>snow-editor</code> class to set snow editor.</p>
                                                        <div class="snow-editor" style="height: 300px;">
                                                            <h3>
                                                                <span class="ql-size-large">Hello World!</span>
                                                            </h3>
                                                            <p>
                                                                <br/>
                                                            </p>
                                                            <h3>This is an simple editable area.</h3>
                                                            <p>
                                                                <br/>
                                                            </p>
                                                            <ul>
                                                                <li>
                                                Select a text to reveal the toolbar.
                                                                </li>
                                                                <li>
                                                Edit rich document on-the-fly, so elastic!
                                                                </li>
                                                            </ul>
                                                            <p>
                                                                <br/>
                                                            </p>
                                                            <p>
                                            End of simple area
                                                            </p>

                                                        </div>                                                        <!-- end Snow-editor-->
                                                    </div>                                                    <!-- end card-body -->
                                                </div>                                                <!-- end card -->

                                                <div class="card">
                                                    <div class="card-header">
                                                        <h4 class="card-title mb-0">Bubble Editor</h4>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">
                                                        <p class="text-muted">Use <code>bubble-editor</code> class to set bubble editor.</p>
                                                        <div class="bubble-editor" style="height: 300px;">
                                                            <h3>
                                                                <span class="ql-size-large">Hello World!</span>
                                                            </h3>
                                                            <p>
                                                                <br/>
                                                            </p>
                                                            <h3>This is an simple editable area.</h3>
                                                            <p>
                                                                <br/>
                                                            </p>
                                                            <ul>
                                                                <li>
                                                Select a text to reveal the toolbar.
                                                                </li>
                                                                <li>
                                                Edit rich document on-the-fly, so elastic!
                                                                </li>
                                                            </ul>
                                                            <p>
                                                                <br/>
                                                            </p>
                                                            <p>
                                            End of simple area
                                                            </p>

                                                        </div>
                                                    </div>                                                    <!-- end card-body -->
                                                </div>                                                <!-- end card -->
                                            </div>
                                            <!-- end col -->
                                        </div>
                                        <!-- end row -->

                                    </div>                                    <!-- container-fluid -->

                                </div>
                            </div>
                        </div>
                        <xsl:call-template name="igrp-footer"/>
                    </div>
                </div>


                <xsl:call-template name="igrp-page-helpers"/>

                <!-- page includes JS -->
                <!-- ckeditor -->
                <script src="{$path}/libs/@ckeditor/ckeditor5-build-classic/build/ckeditor.js"></script>

                <!-- quill js -->
                <script src="{$path}/libs/quill/quill.min.js"></script>

                <!-- init js -->
                <script src="{$themePath}/assets/js/pages/form-editor.init.js"></script>


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
