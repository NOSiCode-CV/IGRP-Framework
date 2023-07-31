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
                                                        <h4 class="card-title mb-0 flex-grow-1">Form Grid</h4>
                                                        <div class="flex-shrink-0">
                                                            <div class="form-check form-switch form-switch-right form-switch-md">
                                                                <label for="form-grid-showcode" class="form-label text-muted">Show Code</label>
                                                                <input class="form-check-input code-switcher" type="checkbox" id="form-grid-showcode"></input>
                                                            </div>
                                                        </div>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body">
                                                        <p class="text-muted">More complex forms can be built using our grid classes. Use these for form layouts that require multiple columns, varied widths, and additional alignment options. <span class="fw-medium">Requires the <code>$enable-grid-classes</code> Sass variable to be enabled</span> (on by default).</p>
                                                    <div class="live-preview">
                                                        <form action="javascript:void(0);">
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="mb-3">
                                                                        <label for="firstNameinput" class="form-label">First Name</label>
                                                                        <input type="text" class="form-control" placeholder="Enter your firstname" id="firstNameinput"></input>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->
                                                                <div class="col-md-6">
                                                                    <div class="mb-3">
                                                                        <label for="lastNameinput" class="form-label">Last Name</label>
                                                                        <input type="text" class="form-control" placeholder="Enter your lastname" id="lastNameinput"></input>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->
                                                                <div class="col-md-12">
                                                                    <div class="mb-3">
                                                                        <label for="compnayNameinput" class="form-label">Company Name</label>
                                                                        <input type="text" class="form-control" placeholder="Enter company name" id="compnayNameinput"></input>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->
                                                                <div class="col-md-6">
                                                                    <div class="mb-3">
                                                                        <label for="phonenumberInput" class="form-label">Phone Number</label>
                                                                        <input type="tel" class="form-control" placeholder="+(245) 451 45123" id="phonenumberInput"></input>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->
                                                                <div class="col-md-6">
                                                                    <div class="mb-3">
                                                                        <label for="emailidInput" class="form-label">Email Address</label>
                                                                        <input type="email" class="form-control" placeholder="example@gamil.com" id="emailidInput"></input>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->
                                                                <div class="col-md-12">
                                                                    <div class="mb-3">
                                                                        <label for="address1ControlTextarea" class="form-label">Address</label>
                                                                        <input type="text" class="form-control" placeholder="Address 1" id="address1ControlTextarea"></input>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->
                                                                <div class="col-md-6">
                                                                    <div class="mb-3">
                                                                        <label for="citynameInput" class="form-label">City</label>
                                                                        <input type="email" class="form-control" placeholder="Enter your city" id="citynameInput"></input>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->
                                                                <div class="col-md-6">
                                                                    <div class="mb-3">
                                                                        <label for="ForminputState" class="form-label">State</label>
                                                                        <select id="ForminputState" class="form-select" data-choices="" data-choices-sorting="true">
                                                                            <option selected="">Choose...</option>
                                                                            <option>...</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->
                                                                <div class="col-lg-12">
                                                                    <div class="text-end">
                                                                        <button type="submit" class="btn btn-primary">Submit</button>
                                                                    </div>
                                                                </div>
                                                                <!--end col-->
                                                            </div>
                                                            <!--end row-->
                                                        </form>
                                                    </div>
                                                    <div class="d-none code-view">
                                                        <pre class="language-markup" style="height: 375px;">
                                                            <code>&lt;form action=&quot;javascript:void(0);&quot;&gt;
    &lt;div class=&quot;row&quot;&gt;
        &lt;div class=&quot;col-6&quot;&gt;
            &lt;div class=&quot;mb-3&quot;&gt;
                &lt;label for=&quot;firstNameinput&quot; class=&quot;form-label&quot;&gt;First Name&lt;/label&gt;
                &lt;input type=&quot;text&quot; class=&quot;form-control&quot; placeholder=&quot;Enter your firstname&quot; id=&quot;firstNameinput&quot;&gt;
            &lt;/div&gt;
        &lt;/div&gt;&lt;!--end col--&gt;
        &lt;div class=&quot;col-6&quot;&gt;
            &lt;div class=&quot;mb-3&quot;&gt;
                &lt;label for=&quot;lastNameinput&quot; class=&quot;form-label&quot;&gt;Last Name&lt;/label&gt;
                &lt;input type=&quot;text&quot; class=&quot;form-control&quot; placeholder=&quot;Enter your lastname&quot; id=&quot;lastNameinput&quot;&gt;
            &lt;/div&gt;
        &lt;/div&gt;&lt;!--end col--&gt;
        &lt;div class=&quot;col-12&quot;&gt;
            &lt;div class=&quot;mb-3&quot;&gt;
                &lt;label for=&quot;compnayNameinput&quot; class=&quot;form-label&quot;&gt;Company Name&lt;/label&gt;
                &lt;input type=&quot;text&quot; class=&quot;form-control&quot; placeholder=&quot;Enter company name&quot; id=&quot;compnayNameinput&quot;&gt;
            &lt;/div&gt;
        &lt;/div&gt;&lt;!--end col--&gt;
        &lt;div class=&quot;col-6&quot;&gt;
            &lt;div class=&quot;mb-3&quot;&gt;
                &lt;label for=&quot;phonenumberInput&quot; class=&quot;form-label&quot;&gt;Phone Number&lt;/label&gt;
                &lt;input type=&quot;tel&quot; class=&quot;form-control&quot; placeholder=&quot;+(245) 451 45123&quot; id=&quot;phonenumberInput&quot;&gt;
            &lt;/div&gt;
        &lt;/div&gt;&lt;!--end col--&gt;
        &lt;div class=&quot;col-6&quot;&gt;
            &lt;div class=&quot;mb-3&quot;&gt;
                &lt;label for=&quot;emailidInput&quot; class=&quot;form-label&quot;&gt;Email Address&lt;/label&gt;
                &lt;input type=&quot;email&quot; class=&quot;form-control&quot; placeholder=&quot;example@gamil.com&quot; id=&quot;emailidInput&quot;&gt;
            &lt;/div&gt;
        &lt;/div&gt;&lt;!--end col--&gt;
        &lt;div class=&quot;col-12&quot;&gt;
            &lt;div class=&quot;mb-3&quot;&gt;
                &lt;label for=&quot;address1ControlTextarea&quot; class=&quot;form-label&quot;&gt;Address&lt;/label&gt;
                &lt;input type=&quot;text&quot; class=&quot;form-control&quot; placeholder=&quot;Address 1&quot; id=&quot;address1ControlTextarea&quot;&gt;
            &lt;/div&gt;
        &lt;/div&gt;&lt;!--end col--&gt;
        &lt;div class=&quot;col-6&quot;&gt;
            &lt;div class=&quot;mb-3&quot;&gt;
                &lt;label for=&quot;citynameInput&quot; class=&quot;form-label&quot;&gt;City&lt;/label&gt;
                &lt;input type=&quot;email&quot; class=&quot;form-control&quot; placeholder=&quot;Enter your city&quot; id=&quot;citynameInput&quot;&gt;
            &lt;/div&gt;
        &lt;/div&gt;&lt;!--end col--&gt;
        &lt;div class=&quot;col-6&quot;&gt;
            &lt;div class=&quot;mb-3&quot;&gt;
                &lt;label for=&quot;ForminputState&quot; class=&quot;form-label&quot;&gt;State&lt;/label&gt;
                &lt;select id=&quot;ForminputState&quot; class=&quot;form-select&quot;&gt;
                    &lt;option selected&gt;Choose...&lt;/option&gt;
                    &lt;option&gt;...&lt;/option&gt;
                &lt;/select&gt;
            &lt;/div&gt;
        &lt;/div&gt;&lt;!--end col--&gt;
        &lt;div class=&quot;col-lg-12&quot;&gt;
            &lt;div class=&quot;text-end&quot;&gt;
                &lt;button type=&quot;submit&quot; class=&quot;btn btn-primary&quot;&gt;Submit&lt;/button&gt;
            &lt;/div&gt;
        &lt;/div&gt;&lt;!--end col--&gt;
    &lt;/div&gt;&lt;!--end row--&gt;
&lt;/form&gt;</code>
                                                        </pre>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                        <!-- end col -->

                                        <div class="col-xxl-6">
                                            <div class="card">
                                                <div class="card-header align-items-center d-flex">
                                                    <h4 class="card-title mb-0 flex-grow-1">Gutters</h4>
                                                    <div class="flex-shrink-0">
                                                        <div class="form-check form-switch form-switch-right form-switch-md">
                                                            <label for="gutters-showcode" class="form-label text-muted">Show Code</label>
                                                            <input class="form-check-input code-switcher" type="checkbox" id="gutters-showcode"/>
                                                        </div>
                                                    </div>
                                                </div>                                                <!-- end card header -->

                                                <div class="card-body">
                                                    <p class="text-muted">By adding <a href="/docs/5.1/layout/gutters/" class="text-decoration-underline">gutter modifier classes</a>, you can have control over the gutter width in as well the inline as block direction. <span class="fw-medium">Also requires the <code>$enable-grid-classes</code> Sass variable to be enabled</span> (on by default).</p>
                                                <div class="live-preview">
                                                    <form action="javascript:void(0);" class="row g-3">
                                                        <div class="col-md-12">
                                                            <label for="fullnameInput" class="form-label">Name</label>
                                                            <input type="text" class="form-control" id="fullnameInput" placeholder="Enter your name"/>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label for="inputEmail4" class="form-label">Email</label>
                                                            <input type="email" class="form-control" id="inputEmail4" placeholder="Email"/>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label for="inputPassword4" class="form-label">Password</label>
                                                            <input type="password" class="form-control" id="inputPassword4" placeholder="Password"/>
                                                        </div>
                                                        <div class="col-12">
                                                            <label for="inputAddress" class="form-label">Address</label>
                                                            <input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St"/>
                                                        </div>
                                                        <div class="col-12">
                                                            <label for="inputAddress2" class="form-label">Address 2</label>
                                                            <input type="text" class="form-control" id="inputAddress2" placeholder="Apartment, studio, or floor"/>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label for="inputCity" class="form-label">City</label>
                                                            <input type="text" class="form-control" id="inputCity" placeholder="Enter your city"/>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <label for="inputState" class="form-label">State</label>
                                                            <select id="inputState" class="form-select" data-choices="" data-choices-sorting="true">
                                                                <option selected="">Choose...</option>
                                                                <option>...</option>
                                                            </select>
                                                        </div>
                                                        <div class="col-md-2">
                                                            <label for="inputZip" class="form-label">Zip</label>
                                                            <input type="text" class="form-control" id="inputZip" placeholder="Zin code"/>
                                                        </div>
                                                        <div class="col-12">
                                                            <div class="form-check">
                                                                <input class="form-check-input" type="checkbox" id="gridCheck"/>
                                                                <label class="form-check-label" for="gridCheck">
                                                        Check me out
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-12">
                                                            <div class="text-end">
                                                                <button type="submit" class="btn btn-primary">Sign in</button>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="d-none code-view">
                                                    <pre class="language-markup" style="height: 375px;">
                                                        <code>&lt;form action=&quot;javascript:void(0);&quot; class=&quot;row g-3&quot;&gt;
    &lt;div class=&quot;col-md-12&quot;&gt;
        &lt;label for=&quot;fullnameInput&quot; class=&quot;form-label&quot;&gt;Name&lt;/label&gt;
        &lt;input type=&quot;text&quot; class=&quot;form-control&quot; id=&quot;fullnameInput&quot; placeholder=&quot;Enter your name&quot;&gt;
    &lt;/div&gt;
    &lt;div class=&quot;col-md-6&quot;&gt;
        &lt;label for=&quot;inputEmail4&quot; class=&quot;form-label&quot;&gt;Email&lt;/label&gt;
        &lt;input type=&quot;email&quot; class=&quot;form-control&quot; id=&quot;inputEmail4&quot; placeholder=&quot;Email&quot;&gt;
    &lt;/div&gt;
    &lt;div class=&quot;col-md-6&quot;&gt;
        &lt;label for=&quot;inputPassword4&quot; class=&quot;form-label&quot;&gt;Password&lt;/label&gt;
        &lt;input type=&quot;password&quot; class=&quot;form-control&quot; id=&quot;inputPassword4&quot; placeholder=&quot;Password&quot;&gt;
    &lt;/div&gt;
    &lt;div class=&quot;col-12&quot;&gt;
        &lt;label for=&quot;inputAddress&quot; class=&quot;form-label&quot;&gt;Address&lt;/label&gt;
        &lt;input type=&quot;text&quot; class=&quot;form-control&quot; id=&quot;inputAddress&quot; placeholder=&quot;1234 Main St&quot;&gt;
    &lt;/div&gt;
    &lt;div class=&quot;col-12&quot;&gt;
        &lt;label for=&quot;inputAddress2&quot; class=&quot;form-label&quot;&gt;Address 2&lt;/label&gt;
        &lt;input type=&quot;text&quot; class=&quot;form-control&quot; id=&quot;inputAddress2&quot; placeholder=&quot;Apartment, studio, or floor&quot;&gt;
    &lt;/div&gt;
    &lt;div class=&quot;col-md-6&quot;&gt;
        &lt;label for=&quot;inputCity&quot; class=&quot;form-label&quot;&gt;City&lt;/label&gt;
        &lt;input type=&quot;text&quot; class=&quot;form-control&quot; id=&quot;inputCity&quot; placeholder=&quot;Enter your city&quot;&gt;
    &lt;/div&gt;
    &lt;div class=&quot;col-md-4&quot;&gt;
        &lt;label for=&quot;inputState&quot; class=&quot;form-label&quot;&gt;State&lt;/label&gt;
        &lt;select id=&quot;inputState&quot; class=&quot;form-select&quot;&gt;
            &lt;option selected&gt;Choose...&lt;/option&gt;
            &lt;option&gt;...&lt;/option&gt;
        &lt;/select&gt;
    &lt;/div&gt;
    &lt;div class=&quot;col-md-2&quot;&gt;
        &lt;label for=&quot;inputZip&quot; class=&quot;form-label&quot;&gt;Zip&lt;/label&gt;
        &lt;input type=&quot;text&quot; class=&quot;form-control&quot; id=&quot;inputZip&quot; placeholder=&quot;Zin code&quot;&gt;
    &lt;/div&gt;
    &lt;div class=&quot;col-12&quot;&gt;
        &lt;div class=&quot;form-check&quot;&gt;
            &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; id=&quot;gridCheck&quot;&gt;
            &lt;label class=&quot;form-check-label&quot; for=&quot;gridCheck&quot;&gt;
                Check me out
            &lt;/label&gt;
        &lt;/div&gt;
    &lt;/div&gt;
    &lt;div class=&quot;col-12&quot;&gt;
        &lt;div class=&quot;text-end&quot;&gt;
            &lt;button type=&quot;submit&quot; class=&quot;btn btn-primary&quot;&gt;Sign in&lt;/button&gt;
        &lt;/div&gt;
    &lt;/div&gt;
&lt;/form&gt;</code>
                                                    </pre>
                                                </div>
                                            </div>
                                        </div>
                                    </div>                                    <!-- end col -->
                                </div>
                                <!--end row-->

                                <div class="row">
                                    <div class="col-xxl-6">
                                        <div class="card">
                                            <div class="card-header align-items-center d-flex">
                                                <h4 class="card-title mb-0 flex-grow-1">Vertical Form</h4>
                                                <div class="flex-shrink-0">
                                                    <div class="form-check form-switch form-switch-right form-switch-md">
                                                        <label for="vertical-form-showcode" class="form-label text-muted">Show Code</label>
                                                        <input class="form-check-input code-switcher" type="checkbox" id="vertical-form-showcode"/>
                                                    </div>
                                                </div>
                                            </div>                                            <!-- end card header -->
                                            <div class="card-body">
                                                <p class="text-muted">Example of vertical form using <code>form-control</code> class. No need to specify row and col class to create vertical form.</p>
                                                <div class="live-preview">
                                                    <form action="javascript:void(0);">
                                                        <div class="mb-3">
                                                            <label for="employeeName" class="form-label">Employee Name</label>
                                                            <input type="text" class="form-control" id="employeeName" placeholder="Enter emploree name"/>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="employeeUrl" class="form-label">Employee Department URL</label>
                                                            <input type="url" class="form-control" id="employeeUrl" placeholder="Enter emploree url"/>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="StartleaveDate" class="form-label">Start Leave Date</label>
                                                            <input type="date" class="form-control" data-provider="flatpickr" id="StartleaveDate"/>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="EndleaveDate" class="form-label">End Leave Date</label>
                                                            <input type="date" class="form-control" data-provider="flatpickr" id="EndleaveDate"/>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="VertimeassageInput" class="form-label">Message</label>
                                                            <textarea class="form-control" id="VertimeassageInput" rows="3" placeholder="Enter your message"></textarea>
                                                        </div>
                                                        <div class="text-end">
                                                            <button type="submit" class="btn btn-primary">Add Leave</button>
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="d-none code-view">
                                                    <pre class="language-markup" style="height: 375px;">
                                                        <code>&lt;form action=&quot;&quot;&gt;
    &lt;div class=&quot;mb-3&quot;&gt;
        &lt;label for=&quot;employeeName&quot; class=&quot;form-label&quot;&gt;Employee Name&lt;/label&gt;
        &lt;input type=&quot;text&quot; class=&quot;form-control&quot; id=&quot;employeeName&quot; placeholder=&quot;Enter emploree name&quot;&gt;
    &lt;/div&gt;
    &lt;div class=&quot;mb-3&quot;&gt;
        &lt;label for=&quot;employeeUrl&quot; class=&quot;form-label&quot;&gt;Employee Department URL&lt;/label&gt;
        &lt;input type=&quot;url&quot; class=&quot;form-control&quot; id=&quot;employeeUrl&quot; placeholder=&quot;Enter emploree url&quot;&gt;
    &lt;/div&gt;
    &lt;div class=&quot;mb-3&quot;&gt;
        &lt;label for=&quot;StartleaveDate&quot; class=&quot;form-label&quot;&gt;Start Leave Date&lt;/label&gt;
        &lt;input type=&quot;date&quot; class=&quot;form-control&quot; id=&quot;StartleaveDate&quot;&gt;
    &lt;/div&gt;
    &lt;div class=&quot;mb-3&quot;&gt;
        &lt;label for=&quot;EndleaveDate&quot; class=&quot;form-label&quot;&gt;End Leave Date&lt;/label&gt;
        &lt;input type=&quot;date&quot; class=&quot;form-control&quot; id=&quot;EndleaveDate&quot;&gt;
    &lt;/div&gt;
    &lt;div class=&quot;mb-3&quot;&gt;
        &lt;label for=&quot;VertimeassageInput&quot; class=&quot;form-label&quot;&gt;Message&lt;/label&gt;
        &lt;textarea class=&quot;form-control&quot; id=&quot;VertimeassageInput&quot; rows=&quot;3&quot; placeholder=&quot;Enter your message&quot;&gt;&lt;/textarea&gt;
    &lt;/div&gt;
    &lt;div class=&quot;text-end&quot;&gt;
        &lt;button type=&quot;submit&quot; class=&quot;btn btn-primary&quot;&gt;Add Leave&lt;/button&gt;
    &lt;/div&gt;
&lt;/form&gt;</code>
                                                    </pre>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xxl-6">
                                        <div class="card">
                                            <div class="card-header align-items-center d-flex">
                                                <h4 class="card-title mb-0 flex-grow-1">Horizontal Form</h4>
                                                <div class="flex-shrink-0">
                                                    <div class="form-check form-switch form-switch-right form-switch-md">
                                                        <label for="horizontal-form-showcode" class="form-label text-muted">Show Code</label>
                                                        <input class="form-check-input code-switcher" type="checkbox" id="horizontal-form-showcode"/>
                                                    </div>
                                                </div>
                                            </div>                                            <!-- end card header -->
                                            <div class="card-body">
                                                <p class="text-muted">Create horizontal forms with the grid by adding the <code>row</code> class to form groups and using the <code>col-*-*</code> class to specify the width of your labels and controls. Be sure to add <code>col-form-label</code> class to your <code>&lt;label&gt;</code>s as well so they’re vertically centered with their associated form controls.</p>
                                                <div class="live-preview">
                                                    <form action="javascript:void(0);">
                                                        <div class="row mb-3">
                                                            <div class="col-lg-3">
                                                                <label for="nameInput" class="form-label">Name</label>
                                                            </div>
                                                            <div class="col-lg-9">
                                                                <input type="text" class="form-control" id="nameInput" placeholder="Enter your name"/>
                                                            </div>
                                                        </div>
                                                        <div class="row mb-3">
                                                            <div class="col-lg-3">
                                                                <label for="websiteUrl" class="form-label">Website URL</label>
                                                            </div>
                                                            <div class="col-lg-9">
                                                                <input type="url" class="form-control" id="websiteUrl" placeholder="Enter your url"/>
                                                            </div>
                                                        </div>
                                                        <div class="row mb-3">
                                                            <div class="col-lg-3">
                                                                <label for="dateInput" class="form-label">Date</label>
                                                            </div>
                                                            <div class="col-lg-9">
                                                                <input type="date" class="form-control" data-provider="flatpickr" id="dateInput"/>
                                                            </div>
                                                        </div>
                                                        <div class="row mb-3">
                                                            <div class="col-lg-3">
                                                                <label for="timeInput" class="form-label">Time</label>
                                                            </div>
                                                            <div class="col-lg-9">
                                                                <input type="time" class="form-control" data-provider="timepickr" data-time-basic="true" id="timeInput"/>
                                                            </div>
                                                        </div>
                                                        <div class="row mb-3">
                                                            <div class="col-lg-3">
                                                                <label for="leaveemails" class="form-label">Email Id</label>
                                                            </div>
                                                            <div class="col-lg-9">
                                                                <input type="email" class="form-control" id="leaveemails" placeholder="Enter your email"/>
                                                            </div>
                                                        </div>
                                                        <div class="row mb-3">
                                                            <div class="col-lg-3">
                                                                <label for="contactNumber" class="form-label">Contact Number</label>
                                                            </div>
                                                            <div class="col-lg-9">
                                                                <input type="number" class="form-control" id="contactNumber" placeholder="+91 9876543210"/>
                                                            </div>
                                                        </div>
                                                        <div class="row mb-3">
                                                            <div class="col-lg-3">
                                                                <label for="meassageInput" class="form-label">Message</label>
                                                            </div>
                                                            <div class="col-lg-9">
                                                                <textarea class="form-control" id="meassageInput" rows="3" placeholder="Enter your message"></textarea>
                                                            </div>
                                                        </div>
                                                        <div class="text-end">
                                                            <button type="submit" class="btn btn-primary">Add Leave</button>
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="d-none code-view">
                                                    <pre class="language-markup" style="height: 375px;">
                                                        <code>&lt;form action=&quot;&quot;&gt;
    &lt;div class=&quot;row mb-3&quot;&gt;
        &lt;div class=&quot;col-lg-3&quot;&gt;
            &lt;label for=&quot;nameInput&quot; class=&quot;form-label&quot;&gt;Name&lt;/label&gt;
        &lt;/div&gt;
        &lt;div class=&quot;col-lg-9&quot;&gt;
            &lt;input type=&quot;text&quot; class=&quot;form-control&quot; id=&quot;nameInput&quot; placeholder=&quot;Enter your name&quot;&gt;
        &lt;/div&gt;
    &lt;/div&gt;
    &lt;div class=&quot;row mb-3&quot;&gt;
        &lt;div class=&quot;col-lg-3&quot;&gt;
            &lt;label for=&quot;websiteUrl&quot; class=&quot;form-label&quot;&gt;Website URL&lt;/label&gt;
        &lt;/div&gt;
        &lt;div class=&quot;col-lg-9&quot;&gt;
            &lt;input type=&quot;url&quot; class=&quot;form-control&quot; id=&quot;websiteUrl&quot; placeholder=&quot;Enter your url&quot;&gt;
        &lt;/div&gt;
    &lt;/div&gt;
    &lt;div class=&quot;row mb-3&quot;&gt;
        &lt;div class=&quot;col-lg-3&quot;&gt;
            &lt;label for=&quot;dateInput&quot; class=&quot;form-label&quot;&gt;Date&lt;/label&gt;
        &lt;/div&gt;
        &lt;div class=&quot;col-lg-9&quot;&gt;
            &lt;input type=&quot;date&quot; class=&quot;form-control&quot; id=&quot;dateInput&quot;&gt;
        &lt;/div&gt;
    &lt;/div&gt;
    &lt;div class=&quot;row mb-3&quot;&gt;
        &lt;div class=&quot;col-lg-3&quot;&gt;
            &lt;label for=&quot;timeInput&quot; class=&quot;form-label&quot;&gt;Time&lt;/label&gt;
        &lt;/div&gt;
        &lt;div class=&quot;col-lg-9&quot;&gt;
            &lt;input type=&quot;time&quot; class=&quot;form-control&quot; id=&quot;timeInput&quot;&gt;
        &lt;/div&gt;
    &lt;/div&gt;
    &lt;div class=&quot;row mb-3&quot;&gt;
        &lt;div class=&quot;col-lg-3&quot;&gt;
            &lt;label for=&quot;leaveemails&quot; class=&quot;form-label&quot;&gt;Email Id&lt;/label&gt;
        &lt;/div&gt;
        &lt;div class=&quot;col-lg-9&quot;&gt;
            &lt;input type=&quot;email&quot; class=&quot;form-control&quot; id=&quot;leaveemails&quot; placeholder=&quot;Enter your email&quot;&gt;
        &lt;/div&gt;
    &lt;/div&gt;
    &lt;div class=&quot;row mb-3&quot;&gt;
        &lt;div class=&quot;col-lg-3&quot;&gt;
            &lt;label for=&quot;contactNumber&quot; class=&quot;form-label&quot;&gt;Contact Number&lt;/label&gt;
        &lt;/div&gt;
        &lt;div class=&quot;col-lg-9&quot;&gt;
            &lt;input type=&quot;number&quot; class=&quot;form-control&quot; id=&quot;contactNumber&quot; placeholder=&quot;+91 9876543210&quot;&gt;
        &lt;/div&gt;
    &lt;/div&gt;
    &lt;div class=&quot;row mb-3&quot;&gt;
        &lt;div class=&quot;col-lg-3&quot;&gt;
            &lt;label for=&quot;meassageInput&quot; class=&quot;form-label&quot;&gt;Message&lt;/label&gt;
        &lt;/div&gt;
        &lt;div class=&quot;col-lg-9&quot;&gt;
            &lt;textarea class=&quot;form-control&quot; id=&quot;meassageInput&quot; rows=&quot;3&quot; placeholder=&quot;Enter your message&quot;&gt;&lt;/textarea&gt;
        &lt;/div&gt;
    &lt;/div&gt;
    &lt;div class=&quot;text-end&quot;&gt;
        &lt;button type=&quot;submit&quot; class=&quot;btn btn-primary&quot;&gt;Add Leave&lt;/button&gt;
    &lt;/div&gt;
&lt;/form&gt;</code>
                                                    </pre>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--end row-->

                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="card">
                                            <div class="card-header align-items-center d-flex">
                                                <h4 class="card-title mb-0 flex-grow-1">Horizontal Form Label Sizing</h4>
                                                <div class="flex-shrink-0">
                                                    <div class="form-check form-switch form-switch-right form-switch-md">
                                                        <label for="horizontal-form-labelsize-showcode" class="form-label text-muted">Show Code</label>
                                                        <input class="form-check-input code-switcher" type="checkbox" id="horizontal-form-labelsize-showcode"/>
                                                    </div>
                                                </div>
                                            </div>                                            <!-- end card header -->
                                            <div class="card-body">
                                                <p class="text-muted">Use <code>col-form-label-sm</code> class to set small size form label or <code>col-form-label-lg</code> class to set large size form label to &lt;label&gt;. No such class is required for the default size form label.</p>
                                                <div class="live-preview">
                                                    <div class="row align-items-center g-3">
                                                        <div class="col-xxl-4">
                                                            <div class="row">
                                                                <label for="colFormLabelSm" class="col-sm-2 col-form-label col-form-label-sm">Email</label>
                                                                <div class="col-sm-10">
                                                                    <input type="email" class="form-control form-control-sm" id="colFormLabelSm" placeholder="col-form-label-sm"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xxl-4">
                                                            <div class="row">
                                                                <label for="colFormLabel" class="col-sm-2 col-form-label">Email</label>
                                                                <div class="col-sm-10">
                                                                    <input type="email" class="form-control" id="colFormLabel" placeholder="col-form-label"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xxl-4">
                                                            <div class="row">
                                                                <label for="colFormLabelLg" class="col-sm-2 col-form-label col-form-label-lg">Email</label>
                                                                <div class="col-sm-10">
                                                                    <input type="email" class="form-control form-control-lg" id="colFormLabelLg" placeholder="col-form-label-lg"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="d-none code-view">
                                                    <pre class="language-markup" style="height: 275px;">
                                                        <code>&lt;!-- Col Form Label Small --&gt;
&lt;div class=&quot;row&quot;&gt;
    &lt;label for=&quot;colFormLabelSm&quot; class=&quot;col-sm-2 col-form-label col-form-label-sm&quot;&gt;Email&lt;/label&gt;
    &lt;div class=&quot;col-sm-10&quot;&gt;
        &lt;input type=&quot;email&quot; class=&quot;form-control form-control-sm&quot; id=&quot;colFormLabelSm&quot; placeholder=&quot;col-form-label-sm&quot;&gt;
    &lt;/div&gt;
&lt;/div&gt;</code>

                                                        <code>&lt;!-- Col Form Label Default --&gt;
&lt;div class=&quot;row&quot;&gt;
    &lt;label for=&quot;colFormLabel&quot; class=&quot;col-sm-2 col-form-label&quot;&gt;Email&lt;/label&gt;
    &lt;div class=&quot;col-sm-10&quot;&gt;
        &lt;input type=&quot;email&quot; class=&quot;form-control&quot; id=&quot;colFormLabel&quot; placeholder=&quot;col-form-label&quot;&gt;
    &lt;/div&gt;
&lt;/div&gt;</code>

                                                        <code>&lt;!-- Col Form Label Large --&gt;
&lt;div class=&quot;row&quot;&gt;
    &lt;label for=&quot;lg&quot; class=&quot;col-sm-2 col-form-label col-form-label-lg&quot;&gt;Email&lt;/label&gt;
    &lt;div class=&quot;col-sm-10&quot;&gt;
        &lt;input type=&quot;email&quot; class=&quot;form-control form-control-lg&quot; id=&quot;colFormLabelSm&quot; placeholder=&quot;col-form-label-lg&quot;&gt;
    &lt;/div&gt;
&lt;/div&gt;</code>
                                                    </pre>
                                                </div>
                                            </div>
                                        </div>
                                    </div>                                    <!-- end col -->

                                    <div class="col-lg-12">
                                        <div class="card">
                                            <div class="card-header align-items-center d-flex">
                                                <h4 class="card-title mb-0 flex-grow-1">Column Sizing</h4>
                                                <div class="flex-shrink-0">
                                                    <div class="form-check form-switch form-switch-right form-switch-md">
                                                        <label for="column-size-showcode" class="form-label text-muted">Show Code</label>
                                                        <input class="form-check-input code-switcher" type="checkbox" id="column-size-showcode"/>
                                                    </div>
                                                </div>
                                            </div>                                            <!-- end card header -->

                                            <div class="card-body">
                                                <p class="text-muted">Use <code>col-sm-</code> class with required size value to set column size as per your requirement.</p>
                                                <div class="live-preview">
                                                    <div class="row g-3">
                                                        <div class="col-sm-6">
                                                            <input type="text" class="form-control" placeholder="Firstname" aria-label="First-Name"/>
                                                        </div>
                                                        <!--end col-->
                                                        <div class="col-sm-6">
                                                            <input type="text" class="form-control" placeholder="Lastname" aria-label="Last-Name"/>
                                                        </div>
                                                        <!--end col-->
                                                        <div class="col-sm-4">
                                                            <input type="text" class="form-control" placeholder="Email id" aria-label="Email Id"/>
                                                        </div>
                                                        <!--end col-->
                                                        <div class="col-sm-4">
                                                            <input type="password" class="form-control" placeholder="Password" aria-label="Password"/>
                                                        </div>
                                                        <!--end col-->
                                                        <div class="col-sm-4">
                                                            <input type="password" class="form-control" placeholder="Confirm Password" aria-label="confirm-password"/>
                                                        </div>
                                                        <!--end col-->
                                                        <div class="col-sm-7">
                                                            <input type="text" class="form-control" placeholder="City" aria-label="City"/>
                                                        </div>
                                                        <!--end col-->
                                                        <div class="col-sm">
                                                            <input type="text" class="form-control" placeholder="State" aria-label="State"/>
                                                        </div>
                                                        <!--end col-->
                                                        <div class="col-sm">
                                                            <input type="text" class="form-control" placeholder="Zip" aria-label="Zip"/>
                                                        </div>
                                                        <!--end col-->
                                                    </div>
                                                    <!--end row-->
                                                </div>
                                                <div class="d-none code-view">
                                                    <pre class="language-markup" style="height: 275px;">
                                                        <code>&lt;div class=&quot;row g-3&quot;&gt;
    &lt;div class=&quot;col-sm-6&quot;&gt;
        &lt;input type=&quot;text&quot; class=&quot;form-control&quot; placeholder=&quot;Firstname&quot; aria-label=&quot;First-Name&quot;&gt;
    &lt;/div&gt;&lt;!--end col--&gt;
    &lt;div class=&quot;col-sm-6&quot;&gt;
        &lt;input type=&quot;text&quot; class=&quot;form-control&quot; placeholder=&quot;Lastname&quot; aria-label=&quot;Last-Name&quot;&gt;
    &lt;/div&gt;&lt;!--end col--&gt;
    &lt;div class=&quot;col-sm-4&quot;&gt;
        &lt;input type=&quot;text&quot; class=&quot;form-control&quot; placeholder=&quot;Email id&quot; aria-label=&quot;Email Id&quot;&gt;
    &lt;/div&gt;&lt;!--end col--&gt;
    &lt;div class=&quot;col-sm-4&quot;&gt;
        &lt;input type=&quot;password&quot; class=&quot;form-control&quot; placeholder=&quot;Password&quot; aria-label=&quot;Password&quot;&gt;
    &lt;/div&gt;&lt;!--end col--&gt;
    &lt;div class=&quot;col-sm-4&quot;&gt;
        &lt;input type=&quot;password&quot; class=&quot;form-control&quot; placeholder=&quot;Confirm Password&quot; aria-label=&quot;confirm-password&quot;&gt;
    &lt;/div&gt;&lt;!--end col--&gt;
    &lt;div class=&quot;col-sm-7&quot;&gt;
        &lt;input type=&quot;text&quot; class=&quot;form-control&quot; placeholder=&quot;City&quot; aria-label=&quot;City&quot;&gt;
    &lt;/div&gt;&lt;!--end col--&gt;
    &lt;div class=&quot;col-sm&quot;&gt;
        &lt;input type=&quot;text&quot; class=&quot;form-control&quot; placeholder=&quot;State&quot; aria-label=&quot;State&quot;&gt;
    &lt;/div&gt;&lt;!--end col--&gt;
    &lt;div class=&quot;col-sm&quot;&gt;
        &lt;input type=&quot;text&quot; class=&quot;form-control&quot; placeholder=&quot;Zip&quot; aria-label=&quot;Zip&quot;&gt;
    &lt;/div&gt;&lt;!--end col--&gt;
&lt;/div&gt;&lt;!--end row--&gt;</code>
                                                    </pre>
                                                </div>
                                            </div>
                                        </div>
                                    </div>                                    <!-- end col -->
                                </div>                                <!-- end row -->

                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="card">
                                            <div class="card-header align-items-center d-flex">
                                                <h4 class="card-title mb-0 flex-grow-1">Auto Sizing</h4>
                                                <div class="flex-shrink-0">
                                                    <div class="form-check form-switch form-switch-right form-switch-md">
                                                        <label for="auto-size-showcode" class="form-label text-muted">Show Code</label>
                                                        <input class="form-check-input code-switcher" type="checkbox" id="auto-size-showcode"/>
                                                    </div>
                                                </div>
                                            </div>                                            <!-- end card header -->

                                            <div class="card-body">
                                                <p class="text-muted">Change <code>col</code> class to <code>col-auto</code> class so that your columns only take up as much space as needed. Put another way, the column sizes itself based on the contents.</p>
                                                <div class="live-preview">
                                                    <form action="javascript:void(0);">
                                                        <div class="row gy-2 gx-3 mb-3 align-items-center">
                                                            <div class="col-sm-auto">
                                                                <label class="visually-hidden" for="autoSizingInput">Name</label>
                                                                <input type="text" class="form-control" id="autoSizingInput" placeholder="Jane Doe"/>
                                                            </div>
                                                            <!--end col-->
                                                            <div class="col-sm-auto">
                                                                <label class="visually-hidden" for="autoSizingInputGroup">Username</label>
                                                                <div class="input-group">
                                                                    <div class="input-group-text">@</div>
                                                                    <input type="text" class="form-control" id="autoSizingInputGroup" placeholder="Username"/>
                                                                </div>
                                                            </div>
                                                            <!--end col-->
                                                            <div class="col-sm-auto">
                                                                <label class="visually-hidden" for="autoSizingSelect">Preference</label>
                                                                <select class="form-select" data-choices="" data-choices-sorting="true" id="autoSizingSelect">
                                                                    <option selected="">Choose...</option>
                                                                    <option value="1">One</option>
                                                                    <option value="2">Two</option>
                                                                    <option value="3">Three</option>
                                                                </select>
                                                            </div>
                                                            <!--end col-->
                                                            <div class="col-sm-auto">
                                                                <div class="form-check">
                                                                    <input class="form-check-input" type="checkbox" id="autoSizingCheck"/>
                                                                    <label class="form-check-label" for="autoSizingCheck">
                                                            Remember me
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <!--end col-->
                                                            <div class="col-sm-auto">
                                                                <button type="submit" class="btn btn-primary">Submit</button>
                                                            </div>
                                                            <!--end col-->
                                                        </div>
                                                        <!--end row-->
                                                    </form>

                                                    <form action="javascript:void(0);">
                                                        <div class="row gx-3 gy-2 align-items-center">
                                                            <div class="col-sm-3">
                                                                <label class="visually-hidden" for="specificSizeInputName">Name</label>
                                                                <input type="text" class="form-control" id="specificSizeInputName" placeholder="Jane Doe"/>
                                                            </div>
                                                            <!--end col-->
                                                            <div class="col-sm-3">
                                                                <label class="visually-hidden" for="specificSizeInputGroupUsername">Username</label>
                                                                <div class="input-group">
                                                                    <div class="input-group-text">@</div>
                                                                    <input type="text" class="form-control" id="specificSizeInputGroupUsername" placeholder="Username"/>
                                                                </div>
                                                            </div>
                                                            <!--end col-->
                                                            <div class="col-sm-3">
                                                                <label class="visually-hidden" for="specificSizeSelect">Preference</label>
                                                                <select class="form-select" data-choices="" data-choices-sorting="true" id="specificSizeSelect">
                                                                    <option selected="">Choose...</option>
                                                                    <option value="1">One</option>
                                                                    <option value="2">Two</option>
                                                                    <option value="3">Three</option>
                                                                </select>
                                                            </div>
                                                            <!--end col-->
                                                            <div class="col-auto">
                                                                <div class="form-check">
                                                                    <input class="form-check-input" type="checkbox" id="autoSizingCheck2"/>
                                                                    <label class="form-check-label" for="autoSizingCheck2">
                                                            Remember me
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <!--end col-->
                                                            <div class="col-auto">
                                                                <button type="submit" class="btn btn-primary">Submit</button>
                                                            </div>
                                                            <!--end col-->
                                                        </div>
                                                        <!--end row-->
                                                    </form>
                                                </div>
                                                <div class="d-none code-view">
                                                    <pre class="language-markup" style="height: 275px">
                                                        <code>&lt;form action=&quot;javascript:void(0);&quot;&gt;
    &lt;div class=&quot;row gy-2 gx-3 mb-3 align-items-center&quot;&gt;
        &lt;div class=&quot;col-sm-auto&quot;&gt;
            &lt;label class=&quot;visually-hidden&quot; for=&quot;autoSizingInput&quot;&gt;Name&lt;/label&gt;
            &lt;input type=&quot;text&quot; class=&quot;form-control&quot; id=&quot;autoSizingInput&quot; placeholder=&quot;Jane Doe&quot;&gt;
        &lt;/div&gt;&lt;!--end col--&gt;
        &lt;div class=&quot;col-sm-auto&quot;&gt;
            &lt;label class=&quot;visually-hidden&quot; for=&quot;autoSizingInputGroup&quot;&gt;Username&lt;/label&gt;
            &lt;div class=&quot;input-group&quot;&gt;
                &lt;div class=&quot;input-group-text&quot;&gt;@&lt;/div&gt;
                &lt;input type=&quot;text&quot; class=&quot;form-control&quot; id=&quot;autoSizingInputGroup&quot; placeholder=&quot;Username&quot;&gt;
            &lt;/div&gt;
        &lt;/div&gt;&lt;!--end col--&gt;
        &lt;div class=&quot;col-sm-auto&quot;&gt;
            &lt;label class=&quot;visually-hidden&quot; for=&quot;autoSizingSelect&quot;&gt;Preference&lt;/label&gt;
            &lt;select class=&quot;form-select&quot; id=&quot;autoSizingSelect&quot;&gt;
                &lt;option selected&gt;Choose...&lt;/option&gt;
                &lt;option value=&quot;1&quot;&gt;One&lt;/option&gt;
                &lt;option value=&quot;2&quot;&gt;Two&lt;/option&gt;
                &lt;option value=&quot;3&quot;&gt;Three&lt;/option&gt;
            &lt;/select&gt;
        &lt;/div&gt;&lt;!--end col--&gt;
        &lt;div class=&quot;col-sm-auto&quot;&gt;
            &lt;div class=&quot;form-check&quot;&gt;
                &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; id=&quot;autoSizingCheck&quot;&gt;
                &lt;label class=&quot;form-check-label&quot; for=&quot;autoSizingCheck&quot;&gt;
                    Remember me
                &lt;/label&gt;
            &lt;/div&gt;
        &lt;/div&gt;&lt;!--end col--&gt;
        &lt;div class=&quot;col-sm-auto&quot;&gt;
            &lt;button type=&quot;submit&quot; class=&quot;btn btn-primary&quot;&gt;Submit&lt;/button&gt;
        &lt;/div&gt;&lt;!--end col--&gt;
    &lt;/div&gt;&lt;!--end row--&gt;
&lt;/form&gt;</code>

                                                        <code>&lt;form&gt;
    &lt;div class=&quot;row gx-3 gy-2 align-items-center&quot;&gt;
        &lt;div class=&quot;col-sm-3&quot;&gt;
            &lt;label class=&quot;visually-hidden&quot; for=&quot;specificSizeInputName&quot;&gt;Name&lt;/label&gt;
            &lt;input type=&quot;text&quot; class=&quot;form-control&quot; id=&quot;specificSizeInputName&quot; placeholder=&quot;Jane Doe&quot;&gt;
        &lt;/div&gt;&lt;!--end col--&gt;
        &lt;div class=&quot;col-sm-3&quot;&gt;
            &lt;label class=&quot;visually-hidden&quot; for=&quot;specificSizeInputGroupUsername&quot;&gt;Username&lt;/label&gt;
            &lt;div class=&quot;input-group&quot;&gt;
                &lt;div class=&quot;input-group-text&quot;&gt;@&lt;/div&gt;
                &lt;input type=&quot;text&quot; class=&quot;form-control&quot; id=&quot;specificSizeInputGroupUsername&quot; placeholder=&quot;Username&quot;&gt;
            &lt;/div&gt;
        &lt;/div&gt;&lt;!--end col--&gt;
        &lt;div class=&quot;col-sm-3&quot;&gt;
            &lt;label class=&quot;visually-hidden&quot; for=&quot;specificSizeSelect&quot;&gt;Preference&lt;/label&gt;
            &lt;select class=&quot;form-select&quot; id=&quot;specificSizeSelect&quot;&gt;
                &lt;option selected&gt;Choose...&lt;/option&gt;
                &lt;option value=&quot;1&quot;&gt;One&lt;/option&gt;
                &lt;option value=&quot;2&quot;&gt;Two&lt;/option&gt;
                &lt;option value=&quot;3&quot;&gt;Three&lt;/option&gt;
            &lt;/select&gt;
        &lt;/div&gt;&lt;!--end col--&gt;
        &lt;div class=&quot;col-auto&quot;&gt;
            &lt;div class=&quot;form-check&quot;&gt;
                &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; id=&quot;autoSizingCheck2&quot;&gt;
                &lt;label class=&quot;form-check-label&quot; for=&quot;autoSizingCheck2&quot;&gt;
                    Remember me
                &lt;/label&gt;
            &lt;/div&gt;
        &lt;/div&gt;&lt;!--end col--&gt;
        &lt;div class=&quot;col-auto&quot;&gt;
            &lt;button type=&quot;submit&quot; class=&quot;btn btn-primary&quot;&gt;Submit&lt;/button&gt;
        &lt;/div&gt;&lt;!--end col--&gt;
    &lt;/div&gt;
&lt;/form&gt;</code>
                                                    </pre>
                                                </div>
                                            </div>
                                        </div>
                                    </div>                                    <!-- end col -->

                                </div>
                                <!--end row-->

                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="card">
                                            <div class="card-header align-items-center d-flex">
                                                <h4 class="card-title mb-0 flex-grow-1">Inline Forms</h4>
                                                <div class="flex-shrink-0">
                                                    <div class="form-check form-switch form-switch-right form-switch-md">
                                                        <label for="inline-form-showcode" class="form-label text-muted">Show Code</label>
                                                        <input class="form-check-input code-switcher" type="checkbox" id="inline-form-showcode"/>
                                                    </div>
                                                </div>
                                            </div>                                            <!-- end card header -->
                                            <div class="card-body">
                                                <p class="text-muted">Use <code>row-cols-*</code> class to set form inline.</p>
                                                <div class="live-preview">
                                                    <form action="javascript:void(0);">
                                                        <div class="row row-cols-lg-auto g-3 align-items-center">
                                                            <div class="col-12">
                                                                <label class="visually-hidden" for="inlineFormInputGroupUsername">Username</label>
                                                                <div class="input-group">
                                                                    <div class="input-group-text">@</div>
                                                                    <input type="text" class="form-control" id="inlineFormInputGroupUsername" placeholder="Username"/>
                                                                </div>
                                                            </div>
                                                            <!--end col-->
                                                            <div class="col-12">
                                                                <label class="visually-hidden" for="inlineFormSelectPref">Preference</label>
                                                                <select class="form-select" data-choices="" data-choices-sorting="true" id="inlineFormSelectPref">
                                                                    <option selected="">Choose...</option>
                                                                    <option value="1">One</option>
                                                                    <option value="2">Two</option>
                                                                    <option value="3">Three</option>
                                                                </select>
                                                            </div>
                                                            <!--end col-->
                                                            <div class="col-12">
                                                                <div class="form-check">
                                                                    <input class="form-check-input" type="checkbox" id="inlineFormCheck"/>
                                                                    <label class="form-check-label" for="inlineFormCheck">
                                                            Remember me
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <!--end col-->
                                                            <div class="col-12">
                                                                <button type="submit" class="btn btn-primary">Submit</button>
                                                            </div>
                                                            <!--end col-->
                                                        </div>
                                                        <!--end row-->
                                                    </form>
                                                </div>
                                                <div class="d-none code-view">
                                                    <pre class="language-markup" style="height: 275px">
                                                        <code>&lt;form action=&quot;javascript:void(0);&quot;&gt;
    &lt;div class=&quot;row row-cols-lg-auto g-3 align-items-center&quot;&gt;
        &lt;div class=&quot;col-12&quot;&gt;
            &lt;label class=&quot;visually-hidden&quot; for=&quot;inlineFormInputGroupUsername&quot;&gt;Username&lt;/label&gt;
            &lt;div class=&quot;input-group&quot;&gt;
                &lt;div class=&quot;input-group-text&quot;&gt;@&lt;/div&gt;
                &lt;input type=&quot;text&quot; class=&quot;form-control&quot; id=&quot;inlineFormInputGroupUsername&quot; placeholder=&quot;Username&quot;&gt;
            &lt;/div&gt;
        &lt;/div&gt;&lt;!--end col--&gt;
        &lt;div class=&quot;col-12&quot;&gt;
            &lt;label class=&quot;visually-hidden&quot; for=&quot;inlineFormSelectPref&quot;&gt;Preference&lt;/label&gt;
            &lt;select class=&quot;form-select&quot; id=&quot;inlineFormSelectPref&quot;&gt;
                &lt;option selected&gt;Choose...&lt;/option&gt;
                &lt;option value=&quot;1&quot;&gt;One&lt;/option&gt;
                &lt;option value=&quot;2&quot;&gt;Two&lt;/option&gt;
                &lt;option value=&quot;3&quot;&gt;Three&lt;/option&gt;
            &lt;/select&gt;
        &lt;/div&gt;&lt;!--end col--&gt;
        &lt;div class=&quot;col-12&quot;&gt;
            &lt;div class=&quot;form-check&quot;&gt;
                &lt;input class=&quot;form-check-input&quot; type=&quot;checkbox&quot; id=&quot;inlineFormCheck&quot;&gt;
                &lt;label class=&quot;form-check-label&quot; for=&quot;inlineFormCheck&quot;&gt;
                    Remember me
                &lt;/label&gt;
            &lt;/div&gt;
        &lt;/div&gt;&lt;!--end col--&gt;
        &lt;div class=&quot;col-12&quot;&gt;
            &lt;button type=&quot;submit&quot; class=&quot;btn btn-primary&quot;&gt;Submit&lt;/button&gt;
        &lt;/div&gt;&lt;!--end col--&gt;
    &lt;/div&gt;&lt;!--end row--&gt;
&lt;/form&gt;</code>
                                                    </pre>
                                                </div>
                                            </div>
                                            <!--end card-body-->
                                        </div>
                                        <!--end card-->
                                    </div>                                    <!-- end col -->
                                </div>                                <!-- end row -->

                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="card">
                                            <div class="card-header align-items-center d-flex">
                                                <h4 class="card-title mb-0 flex-grow-1">Floating Labels</h4>
                                                <div class="flex-shrink-0">
                                                    <div class="form-check form-switch form-switch-right form-switch-md">
                                                        <label for="floating-form-showcode" class="form-label text-muted">Show Code</label>
                                                        <input class="form-check-input code-switcher" type="checkbox" id="floating-form-showcode"/>
                                                    </div>
                                                </div>
                                            </div>                                            <!-- end card header -->
                                            <div class="card-body">
                                                <p class="text-muted">Use <code>form-floating</code> class to enable floating labels with Bootstrap’s textual form fields.</p>
                                                <div class="live-preview">
                                                    <form action="#">
                                                        <div class="row g-3">
                                                            <div class="col-lg-6">
                                                                <div class="form-floating">
                                                                    <input type="text" class="form-control" id="firstnamefloatingInput" placeholder="Enter your firstname"/>
                                                                    <label for="firstnamefloatingInput">First Name</label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="form-floating">
                                                                    <input type="text" class="form-control" id="lastnamefloatingInput" placeholder="Enter your Lastname"/>
                                                                    <label for="lastnamefloatingInput">Last Name</label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <div class="form-floating">
                                                                    <input type="email" class="form-control" id="emailfloatingInput" placeholder="Enter your email"/>
                                                                    <label for="emailfloatingInput">Email Address</label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <div class="form-floating">
                                                                    <input type="password" class="form-control" id="passwordfloatingInput" placeholder="Enter your password"/>
                                                                    <label for="passwordfloatingInput">Password</label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <div class="form-floating">
                                                                    <input type="password" class="form-control" id="passwordfloatingInput1" placeholder="Confirm password"/>
                                                                    <label for="passwordfloatingInput1">Confirm Password</label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <div class="form-floating">
                                                                    <input type="text" class="form-control" id="cityfloatingInput" placeholder="Enter your city"/>
                                                                    <label for="cityfloatingInput">City</label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <div class="form-floating">
                                                                    <select class="form-select" id="floatingSelect" aria-label="Floating label select example">
                                                                        <option selected="">Choose...</option>
                                                                        <option value="1">USA</option>
                                                                        <option value="2">Brazil</option>
                                                                        <option value="3">France</option>
                                                                        <option value="4">Germany</option>
                                                                    </select>
                                                                    <label for="floatingSelect">Country</label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <div class="form-floating">
                                                                    <input type="number" class="form-control" id="zipfloatingInput" placeholder="Enter your zipcode"/>
                                                                    <label for="zipfloatingInput">Zipcode</label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-12">
                                                                <div class="text-end">
                                                                    <button type="submit" class="btn btn-primary">Submit</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="d-none code-view">
                                                    <pre class="language-markup" style="height: 275px">
                                                        <code>&lt;form action=&quot;#&quot;&gt;
    &lt;div class=&quot;row g-3&quot;&gt;
        &lt;div class=&quot;col-lg-6&quot;&gt;
            &lt;div class=&quot;form-floating&quot;&gt;
                &lt;input type=&quot;text&quot; class=&quot;form-control&quot; id=&quot;firstnamefloatingInput&quot; placeholder=&quot;Enter your firstname&quot;&gt;
                &lt;label for=&quot;firstnamefloatingInput&quot;&gt;First Name&lt;/label&gt;
            &lt;/div&gt;
        &lt;/div&gt;
        &lt;div class=&quot;col-lg-6&quot;&gt;
            &lt;div class=&quot;form-floating&quot;&gt;
                &lt;input type=&quot;text&quot; class=&quot;form-control&quot; id=&quot;lastnamefloatingInput&quot; placeholder=&quot;Enter your Lastname&quot;&gt;
                &lt;label for=&quot;lastnamefloatingInput&quot;&gt;Last Name&lt;/label&gt;
            &lt;/div&gt;
        &lt;/div&gt;
        &lt;div class=&quot;col-lg-4&quot;&gt;
            &lt;div class=&quot;form-floating&quot;&gt;
                &lt;input type=&quot;email&quot; class=&quot;form-control&quot; id=&quot;emailfloatingInput&quot; placeholder=&quot;Enter your email&quot;&gt;
                &lt;label for=&quot;emailfloatingInput&quot;&gt;Email Address&lt;/label&gt;
            &lt;/div&gt;
        &lt;/div&gt;
        &lt;div class=&quot;col-lg-4&quot;&gt;
            &lt;div class=&quot;form-floating&quot;&gt;
                &lt;input type=&quot;password&quot; class=&quot;form-control&quot; id=&quot;passwordfloatingInput&quot; placeholder=&quot;Enter your password&quot;&gt;
                &lt;label for=&quot;passwordfloatingInput&quot;&gt;Password&lt;/label&gt;
            &lt;/div&gt;
        &lt;/div&gt;
        &lt;div class=&quot;col-lg-4&quot;&gt;
            &lt;div class=&quot;form-floating&quot;&gt;
                &lt;input type=&quot;password&quot; class=&quot;form-control&quot; id=&quot;passwordfloatingInput1&quot; placeholder=&quot;Confirm password&quot;&gt;
                &lt;label for=&quot;passwordfloatingInput1&quot;&gt;Confirm Password&lt;/label&gt;
            &lt;/div&gt;
        &lt;/div&gt;
        &lt;div class=&quot;col-lg-4&quot;&gt;
            &lt;div class=&quot;form-floating&quot;&gt;
                &lt;input type=&quot;text&quot; class=&quot;form-control&quot; id=&quot;cityfloatingInput&quot; placeholder=&quot;Enter your city&quot;&gt;
                &lt;label for=&quot;cityfloatingInput&quot;&gt;City&lt;/label&gt;
            &lt;/div&gt;
        &lt;/div&gt;
        &lt;div class=&quot;col-lg-4&quot;&gt;
            &lt;div class=&quot;form-floating&quot;&gt;
                &lt;select class=&quot;form-select&quot; id=&quot;floatingSelect&quot; aria-label=&quot;Floating label select example&quot;&gt;
                  &lt;option selected&gt;USA&lt;/option&gt;
                  &lt;option value=&quot;1&quot;&gt;Brazil&lt;/option&gt;
                  &lt;option value=&quot;2&quot;&gt;France&lt;/option&gt;
                  &lt;option value=&quot;3&quot;&gt;Germany&lt;/option&gt;
                &lt;/select&gt;
                &lt;label for=&quot;floatingSelect&quot;&gt;Country&lt;/label&gt;
            &lt;/div&gt;
        &lt;/div&gt;
        &lt;div class=&quot;col-lg-4&quot;&gt;
            &lt;div class=&quot;form-floating&quot;&gt;
                &lt;input type=&quot;number&quot; class=&quot;form-control&quot; id=&quot;zipfloatingInput&quot; placeholder=&quot;Enter your zipcode&quot;&gt;
                &lt;label for=&quot;zipfloatingInput&quot;&gt;Zipcode&lt;/label&gt;
            &lt;/div&gt;
        &lt;/div&gt;
        &lt;div class=&quot;col-lg-12&quot;&gt;
            &lt;div class=&quot;text-end&quot;&gt;
                &lt;button type=&quot;submit&quot; class=&quot;btn btn-primary&quot;&gt;Submit&lt;/button&gt;
            &lt;/div&gt;
        &lt;/div&gt;
    &lt;/div&gt;
&lt;/form&gt;</code>
                                                    </pre>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>                            <!-- container-fluid -->

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
