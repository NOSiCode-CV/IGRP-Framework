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
                                                        <h4 class="card-title mb-0 flex-grow-1">Bootstrap Toasts</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="bootstraptoast-showcode" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="bootstraptoast-showcode"></input>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">

                                                        <div class="live-preview">
                                                            <div class="row g-3">
                                                                <div class="col-xxl-6">
                                                                    <h5 class="fs-14 mb-3">Default Toast</h5>
                                                                    <p class="text-muted">Use <code>toast</code> class to set a default toast.</p>
                                                                    <!-- Basic Toasts Example -->
                                                                    <div class="toast fade show" role="alert" aria-live="assertive" data-bs-autohide="false" aria-atomic="true">
                                                                        <div class="toast-header">
                                                                            <img src="{$themePath}/assets/images/logo-sm.png" class="rounded me-2" alt="..." height="20">
                                                                                <span class="fw-semibold me-auto">Velzon</span>
                                                                                <small>06 mins ago</small>
                                                                                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                                                                            </img>
                                                                        </div>
                                                                        <div class="toast-body">
                                                        Hello, world! This is a toast message.
                                                                        </div>
                                                                    </div>

                                                                    <div class="mt-4">
                                                                        <h5 class="fs-14">Translucent</h5>
                                                                        <p class="text-muted">Toasts are slightly translucent, too, so they blend over whatever they might appear over.</p>
                                                                        <!-- Toasts Translucent -->
                                                                        <div class="p-3 bg-light">
                                                                            <div class="toast fade show" role="alert" aria-live="assertive" data-bs-autohide="false" aria-atomic="true">
                                                                                <div class="toast-header">
                                                                                    <img src="{$themePath}/assets/images/logo-sm.png" class="rounded me-2" alt="..." height="20">
                                                                                        <span class="fw-semibold me-auto">Velzon</span>
                                                                                        <small>11 mins ago</small>
                                                                                        <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                                                                                    </img>
                                                                                </div>
                                                                                <div class="toast-body">
                                                                Hello, world! This is a toast message.
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->

                                                                <div class="col-xxl-6">
                                                                    <div>
                                                                        <h5 class="fs-14">Stacking</h5>
                                                                        <p class="text-muted">When you have multiple toasts, we default to vertically stacking them in a readable manner.</p>

                                                                        <div class="p-3 bg-light">
                                                                            <!-- Toasts Stacking -->
                                                                            <div class="toast fade show" role="alert" aria-live="assertive" data-bs-autohide="false" aria-atomic="true">
                                                                                <div class="toast-header">
                                                                                    <img src="{$themePath}/assets/images/logo-sm.png" class="rounded me-2" alt="..." height="20">
                                                                                        <span class="fw-semibold me-auto">Velzon</span>
                                                                                        <small>Just now</small>
                                                                                        <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                                                                                    </img>
                                                                                </div>
                                                                                <div class="toast-body">
                                                                See? Just like this.
                                                                                </div>
                                                                            </div>

                                                                            <div class="toast fade show" role="alert" aria-live="assertive" data-bs-autohide="false" aria-atomic="true">
                                                                                <div class="toast-header">
                                                                                    <img src="{$themePath}/assets/images/logo-sm.png" class="rounded me-2" alt="..." height="20">
                                                                                        <span class="fw-semibold me-auto">Velzon</span>
                                                                                        <small>2 seconds ago</small>
                                                                                        <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                                                                                    </img>
                                                                                </div>
                                                                                <div class="toast-body">
                                                                Heads up, toasts will stack automatically
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->
                                                            </div>
                                                            <!--end row-->

                                                            <div class="mt-5">
                                                                <h5 class="fs-14">Placement</h5>
                                                                <div class="row g-3">
                                                                    <div class="col-xxl-6">
                                                                        <div>
                                                                            <p class="text-muted">Place toasts with custom CSS as you need them.
                                                            The top right
                                                            is often used
                                                            for notifications, as is the top middle. If you’re only ever
                                                            going to show one toast
                                                            at a time, put
                                                            the positioning styles right on the <code>.toast</code>.
                                                                            </p>

                                                                            <!-- Toasts Placement -->
                                                                            <div class="bg-light" aria-live="polite" aria-atomic="true" style="position: relative; min-height: 200px;">
                                                                                <div class="toast fade show" role="alert" aria-live="assertive" aria-atomic="true" data-bs-toggle="toast" style="position: absolute; top: 16px; right: 16px;">
                                                                                    <div class="toast-header">
                                                                                        <img src="{$themePath}/assets/images/logo-sm.png" class="rounded me-2" alt="..." height="20">
                                                                                            <span class="fw-semibold me-auto">Velzon</span>
                                                                                            <small>06 mins ago</small>
                                                                                            <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                                                                                        </img>
                                                                                    </div>
                                                                                    <div class="toast-body">
                                                                    Hello, world! This is a toast message.
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <!--end col-->

                                                                    <div class="col-xxl-6">
                                                                        <div>
                                                                            <p class="text-muted">You can also get fancy with flexbox utilities
                                                            to align toasts horizontally and/or vertically.</p>

                                                                            <!-- Flexbox container for aligning the toasts -->
                                                                            <div aria-live="polite" aria-atomic="true" class="bg-light d-flex justify-content-center align-items-center" style="height: 200px;">
                                                                                <div class="toast fade show" role="alert" aria-live="assertive" data-bs-autohide="false" aria-atomic="true">
                                                                                    <div class="toast-header">
                                                                                        <img src="{$themePath}/assets/images/logo-sm.png" class="rounded me-2" alt="..." height="20">
                                                                                            <span class="fw-semibold me-auto">Velzon</span>
                                                                                            <small>11 mins ago</small>
                                                                                            <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                                                                                        </img>
                                                                                    </div>
                                                                                    <div class="toast-body">
                                                                    Hello, world! This is a toast message.
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <!--end col-->
                                                                </div>
                                                                <!--end row-->
                                                            </div>
                                                        </div>

                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="height: 275px;">
                                                                <code>&lt;!-- Default Toast --&gt; 
&lt;div class=&quot;toast fade show&quot; role=&quot;alert&quot; aria-live=&quot;assertive&quot; data-bs-autohide=&quot;false&quot; aria-atomic=&quot;true&quot;&gt;
    &lt;div class=&quot;toast-header&quot;&gt;
        &lt;img src=&quot;{$themePath}/assets/images/logo-sm.png&quot; class=&quot;rounded me-2&quot; alt=&quot;...&quot; height=&quot;20&quot;&gt;
        &lt;span class=&quot;fw-semibold me-auto&quot;&gt;Velzon&lt;/span&gt;
        &lt;small&gt;06 mins ago&lt;/small&gt;
        &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot;toast&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
    &lt;/div&gt;
    &lt;div class=&quot;toast-body&quot;&gt;
        Hello, world! This is a toast message.
    &lt;/div&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;!-- Translucent Toast --&gt; 
&lt;div class=&quot;p-3 bg-light&quot;&gt;
    &lt;div class=&quot;toast fade show&quot; role=&quot;alert&quot; aria-live=&quot;assertive&quot; data-bs-autohide=&quot;false&quot; aria-atomic=&quot;true&quot;&gt;
        &lt;div class=&quot;toast-header&quot;&gt;
            &lt;img src=&quot;{$themePath}/assets/images/logo-sm.png&quot; class=&quot;rounded me-2&quot; alt=&quot;...&quot; height=&quot;20&quot;&gt;
            &lt;span class=&quot;fw-semibold me-auto&quot;&gt;Velzon&lt;/span&gt;
            &lt;small&gt;11 mins ago&lt;/small&gt;
            &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot;toast&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
        &lt;/div&gt;
        &lt;div class=&quot;toast-body&quot;&gt;
            Hello, world! This is a toast message.
        &lt;/div&gt;
    &lt;/div&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;!-- Stacking Toast --&gt; 
&lt;div class=&quot;toast fade show&quot; role=&quot;alert&quot; aria-live=&quot;assertive&quot; data-bs-autohide=&quot;false&quot; aria-atomic=&quot;true&quot;&gt;
    &lt;div class=&quot;toast-header&quot;&gt;
        &lt;img src=&quot;{$themePath}/assets/images/logo-sm.png&quot; class=&quot;rounded me-2&quot; alt=&quot;...&quot; height=&quot;20&quot;&gt;
        &lt;span class=&quot;fw-semibold me-auto&quot;&gt;Velzon&lt;/span&gt;
        &lt;small&gt;Just now&lt;/small&gt;
        &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot;toast&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
    &lt;/div&gt;
    &lt;div class=&quot;toast-body&quot;&gt;
        See? Just like this.
    &lt;/div&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;!-- Placement Toast --&gt; 
&lt;div class=&quot;bg-light&quot; aria-live=&quot;polite&quot; aria-atomic=&quot;true&quot; style=&quot;position: relative; min-height: 200px;&quot;&gt;
    &lt;div class=&quot;toast fade show&quot; role=&quot;alert&quot; aria-live=&quot;assertive&quot; aria-atomic=&quot;true&quot; data-bs-toggle=&quot;toast&quot; style=&quot;position: absolute; top: 16px; right: 16px;&quot;&gt;
        &lt;div class=&quot;toast-header&quot;&gt;
            &lt;img src=&quot;{$themePath}/assets/images/logo-sm.png&quot; class=&quot;rounded me-2&quot; alt=&quot;...&quot; height=&quot;20&quot;&gt;
            &lt;span class=&quot;fw-semibold me-auto&quot;&gt;Velzon&lt;/span&gt;
            &lt;small&gt;06 mins ago&lt;/small&gt;
            &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot;toast&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
        &lt;/div&gt;
        &lt;div class=&quot;toast-body&quot;&gt;
            Hello, world! This is a toast message.
        &lt;/div&gt;
    &lt;/div&gt;
&lt;/div&gt;</code>

                                                                <code> &lt;!-- Flexbox container for aligning the toasts --&gt;
&lt;div aria-live=&quot;polite&quot; aria-atomic=&quot;true&quot; class=&quot;bg-light d-flex justify-content-center align-items-center&quot; style=&quot;height: 200px;&quot;&gt;
    &lt;div class=&quot;toast fade show&quot; role=&quot;alert&quot; aria-live=&quot;assertive&quot; data-bs-autohide=&quot;false&quot; aria-atomic=&quot;true&quot;&gt;
        &lt;div class=&quot;toast-header&quot;&gt;
            &lt;img src=&quot;{$themePath}/assets/images/logo-sm.png&quot; class=&quot;rounded me-2&quot; alt=&quot;...&quot; height=&quot;20&quot;&gt;
            &lt;span class=&quot;fw-semibold me-auto&quot;&gt;Velzon&lt;/span&gt;
            &lt;small&gt;11 mins ago&lt;/small&gt;
            &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot;toast&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
        &lt;/div&gt;
        &lt;div class=&quot;toast-body&quot;&gt;
            Hello, world! This is a toast message.
        &lt;/div&gt;
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
                                                        <h4 class="card-title mb-0 flex-grow-1">Toast Placement</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="toast-placement-showcode" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="toast-placement-showcode"></input>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">

                                                        <p class="text-muted">Various example of <code>toast placement</code>.
                                                        </p>
                                                        <div class="live-preview">
                                                            <form>
                                                                <div class="mb-3">
                                                                    <select class="form-select mt-2" id="selectToastPlacement">
                                                                        <option value="" selected="">Select a position...</option>
                                                                        <option value="top-0 start-0">Top left</option>
                                                                        <option value="top-0 start-50 translate-middle-x">Top center</option>
                                                                        <option value="top-0 end-0">Top right</option>
                                                                        <option value="top-50 start-0 translate-middle-y">Middle left</option>
                                                                        <option value="top-50 start-50 translate-middle">Middle center</option>
                                                                        <option value="top-50 end-0 translate-middle-y">Middle right</option>
                                                                        <option value="bottom-0 start-0">Bottom left</option>
                                                                        <option value="bottom-0 start-50 translate-middle-x">Bottom center</option>
                                                                        <option value="bottom-0 end-0">Bottom right</option>
                                                                    </select>
                                                                </div>
                                                            </form>
                                                            <div aria-live="polite" aria-atomic="true" class="bd-example bg-light position-relative" style="height: 300px;">
                                                                <div class="toast-container position-absolute p-3" id="toastPlacement">
                                                                    <div class="toast">
                                                                        <div class="toast-header">
                                                                            <img src="{$themePath}/assets/images/logo-sm.png" class="rounded me-2" alt="..." height="20">
                                                                                <strong class="me-auto">Velzon</strong>
                                                                                <small>11 mins ago</small>
                                                                                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                                                                            </img>
                                                                        </div>
                                                                        <div class="toast-body">
                                                        Hello, world! This is a toast message.
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="height: 275px;">
                                                                <code>&lt;!-- Toast placement --&gt;
&lt;form&gt;
    &lt;div class=&quot;mb-3&quot;&gt;
        &lt;select class=&quot;form-select mt-2&quot; id=&quot;selectToastPlacement&quot;&gt;
            &lt;option value=&quot;&quot; selected&gt;Select a position...&lt;/option&gt;
            &lt;option value=&quot;top-0 start-0&quot;&gt;Top left&lt;/option&gt;
            &lt;option value=&quot;top-0 start-50 translate-middle-x&quot;&gt;Top center&lt;/option&gt;
            &lt;option value=&quot;top-0 end-0&quot;&gt;Top right&lt;/option&gt;
            &lt;option value=&quot;top-50 start-0 translate-middle-y&quot;&gt;Middle left&lt;/option&gt;
            &lt;option value=&quot;top-50 start-50 translate-middle&quot;&gt;Middle center&lt;/option&gt;
            &lt;option value=&quot;top-50 end-0 translate-middle-y&quot;&gt;Middle right&lt;/option&gt;
            &lt;option value=&quot;bottom-0 start-0&quot;&gt;Bottom left&lt;/option&gt;
            &lt;option value=&quot;bottom-0 start-50 translate-middle-x&quot;&gt;Bottom center&lt;/option&gt;
            &lt;option value=&quot;bottom-0 end-0&quot;&gt;Bottom right&lt;/option&gt;
        &lt;/select&gt;
    &lt;/div&gt;
&lt;/form&gt;</code>

                                                                <code>&lt;div aria-live=&quot;polite&quot; aria-atomic=&quot;true&quot; class=&quot;bd-example bg-light position-relative&quot; style=&quot;height: 300px;&quot;&gt;
    &lt;div class=&quot;toast-container position-absolute p-3&quot; id=&quot;toastPlacement&quot;&gt;
        &lt;div class=&quot;toast&quot;&gt;
            &lt;div class=&quot;toast-header&quot;&gt;
                &lt;img src=&quot;{$themePath}/assets/images/logo-sm.png&quot; class=&quot;rounded me-2&quot; alt=&quot;...&quot; height=&quot;20&quot;&gt;
                &lt;strong class=&quot;me-auto&quot;&gt;Velzon&lt;/strong&gt;
                &lt;small&gt;11 mins ago&lt;/small&gt;
                &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot;toast&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
            &lt;/div&gt;
            &lt;div class=&quot;toast-body&quot;&gt;
                Hello, world! This is a toast message.
            &lt;/div&gt;
        &lt;/div&gt;
    &lt;/div&gt;
&lt;/div&gt;</code>
                                                            </pre>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--end col-->
                                        </div>
                                        <!--end row-->


                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="card">

                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">Bordered with Icon Toast</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="bordered-toast-showcode" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="bordered-toast-showcode"></input>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">
                                                        <p class="text-muted">Use <code>toast-border-</code> with below-mentioned color variation to set a toast with border and icon.</p>

                                                        <div class="live-preview">

                                                            <div class="position-relative">
                                                                <div class="hstack flex-wrap gap-2">
                                                                    <button type="button" class="btn btn-primary" id="borderedToast1Btn">Primary Toast</button>
                                                                    <button type="button" class="btn btn-success" id="borderedToast2Btn">Success Toast</button>
                                                                    <button type="button" class="btn btn-warning" id="borderedTost3Btn">Warning Toast</button>
                                                                    <button type="button" class="btn btn-danger" id="borderedToast4Btn">Danger Toast</button>
                                                                </div>

                                                                <div style="z-index: 11">
                                                                    <div id="borderedToast1" class="toast toast-border-primary overflow-hidden mt-3" role="alert" aria-live="assertive" aria-atomic="true">
                                                                        <div class="toast-body">
                                                                            <div class="d-flex align-items-center">
                                                                                <div class="flex-shrink-0 me-2">
                                                                                    <i class="ri-user-smile-line align-middle"></i>
                                                                                </div>
                                                                                <div class="flex-grow-1">
                                                                                    <h6 class="mb-0">Your application was successfully sent.</h6>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div style="z-index: 11">
                                                                    <div id="borderedToast2" class="toast toast-border-success overflow-hidden mt-3" role="alert" aria-live="assertive" aria-atomic="true">
                                                                        <div class="toast-body">
                                                                            <div class="d-flex align-items-center">
                                                                                <div class="flex-shrink-0 me-2">
                                                                                    <i class="ri-checkbox-circle-fill align-middle"></i>
                                                                                </div>
                                                                                <div class="flex-grow-1">
                                                                                    <h6 class="mb-0">Yey! Everything worked!</h6>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div style="z-index: 11">
                                                                    <div id="borderedTost3" class="toast toast-border-warning overflow-hidden mt-3" role="alert" aria-live="assertive" aria-atomic="true">
                                                                        <div class="toast-body">
                                                                            <div class="d-flex align-items-center">
                                                                                <div class="flex-shrink-0 me-2">
                                                                                    <i class="ri-notification-off-line align-middle"></i>
                                                                                </div>
                                                                                <div class="flex-grow-1">
                                                                                    <h6 class="mb-0">Something went wrong, try again.</h6>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div style="z-index: 11">
                                                                    <div id="borderedToast4" class="toast toast-border-danger overflow-hidden mt-3" role="alert" aria-live="assertive" aria-atomic="true">
                                                                        <div class="toast-body">
                                                                            <div class="d-flex align-items-center">
                                                                                <div class="flex-shrink-0 me-2">
                                                                                    <i class="ri-alert-line align-middle"></i>
                                                                                </div>
                                                                                <div class="flex-grow-1">
                                                                                    <h6 class="mb-0">Something is very wrong! <a href="javascript:void(0);" class="text-decoration-underline">See detailed report.</a>
                                                                                    </h6>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </div>
                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="height: 275px;">
                                                                <code>&lt;!-- Bordered With Icon Toast --&gt;
&lt;div class=&quot;hstack flex-wrap gap-2&quot;&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-primary&quot; id=&quot;borderedToast1Btn&quot;&gt;Primary toast&lt;/button&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-success&quot; id=&quot;borderedToast2Btn&quot;&gt;Success toast&lt;/button&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-warning&quot; id=&quot;borderedTost3Btn&quot;&gt;Warning toast&lt;/button&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-danger&quot; id=&quot;borderedToast4Btn&quot;&gt;danger toast&lt;/button&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;div style=&quot;z-index: 11&quot;&gt;
    &lt;div id=&quot;borderedToast1&quot; class=&quot;toast toast-border-primary overflow-hidden mt-3&quot; role=&quot;alert&quot; aria-live=&quot;assertive&quot; aria-atomic=&quot;true&quot;&gt;
        &lt;div class=&quot;toast-body&quot;&gt;
            &lt;div class=&quot;d-flex align-items-center&quot;&gt;
                &lt;div class=&quot;flex-shrink-0 me-2&quot;&gt;
                    &lt;i class=&quot;ri-user-smile-line align-middle&quot;&gt;&lt;/i&gt;
                &lt;/div&gt;
                &lt;div class=&quot;flex-grow-1&quot;&gt;
                    &lt;h6 class=&quot;mb-0&quot;&gt;Your application was successfully sent.&lt;/h6&gt;
                &lt;/div&gt;
            &lt;/div&gt;
        &lt;/div&gt;
    &lt;/div&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;div style=&quot;z-index: 11&quot;&gt;
    &lt;div id=&quot;borderedToast2&quot; class=&quot;toast toast-border-success overflow-hidden mt-3&quot; role=&quot;alert&quot; aria-live=&quot;assertive&quot; aria-atomic=&quot;true&quot;&gt;
        &lt;div class=&quot;toast-body&quot;&gt;
            &lt;div class=&quot;d-flex align-items-center&quot;&gt;
                &lt;div class=&quot;flex-shrink-0 me-2&quot;&gt;
                    &lt;i class=&quot;ri-checkbox-circle-fill align-middle&quot;&gt;&lt;/i&gt;
                &lt;/div&gt;
                &lt;div class=&quot;flex-grow-1&quot;&gt;
                    &lt;h6 class=&quot;mb-0&quot;&gt;Yey! Everything worked!&lt;/h6&gt;
                &lt;/div&gt;
            &lt;/div&gt;
        &lt;/div&gt;
    &lt;/div&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;div style=&quot;z-index: 11&quot;&gt;
    &lt;div id=&quot;borderedTost3&quot; class=&quot;toast toast-border-warning overflow-hidden mt-3&quot; role=&quot;alert&quot; aria-live=&quot;assertive&quot; aria-atomic=&quot;true&quot;&gt;
        &lt;div class=&quot;toast-body&quot;&gt;
            &lt;div class=&quot;d-flex align-items-center&quot;&gt;
                &lt;div class=&quot;flex-shrink-0 me-2&quot;&gt;
                    &lt;i class=&quot;ri-notification-off-line align-middle&quot;&gt;&lt;/i&gt;
                &lt;/div&gt;
                &lt;div class=&quot;flex-grow-1&quot;&gt;
                    &lt;h6 class=&quot;mb-0&quot;&gt;Something went wrong, try again.&lt;/h6&gt;
                &lt;/div&gt;
            &lt;/div&gt;
        &lt;/div&gt;
    &lt;/div&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;div style=&quot;z-index: 11&quot;&gt;
    &lt;div id=&quot;borderedToast4&quot; class=&quot;toast toast-border-danger overflow-hidden mt-3&quot; role=&quot;alert&quot; aria-live=&quot;assertive&quot; aria-atomic=&quot;true&quot;&gt;
        &lt;div class=&quot;toast-body&quot;&gt;
            &lt;div class=&quot;d-flex align-items-center&quot;&gt;
                &lt;div class=&quot;flex-shrink-0 me-2&quot;&gt;
                    &lt;i class=&quot;ri-alert-line align-middle&quot;&gt;&lt;/i&gt;
                &lt;/div&gt;
                &lt;div class=&quot;flex-grow-1&quot;&gt;
                    &lt;h6 class=&quot;mb-0&quot;&gt;Something is very wrong!  &lt;a href=&quot;javascript:void(0);&quot; class=&quot;text-decoration-underline&quot;&gt;See detailed report.&lt;/a&gt;&lt;/h6&gt;
                &lt;/div&gt;
            &lt;/div&gt;
        &lt;/div&gt;
    &lt;/div&gt;
&lt;/div&gt;</code>
                                                            </pre>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--end col-->
                                        </div>
                                        <!--end row-->


                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">Toastify JS</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="toastify-showcode" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="toastify-showcode"></input>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">
                                                        <p class="text-muted">Use <code>data-toast</code>
                                                            <code>data-toast-text=""</code>
                                                            <code>data-toast-gravity=""</code>
                                                            <code>data-toast-position=""</code>
                                                            <code>data-toast-className=""</code>
                                                            <code>data-toast-duration=""</code>
                                                            <code>data-toast-close="close"</code>
                                                            <code>data-toast-style="style"</code> as per your toast requirement.</p>
                                                        <div class="live-preview">
                                                            <div class="hstack flex-wrap gap-2">
                                                                <button type="button" data-toast="" data-toast-text="Welcome Back! This is a Toast Notification" data-toast-gravity="top" data-toast-position="right" data-toast-className="primary" data-toast-duration="3000" data-toast-close="close" data-toast-style="style" class="btn btn-light w-xs ">Default</button>
                                                                <button type="button" data-toast="" data-toast-text="Your application was successfully sent" data-toast-gravity="top" data-toast-position="center" data-toast-className="success" data-toast-duration="3000" class="btn btn-light w-xs">Success</button>
                                                                <button type="button" data-toast="" data-toast-text="Warning ! Something went wrong try again" data-toast-gravity="top" data-toast-position="center" data-toast-className="warning" data-toast-duration="3000" class="btn btn-light w-xs">Warning</button>
                                                                <button type="button" data-toast="" data-toast-text="Error ! An error occurred." data-toast-gravity="top" data-toast-position="center" data-toast-className="danger" data-toast-duration="3000" class="btn btn-light w-xs">Error</button>
                                                            </div>
                                                            <div class="mt-4 pt-2">
                                                                <h5 class="fs-14 mb-3">Display Position</h5>
                                                                <div class="hstack flex-wrap gap-2">
                                                                    <button type="button" data-toast="" data-toast-text="Welcome Back ! This is a Toast Notification" data-toast-gravity="top" data-toast-position="left" data-toast-duration="3000" data-toast-close="close" class="btn btn-light w-xs">Top Left</button>
                                                                    <button type="button" data-toast="" data-toast-text="Welcome Back ! This is a Toast Notification" data-toast-gravity="top" data-toast-position="center" data-toast-duration="3000" data-toast-close="close" class="btn btn-light w-xs">Top Center</button>
                                                                    <button type="button" data-toast="" data-toast-text="Welcome Back ! This is a Toast Notification" data-toast-gravity="top" data-toast-position="right" data-toast-duration="3000" data-toast-close="close" class="btn btn-light w-xs">Top Right</button>
                                                                    <button type="button" data-toast="" data-toast-text="Welcome Back ! This is a Toast Notification" data-toast-gravity="bottom" data-toast-position="left" data-toast-duration="3000" data-toast-close="close" class="btn btn-light w-xs">Bottom Left</button>
                                                                    <button type="button" data-toast="" data-toast-text="Welcome Back ! This is a Toast Notification" data-toast-gravity="bottom" data-toast-position="center" data-toast-duration="3000" data-toast-close="close" class="btn btn-light w-xs">Bottom Center</button>
                                                                    <button type="button" data-toast="" data-toast-text="Welcome Back ! This is a Toast Notification" data-toast-gravity="bottom" data-toast-position="right" data-toast-duration="3000" data-toast-close="close" class="btn btn-light w-xs">Bottom Right</button>
                                                                </div>
                                                            </div>

                                                            <div class="row mt-3">
                                                                <div class="col-lg-4">
                                                                    <div class="mt-4">
                                                                        <h5 class="fs-14 mb-3">Offset Position</h5>
                                                                        <div class="d-flex align-items-center flex-wrap gap-2">
                                                                            <button type="button" data-toast="" data-toast-text="Welcome Back ! This is a Toast Notification" data-toast-gravity="top" data-toast-position="right" data-toast-duration="3000" data-toast-offset="" data-toast-close="close" class="btn btn-light w-xs">Click Me</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->
                                                                <div class="col-lg-4">
                                                                    <div class="mt-4">
                                                                        <h5 class="fs-14 mb-3">Close icon Display</h5>
                                                                        <div class="d-flex align-items-center flex-wrap gap-2">
                                                                            <button type="button" data-toast="" data-toast-text="Welcome Back ! This is a Toast Notification" data-toast-position="right" data-toast-duration="3000" data-toast-close="close" class="btn btn-light w-xs">Click Me</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->
                                                                <div class="col-lg-4">
                                                                    <div class="mt-4">
                                                                        <h5 class="fs-14 mb-3">Duration</h5>
                                                                        <div class="d-flex align-items-center flex-wrap gap-2">
                                                                            <button type="button" data-toast="" data-toast-text="Toast Duration 5s" data-toast-gravity="top" data-toast-position="right" data-toast-duration="5000" class="btn btn-light w-xs">Click Me</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->
                                                            </div>
                                                            <!--end row-->
                                                        </div>
                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="height: 275px;">
                                                                <code>&lt;!-- Toast --&gt;
    &lt;div class=&quot;hstack flex-wrap gap-2&quot;&gt;
    &lt;button type=&quot;button&quot; data-toast data-toast-text=&quot;Welcome Back! This is a Toast Notification&quot; data-toast-gravity=&quot;top&quot; data-toast-position=&quot;right&quot; data-toast-className=&quot;primary&quot; data-toast-duration=&quot;3000&quot; data-toast-close=&quot;close&quot; data-toast-style=&quot;style&quot; class=&quot;btn btn-light w-xs &quot;&gt;Default&lt;/button&gt;
    &lt;button type=&quot;button&quot; data-toast data-toast-text=&quot;Your application was successfully sent&quot; data-toast-gravity=&quot;top&quot; data-toast-position=&quot;center&quot; data-toast-className=&quot;success&quot; data-toast-duration=&quot;3000&quot; class=&quot;btn btn-light w-xs&quot;&gt;Success&lt;/button&gt;
    &lt;button type=&quot;button&quot; data-toast data-toast-text=&quot;Warning ! Something went wrong try again&quot; data-toast-gravity=&quot;top&quot; data-toast-position=&quot;center&quot; data-toast-className=&quot;warning&quot; data-toast-duration=&quot;3000&quot; class=&quot;btn btn-light w-xs&quot;&gt;Warning&lt;/button&gt;
    &lt;button type=&quot;button&quot; data-toast data-toast-text=&quot;Error ! An error occurred.&quot; data-toast-gravity=&quot;top&quot; data-toast-position=&quot;center&quot; data-toast-className=&quot;danger&quot; data-toast-duration=&quot;3000&quot; class=&quot;btn btn-light w-xs&quot;&gt;Error&lt;/button&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;!-- Display Position --&gt;
&lt;div class=&quot;hstack flex-wrap gap-2&quot;&gt;
    &lt;button type=&quot;button&quot; data-toast data-toast-text=&quot;Welcome Back ! This is a Toast Notification&quot; data-toast-gravity=&quot;top&quot; data-toast-position=&quot;left&quot; data-toast-duration=&quot;3000&quot; data-toast-close=&quot;close&quot; class=&quot;btn btn-light w-xs&quot;&gt;Top Left&lt;/button&gt;
    &lt;button type=&quot;button&quot; data-toast data-toast-text=&quot;Welcome Back ! This is a Toast Notification&quot; data-toast-gravity=&quot;top&quot; data-toast-position=&quot;center&quot; data-toast-duration=&quot;3000&quot; data-toast-close=&quot;close&quot; class=&quot;btn btn-light w-xs&quot;&gt;Top Center&lt;/button&gt;
    &lt;button type=&quot;button&quot; data-toast data-toast-text=&quot;Welcome Back ! This is a Toast Notification&quot; data-toast-gravity=&quot;top&quot; data-toast-position=&quot;right&quot; data-toast-duration=&quot;3000&quot; data-toast-close=&quot;close&quot; class=&quot;btn btn-light w-xs&quot;&gt;Top Right&lt;/button&gt;
    &lt;button type=&quot;button&quot; data-toast data-toast-text=&quot;Welcome Back ! This is a Toast Notification&quot; data-toast-gravity=&quot;bottom&quot; data-toast-position=&quot;left&quot; data-toast-duration=&quot;3000&quot; data-toast-close=&quot;close&quot; class=&quot;btn btn-light w-xs&quot;&gt;Bottom Left&lt;/button&gt;
    &lt;button type=&quot;button&quot; data-toast data-toast-text=&quot;Welcome Back ! This is a Toast Notification&quot; data-toast-gravity=&quot;bottom&quot; data-toast-position=&quot;center&quot; data-toast-duration=&quot;3000&quot; data-toast-close=&quot;close&quot; class=&quot;btn btn-light w-xs&quot;&gt;Bottom Center&lt;/button&gt;
    &lt;button type=&quot;button&quot; data-toast data-toast-text=&quot;Welcome Back ! This is a Toast Notification&quot; data-toast-gravity=&quot;bottom&quot; data-toast-position=&quot;right&quot; data-toast-duration=&quot;3000&quot; data-toast-close=&quot;close&quot; class=&quot;btn btn-light w-xs&quot;&gt;Bottom Right&lt;/button&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;!-- Offset Position --&gt;
&lt;button type=&quot;button&quot; data-toast data-toast-text=&quot;Welcome Back ! This is a Toast Notification&quot; data-toast-gravity=&quot;top&quot; data-toast-position=&quot;right&quot; data-toast-duration=&quot;3000&quot; data-toast-offset data-toast-close=&quot;close&quot; class=&quot;btn btn-light w-xs&quot;&gt;Click Me&lt;/button&gt;;</code>

                                                                <code>&lt;!-- Close icon Display --&gt;
&lt;button type=&quot;button&quot; data-toast data-toast-text=&quot;Welcome Back ! This is a Toast Notification&quot; data-toast-position=&quot;right&quot; data-toast-duration=&quot;3000&quot; data-toast-close=&quot;close&quot; class=&quot;btn btn-light w-xs&quot;&gt;Click Me&lt;/button&gt;</code>

                                                                <code>&lt;!-- Duration --&gt;
&lt;button type=&quot;button&quot; data-toast data-toast-text=&quot;Toast Duration 5s&quot; data-toast-gravity=&quot;top&quot; data-toast-position=&quot;right&quot; data-toast-duration=&quot;5000&quot; class=&quot;btn btn-light w-xs&quot;&gt;Click Me&lt;/button&gt;</code>
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

</xsl:stylesheet>
