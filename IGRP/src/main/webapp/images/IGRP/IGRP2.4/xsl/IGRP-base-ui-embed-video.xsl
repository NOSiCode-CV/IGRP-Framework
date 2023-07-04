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

                                        <!-- start page title -->
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                                                    <h4 class="mb-sm-0">Embed Video</h4>

                                                    <div class="page-title-right">
                                                        <ol class="breadcrumb m-0">
                                                            <li class="breadcrumb-item">
                                                                <a href="javascript: void(0);">Base UI</a>
                                                            </li>
                                                            <li class="breadcrumb-item active">Embed Video</li>
                                                        </ol>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <!-- end page title -->

                                        <div class="row">
                                            <div class="col-xl-6">
                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">Ratio Video 16:9</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="ratiovideo1-showcode" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="ratiovideo1-showcode"></input>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->
                                                    <div class="card-body">
                                                        <p class="text-muted">Wrap any embed in<code>&lt;iframe&gt;</code> tag, in a parent element, use <code>ratio-16x9</code> class to set aspect ratio 16:9. </p>
                                                        <div class="live-preview">
                                                            <!-- 16:9 aspect ratio -->
                                                            <div class="ratio ratio-16x9">
                                                                <iframe class="rounded" src="https://www.youtube.com/embed/1y_kfWUCFDQ" title="YouTube video" allowfullscreen=""></iframe>
                                                            </div>
                                                        </div>
                                                        <div class="d-none code-view">
                                                            <pre class="language-markup">
                                                                <code>&lt;!-- Ratio Video 16:9 --&gt;
&lt;div class=&quot;ratio ratio-16x9&quot;&gt;
    &lt;iframe src=&quot;https://www.youtube.com/embed/1y_kfWUCFDQ&quot; title=&quot;YouTube video&quot; allowfullscreen&gt;&lt;/iframe&gt;
&lt;/div&gt;</code>
                                                            </pre>
                                                        </div>
                                                    </div>                                                    <!-- end card-body -->
                                                </div>                                                <!-- end card -->

                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">Ratio Video 4:3</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="ratiovideo3-showcode" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="ratiovideo3-showcode"></input>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->
                                                    <div class="card-body">
                                                        <p class="text-muted">Use <code>ratio-4x3</code> class to set aspect ratio 4:3.</p>
                                                        <div class="live-preview">
                                                            <!-- 4:3 aspect ratio -->
                                                            <div class="ratio ratio-4x3">
                                                                <iframe class="rounded" src="https://www.youtube.com/embed/PHcgN1GTjdU" title="YouTube video" allowfullscreen=""></iframe>
                                                            </div>
                                                        </div>
                                                        <div class="d-none code-view">
                                                            <pre class="language-markup">
                                                                <code>&lt;!-- Ratio Video 4:3 --&gt;
&lt;div class=&quot;ratio ratio-4x3&quot;&gt;
    &lt;iframe src=&quot;https://www.youtube.com/embed/1y_kfWUCFDQ&quot; title=&quot;YouTube video&quot; allowfullscreen&gt;&lt;/iframe&gt;
&lt;/div&gt;</code>
                                                            </pre>
                                                        </div>
                                                    </div>                                                    <!-- end card-body -->
                                                </div>                                                <!-- end card -->

                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">Custom Ratios</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="ratiovideocustom-showcode" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="ratiovideocustom-showcode"></input>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->
                                                    <div class="card-body">
                                                        <p class="text-muted">Use <code>--vz-aspect-ratio: 50%</code> to style element to set aspect ratio 2:1.</p>
                                                        <div class="live-preview">
                                                            <!-- 16:9 aspect ratio -->
                                                            <div class="ratio" style="--vz-aspect-ratio: 50%;">
                                                                <iframe class="rounded" src="https://www.youtube.com/embed/2RZQN_ko0iU" title="YouTube video" allowfullscreen=""></iframe>
                                                            </div>
                                                        </div>
                                                        <div class="d-none code-view">
                                                            <pre class="language-markup">
                                                                <code>&lt;!-- Custom Ratio Video --&gt;
&lt;div class=&quot;ratio&quot; style=&quot;--vz-aspect-ratio: 50%;&quot;&gt;
    &lt;iframe src=&quot;https://www.youtube.com/embed/2RZQN_ko0iU&quot; title=&quot;YouTube video&quot; allowfullscreen&gt;&lt;/iframe&gt;
&lt;/div&gt;</code>
                                                            </pre>
                                                        </div>
                                                    </div>                                                    <!-- end card-body -->
                                                </div>                                                <!-- end card -->

                                            </div>
                                            <!-- end col -->

                                            <div class="col-xl-6">
                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">Ratio Video 21:9</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="ratiovideo2-showcode" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="ratiovideo2-showcode"></input>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->
                                                    <div class="card-body">
                                                        <p class="text-muted">Use <code>ratio-21x9</code> class to set aspect ratio 21:9.</p>
                                                        <div class="live-preview">
                                                            <!-- 21:9 aspect ratio -->
                                                            <div class="ratio ratio-21x9">
                                                                <iframe class="rounded" src="https://www.youtube.com/embed/Z-fV2lGKnnU" title="YouTube video" allowfullscreen=""></iframe>
                                                            </div>
                                                        </div>
                                                        <div class="d-none code-view">
                                                            <pre class="language-markup">
                                                                <code>&lt;!-- Ratio Video 21:9 --&gt;
&lt;div class=&quot;ratio ratio-21x9&quot;&gt;
    &lt;iframe src=&quot;https://www.youtube.com/embed/Z-fV2lGKnnU&quot; title=&quot;YouTube video&quot; allowfullscreen&gt;&lt;/iframe&gt;
&lt;/div&gt;</code>
                                                            </pre>
                                                        </div>
                                                    </div>                                                    <!-- end card-body -->
                                                </div>                                                <!-- end card -->

                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">Ratio Video 1:1</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="ratiovideo4-showcode" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="ratiovideo4-showcode"></input>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->
                                                    <div class="card-body">
                                                        <p class="text-muted">Use <code>ratio-1x1</code> class to set aspect ratio 1:1.</p>
                                                        <div class="live-preview">
                                                            <!-- 1:1 aspect ratio -->
                                                            <div class="ratio ratio-1x1">
                                                                <iframe class="rounded" src="https://www.youtube.com/embed/GfSZtaoc5bw" title="YouTube video" allowfullscreen=""></iframe>
                                                            </div>
                                                        </div>
                                                        <div class="d-none code-view">
                                                            <pre class="language-markup">
                                                                <code>&lt;!-- Ratio Video 1:1 --&gt;
&lt;div class=&quot;ratio ratio-1x1&quot;&gt;
    &lt;iframe src=&quot;https://www.youtube.com/embed/GfSZtaoc5bw&quot; title=&quot;YouTube video&quot; allowfullscreen&gt;&lt;/iframe&gt;
&lt;/div&gt;</code>
                                                            </pre>
                                                        </div>
                                                    </div>                                                    <!-- end card-body -->
                                                </div>                                                <!-- end card -->
                                            </div>
                                            <!-- end col -->
                                        </div>                                        <!-- end row -->

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
