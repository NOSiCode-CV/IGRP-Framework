<!DOCTYPE xsl:stylesheet [
    <!ENTITY rsquo "entity-value">
]>
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
                                            <div class="col-xxl-4 col-xl-6">
                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">Default List</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="basiclist-showcode" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="basiclist-showcode"></input>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->
                                                    <div class="card-body">
                                                        <p class="text-muted">Use <code>list-group</code> class in an unordered list and <code>list-group-item</code> class to create a default list group.</p>
                                                        <div class="live-preview">
                                                            <ul class="list-group">
                                                                <li class="list-group-item">
                                                                    <i class="ri-bill-line align-middle me-2"></i> Send the billing agreement</li>
                                                                <li class="list-group-item">
                                                                    <i class="ri-file-copy-2-line align-middle me-2"></i>Send over all the documentation.</li>
                                                                <li class="list-group-item">
                                                                    <i class="ri-question-answer-line align-middle me-2"></i>Meeting with daron to review the intake form</li>
                                                                <li class="list-group-item">
                                                                    <i class="ri-secure-payment-line align-middle me-2"></i>Check uikings theme and give customer support</li>
                                                            </ul>
                                                        </div>
                                                        <div class="d-none code-view">
                                                            <pre class="language-markup">
                                                                <code>&lt;ul class=&quot;list-group&quot;&gt;
    &lt;li class=&quot;list-group-item&quot;&gt;&lt;i class=&quot;ri-bill-line align-middle me-2&quot;&gt;&lt;/i&gt; Send the billing agreement&lt;/li&gt;
    &lt;li class=&quot;list-group-item&quot;&gt;&lt;i class=&quot;ri-file-copy-2-line align-middle me-2&quot;&gt;&lt;/i&gt;Send over all the documentation.&lt;/li&gt;
    &lt;li class=&quot;list-group-item&quot;&gt;&lt;i class=&quot;ri-question-answer-line align-middle me-2&quot;&gt;&lt;/i&gt;Meeting with daron to review the intake form&lt;/li&gt;
    &lt;li class=&quot;list-group-item&quot;&gt;&lt;i class=&quot;ri-secure-payment-line align-middle me-2&quot;&gt;&lt;/i&gt;Check uikings theme and give customer support&lt;/li&gt;
&lt;/ul&gt;</code>
                                                            </pre>
                                                        </div>
                                                    </div>                                                    <!-- end card-body -->
                                                </div>                                                <!-- end card -->
                                            </div>
                                            <!-- end col -->

                                            <div class="col-xxl-4 col-xl-6">
                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">Active Item</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="listactive-showcode" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="listactive-showcode"></input>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->
                                                    <div class="card-body">
                                                        <p class="text-muted">Use <code>active</code> class to <code>list-group-item</code> to indicate the current active selection.</p>
                                                        <div class="live-preview">
                                                            <ul class="list-group">
                                                                <li class="list-group-item active" aria-current="true">Send the billing agreement</li>
                                                                <li class="list-group-item">Send over all the documentation.</li>
                                                                <li class="list-group-item">Meeting with daron to review the intake form</li>
                                                                <li class="list-group-item">Check uikings theme and give customer support</li>
                                                                <li class="list-group-item">Start making a presentation</li>
                                                            </ul>
                                                        </div>
                                                        <div class="d-none code-view">
                                                            <pre class="language-markup">
                                                                <code>&lt;ul class=&quot;list-group&quot;&gt;
    &lt;li class=&quot;list-group-item active&quot; aria-current=&quot;true&quot;&gt;Send the billing agreement&lt;/li&gt;
    &lt;li class=&quot;list-group-item&quot;&gt;Send over all the documentation.&lt;/li&gt;
    &lt;li class=&quot;list-group-item&quot;&gt;Meeting with daron to review the intake form&lt;/li&gt;
    &lt;li class=&quot;list-group-item&quot;&gt;Check uikings theme and give customer support&lt;/li&gt;
    &lt;li class=&quot;list-group-item&quot;&gt;Start making a presentation&lt;/li&gt;
&lt;/ul&gt;</code>
                                                            </pre>
                                                        </div>
                                                    </div>                                                    <!-- end card-body -->
                                                </div>                                                <!-- end card -->
                                            </div>
                                            <!-- end col -->

                                            <div class="col-xxl-4 col-xl-6">
                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">Disabled Items</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="listdisabled-showcode" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="listdisabled-showcode"></input>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->
                                                    <div class="card-body">
                                                        <p class="text-muted">Use <code>disabled</code> class to <code>list-group-item</code> to make it <em>appear</em> disabled.</p>
                                                        <div class="live-preview">
                                                            <ul class="list-group">
                                                                <li class="list-group-item disabled" aria-disabled="true">
                                                                    <div class="d-flex align-items-center">
                                                                        <div class="flex-shrink-0">
                                                                            <img src="{$themePath}/assets/images/users/avatar-1.jpg" alt="" class="avatar-xs rounded-circle"></img>
                                                                        </div>
                                                                        <div class="flex-grow-1 ms-2">
                                                        James Ballard
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="list-group-item">
                                                                    <div class="d-flex align-items-center">
                                                                        <div class="flex-shrink-0">
                                                                            <img src="{$themePath}/assets/images/users/avatar-2.jpg" alt="" class="avatar-xs rounded-circle"></img>
                                                                        </div>
                                                                        <div class="flex-grow-1 ms-2">
                                                        Nancy Martino
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="list-group-item">
                                                                    <div class="d-flex align-items-center">
                                                                        <div class="flex-shrink-0">
                                                                            <img src="{$themePath}/assets/images/users/avatar-3.jpg" alt="" class="avatar-xs rounded-circle"></img>
                                                                        </div>
                                                                        <div class="flex-grow-1 ms-2">
                                                        Henry Baird
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="list-group-item">
                                                                    <div class="d-flex align-items-center">
                                                                        <div class="flex-shrink-0">
                                                                            <img src="{$themePath}/assets/images/users/avatar-3.jpg" alt="" class="avatar-xs rounded-circle"></img>
                                                                        </div>
                                                                        <div class="flex-grow-1 ms-2">
                                                        Erica Kernan
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="height: 215px;">
                                                                <code>&lt;ul class=&quot;list-group&quot;&gt;
    &lt;li class=&quot;list-group-item disabled&quot; aria-disabled=&quot;true&quot;&gt;
        &lt;div class=&quot;d-flex align-items-center&quot;&gt;
            &lt;div class=&quot;flex-shrink-0&quot;&gt;
                &lt;img src=&quot;{$themePath}/assets/images/users/avatar-1.jpg&quot; alt=&quot;&quot; class=&quot;avatar-xs rounded-circle&quot;&gt;
            &lt;/div&gt;
            &lt;div class=&quot;flex-grow-1 ms-2&quot;&gt;
                James Ballard
            &lt;/div&gt;
        &lt;/div&gt;
    &lt;/li&gt;
    &lt;li class=&quot;list-group-item&quot;&gt;
        &lt;div class=&quot;d-flex align-items-center&quot;&gt;
            &lt;div class=&quot;flex-shrink-0&quot;&gt;
                &lt;img src=&quot;{$themePath}/assets/images/users/avatar-2.jpg&quot; alt=&quot;&quot; class=&quot;avatar-xs rounded-circle&quot;&gt;
            &lt;/div&gt;
            &lt;div class=&quot;flex-grow-1 ms-2&quot;&gt;
                Nancy Martino
            &lt;/div&gt;
        &lt;/div&gt;
    &lt;/li&gt;
    &lt;li class=&quot;list-group-item&quot;&gt;
        &lt;div class=&quot;d-flex align-items-center&quot;&gt;
            &lt;div class=&quot;flex-shrink-0&quot;&gt;
                &lt;img src=&quot;{$themePath}/assets/images/users/avatar-3.jpg&quot; alt=&quot;&quot; class=&quot;avatar-xs rounded-circle&quot;&gt;
            &lt;/div&gt;
            &lt;div class=&quot;flex-grow-1 ms-2&quot;&gt;
                Henry Baird
            &lt;/div&gt;
        &lt;/div&gt;
    &lt;/li&gt;
    &lt;li class=&quot;list-group-item&quot;&gt;
        &lt;div class=&quot;d-flex align-items-center&quot;&gt;
            &lt;div class=&quot;flex-shrink-0&quot;&gt;
                &lt;img src=&quot;{$themePath}/assets/images/users/avatar-3.jpg&quot; alt=&quot;&quot; class=&quot;avatar-xs rounded-circle&quot;&gt;
            &lt;/div&gt;
            &lt;div class=&quot;flex-grow-1 ms-2&quot;&gt;
                Erica Kernan
            &lt;/div&gt;
        &lt;/div&gt;
    &lt;/li&gt;
&lt;/ul&gt;</code>
                                                            </pre>
                                                        </div>
                                                    </div>                                                    <!-- end card-body -->
                                                </div>                                                <!-- end card -->
                                            </div>
                                            <!-- end col -->

                                            <div class="col-xxl-4 col-xl-6">
                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">List with Link</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="listlink-showcode" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="listlink-showcode"></input>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->
                                                    <div class="card-body">
                                                        <p class="text-muted">Use <code>&lt;a&gt;</code> tag to create actionable list group items with hover, disabled, and active states by adding list-group-item-action.</p>
                                                        <div class="live-preview">
                                                            <div class="list-group list-group-fill-success">
                                                                <a href="#" class="list-group-item list-group-item-action active">
                                                                    <i class="ri-download-2-fill align-middle me-2"></i>Category Download</a>
                                                                <a href="#" class="list-group-item list-group-item-action">
                                                                    <i class="ri-shield-check-line align-middle me-2"></i>Security Access</a>
                                                                <a href="#" class="list-group-item list-group-item-action">
                                                                    <i class="ri-database-2-line align-middle me-2"></i>Storage folder</a>
                                                                <a href="#" class="list-group-item list-group-item-action">
                                                                    <i class="ri-notification-3-line align-middle me-2"></i>Push Notification</a>
                                                                <a href="#" class="list-group-item list-group-item-action disabled" tabindex="-1">
                                                                    <i class="ri-moon-fill align-middle me-2"></i>Dark Mode</a>
                                                            </div>
                                                        </div>

                                                        <div class="d-none code-view">
                                                            <pre class="language-markup">
                                                                <code>&lt;div class=&quot;list-group list-group-fill-success&quot;&gt;
    &lt;a href=&quot;#&quot; class=&quot;list-group-item list-group-item-action active&quot;&gt;&lt;i class=&quot;ri-download-2-fill align-middle me-2&quot;&gt;&lt;/i&gt;Category Download&lt;/a&gt;
    &lt;a href=&quot;#&quot; class=&quot;list-group-item list-group-item-action&quot;&gt;&lt;i class=&quot;ri-shield-check-line align-middle me-2&quot;&gt;&lt;/i&gt;Security Access&lt;/a&gt;
    &lt;a href=&quot;#&quot; class=&quot;list-group-item list-group-item-action&quot;&gt;&lt;i class=&quot;ri-database-2-line align-middle me-2&quot;&gt;&lt;/i&gt;Storage folder&lt;/a&gt;
    &lt;a href=&quot;#&quot; class=&quot;list-group-item list-group-item-action&quot;&gt;&lt;i class=&quot;ri-notification-3-line align-middle me-2&quot;&gt;&lt;/i&gt;Push Notification&lt;/a&gt;
    &lt;a href=&quot;#&quot; class=&quot;list-group-item list-group-item-action disabled&quot; tabindex=&quot;-1&quot; aria-disabled=&quot;true&quot;&gt;&lt;i class=&quot;ri-moon-fill align-middle me-2&quot;&gt;&lt;/i&gt;Dark Mode&lt;/a&gt;
&lt;/div&gt;</code>
                                                            </pre>
                                                        </div>
                                                    </div>                                                    <!-- end card-body -->
                                                </div>                                                <!-- end card -->
                                            </div>
                                            <!-- end col -->

                                            <div class="col-xxl-4 col-xl-6">
                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">List with Button</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="listbutton-showcode" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="listbutton-showcode"></input>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->
                                                    <div class="card-body">
                                                        <p class="text-muted">Use <code>&lt;button&gt;</code> tag to create actionable list group items with hover, disabled, and active states by adding list-group-item-action.</p>
                                                        <div class="live-preview">
                                                            <div class="list-group">
                                                                <button type="button" class="list-group-item list-group-item-action active" aria-current="true">
                                                                    <i class="ri-reply-fill align-middle me-2"></i>Reply</button>
                                                                <button type="button" class="list-group-item list-group-item-action">
                                                                    <i class="ri-share-forward-fill align-middle me-2"></i>Forward Message</button>
                                                                <button type="button" class="list-group-item list-group-item-action">
                                                                    <i class="ri-equalizer-line align-middle me-2"></i>Filter Message</button>
                                                                <button type="button" class="list-group-item list-group-item-action">
                                                                    <i class="ri-delete-bin-5-line align-middle me-2"></i>Delete Message</button>
                                                                <button type="button" class="list-group-item list-group-item-action" disabled="">
                                                                    <i class="ri-forbid-line align-middle me-2"></i>Block "Mark Spencer</button>
                                                            </div>
                                                        </div>
                                                        <div class="d-none code-view">
                                                            <pre class="language-markup">
                                                                <code>&lt;div class=&quot;list-group&quot;&gt;
    &lt;button type=&quot;button&quot; class=&quot;list-group-item list-group-item-action active&quot; aria-current=&quot;true&quot;&gt;&lt;i class=&quot;ri-reply-fill align-middle me-2&quot;&gt;&lt;/i&gt;Reply&lt;/button&gt;
    &lt;button type=&quot;button&quot; class=&quot;list-group-item list-group-item-action&quot;&gt;&lt;i class=&quot;ri-share-forward-fill align-middle me-2&quot;&gt;&lt;/i&gt;Forward Message&lt;/button&gt;
    &lt;button type=&quot;button&quot; class=&quot;list-group-item list-group-item-action&quot;&gt;&lt;i class=&quot;ri-equalizer-line align-middle me-2&quot;&gt;&lt;/i&gt;Filter Message&lt;/button&gt;
    &lt;button type=&quot;button&quot; class=&quot;list-group-item list-group-item-action&quot;&gt;&lt;i class=&quot;ri-delete-bin-5-line align-middle me-2&quot;&gt;&lt;/i&gt;Delete Message&lt;/button&gt;
    &lt;button type=&quot;button&quot; class=&quot;list-group-item list-group-item-action&quot; disabled&gt;&lt;i class=&quot;ri-forbid-line align-middle me-2&quot;&gt;&lt;/i&gt;Block &quot;Mark Spencer&lt;/button&gt;
&lt;/div&gt;</code>
                                                            </pre>
                                                        </div>
                                                    </div>                                                    <!-- end card-body -->
                                                </div>                                                <!-- end card -->
                                            </div>
                                            <!-- end col -->

                                            <div class="col-xxl-4 col-xl-6">
                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">Flush List</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="flushlist-showcode" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="flushlist-showcode"></input>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->
                                                    <div class="card-body">
                                                        <p class="text-muted">Use <code>list-group-flush</code> class to remove some borders and rounded corners to render list group items.</p>
                                                        <div class="live-preview">
                                                            <ul class="list-group list-group-flush">
                                                                <li class="list-group-item">Send the billing agreement</li>
                                                                <li class="list-group-item">Send over all the documentation.</li>
                                                                <li class="list-group-item">Meeting with daron to review the intake form</li>
                                                                <li class="list-group-item">Check uikings theme and give customer support</li>
                                                                <li class="list-group-item">Start making a presentation</li>
                                                            </ul>
                                                        </div>
                                                        <div class="d-none code-view">
                                                            <pre class="language-markup">
                                                                <code>&lt;ul class=&quot;list-group list-group-flush&quot;&gt;
    &lt;li class=&quot;list-group-item&quot;&gt;Send the billing agreement&lt;/li&gt;
    &lt;li class=&quot;list-group-item&quot;&gt;Send over all the documentation.&lt;/li&gt;
    &lt;li class=&quot;list-group-item&quot;&gt;Meeting with daron to review the intake form&lt;/li&gt;
    &lt;li class=&quot;list-group-item&quot;&gt;Check uikings theme and give customer support&lt;/li&gt;
    &lt;li class=&quot;list-group-item&quot;&gt;Start making a presentation&lt;/li&gt;
&lt;/ul&gt;</code>
                                                            </pre>
                                                        </div>
                                                    </div>                                                    <!-- end card-body -->
                                                </div>                                                <!-- end card -->
                                            </div>
                                            <!-- end col -->
                                        </div>
                                        <!-- end row -->

                                        <div class="row">
                                            <div class="col-xl-12">
                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">Horizontal List</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="horilist-showcode" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="horilist-showcode"></input>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->
                                                    <div class="card-body">
                                                        <p class="text-muted">Use <code>list-group-horizontal</code> class to change the layout of list group items from vertical to horizontal across all breakpoints.</p>
                                                        <div class="live-preview">
                                                            <ul class="list-group list-group-horizontal-md mb-3">
                                                                <li class="list-group-item">Inbox</li>
                                                                <li class="list-group-item">Work</li>
                                                                <li class="list-group-item">Shopping</li>
                                                            </ul>
                                                            <ul class="list-group list-group-horizontal-md justify-content-center mb-3">
                                                                <li class="list-group-item">Inbox</li>
                                                                <li class="list-group-item">Work</li>
                                                                <li class="list-group-item">Shopping</li>
                                                            </ul>
                                                            <ul class="list-group list-group-horizontal-md justify-content-end">
                                                                <li class="list-group-item">Inbox</li>
                                                                <li class="list-group-item">Work</li>
                                                                <li class="list-group-item">Shopping</li>
                                                            </ul>
                                                        </div>
                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="height: 275px;">
                                                                <code>&lt;!-- Start Alignment --&gt;
&lt;ul class=&quot;list-group list-group-horizontal-md&quot;&gt;
    &lt;li class=&quot;list-group-item&quot;&gt;Inbox&lt;/li&gt;
    &lt;li class=&quot;list-group-item&quot;&gt;Work&lt;/li&gt;
    &lt;li class=&quot;list-group-item&quot;&gt;Shopping&lt;/li&gt;
&lt;/ul&gt;</code>

                                                                <code>&lt;!-- Center Alignment --&gt;
&lt;ul class=&quot;list-group list-group-horizontal-md justify-content-center&quot;&gt;
    &lt;li class=&quot;list-group-item&quot;&gt;Inbox&lt;/li&gt;
    &lt;li class=&quot;list-group-item&quot;&gt;Work&lt;/li&gt;
    &lt;li class=&quot;list-group-item&quot;&gt;Shopping&lt;/li&gt;
&lt;/ul&gt;</code>

                                                                <code>&lt;!-- Right Alignment --&gt;
&lt;ul class=&quot;list-group list-group-horizontal-md justify-content-end&quot;&gt;
    &lt;li class=&quot;list-group-item&quot;&gt;Inbox&lt;/li&gt;
    &lt;li class=&quot;list-group-item&quot;&gt;Work&lt;/li&gt;
    &lt;li class=&quot;list-group-item&quot;&gt;Shopping&lt;/li&gt;
&lt;/ul&gt;</code>
                                                            </pre>
                                                        </div>
                                                    </div>                                                    <!-- end card-body -->
                                                </div>                                                <!-- end card -->
                                            </div>
                                            <!-- end col -->
                                        </div>
                                        <!-- end row -->

                                        <div class="row">
                                            <div class="col-xxl-4 col-xl-6">
                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">Contextual Classes</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="contextuallist-showcode" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="contextuallist-showcode"></input>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->
                                                    <div class="card-body">
                                                        <p class="text-muted">Use contextual classes to style list items with a stateful background and color.</p>
                                                        <div class="live-preview">
                                                            <ul class="list-group">
                                                                <li class="list-group-item">Dapibus ac facilisis in</li>
                                                                <li class="list-group-item list-group-item-primary">A simple primary list group item</li>
                                                                <li class="list-group-item list-group-item-secondary">A simple secondary list group item</li>
                                                                <li class="list-group-item list-group-item-success">A simple success list group item</li>
                                                                <li class="list-group-item list-group-item-danger">A simple danger list group item</li>
                                                                <li class="list-group-item list-group-item-warning">A simple warning list group item</li>
                                                                <li class="list-group-item list-group-item-info">A simple info list group item</li>
                                                                <li class="list-group-item list-group-item-light">A simple light list group item</li>
                                                                <li class="list-group-item list-group-item-dark">A simple dark list group item</li>
                                                            </ul>
                                                        </div>
                                                        <div class="d-none code-view">
                                                            <pre class="language-markup">
                                                                <code>&lt;ul class=&quot;list-group&quot;&gt;
    &lt;li class=&quot;list-group-item&quot;&gt;Dapibus ac facilisis in&lt;/li&gt;
    &lt;li class=&quot;list-group-item list-group-item-primary&quot;&gt;A simple primary list group item&lt;/li&gt;
    &lt;li class=&quot;list-group-item list-group-item-secondary&quot;&gt;A simple secondary list group item&lt;/li&gt;
    &lt;li class=&quot;list-group-item list-group-item-success&quot;&gt;A simple success list group item&lt;/li&gt;
    &lt;li class=&quot;list-group-item list-group-item-danger&quot;&gt;A simple danger list group item&lt;/li&gt;
    &lt;li class=&quot;list-group-item list-group-item-warning&quot;&gt;A simple warning list group item&lt;/li&gt;
    &lt;li class=&quot;list-group-item list-group-item-info&quot;&gt;A simple info list group item&lt;/li&gt;
    &lt;li class=&quot;list-group-item list-group-item-light&quot;&gt;A simple light list group item&lt;/li&gt;
    &lt;li class=&quot;list-group-item list-group-item-dark&quot;&gt;A simple dark list group item&lt;/li&gt;
&lt;/ul&gt;</code>
                                                            </pre>
                                                        </div>
                                                    </div>                                                    <!-- end card-body -->
                                                </div>                                                <!-- end card -->
                                            </div>
                                            <!-- end col -->

                                            <div class="col-xxl-4 col-xl-6">
                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">Contextual Classes with Link</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="contextuallist-withlink-showcode" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="contextuallist-withlink-showcode"></input>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->
                                                    <div class="card-body">
                                                        <p class="text-muted">Contextual classes also work with <code>.list-group-item-action</code>. Note the addition of the hover styles here not present in the previous example.</p>
                                                        <div class="live-preview">
                                                            <div class="list-group">
                                                                <a href="#" class="list-group-item list-group-item-action">A simple default list group item</a>
                                                                <a href="#" class="list-group-item list-group-item-action list-group-item-primary">A simple primary list group item</a>
                                                                <a href="#" class="list-group-item list-group-item-action list-group-item-secondary">A simple secondary list group item</a>
                                                                <a href="#" class="list-group-item list-group-item-action list-group-item-success">A simple success list group item</a>
                                                                <a href="#" class="list-group-item list-group-item-action list-group-item-danger">A simple danger list group item</a>
                                                                <a href="#" class="list-group-item list-group-item-action list-group-item-warning">A simple warning list group item</a>
                                                                <a href="#" class="list-group-item list-group-item-action list-group-item-info">A simple info list group item</a>
                                                                <a href="#" class="list-group-item list-group-item-action list-group-item-light">A simple light list group item</a>
                                                                <a href="#" class="list-group-item list-group-item-action list-group-item-dark">A simple dark list group item</a>
                                                            </div>
                                                        </div>
                                                        <div class="d-none code-view">
                                                            <pre class="language-markup">
                                                                <code>&lt;div class=&quot;list-group&quot;&gt;
    &lt;a href=&quot;#&quot; class=&quot;list-group-item list-group-item-action&quot;&gt;A simple default list group item&lt;/a&gt;
    &lt;a href=&quot;#&quot; class=&quot;list-group-item list-group-item-action list-group-item-primary&quot;&gt;A simple primary list group item&lt;/a&gt;
    &lt;a href=&quot;#&quot; class=&quot;list-group-item list-group-item-action list-group-item-secondary&quot;&gt;A simple secondary list group item&lt;/a&gt;
    &lt;a href=&quot;#&quot; class=&quot;list-group-item list-group-item-action list-group-item-success&quot;&gt;A simple success list group item&lt;/a&gt;
    &lt;a href=&quot;#&quot; class=&quot;list-group-item list-group-item-action list-group-item-danger&quot;&gt;A simple danger list group item&lt;/a&gt;
    &lt;a href=&quot;#&quot; class=&quot;list-group-item list-group-item-action list-group-item-warning&quot;&gt;A simple warning list group item&lt;/a&gt;
    &lt;a href=&quot;#&quot; class=&quot;list-group-item list-group-item-action list-group-item-info&quot;&gt;A simple info list group item&lt;/a&gt;
    &lt;a href=&quot;#&quot; class=&quot;list-group-item list-group-item-action list-group-item-light&quot;&gt;A simple light list group item&lt;/a&gt;
    &lt;a href=&quot;#&quot; class=&quot;list-group-item list-group-item-action list-group-item-dark&quot;&gt;A simple dark list group item&lt;/a&gt;
&lt;/div&gt;</code>
                                                            </pre>
                                                        </div>
                                                    </div>                                                    <!-- end card-body -->
                                                </div>                                                <!-- end card -->
                                            </div>
                                            <!-- end col -->

                                            <div class="col-xxl-4 col-xl-6">
                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">Colored Lists</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="colored-list-showcode" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="colored-list-showcode"></input>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->
                                                    <div class="card-body">
                                                        <p class="text-muted">Use <code>list-group-fill-</code> with modifier class to style list items with a stateful background and color.</p>
                                                        <div class="live-preview">
                                                            <ul class="list-group">
                                                                <li class="list-group-item">Dapibus ac facilisis in</li>
                                                                <li class="list-group-item list-group-fill-primary">A simple primary list group item</li>
                                                                <li class="list-group-item list-group-fill-secondary">A simple secondary list group item</li>
                                                                <li class="list-group-item list-group-fill-success">A simple success list group item</li>
                                                                <li class="list-group-item list-group-fill-danger">A simple danger list group item</li>
                                                                <li class="list-group-item list-group-fill-warning">A simple warning list group item</li>
                                                                <li class="list-group-item list-group-fill-info">A simple info list group item</li>
                                                                <li class="list-group-item list-group-fill-light">A simple light list group item</li>
                                                                <li class="list-group-item list-group-fill-dark">A simple dark list group item</li>
                                                            </ul>
                                                        </div>
                                                        <div class="d-none code-view">
                                                            <pre class="language-markup">
                                                                <code>&lt;ul class=&quot;list-group&quot;&gt;
    &lt;li class=&quot;list-group-item&quot;&gt;Dapibus ac facilisis in&lt;/li&gt;
    &lt;li class=&quot;list-group-item list-group-fill-primary&quot;&gt;A simple primary list group item&lt;/li&gt;
    &lt;li class=&quot;list-group-item list-group-fill-secondary&quot;&gt;A simple secondary list group item&lt;/li&gt;
    &lt;li class=&quot;list-group-item list-group-fill-success&quot;&gt;A simple success list group item&lt;/li&gt;
    &lt;li class=&quot;list-group-item list-group-fill-danger&quot;&gt;A simple danger list group item&lt;/li&gt;
    &lt;li class=&quot;list-group-item list-group-fill-warning&quot;&gt;A simple warning list group item&lt;/li&gt;
    &lt;li class=&quot;list-group-item list-group-fill-info&quot;&gt;A simple info list group item&lt;/li&gt;
    &lt;li class=&quot;list-group-item list-group-fill-light&quot;&gt;A simple light list group item&lt;/li&gt;
    &lt;li class=&quot;list-group-item list-group-fill-dark&quot;&gt;A simple dark list group item&lt;/li&gt;
&lt;/ul&gt;</code>
                                                            </pre>
                                                        </div>
                                                    </div>                                                    <!-- end card-body -->
                                                </div>                                                <!-- end card -->
                                            </div>
                                            <!-- end col -->
                                        </div>
                                        <!-- end row -->

                                        <div class="row">
                                            <div class="col-xl-12">
                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">Custom Content</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="customcontent-showcode" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="customcontent-showcode"></input>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">
                                                        <p class="text-muted">Add nearly any HTML within, even for linked list groups like the one below, with the help of <a href="https://getbootstrap.com/docs/5.1/utilities/flex/">flexbox utilities</a>.
                                                        </p>
                                                        <div class="live-preview">
                                                            <div class="list-group">
                                                                <a href="javascript:void(0);" class="list-group-item list-group-item-action active">
                                                                    <div class="float-end">
                                                    Pending
                                                                    </div>
                                                                    <div class="d-flex mb-2 align-items-center">
                                                                        <div class="flex-shrink-0">
                                                                            <img src="{$themePath}/assets/images/users/avatar-1.jpg" alt="" class="avatar-sm rounded-circle" />
                                                                        </div>
                                                                        <div class="flex-grow-1 ms-3">
                                                                            <h5 class="list-title fs-15 mb-1">Charlie Pritchard</h5>
                                                                            <p class="list-text mb-0 fs-12">12 min Ago</p>
                                                                        </div>
                                                                    </div>
                                                                    <p class="list-text mb-0">They all have something to say beyond the words on the page. They can come across as casual or neutral, exotic or graphic. That's why it's important to think about your message, then choose a font that fits. Cosby sweater eu banh mi, qui irure terry richardson ex squid.</p>
                                                                </a>
                                                                <a href="javascript:void(0);" class="list-group-item list-group-item-action">
                                                                    <div class="float-end">
                                                    Pending
                                                                    </div>
                                                                    <div class="d-flex mb-2 align-items-center">
                                                                        <div class="flex-shrink-0">
                                                                            <img src="{$themePath}/assets/images/users/avatar-2.jpg" alt="" class="avatar-sm rounded-circle" />
                                                                        </div>
                                                                        <div class="flex-grow-1 ms-3">
                                                                            <h5 class="list-title fs-15 mb-1">Dominic Charlton</h5>
                                                                            <p class="list-text mb-0 fs-12">12 min Ago</p>
                                                                        </div>
                                                                    </div>
                                                                    <p class="list-text mb-0">Trust fund seitan letterpress, keytar raw denim keffiyeh etsy art party before they sold out master cleanse gluten-free squid scenester freegan cosby sweater. Fanny pack portland seitan DIY, art party locavore wolf cliche high life echo park Austin.</p>
                                                                </a>
                                                                <a href="javascript:void(0);" class="list-group-item list-group-item-action">
                                                                    <div class="float-end">
                                                    Rejected
                                                                    </div>
                                                                    <div class="d-flex mb-2 align-items-center">
                                                                        <div class="flex-shrink-0">
                                                                            <img src="{$themePath}/assets/images/users/avatar-3.jpg" alt="" class="avatar-sm rounded-circle" />
                                                                        </div>
                                                                        <div class="flex-grow-1 ms-3">
                                                                            <h5 class="list-title fs-15 mb-1">Declan Long</h5>
                                                                            <p class="list-text mb-0 fs-12">12 min Ago</p>
                                                                        </div>
                                                                    </div>
                                                                    <p class="list-text mb-0">Big July earthquakes confound zany experimental vow. My girl wove six dozen plaid jackets before she quit. Six big devils from Japan quickly forgot how to waltz. try again until it looks right, and each assumenda labore aes Homo nostrud organic, assumenda labore aesthetic magna elements, buttons, everything.</p>
                                                                </a>
                                                                <a href="javascript:void(0);" class="list-group-item list-group-item-action">
                                                                    <div class="float-end">
                                                    Successful
                                                                    </div>
                                                                    <div class="d-flex mb-2 align-items-center">
                                                                        <div class="flex-shrink-0">
                                                                            <img src="{$themePath}/assets/images/users/avatar-4.jpg" alt="" class="avatar-sm rounded-circle" />
                                                                        </div>
                                                                        <div class="flex-grow-1 ms-3">
                                                                            <h5 class="list-title fs-15 mb-1">Angela Bernier</h5>
                                                                            <p class="list-text mb-0 fs-12">5 days Ago</p>
                                                                        </div>
                                                                    </div>
                                                                    <p class="list-text mb-0">Just like in the image where we talked about using multiple fonts, you can see that the background in this graphic design is blurred. Whenever you put text on top of an image, it’s important that your viewers can understand the text, and sometimes that means applying a gaussian readable.</p>
                                                                </a>
                                                            </div>
                                                        </div>
                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="height: 300px;">
                                                                <code>&lt;div class=&quot;list-group&quot;&gt;
    &lt;a href=&quot;javascript:void(0);&quot; class=&quot;list-group-item list-group-item-action active&quot;&gt;
        &lt;div class=&quot;float-end&quot;&gt;
            Pending 
        &lt;/div&gt;
        &lt;div class=&quot;d-flex mb-2 align-items-center&quot;&gt;
            &lt;div class=&quot;flex-shrink-0&quot;&gt;
                &lt;img src=&quot;{$themePath}/assets/images/users/avatar-1.jpg&quot; alt=&quot;&quot; class=&quot;avatar-sm rounded-circle&quot; /&gt;
            &lt;/div&gt;
            &lt;div class=&quot;flex-grow-1 ms-3&quot;&gt;
                &lt;h5 class=&quot;list-title fs-15 mb-1&quot;&gt;Charlie Pritchard&lt;/h5&gt;
                &lt;p class=&quot;list-text mb-0 fs-12&quot;&gt;12 min Ago&lt;/p&gt;
            &lt;/div&gt;
        &lt;/div&gt;
        &lt;p class=&quot;list-text mb-0&quot;&gt;They all have something to say beyond the words on the page. They can come across as casual or neutral, exotic or graphic. That's why it's important to think about your message, then choose a font that fits. Cosby sweater eu banh mi, qui irure terry richardson ex squid.&lt;/p&gt;
    &lt;/a&gt;</code>
                                                                <code>&lt;a href=&quot;javascript:void(0);&quot; class=&quot;list-group-item list-group-item-action&quot;&gt;
        &lt;div class=&quot;float-end&quot;&gt;
            Pending 
        &lt;/div&gt;
        &lt;div class=&quot;d-flex mb-2 align-items-center&quot;&gt;
            &lt;div class=&quot;flex-shrink-0&quot;&gt;
                &lt;img src=&quot;{$themePath}/assets/images/users/avatar-2.jpg&quot; alt=&quot;&quot; class=&quot;avatar-sm rounded-circle&quot; /&gt;
            &lt;/div&gt;
            &lt;div class=&quot;flex-grow-1 ms-3&quot;&gt;
                &lt;h5 class=&quot;list-title fs-15 mb-1&quot;&gt;Dominic Charlton&lt;/h5&gt;
                &lt;p class=&quot;list-text mb-0 fs-12&quot;&gt;12 min Ago&lt;/p&gt;
            &lt;/div&gt;
        &lt;/div&gt;
        &lt;p class=&quot;list-text mb-0&quot;&gt;Trust fund seitan letterpress, keytar raw denim keffiyeh etsy art party before they sold out master cleanse gluten-free squid scenester freegan cosby sweater. Fanny pack portland seitan DIY, art party locavore wolf cliche high life echo park Austin.&lt;/p&gt;
    &lt;/a&gt;</code>
                                                                <code>&lt;a href=&quot;javascript:void(0);&quot; class=&quot;list-group-item list-group-item-action&quot;&gt;
        &lt;div class=&quot;float-end&quot;&gt;
            Rejected 
        &lt;/div&gt;
        &lt;div class=&quot;d-flex mb-2 align-items-center&quot;&gt;
            &lt;div class=&quot;flex-shrink-0&quot;&gt;
                &lt;img src=&quot;{$themePath}/assets/images/users/avatar-3.jpg&quot; alt=&quot;&quot; class=&quot;avatar-sm rounded-circle&quot; /&gt;
            &lt;/div&gt;
            &lt;div class=&quot;flex-grow-1 ms-3&quot;&gt;
                &lt;h5 class=&quot;list-title fs-15 mb-1&quot;&gt;Declan Long&lt;/h5&gt;
                &lt;p class=&quot;list-text mb-0 fs-12&quot;&gt;12 min Ago&lt;/p&gt;
            &lt;/div&gt;
        &lt;/div&gt;
        &lt;p class=&quot;list-text mb-0&quot;&gt;Big July earthquakes confound zany experimental vow. My girl wove six dozen plaid jackets before she quit. Six big devils from Japan quickly forgot how to waltz. try again until it looks right, and each assumenda labore aes Homo nostrud organic, assumenda labore aesthetic magna elements, buttons, everything.&lt;/p&gt;
    &lt;/a&gt;</code>
                                                                <code>&lt;a href=&quot;javascript:void(0);&quot; class=&quot;list-group-item list-group-item-action&quot;&gt;
        &lt;div class=&quot;float-end&quot;&gt;
            Successful 
        &lt;/div&gt;
        &lt;div class=&quot;d-flex mb-2 align-items-center&quot;&gt;
            &lt;div class=&quot;flex-shrink-0&quot;&gt;
                &lt;img src=&quot;{$themePath}/assets/images/users/avatar-4.jpg&quot; alt=&quot;&quot; class=&quot;avatar-sm rounded-circle&quot; /&gt;
            &lt;/div&gt;
            &lt;div class=&quot;flex-grow-1 ms-3&quot;&gt;
                &lt;h5 class=&quot;list-title fs-15 mb-1&quot;&gt;Angela Bernier&lt;/h5&gt;
                &lt;p class=&quot;list-text mb-0 fs-12&quot;&gt;5 days Ago&lt;/p&gt;
            &lt;/div&gt;
        &lt;/div&gt;
        &lt;p class=&quot;list-text mb-0&quot;&gt;Just like in the image where we talked about using multiple fonts, you can see that the background in this graphic design is blurred. Whenever you put text on top of an image, it &rsquo; s important that your viewers can understand the text, and sometimes that means applying a gaussian readable.&lt;/p&gt;
    &lt;/a&gt;
&lt;/div&gt;</code>
                                                            </pre>
                                                        </div>
                                                    </div>                                                    <!-- end card-body -->
                                                </div>                                                <!-- end card -->
                                            </div>
                                            <!-- end col -->
                                        </div>
                                        <!--end row-->

                                        <div class="row">
                                            <div class="col-xxl-4 col-xl-6">
                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">List with Badges</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="withbadgeslist-showcode" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="withbadgeslist-showcode"></input>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->
                                                    <div class="card-body">
                                                        <p class="text-muted">Use badges to any list group item to show unread counts, activity, and more with the help of some <a href="https://getbootstrap.com/docs/5.1/utilities/">utilities</a>.
                                                        </p>
                                                        <div class="live-preview">
                                                            <ul class="list-group">
                                                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                                Send the billing agreement <span class="badge bg-success">High</span>
                                                                </li>
                                                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                                Send over all the documentation
                                                                </li>
                                                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                                Meeting with daron to review the intake form <span class="badge bg-danger">Low</span>
                                                                </li>
                                                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                                Check uikings theme and give customer support <span class="badge bg-secondary">Medium</span>
                                                                </li>
                                                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                                Start making a presentation <span class="badge bg-success">High</span>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="height: 200px;">
                                                                <code>&lt;ul class=&quot;list-group&quot;&gt;
    &lt;li class=&quot;list-group-item d-flex justify-content-between align-items-center&quot;&gt;
        Send the billing agreement &lt;span class=&quot;badge bg-success&quot;&gt;High&lt;/span&gt;
    &lt;/li&gt;
    &lt;li class=&quot;list-group-item d-flex justify-content-between align-items-center&quot;&gt;
        Send over all the documentation 
    &lt;/li&gt;
    &lt;li class=&quot;list-group-item d-flex justify-content-between align-items-center&quot;&gt;
        Meeting with daron to review the intake form &lt;span class=&quot;badge bg-danger&quot;&gt;Low&lt;/span&gt;
    &lt;/li&gt;
    &lt;li class=&quot;list-group-item d-flex justify-content-between align-items-center&quot;&gt;
        Check uikings theme and give customer support &lt;span class=&quot;badge bg-secondary&quot;&gt;Medium&lt;/span&gt;
    &lt;/li&gt;
    &lt;li class=&quot;list-group-item d-flex justify-content-between align-items-center&quot;&gt;
        Start making a presentation &lt;span class=&quot;badge bg-success&quot;&gt;High&lt;/span&gt;
    &lt;/li&gt;
&lt;/ul&gt;</code>
                                                            </pre>
                                                        </div>
                                                    </div>                                                    <!-- end card-body -->
                                                </div>                                                <!-- end card -->
                                            </div>
                                            <!-- end col -->

                                            <div class="col-xxl-4 col-xl-6">
                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">List with Checkboxs</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="withcheckboxs-showcode" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="withcheckboxs-showcode"></input>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->
                                                    <div class="card-body">
                                                        <p class="text-muted">Use Bootstrap’s checkboxes within list group items and customize as needed. </p>
                                                        <div class="live-preview">
                                                            <div class="list-group">
                                                                <label class="list-group-item">
                                                                    <input class="form-check-input me-1" type="checkbox" value="">
                                                Declined Payment</input>
                                                                </label>
                                                                <label class="list-group-item">
                                                                    <input class="form-check-input me-1" type="checkbox" value="" checked="">
                                                Delivery Error</input>
                                                                </label>
                                                                <label class="list-group-item">
                                                                    <input class="form-check-input me-1" type="checkbox" value="" checked="">
                                                Wrong Amount</input>
                                                                </label>
                                                                <label class="list-group-item">
                                                                    <input class="form-check-input me-1" type="checkbox" value="">
                                                Wrong Address</input>
                                                                </label>
                                                                <label class="list-group-item">
                                                                    <input class="form-check-input me-1" type="checkbox" value="">
                                                Wrong UX/UI Solution</input>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="height: 275px;">
                                                                <code>&lt;div class=&quot;list-group&quot;&gt;
    &lt;label class=&quot;list-group-item&quot;&gt;
        &lt;input class=&quot;form-check-input me-1&quot; type=&quot;checkbox&quot; value=&quot;&quot;&gt;
        Declined Payment
    &lt;/label&gt;
    &lt;label class=&quot;list-group-item&quot;&gt;
        &lt;input class=&quot;form-check-input me-1&quot; type=&quot;checkbox&quot; value=&quot;&quot; checked&gt;
        Delivery Error
    &lt;/label&gt;
    &lt;label class=&quot;list-group-item&quot;&gt;
        &lt;input class=&quot;form-check-input me-1&quot; type=&quot;checkbox&quot; value=&quot;&quot; checked&gt;
        Wrong Amount
    &lt;/label&gt;
    &lt;label class=&quot;list-group-item&quot;&gt;
        &lt;input class=&quot;form-check-input me-1&quot; type=&quot;checkbox&quot; value=&quot;&quot;&gt;
        Wrong Address
    &lt;/label&gt;
    &lt;label class=&quot;list-group-item&quot;&gt;
        &lt;input class=&quot;form-check-input me-1&quot; type=&quot;checkbox&quot; value=&quot;&quot;&gt;
        Wrong UX/UI Solution
    &lt;/label&gt;
&lt;/div&gt;</code>
                                                            </pre>
                                                        </div>
                                                    </div>                                                    <!-- end card-body -->
                                                </div>                                                <!-- end card -->
                                            </div>
                                            <!-- end col -->

                                            <div class="col-xxl-4 col-xl-6">
                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">List with Radios</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="withradios-showcode" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="withradios-showcode"></input>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->
                                                    <div class="card-body">
                                                        <p class="text-muted">Use Bootstrap’s radios within list group items and customize as needed. </p>
                                                        <div class="live-preview">
                                                            <div class="list-group">
                                                                <label class="list-group-item">
                                                                    <input class="form-check-input fs-14 mt-0 align-middle me-1" name="exampleRadios" type="radio" value="">
                                                Declined Payment</input>
                                                                </label>
                                                                <label class="list-group-item">
                                                                    <input class="form-check-input fs-14 mt-0 align-middle me-1" name="exampleRadios" type="radio" value="" checked="">
                                                Delivery Error</input>
                                                                </label>
                                                                <label class="list-group-item">
                                                                    <input class="form-check-input fs-14 mt-0 align-middle me-1" name="exampleRadios" type="radio" value="">
                                                Wrong Amount</input>
                                                                </label>
                                                                <label class="list-group-item">
                                                                    <input class="form-check-input fs-14 mt-0 align-middle me-1" name="exampleRadios" type="radio" value="">
                                                Wrong Address</input>
                                                                </label>
                                                                <label class="list-group-item">
                                                                    <input class="form-check-input fs-14 mt-0 align-middle me-1" name="exampleRadios" type="radio" value="">
                                                Wrong UX/UI Solution</input>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="height: 275px;">
                                                                <code>&lt;div class=&quot;list-group&quot;&gt;
    &lt;label class=&quot;list-group-item&quot;&gt;
        &lt;input class=&quot;form-check-input me-1&quot; name=&quot;exampleRadios&quot; type=&quot;radio&quot; value=&quot;&quot;&gt;
        Declined Payment
    &lt;/label&gt;
    &lt;label class=&quot;list-group-item&quot;&gt;
        &lt;input class=&quot;form-check-input me-1&quot; name=&quot;exampleRadios&quot; type=&quot;radio&quot; value=&quot;&quot; checked&gt;
        Delivery Error
    &lt;/label&gt;
    &lt;label class=&quot;list-group-item&quot;&gt;
        &lt;input class=&quot;form-check-input me-1&quot; name=&quot;exampleRadios&quot; type=&quot;radio&quot; value=&quot;&quot;&gt;
        Wrong Amount
    &lt;/label&gt;
    &lt;label class=&quot;list-group-item&quot;&gt;
        &lt;input class=&quot;form-check-input me-1&quot; name=&quot;exampleRadios&quot; type=&quot;radio&quot; value=&quot;&quot;&gt;
        Wrong Address
    &lt;/label&gt;
    &lt;label class=&quot;list-group-item&quot;&gt;
        &lt;input class=&quot;form-check-input me-1&quot; name=&quot;exampleRadios&quot; type=&quot;radio&quot; value=&quot;&quot;&gt;
        Wrong UX/UI Solution
    &lt;/label&gt;
&lt;/div&gt;</code>
                                                            </pre>
                                                        </div>
                                                    </div>                                                    <!-- end card-body -->
                                                </div>                                                <!-- end card -->
                                            </div>
                                            <!-- end col -->

                                            <div class="col-xxl-4 col-xl-6">
                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">List with Icon</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="withbadgeslist2-showcode" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="withbadgeslist2-showcode"></input>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->
                                                    <div class="card-body">
                                                        <p class="text-muted">Use icons to any list group item to show icons to list group items.</p>
                                                        <div class="live-preview">
                                                            <ul class="list-group">
                                                                <li class="list-group-item">
                                                                    <i class="mdi mdi-check-bold align-middle lh-1 me-2"></i> Send the billing agreement</li>
                                                                <li class="list-group-item">
                                                                    <i class="mdi mdi-check-bold align-middle lh-1 me-2"></i> Send over all the documentation.</li>
                                                                <li class="list-group-item">
                                                                    <i class="mdi mdi-check-bold align-middle lh-1 me-2"></i> Meeting with daron to review the intake form</li>
                                                                <li class="list-group-item">
                                                                    <i class="mdi mdi-check-bold align-middle lh-1 me-2"></i> Check uikings theme and give customer support</li>
                                                                <li class="list-group-item">
                                                                    <i class="mdi mdi-check-bold align-middle lh-1 me-2"></i> Start making a presentation</li>
                                                            </ul>
                                                        </div>
                                                        <div class="d-none code-view">
                                                            <pre class="language-markup">
                                                                <code>&lt;ul class=&quot;list-group&quot;&gt;
    &lt;li class=&quot;list-group-item&quot;&gt;&lt;i class=&quot;mdi mdi-check-bold align-middle lh-1 me-2&quot;&gt;&lt;/i&gt; Send the billing agreement&lt;/li&gt;
    &lt;li class=&quot;list-group-item&quot;&gt;&lt;i class=&quot;mdi mdi-check-bold align-middle lh-1 me-2&quot;&gt;&lt;/i&gt; Send over all the documentation.&lt;/li&gt;
    &lt;li class=&quot;list-group-item&quot;&gt;&lt;i class=&quot;mdi mdi-check-bold align-middle lh-1 me-2&quot;&gt;&lt;/i&gt; Meeting with daron to review the intake form&lt;/li&gt;
    &lt;li class=&quot;list-group-item&quot;&gt;&lt;i class=&quot;mdi mdi-check-bold align-middle lh-1 me-2&quot;&gt;&lt;/i&gt; Check uikings theme and give customer support&lt;/li&gt;
    &lt;li class=&quot;list-group-item&quot;&gt;&lt;i class=&quot;mdi mdi-check-bold align-middle lh-1 me-2&quot;&gt;&lt;/i&gt; Start making a presentation&lt;/li&gt;
&lt;/ul&gt;</code>
                                                            </pre>
                                                        </div>
                                                    </div>                                                    <!-- end card-body -->
                                                </div>                                                <!-- end card -->
                                            </div>
                                            <!-- end col -->

                                            <div class="col-xxl-4 col-xl-6">
                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">List with Numbered</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="withnumbered-showcode" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="withnumbered-showcode"></input>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->
                                                    <div class="card-body">
                                                        <p class="text-muted">Use <code>list-group-numbered</code> class (optionally use an <code>&lt;ol&gt;</code> element) to show numbered list group items. </p>
                                                        <div class="live-preview">
                                                            <ol class="list-group list-group-numbered">
                                                                <li class="list-group-item">Send the billing agreement</li>
                                                                <li class="list-group-item">Send over all the documentation.</li>
                                                                <li class="list-group-item">Meeting with daron to review the intake form</li>
                                                                <li class="list-group-item">Check uikings theme and give customer support</li>
                                                                <li class="list-group-item">Start making a presentation</li>
                                                            </ol>
                                                        </div>
                                                        <div class="d-none code-view">
                                                            <pre class="language-markup">
                                                                <code>&lt;ol class=&quot;list-group list-group-numbered&quot;&gt;
    &lt;li class=&quot;list-group-item&quot;&gt;Send the billing agreement&lt;/li&gt;
    &lt;li class=&quot;list-group-item&quot;&gt;Send over all the documentation.&lt;/li&gt;
    &lt;li class=&quot;list-group-item&quot;&gt;Meeting with daron to review the intake form&lt;/li&gt;
    &lt;li class=&quot;list-group-item&quot;&gt;Check uikings theme and give customer support&lt;/li&gt;
    &lt;li class=&quot;list-group-item&quot;&gt;Start making a presentation&lt;/li&gt;
&lt;/ol&gt;</code>
                                                            </pre>
                                                        </div>
                                                    </div>                                                    <!-- end card-body -->
                                                </div>                                                <!-- end card -->
                                            </div>
                                            <!-- end col -->

                                            <div class="col-xxl-4 col-xl-6">
                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">Custom Content Lists</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="withcustomcontent-list-showcode" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="withcustomcontent-list-showcode"></input>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->
                                                    <div class="card-body">
                                                        <p>Add nearly any HTML within, even for linked list groups like the one below, with the help of <a href="https://getbootstrap.com/docs/5.1/utilities/flex/">flexbox utilities</a>.
                                                        </p>
                                                        <div class="live-preview">
                                                            <div data-simplebar="" style="max-height: 215px;">
                                                                <ul class="list-group mb-1">
                                                                    <li class="list-group-item">
                                                                        <div class="d-flex align-items-center">
                                                                            <div class="flex-grow-1">
                                                                                <div class="d-flex">
                                                                                    <div class="flex-shrink-0 avatar-xs">
                                                                                        <div class="avatar-title bg-soft-danger text-danger rounded">
                                                                                            <i class="ri-netflix-fill"></i>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="flex-shrink-0 ms-2">
                                                                                        <h6 class="fs-14 mb-0">Netfilx</h6>
                                                                                        <small class="text-muted">2 min Ago</small>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="flex-shrink-0">
                                                                                <span class="text-danger">-$25.50</span>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                    <li class="list-group-item">
                                                                        <div class="d-flex align-items-center">
                                                                            <div class="flex-grow-1">
                                                                                <div class="d-flex">
                                                                                    <div class="flex-shrink-0 avatar-xs">
                                                                                        <div class="avatar-title bg-soft-success text-success rounded">
                                                                                            <i class="ri-spotify-fill"></i>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="flex-shrink-0 ms-2">
                                                                                        <h6 class="fs-14 mb-0">Spotify</h6>
                                                                                        <small class="text-muted">5 days Ago</small>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="flex-shrink-0">
                                                                                <span class="text-success">$48.25</span>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                    <li class="list-group-item">
                                                                        <div class="d-flex align-items-center">
                                                                            <div class="flex-grow-1">
                                                                                <div class="d-flex">
                                                                                    <div class="flex-shrink-0">
                                                                                        <img src="{$themePath}/assets/images/users/avatar-2.jpg" alt="" class="avatar-xs rounded" />
                                                                                    </div>
                                                                                    <div class="flex-shrink-0 ms-2">
                                                                                        <h6 class="fs-14 mb-0">Emily Slater</h6>
                                                                                        <small class="text-muted">8 days Ago</small>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="flex-shrink-0">
                                                                                <span class="text-success">$354.90</span>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                    <li class="list-group-item">
                                                                        <div class="d-flex align-items-center">
                                                                            <div class="flex-grow-1">
                                                                                <div class="d-flex">
                                                                                    <div class="flex-shrink-0 avatar-xs">
                                                                                        <div class="avatar-title bg-soft-secondary text-secondary rounded">
                                                                                            <i class="ri-paypal-fill"></i>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="flex-shrink-0 ms-2">
                                                                                        <h6 class="fs-14 mb-0">Paypal</h6>
                                                                                        <small class="text-muted">1 month Ago</small>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="flex-shrink-0">
                                                                                <span class="text-danger">-$12.22</span>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                    <li class="list-group-item">
                                                                        <div class="d-flex align-items-center">
                                                                            <div class="flex-grow-1">
                                                                                <div class="d-flex">
                                                                                    <div class="flex-shrink-0">
                                                                                        <img src="{$themePath}/assets/images/users/avatar-3.jpg" alt="" class="avatar-xs rounded" />
                                                                                    </div>
                                                                                    <div class="flex-shrink-0 ms-2">
                                                                                        <h6 class="fs-14 mb-0">Harvey Wells</h6>
                                                                                        <small class="text-muted">4 month Ago</small>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="flex-shrink-0">
                                                                                <span class="text-success">-$459.78</span>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="height: 215px;">
                                                                <code>&lt;div data-simplebar style=&quot;max-height: 215px;&quot;&gt; 
    &lt;ul class=&quot;list-group&quot;&gt;
        &lt;li class=&quot;list-group-item&quot;&gt;
            &lt;div class=&quot;d-flex align-items-center&quot;&gt;
                &lt;div class=&quot;flex-grow-1&quot;&gt;
                    &lt;div class=&quot;d-flex&quot;&gt;
                        &lt;div class=&quot;flex-shrink-0 avatar-xs&quot;&gt;
                            &lt;div class=&quot;avatar-title bg-soft-danger text-danger rounded&quot;&gt;
                                &lt;i class=&quot;ri-netflix-fill&quot;&gt;&lt;/i&gt;
                            &lt;/div&gt;
                        &lt;/div&gt;
                        &lt;div class=&quot;flex-shrink-0 ms-2&quot;&gt;
                            &lt;h6 class=&quot;fs-14 mb-0&quot;&gt;Netfilx&lt;/h6&gt;
                            &lt;small class=&quot;text-muted&quot;&gt;2 min Ago&lt;/small&gt;
                        &lt;/div&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
                &lt;div class=&quot;flex-shrink-0&quot;&gt;
                    &lt;span class=&quot;text-danger&quot;&gt;-$25.50&lt;/span&gt;
                &lt;/div&gt;
            &lt;/div&gt;
        &lt;/li&gt;
        &lt;li class=&quot;list-group-item&quot;&gt;
            &lt;div class=&quot;d-flex align-items-center&quot;&gt;
                &lt;div class=&quot;flex-grow-1&quot;&gt;
                    &lt;div class=&quot;d-flex&quot;&gt;
                        &lt;div class=&quot;flex-shrink-0 avatar-xs&quot;&gt;
                            &lt;div class=&quot;avatar-title bg-soft-success text-success rounded&quot;&gt;
                                &lt;i class=&quot;ri-spotify-fill&quot;&gt;&lt;/i&gt;
                            &lt;/div&gt;
                        &lt;/div&gt;
                        &lt;div class=&quot;flex-shrink-0 ms-2&quot;&gt;
                            &lt;h6 class=&quot;fs-14 mb-0&quot;&gt;Spotify&lt;/h6&gt;
                            &lt;small class=&quot;text-muted&quot;&gt;5 days Ago&lt;/small&gt;
                        &lt;/div&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
                &lt;div class=&quot;flex-shrink-0&quot;&gt;
                    &lt;span class=&quot;text-success&quot;&gt;$48.25&lt;/span&gt;
                &lt;/div&gt;
            &lt;/div&gt;
        &lt;/li&gt;
        &lt;li class=&quot;list-group-item&quot;&gt;
            &lt;div class=&quot;d-flex align-items-center&quot;&gt;
                &lt;div class=&quot;flex-grow-1&quot;&gt;
                    &lt;div class=&quot;d-flex&quot;&gt;
                        &lt;div class=&quot;flex-shrink-0&quot;&gt;
                            &lt;img src=&quot;{$themePath}/assets/images/users/avatar-2.jpg&quot; alt=&quot;&quot; class=&quot;avatar-xs rounded&quot; /&gt;
                        &lt;/div&gt;
                        &lt;div class=&quot;flex-shrink-0 ms-2&quot;&gt;
                            &lt;h6 class=&quot;fs-14 mb-0&quot;&gt;Emily Slater&lt;/h6&gt;
                            &lt;small class=&quot;text-muted&quot;&gt;8 days Ago&lt;/small&gt;
                        &lt;/div&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
                &lt;div class=&quot;flex-shrink-0&quot;&gt;
                    &lt;span class=&quot;text-success&quot;&gt;$354.90&lt;/span&gt;
                &lt;/div&gt;
            &lt;/div&gt;
        &lt;/li&gt;
        &lt;li class=&quot;list-group-item&quot;&gt;
            &lt;div class=&quot;d-flex align-items-center&quot;&gt;
                &lt;div class=&quot;flex-grow-1&quot;&gt;
                    &lt;div class=&quot;d-flex&quot;&gt;
                        &lt;div class=&quot;flex-shrink-0 avatar-xs&quot;&gt;
                            &lt;div class=&quot;avatar-title bg-soft-secondary text-secondary rounded&quot;&gt;
                                &lt;i class=&quot;ri-paypal-fill&quot;&gt;&lt;/i&gt;
                            &lt;/div&gt;
                        &lt;/div&gt;
                        &lt;div class=&quot;flex-shrink-0 ms-2&quot;&gt;
                            &lt;h6 class=&quot;fs-14 mb-0&quot;&gt;Paypal&lt;/h6&gt;
                            &lt;small class=&quot;text-muted&quot;&gt;1 month Ago&lt;/small&gt;
                        &lt;/div&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
                &lt;div class=&quot;flex-shrink-0&quot;&gt;
                    &lt;span class=&quot;text-danger&quot;&gt;-$12.22&lt;/span&gt;
                &lt;/div&gt;
            &lt;/div&gt;
        &lt;/li&gt;
        &lt;li class=&quot;list-group-item&quot;&gt;
            &lt;div class=&quot;d-flex align-items-center&quot;&gt;
                &lt;div class=&quot;flex-grow-1&quot;&gt;
                    &lt;div class=&quot;d-flex&quot;&gt;
                        &lt;div class=&quot;flex-shrink-0&quot;&gt;
                            &lt;img src=&quot;{$themePath}/assets/images/users/avatar-3.jpg&quot; alt=&quot;&quot; class=&quot;avatar-xs rounded&quot; /&gt;
                        &lt;/div&gt;
                        &lt;div class=&quot;flex-shrink-0 ms-2&quot;&gt;
                            &lt;h6 class=&quot;fs-14 mb-0&quot;&gt;Harvey Wells&lt;/h6&gt;
                            &lt;small class=&quot;text-muted&quot;&gt;4 month Ago&lt;/small&gt;
                        &lt;/div&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
                &lt;div class=&quot;flex-shrink-0&quot;&gt;
                    &lt;span class=&quot;text-success&quot;&gt;-$459.78&lt;/span&gt;
                &lt;/div&gt;
            &lt;/div&gt;
        &lt;/li&gt;
    &lt;/ul&gt;
&lt;/div&gt;</code>
                                                            </pre>
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
<xsl:include href="../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1515664208567"/>

</xsl:stylesheet>
