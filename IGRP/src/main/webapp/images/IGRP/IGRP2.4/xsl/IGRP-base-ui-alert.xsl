<!DOCTYPE xsl:stylesheet [
	<!ENTITY mdash "entity-value">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/>

    <xsl:template match="/">
        <html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">
            <head>
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
                                                        <h4 class="card-title mb-0 flex-grow-1">Default Alerts</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="default" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="default"/>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">
                                                        <p class="text-muted">Use the <code>alert </code>class to show a default alert.</p>
                                                        <div class="live-preview">
                                                            <div class="row">
                                                                <div class="col-xl-6">
                                                                    <h6>Primary Alert</h6>
                                                                    <div class="alert alert-primary" role="alert">
                                                                        <strong> Hi! </strong> A simple <b>Primary alert</b> —check it out!
                                                                    </div>

                                                                    <h6>Secondary Alert</h6>
                                                                    <div class="alert alert-secondary" role="alert">
                                                                        <strong> How are you! </strong> A simple <b>secondary alert</b> —check it out!
                                                                    </div>

                                                                    <h6>Success Alert</h6>
                                                                    <div class="alert alert-success" role="alert">
                                                                        <strong> Yey! Everything worked! </strong> A simple <b>success alert</b> —check it out!
                                                                    </div>

                                                                    <h6>Danger Alert</h6>
                                                                    <div class="alert alert-danger mb-xl-0" role="alert">
                                                                        <strong> Something is very wrong! </strong> A simple <b>danger alert</b> —check it out!
                                                                    </div>
                                                                </div>

                                                                <div class="col-xl-6">
                                                                    <h6>Warning Alert</h6>
                                                                    <div class="alert alert-warning" role="alert">
                                                                        <strong> Uh oh, something went wrong </strong> A simple <b>warning alert</b> —check it out!
                                                                    </div>

                                                                    <h6>Info Alert</h6>
                                                                    <div class="alert alert-info" role="alert">
                                                                        <strong>Don't forget' it !</strong> A simple <b>info alert</b> —check it out!
                                                                    </div>

                                                                    <h6>Light Alert</h6>
                                                                    <div class="alert alert-light" role="alert">
                                                                        <strong>Mind Your Step!</strong> A simple <b>light alert</b> —check it out!
                                                                    </div>

                                                                    <h6>Dark Alert</h6>
                                                                    <div class="alert alert-dark mb-0" role="alert">
                                                                        <strong>Did you know?</strong> A simple <b>dark alert</b> —check it out!
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="height: 352px">
                                                                <code>&lt;!-- Primary Alert --&gt;
&lt;div class=&quot;alert alert-primary&quot; role=&quot;alert&quot;&gt;
    &lt;strong&gt; Hi! &lt;/strong&gt; A simple &lt;b&gt;Primary alert&lt;/b&gt; &mdash;check it out!
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Secondary Alert --&gt;
&lt;div class=&quot;alert alert-secondary&quot; role=&quot;alert&quot;&gt;
    &lt;strong&gt; How are you! &lt;/strong&gt; A simple &lt;b&gt;secondary alert&lt;/b&gt; &mdash;check it out!
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- success Alert --&gt;
&lt;div class=&quot;alert alert-success&quot; role=&quot;alert&quot;&gt;
    &lt;strong&gt; Yey! Everything worked! &lt;/strong&gt; A simple &lt;b&gt;success alert&lt;/b&gt; &mdash;check it out!
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- danger Alert --&gt;
&lt;div class=&quot;alert alert-danger&quot; role=&quot;alert&quot;&gt;
    &lt;strong&gt; Something is very wrong! &lt;/strong&gt; A simple &lt;b&gt;danger alert&lt;/b&gt; &mdash;check it out!
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- warning Alert --&gt;
&lt;div class=&quot;alert alert-warning&quot; role=&quot;alert&quot;&gt;
    &lt;strong&gt; Uh oh, something went wrong &lt;/strong&gt; A simple &lt;b&gt;warning alert&lt;/b&gt; &mdash;check it out!
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Info Alert --&gt;
&lt;div class=&quot;alert alert-info&quot; role=&quot;alert&quot;&gt;
    &lt;strong&gt; Don't forget' it ! &lt;/strong&gt; A simple &lt;b&gt;info alert&lt;/b&gt; &mdash;check it out!
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Light Alert --&gt;
&lt;div class=&quot;alert alert-light&quot; role=&quot;alert&quot;&gt;
    &lt;strong&gt; Mind Your Step! &lt;/strong&gt; A simple &lt;b&gt;light alert&lt;/b&gt; &mdash;check it out!
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Dark Alert --&gt;
&lt;div class=&quot;alert alert-dark&quot; role=&quot;alert&quot;&gt;
    &lt;strong&gt; Did you know? &lt;/strong&gt; A simple &lt;b&gt;dark alert&lt;/b&gt; &mdash;check it out!
&lt;/div&gt;
                                                                </code>
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
                                                        <h4 class="card-title mb-0 flex-grow-1">Borderless Alerts</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="borderless-alerts" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="borderless-alerts"/>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">
                                                        <p class="text-muted">Use the <code>alert-borderless</code> class to set alert without border.</p>

                                                        <div class="live-preview">
                                                            <div class="row">
                                                                <div class="col-xl-6">
                                                                    <h6>Primary Alert</h6>
                                                                    <div class="alert alert-primary alert-borderless" role="alert">
                                                                        <strong> Hi! </strong> A simple <b>Primary alert</b> —check it out!
                                                                    </div>

                                                                    <h6>Secondary Alert</h6>
                                                                    <div class="alert alert-secondary alert-borderless" role="alert">
                                                                        <strong> How are you! </strong> A simple <b>secondary alert</b> —check it out!
                                                                    </div>

                                                                    <h6>Success Alert</h6>
                                                                    <div class="alert alert-success alert-borderless" role="alert">
                                                                        <strong> Yey! Everything worked! </strong> A simple <b>success alert</b> —check it out!
                                                                    </div>

                                                                    <h6>Danger Alert</h6>
                                                                    <div class="alert alert-danger alert-borderless mb-xl-0" role="alert">
                                                                        <strong> Something is very wrong! </strong> A simple danger alert—check it out!
                                                                    </div>
                                                                </div>

                                                                <div class="col-xl-6">
                                                                    <h6>Warning Alert</h6>
                                                                    <div class="alert alert-warning alert-borderless" role="alert">
                                                                        <strong> Uh oh, something went wrong </strong> A simple <b>warning alert</b> —check it out!
                                                                    </div>

                                                                    <h6>Info Alert</h6>
                                                                    <div class="alert alert-info alert-borderless" role="alert">
                                                                        <strong>Don't forget' it !</strong> A simple <b>info alert</b> —check it out!
                                                                    </div>

                                                                    <h6>Light Alert</h6>
                                                                    <div class="alert alert-light alert-borderless bg-light" role="alert">
                                                                        <strong>Mind Your Step!</strong> A simple <b>light alert</b> —check it out!
                                                                    </div>

                                                                    <h6>Dark Alert</h6>
                                                                    <div class="alert alert-dark alert-borderless mb-0" role="alert">
                                                                        <strong>Did you know?</strong> A simple <b>dark alert</b> —check it out!
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="height: 352px">
                                                                <code>&lt;!-- Primary Alert --&gt;
&lt;div class=&quot;alert alert-borderless alert-primary&quot; role=&quot;alert&quot;&gt;
    &lt;strong&gt; Hi! &lt;/strong&gt; A simple &lt;b&gt;Primary alert&lt;/b&gt; &mdash;check it out!
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Secondary Alert --&gt;
&lt;div class=&quot;alert alert-borderless alert-secondary&quot; role=&quot;alert&quot;&gt;
    &lt;strong&gt; How are you! &lt;/strong&gt; A simple &lt;b&gt;secondary alert&lt;/b&gt; &mdash;check it out!
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Success Alert --&gt;
&lt;div class=&quot;alert alert-borderless alert-success&quot; role=&quot;alert&quot;&gt;
    &lt;strong&gt; Yey! Everything worked! &lt;/strong&gt; A simple &lt;b&gt;success alert&lt;/b&gt; &mdash;check it out!
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Danger Alert --&gt;
&lt;div class=&quot;alert alert-borderless alert-danger&quot; role=&quot;alert&quot;&gt;
    &lt;strong&gt; Something is very wrong! &lt;/strong&gt; A simple &lt;b&gt;danger alert&lt;/b&gt; &mdash;check it out!
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Warning Alert --&gt;
&lt;div class=&quot;alert alert-borderless alert-warning&quot; role=&quot;alert&quot;&gt;
    &lt;strong&gt; Uh oh, something went wrong &lt;/strong&gt; A simple &lt;b&gt;warning alert&lt;/b&gt; &mdash;check it out!
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Info Alert --&gt;
&lt;div class=&quot;alert alert-borderless alert-info&quot; role=&quot;alert&quot;&gt;
    &lt;strong&gt; Don't forget' it ! &lt;/strong&gt; A simple &lt;b&gt;info alert&lt;/b&gt; &mdash;check it out!
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Light Alert --&gt;
&lt;div class=&quot;alert alert-borderless alert-light&quot; role=&quot;alert&quot;&gt;
    &lt;strong&gt; Mind Your Step! &lt;/strong&gt; A simple &lt;b&gt;light alert&lt;/b&gt; &mdash;check it out!  
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Dark Alert --&gt;
&lt;div class=&quot;alert alert-borderless alert-dark mb-0&quot; role=&quot;alert&quot;&gt;
    &lt;strong&gt; Did you know? &lt;/strong&gt; A simple &lt;b&gt;dark alert&lt;/b&gt; &mdash;check it out!
&lt;/div&gt;
                                                                </code>
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
                                                        <h4 class="card-title mb-0 flex-grow-1">Dismissing Alerts</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="1" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="1"/>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">
                                                        <p class="text-muted">Use the <code>alert-dismissible</code> class to add dismissing button to the alert.
                                                        </p>
                                                        <div class="live-preview">

                                                            <div class="row">
                                                                <div class="col-xl-6">
                                                                    <h6>Primary Alert</h6>
                                                                    <div class="alert alert-primary alert-dismissible fade show" role="alert">
                                                                        <strong> Hi! </strong> A simple <b>Dismissible primary Alert </b> — check it out!
                                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>

                                                                    <h6>Secondary Alert</h6>
                                                                    <div class="alert alert-secondary alert-dismissible fade show" role="alert">
                                                                        <strong> How are you! </strong> A simple <b>Dismissible secondary alert</b>
                                                    —check it out!
                                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>

                                                                    <h6>Success Alert</h6>
                                                                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                                                                        <strong>Right Way !</strong> A simple <b>Dismissible success alert</b> —check
                                                    it out!
                                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>

                                                                    <h6>Danger Alert</h6>
                                                                    <div class="alert alert-danger alert-dismissible fade show mb-xl-0" role="alert">
                                                                        <strong> Something is very wrong! </strong> A simple <b>Dismissible danger alert</b> —check
                                                    it out!
                                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>
                                                                </div>

                                                                <div class="col-xl-6">
                                                                    <h6>Warning Alert</h6>
                                                                    <div class="alert alert-warning alert-dismissible fade show" role="alert">
                                                                        <strong>Welcome Back!</strong> A simple <b>Dismissible warning alert</b> —check it out!
                                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>

                                                                    <h6>Info Alert</h6>
                                                                    <div class="alert alert-info alert-dismissible fade show" role="alert">
                                                                        <strong>Don't forget' it !</strong> A simple <b>Dismissible info alert</b>
                                                    —check it out!
                                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>

                                                                    <h6>Light Alert</h6>
                                                                    <div class="alert alert-light alert-dismissible fade show" role="alert">
                                                                        <strong>Mind Your Step!</strong> A simple <b>Dismissible light alert</b>
                                                    —check it out!
                                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>

                                                                    <h6>Dark Alert</h6>
                                                                    <div class="alert alert-dark alert-dismissible fade show mb-0" role="alert">
                                                                        <strong>Did you know?</strong> A simple <b>Dismissible dark alert</b>
                                                    —check it out!
                                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="height: 352px">
                                                                <code>&lt;!-- Primary Alert --&gt;
&lt;div class=&quot;alert alert-primary alert-dismissible fade show&quot; role=&quot;alert&quot;&gt;
    &lt;strong&gt; Hi! &lt;/strong&gt; A simple &lt;b&gt;Dismissible primary Alert &lt;/b&gt; &mdash; check it out!
    &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot;alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Secondary Alert --&gt;
&lt;div class=&quot;alert alert-secondary alert-dismissible fade show&quot; role=&quot;alert&quot;&gt;
    &lt;strong&gt; How are you! &lt;/strong&gt; A simple &lt;b&gt;Dismissible secondary Alert &lt;/b&gt; &mdash; check it out!
    &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot;alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Success Alert --&gt;
&lt;div class=&quot;alert alert-success alert-dismissible fade show&quot; role=&quot;alert&quot;&gt;
    &lt;strong&gt; Yey! Everything worked! &lt;/strong&gt; A simple &lt;b&gt;Dismissible success Alert &lt;/b&gt; &mdash; check it out!
    &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot;alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Danger Alert --&gt;
&lt;div class=&quot;alert alert-danger alert-dismissible fade show&quot; role=&quot;alert&quot;&gt;
    &lt;strong&gt; Something is very wrong! &lt;/strong&gt; A simple &lt;b&gt;Dismissible danger Alert &lt;/b&gt; &mdash; check it out!
    &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot;alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Warning Alert --&gt;
&lt;div class=&quot;alert alert-warning alert-dismissible fade show&quot; role=&quot;alert&quot;&gt;
    &lt;strong&gt; Welcome Back! &lt;/strong&gt; A simple &lt;b&gt;Dismissible warning Alert &lt;/b&gt; &mdash; check it out!
    &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot;alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Info Alert --&gt;
&lt;div class=&quot;alert alert-info alert-dismissible fade show&quot; role=&quot;alert&quot;&gt;
    &lt;strong&gt; Don't forget' it ! &lt;/strong&gt; A simple &lt;b&gt;Dismissible info Alert &lt;/b&gt; &mdash; check it out!
    &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot;alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Light Alert --&gt;
&lt;div class=&quot;alert alert-light alert-dismissible fade show&quot; role=&quot;alert&quot;&gt;
    &lt;strong&gt; Mind Your Step! &lt;/strong&gt; A simple &lt;b&gt;Dismissible light Alert &lt;/b&gt; &mdash; check it out!
    &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot;alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Dark Alert --&gt;
&lt;div class=&quot;alert alert-dark alert-dismissible fade show&quot; role=&quot;alert&quot;&gt;
    &lt;strong&gt; Did you know? &lt;/strong&gt; A simple &lt;b&gt;Dismissible dark Alert &lt;/b&gt; &mdash; check it out!
    &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot;alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
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
                                                        <h4 class="card-title mb-0 flex-grow-1">Link Color Alerts</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="2" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="2"/>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">
                                                        <p class="text-muted">Use the <code>alert-link</code> class at &lt;a&gt; tag to show matching colored links within the given alert.</p>

                                                        <div class="live-preview">
                                                            <div class="row">
                                                                <div class="col-xl-6">
                                                                    <h6>Primary Alert</h6>
                                                                    <div class="alert alert-primary" role="alert">
                                                    A simple Primary alert with <a href="#" class="alert-link">an example
                                                        link</a>. Give it a click if you like.
                                                                    </div>

                                                                    <h6>Secondary Alert</h6>
                                                                    <div class="alert alert-secondary" role="alert">
                                                    A simple Secondary alert with <a href="#" class="alert-link">an example
                                                        link</a>. Give it a click if you like.
                                                                    </div>

                                                                    <h6>Success Alert</h6>
                                                                    <div class="alert alert-success" role="alert">
                                                    A simple Success alert with <a href="#" class="alert-link">an example
                                                        link</a>. Give it a click if you like.
                                                                    </div>

                                                                    <h6>Danger Alert</h6>
                                                                    <div class="alert alert-danger mb-xl-0" role="alert">
                                                    A simple Danger alert with <a href="#" class="alert-link">an example
                                                        link</a>. Give it a click if you like.
                                                                    </div>
                                                                </div>

                                                                <div class="col-xl-6">
                                                                    <h6>Warning Alert</h6>
                                                                    <div class="alert alert-warning" role="alert">
                                                    A simple Warning alert with <a href="#" class="alert-link">an example
                                                        link</a>. Give it a click if you like.
                                                                    </div>

                                                                    <h6>Info Alert</h6>
                                                                    <div class="alert alert-info" role="alert">
                                                    A simple Info alert with <a href="#" class="alert-link">an example
                                                        link</a>. Give it a click if you like.
                                                                    </div>

                                                                    <h6>Light Alert</h6>
                                                                    <div class="alert alert-light" role="alert">
                                                    A simple Light alert with <a href="#" class="alert-link">an example
                                                        link</a>. Give it a click if you like.
                                                                    </div>

                                                                    <h6>Dark Alert</h6>
                                                                    <div class="alert alert-dark mb-0" role="alert">
                                                    A simple Dark alert with <a href="#" class="alert-link">an example
                                                        link</a>. Give it a click if you like.
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="max-height: 260px;">
                                                                <code>&lt;!-- Primary Alert --&gt;
&lt;div class=&quot;alert alert-primary&quot; role=&quot;alert&quot;&gt;
    A simple &lt;b&gt;Primary alert&lt;/b&gt; with &lt;a href=&quot;#&quot; class=&quot;alert-link&quot;&gt;an example link&lt;/a&gt;. Give it a click if you like.
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Secondary Alert --&gt;
&lt;div class=&quot;alert alert-secondary&quot; role=&quot;alert&quot;&gt;
    A simple &lt;b&gt;Secondary alert&lt;/b&gt; with &lt;a href=&quot;#&quot; class=&quot;alert-link&quot;&gt;an example link&lt;/a&gt;. Give it a click if you like.
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Success Alert --&gt;
&lt;div class=&quot;alert alert-success&quot; role=&quot;alert&quot;&gt;
    A simple &lt;b&gt;Success alert&lt;/b&gt; with &lt;a href=&quot;#&quot; class=&quot;alert-link&quot;&gt;an example link&lt;/a&gt;. Give it a click if you like.
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Danger Alert --&gt;
&lt;div class=&quot;alert alert-danger&quot; role=&quot;alert&quot;&gt;
    A simple &lt;b&gt;Danger alert&lt;/b&gt; with &lt;a href=&quot;#&quot; class=&quot;alert-link&quot;&gt;an example link&lt;/a&gt;. Give it a click if you like.
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Warning Alert --&gt;
&lt;div class=&quot;alert alert-warning&quot; role=&quot;alert&quot;&gt;
    A simple &lt;b&gt;Warning alert&lt;/b&gt; with &lt;a href=&quot;#&quot; class=&quot;alert-link&quot;&gt;an example link&lt;/a&gt;. Give it a click if you like.
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Info Alert --&gt;
&lt;div class=&quot;alert alert-info&quot; role=&quot;alert&quot;&gt;
    A simple &lt;b&gt;Info alert&lt;/b&gt; with &lt;a href=&quot;#&quot; class=&quot;alert-link&quot;&gt;an example link&lt;/a&gt;. Give it a click if you like.
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Light Alert --&gt;
&lt;div class=&quot;alert alert-light&quot; role=&quot;alert&quot;&gt;
    A simple &lt;b&gt;Light alert&lt;/b&gt; with &lt;a href=&quot;#&quot; class=&quot;alert-link&quot;&gt;an example link&lt;/a&gt;. Give it a click if you like.
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Dark Alert --&gt;
&lt;div class=&quot;alert alert-dark&quot; role=&quot;alert&quot;&gt;
    A simple &lt;b&gt;Dark alert&lt;/b&gt; with &lt;a href=&quot;#&quot; class=&quot;alert-link&quot;&gt;an example link&lt;/a&gt;. Give it a click if you like.
&lt;/div&gt;
                                                                </code>
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
                                                        <h4 class="card-title mb-0 flex-grow-1">Live Alert Example</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="3" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="3"/>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">
                                                        <p class="text-muted">Click the Show live alert button to show an alert on button click.</p>
                                                        <div class="live-preview">
                                                            <div id="liveAlertPlaceholder"></div>
                                                            <button type="button" class="btn btn-primary" id="liveAlertBtn">Show live alert</button>
                                                        </div>

                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="max-height: 260px;">
                                                                <code>&lt;div id=&quot;liveAlertPlaceholder&quot;&gt;&lt;/div&gt;
&lt;button type=&quot;button&quot; class=&quot;btn btn-primary&quot; id=&quot;liveAlertBtn&quot;&gt;Show live alert&lt;/button&gt;
                                                                </code>
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
                                                        <h4 class="card-title mb-0 flex-grow-1">Outline Alerts</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="4" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="4"/>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">
                                                        <p class="text-muted">Use the <code>alert-outline</code> class to set an alert with outline.</p>

                                                        <div class="live-preview">
                                                            <div class="row">
                                                                <div class="col-xl-6">
                                                                    <h6>Primary Outline Alert</h6>
                                                                    <div class="alert alert-primary alert-dismissible alert-outline fade show" role="alert">
                                                                        <strong> Hi! </strong> - Outline <b>primary alert</b> example
                                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>

                                                                    <h6>Secondary Outline Alert</h6>
                                                                    <div class="alert alert-secondary  alert-dismissible alert-outline fade show" role="alert">
                                                                        <strong> How are you! </strong> - Outline <b>secondary alert</b> example
                                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>

                                                                    <h6>Success Outline Alert</h6>
                                                                    <div class="alert alert-success alert-dismissible alert-outline fade show" role="alert">
                                                                        <strong> Yey! Everything worked! </strong> - Outline <b>success alert</b> example
                                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>

                                                                    <h6>Danger Outline Alert</h6>
                                                                    <div class="alert alert-danger alert-dismissible alert-outline fade show mb-xl-0" role="alert">
                                                                        <strong> Something is very wrong! </strong> - Outline <b>danger alert</b> example
                                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>
                                                                </div>

                                                                <div class="col-xl-6">
                                                                    <h6>Warning Outline Alert</h6>
                                                                    <div class="alert alert-warning alert-dismissible alert-outline fade show" role="alert">
                                                                        <strong> Uh oh, something went wrong! </strong> - Outline <b>warning alert</b> example
                                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>

                                                                    <h6>Info Outline Alert</h6>
                                                                    <div class="alert alert-info alert-dismissible alert-outline fade show" role="alert">
                                                                        <strong>Don't forget' it !</strong> - Outline <b>info alert</b> example
                                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>

                                                                    <h6>Dark Alert</h6>
                                                                    <div class="alert alert-dark alert-dismissible alert-outline fade show mb-0" role="alert">
                                                                        <strong>Did you know?</strong> - Outline <b>dark alert</b> example
                                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="max-height: 260px;">
                                                                <code>&lt;!-- Primary Alert --&gt;
&lt;div class=&quot;alert alert-primary alert-dismissible alert-outline fade show&quot; role=&quot;alert&quot;&gt;
    &lt;strong&gt; Hi! &lt;/strong&gt; - Outline &lt;b&gt;primary alert&lt;/b&gt; example
    &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot;alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Secondary Alert --&gt;
&lt;div class=&quot;alert alert-secondary alert-dismissible alert-outline fade show&quot; role=&quot;alert&quot;&gt;
    &lt;strong&gt; How are you! &lt;/strong&gt; - Outline &lt;b&gt;secondary alert&lt;/b&gt; example
    &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot;alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Success Alert --&gt;
&lt;div class=&quot;alert alert-success alert-dismissible alert-outline fade show&quot; role=&quot;alert&quot;&gt;
    &lt;strong&gt; Yey! Everything worked! &lt;/strong&gt; - Outline &lt;b&gt;success alert&lt;/b&gt; example
    &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot;alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Danger Alert --&gt;
&lt;div class=&quot;alert alert-danger alert-dismissible alert-outline fade show&quot; role=&quot;alert&quot;&gt;
    &lt;strong&gt; Something is very wrong! &lt;/strong&gt; - Outline &lt;b&gt;danger alert&lt;/b&gt; example
    &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot;alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Warning Alert --&gt;
&lt;div class=&quot;alert alert-warning alert-dismissible alert-outline fade show&quot; role=&quot;alert&quot;&gt;
    &lt;strong&gt; Uh oh, something went wrong! &lt;/strong&gt; - Outline &lt;b&gt;warning alert&lt;/b&gt; example
    &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot;alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Info Alert --&gt;
&lt;div class=&quot;alert alert-info alert-dismissible alert-outline fade show&quot; role=&quot;alert&quot;&gt;
    &lt;strong&gt; Don't forget' it ! &lt;/strong&gt; - Outline &lt;b&gt;info alert&lt;/b&gt; example
    &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot;alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Dark Alert --&gt;
&lt;div class=&quot;alert alert-dark alert-dismissible alert-outline fade show&quot; role=&quot;alert&quot;&gt;
    &lt;strong&gt; Did you know? &lt;/strong&gt; - Outline &lt;b&gt;dark alert&lt;/b&gt; example
    &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot;alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
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
                                                        <h4 class="card-title mb-0 flex-grow-1">Left Border Alerts</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="5" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="5"/>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">
                                                        <p class="text-muted">Use the <code>alert-border-left </code> class to set an alert with the left border &amp; outline.</p>

                                                        <div class="live-preview">
                                                            <div class="row">
                                                                <div class="col-xl-6">
                                                                    <h6>Primary Alert</h6>
                                                                    <div class="alert alert-primary alert-border-left alert-dismissible fade show" role="alert">
                                                                        <i class="ri-user-smile-line me-3 align-middle fs-16"></i>
                                                                        <strong>Primary</strong>
                                                    - Left border alert
                                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>

                                                                    <h6>Secondary Alert</h6>
                                                                    <div class="alert alert-secondary alert-border-left alert-dismissible fade show" role="alert">
                                                                        <i class="ri-check-double-line me-3 align-middle fs-16"></i>
                                                                        <strong>Secondary</strong>
                                                    - Left border alert
                                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>

                                                                    <h6>Success Alert</h6>
                                                                    <div class="alert alert-success alert-border-left alert-dismissible fade show" role="alert">
                                                                        <i class="ri-notification-off-line me-3 align-middle fs-16"></i>
                                                                        <strong>Success</strong>
                                                    - Left border alert
                                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>

                                                                    <h6>Danger Alert</h6>
                                                                    <div class="alert alert-danger alert-border-left alert-dismissible fade show mb-xl-0" role="alert">
                                                                        <i class="ri-error-warning-line me-3 align-middle fs-16"></i>
                                                                        <strong>Danger</strong>
                                                    - Left border alert
                                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>
                                                                </div>

                                                                <div class="col-xl-6">
                                                                    <h6>Warning Alert</h6>
                                                                    <div class="alert alert-warning alert-border-left alert-dismissible fade show" role="alert">
                                                                        <i class="ri-alert-line me-3 align-middle fs-16"></i>
                                                                        <strong>Warning</strong>
                                                    - Left border alert
                                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>

                                                                    <h6>Info Alert</h6>
                                                                    <div class="alert alert-info alert-border-left alert-dismissible fade show" role="alert">
                                                                        <i class="ri-airplay-line me-3 align-middle fs-16"></i>
                                                                        <strong>Info</strong>
                                                    - Left border alert
                                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>

                                                                    <h6>Light Alert</h6>
                                                                    <div class="alert alert-light alert-border-left alert-dismissible fade show" role="alert">
                                                                        <i class="ri-mail-line me-3 align-middle fs-16"></i>
                                                                        <strong>Light</strong>
                                                    - Left border alert
                                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>

                                                                    <h6>Dark Alert</h6>
                                                                    <div class="alert alert-dark alert-border-left alert-dismissible fade show mb-0" role="alert">
                                                                        <i class="ri-refresh-line me-3  align-middle fs-16"></i>
                                                                        <strong>Dark</strong>
                                                    - Left border alert
                                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="max-height: 260px;">
                                                                <code>&lt;!-- Primary Alert --&gt;
&lt;div class=&quot;alert alert-primary alert-border-left alert-dismissible fade show&quot; role=&quot;alert&quot;&gt;
    &lt;i class=&quot;ri-user-smile-line me-3 align-middle&quot;&gt;&lt;/i&gt; &lt;strong&gt;Primary&lt;/strong&gt; - Left border alert
    &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot;alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Secondary Alert --&gt;
&lt;div class=&quot;alert alert-secondary alert-border-left alert-dismissible fade show&quot; role=&quot;alert&quot;&gt;
    &lt;i class=&quot;ri-check-double-line me-3 align-middle&quot;&gt;&lt;/i&gt; &lt;strong&gt;Secondary&lt;/strong&gt; - Left border alert
    &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot;alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Success Alert --&gt;
&lt;div class=&quot;alert alert-success alert-border-left alert-dismissible fade show&quot; role=&quot;alert&quot;&gt;
    &lt;i class=&quot;ri-notification-off-line me-3 align-middle&quot;&gt;&lt;/i&gt; &lt;strong&gt;Success&lt;/strong&gt; - Left border alert
    &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot;alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Danger Alert --&gt;
&lt;div class=&quot;alert alert-danger alert-border-left alert-dismissible fade show&quot; role=&quot;alert&quot;&gt;
    &lt;i class=&quot;ri-error-warning-line me-3 align-middle&quot;&gt;&lt;/i&gt; &lt;strong&gt;Danger&lt;/strong&gt; - Left border alert
    &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot;alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Warning Alert --&gt;
&lt;div class=&quot;alert alert-warning alert-border-left alert-dismissible fade show&quot; role=&quot;alert&quot;&gt;
    &lt;i class=&quot;ri-alert-line me-3 align-middle&quot;&gt;&lt;/i&gt; &lt;strong&gt;Warning&lt;/strong&gt; - Left border alert
    &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot;alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Info Alert --&gt;
&lt;div class=&quot;alert alert-info alert-border-left alert-dismissible fade show&quot; role=&quot;alert&quot;&gt;
    &lt;i class=&quot;ri-airplay-line me-3 align-middle&quot;&gt;&lt;/i&gt; &lt;strong&gt;Info&lt;/strong&gt; - Left border alert
    &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot;alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Light Alert --&gt;
    &lt;div class=&quot;alert alert-light alert-border-left alert-dismissible fade show&quot; role=&quot;alert&quot;&gt;
        &lt;i class=&quot;ri-mail-line me-3 align-middle&quot;&gt;&lt;/i&gt; &lt;strong&gt;Light&lt;/strong&gt; - Left border alert
        &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot;alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
    &lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Dark Alert --&gt;
&lt;div class=&quot;alert alert-dark alert-border-left alert-dismissible fade show&quot; role=&quot;alert&quot;&gt;
    &lt;i class=&quot;ri-refresh-line me-3 align-middle&quot;&gt;&lt;/i&gt; &lt;strong&gt;Dark&lt;/strong&gt; - Left border alert
    &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot;alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
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
                                                        <h4 class="card-title mb-0 flex-grow-1">Label Icon Alerts</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="6" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="6"/>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">
                                                        <p class="text-muted">Use the <code>alert-label-icon</code> class to set an alert with a label icon.</p>
                                                        <div class="live-preview">
                                                            <div class="row">
                                                                <div class="col-xl-6">
                                                                    <h6>Primary Alert</h6>
                                                                    <div class="alert alert-primary alert-dismissible alert-solid alert-label-icon fade show" role="alert">
                                                                        <i class="ri-user-smile-line label-icon"></i>
                                                                        <strong>Primary</strong> -
                                                    Label icon alert
                                                                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>

                                                                    <h6>Secondary Alert</h6>
                                                                    <div class="alert alert-secondary alert-dismissible alert-solid alert-label-icon fade show" role="alert">
                                                                        <i class="ri-check-double-line label-icon"></i>
                                                                        <strong>Secondary</strong>
                                                    - Label icon alert
                                                                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>

                                                                    <h6>Success Alert</h6>
                                                                    <div class="alert alert-success alert-dismissible alert-solid alert-label-icon fade show" role="alert">
                                                                        <i class="ri-notification-off-line label-icon"></i>
                                                                        <strong>Success</strong>
                                                    - Label icon alert
                                                                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>

                                                                    <h6>Danger Alert</h6>
                                                                    <div class="alert alert-danger alert-dismissible alert-solid alert-label-icon fade show mb-xl-0" role="alert">
                                                                        <i class="ri-error-warning-line label-icon"></i>
                                                                        <strong>Danger</strong>
                                                    - Label
                                                    icon alert
                                                                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>
                                                                </div>

                                                                <div class="col-xl-6">
                                                                    <h6>Warning Alert</h6>
                                                                    <div class="alert alert-warning alert-dismissible alert-solid alert-label-icon fade show" role="alert">
                                                                        <i class="ri-alert-line label-icon"></i>
                                                                        <strong>warning</strong> - Label
                                                    icon alert
                                                                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>

                                                                    <h6>Info Alert</h6>
                                                                    <div class="alert alert-info alert-dismissible alert-solid alert-label-icon fade show" role="alert">
                                                                        <i class="ri-airplay-line label-icon"></i>
                                                                        <strong>Info</strong> - Label
                                                    icon alert
                                                                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>

                                                                    <h6>Light Alert</h6>
                                                                    <div class="alert alert-light alert-dismissible alert-solid alert-label-icon fade show" role="alert">
                                                                        <i class="ri-mail-line label-icon"></i>
                                                                        <strong>Light</strong> -
                                                    Label icon alert
                                                                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>

                                                                    <h6>Dark Alert</h6>
                                                                    <div class="alert alert-dark alert-dismissible alert-solid alert-label-icon fade show mb-0" role="alert">
                                                                        <i class="ri-refresh-line label-icon"></i>
                                                                        <strong>Dark</strong> -
                                                    Label icon alert
                                                                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="max-height: 260px;">
                                                                <code>&lt;!-- Primary Alert --&gt;
&lt;div class=&quot;alert alert-primary alert-dismissible alert-solid alert-label-icon fade show&quot; role=&quot;alert&quot;&gt;
    &lt;i class=&quot;ri-user-smile-line label-icon&quot;&gt;&lt;/i&gt;&lt;strong&gt;Primary&lt;/strong&gt; - Label icon alert
    &lt;button type=&quot;button&quot; class=&quot;btn-close btn-close-white&quot; data-bs-dismiss=&quot;alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Secondary Alert --&gt;
&lt;div class=&quot;alert alert-secondary alert-dismissible alert-solid alert-label-icon fade show&quot; role=&quot;alert&quot;&gt;
    &lt;i class=&quot;ri-check-double-line label-icon&quot;&gt;&lt;/i&gt;&lt;strong&gt;Secondary&lt;/strong&gt; - Label icon alert
    &lt;button type=&quot;button&quot; class=&quot;btn-close btn-close-white&quot; data-bs-dismiss=&quot;alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Success Alert --&gt;
&lt;div class=&quot;alert alert-success alert-dismissible alert-solid alert-label-icon fade show&quot; role=&quot;alert&quot;&gt;
    &lt;i class=&quot;ri-notification-off-line label-icon&quot;&gt;&lt;/i&gt;&lt;strong&gt;Success&lt;/strong&gt; - Label icon alert
    &lt;button type=&quot;button&quot; class=&quot;btn-close btn-close-white&quot; data-bs-dismiss=&quot;alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Danger Alert --&gt;
&lt;div class=&quot;alert alert-danger alert-dismissible alert-solid alert-label-icon fade show&quot; role=&quot;alert&quot;&gt;
    &lt;i class=&quot;ri-error-warning-line label-icon&quot;&gt;&lt;/i&gt;&lt;strong&gt;Danger&lt;/strong&gt; - Label icon alert
    &lt;button type=&quot;button&quot; class=&quot;btn-close btn-close-white&quot; data-bs-dismiss=&quot;alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Warning Alert --&gt;
&lt;div class=&quot;alert alert-warning alert-dismissible alert-solid alert-label-icon fade show&quot; role=&quot;alert&quot;&gt;
    &lt;i class=&quot;ri-alert-line label-icon&quot;&gt;&lt;/i&gt;&lt;strong&gt;Warning&lt;/strong&gt; - Label icon alert
    &lt;button type=&quot;button&quot; class=&quot;btn-close btn-close-white&quot; data-bs-dismiss=&quot;alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Info Alert --&gt;
&lt;div class=&quot;alert alert-info alert-dismissible alert-solid alert-label-icon fade show&quot; role=&quot;alert&quot;&gt;
    &lt;i class=&quot;ri-airplay-line label-icon&quot;&gt;&lt;/i&gt;&lt;strong&gt;Info&lt;/strong&gt; - Label icon alert
    &lt;button type=&quot;button&quot; class=&quot;btn-close btn-close-white&quot; data-bs-dismiss=&quot;alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Light Alert --&gt;
&lt;div class=&quot;alert alert-light alert-dismissible alert-solid alert-label-icon fade show&quot; role=&quot;alert&quot;&gt;
    &lt;i class=&quot;ri-mail-line label-icon&quot;&gt;&lt;/i&gt;&lt;strong&gt;Light&lt;/strong&gt; - Label icon alert
    &lt;button type=&quot;button&quot; class=&quot;btn-close btn-close-white&quot; data-bs-dismiss=&quot;alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Dark Alert --&gt;
&lt;div class=&quot;alert alert-dark alert-dismissible alert-solid alert-label-icon fade show mb-0&quot; role=&quot;alert&quot;&gt;
    &lt;i class=&quot;ri-refresh-line label-icon&quot;&gt;&lt;/i&gt;&lt;strong&gt;Dark&lt;/strong&gt; - Label icon alert
    &lt;button type=&quot;button&quot; class=&quot;btn-close btn-close-white&quot; data-bs-dismiss=&quot;alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
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
                                                        <h4 class="card-title mb-0 flex-grow-1">Additional Content Alerts</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="7" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="7"/>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">
                                                        <p class="text-muted">Use the <code>alert-additional</code> class and Use the <code>alert-</code> class to HTML elements like headings, paragraphs, dividers etc.</p>
                                                        <div class="live-preview">
                                                            <div class="row">
                                                                <div class="col-xl-6">
                                                                    <h6>Primary Alert</h6>
                                                                    <div class="alert alert-primary alert-dismissible alert-additional fade show" role="alert">
                                                                        <div class="alert-body">
                                                                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                            <div class="d-flex">
                                                                                <div class="flex-shrink-0 me-3">
                                                                                    <i class="ri-error-warning-line fs-16 align-middle"></i>
                                                                                </div>
                                                                                <div class="flex-grow-1">
                                                                                    <h5 class="alert-heading">Well done !</h5>
                                                                                    <p class="mb-0">Aww yeah, you successfully read this important alert message. </p>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="alert-content">
                                                                            <p class="mb-0">Whenever you need to, be sure to use margin utilities to keep things nice and tidy.</p>
                                                                        </div>
                                                                    </div>

                                                                    <h6>Danger Alert</h6>
                                                                    <div class="alert alert-danger alert-dismissible alert-additional fade show mb-xl-0" role="alert">
                                                                        <div class="alert-body">
                                                                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                            <div class="d-flex">
                                                                                <div class="flex-shrink-0 me-3">
                                                                                    <i class="ri-alert-line fs-16 align-middle"></i>
                                                                                </div>
                                                                                <div class="flex-grow-1">
                                                                                    <h5 class="alert-heading">Something is very wrong!</h5>
                                                                                    <p class="mb-0">Change a few things up and try submitting again.</p>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="alert-content">
                                                                            <p class="mb-0">Whenever you need to, be sure to use margin
                                                            utilities to keep things nice and tidy.</p>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-xl-6">

                                                                    <h6>Success Alert</h6>
                                                                    <div class="alert alert-success alert-dismissible alert-additional fade show" role="alert">
                                                                        <div class="alert-body">
                                                                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                            <div class="d-flex">
                                                                                <div class="flex-shrink-0 me-3">
                                                                                    <i class="ri-notification-off-line fs-16 align-middle"></i>
                                                                                </div>
                                                                                <div class="flex-grow-1">
                                                                                    <h5 class="alert-heading">Yey! Everything worked!</h5>
                                                                                    <p class="mb-0">This alert needs your attention, but it's not super important.</p>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="alert-content">
                                                                            <p class="mb-0">Whenever you need to, be sure to use margin utilities to keep things nice and tidy.</p>
                                                                        </div>
                                                                    </div>

                                                                    <h6>Warning Alert</h6>
                                                                    <div class="alert alert-warning alert-dismissible alert-additional fade show mb-0" role="alert">
                                                                        <div class="alert-body">
                                                                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                            <div class="d-flex">
                                                                                <div class="flex-shrink-0 me-3">
                                                                                    <i class="ri-alert-line fs-16 align-middle"></i>
                                                                                </div>
                                                                                <div class="flex-grow-1">
                                                                                    <h5 class="alert-heading">Uh oh, something went wrong!</h5>
                                                                                    <p class="mb-0">Better check yourself, you're not looking too good.</p>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="alert-content">
                                                                            <p class="mb-0">Whenever you need to, be sure to use margin utilities to keep things nice and tidy.</p>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="max-height: 260px;">
                                                                <code>&lt;!-- Primary Alert --&gt;
&lt;div class=&quot;alert alert-primary alert-dismissible alert-additional fade show&quot; role=&quot;alert&quot;&gt;
    &lt;div class=&quot;alert-body&quot;&gt;
        &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot;alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
        &lt;div class=&quot;d-flex&quot;&gt;
            &lt;div class=&quot;flex-shrink-0 me-3&quot;&gt;
                &lt;i class=&quot;ri-user-smile-line fs-16 align-middle&quot;&gt;&lt;/i&gt;
            &lt;/div&gt;
            &lt;div class=&quot;flex-grow-1&quot;&gt;
                &lt;h5 class=&quot;alert-heading&quot;&gt;Well done !&lt;/h5&gt;
                &lt;p class=&quot;mb-0&quot;&gt;Aww yeah, you successfully read this important alert message. &lt;/p&gt;
            &lt;/div&gt;
        &lt;/div&gt;
    &lt;/div&gt;
    &lt;div class=&quot;alert-content&quot;&gt;
        &lt;p class=&quot;mb-0&quot;&gt;Whenever you need to, be sure to use margin utilities to keep things nice and tidy.&lt;/p&gt;
    &lt;/div&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;!-- Danger Alert --&gt;
&lt;div class=&quot;alert alert-danger alert-dismissible alert-additional fade show&quot; role=&quot;alert&quot;&gt;
    &lt;div class=&quot;alert-body&quot;&gt;
        &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot;alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
        &lt;div class=&quot;d-flex&quot;&gt;
            &lt;div class=&quot;flex-shrink-0 me-3&quot;&gt;
                &lt;i class=&quot;ri-error-warning-line fs-16 align-middle&quot;&gt;&lt;/i&gt;
            &lt;/div&gt;
            &lt;div class=&quot;flex-grow-1&quot;&gt;
                &lt;h5 class=&quot;alert-heading&quot;&gt;Something is very wrong!&lt;/h5&gt;
                &lt;p class=&quot;mb-0&quot;&gt;Change a few things up and try submitting again. &lt;/p&gt;
            &lt;/div&gt;
        &lt;/div&gt;
    &lt;/div&gt;
    &lt;div class=&quot;alert-content&quot;&gt;
        &lt;p class=&quot;mb-0&quot;&gt;Whenever you need to, be sure to use margin utilities to keep things nice and tidy.&lt;/p&gt;
    &lt;/div&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;!-- Success Alert --&gt;
&lt;div class=&quot;alert alert-success alert-dismissible alert-additional fade show&quot; role=&quot;alert&quot;&gt;
    &lt;div class=&quot;alert-body&quot;&gt;
        &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot;alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
        &lt;div class=&quot;d-flex&quot;&gt;
            &lt;div class=&quot;flex-shrink-0 me-3&quot;&gt;
                &lt;i class=&quot;ri-notification-off-line fs-16 align-middle&quot;&gt;&lt;/i&gt;
            &lt;/div&gt;
            &lt;div class=&quot;flex-grow-1&quot;&gt;
                &lt;h5 class=&quot;alert-heading&quot;&gt;Yey! Everything worked!&lt;/h5&gt;
                &lt;p class=&quot;mb-0&quot;&gt;This alert needs your attention, but it's not super important. &lt;/p&gt;
            &lt;/div&gt;
        &lt;/div&gt;
    &lt;/div&gt;
    &lt;div class=&quot;alert-content&quot;&gt;
        &lt;p class=&quot;mb-0&quot;&gt;Whenever you need to, be sure to use margin utilities to keep things nice and tidy.&lt;/p&gt;
    &lt;/div&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;!-- Warning Alert --&gt;
&lt;div class=&quot;alert alert-warning alert-dismissible alert-additional fade show mb-0&quot; role=&quot;alert&quot;&gt;
    &lt;div class=&quot;alert-body&quot;&gt;
        &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot;alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
        &lt;div class=&quot;d-flex&quot;&gt;
            &lt;div class=&quot;flex-shrink-0 me-3&quot;&gt;
                &lt;i class=&quot;ri-alert-line fs-16 align-middle&quot;&gt;&lt;/i&gt;
            &lt;/div&gt;
            &lt;div class=&quot;flex-grow-1&quot;&gt;
                &lt;h5 class=&quot;alert-heading&quot;&gt;Uh oh, something went wrong!&lt;/h5&gt;
                &lt;p class=&quot;mb-0&quot;&gt;Better check yourself, you're not looking too good. &lt;/p&gt;
            &lt;/div&gt;
        &lt;/div&gt;
    &lt;/div&gt;
    &lt;div class=&quot;alert-content&quot;&gt;
        &lt;p class=&quot;mb-0&quot;&gt;Whenever you need to, be sure to use margin utilities to keep things nice and tidy.&lt;/p&gt;
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
                                                        <h4 class="card-title mb-0 flex-grow-1">Top Border with Outline Alerts</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="8" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="8"/>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">
                                                        <p class="text-muted">Use the <code>alert-top-border</code> class to set an alert with the top border and outline.</p>
                                                        <div class="live-preview">
                                                            <div class="row">
                                                                <div class="col-xl-6">
                                                                    <h6>Primary Alert</h6>
                                                                    <div class="alert alert-primary alert-top-border alert-dismissible fade show" role="alert">
                                                                        <i class="ri-user-smile-line me-3 align-middle fs-16 text-primary"></i>
                                                                        <strong>Primary</strong>
                                                    - Top border alert
                                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>


                                                                    <h6>Secondary Alert</h6>
                                                                    <div class="alert alert-secondary alert-top-border alert-dismissible fade show" role="alert">
                                                                        <i class="ri-check-double-line me-3 align-middle fs-16 text-secondary"></i>
                                                                        <strong>Secondary</strong>
                                                    - Top border alert
                                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>

                                                                    <h6>Success Alert</h6>
                                                                    <div class="alert alert-success alert-top-border alert-dismissible fade show" role="alert">
                                                                        <i class="ri-notification-off-line me-3 align-middle fs-16 text-success"></i>
                                                                        <strong>Success</strong>
                                                    - Top border alert
                                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>

                                                                    <h6>Danger Alert</h6>
                                                                    <div class="alert alert-danger alert-top-border alert-dismissible fade show mb-xl-0" role="alert">
                                                                        <i class="ri-error-warning-line me-3 align-middle fs-16 text-danger "></i>
                                                                        <strong>Danger</strong>
                                                    - Top border alert
                                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>
                                                                </div>

                                                                <div class="col-xl-6">
                                                                    <h6>Warning Alert</h6>
                                                                    <div class="alert alert-warning alert-top-border alert-dismissible fade show" role="alert">
                                                                        <i class="ri-alert-line me-3 align-middle fs-16 text-warning"></i>
                                                                        <strong>Warning</strong>
                                                    - Top border alert
                                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>

                                                                    <h6>Info Alert</h6>
                                                                    <div class="alert alert-info alert-top-border alert-dismissible fade show" role="alert">
                                                                        <i class="ri-airplay-line me-3 align-middle fs-16 text-info"></i>
                                                                        <strong>Info</strong>
                                                    - Top border alert
                                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>

                                                                    <h6>Light Alert</h6>
                                                                    <div class="alert alert-light alert-top-border alert-dismissible fade show" role="alert">
                                                                        <i class="ri-mail-line me-3 align-middle fs-16 text-dark"></i>
                                                                        <strong>Light</strong>
                                                    - Top border alert
                                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>

                                                                    <h6>Dark Alert</h6>
                                                                    <div class="alert alert-dark alert-top-border alert-dismissible fade show mb-0" role="alert">
                                                                        <i class="ri-refresh-line me-3 align-middle fs-16 text-dark"></i>
                                                                        <strong>Dark</strong>
                                                    - Top border alert
                                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="max-height: 260px;">
                                                                <code>&lt;!-- Primary Alert --&gt;
&lt;div class=&quot;alert alert-primary alert-top-border alert-dismissible fade show&quot; role=&quot;alert&quot;&gt;
    &lt;i class=&quot;ri-user-smile-line me-3 align-middle fs-16 text-primary&quot;&gt;&lt;/i&gt;&lt;strong&gt;Primary&lt;/strong&gt; - Top border alert
    &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot;alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Secondary Alert --&gt;
&lt;div class=&quot;alert alert-secondary alert-top-border alert-dismissible fade show&quot; role=&quot;alert&quot;&gt;
    &lt;i class=&quot;ri-check-double-line me-3 align-middle fs-16 text-secondary&quot;&gt;&lt;/i&gt;&lt;strong&gt;Secondary&lt;/strong&gt; - Top border alert
    &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot;alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Success Alert --&gt;
&lt;div class=&quot;alert alert-success alert-top-border alert-dismissible fade show&quot; role=&quot;alert&quot;&gt;
    &lt;i class=&quot;ri-notification-off-line me-3 align-middle fs-16 text-success&quot;&gt;&lt;/i&gt;&lt;strong&gt;Success&lt;/strong&gt; - Top border alert
    &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot;alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Danger Alert --&gt;
&lt;div class=&quot;alert alert-danger alert-top-border alert-dismissible fade show&quot; role=&quot;alert&quot;&gt;
    &lt;i class=&quot;ri-error-warning-line me-3 align-middle fs-16 text-danger&quot;&gt;&lt;/i&gt;&lt;strong&gt;Danger&lt;/strong&gt; - Top border alert
    &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot;alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Warning Alert --&gt;
&lt;div class=&quot;alert alert-warning alert-top-border alert-dismissible fade show&quot; role=&quot;alert&quot;&gt;
    &lt;i class=&quot;ri-alert-line me-3 align-middle fs-16 text-warning&quot;&gt;&lt;/i&gt;&lt;strong&gt;Warning&lt;/strong&gt; - Top border alert
    &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot;alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Info Alert --&gt;
&lt;div class=&quot;alert alert-info alert-top-border alert-dismissible fade show&quot; role=&quot;alert&quot;&gt;
    &lt;i class=&quot;ri-airplay-line me-3 align-middle fs-16 text-info&quot;&gt;&lt;/i&gt;&lt;strong&gt;Info&lt;/strong&gt; - Top border alert
    &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot;alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Light Alert --&gt;
&lt;div class=&quot;alert alert-light alert-top-border alert-dismissible fade show&quot; role=&quot;alert&quot;&gt;
    &lt;i class=&quot;ri-mail-line me-3 align-middle fs-16 text-light&quot;&gt;&lt;/i&gt;&lt;strong&gt;Light&lt;/strong&gt; - Top border alert
    &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot;alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Dark Alert --&gt;
&lt;div class=&quot;alert alert-dark alert-top-border alert-dismissible fade show mb-0&quot; role=&quot;alert&quot;&gt;
    &lt;i class=&quot;ri-refresh-line me-3 align-middle fs-16 text-dark&quot;&gt;&lt;/i&gt;&lt;strong&gt;Dark&lt;/strong&gt; - Top border alert
    &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot;alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
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
                                                        <h4 class="card-title mb-0 flex-grow-1">Label Icon Arrow Alerts</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="9" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="9"/>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">
                                                        <p class="text-muted">Use the <code>alert-label-icon label-arrow</code> class to show an alert with label icon and arrow.</p>
                                                        <div class="live-preview">

                                                            <div class="row">
                                                                <div class="col-xl-6">
                                                                    <h6>Primary Alert</h6>
                                                                    <div class="alert alert-primary alert-dismissible alert-label-icon label-arrow fade show" role="alert">
                                                                        <i class="ri-user-smile-line label-icon"></i>
                                                                        <strong>Primary</strong> -
                                                    Label icon arrow alert
                                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>

                                                                    <h6>Secondary Alert</h6>
                                                                    <div class="alert alert-secondary alert-dismissible alert-label-icon label-arrow fade show" role="alert">
                                                                        <i class="ri-check-double-line label-icon"></i>
                                                                        <strong>Secondary</strong> -
                                                    Label icon
                                                    arrow alert
                                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>

                                                                    <h6>Success Alert</h6>
                                                                    <div class="alert alert-success alert-dismissible alert-label-icon label-arrow fade show" role="alert">
                                                                        <i class="ri-notification-off-line label-icon"></i>
                                                                        <strong>Success</strong>
                                                    - Label
                                                    icon arrow alert
                                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>

                                                                    <h6>Danger Alert</h6>
                                                                    <div class="alert alert-danger alert-dismissible alert-label-icon label-arrow fade show mb-xl-0" role="alert">
                                                                        <i class="ri-error-warning-line label-icon"></i>
                                                                        <strong>Danger</strong>
                                                    - Label
                                                    icon arrow alert
                                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>
                                                                </div>

                                                                <div class="col-xl-6">
                                                                    <h6>Warning Alert</h6>
                                                                    <div class="alert alert-warning alert-dismissible alert-label-icon label-arrow fade show" role="alert">
                                                                        <i class="ri-alert-line label-icon"></i>
                                                                        <strong>Warning</strong> -
                                                    Label icon arrow alert
                                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>

                                                                    <h6>info Alert</h6>
                                                                    <div class="alert alert-info alert-dismissible alert-label-icon label-arrow fade show" role="alert">
                                                                        <i class="ri-airplay-line label-icon"></i>
                                                                        <strong>Info</strong> -
                                                    Label icon arrow alert
                                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>

                                                                    <h6>Light Alert</h6>
                                                                    <div class="alert alert-light alert-dismissible alert-label-icon label-arrow fade show" role="alert">
                                                                        <i class="ri-mail-line label-icon"></i>
                                                                        <strong>Light</strong>
                                                    - Label icon arrow alert
                                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>

                                                                    <h6>Dark Alert</h6>
                                                                    <div class="alert alert-dark alert-dismissible alert-label-icon label-arrow fade show mb-0" role="alert">
                                                                        <i class="ri-refresh-line label-icon"></i>
                                                                        <strong>Dark</strong>
                                                    - Label icon arrow alert
                                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="max-height: 260px;">
                                                                <code>&lt;!-- Primary Alert --&gt;
&lt;div class=&quot;alert alert-primary alert-dismissible alert-label-icon label-arrow fade show&quot; role=&quot;alert&quot;&gt;
    &lt;i class=&quot;ri-user-smile-line label-icon&quot;&gt;&lt;/i&gt;&lt;strong&gt;Primary&lt;/strong&gt; - Label icon arrow  alert
    &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot; alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Secondary Alert --&gt;
&lt;div class=&quot;alert alert-secondary alert-dismissible alert-label-icon label-arrow fade show&quot; role=&quot;alert&quot;&gt;
    &lt;i class=&quot;ri-check-double-line label-icon&quot;&gt;&lt;/i&gt;&lt;strong&gt;Secondary&lt;/strong&gt; - Label icon arrow  alert
    &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot; alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Success Alert --&gt;
&lt;div class=&quot;alert alert-success alert-dismissible alert-label-icon label-arrow fade show&quot; role=&quot;alert&quot;&gt;
    &lt;i class=&quot;ri-notification-off-line label-icon&quot;&gt;&lt;/i&gt;&lt;strong&gt;Success&lt;/strong&gt; - Label icon arrow  alert
    &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot; alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Danger Alert --&gt;
&lt;div class=&quot;alert alert-danger alert-dismissible alert-label-icon label-arrow fade show&quot; role=&quot;alert&quot;&gt;
    &lt;i class=&quot;ri-error-warning-line label-icon&quot;&gt;&lt;/i&gt;&lt;strong&gt;Danger&lt;/strong&gt; - Label icon arrow  alert
    &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot; alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Warning Alert --&gt;
&lt;div class=&quot;alert alert-warning alert-dismissible alert-label-icon label-arrow fade show&quot; role=&quot;alert&quot;&gt;
    &lt;i class=&quot;ri-alert-line label-icon&quot;&gt;&lt;/i&gt;&lt;strong&gt;Warning&lt;/strong&gt; - Label icon arrow  alert
    &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot; alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Info Alert --&gt;
&lt;div class=&quot;alert alert-info alert-dismissible alert-label-icon label-arrow fade show&quot; role=&quot;alert&quot;&gt;
    &lt;i class=&quot;ri-airplay-line label-icon&quot;&gt;&lt;/i&gt;&lt;strong&gt;Info&lt;/strong&gt; - Label icon arrow  alert
    &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot; alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Light Alert --&gt;
&lt;div class=&quot;alert alert-light alert-dismissible alert-label-icon label-arrow fade show&quot; role=&quot;alert&quot;&gt;
    &lt;i class=&quot;ri-mail-line label-icon&quot;&gt;&lt;/i&gt;&lt;strong&gt;Light&lt;/strong&gt; - Label icon arrow  alert
    &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot; alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Dark Alert --&gt;
&lt;div class=&quot;alert alert-dark alert-dismissible alert-label-icon label-arrow fade show mb-0&quot; role=&quot;alert&quot;&gt;
    &lt;i class=&quot;ri-refresh-line label-icon&quot;&gt;&lt;/i&gt;&lt;strong&gt;Dark&lt;/strong&gt; - Label icon arrow  alert
    &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot; alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
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
                                                        <h4 class="card-title mb-0 flex-grow-1">Rounded Label Icon Alerts</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="10" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="10"/>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">
                                                        <p class="text-muted">Use the <code>alert-label-icon rounded-label</code> class to set an alert with a rounded label icon.</p>
                                                        <div class="live-preview">

                                                            <div class="row">
                                                                <div class="col-xl-6">
                                                                    <h6>Primary Alert</h6>
                                                                    <div class="alert alert-primary alert-dismissible alert-label-icon rounded-label fade show" role="alert">
                                                                        <i class="ri-user-smile-line label-icon"></i>
                                                                        <strong>Primary</strong> -
                                                    Rounded label alert
                                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>

                                                                    <h6>Secondary Alert</h6>
                                                                    <div class="alert alert-secondary alert-dismissible alert-label-icon rounded-label fade show" role="alert">
                                                                        <i class="ri-check-double-line label-icon"></i>
                                                                        <strong>Secondary</strong>
                                                    - Rounded
                                                    label alert
                                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>

                                                                    <h6>Success Alert</h6>
                                                                    <div class="alert alert-success alert-dismissible alert-label-icon rounded-label fade show" role="alert">
                                                                        <i class="ri-notification-off-line label-icon"></i>
                                                                        <strong>Success</strong>
                                                    - Rounded
                                                    label alert
                                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>

                                                                    <h6>Danger Alert</h6>
                                                                    <div class="alert alert-danger alert-dismissible alert-label-icon rounded-label fade show mb-xl-0" role="alert">
                                                                        <i class="ri-error-warning-line label-icon"></i>
                                                                        <strong>Danger</strong>
                                                    - Rounded
                                                    label alert
                                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>
                                                                </div>

                                                                <div class="col-xl-6">
                                                                    <h6>Warning Alert</h6>
                                                                    <div class="alert alert-warning alert-dismissible alert-label-icon rounded-label fade show" role="alert">
                                                                        <i class="ri-alert-line label-icon"></i>
                                                                        <strong>Warning</strong> - Rounded
                                                    label alert
                                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>

                                                                    <h6>Info Alert</h6>
                                                                    <div class="alert alert-info alert-dismissible alert-label-icon rounded-label fade show" role="alert">
                                                                        <i class="ri-airplay-line label-icon"></i>
                                                                        <strong>Info</strong> -
                                                    Rounded label
                                                    alert
                                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>

                                                                    <h6>Light Alert</h6>
                                                                    <div class="alert alert-light alert-dismissible alert-label-icon rounded-label fade show" role="alert">
                                                                        <i class="ri-mail-line label-icon"></i>
                                                                        <strong>Light</strong> -
                                                    Rounded label
                                                    alert
                                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>

                                                                    <h6>Dark Alert</h6>
                                                                    <div class="alert alert-dark alert-dismissible alert-label-icon rounded-label fade show mb-0" role="alert">
                                                                        <i class="ri-refresh-line label-icon"></i>
                                                                        <strong>Dark</strong> -
                                                    Rounded label
                                                    alert
                                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </div>

                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="max-height: 260px;">
                                                                <code>&lt;!-- Primary Alert --&gt;
&lt;div class=&quot;alert alert-primary alert-dismissible alert-label-icon rounded-label fade show&quot; role=&quot;alert&quot;&gt;
    &lt;i class=&quot;ri-user-smile-line label-icon&quot;&gt;&lt;/i&gt;&lt;strong&gt;Primary&lt;/strong&gt; - Rounded label alert
    &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot;alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Secondary Alert --&gt;
&lt;div class=&quot;alert alert-secondary alert-dismissible alert-label-icon rounded-label fade show&quot; role=&quot;alert&quot;&gt;
    &lt;i class=&quot;ri-check-double-line label-icon&quot;&gt;&lt;/i&gt;&lt;strong&gt;Secondary&lt;/strong&gt; - Rounded label alert
    &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot;alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Success Alert --&gt;
&lt;div class=&quot;alert alert-success alert-dismissible alert-label-icon rounded-label fade show&quot; role=&quot;alert&quot;&gt;
    &lt;i class=&quot;ri-notification-off-line label-icon&quot;&gt;&lt;/i&gt;&lt;strong&gt;Success&lt;/strong&gt; - Rounded label alert
    &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot;alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Danger Alert --&gt;
&lt;div class=&quot;alert alert-danger alert-dismissible alert-label-icon rounded-label fade show&quot; role=&quot;alert&quot;&gt;
    &lt;i class=&quot;ri-error-warning-line label-icon&quot;&gt;&lt;/i&gt;&lt;strong&gt;Danger&lt;/strong&gt; - Rounded label alert
    &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot;alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Warning Alert --&gt;
&lt;div class=&quot;alert alert-warning alert-dismissible alert-label-icon rounded-label fade show&quot; role=&quot;alert&quot;&gt;
    &lt;i class=&quot;ri-alert-line label-icon&quot;&gt;&lt;/i&gt;&lt;strong&gt;Warning&lt;/strong&gt; - Rounded label alert
    &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot;alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Info Alert --&gt;
&lt;div class=&quot;alert alert-info alert-dismissible alert-label-icon rounded-label fade show&quot; role=&quot;alert&quot;&gt;
    &lt;i class=&quot;ri-airplay-line label-icon&quot;&gt;&lt;/i&gt;&lt;strong&gt;Info&lt;/strong&gt; - Rounded label alert
    &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot;alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Light Alert --&gt;
&lt;div class=&quot;alert alert-light alert-dismissible alert-label-icon rounded-label fade show&quot; role=&quot;alert&quot;&gt;
    &lt;i class=&quot;ri-mail-line label-icon&quot;&gt;&lt;/i&gt;&lt;strong&gt;Light&lt;/strong&gt; - Rounded label alert
    &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot;alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Dark Alert --&gt;
&lt;div class=&quot;alert alert-dark alert-dismissible alert-label-icon rounded-label fade show&quot; role=&quot;alert&quot;&gt;
    &lt;i class=&quot;ri-refresh-line label-icon&quot;&gt;&lt;/i&gt;&lt;strong&gt;Dark&lt;/strong&gt; - Rounded label alert
    &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot;alert&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
&lt;/div&gt;
                                                                </code>
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
                                                        <h4 class="card-title mb-0 flex-grow-1">Solid Alerts</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="solid-alerts-code" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="solid-alerts-code"/>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">
                                                        <p class="text-muted">Use the <code>alert-solid</code> class to set an alert with solid style.</p>

                                                        <div class="live-preview">
                                                            <div class="row">
                                                                <div class="col-xl-6">
                                                                    <h6>Primary Solid Alert</h6>
                                                                    <div class="alert alert-primary alert-solid" role="alert">
                                                                        <strong>Hi!</strong> - Solid <b>primary alert</b> example
                                                                    </div>

                                                                    <h6>Secondary Solid Alert</h6>
                                                                    <div class="alert alert-secondary alert-solid" role="alert">
                                                                        <strong>How are you!</strong> - Solid <b>secondary alert</b> example
                                                                    </div>

                                                                    <h6>Success Solid Alert</h6>
                                                                    <div class="alert alert-success alert-solid" role="alert">
                                                                        <strong>Yey! Everything worked! </strong> - Solid <b>success alert</b> example
                                                                    </div>

                                                                    <h6>Danger Solid Alert</h6>
                                                                    <div class="alert alert-danger alert-solid mb-xl-0" role="alert">
                                                                        <strong>Something is very wrong!</strong> - Solid <b>danger alert</b> example
                                                                    </div>
                                                                </div>

                                                                <div class="col-xl-6">
                                                                    <h6>Warning Solid Alert</h6>
                                                                    <div class="alert alert-warning alert-solid" role="alert">
                                                                        <strong>Uh oh, something went wrong!</strong> - Solid <b>warning alert</b> example
                                                                    </div>

                                                                    <h6>Info Solid Alert</h6>
                                                                    <div class="alert alert-info alert-solid" role="alert">
                                                                        <strong>Don't forget' it !</strong> - Solid <b>info alert</b> example
                                                                    </div>


                                                                    <h6>Light Solid Alert</h6>
                                                                    <div class="alert alert-light alert-solid" role="alert">
                                                                        <strong>Mind Your Step!</strong> - Solid <b>secondary alert</b> example
                                                                    </div>

                                                                    <h6>Dark Solid Alert</h6>
                                                                    <div class="alert alert-dark alert-solid mb-0" role="alert">
                                                                        <strong>Did you know?</strong> - Solid <b>dark alert</b> example
                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="max-height: 260px;">
                                                                <code>&lt;!-- Primary Alert --&gt;
&lt;div class=&quot;alert alert-primary alert-solid&quot; role=&quot;alert&quot;&gt;
    &lt;strong&gt;Hi!&lt;/strong&gt; - Solid &lt;b&gt;primary alert&lt;/b&gt; example
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Secondary Alert --&gt;
&lt;div class=&quot;alert alert-secondary alert-solid&quot; role=&quot;alert&quot;&gt;
    &lt;strong&gt;How are you!&lt;/strong&gt; - Solid &lt;b&gt;secondary alert&lt;/b&gt; example
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Success Alert --&gt;
&lt;div class=&quot;alert alert-success alert-solid&quot; role=&quot;alert&quot;&gt;
    &lt;strong&gt;Yey! Everything worked!&lt;/strong&gt; - Solid &lt;b&gt;success alert&lt;/b&gt; example
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Danger Alert --&gt;
&lt;div class=&quot;alert alert-danger alert-solid&quot; role=&quot;alert&quot;&gt;
    &lt;strong&gt;Something is very wrong!&lt;/strong&gt; - Solid &lt;b&gt;danger alert&lt;/b&gt; example
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Warning Alert --&gt;
&lt;div class=&quot;alert alert-warning alert-solid&quot; role=&quot;alert&quot;&gt;
    &lt;strong&gt;Uh oh, something went w rong!&lt;/strong&gt; - Solid &lt;b&gt;warning alert&lt;/b&gt; example
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Info Alert --&gt;
&lt;div class=&quot;alert alert-info alert-solid&quot; role=&quot;alert&quot;&gt;
    &lt;strong&gt;Don't forget' it !&lt;/strong&gt; - Solid &lt;b&gt;info alert&lt;/b&gt; example
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Light Alert --&gt;
&lt;div class=&quot;alert alert-light alert-solid&quot; role=&quot;alert&quot;&gt;
    &lt;strong&gt;Mind Your Step!&lt;/strong&gt; - Solid &lt;b&gt;light alert&lt;/b&gt; example
&lt;/div&gt;
                                                                </code>
                                                                <code>&lt;!-- Dark Alert --&gt;
&lt;div class=&quot;alert alert-dark alert-solid mb-0&quot; role=&quot;alert&quot;&gt;
    &lt;strong&gt;Did you know?&lt;/strong&gt; - Solid &lt;b&gt;dark alert&lt;/b&gt; example
&lt;/div&gt;
                                                                </code>
                                                            </pre>
                                                        </div>
                                                    </div>                                                    <!-- end card-body -->
                                                </div>                                                <!-- end card -->
                                            </div>
                                        </div>


                                    </div>                                    <!-- container-fluid -->


                                </div>
                            </div>
                        </div>
                        <xsl:call-template name="igrp-footer"/>
                    </div>
                </div>


                <xsl:call-template name="igrp-page-helpers"/>

                <!-- prismjs plugin -->
                <script src="{$path}/libs/prismjs/prism.js"></script>

                <script src="../xsl/IGRP-base-ui-alert.JS"></script>


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
