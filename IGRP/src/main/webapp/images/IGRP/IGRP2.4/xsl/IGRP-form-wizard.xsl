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
                                            <div class="col-xl-6">
                                                <div class="card">
                                                    <div class="card-header">
                                                        <h4 class="card-title mb-0">Progress Nav Steps</h4>
                                                    </div>                                                    <!-- end card header -->
                                                    <div class="card-body">
                                                        <form action="#" class="form-steps" autocomplete="off">
                                                            <div class="text-center pt-3 pb-4 mb-1">
                                                                <h5>Signup Your Account</h5>
                                                            </div>
                                                            <div id="custom-progress-bar" class="progress-nav mb-4">
                                                                <div class="progress" style="height: 1px;">
                                                                    <div class="progress-bar" role="progressbar" style="width: 0%;" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                                                                </div>

                                                                <ul class="nav nav-pills progress-bar-tab custom-nav" role="tablist">
                                                                    <li class="nav-item" role="presentation">
                                                                        <button class="nav-link rounded-pill active" data-progressbar="custom-progress-bar" id="pills-gen-info-tab" data-bs-toggle="pill" data-bs-target="#pills-gen-info" type="button" role="tab" aria-controls="pills-gen-info" aria-selected="true">1</button>
                                                                    </li>
                                                                    <li class="nav-item" role="presentation">
                                                                        <button class="nav-link rounded-pill" data-progressbar="custom-progress-bar" id="pills-info-desc-tab" data-bs-toggle="pill" data-bs-target="#pills-info-desc" type="button" role="tab" aria-controls="pills-info-desc" aria-selected="false">2</button>
                                                                    </li>
                                                                    <li class="nav-item" role="presentation">
                                                                        <button class="nav-link rounded-pill" data-progressbar="custom-progress-bar" id="pills-success-tab" data-bs-toggle="pill" data-bs-target="#pills-success" type="button" role="tab" aria-controls="pills-success" aria-selected="false">3</button>
                                                                    </li>
                                                                </ul>
                                                            </div>

                                                            <div class="tab-content">
                                                                <div class="tab-pane fade show active" id="pills-gen-info" role="tabpanel" aria-labelledby="pills-gen-info-tab">
                                                                    <div>
                                                                        <div class="mb-4">
                                                                            <div>
                                                                                <h5 class="mb-1">General Information</h5>
                                                                                <p class="text-muted">Fill all Information as below</p>
                                                                            </div>
                                                                        </div>
                                                                        <div class="row">
                                                                            <div class="col-lg-6">
                                                                                <div class="mb-3">
                                                                                    <label class="form-label" for="gen-info-email-input">Email</label>
                                                                                    <input type="email" class="form-control" id="gen-info-email-input" placeholder="Enter email" required="" />
                                                                                    <div class="invalid-feedback">Please enter an email address</div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-6">
                                                                                <div class="mb-3">
                                                                                    <label class="form-label" for="gen-info-username-input">User Name</label>
                                                                                    <input type="text" class="form-control" id="gen-info-username-input" placeholder="Enter user name" required="" />
                                                                                    <div class="invalid-feedback">Please enter a user name</div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="mb-3">
                                                                            <label class="form-label" for="gen-info-password-input">Password</label>
                                                                            <input type="password" class="form-control" id="gen-info-password-input" placeholder="Enter Password" required="" />
                                                                            <div class="invalid-feedback">Please enter a password</div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="d-flex align-items-start gap-3 mt-4">
                                                                        <button type="button" class="btn btn-success btn-label right ms-auto nexttab nexttab" data-nexttab="pills-info-desc-tab">
                                                                            <i class="ri-arrow-right-line label-icon align-middle fs-16 ms-2"></i>Go to more info</button>
                                                                    </div>
                                                                </div>
                                                                <!-- end tab pane -->

                                                                <div class="tab-pane fade" id="pills-info-desc" role="tabpanel" aria-labelledby="pills-info-desc-tab">
                                                                    <div>
                                                                        <div class="text-center">
                                                                            <div class="profile-user position-relative d-inline-block mx-auto mb-2">
                                                                                <img src="{$themePath}/assets/images/users/user-dummy-img.jpg" class="rounded-circle avatar-lg img-thumbnail user-profile-image" alt="user-profile-image">
                                                                                    <div class="avatar-xs p-0 rounded-circle profile-photo-edit">
                                                                                        <input id="profile-img-file-input" type="file" class="profile-img-file-input" accept="image/png, image/jpeg">
                                                                                            <label for="profile-img-file-input" class="profile-photo-edit avatar-xs">
                                                                                                <span class="avatar-title rounded-circle bg-light text-body">
                                                                                                    <i class="ri-camera-fill"></i>
                                                                                                </span>
                                                                                            </label>
                                                                                        </input>
                                                                                    </div>
                                                                                </img>
                                                                            </div>
                                                                            <h5 class="fs-14">Add Image</h5>

                                                                        </div>
                                                                        <div>
                                                                            <label class="form-label" for="gen-info-description-input">Description</label>
                                                                            <textarea class="form-control" placeholder="Enter Description" id="gen-info-description-input" rows="2" required=""></textarea>
                                                                            <div class="invalid-feedback">Please enter a description</div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="d-flex align-items-start gap-3 mt-4">
                                                                        <button type="button" class="btn btn-link text-decoration-none btn-label previestab" data-previous="pills-gen-info-tab">
                                                                            <i class="ri-arrow-left-line label-icon align-middle fs-16 me-2"></i> Back to General</button>
                                                                        <button type="button" class="btn btn-success btn-label right ms-auto nexttab nexttab" data-nexttab="pills-success-tab">
                                                                            <i class="ri-arrow-right-line label-icon align-middle fs-16 ms-2"></i>Submit</button>
                                                                    </div>
                                                                </div>
                                                                <!-- end tab pane -->

                                                                <div class="tab-pane fade" id="pills-success" role="tabpanel" aria-labelledby="pills-success-tab">
                                                                    <div>
                                                                        <div class="text-center">

                                                                            <div class="mb-4">
                                                                                <lord-icon src="https://cdn.lordicon.com/lupuorrc.json" trigger="loop" colors="primary:#0ab39c,secondary:#405189" style="width:120px;height:120px"></lord-icon>
                                                                            </div>
                                                                            <h5>Well Done !</h5>
                                                                            <p class="text-muted">You have Successfully Signed Up</p>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!-- end tab pane -->
                                                            </div>
                                                            <!-- end tab content -->
                                                        </form>
                                                    </div>
                                                    <!-- end card body -->
                                                </div>
                                                <!-- end card -->
                                            </div>
                                            <!-- end col -->
                                            <div class="col-xl-6">
                                                <div class="card">
                                                    <div class="card-header">
                                                        <h4 class="card-title mb-0">Arrow Nav Steps</h4>
                                                    </div>                                                    <!-- end card header -->
                                                    <div class="card-body">
                                                        <form action="#" class="form-steps" autocomplete="off">
                                                            <div class="text-center pt-3 pb-4 mb-1">
                                                                <img src="{$themePath}/assets/images/logo-dark.png" alt="" height="17"></img>
                                                            </div>
                                                            <div class="step-arrow-nav mb-4">

                                                                <ul class="nav nav-pills custom-nav nav-justified" role="tablist">
                                                                    <li class="nav-item" role="presentation">
                                                                        <button class="nav-link done" id="steparrow-gen-info-tab" data-bs-toggle="pill" data-bs-target="#steparrow-gen-info" type="button" role="tab" aria-controls="steparrow-gen-info" aria-selected="true">General</button>
                                                                    </li>
                                                                    <li class="nav-item" role="presentation">
                                                                        <button class="nav-link active" id="steparrow-description-info-tab" data-bs-toggle="pill" data-bs-target="#steparrow-description-info" type="button" role="tab" aria-controls="steparrow-description-info" aria-selected="false">Description</button>
                                                                    </li>
                                                                    <li class="nav-item" role="presentation">
                                                                        <button class="nav-link" id="pills-experience-tab" data-bs-toggle="pill" data-bs-target="#pills-experience" type="button" role="tab" aria-controls="pills-experience" aria-selected="false">Finish</button>
                                                                    </li>
                                                                </ul>
                                                            </div>

                                                            <div class="tab-content">
                                                                <div class="tab-pane fade" id="steparrow-gen-info" role="tabpanel" aria-labelledby="steparrow-gen-info-tab">
                                                                    <div>
                                                                        <div class="row">
                                                                            <div class="col-lg-6">
                                                                                <div class="mb-3">
                                                                                    <label class="form-label" for="steparrow-gen-info-email-input">Email</label>
                                                                                    <input type="email" class="form-control" id="steparrow-gen-info-email-input" placeholder="Enter email" required="" />
                                                                                    <div class="invalid-feedback">Please enter an email address</div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-6">
                                                                                <div class="mb-3">
                                                                                    <label class="form-label" for="steparrow-gen-info-username-input">User Name</label>
                                                                                    <input type="text" class="form-control" id="steparrow-gen-info-username-input" placeholder="Enter user name" required="" />
                                                                                    <div class="invalid-feedback">Please enter a user name</div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="mb-3">
                                                                            <label class="form-label" for="steparrow-gen-info-password-input">Password</label>
                                                                            <input type="password" class="form-control" id="steparrow-gen-info-password-input" placeholder="Enter password" required="" />
                                                                            <div class="invalid-feedback">Please enter a password</div>
                                                                        </div>
                                                                        <div>
                                                                            <label class="form-label" for="steparrow-gen-info-confirm-password-input">Confirm Password</label>
                                                                            <input type="password" class="form-control" id="steparrow-gen-info-confirm-password-input" placeholder="Enter confirm password" required="" />
                                                                            <div class="invalid-feedback">Please enter a confirm password</div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="d-flex align-items-start gap-3 mt-4">
                                                                        <button type="button" class="btn btn-success btn-label right ms-auto nexttab nexttab" data-nexttab="steparrow-description-info-tab">
                                                                            <i class="ri-arrow-right-line label-icon align-middle fs-16 ms-2"></i>Go to more info</button>
                                                                    </div>
                                                                </div>
                                                                <!-- end tab pane -->

                                                                <div class="tab-pane fade show active" id="steparrow-description-info" role="tabpanel" aria-labelledby="steparrow-description-info-tab">
                                                                    <div>
                                                                        <div class="mb-3">
                                                                            <label for="formFile" class="form-label">Upload Image</label>
                                                                            <input class="form-control" type="file" id="formFile" />
                                                                        </div>
                                                                        <div>
                                                                            <label class="form-label" for="des-info-description-input">Description</label>
                                                                            <textarea class="form-control" placeholder="Enter Description" id="des-info-description-input" rows="3" required=""></textarea>
                                                                            <div class="invalid-feedback">Please enter a description</div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="d-flex align-items-start gap-3 mt-4">
                                                                        <button type="button" class="btn btn-light btn-label previestab" data-previous="steparrow-gen-info-tab">
                                                                            <i class="ri-arrow-left-line label-icon align-middle fs-16 me-2"></i> Back to General</button>
                                                                        <button type="button" class="btn btn-success btn-label right ms-auto nexttab nexttab" data-nexttab="pills-experience-tab">
                                                                            <i class="ri-arrow-right-line label-icon align-middle fs-16 ms-2"></i>Submit</button>
                                                                    </div>
                                                                </div>
                                                                <!-- end tab pane -->

                                                                <div class="tab-pane fade" id="pills-experience" role="tabpanel">
                                                                    <div class="text-center">

                                                                        <div class="avatar-md mt-5 mb-4 mx-auto">
                                                                            <div class="avatar-title bg-light text-success display-4 rounded-circle">
                                                                                <i class="ri-checkbox-circle-fill"></i>
                                                                            </div>
                                                                        </div>
                                                                        <h5>Well Done !</h5>
                                                                        <p class="text-muted">You have Successfully Signed Up</p>
                                                                    </div>
                                                                </div>
                                                                <!-- end tab pane -->
                                                            </div>
                                                            <!-- end tab content -->
                                                        </form>
                                                    </div>
                                                    <!-- end card body -->
                                                </div>
                                                <!-- end card -->
                                            </div>
                                            <!-- end col -->
                                        </div>                                        <!-- end row -->

                                        <div class="row">
                                            <div class="col-xl-12">
                                                <div class="card">
                                                    <div class="card-header">
                                                        <h4 class="card-title mb-0">Vertical nav Steps</h4>
                                                    </div>                                                    <!-- end card header -->
                                                    <div class="card-body form-steps">
                                                        <form class="vertical-navs-step">
                                                            <div class="row gy-5">
                                                                <div class="col-lg-3">
                                                                    <div class="nav flex-column custom-nav nav-pills" role="tablist" aria-orientation="vertical">
                                                                        <button class="nav-link done" id="v-pills-bill-info-tab" data-bs-toggle="pill" data-bs-target="#v-pills-bill-info" type="button" role="tab" aria-controls="v-pills-bill-info" aria-selected="true">
                                                                            <span class="step-title me-2">
                                                                                <i class="ri-close-circle-fill step-icon me-2"></i> Step 1
                                                                            </span>
                                                        Billing Info
                                                                        </button>
                                                                        <button class="nav-link active" id="v-pills-bill-address-tab" data-bs-toggle="pill" data-bs-target="#v-pills-bill-address" type="button" role="tab" aria-controls="v-pills-bill-address" aria-selected="false">
                                                                            <span class="step-title me-2">
                                                                                <i class="ri-close-circle-fill step-icon me-2"></i> Step 2
                                                                            </span>
                                                        Address
                                                                        </button>
                                                                        <button class="nav-link" id="v-pills-payment-tab" data-bs-toggle="pill" data-bs-target="#v-pills-payment" type="button" role="tab" aria-controls="v-pills-payment" aria-selected="false">
                                                                            <span class="step-title me-2">
                                                                                <i class="ri-close-circle-fill step-icon me-2"></i> Step 3
                                                                            </span>
                                                        Payment
                                                                        </button>
                                                                        <button class="nav-link" id="v-pills-finish-tab" data-bs-toggle="pill" data-bs-target="#v-pills-finish" type="button" role="tab" aria-controls="v-pills-finish" aria-selected="false">
                                                                            <span class="step-title me-2">
                                                                                <i class="ri-close-circle-fill step-icon me-2"></i> Step 4
                                                                            </span>
                                                        Finish
                                                                        </button>
                                                                    </div>
                                                                    <!-- end nav -->
                                                                </div>                                                                <!-- end col-->
                                                                <div class="col-lg-6">
                                                                    <div class="px-lg-4">
                                                                        <div class="tab-content">
                                                                            <div class="tab-pane fade" id="v-pills-bill-info" role="tabpanel" aria-labelledby="v-pills-bill-info-tab">
                                                                                <div>
                                                                                    <h5>Billing Info</h5>
                                                                                    <p class="text-muted">Fill all information below</p>
                                                                                </div>

                                                                                <div>
                                                                                    <div class="row g-3">
                                                                                        <div class="col-sm-6">
                                                                                            <label for="firstName" class="form-label">First name</label>
                                                                                            <input type="text" class="form-control" id="firstName" placeholder="Enter first name" value="" required="" />
                                                                                            <div class="invalid-feedback">Please enter a first name</div>
                                                                                        </div>

                                                                                        <div class="col-sm-6">
                                                                                            <label for="lastName" class="form-label">Last name</label>
                                                                                            <input type="text" class="form-control" id="lastName" placeholder="Enter last name" value="" required="" />
                                                                                            <div class="invalid-feedback">Please enter a last name</div>
                                                                                        </div>

                                                                                        <div class="col-12">
                                                                                            <label for="username" class="form-label">Username</label>
                                                                                            <div class="input-group">
                                                                                                <span class="input-group-text">@</span>
                                                                                                <input type="text" class="form-control" id="username" placeholder="Username" required="" />
                                                                                                <div class="invalid-feedback">Please enter a user name</div>
                                                                                            </div>
                                                                                        </div>

                                                                                        <div class="col-12">
                                                                                            <label for="email" class="form-label">Email <span class="text-muted">(Optional)</span>
                                                                                            </label>
                                                                                            <input type="email" class="form-control" id="email" placeholder="Enter Email" />
                                                                                        </div>
                                                                                    </div>
                                                                                </div>

                                                                                <div class="d-flex align-items-start gap-3 mt-4">
                                                                                    <button type="button" class="btn btn-success btn-label right ms-auto nexttab nexttab" data-nexttab="v-pills-bill-address-tab">
                                                                                        <i class="ri-arrow-right-line label-icon align-middle fs-16 ms-2"></i>Go to Shipping</button>
                                                                                </div>
                                                                            </div>
                                                                            <!-- end tab pane -->
                                                                            <div class="tab-pane fade show active" id="v-pills-bill-address" role="tabpanel" aria-labelledby="v-pills-bill-address-tab">
                                                                                <div>
                                                                                    <h5>Shipping Address</h5>
                                                                                    <p class="text-muted">Fill all information below</p>
                                                                                </div>

                                                                                <div>
                                                                                    <div class="row g-3">
                                                                                        <div class="col-12">
                                                                                            <label for="address" class="form-label">Address</label>
                                                                                            <input type="text" class="form-control" id="address" placeholder="1234 Main St" required="" />
                                                                                            <div class="invalid-feedback">Please enter a address</div>
                                                                                        </div>

                                                                                        <div class="col-12">
                                                                                            <label for="address2" class="form-label">Address 2 <span class="text-muted">(Optional)</span>
                                                                                            </label>
                                                                                            <input type="text" class="form-control" id="address2" placeholder="Apartment or suite" />
                                                                                        </div>

                                                                                        <div class="col-md-5">
                                                                                            <label for="country" class="form-label">Country</label>
                                                                                            <select class="form-select" id="country" required="">
                                                                                                <option value="">Choose...</option>
                                                                                                <option>United States</option>
                                                                                            </select>
                                                                                            <div class="invalid-feedback">Please select a country</div>
                                                                                        </div>

                                                                                        <div class="col-md-4">
                                                                                            <label for="state" class="form-label">State</label>
                                                                                            <select class="form-select" id="state">
                                                                                                <option value="">Choose...</option>
                                                                                                <option>California</option>
                                                                                            </select>
                                                                                            <div class="invalid-feedback">Please select a state</div>
                                                                                        </div>

                                                                                        <div class="col-md-3">
                                                                                            <label for="zip" class="form-label">Zip</label>
                                                                                            <input type="text" class="form-control" id="zip" placeholder="" />
                                                                                        </div>
                                                                                    </div>

                                                                                    <hr class="my-4 text-muted"/>

                                                                                    <div class="form-check mb-2">
                                                                                        <input type="checkbox" class="form-check-input" id="same-address"/>
                                                                                        <label class="form-check-label" for="same-address">Shipping address is the same as my billing address</label>
                                                                                    </div>

                                                                                    <div class="form-check">
                                                                                        <input type="checkbox" class="form-check-input" id="save-info"/>
                                                                                        <label class="form-check-label" for="save-info">Save this information for next time</label>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="d-flex align-items-start gap-3 mt-4">
                                                                                    <button type="button" class="btn btn-light btn-label previestab" data-previous="v-pills-bill-info-tab">
                                                                                        <i class="ri-arrow-left-line label-icon align-middle fs-16 me-2"></i> Back to Billing Info</button>
                                                                                    <button type="button" class="btn btn-success btn-label right ms-auto nexttab nexttab" data-nexttab="v-pills-payment-tab">
                                                                                        <i class="ri-arrow-right-line label-icon align-middle fs-16 ms-2"></i>Go to Payment</button>
                                                                                </div>
                                                                            </div>
                                                                            <!-- end tab pane -->
                                                                            <div class="tab-pane fade" id="v-pills-payment" role="tabpanel" aria-labelledby="v-pills-payment-tab">
                                                                                <div>
                                                                                    <h5>Payment</h5>
                                                                                    <p class="text-muted">Fill all information below</p>
                                                                                </div>

                                                                                <div>
                                                                                    <div class="my-3">
                                                                                        <div class="form-check form-check-inline">
                                                                                            <input id="credit" name="paymentMethod" type="radio" class="form-check-input" checked="" required="">
                                                                                                <label class="form-check-label" for="credit">Credit card</label>
                                                                                            </input>
                                                                                        </div>
                                                                                        <div class="form-check form-check-inline">
                                                                                            <input id="debit" name="paymentMethod" type="radio" class="form-check-input" required="">
                                                                                                <label class="form-check-label" for="debit">Debit card</label>
                                                                                            </input>
                                                                                        </div>
                                                                                        <div class="form-check form-check-inline">
                                                                                            <input id="paypal" name="paymentMethod" type="radio" class="form-check-input" required="">
                                                                                                <label class="form-check-label" for="paypal">PayPal</label>
                                                                                            </input>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="row gy-3">
                                                                                        <div class="col-md-12">
                                                                                            <label for="cc-name" class="form-label">Name on card</label>
                                                                                            <input type="text" class="form-control" id="cc-name" placeholder="" required="">
                                                                                                <small class="text-muted">Full name as displayed on card</small>
                                                                                                <div class="invalid-feedback">
                                                                            Name on card is required
                                                                                                </div>
                                                                                            </input>
                                                                                        </div>

                                                                                        <div class="col-md-6">
                                                                                            <label for="cc-number" class="form-label">Credit card number</label>
                                                                                            <input type="text" class="form-control" id="cc-number" placeholder="" required="">
                                                                                                <div class="invalid-feedback">
                                                                            Credit card number is required
                                                                                                </div>
                                                                                            </input>
                                                                                        </div>

                                                                                        <div class="col-md-3">
                                                                                            <label for="cc-expiration" class="form-label">Expiration</label>
                                                                                            <input type="text" class="form-control" id="cc-expiration" placeholder="" required="">
                                                                                                <div class="invalid-feedback">
                                                                            Expiration date required
                                                                                                </div>
                                                                                            </input>
                                                                                        </div>

                                                                                        <div class="col-md-3">
                                                                                            <label for="cc-cvv" class="form-label">CVV</label>
                                                                                            <input type="text" class="form-control" id="cc-cvv" placeholder="" required="">
                                                                                                <div class="invalid-feedback">
                                                                            Security code required
                                                                                                </div>
                                                                                            </input>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>

                                                                                <div class="d-flex align-items-start gap-3 mt-4">
                                                                                    <button type="button" class="btn btn-light btn-label previestab" data-previous="v-pills-bill-address-tab">
                                                                                        <i class="ri-arrow-left-line label-icon align-middle fs-16 me-2"></i> Back to Shipping Info</button>
                                                                                    <button type="button" class="btn btn-success btn-label right ms-auto nexttab nexttab" data-nexttab="v-pills-finish-tab">
                                                                                        <i class="ri-arrow-right-line label-icon align-middle fs-16 ms-2"></i> Order Complete</button>
                                                                                </div>
                                                                            </div>
                                                                            <!-- end tab pane -->
                                                                            <div class="tab-pane fade" id="v-pills-finish" role="tabpanel" aria-labelledby="v-pills-finish-tab">
                                                                                <div class="text-center pt-4 pb-2">

                                                                                    <div class="mb-4">
                                                                                        <lord-icon src="https://cdn.lordicon.com/lupuorrc.json" trigger="loop" colors="primary:#0ab39c,secondary:#405189" style="width:120px;height:120px"></lord-icon>
                                                                                    </div>
                                                                                    <h5>Your Order is Completed !</h5>
                                                                                    <p class="text-muted">You Will receive an order confirmation email with details of your order.</p>
                                                                                </div>
                                                                            </div>
                                                                            <!-- end tab pane -->
                                                                        </div>
                                                                        <!-- end tab content -->
                                                                    </div>
                                                                </div>
                                                                <!-- end col -->

                                                                <div class="col-lg-3">
                                                                    <div class="d-flex justify-content-between align-items-center mb-3">
                                                                        <h5 class="fs-14 text-primary mb-0">
                                                                            <i class="ri-shopping-cart-fill align-middle me-2"></i> Your cart</h5>
                                                                        <span class="badge bg-danger rounded-pill">3</span>
                                                                    </div>
                                                                    <ul class="list-group mb-3">
                                                                        <li class="list-group-item d-flex justify-content-between lh-sm">
                                                                            <div>
                                                                                <h6 class="my-0">Product name</h6>
                                                                                <small class="text-muted">Brief description</small>
                                                                            </div>
                                                                            <span class="text-muted">$12</span>
                                                                        </li>
                                                                        <li class="list-group-item d-flex justify-content-between lh-sm">
                                                                            <div>
                                                                                <h6 class="my-0">Second product</h6>
                                                                                <small class="text-muted">Brief description</small>
                                                                            </div>
                                                                            <span class="text-muted">$8</span>
                                                                        </li>
                                                                        <li class="list-group-item d-flex justify-content-between lh-sm">
                                                                            <div>
                                                                                <h6 class="my-0">Third item</h6>
                                                                                <small class="text-muted">Brief description</small>
                                                                            </div>
                                                                            <span class="text-muted">$5</span>
                                                                        </li>
                                                                        <li class="list-group-item d-flex justify-content-between bg-light">
                                                                            <div class="text-success">
                                                                                <h6 class="my-0">Discount code</h6>
                                                                                <small>−$5 Discount</small>
                                                                            </div>
                                                                            <span class="text-success">−$5</span>
                                                                        </li>
                                                                        <li class="list-group-item d-flex justify-content-between">
                                                                            <span>Total (USD)</span>
                                                                            <strong>$20</strong>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                            <!-- end row -->
                                                        </form>
                                                    </div>
                                                </div>
                                                <!-- end -->
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
                <!-- form wizard init -->
                <script src="{$themePath}/assets/js/pages/form-wizard.init.js"></script>


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
