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
                                                        <div class="flex-grow-1">
                                                            <h4 class="card-title mb-0">HTML Highlight</h4>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">
                                                        <p class="text-muted">HTML highlight is used to mark or highlight text that is of property, relevance, or special interest to an HTML document. here is the example shown below.</p>

                                                        <div class="live-preview">
                                                            <pre>
                                                                <code class="language-markup">&lt;!DOCTYPE html&gt;
&lt;html&gt;
    &lt;head&gt;
        &lt;title&gt;Velzon - Responsive Admin Dashboard Template&lt;/title&gt;
    &lt;/head&gt;
    &lt;body&gt;
        &lt;div&gt;
            &lt;h1&gt;This is a Heading 1&lt;/h1&gt;
            &lt;h2&gt;This is a Heading 2&lt;/h2&gt;
            &lt;h3&gt;This is a Heading 3&lt;/h3&gt;
            &lt;h4&gt;This is a Heading 4&lt;/h4&gt;
        &lt;/div&gt;
        &lt;!-- end div content --&gt;
    &lt;/body&gt;
&lt;/html&gt;</code>
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
                                                        <div class="flex-grow-1">
                                                            <h4 class="card-title mb-0">CSS Highlight</h4>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">
                                                        <p class="text-muted">CSS highlight is used to mark or highlight text that is of property, relevance, or special interest to a CSS document. Here is the example shown below.</p>
                                                        <div class="live-preview">
                                                            <pre>
                                                                <code class="language-css">body {
    color: #212529; 
    background-color: #f3f3f9;
    font-family: "Poppins",sans-serif;
}

.example {
    margin: 0;
    color: #74788d; 
}</code>
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
                                                        <div class="flex-grow-1">
                                                            <h4 class="card-title mb-0">Javascript Highlight</h4>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">
                                                        <p class="text-muted">Javascript highlight is used to mark or highlight text that is of property, relevance, or special interest to a Javascript document. Here is the example shown below.</p>
                                                        <div class="live-preview">
                                                            <pre>
                                                                <code class="language-js">function myFunction() {
    var divElement = document.getElementById("myDIV");
    if (divElement.style.display === "none") {
      divElement.style.display = "block";
    } else {
      divElement.style.display = "none";
    }
}</code>
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
