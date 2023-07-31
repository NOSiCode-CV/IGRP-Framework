<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/>

    <xsl:template match="/">
        <html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">
            <head>

                <!-- page includes css -->
                <!-- One of the following themes -->
                <link rel="stylesheet" href="{$path}/libs/@simonwep/pickr/themes/classic.min.css" />
                <!-- 'classic' theme -->
                <link rel="stylesheet" href="{$path}/libs/@simonwep/pickr/themes/monolith.min.css" />
                <!-- 'monolith' theme -->
                <link rel="stylesheet" href="{$path}/libs/@simonwep/pickr/themes/nano.min.css" />
                <!-- 'nano' theme -->


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
                                                        <h4 class="card-title mb-0">Flatpickr - Datepicker</h4>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">
                                                        <form action="#">
                                                            <div class="row gy-3">
                                                                <div class="col-lg-6">
                                                                    <div>
                                                                        <label class="form-label mb-0">Basic</label>
                                                                        <p class="text-muted">Set <code>data-provider="flatpickr" data-date-format="d M, Y"</code> attribute.</p>
                                                                        <input type="text" class="form-control" data-provider="flatpickr" data-date-format="d M, Y" />
                                                                    </div>
                                                                </div>
                                                                <!-- end col -->
                                                                <div class="col-lg-6">
                                                                    <div>
                                                                        <label class="form-label mb-0">DateTime</label>
                                                                        <p class="text-muted">Set <code>data-provider="flatpickr" data-date-format="d.m.y" data-enable-time</code> attribute.</p>
                                                                        <input type="text" class="form-control" data-provider="flatpickr" data-date-format="d.m.y" data-enable-time=""/>
                                                                    </div>
                                                                </div>
                                                                <!-- end col -->
                                                            </div>
                                                            <!-- end row -->
                                                            <div class="row">
                                                                <div class="col-lg-6">
                                                                    <div class="mt-3">
                                                                        <label class="form-label mb-0">Human-Friendly Dates</label>
                                                                        <p class="text-muted">Set <code>data-provider="flatpickr" data-altFormat="F j, Y"</code> attribute.</p>
                                                                        <input type="text" class="form-control flatpickr-input" data-provider="flatpickr" data-altFormat="F j, Y"/>
                                                                    </div>
                                                                </div>
                                                                <!-- end col -->
                                                                <div class="col-lg-6">
                                                                    <div class="mt-3">
                                                                        <label class="form-label mb-0">MinDate and MaxDate</label>
                                                                        <p class="text-muted">Set <code>data-provider="flatpickr" data-date-format="d M, Y" data-minDate="Your Min. Date" data-maxDate="Your Max. date"</code> attribute.</p>
                                                                        <input type="text" class="form-control" data-provider="flatpickr" data-date-format="d M, Y" data-minDate="25 12, 2021" data-maxDate="29 12,2021"/>
                                                                    </div>
                                                                </div>
                                                                <!-- end col -->
                                                            </div>
                                                            <!-- end row -->
                                                            <div class="row">
                                                                <div class="col-lg-6">
                                                                    <div class="mt-3">
                                                                        <label class="form-label mb-0">Default Date</label>
                                                                        <p class="text-muted">Set <code>data-provider="flatpickr" data-date-format="d M, Y" data-deafult-date="Your Default Date"</code> attribute.</p>
                                                                        <input type="text" class="form-control" data-provider="flatpickr" data-date-format="d M, Y" data-deafult-date="25 12,2021"/>
                                                                    </div>
                                                                </div>
                                                                <!-- end col -->
                                                                <div class="col-lg-6">
                                                                    <div class="mt-3">
                                                                        <label class="form-label mb-0">Disabling Dates</label>
                                                                        <p class="text-muted">Set <code>data-provider="flatpickr" data-disable="true"</code> attribute.</p>
                                                                        <input type="text" class="form-control" data-provider="flatpickr" data-date-format="d M, Y" data-disable-date="15 12,2021"/>
                                                                    </div>
                                                                </div>
                                                                <!-- end col -->
                                                            </div>
                                                            <!-- end row -->

                                                            <div class="row">
                                                                <div class="col-lg-6">
                                                                    <div class="mt-3">
                                                                        <label class="form-label mb-0">Selecting Multiple Dates</label>
                                                                        <p class="text-muted">Set <code>data-provider="flatpickr" data-date-format="d M, Y" data-multiple-date="true"</code> attribute.</p>
                                                                        <input type="text" class="form-control" data-provider="flatpickr" data-date-format="d M, Y" data-multiple-date="true"/>
                                                                    </div>
                                                                </div>
                                                                <!-- end col -->
                                                                <div class="col-lg-6">
                                                                    <div class="mt-3">
                                                                        <label class="form-label mb-0">Range</label>
                                                                        <p class="text-muted">Set <code>data-provider="flatpickr" data-date-format="d M, Y" data-range-date="true"</code> attribute.</p>
                                                                        <input type="text" class="form-control" data-provider="flatpickr" data-date-format="d M, Y" data-range-date="true"/>
                                                                    </div>
                                                                </div>
                                                                <!-- end col -->
                                                            </div>
                                                            <!-- end row -->

                                                            <div class="row">
                                                                <div class="col-lg-6">
                                                                    <div class="mt-3">
                                                                        <label class="form-label mb-0">Inline</label>
                                                                        <p class="text-muted">Set <code>data-provider="flatpickr" data-date-format="d M, Y" data-deafult-date="today" data-inline-date="true"</code> attribute.</p>
                                                                        <input type="text" class="form-control" data-provider="flatpickr" data-date-format="d M, Y" data-deafult-date="25 01,2021" data-inline-date="true"/>
                                                                    </div>
                                                                </div>
                                                                <!-- end col -->
                                                                <div class="col-lg-6">
                                                                    <div class="mt-3">
                                                                        <label class="form-label mb-0">Week Numbers</label>
                                                                        <p class="text-muted">Set <code>data-provider="flatpickr" data-date-format="d M, Y" data-week-number</code> attribute.</p>
                                                                        <input type="text" class="form-control" data-provider="flatpickr" data-date-format="d M, Y" data-week-number=""/>
                                                                    </div>
                                                                </div>
                                                                <!-- end col -->
                                                            </div>
                                                            <!-- end row -->

                                                        </form>                                                        <!-- end form -->
                                                    </div>                                                    <!-- end card-body -->
                                                </div>                                                <!-- end card -->
                                            </div>
                                            <!-- end col -->
                                        </div>
                                        <!-- end row -->

                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="card">
                                                    <div class="card-header">
                                                        <h4 class="card-title mb-0">Flatpickr - Timepicker</h4>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">
                                                        <form action="#">
                                                            <div class="row gy-3">
                                                                <div class="col-lg-6">
                                                                    <div>
                                                                        <label class="form-label mb-0">Timepicker</label>
                                                                        <p class="text-muted">Set <code>data-provider="timepickr" data-time-basic="true"</code> attribute.</p>
                                                                        <input type="text" class="form-control" data-provider="timepickr" data-time-basic="true" id="timepicker-example"/>
                                                                    </div>
                                                                </div>
                                                                <!-- end col -->
                                                                <div class="col-lg-6">
                                                                    <div>
                                                                        <label class="form-label mb-0">24-hour Time Picker</label>
                                                                        <p class="text-muted">Set <code>data-provider="timepickr" data-time-hrs="true"</code> attribute.</p>
                                                                        <input type="text" class="form-control" data-provider="timepickr" data-time-hrs="true" id="timepicker-24hrs"/>
                                                                    </div>
                                                                </div>
                                                                <!-- end col -->
                                                            </div>
                                                            <!-- end row -->
                                                            <div class="row">
                                                                <div class="col-lg-6">
                                                                    <div class="mt-3">
                                                                        <label class="form-label mb-0">Time Picker w/ Limits</label>
                                                                        <p class="text-muted">Set <code>data-provider="timepickr" data-min-time="Min.Time" data-max-time="Max.Time"</code> attribute.</p>
                                                                        <input type="text" class="form-control" data-provider="timepickr" data-min-time="13:00" data-max-time="16:00"/>
                                                                    </div>
                                                                </div>
                                                                <!-- end col -->
                                                                <div class="col-lg-6">
                                                                    <div class="mt-3">
                                                                        <label class="form-label mb-0">Preloading Time</label>
                                                                        <p class="text-muted">Set <code>data-provider="timepickr" data-default-time="Your Default Time"</code> attribute.</p>
                                                                        <input type="text" class="form-control" data-provider="timepickr" data-default-time="16:45"/>
                                                                    </div>
                                                                </div>
                                                                <!-- end col -->
                                                            </div>
                                                            <!-- end row -->
                                                            <div class="row">
                                                                <div class="col-lg-6">
                                                                    <div class="mt-3">
                                                                        <label class="form-label mb-0">Inline</label>
                                                                        <p class="text-muted">Set <code>data-provider="timepickr" data-time-inline="Your Default Time"</code> attribute.</p>
                                                                        <input type="text" class="form-control" data-provider="timepickr" data-time-inline="11:42"/>
                                                                    </div>
                                                                </div>
                                                                <!-- end col -->
                                                            </div>
                                                            <!-- end row -->
                                                        </form>                                                        <!-- end form -->
                                                    </div>                                                    <!-- end card-body -->
                                                </div>                                                <!-- end card -->
                                            </div>
                                            <!-- end col -->
                                        </div>
                                        <!-- end row -->

                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="card">
                                                    <div class="card-header">
                                                        <h4 class="card-title mb-0">Colorpicker</h4>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">
                                                        <div>

                                                            <div>
                                                                <h5 class="fs-14 mb-3">Themes</h5>
                                                                <div class="row g-4">
                                                                    <div class="col-lg-4 col-md-6">
                                                                        <div>
                                                                            <h5 class="fs-13 text-muted mb-2">Classic Demo</h5>
                                                                            <p class="text-muted">Use <code>classic-colorpicker</code> class to set classic colorpicker.</p>
                                                                            <div class="classic-colorpicker"></div>
                                                                        </div>
                                                                    </div>                                                                    <!-- end col -->
                                                                    <div class="col-lg-4 col-md-6">
                                                                        <div>
                                                                            <h5 class="fs-13 text-muted mb-2">Monolith Demo</h5>
                                                                            <p class="text-muted">Use <code>monolith-colorpicker</code> class to set monolith colorpicker.</p>
                                                                            <div class="monolith-colorpicker"></div>
                                                                        </div>
                                                                    </div>                                                                    <!-- end col -->
                                                                    <div class="col-lg-4 col-md-6">
                                                                        <div>
                                                                            <h5 class="fs-13 text-muted mb-2">Nano Demo</h5>
                                                                            <p class="text-muted">Use <code>nano-colorpicker</code> class to set nano colorpicker.</p>
                                                                            <div class="nano-colorpicker"></div>
                                                                        </div>
                                                                    </div>                                                                    <!-- end col -->
                                                                </div>                                                                <!-- end row -->
                                                            </div>

                                                            <div class="mt-5">
                                                                <h5 class="fs-14 mb-2">Options</h5>

                                                                <div class="row g-4">
                                                                    <div class="col-lg-4 col-md-6">
                                                                        <div class="mt-2">
                                                                            <h5 class="fs-13 text-muted mb-2">Demo</h5>
                                                                            <p class="text-muted">Use <code>colorpicker-demo</code> class to set demo option colorpicker.</p>
                                                                            <div class="colorpicker-demo"></div>
                                                                        </div>
                                                                    </div>                                                                    <!-- end col -->

                                                                    <div class="col-lg-4 col-md-6">
                                                                        <div class="mt-2">
                                                                            <h5 class="fs-13 text-muted mb-2">Picker with Opacity &amp; Hue</h5>
                                                                            <p class="text-muted">Use <code>colorpicker-opacity-hue</code> class to set colorpicker with opacity &amp; hue.</p>
                                                                            <div class="colorpicker-opacity-hue"></div>
                                                                        </div>
                                                                    </div>                                                                    <!-- end col -->

                                                                    <div class="col-lg-4 col-md-6">
                                                                        <div class="mt-2">
                                                                            <h5 class="fs-13 text-muted mb-2">Switches</h5>
                                                                            <p class="text-muted">Use <code>colorpicker-switch</code> class to set switch colorpicker.</p>
                                                                            <div class="colorpicker-switch"></div>
                                                                        </div>
                                                                    </div>                                                                    <!-- end col -->

                                                                    <div class="col-lg-4 col-md-6">
                                                                        <div class="mt-2">
                                                                            <h5 class="fs-13 text-muted mb-2">Picker with Input</h5>
                                                                            <p class="text-muted">Use <code>colorpicker-input</code> class to set colorpicker with input.</p>
                                                                            <div class="colorpicker-input"></div>
                                                                        </div>
                                                                    </div>                                                                    <!-- end col -->

                                                                    <div class="col-lg-4 col-md-6">
                                                                        <div class="mt-2">
                                                                            <h5 class="fs-13 text-muted mb-2">Color Format</h5>
                                                                            <p class="text-muted">Use <code>colorpicker-format</code> class to set colorpicker with format option.</p>
                                                                            <div class="colorpicker-format"></div>
                                                                        </div>
                                                                    </div>                                                                    <!-- end col -->
                                                                </div>
                                                                <!-- end row -->
                                                            </div>
                                                        </div>
                                                        <!-- end preview -->
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
                <!-- Modern colorpicker bundle -->
                <script src="{$path}/libs/@simonwep/pickr/pickr.min.js"></script>

                <!-- init js -->
                <script src="{$themePath}/assets/js/pages/form-pickers.init.js"></script>


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
