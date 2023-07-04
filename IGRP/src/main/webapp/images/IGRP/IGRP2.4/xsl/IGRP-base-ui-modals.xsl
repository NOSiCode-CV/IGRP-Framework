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
                                                        <h4 class="card-title mb-0 flex-grow-1">Default Modal</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="default-modal" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="default-modal"></input>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->
                                                    <div class="card-body">
                                                        <p class="text-muted text-muted">Use <code>modal-dialog</code> class to show default modal.</p>
                                                        <div class="live-preview">
                                                            <div>
                                                                <button type="button" class="btn btn-primary " data-bs-toggle="modal" data-bs-target="#myModal">Standard Modal</button>
                                                                <div id="myModal" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                                                                    <div class="modal-dialog">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <h5 class="modal-title" id="myModalLabel">Modal Heading</h5>
                                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                            </div>
                                                                            <div class="modal-body">
                                                                                <h5 class="fs-15">
                                                                Overflowing text to show scroll behavior
                                                                                </h5>
                                                                                <p class="text-muted">One morning, when Gregor Samsa woke from troubled dreams, he found himself transformed in his bed into a horrible vermin. He lay on his armour-like back, and if he lifted his head a little he could see his brown belly, slightly domed and divided by arches into stiff sections.</p>
                                                                                <p class="text-muted">The bedding was hardly able to cover it and seemed ready to slide off any moment. His many legs, pitifully thin compared with the size of the rest of him, waved about helplessly as he looked. "What's happened to me?" he thought.</p>
                                                                                <p class="text-muted">It wasn't a dream. His room, a proper human room although a little too small, lay peacefully between its four familiar walls.</p>
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
                                                                                <button type="button" class="btn btn-primary ">Save Changes</button>
                                                                            </div>

                                                                        </div>                                                                        <!-- /.modal-content -->
                                                                    </div>                                                                    <!-- /.modal-dialog -->
                                                                </div>                                                                <!-- /.modal -->
                                                            </div>
                                                        </div>
                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="height: 275px;">
                                                                <code>&lt;!-- Default Modals --&gt;
&lt;button type=&quot;button&quot; class=&quot;btn btn-primary &quot; data-bs-toggle=&quot;modal&quot; data-bs-target=&quot;#myModal&quot;&gt;Standard Modal&lt;/button&gt;
&lt;div id=&quot;myModal&quot; class=&quot;modal fade&quot; tabindex=&quot;-1&quot; aria-labelledby=&quot;myModalLabel&quot; aria-hidden=&quot;true&quot; style=&quot;display: none;&quot;&gt;
    &lt;div class=&quot;modal-dialog&quot;&gt;
        &lt;div class=&quot;modal-content&quot;&gt;
            &lt;div class=&quot;modal-header&quot;&gt;
                &lt;h5 class=&quot;modal-title&quot; id=&quot;myModalLabel&quot;&gt;Modal Heading&lt;/h5&gt;
                &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot;modal&quot; aria-label=&quot;Close&quot;&gt; &lt;/button&gt;
            &lt;/div&gt;
            &lt;div class=&quot;modal-body&quot;&gt;
                &lt;h5 class=&quot;fs-15&quot;&gt;
                    Overflowing text to show scroll behavior
                &lt;/h5&gt;
                &lt;p class=&quot;text-muted&quot;&gt;One morning, when Gregor Samsa woke from troubled dreams, he found himself transformed in his bed into a horrible vermin. He lay on his armour-like back, and if he lifted his head a little he could see his brown belly, slightly domed and divided by arches into stiff sections.&lt;/p&gt;
                &lt;p class=&quot;text-muted&quot;&gt;The bedding was hardly able to cover it and seemed ready to slide off any moment. His many legs, pitifully thin compared with the size of the rest of him, waved about helplessly as he looked. &quot;What's happened to me?&quot; he thought.&lt;/p&gt;
                &lt;p class=&quot;text-muted&quot;&gt;It wasn't a dream. His room, a proper human room although a little too small, lay peacefully between its four familiar walls.&lt;/p&gt;
            &lt;/div&gt;
            &lt;div class=&quot;modal-footer&quot;&gt;
                &lt;button type=&quot;button&quot; class=&quot;btn btn-light&quot; data-bs-dismiss=&quot;modal&quot;&gt;Close&lt;/button&gt;
                &lt;button type=&quot;button&quot; class=&quot;btn btn-primary &quot;&gt;Save Changes&lt;/button&gt;
            &lt;/div&gt;

        &lt;/div&gt;&lt;!-- /.modal-content --&gt;
    &lt;/div&gt;&lt;!-- /.modal-dialog --&gt;
&lt;/div&gt;&lt;!-- /.modal --&gt;</code>
                                                            </pre>
                                                        </div>
                                                    </div>                                                    <!-- end card-body -->
                                                </div>                                                <!-- end card -->
                                            </div>
                                            <div class="col-xxl-6">
                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">Vertically Centered Modal</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="vertically-centered" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="vertically-centered"></input>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->
                                                    <div class="card-body">
                                                        <p class="text-muted">Use <code>modal-dialog-centered</code> class to show vertically center the modal.</p>
                                                        <div class="live-preview">
                                                            <div>
                                                                <!-- center modal -->
                                                                <button type="button" class="btn btn-primary " data-bs-toggle="modal" data-bs-target=".bs-example-modal-center">Center Modal</button>
                                                                <div class="modal fade bs-example-modal-center" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
                                                                    <div class="modal-dialog modal-dialog-centered">
                                                                        <div class="modal-content">
                                                                            <div class="modal-body text-center p-5">
                                                                                <lord-icon src="https://cdn.lordicon.com/hrqwmuhr.json" trigger="loop" colors="primary:#121331,secondary:#08a88a" style="width:120px;height:120px"></lord-icon>
                                                                                <div class="mt-4">
                                                                                    <h4 class="mb-3">Oops something went wrong!</h4>
                                                                                    <p class="text-muted mb-4"> The transfer was not successfully received by us. the email of the recipient wasn't correct.</p>
                                                                                    <div class="hstack gap-2 justify-content-center">
                                                                                        <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
                                                                                        <a href="javascript:void(0);" class="btn btn-danger">Try Again</a>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>                                                                        <!-- /.modal-content -->
                                                                    </div>                                                                    <!-- /.modal-dialog -->
                                                                </div>                                                                <!-- /.modal -->
                                                            </div>
                                                        </div>

                                                        <div class="d-none code-view">
                                                            <pre class="language-markup">
                                                                <code>&lt;!-- Vertically Centered --&gt;
&lt;div class=&quot;modal-dialog modal-dialog-centered&quot;&gt;
    ...
&lt;/div&gt;</code>
                                                            </pre>
                                                        </div>
                                                    </div>                                                    <!-- end card-body -->
                                                </div>                                                <!-- end card -->
                                            </div>
                                        </div>
                                        <!---end row-->

                                        <div class="row">
                                            <div class="col-xxl-6">
                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">Grids in Modals</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="grid-modal-showcode" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="grid-modal-showcode"></input>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->
                                                    <div class="card-body">
                                                        <p class="text-muted">Use <code>container-fluid</code> class within the modal-body to utilize the Bootstrap grid system within a modal by nesting.</p>
                                                        <div class="live-preview">
                                                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModalgrid">
                                            Launch Demo Modal
                                                            </button>
                                                            <div class="modal fade" id="exampleModalgrid" tabindex="-1" aria-labelledby="exampleModalgridLabel">
                                                                <div class="modal-dialog">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h5 class="modal-title" id="exampleModalgridLabel">Grid Modals</h5>
                                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            <form action="javascript:void(0);">
                                                                                <div class="row g-3">
                                                                                    <div class="col-xxl-6">
                                                                                        <div>
                                                                                            <label for="firstName" class="form-label">First Name</label>
                                                                                            <input type="text" class="form-control" id="firstName" placeholder="Enter firstname"></input>
                                                                                        </div>
                                                                                    </div>
                                                                                    <!--end col-->
                                                                                    <div class="col-xxl-6">
                                                                                        <div>
                                                                                            <label for="lastName" class="form-label">Last Name</label>
                                                                                            <input type="text" class="form-control" id="lastName" placeholder="Enter lastname"></input>
                                                                                        </div>
                                                                                    </div>
                                                                                    <!--end col-->
                                                                                    <div class="col-lg-12">
                                                                                        <label class="form-label">Gender</label>
                                                                                        <div>
                                                                                            <div class="form-check form-check-inline">
                                                                                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                                                                                                    <label class="form-check-label" for="inlineRadio1">Male</label>
                                                                                                </input>
                                                                                            </div>
                                                                                            <div class="form-check form-check-inline">
                                                                                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                                                                                                    <label class="form-check-label" for="inlineRadio2">Female</label>
                                                                                                </input>
                                                                                            </div>
                                                                                            <div class="form-check form-check-inline">
                                                                                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3">
                                                                                                    <label class="form-check-label" for="inlineRadio3">Others</label>
                                                                                                </input>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <!--end col-->
                                                                                    <div class="col-xxl-6">
                                                                                        <label for="emailInput" class="form-label">Email</label>
                                                                                        <input type="email" class="form-control" id="emailInput" placeholder="Enter your email"></input>
                                                                                    </div>
                                                                                    <!--end col-->
                                                                                    <div class="col-xxl-6">
                                                                                        <label for="passwordInput" class="form-label">Password</label>
                                                                                        <input type="password" class="form-control" id="passwordInput" value="451326546" placeholder="Enter password"></input>
                                                                                    </div>
                                                                                    <!--end col-->
                                                                                    <div class="col-lg-12">
                                                                                        <div class="hstack gap-2 justify-content-end">
                                                                                            <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
                                                                                            <button type="submit" class="btn btn-primary">Submit</button>
                                                                                        </div>
                                                                                    </div>
                                                                                    <!--end col-->
                                                                                </div>
                                                                                <!--end row-->
                                                                            </form>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="height: 275px;">
                                                                <code>&lt;!-- Grids in modals --&gt;
&lt;button type=&quot;button&quot; class=&quot;btn btn-primary&quot; data-bs-toggle=&quot;modal&quot; data-bs-target=&quot;#exampleModalgrid&quot;&gt;
    Launch Demo Modal
&lt;/button&gt;
&lt;div class=&quot;modal fade&quot; id=&quot;exampleModalgrid&quot; tabindex=&quot;-1&quot; aria-labelledby=&quot;exampleModalgridLabel&quot; aria-modal=&quot;true&quot;&gt;
    &lt;div class=&quot;modal-dialog&quot;&gt;
        &lt;div class=&quot;modal-content&quot;&gt;
            &lt;div class=&quot;modal-header&quot;&gt;
                &lt;h5 class=&quot;modal-title&quot; id=&quot;exampleModalgridLabel&quot;&gt;Grid Modals&lt;/h5&gt;
                &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot;modal&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
            &lt;/div&gt;
            &lt;div class=&quot;modal-body&quot;&gt;
                &lt;form action=&quot;javascript:void(0);&quot;&gt;
                    &lt;div class=&quot;row g-3&quot;&gt;
                        &lt;div class=&quot;col-xxl-6&quot;&gt;
                            &lt;div&gt;
                                &lt;label for=&quot;firstName&quot; class=&quot;form-label&quot;&gt;First Name&lt;/label&gt;
                                &lt;input type=&quot;text&quot; class=&quot;form-control&quot; id=&quot;firstName&quot; placeholder=&quot;Enter firstname&quot;&gt;
                            &lt;/div&gt;
                        &lt;/div&gt;&lt;!--end col--&gt;
                        &lt;div class=&quot;col-xxl-6&quot;&gt;
                            &lt;div&gt;
                                &lt;label for=&quot;lastName&quot; class=&quot;form-label&quot;&gt;Last Name&lt;/label&gt;
                                &lt;input type=&quot;text&quot; class=&quot;form-control&quot; id=&quot;lastName&quot; placeholder=&quot;Enter lastname&quot;&gt;
                            &lt;/div&gt;
                        &lt;/div&gt;&lt;!--end col--&gt;
                        &lt;div class=&quot;col-lg-12&quot;&gt;
                            &lt;label for=&quot;genderInput&quot; class=&quot;form-label&quot;&gt;Gender&lt;/label&gt;
                            &lt;div&gt;
                                &lt;div class=&quot;form-check form-check-inline&quot;&gt;
                                    &lt;input class=&quot;form-check-input&quot; type=&quot;radio&quot; name=&quot;inlineRadioOptions&quot; id=&quot;inlineRadio1&quot; value=&quot;option1&quot;&gt;
                                    &lt;label class=&quot;form-check-label&quot; for=&quot;inlineRadio1&quot;&gt;Male&lt;/label&gt;
                                &lt;/div&gt;
                                &lt;div class=&quot;form-check form-check-inline&quot;&gt;
                                    &lt;input class=&quot;form-check-input&quot; type=&quot;radio&quot; name=&quot;inlineRadioOptions&quot; id=&quot;inlineRadio2&quot; value=&quot;option2&quot;&gt;
                                    &lt;label class=&quot;form-check-label&quot; for=&quot;inlineRadio2&quot;&gt;Female&lt;/label&gt;
                                &lt;/div&gt;
                                &lt;div class=&quot;form-check form-check-inline&quot;&gt;
                                    &lt;input class=&quot;form-check-input&quot; type=&quot;radio&quot; name=&quot;inlineRadioOptions&quot; id=&quot;inlineRadio3&quot; value=&quot;option3&quot;&gt;
                                    &lt;label class=&quot;form-check-label&quot; for=&quot;inlineRadio3&quot;&gt;Others&lt;/label&gt;
                                &lt;/div&gt;
                            &lt;/div&gt;
                        &lt;/div&gt;&lt;!--end col--&gt;
                        &lt;div class=&quot;col-xxl-6&quot;&gt;
                            &lt;div&gt;
                                &lt;label for=&quot;emailInput&quot; class=&quot;form-label&quot;&gt;Email&lt;/label&gt;
                                &lt;input type=&quot;email&quot; class=&quot;form-control&quot; id=&quot;emailInput&quot; placeholder=&quot;Enter your email&quot;&gt;
                            &lt;/div&gt;
                        &lt;/div&gt;&lt;!--end col--&gt;
                        &lt;div class=&quot;col-xxl-6&quot;&gt;
                            &lt;div&gt;
                                &lt;label for=&quot;passwordInput&quot; class=&quot;form-label&quot;&gt;Password&lt;/label&gt;
                                &lt;input type=&quot;password&quot; class=&quot;form-control&quot; id=&quot;passwordInput&quot; value=&quot;451326546&quot;&gt;
                            &lt;/div&gt;
                        &lt;/div&gt;&lt;!--end col--&gt;
                        &lt;div class=&quot;col-lg-12&quot;&gt;
                            &lt;div class=&quot;hstack gap-2 justify-content-end&quot;&gt;
                                &lt;button type=&quot;button&quot; class=&quot;btn btn-light&quot; data-bs-dismiss=&quot;modal&quot;&gt;Close&lt;/button&gt;
                                &lt;button type=&quot;submit&quot; class=&quot;btn btn-primary&quot;&gt;Submit&lt;/button&gt;
                            &lt;/div&gt;
                        &lt;/div&gt;&lt;!--end col--&gt;
                    &lt;/div&gt;&lt;!--end row--&gt;
                &lt;/form&gt;
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

                                            <div class="col-xxl-6">
                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">Static Backdrop Modal</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="static-backdrop" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="static-backdrop"></input>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->
                                                    <div class="card-body">
                                                        <p class="text-muted">Use <code>data-bs-backdrop="static"</code> to modal not to close when clicking outside the modal.</p>
                                                        <div class="live-preview">
                                                            <div>
                                                                <!-- Button trigger modal -->
                                                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                                                Static Backdrop Modal
                                                                </button>
                                                                <!-- staticBackdrop Modal -->
                                                                <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true">
                                                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                                                        <div class="modal-content">
                                                                            <div class="modal-body text-center p-5">
                                                                                <lord-icon src="https://cdn.lordicon.com/lupuorrc.json" trigger="loop" colors="primary:#121331,secondary:#08a88a" style="width:120px;height:120px"></lord-icon>

                                                                                <div class="mt-4">
                                                                                    <h4 class="mb-3">You've made it!</h4>
                                                                                    <p class="text-muted mb-4"> The transfer was not successfully received by us. the email of the recipient wasn't correct.</p>
                                                                                    <div class="hstack gap-2 justify-content-center">
                                                                                        <a href="javascript:void(0);" class="btn btn-link link-success fw-medium" data-bs-dismiss="modal">
                                                                                            <i class="ri-close-line me-1 align-middle"></i> Close</a>
                                                                                        <a href="javascript:void(0);" class="btn btn-success">Completed</a>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="height: 275px;">
                                                                <code>&lt;!-- Static Backdrop --&gt;
&lt;button type=&quot;button&quot; class=&quot;btn btn-primary&quot; data-bs-toggle=&quot;modal&quot; data-bs-target=&quot;#staticBackdrop&quot;&gt;
    Static Backdrop Modal
&lt;/button&gt;
&lt;!-- staticBackdrop Modal --&gt;
&lt;div class=&quot;modal fade&quot; id=&quot;staticBackdrop&quot; data-bs-backdrop=&quot;static&quot; data-bs-keyboard=&quot;false&quot; tabindex=&quot;-1&quot; role=&quot;dialog&quot; aria-labelledby=&quot;staticBackdropLabel&quot; aria-hidden=&quot;true&quot;&gt;
    &lt;div class=&quot;modal-dialog modal-dialog-centered&quot; role=&quot;document&quot;&gt;
        &lt;div class=&quot;modal-content&quot;&gt;
            &lt;div class=&quot;modal-body text-center p-5&quot;&gt;
                &lt;lord-icon src=&quot;https://cdn.lordicon.com/lupuorrc.json&quot; trigger=&quot;loop&quot; colors=&quot;primary:#121331,secondary:#08a88a&quot; style=&quot;width:120px;height:120px&quot;&gt;
                &lt;/lord-icon&gt;
                
                &lt;div class=&quot;mt-4&quot;&gt;
                    &lt;h4 class=&quot;mb-3&quot;&gt;You've made it!&lt;/h4&gt;
                    &lt;p class=&quot;text-muted mb-4&quot;&gt; The transfer was not successfully received by us. the email of the recipient wasn't correct.&lt;/p&gt;
                    &lt;div class=&quot;hstack gap-2 justify-content-center&quot;&gt;
                        &lt;a href=&quot;javascript:void(0);&quot; class=&quot;btn btn-link link-success fw-medium&quot; data-bs-dismiss=&quot;modal&quot;&gt;&lt;i class=&quot;ri-close-line me-1 align-middle&quot;&gt;&lt;/i&gt; Close&lt;/a&gt;
                        &lt;a href=&quot;javascript:void(0);&quot; class=&quot;btn btn-success&quot;&gt;Completed&lt;/a&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
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

                                        <div class="row">
                                            <div class="col-xxl-6">
                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">Toggle Between Modal</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="toggle-betweeen-modals" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="toggle-betweeen-modals"></input>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->
                                                    <div class="card-body">
                                                        <p class="text-muted">Toggle between multiple modals with some clever placement of the <code>data-bs-target</code> and <code>data-bs-toggle</code> attributes.
                                        Please note multiple modals cannot be open at the same time. this method simply toggles between two separate modals.</p>
                                                        <div class="live-preview">
                                                            <div>
                                                                <button type="button" class="btn btn-primary " data-bs-toggle="modal" data-bs-target="#firstmodal">Open First Modal</button>
                                                                <!-- First modal dialog -->
                                                                <div class="modal fade" id="firstmodal" aria-hidden="true" tabindex="-1">
                                                                    <div class="modal-dialog modal-dialog-centered">
                                                                        <div class="modal-content">
                                                                            <div class="modal-body text-center p-5">
                                                                                <lord-icon src="https://cdn.lordicon.com/tdrtiskw.json" trigger="loop" colors="primary:#f7b84b,secondary:#405189" style="width:130px;height:130px"></lord-icon>
                                                                                <div class="mt-4 pt-4">
                                                                                    <h4>Uh oh, something went wrong!</h4>
                                                                                    <p class="text-muted"> The transfer was not successfully received by us. the email of the recipient wasn't correct.</p>
                                                                                    <!-- Toogle to second dialog -->
                                                                                    <button class="btn btn-warning" data-bs-target="#secondmodal" data-bs-toggle="modal" data-bs-dismiss="modal">
                                                                    Continue
                                                                                    </button>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!-- Second modal dialog -->
                                                                <div class="modal fade" id="secondmodal" aria-hidden="true" tabindex="-1">
                                                                    <div class="modal-dialog modal-dialog-centered">
                                                                        <div class="modal-content">
                                                                            <div class="modal-body text-center p-5">
                                                                                <lord-icon src="https://cdn.lordicon.com/zpxybbhl.json" trigger="loop" colors="primary:#405189,secondary:#0ab39c" style="width:150px;height:150px"></lord-icon>
                                                                                <div class="mt-4 pt-3">
                                                                                    <h4 class="mb-3">Follow-Up Email</h4>
                                                                                    <p class="text-muted mb-4">Hide this modal and show the first with the button below Automatically Send your invitees a follow -Up email.</p>
                                                                                    <div class="hstack gap-2 justify-content-center">
                                                                                        <!-- Toogle to first dialog, `data-bs-dismiss` attribute can be omitted - clicking on link will close dialog anyway -->
                                                                                        <button class="btn btn-soft-danger" data-bs-target="#firstmodal" data-bs-toggle="modal" data-bs-dismiss="modal">Back to
                                                                        First
                                                                                        </button>
                                                                                        <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </div>

                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="height: 275px;">
                                                                <code>&lt;!-- Toggle Between Modals --&gt;
&lt;button type=&quot;button&quot; class=&quot;btn btn-primary &quot; data-bs-toggle=&quot;modal&quot; data-bs-target=&quot;#firstmodal&quot;&gt;Open First Modal&lt;/button&gt;
&lt;!-- First modal dialog --&gt;
&lt;div class=&quot;modal fade&quot; id=&quot;firstmodal&quot; aria-hidden=&quot;true&quot; aria-labelledby=&quot;...&quot; tabindex=&quot;-1&quot;&gt;
    &lt;div class=&quot;modal-dialog modal-dialog-centered&quot;&gt;
        &lt;div class=&quot;modal-content&quot;&gt;
            &lt;div class=&quot;modal-body text-center p-5&quot;&gt;
                &lt;lord-icon src=&quot;https://cdn.lordicon.com/tdrtiskw.json&quot; trigger=&quot;loop&quot; colors=&quot;primary:#f7b84b,secondary:#405189&quot; style=&quot;width:130px;height:130px&quot;&gt;
                &lt;/lord-icon&gt;
                &lt;div class=&quot;mt-4 pt-4&quot;&gt;
                    &lt;h4&gt;Uh oh, something went wrong!&lt;/h4&gt;
                    &lt;p class=&quot;text-muted&quot;&gt; The transfer was not successfully received by us. the email of the recipient wasn't correct.&lt;/p&gt;
                    &lt;!-- Toogle to second dialog --&gt;
                    &lt;button class=&quot;btn btn-warning&quot; data-bs-target=&quot;#secondmodal&quot; data-bs-toggle=&quot;modal&quot; data-bs-dismiss=&quot;modal&quot;&gt;
                        Continue
                    &lt;/button&gt;
                &lt;/div&gt;
            &lt;/div&gt;
        &lt;/div&gt;
    &lt;/div&gt;
&lt;/div&gt;
&lt;!-- Second modal dialog --&gt;
&lt;div class=&quot;modal fade&quot; id=&quot;secondmodal&quot; aria-hidden=&quot;true&quot; aria-labelledby=&quot;...&quot; tabindex=&quot;-1&quot;&gt;
    &lt;div class=&quot;modal-dialog modal-dialog-centered&quot;&gt;
        &lt;div class=&quot;modal-content&quot;&gt;
            &lt;div class=&quot;modal-body text-center p-5&quot;&gt;
                &lt;lord-icon src=&quot;https://cdn.lordicon.com/zpxybbhl.json&quot; trigger=&quot;loop&quot; colors=&quot;primary:#405189,secondary:#0ab39c&quot; style=&quot;width:150px;height:150px&quot;&gt;
                &lt;/lord-icon&gt;
                &lt;div class=&quot;mt-4 pt-3&quot;&gt;
                    &lt;h4 class=&quot;mb-3&quot;&gt;Follow-Up Email&lt;/h4&gt;
                    &lt;p class=&quot;text-muted mb-4&quot;&gt;Hide this modal and show the first with the button below Automatically Send your invitees a follow -Up email.&lt;/p&gt;
                    &lt;div class=&quot;hstack gap-2 justify-content-center&quot;&gt;
                        &lt;!-- Toogle to first dialog, `data-bs-dismiss` attribute can be omitted - clicking on link will close dialog anyway --&gt;
                        &lt;button class=&quot;btn btn-soft-danger&quot; data-bs-target=&quot;#firstmodal&quot; data-bs-toggle=&quot;modal&quot; data-bs-dismiss=&quot;modal&quot;&gt;Back to
                            First
                        &lt;/button&gt;
                        &lt;button type=&quot;button&quot; class=&quot;btn btn-light&quot; data-bs-dismiss=&quot;modal&quot;&gt;Close&lt;/button&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
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

                                            <div class="col-xxl-6">
                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">Tooltips and Popovers </h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="tooltip-popover-modal" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="tooltip-popover-modal"></input>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">

                                                        <p class="text-muted">
                                                            <a href="https://getbootstrap.com/docs/5.1/components/tooltips/">Tooltips</a> and <a href="https://getbootstrap.com/docs/5.1/components/popovers/">Popovers</a>
                                        can be placed within modals as needed.When modals are closed, any tooltips and popovers within are also automatically dismissed.</p>

                                                        <div class="live-preview">
                                                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModalPopovers">
                                            Launch Demo Modal
                                                            </button>

                                                            <!-- tooltips and popovers modal -->
                                                            <div class="modal fade" id="exampleModalPopovers" tabindex="-1" aria-hidden="true">
                                                                <div class="modal-dialog">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h5 class="modal-title" id="exampleModalLabel">Tooltips and Popovers Modal</h5>
                                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            <h5 class="fs-16">Popover in a Modal</h5>
                                                                            <p class="text-muted">You only need to know a little to make a big <a href="#" class="popover-test fw-medium text-decoration-underline link-success" data-bs-toggle="popover" title="Common Types of Fonts" data-bs-content="They're a good choice for more traditional projects." data-bs-container="body" data-bs-placement="bottom" data-bs-original-title="Popover Title">Popover on Click </a> you do every day. So let's get started. First, some common types of fonts and what you need to know about them triggers a popover on click.</p>
                                                                            <h5 class="fs-16">Tooltips in a Modal</h5>
                                                                            <p class="text-muted">Opposites attract, and that’s a fact. It’s in our <a href="#" class="tooltip-test text-decoration-underline fw-medium" title="Morton Bayer" data-bs-container="#exampleModalPopovers" data-bs-toggle="tooltip" data-bs-original-title="Tooltip title">graphic design</a> to be interested in the unusual, and that’s why using <a href="#" class="tooltip-test text-decoration-underline" title="Web Developers" data-bs-toggle="tooltip" data-bs-container="#exampleModalPopovers" data-bs-original-title="Tooltip title">design</a> contrasting colors in Graphic Design is a must.</p>
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <div class="mx-auto">
                                                                                <a href="javascript:void(0);" class="btn btn-link fw-medium">Read More <i class="ri-arrow-right-line ms-1 align-middle"></i>
                                                                                </a>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="height: 275px;">
                                                                <code>&lt;!-- Tooltips and Popovers --&gt;
&lt;button type=&quot;button&quot; class=&quot;btn btn-primary&quot; data-bs-toggle=&quot;modal&quot; data-bs-target=&quot;#exampleModalPopovers&quot;&gt;
    Launch demo modal
&lt;/button&gt;

&lt;!-- tooltips and popovers modal --&gt;
&lt;div class=&quot;modal fade&quot; id=&quot;exampleModalPopovers&quot; tabindex=&quot;-1&quot; aria-labelledby=&quot;exampleModalPopoversLabel&quot; aria-modal=&quot;true&quot;&gt;
    &lt;div class=&quot;modal-dialog&quot;&gt;
        &lt;div class=&quot;modal-content&quot;&gt;
            &lt;div class=&quot;modal-header&quot;&gt;
                &lt;h5 class=&quot;modal-title&quot; id=&quot;exampleModalPopoversLabel&quot;&gt;Modal title&lt;/h5&gt;
                &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot;modal&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
            &lt;/div&gt;
            &lt;div class=&quot;modal-body&quot;&gt;
                &lt;h5&gt;Popover in a modal&lt;/h5&gt;
                &lt;p&gt;This &lt;a href=&quot;#&quot; role=&quot;button&quot; class=&quot;btn btn-secondary popover-test&quot; title=&quot;&quot; data-bs-toggle=&quot;popover&quot; data-bs-content=&quot;Vivamus sagittis lacus vel augue laoreet rutrum faucibus.&quot; data-bs-container=&quot;body&quot; data-bs-original-title=&quot;Popover Title&quot;&gt;button&lt;/a&gt; triggers a popover on click.
                &lt;/p&gt;
                &lt;hr&gt;
                &lt;h5&gt;Tooltips in a modal&lt;/h5&gt;
                &lt;p&gt;&lt;a href=&quot;#&quot; class=&quot;tooltip-test text-decoration-underline&quot; title=&quot;&quot; data-bs-container=&quot;#exampleModalPopovers&quot; data-bs-toggle=&quot;tooltip&quot; data-bs-original-title=&quot;Tooltip title&quot;&gt;This
                        link&lt;/a&gt; and &lt;a href=&quot;#&quot; class=&quot;tooltip-test text-decoration-underline&quot; title=&quot;&quot; data-bs-toggle=&quot;tooltip&quot; data-bs-container=&quot;#exampleModalPopovers&quot; data-bs-original-title=&quot;Tooltip title&quot;&gt;that link&lt;/a&gt; have tooltips on
                    hover.&lt;/p&gt;
            &lt;/div&gt;
            &lt;div class=&quot;modal-footer&quot;&gt;
                &lt;button type=&quot;button&quot; class=&quot;btn btn-light&quot; data-bs-dismiss=&quot;modal&quot;&gt;Close&lt;/button&gt;
                &lt;button type=&quot;button&quot; class=&quot;btn btn-primary&quot;&gt;Save changes&lt;/button&gt;
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

                                        <div class="row">
                                            <div class="col-xxl-6">
                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">Scrollable Modal</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="scrollable-modal" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="scrollable-modal"></input>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">

                                                        <p class="text-muted">Use<code> modal-dialog-scrollable</code> class to create a modal scrollable.</p>

                                                        <div class="live-preview">

                                                            <div>
                                                                <!-- Scrollable modal -->
                                                                <button type="button" class="btn btn-primary " data-bs-toggle="modal" data-bs-target="#exampleModalScrollable">Scrollable Modal</button>

                                                                <div class="modal fade" id="exampleModalScrollable" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
                                                                    <div class="modal-dialog modal-dialog-scrollable">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <h5 class="modal-title" id="exampleModalScrollableTitle">Scrollable
                                                                Modal</h5>
                                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                                                </button>
                                                                            </div>
                                                                            <div class="modal-body">
                                                                                <h6 class="fs-15">Give your text a good structure</h6>
                                                                                <div class="d-flex">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2">
                                                                                        <p class="text-muted mb-0">Raw denim you probably haven't heard of them jean shorts Austin.
                                                                        Nesciunt tofu stumptown aliqua, retro synth master cleanse.</p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="d-flex mt-2">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2 ">
                                                                                        <p class="text-muted mb-0">Too much or too little spacing, as in the example below, can make things unpleasant for the reader. The goal is to make your text as comfortable to read as possible. </p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="d-flex mt-2">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2 ">
                                                                                        <p class="text-muted mb-0">In some designs, you might adjust your tracking to create a certain artistic effect. It can also help you fix fonts that are poorly spaced to begin with.</p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="d-flex mt-2">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2 ">
                                                                                        <p class="text-muted mb-0">For that very reason, I went on a quest and spoke to many different professional graphic designers and asked them what graphic design tips they live.</p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="d-flex mt-2">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2 ">
                                                                                        <p class="text-muted mb-0">You've probably heard that opposites attract. The same is true for fonts. Don't be afraid to combine font styles that are different but complementary, like sans serif with serif, short with tall, or decorative with simple. Qui photo booth letterpress, commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR.</p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="d-flex mt-2">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2 ">
                                                                                        <p class="text-muted mb-0">For that very reason, I went on a quest and spoke to many different professional graphic designers and asked them what graphic design tips they live.</p>
                                                                                    </div>
                                                                                </div>
                                                                                <h6 class="fs-16 my-3">Graphic Design</h6>
                                                                                <div class="d-flex mt-2">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2 ">
                                                                                        <p class="text-muted mb-0">Opposites attract, and that’s a fact. It’s in our nature to be interested in the unusual, and that’s why using contrasting colors in Graphic Design is a must. It’s eye-catching, it makes a statement, it’s impressive graphic design. Increase or decrease the letter spacing depending.</p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="d-flex mt-2">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2 ">
                                                                                        <p class="text-muted mb-0">Trust fund seitan letterpress, keytar raw denim keffiyeh etsy art party before they sold out master cleanse gluten-free squid scenester freegan cosby sweater.</p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="d-flex mt-2">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2 ">
                                                                                        <p class="text-muted mb-0">Just like in the image where we talked about using multiple fonts, you can see that the background in this graphic design is blurred. Whenever you put text on top of an image, it’s important that your viewers can understand.</p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="d-flex mt-2">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2 ">
                                                                                        <p class="text-muted mb-0">Keytar raw denim keffiyeh etsy art party before they sold out master cleanse gluten-free squid scenester freegan cosby sweater.</p>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
                                                                                <button type="button" class="btn btn-primary">Save changes</button>
                                                                            </div>
                                                                        </div>                                                                        <!-- /.modal-content -->
                                                                    </div>                                                                    <!-- /.modal-dialog -->
                                                                </div>                                                                <!-- /.modal -->
                                                            </div>

                                                        </div>

                                                        <div class="d-none code-view">
                                                            <pre class="language-markup">
                                                                <code>&lt;!-- Scrollable Modal --&gt;
&lt;div class=&quot;modal-dialog modal-dialog-scrollable&quot;&gt;
    ...
&lt;/div&gt;</code>
                                                            </pre>
                                                        </div>
                                                    </div>                                                    <!-- end card-body -->
                                                </div>                                                <!-- end card -->
                                            </div>

                                            <div class="col-xxl-6">
                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">Varying Modal Content</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="varying-modal-showcode" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="varying-modal-showcode"></input>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">

                                                        <p class="text-muted">Use <code>event.relatedTarget</code> and HTML <code>data-bs-*</code> attributes to vary the contents of the modal depending on which button was clicked.</p>

                                                        <div class="live-preview">

                                                            <div>
                                                                <div class="hstack gap-2 flex-wrap">
                                                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#varyingcontentModal" data-bs-whatever="Mary">Open Modal for Mary</button>
                                                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#varyingcontentModal" data-bs-whatever="Jennifer">Open Modal for Jennifer</button>
                                                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#varyingcontentModal" data-bs-whatever="Roderick">Open Modal for Roderick</button>
                                                                </div>

                                                                <!-- Varying modal content -->
                                                                <div class="modal fade" id="varyingcontentModal" tabindex="-1" aria-labelledby="varyingcontentModalLabel" aria-hidden="true">
                                                                    <div class="modal-dialog">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <h5 class="modal-title" id="varyingcontentModalLabel">New message</h5>
                                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                            </div>
                                                                            <div class="modal-body">
                                                                                <form>
                                                                                    <div class="mb-3">
                                                                                        <label for="customer-name" class="col-form-label">Customer Name:</label>
                                                                                        <input type="text" class="form-control" id="customer-name"></input>
                                                                                    </div>
                                                                                    <div class="mb-3">
                                                                                        <label for="message-text" class="col-form-label">Message:</label>
                                                                                        <textarea class="form-control" id="message-text" rows="4"></textarea>
                                                                                    </div>
                                                                                </form>
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <button type="button" class="btn btn-light" data-bs-dismiss="modal">Back</button>
                                                                                <button type="button" class="btn btn-primary">Send message</button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>

                                                        </div>

                                                        <div class="d-none code-view">
                                                            <pre class="language-markup" style="height: 275px;">
                                                                <code>&lt;!-- Varying Modal Content --&gt;
&lt;div class=&quot;hstack gap-2 flex-wrap&quot;&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-primary&quot; data-bs-toggle=&quot;modal&quot; data-bs-target=&quot;#varyingcontentModal&quot; data-bs-whatever=&quot;@mdo&quot;&gt;Open modal for @mdo&lt;/button&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-primary&quot; data-bs-toggle=&quot;modal&quot; data-bs-target=&quot;#varyingcontentModal&quot; data-bs-whatever=&quot;@fat&quot;&gt;Open modal for @fat&lt;/button&gt;
    &lt;button type=&quot;button&quot; class=&quot;btn btn-primary&quot; data-bs-toggle=&quot;modal&quot; data-bs-target=&quot;#varyingcontentModal&quot; data-bs-whatever=&quot;@getbootstrap&quot;&gt;Open modal for @getbootstrap&lt;/button&gt;
&lt;/div&gt;</code>

                                                                <code>&lt;!-- Varying modal content --&gt;
&lt;div class=&quot;modal fade&quot; id=&quot;varyingcontentModal&quot; tabindex=&quot;-1&quot; aria-labelledby=&quot;varyingcontentModalLabel&quot; aria-hidden=&quot;true&quot;&gt;
    &lt;div class=&quot;modal-dialog&quot;&gt;
        &lt;div class=&quot;modal-content&quot;&gt;
            &lt;div class=&quot;modal-header&quot;&gt;
                &lt;h5 class=&quot;modal-title&quot; id=&quot;varyingcontentModalLabel&quot;&gt;New message&lt;/h5&gt;
                &lt;button type=&quot;button&quot; class=&quot;btn-close&quot; data-bs-dismiss=&quot;modal&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
            &lt;/div&gt;
            &lt;div class=&quot;modal-body&quot;&gt;
                &lt;form&gt;
                    &lt;div class=&quot;mb-3&quot;&gt;
                        &lt;label for=&quot;recipient-name&quot; class=&quot;col-form-label&quot;&gt;Recipient:&lt;/label&gt;
                        &lt;input type=&quot;text&quot; class=&quot;form-control&quot; id=&quot;recipient-name&quot;&gt;
                    &lt;/div&gt;
                    &lt;div class=&quot;mb-3&quot;&gt;
                        &lt;label for=&quot;message-text&quot; class=&quot;col-form-label&quot;&gt;Message:&lt;/label&gt;
                        &lt;textarea class=&quot;form-control&quot; id=&quot;message-text&quot;&gt;&lt;/textarea&gt;
                    &lt;/div&gt;
                &lt;/form&gt;
            &lt;/div&gt;
            &lt;div class=&quot;modal-footer&quot;&gt;
                &lt;button type=&quot;button&quot; class=&quot;btn btn-light&quot; data-bs-dismiss=&quot;modal&quot;&gt;Close&lt;/button&gt;
                &lt;button type=&quot;button&quot; class=&quot;btn btn-primary&quot;&gt;Send message&lt;/button&gt;
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

                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">Optional Sizes</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="optional-sizes" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="optional-sizes"></input>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">
                                                        <p class="text-muted">Use <code>modal-fullscreen</code>,                                                            <code>modal-xl</code>,                                                            <code>modal-lg</code>, or <code>modal-sm</code> class to modal-dialog class to set different size modal respectively.</p>
                                                        <div class="live-preview">
                                                            <div>
                                                                <div class="hstack flex-wrap gap-2">
                                                                    <!-- Fullscreen modal -->
                                                                    <button type="button" class="btn btn-primary " data-bs-toggle="modal" data-bs-target=".exampleModalFullscreen">Fullscreen Modal</button>

                                                                    <!-- Extra Large modal -->
                                                                    <button type="button" class="btn btn-info " data-bs-toggle="modal" data-bs-target=".bs-example-modal-xl">Extra large Modal</button>

                                                                    <!-- Large modal -->
                                                                    <button type="button" class="btn btn-success " data-bs-toggle="modal" data-bs-target=".bs-example-modal-lg">Large Modal</button>

                                                                    <!-- Small modal -->
                                                                    <button type="button" class="btn btn-danger " data-bs-toggle="modal" data-bs-target=".bs-example-modal-sm">Small Modal</button>
                                                                </div>

                                                                <!-- Full screen modal content -->
                                                                <div class="modal fade exampleModalFullscreen" tabindex="-1" aria-labelledby="exampleModalFullscreenLabel" aria-hidden="true">
                                                                    <div class="modal-dialog modal-fullscreen">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <h5 class="modal-title" id="exampleModalFullscreenLabel">Fullscreen
                                                                Modal Heading</h5>
                                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                            </div>
                                                                            <div class="modal-body">
                                                                                <h6 class="fs-15">Give your text a good structure</h6>
                                                                                <div class="d-flex">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2">
                                                                                        <p class="text-muted mb-0">Raw denim you probably haven't heard of them jean shorts Austin.
                                                                        Nesciunt tofu stumptown aliqua, retro synth master cleanse.</p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="d-flex mt-2">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2 ">
                                                                                        <p class="text-muted mb-0">Too much or too little spacing, as in the example below, can make things unpleasant for the reader. The goal is to make your text as comfortable to read as possible. </p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="d-flex mt-2">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2 ">
                                                                                        <p class="text-muted mb-0">In some designs, you might adjust your tracking to create a certain artistic effect. It can also help you fix fonts that are poorly spaced to begin with.</p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="d-flex mt-2">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2 ">
                                                                                        <p class="text-muted mb-0">For that very reason, I went on a quest and spoke to many different professional graphic designers and asked them what graphic design tips they live.</p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="d-flex mt-2">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2 ">
                                                                                        <p class="text-muted mb-0">You've probably heard that opposites attract. The same is true for fonts. Don't be afraid to combine font styles that are different but complementary, like sans serif with serif, short with tall, or decorative with simple. Qui photo booth letterpress, commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR.</p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="d-flex mt-2">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2 ">
                                                                                        <p class="text-muted mb-0">For that very reason, I went on a quest and spoke to many different professional graphic designers and asked them what graphic design tips they live.</p>
                                                                                    </div>
                                                                                </div>
                                                                                <h6 class="fs-16 my-3">Graphic Design</h6>
                                                                                <div class="d-flex mt-2">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2 ">
                                                                                        <p class="text-muted mb-0">Opposites attract, and that’s a fact. It’s in our nature to be interested in the unusual, and that’s why using contrasting colors in Graphic Design is a must. It’s eye-catching, it makes a statement, it’s impressive graphic design. Increase or decrease the letter spacing depending.</p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="d-flex mt-2">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2 ">
                                                                                        <p class="text-muted mb-0">Trust fund seitan letterpress, keytar raw denim keffiyeh etsy art party before they sold out master cleanse gluten-free squid scenester freegan cosby sweater.</p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="d-flex mt-2">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2 ">
                                                                                        <p class="text-muted mb-0">Just like in the image where we talked about using multiple fonts, you can see that the background in this graphic design is blurred. Whenever you put text on top of an image, it’s important that your viewers can understand.</p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="d-flex mt-2">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2 ">
                                                                                        <p class="text-muted mb-0">Keytar raw denim keffiyeh etsy art party before they sold out master cleanse gluten-free squid scenester freegan cosby sweater.</p>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <a href="javascript:void(0);" class="btn btn-link link-success fw-medium" data-bs-dismiss="modal">
                                                                                    <i class="ri-close-line me-1 align-middle"></i> Close</a>
                                                                                <button type="button" class="btn btn-primary ">Save changes</button>
                                                                            </div>
                                                                        </div>                                                                        <!-- /.modal-content -->
                                                                    </div>                                                                    <!-- /.modal-dialog -->
                                                                </div>                                                                <!-- /.modal -->

                                                                <!--  Extra Large modal example -->
                                                                <div class="modal fade bs-example-modal-xl" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
                                                                    <div class="modal-dialog modal-xl">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <h5 class="modal-title" id="myExtraLargeModalLabel">Extra large
                                                                modal</h5>
                                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                            </div>
                                                                            <div class="modal-body">
                                                                                <h6 class="fs-15">Give your text a good structure</h6>
                                                                                <div class="d-flex">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2">
                                                                                        <p class="text-muted mb-0">Raw denim you probably haven't heard of them jean shorts Austin.
                                                                        Nesciunt tofu stumptown aliqua, retro synth master cleanse.</p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="d-flex mt-2">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2 ">
                                                                                        <p class="text-muted mb-0">Too much or too little spacing, as in the example below, can make things unpleasant for the reader. The goal is to make your text as comfortable to read as possible. </p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="d-flex mt-2">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2 ">
                                                                                        <p class="text-muted mb-0">In some designs, you might adjust your tracking to create a certain artistic effect. It can also help you fix fonts that are poorly spaced to begin with.</p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="d-flex mt-2">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2 ">
                                                                                        <p class="text-muted mb-0">For that very reason, I went on a quest and spoke to many different professional graphic designers and asked them what graphic design tips they live.</p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="d-flex mt-2">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2 ">
                                                                                        <p class="text-muted mb-0">You've probably heard that opposites attract. The same is true for fonts. Don't be afraid to combine font styles that are different but complementary, like sans serif with serif, short with tall, or decorative with simple. Qui photo booth letterpress, commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR.</p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="d-flex mt-2">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2 ">
                                                                                        <p class="text-muted mb-0">For that very reason, I went on a quest and spoke to many different professional graphic designers and asked them what graphic design tips they live.</p>
                                                                                    </div>
                                                                                </div>
                                                                                <h6 class="fs-16 my-3">Graphic Design</h6>
                                                                                <div class="d-flex mt-2">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2 ">
                                                                                        <p class="text-muted mb-0">Opposites attract, and that’s a fact. It’s in our nature to be interested in the unusual, and that’s why using contrasting colors in Graphic Design is a must. It’s eye-catching, it makes a statement, it’s impressive graphic design. Increase or decrease the letter spacing depending.</p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="d-flex mt-2">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2 ">
                                                                                        <p class="text-muted mb-0">Trust fund seitan letterpress, keytar raw denim keffiyeh etsy art party before they sold out master cleanse gluten-free squid scenester freegan cosby sweater.</p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="d-flex mt-2">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2 ">
                                                                                        <p class="text-muted mb-0">Just like in the image where we talked about using multiple fonts, you can see that the background in this graphic design is blurred. Whenever you put text on top of an image, it’s important that your viewers can understand.</p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="d-flex mt-2">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2 ">
                                                                                        <p class="text-muted mb-0">Keytar raw denim keffiyeh etsy art party before they sold out master cleanse gluten-free squid scenester freegan cosby sweater.</p>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <a href="javascript:void(0);" class="btn btn-link link-success fw-medium" data-bs-dismiss="modal">
                                                                                    <i class="ri-close-line me-1 align-middle"></i> Close</a>
                                                                                <button type="button" class="btn btn-primary ">Save changes</button>
                                                                            </div>
                                                                        </div>                                                                        <!-- /.modal-content -->
                                                                    </div>                                                                    <!-- /.modal-dialog -->
                                                                </div>                                                                <!-- /.modal -->

                                                                <!--  Large modal example -->
                                                                <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                                                                    <div class="modal-dialog modal-lg">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <h5 class="modal-title" id="myLargeModalLabel">Large modal</h5>
                                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                            </div>
                                                                            <div class="modal-body">
                                                                                <h6 class="fs-15">Give your text a good structure</h6>
                                                                                <div class="d-flex">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2">
                                                                                        <p class="text-muted mb-0">Raw denim you probably haven't heard of them jean shorts Austin.
                                                                        Nesciunt tofu stumptown aliqua, retro synth master cleanse.</p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="d-flex mt-2">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2 ">
                                                                                        <p class="text-muted mb-0">Too much or too little spacing, as in the example below, can make things unpleasant for the reader. The goal is to make your text as comfortable to read as possible. </p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="d-flex mt-2">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2 ">
                                                                                        <p class="text-muted mb-0">In some designs, you might adjust your tracking to create a certain artistic effect. It can also help you fix fonts that are poorly spaced to begin with.</p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="d-flex mt-2">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2 ">
                                                                                        <p class="text-muted mb-0">For that very reason, I went on a quest and spoke to many different professional graphic designers and asked them what graphic design tips they live.</p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="d-flex mt-2">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2 ">
                                                                                        <p class="text-muted mb-0">You've probably heard that opposites attract. The same is true for fonts. Don't be afraid to combine font styles that are different but complementary, like sans serif with serif, short with tall, or decorative with simple. Qui photo booth letterpress, commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR.</p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="d-flex mt-2">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2 ">
                                                                                        <p class="text-muted mb-0">For that very reason, I went on a quest and spoke to many different professional graphic designers and asked them what graphic design tips they live.</p>
                                                                                    </div>
                                                                                </div>
                                                                                <h6 class="fs-16 my-3">Graphic Design</h6>
                                                                                <div class="d-flex mt-2">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2 ">
                                                                                        <p class="text-muted mb-0">Opposites attract, and that’s a fact. It’s in our nature to be interested in the unusual, and that’s why using contrasting colors in Graphic Design is a must. It’s eye-catching, it makes a statement, it’s impressive graphic design. Increase or decrease the letter spacing depending.</p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="d-flex mt-2">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2 ">
                                                                                        <p class="text-muted mb-0">Trust fund seitan letterpress, keytar raw denim keffiyeh etsy art party before they sold out master cleanse gluten-free squid scenester freegan cosby sweater.</p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="d-flex mt-2">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2 ">
                                                                                        <p class="text-muted mb-0">Just like in the image where we talked about using multiple fonts, you can see that the background in this graphic design is blurred. Whenever you put text on top of an image, it’s important that your viewers can understand.</p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="d-flex mt-2">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2 ">
                                                                                        <p class="text-muted mb-0">Keytar raw denim keffiyeh etsy art party before they sold out master cleanse gluten-free squid scenester freegan cosby sweater.</p>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <a href="javascript:void(0);" class="btn btn-link link-success fw-medium" data-bs-dismiss="modal">
                                                                                    <i class="ri-close-line me-1 align-middle"></i> Close</a>
                                                                                <button type="button" class="btn btn-primary ">Save changes</button>
                                                                            </div>
                                                                        </div>                                                                        <!-- /.modal-content -->
                                                                    </div>                                                                    <!-- /.modal-dialog -->
                                                                </div>                                                                <!-- /.modal -->

                                                                <!--  Small modal example -->
                                                                <div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
                                                                    <div class="modal-dialog modal-sm">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <h5 class="modal-title" id="mySmallModalLabel">Small modal</h5>
                                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                                                </button>
                                                                            </div>
                                                                            <div class="modal-body">
                                                                                <h6 class="fs-15">Give your text a good structure</h6>
                                                                                <div class="d-flex">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2">
                                                                                        <p class="text-muted mb-0">Raw denim you probably haven't heard of them jean shorts Austin.
                                                                        Nesciunt tofu stumptown aliqua, retro synth master cleanse.</p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="d-flex mt-2">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2 ">
                                                                                        <p class="text-muted mb-0">Too much or too little spacing, as in the example below, can make things unpleasant for the reader. The goal is to make your text as comfortable to read as possible. </p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="d-flex mt-2">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2 ">
                                                                                        <p class="text-muted mb-0">In some designs, you might adjust your tracking to create a certain artistic effect. It can also help you fix fonts that are poorly spaced to begin with.</p>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <a href="javascript:void(0);" class="btn btn-link link-success fw-medium" data-bs-dismiss="modal">
                                                                                    <i class="ri-close-line me-1 align-middle"></i> Close</a>
                                                                                <button type="button" class="btn btn-primary ">Save changes</button>
                                                                            </div>
                                                                        </div>                                                                        <!-- /.modal-content -->
                                                                    </div>                                                                    <!-- /.modal-dialog -->
                                                                </div>                                                                <!-- /.modal -->
                                                            </div>
                                                        </div>
                                                        <div class="d-none code-view">
                                                            <pre class="language-markup">
                                                                <code>&lt;!-- Optional Modal Sizes --&gt;
&lt;div class=&quot;modal-dialog modal-fullscreen&quot;&gt;...&lt;/div&gt;</code>

                                                                <code>&lt;div class=&quot;modal-dialog modal-xl&quot;&gt;...&lt;/div&gt;</code>

                                                                <code>&lt;div class=&quot;modal-dialog modal-lg&quot;&gt;...&lt;/div&gt;</code>

                                                                <code>&lt;div class=&quot;modal-dialog modal-sm&quot;&gt;...&lt;/div&gt;</code>
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
                                                        <h4 class="card-title mb-0 flex-grow-1">Fullscreen Responsive Modals</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="fullscreen-modal" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="fullscreen-modal"></input>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->
                                                    <div class="card-body">
                                                        <p class="text-muted text-muted">Below mentioned modifier classes are used to show fullscreen modal as per minimum screen requirement.</p>
                                                        <div class="live-preview">
                                                            <div>
                                                                <div class="hstack gap-2 flex-wrap">
                                                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#fullscreeexampleModal">
                                                    Fullscreen modal
                                                                    </button>
                                                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModalFullscreenSm">Full Screen Below sm</button>
                                                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModalFullscreenMd">Full Screen Below md</button>
                                                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModalFullscreenLg">Full Screen Below lg</button>
                                                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModalFullscreenXl">Full Screen Below xl</button>
                                                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModalFullscreenXxl">Full Screen Below xxl</button>
                                                                </div>
                                                                <div class="modal fade" id="fullscreeexampleModal" tabindex="-1" aria-labelledby="fullscreeexampleModalLabel" aria-hidden="true">
                                                                    <div class="modal-dialog modal-fullscreen">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <h5 class="modal-title" id="fullscreeexampleModalLabel">Full screen modal</h5>
                                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                            </div>
                                                                            <div class="modal-body">
                                                                                <h6 class="fs-15">Give your text a good structure</h6>
                                                                                <div class="d-flex">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2">
                                                                                        <p class="text-muted mb-0">Raw denim you probably haven't heard of them jean shorts Austin.
                                                                        Nesciunt tofu stumptown aliqua, retro synth master cleanse.</p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="d-flex mt-2">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2 ">
                                                                                        <p class="text-muted mb-0">Too much or too little spacing, as in the example below, can make things unpleasant for the reader. The goal is to make your text as comfortable to read as possible. </p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="d-flex mt-2">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2 ">
                                                                                        <p class="text-muted mb-0">In some designs, you might adjust your tracking to create a certain artistic effect. It can also help you fix fonts that are poorly spaced to begin with.</p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="d-flex mt-2">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2 ">
                                                                                        <p class="text-muted mb-0">For that very reason, I went on a quest and spoke to many different professional graphic designers and asked them what graphic design tips they live.</p>
                                                                                    </div>
                                                                                </div>
                                                                                <h6 class="fs-16 my-3">Graphic Design</h6>
                                                                                <div class="d-flex mt-2">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2 ">
                                                                                        <p class="text-muted mb-0">Opposites attract, and that’s a fact. It’s in our nature to be interested in the unusual, and that’s why using contrasting colors in Graphic Design is a must. It’s eye-catching, it makes a statement, it’s impressive graphic design. Increase or decrease the letter spacing depending.</p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="d-flex mt-2">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2 ">
                                                                                        <p class="text-muted mb-0">Trust fund seitan letterpress, keytar raw denim keffiyeh etsy art party before they sold out master cleanse gluten-free squid scenester freegan cosby sweater.</p>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <a href="javascript:void(0);" class="btn btn-link link-success fw-medium" data-bs-dismiss="modal">
                                                                                    <i class="ri-close-line me-1 align-middle"></i> Close</a>
                                                                                <button type="button" class="btn btn-primary ">Save changes</button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- Modal -->
                                                                <div class="modal fade" id="exampleModalFullscreenSm" tabindex="-1" aria-labelledby="exampleModalFullscreenSmLabel" aria-hidden="true">
                                                                    <div class="modal-dialog modal-fullscreen-sm-down">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <h5 class="modal-title" id="exampleModalFullscreenSmLabel">Full screen below sm</h5>
                                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                            </div>
                                                                            <div class="modal-body">
                                                                                <h6 class="fs-15">Give your text a good structure</h6>
                                                                                <div class="d-flex">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2">
                                                                                        <p class="text-muted mb-0">Raw denim you probably haven't heard of them jean shorts Austin.
                                                                        Nesciunt tofu stumptown aliqua, retro synth master cleanse.</p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="d-flex mt-2">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2 ">
                                                                                        <p class="text-muted mb-0">Too much or too little spacing, as in the example below, can make things unpleasant for the reader. The goal is to make your text as comfortable to read as possible. </p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="d-flex mt-2">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2 ">
                                                                                        <p class="text-muted mb-0">In some designs, you might adjust your tracking to create a certain artistic effect. It can also help you fix fonts that are poorly spaced to begin with.</p>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <a href="javascript:void(0);" class="btn btn-link link-success fw-medium" data-bs-dismiss="modal">
                                                                                    <i class="ri-close-line me-1 align-middle"></i> Close</a>
                                                                                <button type="button" class="btn btn-primary ">Save changes</button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- Modal -->
                                                                <div class="modal fade" id="exampleModalFullscreenMd" tabindex="-1" aria-labelledby="exampleModalFullscreenMdLabel" aria-hidden="true">
                                                                    <div class="modal-dialog modal-fullscreen-md-down">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <h5 class="modal-title" id="exampleModalFullscreenMdLabel">Full screen below md</h5>
                                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                            </div>
                                                                            <div class="modal-body">
                                                                                <h6 class="fs-15">Give your text a good structure</h6>
                                                                                <div class="d-flex">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2">
                                                                                        <p class="text-muted mb-0">Raw denim you probably haven't heard of them jean shorts Austin.
                                                                        Nesciunt tofu stumptown aliqua, retro synth master cleanse.</p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="d-flex mt-2">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2 ">
                                                                                        <p class="text-muted mb-0">Too much or too little spacing, as in the example below, can make things unpleasant for the reader. The goal is to make your text as comfortable to read as possible. </p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="d-flex mt-2">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2 ">
                                                                                        <p class="text-muted mb-0">In some designs, you might adjust your tracking to create a certain artistic effect. It can also help you fix fonts that are poorly spaced to begin with.</p>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <a href="javascript:void(0);" class="btn btn-link link-success fw-medium" data-bs-dismiss="modal">
                                                                                    <i class="ri-close-line me-1 align-middle"></i> Close</a>
                                                                                <button type="button" class="btn btn-primary ">Save changes</button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- Modal -->
                                                                <div class="modal fade" id="exampleModalFullscreenLg" tabindex="-1" aria-labelledby="exampleModalFullscreenLgLabel" aria-hidden="true">
                                                                    <div class="modal-dialog modal-fullscreen-lg-down">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <h5 class="modal-title" id="exampleModalFullscreenLgLabel">Full screen below lg</h5>
                                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                            </div>
                                                                            <div class="modal-body">
                                                                                <h6 class="fs-15">Give your text a good structure</h6>
                                                                                <div class="d-flex">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2">
                                                                                        <p class="text-muted mb-0">Raw denim you probably haven't heard of them jean shorts Austin.
                                                                        Nesciunt tofu stumptown aliqua, retro synth master cleanse.</p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="d-flex mt-2">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2 ">
                                                                                        <p class="text-muted mb-0">Too much or too little spacing, as in the example below, can make things unpleasant for the reader. The goal is to make your text as comfortable to read as possible. </p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="d-flex mt-2">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2 ">
                                                                                        <p class="text-muted mb-0">In some designs, you might adjust your tracking to create a certain artistic effect. It can also help you fix fonts that are poorly spaced to begin with.</p>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <a href="javascript:void(0);" class="btn btn-link link-success fw-medium" data-bs-dismiss="modal">
                                                                                    <i class="ri-close-line me-1 align-middle"></i> Close</a>
                                                                                <button type="button" class="btn btn-primary ">Save changes</button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- Modal -->
                                                                <div class="modal fade" id="exampleModalFullscreenXl" tabindex="-1" aria-labelledby="exampleModalFullscreenXlLabel" aria-hidden="true">
                                                                    <div class="modal-dialog modal-fullscreen-sm-down">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <h5 class="modal-title" id="exampleModalFullscreenXlLabel">Full screen below xl</h5>
                                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                            </div>
                                                                            <div class="modal-body">
                                                                                <h6 class="fs-15">Give your text a good structure</h6>
                                                                                <div class="d-flex">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2">
                                                                                        <p class="text-muted mb-0">Raw denim you probably haven't heard of them jean shorts Austin.
                                                                        Nesciunt tofu stumptown aliqua, retro synth master cleanse.</p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="d-flex mt-2">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2 ">
                                                                                        <p class="text-muted mb-0">Too much or too little spacing, as in the example below, can make things unpleasant for the reader. The goal is to make your text as comfortable to read as possible. </p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="d-flex mt-2">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2 ">
                                                                                        <p class="text-muted mb-0">In some designs, you might adjust your tracking to create a certain artistic effect. It can also help you fix fonts that are poorly spaced to begin with.</p>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <a href="javascript:void(0);" class="btn btn-link link-success fw-medium" data-bs-dismiss="modal">
                                                                                    <i class="ri-close-line me-1 align-middle"></i> Close</a>
                                                                                <button type="button" class="btn btn-primary ">Save changes</button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- Modal -->
                                                                <div class="modal fade" id="exampleModalFullscreenXxl" tabindex="-1" aria-labelledby="exampleModalFullscreenXxlLabel" aria-hidden="true">
                                                                    <div class="modal-dialog modal-fullscreen-xxl-down">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <h5 class="modal-title" id="exampleModalFullscreenXxlLabel">Full screen below xxl</h5>
                                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                            </div>
                                                                            <div class="modal-body">
                                                                                <h6 class="fs-15">Give your text a good structure</h6>
                                                                                <div class="d-flex">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2">
                                                                                        <p class="text-muted mb-0">Raw denim you probably haven't heard of them jean shorts Austin.
                                                                        Nesciunt tofu stumptown aliqua, retro synth master cleanse.</p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="d-flex mt-2">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2 ">
                                                                                        <p class="text-muted mb-0">Too much or too little spacing, as in the example below, can make things unpleasant for the reader. The goal is to make your text as comfortable to read as possible. </p>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="d-flex mt-2">
                                                                                    <div class="flex-shrink-0">
                                                                                        <i class="ri-checkbox-circle-fill text-success"></i>
                                                                                    </div>
                                                                                    <div class="flex-grow-1 ms-2 ">
                                                                                        <p class="text-muted mb-0">In some designs, you might adjust your tracking to create a certain artistic effect. It can also help you fix fonts that are poorly spaced to begin with.</p>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <a href="javascript:void(0);" class="btn btn-link link-success fw-medium" data-bs-dismiss="modal">
                                                                                    <i class="ri-close-line me-1 align-middle"></i> Close</a>
                                                                                <button type="button" class="btn btn-primary ">Save changes</button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="d-none code-view">
                                                            <pre class="language-markup">
                                                                <code>&lt;!-- Fullscreen Modals --&gt;
&lt;div class=&quot;modal-dialog modal-fullscreen&quot;&gt;...&lt;/div&gt;</code>

                                                                <code>&lt;div class=&quot;modal-dialog modal-fullscreen-sm-down&quot;&gt;...&lt;/div&gt;</code>

                                                                <code>&lt;div class=&quot;modal-dialog modal-fullscreen-md-down&quot;&gt;...&lt;/div&gt;</code>

                                                                <code>&lt;div class=&quot;modal-dialog modal-fullscreen-lg-down&quot;&gt;...&lt;/div&gt;</code>

                                                                <code>&lt;div class=&quot;modal-dialog modal-fullscreen-xl-down&quot;&gt;...&lt;/div&gt;</code>

                                                                <code>&lt;div class=&quot;modal-dialog modal-fullscreen-xxl-down&quot;&gt;...&lt;/div&gt;</code>
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
                                                        <h4 class="card-title mb-0 flex-grow-1">Animation Modals</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="animation-modal-showcode" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="animation-modal-showcode"></input>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->
                                                    <div class="card-body">
                                                        <p class="text-muted">Use <code>fadeInRight</code>,                                                            <code>fadeInLeft</code>,                                                            <code>fadeInUp</code>,                                                            <code>flip</code>, or <code>zoomIn</code> class to modal class to set different modal with animation effect respectively.</p>
                                                        <div class="live-preview">
                                                            <div>
                                                                <div class="hstack gap-2 flex-wrap">
                                                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#fadeInRightModal">Fade In Right Modal</button>
                                                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#fadeInleftModal">Fade In Left Modal</button>
                                                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#fadeInUpModal">Fade In Up Modal</button>
                                                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#flipModal">Flip Modal</button>
                                                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#zoomInModal">Zoom In Modal</button>
                                                                </div>
                                                                <div id="fadeInRightModal" class="modal fade fadeInRight" tabindex="-1" aria-labelledby="fadeInRightModalLabel" aria-hidden="true" style="display: none;">
                                                                    <div class="modal-dialog modal-dialog-centered">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <h5 class="modal-title" id="fadeInRightModalLabel">Modal Heading</h5>
                                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                            </div>
                                                                            <div class="modal-body">
                                                                                <h5 class="fs-16">
                                                                Overflowing text to show scroll behavior
                                                                                </h5>
                                                                                <p class="text-muted">One morning, when Gregor Samsa woke from troubled dreams, he found himself transformed in his bed into a horrible vermin. He lay on his armour-like back, and if he lifted his head a little he could see his brown belly, slightly domed and divided by arches into stiff sections.</p>
                                                                                <p class="text-muted">The bedding was hardly able to cover it and seemed ready to slide off any moment. His many legs, pitifully thin compared with the size of the rest of him, waved about helplessly as he looked. "What's happened to me?" he thought.</p>
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
                                                                                <button type="button" class="btn btn-primary ">Save Changes</button>
                                                                            </div>

                                                                        </div>                                                                        <!-- /.modal-content -->
                                                                    </div>                                                                    <!-- /.modal-dialog -->
                                                                </div>                                                                <!-- /.modal -->
                                                                <div id="fadeInleftModal" class="modal fade fadeInLeft" tabindex="-1" aria-labelledby="fadeInleftModalLabel" aria-hidden="true" style="display: none;">
                                                                    <div class="modal-dialog modal-dialog-centered">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <h5 class="modal-title" id="fadeInleftModalLabel">Modal Heading</h5>
                                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                            </div>
                                                                            <div class="modal-body">
                                                                                <h5 class="fs-16">
                                                                Overflowing text to show scroll behavior
                                                                                </h5>
                                                                                <p class="text-muted">One morning, when Gregor Samsa woke from troubled dreams, he found himself transformed in his bed into a horrible vermin. He lay on his armour-like back, and if he lifted his head a little he could see his brown belly, slightly domed and divided by arches into stiff sections.</p>
                                                                                <p class="text-muted">The bedding was hardly able to cover it and seemed ready to slide off any moment. His many legs, pitifully thin compared with the size of the rest of him, waved about helplessly as he looked. "What's happened to me?" he thought.</p>
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
                                                                                <button type="button" class="btn btn-primary ">Save Changes</button>
                                                                            </div>

                                                                        </div>                                                                        <!-- /.modal-content -->
                                                                    </div>                                                                    <!-- /.modal-dialog -->
                                                                </div>                                                                <!-- /.modal -->
                                                                <!-- Modal fadeInUp -->
                                                                <div id="fadeInUpModal" class="modal fade fadeInUp" tabindex="-1" aria-labelledby="fadeInUpModalLabel" aria-hidden="true" style="display: none;">
                                                                    <div class="modal-dialog modal-dialog-centered">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <h5 class="modal-title" id="fadeInUpModalLabel">Modal Heading</h5>
                                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                            </div>
                                                                            <div class="modal-body">
                                                                                <h5 class="fs-16">
                                                                Overflowing text to show scroll behavior
                                                                                </h5>
                                                                                <p class="text-muted">One morning, when Gregor Samsa woke from troubled dreams, he found himself transformed in his bed into a horrible vermin. He lay on his armour-like back, and if he lifted his head a little he could see his brown belly, slightly domed and divided by arches into stiff sections.</p>
                                                                                <p class="text-muted">The bedding was hardly able to cover it and seemed ready to slide off any moment. His many legs, pitifully thin compared with the size of the rest of him, waved about helplessly as he looked. "What's happened to me?" he thought.</p>
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
                                                                                <button type="button" class="btn btn-primary ">Save Changes</button>
                                                                            </div>

                                                                        </div>                                                                        <!-- /.modal-content -->
                                                                    </div>                                                                    <!-- /.modal-dialog -->
                                                                </div>                                                                <!-- /.modal -->

                                                                <!-- Modal flip -->
                                                                <div id="flipModal" class="modal fade flip" tabindex="-1" aria-labelledby="flipModalLabel" aria-hidden="true" style="display: none;">
                                                                    <div class="modal-dialog modal-dialog-centered">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <h5 class="modal-title" id="flipModalLabel">Modal Heading</h5>
                                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                            </div>
                                                                            <div class="modal-body">
                                                                                <h5 class="fs-16">
                                                                Overflowing text to show scroll behavior
                                                                                </h5>
                                                                                <p class="text-muted">One morning, when Gregor Samsa woke from troubled dreams, he found himself transformed in his bed into a horrible vermin. He lay on his armour-like back, and if he lifted his head a little he could see his brown belly, slightly domed and divided by arches into stiff sections.</p>
                                                                                <p class="text-muted">The bedding was hardly able to cover it and seemed ready to slide off any moment. His many legs, pitifully thin compared with the size of the rest of him, waved about helplessly as he looked. "What's happened to me?" he thought.</p>
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
                                                                                <button type="button" class="btn btn-primary ">Save Changes</button>
                                                                            </div>

                                                                        </div>                                                                        <!-- /.modal-content -->
                                                                    </div>                                                                    <!-- /.modal-dialog -->
                                                                </div>                                                                <!-- /.modal -->

                                                                <!-- Modal Blur -->
                                                                <div id="zoomInModal" class="modal fade zoomIn" tabindex="-1" aria-labelledby="zoomInModalLabel" aria-hidden="true" style="display: none;">
                                                                    <div class="modal-dialog modal-dialog-centered">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <h5 class="modal-title" id="zoomInModalLabel">Modal Heading</h5>
                                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                            </div>
                                                                            <div class="modal-body">
                                                                                <h5 class="fs-16">
                                                                Overflowing text to show scroll behavior
                                                                                </h5>
                                                                                <p class="text-muted">One morning, when Gregor Samsa woke from troubled dreams, he found himself transformed in his bed into a horrible vermin. He lay on his armour-like back, and if he lifted his head a little he could see his brown belly, slightly domed and divided by arches into stiff sections.</p>
                                                                                <p class="text-muted">The bedding was hardly able to cover it and seemed ready to slide off any moment. His many legs, pitifully thin compared with the size of the rest of him, waved about helplessly as he looked. "What's happened to me?" he thought.</p>
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
                                                                                <button type="button" class="btn btn-primary ">Save Changes</button>
                                                                            </div>

                                                                        </div>                                                                        <!-- /.modal-content -->
                                                                    </div>                                                                    <!-- /.modal-dialog -->
                                                                </div>                                                                <!-- /.modal -->
                                                            </div>
                                                        </div>
                                                        <div class="d-none code-view">
                                                            <pre class="language-markup">
                                                                <code>&lt;!-- Animation Modals --&gt;
&lt;div class=&quot;modal fade fadeInRight&quot;&gt;...&lt;/div&gt;</code>

                                                                <code>&lt;div class=&quot;modal fade fadeInLeft&quot;&gt;...&lt;/div&gt;</code>

                                                                <code>&lt;div class=&quot;modal fadeInUp&quot;&gt;...&lt;/div&gt;</code>

                                                                <code>&lt;div class=&quot;modal flip&quot;&gt;...&lt;/div&gt;</code>

                                                                <code>&lt;div class=&quot;modal zoomIn&quot;&gt;...&lt;/div&gt;</code>
                                                            </pre>
                                                        </div>
                                                    </div>                                                    <!-- end card-body -->
                                                </div>                                                <!-- end card -->
                                            </div>
                                        </div>
                                        <!---end row-->

                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="card">
                                                    <div class="card-header align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">Modal Positions</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="positions-modal-showcode" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="positions-modal-showcode"></input>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->
                                                    <div class="card-body">
                                                        <p class="text-muted text-muted">Use <code>modal-dialog-right</code>,                                                            <code>modal-dialog-bottom</code>, or <code>modal-dialog-bottom-right</code> class to modal-dialog class to set modal at different positions respectively.</p>
                                                        <div class="live-preview">
                                                            <div>
                                                                <div class="hstack gap-2 flex-wrap">
                                                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#topmodal">Top Modal</button>
                                                                    <button type="button" class="btn btn-secondary " data-bs-toggle="modal" data-bs-target="#top-rightmodal">Top Right Modal</button>
                                                                    <button type="button" class="btn btn-success " data-bs-toggle="modal" data-bs-target="#bottomModal">Bottom Modal</button>
                                                                    <button type="button" class="btn btn-danger " data-bs-toggle="modal" data-bs-target="#bottom-rightModal">Bottom Right Modal</button>
                                                                </div>
                                                                <div id="topmodal" class="modal fade" tabindex="-1" aria-hidden="true" style="display: none;">
                                                                    <div class="modal-dialog">
                                                                        <div class="modal-content">
                                                                            <div class="modal-body text-center p-5">
                                                                                <lord-icon src="https://cdn.lordicon.com/pithnlch.json" trigger="loop" colors="primary:#121331,secondary:#08a88a" style="width:120px;height:120px">
                                                                                </lord-icon>
                                                                                <div class="mt-4">
                                                                                    <h4 class="mb-3">Your event has been created.</h4>
                                                                                    <p class="text-muted mb-4"> The transfer was not successfully received by us. the email of the recipient wasn't correct.</p>
                                                                                    <div class="hstack gap-2 justify-content-center">
                                                                                        <a href="javascript:void(0);" class="btn btn-link link-success fw-medium" data-bs-dismiss="modal">
                                                                                            <i class="ri-close-line me-1 align-middle"></i> Close</a>
                                                                                        <a href="javascript:void(0);" class="btn btn-success">Completed</a>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>                                                                        <!-- /.modal-content -->
                                                                    </div>                                                                    <!-- /.modal-dialog -->
                                                                </div>                                                                <!-- /.modal -->
                                                                <div id="top-rightmodal" class="modal fade" tabindex="-1" aria-hidden="true" style="display: none;">
                                                                    <div class="modal-dialog modal-dialog-right">
                                                                        <div class="modal-dialog">
                                                                            <div class="modal-content">
                                                                                <div class="modal-body text-center p-5">
                                                                                    <lord-icon src="https://cdn.lordicon.com/pithnlch.json" trigger="loop" colors="primary:#121331,secondary:#08a88a" style="width:120px;height:120px"></lord-icon>
                                                                                    <div class="mt-4">
                                                                                        <h4 class="mb-3">Your event has been created.</h4>
                                                                                        <p class="text-muted mb-4"> The transfer was not successfully received by us. the email of the recipient wasn't correct.</p>
                                                                                        <div class="hstack gap-2 justify-content-center">
                                                                                            <a href="javascript:void(0);" class="btn btn-link link-success fw-medium" data-bs-dismiss="modal">
                                                                                                <i class="ri-close-line me-1 align-middle"></i> Close</a>
                                                                                            <a href="javascript:void(0);" class="btn btn-success">Completed</a>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>                                                                            <!-- /.modal-content -->
                                                                        </div>                                                                        <!-- /.modal-dialog -->
                                                                    </div>                                                                    <!-- /.modal-dialog -->
                                                                </div>                                                                <!-- /.modal -->
                                                                <!-- Modal fadeInUp -->
                                                                <div id="bottomModal" class="modal fade" tabindex="-1" aria-hidden="true" style="display: none;">
                                                                    <div class="modal-dialog modal-dialog-bottom">
                                                                        <div class="modal-content">
                                                                            <div class="modal-body text-center p-5">
                                                                                <lord-icon src="https://cdn.lordicon.com/pithnlch.json" trigger="loop" colors="primary:#121331,secondary:#08a88a" style="width:120px;height:120px"></lord-icon>
                                                                                <div class="mt-4">
                                                                                    <h4 class="mb-3">Your event has been created.</h4>
                                                                                    <p class="text-muted mb-4">The transfer was not successfully received by us. the email of the recipient wasn't correct.</p>
                                                                                    <div class="hstack gap-2 justify-content-center">
                                                                                        <a href="javascript:void(0);" class="btn btn-link link-success fw-medium" data-bs-dismiss="modal">
                                                                                            <i class="ri-close-line me-1 align-middle"></i> Close</a>
                                                                                        <a href="javascript:void(0);" class="btn btn-success">Completed</a>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>                                                                        <!-- /.modal-content -->
                                                                    </div>                                                                    <!-- /.modal-dialog -->
                                                                </div>                                                                <!-- /.modal -->

                                                                <!-- Modal flip -->
                                                                <div id="bottom-rightModal" class="modal fade" tabindex="-1" aria-hidden="true" style="display: none;">
                                                                    <div class="modal-dialog modal-dialog-bottom-right">
                                                                        <div class="modal-content">
                                                                            <div class="modal-body text-center p-5">
                                                                                <lord-icon src="https://cdn.lordicon.com/pithnlch.json" trigger="loop" colors="primary:#121331,secondary:#08a88a" style="width:120px;height:120px"></lord-icon>
                                                                                <div class="mt-4">
                                                                                    <h4 class="mb-3">Your event has been created.</h4>
                                                                                    <p class="text-muted mb-4"> The transfer was not successfully received by us. the email of the recipient wasn't correct.</p>
                                                                                    <div class="hstack gap-2 justify-content-center">
                                                                                        <a href="javascript:void(0);" class="btn btn-link link-success fw-medium" data-bs-dismiss="modal">
                                                                                            <i class="ri-close-line me-1 align-middle"></i> Close</a>
                                                                                        <a href="javascript:void(0);" class="btn btn-success">Completed</a>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>                                                                        <!-- /.modal-content -->
                                                                    </div>                                                                    <!-- /.modal-dialog -->
                                                                </div>                                                                <!-- /.modal -->
                                                            </div>
                                                        </div>
                                                        <div class="d-none code-view">
                                                            <pre class="language-markup">
                                                                <code>&lt;!-- Animation Modals --&gt;
&lt;div class=&quot;modal-dialog&quot;&gt;...&lt;/div&gt;</code>

                                                                <code>&lt;div class=&quot;modal-dialog modal-dialog-right&quot;&gt;...&lt;/div&gt;</code>

                                                                <code>&lt;div class=&quot;modal-dialog modal-dialog-bottom&quot;&gt;...&lt;/div&gt;</code>

                                                                <code>&lt;div class=&quot;modal-dialog modal-dialog-bottom-right&quot;&gt;...&lt;/div&gt;</code>
                                                            </pre>
                                                        </div>
                                                    </div>                                                    <!-- end card-body -->
                                                </div>                                                <!-- end card -->
                                            </div>
                                        </div>
                                        <!---end row-->

                                        <div class="row mt-2">
                                            <div class="col-lg-12">
                                                <div class="justify-content-between d-flex align-items-center mb-3">
                                                    <h5 class="mb-0 pb-1 text-decoration-underline">Custom Modals Example</h5>
                                                </div>
                                                <div class="row">
                                                    <div class="col-xl-4 col-md-6">
                                                        <div class="card text-center border">
                                                            <div class="card-body p-4 pb-0">

                                                                <h5 class="mb-4">Success Message</h5>
                                                                <p class="text-muted">Here is an example of a sweet alert with a success message.</p>
                                                                <div>
                                                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#success-Payment">Click me</button>
                                                                </div>

                                                                <div class="row justify-content-center mt-2">
                                                                    <div class="col-lg-10">
                                                                        <div>
                                                                            <img src="{$themePath}/assets/images/modals/success-payment.png" alt="Mac Image" class="img-fluid"></img>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>                                                            <!-- end card body -->
                                                        </div>                                                        <!-- end card -->
                                                        <div id="success-Payment" class="modal fade" tabindex="-1" aria-hidden="true" style="display: none;">
                                                            <div class="modal-dialog modal-dialog-centered">
                                                                <div class="modal-content">
                                                                    <div class="modal-body text-center p-5">
                                                                        <div class="text-end">
                                                                            <button type="button" class="btn-close text-end" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                        </div>
                                                                        <div class="mt-2">
                                                                            <lord-icon src="https://cdn.lordicon.com/tqywkdcz.json" trigger="hover" style="width:150px;height:150px">
                                                                            </lord-icon>
                                                                            <h4 class="mb-3 mt-4">Your Transaction is Successfull !</h4>
                                                                            <p class="text-muted fs-15 mb-4">Successful transaction is the status of operation whose result is the payment of the amount paid by the customer in favor of the merchant.</p>
                                                                            <div class="hstack gap-2 justify-content-center">
                                                                                <button class="btn btn-primary">New transaction</button>
                                                                                <button class="btn btn-soft-success">
                                                                                    <i class="ri-links-line align-bottom"></i> Copy tracking link</button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="modal-footer bg-light p-3 justify-content-center">
                                                                        <p class="mb-0 text-muted">You like our service? <a href="javascript:void(0)" class="link-secondary fw-semibold">Invite Friends</a>
                                                                        </p>
                                                                    </div>
                                                                </div>                                                                <!-- /.modal-content -->
                                                            </div>                                                            <!-- /.modal-dialog -->
                                                        </div>                                                        <!-- /.modal -->
                                                    </div>                                                    <!-- end col -->

                                                    <div class="col-xl-4 col-md-6">
                                                        <div class="card text-center border">
                                                            <div class="card-body p-4 pb-0">
                                                                <h5 class="mb-4">Login Modals</h5>
                                                                <p class="text-muted">Here is an example of a sweet alert with a error message.</p>
                                                                <div>
                                                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#loginModals">Click me</button>
                                                                </div>

                                                                <div class="row justify-content-center mt-2">
                                                                    <div class="col-lg-10">
                                                                        <div>
                                                                            <img src="{$themePath}/assets/images/modals/login.png" alt="Mac Image" class="img-fluid"></img>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>                                                            <!-- end card body -->
                                                        </div>                                                        <!-- end card -->
                                                        <div id="loginModals" class="modal fade" tabindex="-1" aria-hidden="true" style="display: none;">
                                                            <div class="modal-dialog modal-dialog-centered">
                                                                <div class="modal-content border-0 overflow-hidden">
                                                                    <div class="modal-body login-modal p-5">
                                                                        <h5 class="text-white fs-20">Login</h5>
                                                                        <p class="text-white-50 mb-4">Don't have an account? <a href="javascript:void(0);" class="text-white">Sign Up.</a>
                                                                        </p>
                                                                        <div class="vstack gap-2 justify-content-center">
                                                                            <button class="btn btn-light">
                                                                                <i class="ri-google-fill align-bottom text-danger"></i> Google</button>
                                                                            <button class="btn btn-info">
                                                                                <i class="ri-facebook-fill align-bottom"></i> Facebook</button>
                                                                        </div>
                                                                    </div>
                                                                    <div class="modal-body p-5">
                                                                        <h5 class="mb-3">Login with Email</h5>
                                                                        <form>
                                                                            <div class="mb-2">
                                                                                <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter your email/username"></input>
                                                                            </div>
                                                                            <div class="mb-3">
                                                                                <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Enter your password">
                                                                                    <div class="mt-1 text-end">
                                                                                        <a href="auth-pass-reset-basic.html">Forgot password ?</a>
                                                                                    </div>
                                                                                </input>
                                                                            </div>
                                                                            <button type="submit" class="btn btn-primary w-100">Submit</button>
                                                                        </form>
                                                                    </div>
                                                                </div>                                                                <!-- /.modal-content -->
                                                            </div>                                                            <!-- /.modal-dialog -->
                                                        </div>                                                        <!-- /.modal -->
                                                    </div>                                                    <!-- end col -->

                                                    <div class="col-xl-4 col-md-6">
                                                        <div class="card text-center border">
                                                            <div class="card-body p-4 pb-0">
                                                                <h5 class="mb-4">Subscribe Modals</h5>
                                                                <p class="text-muted">Here is an example of a sweet alert with a warning message.</p>
                                                                <div>
                                                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#subscribeModals">Click me</button>
                                                                </div>

                                                                <div class="row justify-content-center mt-2">
                                                                    <div class="col-lg-10">
                                                                        <div>
                                                                            <img src="{$themePath}/assets/images/modals/subscribe.png" alt="Mac Image" class="img-fluid"></img>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>                                                            <!-- end card body -->
                                                        </div>                                                        <!-- end card -->

                                                        <div id="subscribeModals" class="modal fade" tabindex="-1" aria-hidden="true" style="display: none;">
                                                            <div class="modal-dialog modal-dialog-centered modal-lg">
                                                                <div class="modal-content border-0 overflow-hidden">
                                                                    <div class="row g-0">
                                                                        <div class="col-lg-7">
                                                                            <div class="modal-body p-5">
                                                                                <h2 class="lh-base">Subscribe now today to get <span class="text-danger">20% off</span> experiences!</h2>
                                                                                <p class="text-muted mb-4">A free bet is a bet which is provided by a betting site for a customer to place and then benefit from the winnings. Free bets are commonly used as welcome offers.</p>
                                                                                <div class="input-group mb-3">

                                                                                    <input type="text" class="form-control" placeholder="Enter your email" aria-label="Example text with button addon" aria-describedby="button-addon1">
                                                                                        <button class="btn btn-primary" type="button" id="button-addon1">Subscript Now</button>
                                                                                    </input>
                                                                                </div>

                                                                                <div class="form-check">
                                                                                    <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                                                                        <label class="form-check-label" for="exampleCheck1">By subscribing to a particular channel or user on YouTube, you can receive instant updates.</label>
                                                                                    </input>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-5">
                                                                            <div class="subscribe-modals-cover h-100">
                                                                                <img src="{$themePath}/assets/images/auth-one-bg.jpg" alt="" class="h-100 w-100 object-cover" style="clip-path: polygon(100% 0%, 100% 100%, 100% 100%, 0% 100%, 25% 50%, 0% 0%);"></img>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>                                                                <!-- /.modal-content -->
                                                            </div>                                                            <!-- /.modal-dialog -->
                                                        </div>                                                        <!-- /.modal -->
                                                    </div>                                                    <!-- end col -->

                                                    <div class="col-xl-4 col-md-6">
                                                        <div class="card text-center border">
                                                            <div class="card-body p-4 pb-0">
                                                                <h5 class="mb-4">Sign Up Modals</h5>
                                                                <p class="text-muted">Here is an example of a sweet alert with a community registration field. </p>

                                                                <div>
                                                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#signupModals">Click me</button>
                                                                </div>

                                                                <div class="row justify-content-center mt-2">
                                                                    <div class="col-lg-10">
                                                                        <div>
                                                                            <img src="{$themePath}/assets/images/modals/signup.png" alt="Mac Image" class="img-fluid"></img>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>                                                            <!-- end card body -->
                                                        </div>                                                        <!-- end card -->
                                                        <div id="signupModals" class="modal fade" tabindex="-1" aria-hidden="true" style="display: none;">
                                                            <div class="modal-dialog modal-dialog-centered">
                                                                <div class="modal-content border-0 overflow-hidden">
                                                                    <div class="modal-header p-3">
                                                                        <h4 class="card-title mb-0">Sign Up</h4>
                                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                    </div>
                                                                    <div class="alert alert-success  rounded-0 mb-0">
                                                                        <p class="mb-0">Up to <span class="fw-semibold">50% OFF</span>, Hurry up before the stock ends</p>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        <form>
                                                                            <div class="mb-3">
                                                                                <label for="fullName" class="form-label">Full Name</label>
                                                                                <input type="text" class="form-control" id="fullName" placeholder="Enter your name"></input>
                                                                            </div>
                                                                            <div class="mb-3">
                                                                                <label for="emailInput" class="form-label">Email address</label>
                                                                                <input type="email" class="form-control" id="emailInput" placeholder="Enter your email"></input>
                                                                            </div>
                                                                            <div class="mb-3">
                                                                                <label for="exampleInputPassword1" class="form-label">Password</label>
                                                                                <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Enter your password"></input>
                                                                            </div>
                                                                            <div class="mb-3 form-check">
                                                                                <input type="checkbox" class="form-check-input" id="checkTerms">
                                                                                    <label class="form-check-label" for="checkTerms">I agree to the <span class="fw-semibold">Terms of Service</span> and Privacy Policy</label>
                                                                                </input>
                                                                            </div>
                                                                            <div class="text-end">
                                                                                <button type="submit" class="btn btn-primary">Sign Up Now</button>
                                                                            </div>
                                                                        </form>
                                                                    </div>
                                                                </div>                                                                <!-- /.modal-content -->
                                                            </div>                                                            <!-- /.modal-dialog -->
                                                        </div>                                                        <!-- /.modal -->
                                                    </div>                                                    <!-- end col -->
                                                </div>                                                <!-- end row -->
                                            </div>                                            <!-- end col -->
                                        </div>
                                        <!--end row-->

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
