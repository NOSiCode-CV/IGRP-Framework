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
                                                    <div class="card-header">
                                                        <h4 class="card-title mb-0">Examples</h4>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">
                                                        <form action="#">
                                                            <div>
                                                                <h5 class="fs-14 mb-3 text-muted">Date Formatting</h5>
                                                                <div class="row">
                                                                    <div class="col-xl-6">
                                                                        <div class="mb-3">
                                                                            <label for="cleave-date" class="form-label">Date</label>
                                                                            <input type="text" class="form-control" placeholder="DD-MM-YYYY" id="cleave-date"></input>
                                                                        </div>

                                                                    </div>                                                                    <!-- end col -->

                                                                    <div class="col-xl-6">
                                                                        <div class="mb-3">
                                                                            <label for="cleave-date-format" class="form-label">Date Formatting</label>
                                                                            <input type="text" class="form-control" placeholder="MM/YY" id="cleave-date-format"></input>
                                                                        </div>
                                                                    </div>                                                                    <!-- end col -->
                                                                </div>                                                                <!-- end row -->
                                                            </div>

                                                            <div class="border mt-3 border-dashed"></div>

                                                            <div class="mt-4">
                                                                <h6 class="mb-3 fs-14 text-muted">Time Formatting</h6>
                                                                <div class="row">
                                                                    <div class="col-xl-6">
                                                                        <div class="mb-3">
                                                                            <label for="cleave-time" class="form-label">Time</label>
                                                                            <input type="text" class="form-control" placeholder="hh:mm:ss" id="cleave-time"></input>
                                                                        </div>

                                                                    </div>                                                                    <!-- end col -->

                                                                    <div class="col-xl-6">
                                                                        <div class="mb-3">
                                                                            <label for="cleave-time-format" class="form-label">Time Formatting</label>
                                                                            <input type="text" class="form-control" placeholder="hh:mm" id="cleave-time-format"></input>
                                                                        </div>
                                                                    </div>                                                                    <!-- end col -->
                                                                </div>                                                                <!-- end row -->
                                                            </div>

                                                            <div class="border mt-3 border-dashed"></div>

                                                            <div class="mt-4">
                                                                <h5 class="fs-14 mb-3 text-muted">Custom Options</h5>
                                                                <div class="row">
                                                                    <div class="col-xl-6">
                                                                        <div class="mb-3">
                                                                            <label for="cleave-ccard" class="form-label">Credit Card</label>
                                                                            <input type="text" class="form-control" id="cleave-ccard" placeholder="xxxx xxxx xxxx xxxx"></input>
                                                                        </div>

                                                                    </div>                                                                    <!-- end col -->

                                                                    <div class="col-xl-6">
                                                                        <div class="mb-3">
                                                                            <label for="cleave-delimiter" class="form-label">Delimiter</label>
                                                                            <input type="text" class="form-control" id="cleave-delimiter" placeholder="xxx·xxx·xxx"></input>
                                                                        </div>
                                                                    </div>                                                                    <!-- end col -->
                                                                </div>                                                                <!-- end row -->

                                                                <div class="row">
                                                                    <div class="col-xl-6">
                                                                        <div class="mb-3">
                                                                            <label for="cleave-delimiters" class="form-label">Delimiters</label>
                                                                            <input type="text" class="form-control" id="cleave-delimiters" placeholder="xxx.xxx.xxx-xx"></input>
                                                                        </div>
                                                                    </div>                                                                    <!-- end col -->

                                                                    <div class="col-xl-6">
                                                                        <div class="mb-3">
                                                                            <label for="cleave-prefix" class="form-label">Prefix</label>
                                                                            <input type="text" class="form-control" id="cleave-prefix"></input>
                                                                        </div>
                                                                    </div>                                                                    <!-- end col -->
                                                                </div>                                                                <!-- end row -->

                                                                <div class="row">
                                                                    <div class="col-xl-6">
                                                                        <div class="mb-3 mb-xl-0">
                                                                            <label for="cleave-phone" class="form-label">Phone</label>
                                                                            <input type="text" class="form-control" id="cleave-phone" placeholder="(xxx)xxx-xxxx"></input>
                                                                        </div>
                                                                    </div>                                                                    <!-- end col -->

                                                                    <div class="col-xl-6">
                                                                        <div class="mb-0">
                                                                            <label for="cleave-numeral" class="form-label">Numeral Formatting</label>
                                                                            <input type="text" class="form-control" placeholder="Enter numeral" id="cleave-numeral"></input>
                                                                        </div>
                                                                    </div>                                                                    <!-- end col -->
                                                                </div>                                                                <!-- end row -->

                                                            </div>
                                                        </form>                                                        <!-- end form -->
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
                <!-- cleave.js -->
                <script src="{$path}/libs/cleave.js/cleave.min.js"></script>
                <!-- form masks init -->
                <script src="{$themePath}/assets/js/pages/form-masks.init.js"></script>


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
