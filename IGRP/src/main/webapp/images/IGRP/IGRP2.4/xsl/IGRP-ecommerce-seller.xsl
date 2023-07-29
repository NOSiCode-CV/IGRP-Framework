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
                                        <div class="card">
                                            <div class="card-header border-0 rounded">
                                                <div class="row g-2">
                                                    <div class="col-xl-3">
                                                        <div class="search-box">
                                                            <input type="text" class="form-control search" placeholder="Search for sellers  owner name or something..."/>
                                                            <i class="ri-search-line search-icon"></i>
                                                        </div>
                                                    </div>
                                                    <!--end col-->
                                                    <div class="col-xxl-3 ms-auto">
                                                        <div>
                                                            <select class="form-control" data-choices="" data-choices-search-false="">
                                                                <option value="">Select Categories</option>
                                                                <option value="All">All</option>
                                                                <option value="Retailer">Retailer</option>
                                                                <option value="Health  Medicine">Health  Medicine</option>
                                                                <option value="Manufacturer">Manufacturer</option>
                                                                <option value="Food Service">Food Service</option>
                                                                <option value="Computers  Electronics">Computers  Electronics</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <!--end col-->
                                                    <div class="col-lg-auto">
                                                        <div class="hstack gap-2">
                                                            <button type="button" class="btn btn-danger">
                                                                <i class="ri-equalizer-fill me-1 align-bottom"></i> Filters</button>
                                                            <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addSeller">
                                                                <i class="ri-add-fill me-1 align-bottom"></i> Add Seller</button>
                                                        </div>
                                                    </div>
                                                    <!--end col-->
                                                </div>
                                                <!--end row-->
                                            </div>
                                        </div>

                                        <div class="row mt-4">
                                            <div class="col-xl-3 col-lg-6">
                                                <div class="card ribbon-box right overflow-hidden">
                                                    <div class="card-body text-center p-4">
                                                        <div class="ribbon ribbon-info ribbon-shape trending-ribbon">
                                                            <i class="ri-flashlight-fill text-white align-bottom"></i>
                                                            <span class="trending-ribbon-text">Trending</span>
                                                        </div>
                                                        <img src="{$themePath}/assets/images/companies/img-1.png" alt="" height="45"/>
                                                        <h5 class="mb-1 mt-4">
                                                            <a href="IGRP-ecommerce-seller-details.xml" class="link-primary">Force Medicines</a>
                                                        </h5>
                                                        <p class="text-muted mb-4">David Marshall</p>
                                                        <div class="row justify-content-center">
                                                            <div class="col-lg-8">
                                                                <div id="chart-seller1" data-colors='["--vz-danger"]'></div>
                                                            </div>
                                                        </div>
                                                        <div class="row mt-4">
                                                            <div class="col-lg-6 border-end-dashed border-end">
                                                                <h5>452</h5>
                                                                <span class="text-muted">Item Stock</span>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <h5>$45,415</h5>
                                                                <span class="text-muted">Wallet Balance</span>
                                                            </div>
                                                        </div>
                                                        <div class="mt-4">
                                                            <a href="IGRP-ecommerce-seller-details.xml" class="btn btn-light w-100">View Details</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--end col-->
                                            <div class="col-xl-3 col-lg-6">
                                                <div class="card">
                                                    <div class="card-body text-center p-4">
                                                        <img src="{$themePath}/assets/images/companies/img-2.png" alt="" height="45"/>
                                                        <h5 class="mb-1 mt-4">
                                                            <a href="IGRP-ecommerce-seller-details.xml" class="link-primary">Micro Design</a>
                                                        </h5>
                                                        <p class="text-muted mb-4">Katia Stapleton</p>
                                                        <div class="row justify-content-center">
                                                            <div class="col-lg-8">
                                                                <div id="chart-seller2" data-colors='["--vz-success"]'></div>
                                                            </div>
                                                        </div>
                                                        <div class="row mt-4">
                                                            <div class="col-lg-6 border-end-dashed border-end">
                                                                <h5>784</h5>
                                                                <span class="text-muted">Item Stock</span>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <h5>$97,642</h5>
                                                                <span class="text-muted">Wallet Balance</span>
                                                            </div>
                                                        </div>
                                                        <div class="mt-4">
                                                            <a href="IGRP-ecommerce-seller-details.xml" class="btn btn-light w-100">View Details</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--end col-->
                                            <div class="col-xl-3 col-lg-6">
                                                <div class="card">
                                                    <div class="card-body text-center p-4">
                                                        <img src="{$themePath}/assets/images/companies/img-3.png" alt="" height="45"/>
                                                        <h5 class="mb-1 mt-4">
                                                            <a href="IGRP-ecommerce-seller-details.xml" class="link-primary">Nesta Technologies</a>
                                                        </h5>
                                                        <p class="text-muted mb-4">Harley Fuller</p>
                                                        <div class="row justify-content-center">
                                                            <div class="col-lg-8">
                                                                <div id="chart-seller3" data-colors='["--vz-warning"]'></div>
                                                            </div>
                                                        </div>
                                                        <div class="row mt-4">
                                                            <div class="col-lg-6 border-end-dashed border-end">
                                                                <h5>320</h5>
                                                                <span class="text-muted">Item Stock</span>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <h5>$27,102</h5>
                                                                <span class="text-muted">Wallet Balance</span>
                                                            </div>
                                                        </div>
                                                        <div class="mt-4">
                                                            <a href="IGRP-ecommerce-seller-details.xml" class="btn btn-light w-100">View Details</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--end col-->
                                            <div class="col-xl-3 col-lg-6">
                                                <div class="card ribbon-box right overflow-hidden">
                                                    <div class="card-body text-center p-4">
                                                        <div class="ribbon ribbon-info ribbon-shape trending-ribbon">
                                                            <i class="ri-flashlight-fill text-white align-bottom"></i>
                                                            <span class="trending-ribbon-text">Trending</span>
                                                        </div>
                                                        <img src="{$themePath}/assets/images/companies/img-4.png" alt="" height="45"/>
                                                        <h5 class="mb-1 mt-4">
                                                            <a href="IGRP-ecommerce-seller-details.xml" class="link-primary">iTest Factory</a>
                                                        </h5>
                                                        <p class="text-muted mb-4">Oliver Tyler</p>
                                                        <div class="row justify-content-center">
                                                            <div class="col-lg-8">
                                                                <div id="chart-seller4" data-colors='["--vz-success"]'></div>
                                                            </div>
                                                        </div>
                                                        <div class="row mt-4">
                                                            <div class="col-lg-6 border-end-dashed border-end">
                                                                <h5>159</h5>
                                                                <span class="text-muted">Item Stock</span>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <h5>$14,933</h5>
                                                                <span class="text-muted">Wallet Balance</span>
                                                            </div>
                                                        </div>
                                                        <div class="mt-4">
                                                            <a href="IGRP-ecommerce-seller-details.xml" class="btn btn-light w-100">View Details</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--end col-->
                                            <div class="col-xl-3 col-lg-6">
                                                <div class="card">
                                                    <div class="card-body text-center p-4">
                                                        <img src="{$themePath}/assets/images/companies/img-5.png" alt="" height="45"/>
                                                        <h5 class="mb-1 mt-4">
                                                            <a href="IGRP-ecommerce-seller-details.xml" class="link-primary">Meta4Systems</a>
                                                        </h5>
                                                        <p class="text-muted mb-4">Zoe Dennis</p>
                                                        <div class="row justify-content-center">
                                                            <div class="col-lg-8">
                                                                <div id="chart-seller5" data-colors='["--vz-warning"]'></div>
                                                            </div>
                                                        </div>
                                                        <div class="row mt-4">
                                                            <div class="col-lg-6 border-end-dashed border-end">
                                                                <h5>363</h5>
                                                                <span class="text-muted">Item Stock</span>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <h5>$73,426</h5>
                                                                <span class="text-muted">Wallet Balance</span>
                                                            </div>
                                                        </div>
                                                        <div class="mt-4">
                                                            <a href="IGRP-ecommerce-seller-details.xml" class="btn btn-light w-100">View Details</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--end col-->
                                            <div class="col-xl-3 col-lg-6">
                                                <div class="card ribbon-box right overflow-hidden">
                                                    <div class="card-body text-center p-4">
                                                        <div class="ribbon ribbon-info ribbon-shape trending-ribbon">
                                                            <i class="ri-flashlight-fill text-white align-bottom"></i>
                                                            <span class="trending-ribbon-text">Trending</span>
                                                        </div>
                                                        <img src="{$themePath}/assets/images/companies/img-6.png" alt="" height="45"/>
                                                        <h5 class="mb-1 mt-4">
                                                            <a href="IGRP-ecommerce-seller-details.xml" class="link-primary">Digitech Galaxy</a>
                                                        </h5>
                                                        <p class="text-muted mb-4">John Roberts</p>
                                                        <div class="row justify-content-center">
                                                            <div class="col-lg-8">
                                                                <div id="chart-seller6" data-colors='["--vz-success"]'></div>
                                                            </div>
                                                        </div>
                                                        <div class="row mt-4">
                                                            <div class="col-lg-6 border-end-dashed border-end">
                                                                <h5>412</h5>
                                                                <span class="text-muted">Item Stock</span>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <h5>$34,241</h5>
                                                                <span class="text-muted">Wallet Balance</span>
                                                            </div>
                                                        </div>
                                                        <div class="mt-4">
                                                            <a href="IGRP-ecommerce-seller-details.xml" class="btn btn-light w-100">View Details</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--end col-->
                                            <div class="col-xl-3 col-lg-6">
                                                <div class="card ribbon-box right overflow-hidden">
                                                    <div class="card-body text-center p-4">
                                                        <div class="ribbon ribbon-info ribbon-shape trending-ribbon">
                                                            <i class="ri-flashlight-fill text-white align-bottom"></i>
                                                            <span class="trending-ribbon-text">Trending</span>
                                                        </div>
                                                        <img src="{$themePath}/assets/images/companies/img-7.png" alt="" height="45"/>
                                                        <h5 class="mb-1 mt-4">
                                                            <a href="IGRP-ecommerce-seller-details.xml" class="link-primary">Syntyce Solutions</a>
                                                        </h5>
                                                        <p class="text-muted mb-4">Demi Allen</p>
                                                        <div class="row justify-content-center">
                                                            <div class="col-lg-8">
                                                                <div id="chart-seller7" data-colors='["--vz-danger"]'></div>
                                                            </div>
                                                        </div>
                                                        <div class="row mt-4">
                                                            <div class="col-lg-6 border-end-dashed border-end">
                                                                <h5>945</h5>
                                                                <span class="text-muted">Item Stock</span>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <h5>$17,200</h5>
                                                                <span class="text-muted">Wallet Balance</span>
                                                            </div>
                                                        </div>
                                                        <div class="mt-4">
                                                            <a href="IGRP-ecommerce-seller-details.xml" class="btn btn-light w-100">View Details</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--end col-->
                                            <div class="col-xl-3 col-lg-6">
                                                <div class="card">
                                                    <div class="card-body text-center p-4">
                                                        <img src="{$themePath}/assets/images/companies/img-8.png" alt="" height="45"/>
                                                        <h5 class="mb-1 mt-4">
                                                            <a href="IGRP-ecommerce-seller-details.xml" class="link-primary">Zoetic Fashion</a>
                                                        </h5>
                                                        <p class="text-muted mb-4">James Bowen</p>
                                                        <div class="row justify-content-center">
                                                            <div class="col-lg-8">
                                                                <div id="chart-seller8" data-colors='["--vz-warning"]'></div>
                                                            </div>
                                                        </div>
                                                        <div class="row mt-4">
                                                            <div class="col-lg-6 border-end-dashed border-end">
                                                                <h5>784</h5>
                                                                <span class="text-muted">Item Stock</span>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <h5>$97,642</h5>
                                                                <span class="text-muted">Wallet Balance</span>
                                                            </div>
                                                        </div>
                                                        <div class="mt-4">
                                                            <a href="IGRP-ecommerce-seller-details.xml" class="btn btn-light w-100">View Details</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--end col-->
                                        </div>
                                        <!--end row-->

                                        <div class="row g-0 text-center text-sm-start align-items-center mb-3">
                                            <div class="col-sm-6">
                                                <div>
                                                    <p class="mb-sm-0">Showing 1 to 8 of 12 entries</p>
                                                </div>
                                            </div>                                            <!-- end col -->
                                            <div class="col-sm-6">
                                                <ul class="pagination pagination-separated justify-content-center justify-content-sm-end mb-sm-0">
                                                    <li class="page-item disabled">
                                                        <a href="#" class="page-link">
                                                            <i class="mdi mdi-chevron-left"></i>
                                                        </a>
                                                    </li>
                                                    <li class="page-item active">
                                                        <a href="#" class="page-link">1</a>
                                                    </li>
                                                    <li class="page-item ">
                                                        <a href="#" class="page-link">2</a>
                                                    </li>
                                                    <li class="page-item">
                                                        <a href="#" class="page-link">3</a>
                                                    </li>
                                                    <li class="page-item">
                                                        <a href="#" class="page-link">4</a>
                                                    </li>
                                                    <li class="page-item">
                                                        <a href="#" class="page-link">5</a>
                                                    </li>
                                                    <li class="page-item">
                                                        <a href="#" class="page-link">
                                                            <i class="mdi mdi-chevron-right"></i>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>                                            <!-- end col -->
                                        </div>                                        <!-- end row -->

                                        <!-- Modal -->
                                        <div class="modal fade zoomIn" id="addSeller" tabindex="-1" aria-labelledby="addSellerLabel" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered modal-lg">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="addSellerLabel">Add Seller</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-content border-0 mt-3">
                                                        <ul class="nav nav-tabs nav-tabs-custom nav-success p-2 pb-0 bg-light" role="tablist">
                                                            <li class="nav-item">
                                                                <a class="nav-link active" data-bs-toggle="tab" href="#personalDetails" role="tab" aria-selected="true">
                                                Personal Details
                                                                </a>
                                                            </li>
                                                            <li class="nav-item">
                                                                <a class="nav-link" data-bs-toggle="tab" href="#businessDetails" role="tab" aria-selected="false">
                                                Business Details
                                                                </a>
                                                            </li>
                                                            <li class="nav-item">
                                                                <a class="nav-link" data-bs-toggle="tab" href="#bankDetails" role="tab" aria-selected="false">
                                                Bank Details
                                                                </a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="tab-content">
                                                            <div class="tab-pane active" id="personalDetails" role="tabpanel">
                                                                <form action="#">
                                                                    <div class="row">
                                                                        <div class="col-lg-6">
                                                                            <div class="mb-3">
                                                                                <label for="firstnameInput" class="form-label">First Name</label>
                                                                                <input type="text" class="form-control" id="firstnameInput" placeholder="Enter your firstname"/>
                                                                            </div>
                                                                        </div>
                                                                        <!--end col-->
                                                                        <div class="col-lg-6">
                                                                            <div class="mb-3">
                                                                                <label for="lastnameInput" class="form-label">Last Name</label>
                                                                                <input type="text" class="form-control" id="lastnameInput" placeholder="Enter your lastname"/>
                                                                            </div>
                                                                        </div>
                                                                        <!--end col-->
                                                                        <div class="col-lg-6">
                                                                            <div class="mb-3">
                                                                                <label for="contactnumberInput" class="form-label">Contact Number</label>
                                                                                <input type="number" class="form-control" id="contactnumberInput" placeholder="Enter your number"/>
                                                                            </div>
                                                                        </div>
                                                                        <!--end col-->
                                                                        <div class="col-lg-6">
                                                                            <div class="mb-3">
                                                                                <label for="phonenumberInput" class="form-label">Phone Number</label>
                                                                                <input type="number" class="form-control" id="phonenumberInput" placeholder="Enter your number"/>
                                                                            </div>
                                                                        </div>
                                                                        <!--end col-->
                                                                        <div class="col-lg-6">
                                                                            <div class="mb-3">
                                                                                <label for="emailidInput" class="form-label">Email</label>
                                                                                <input type="email" class="form-control" id="emailidInput" placeholder="Enter your email"/>
                                                                            </div>
                                                                        </div>
                                                                        <!--end col-->
                                                                        <div class="col-lg-6">
                                                                            <div class="mb-3">
                                                                                <label for="birthdayidInput" class="form-label">Date of Birth</label>
                                                                                <input type="text" id="birthdayidInput" class="form-control" data-provider="flatpickr" placeholder="Enter your date of birth"/>
                                                                            </div>
                                                                        </div>
                                                                        <!--end col-->
                                                                        <div class="col-lg-4">
                                                                            <div class="mb-3">
                                                                                <label for="cityidInput" class="form-label">City</label>
                                                                                <input type="text" class="form-control" id="cityidInput" placeholder="Enter your city"/>
                                                                            </div>
                                                                        </div>
                                                                        <!--end col-->
                                                                        <div class="col-lg-4">
                                                                            <div class="mb-3">
                                                                                <label for="countryidInput" class="form-label">Country</label>
                                                                                <input type="text" class="form-control" id="countryidInput" placeholder="Enter your country"/>
                                                                            </div>
                                                                        </div>
                                                                        <!--end col-->
                                                                        <div class="col-lg-4">
                                                                            <div class="mb-3">
                                                                                <label for="zipcodeidInput" class="form-label">Zip Code</label>
                                                                                <input type="text" class="form-control" id="zipcodeidInput" placeholder="Enter your zipcode"/>
                                                                            </div>
                                                                        </div>
                                                                        <!--end col-->
                                                                        <div class="col-lg-12">
                                                                            <div class="mb-3">
                                                                                <label for="exampleFormControlTextarea1" class="form-label">Description</label>
                                                                                <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="Enter description"></textarea>
                                                                            </div>
                                                                        </div>
                                                                        <!--end col-->
                                                                        <div class="col-lg-12">
                                                                            <div class="hstack gap-2 justify-content-end">
                                                                                <button class="btn btn-link link-success text-decoration-none fw-medium" data-bs-dismiss="modal">
                                                                                    <i class="ri-close-line me-1 align-middle"></i> Close</button>
                                                                                <button type="submit" class="btn btn-primary">
                                                                                    <i class="ri-save-3-line align-bottom me-1"></i> Save</button>
                                                                            </div>
                                                                        </div>
                                                                        <!--end col-->
                                                                    </div>
                                                                    <!--end row-->
                                                                </form>
                                                            </div>
                                                            <div class="tab-pane" id="businessDetails" role="tabpanel">
                                                                <form action="#">
                                                                    <div class="row">
                                                                        <div class="col-lg-12">
                                                                            <div class="mb-3">
                                                                                <label for="companynameInput" class="form-label">Company Name</label>
                                                                                <input type="text" class="form-control" id="companynameInput" placeholder="Enter your company name"/>
                                                                            </div>
                                                                        </div>
                                                                        <!--end col-->
                                                                        <div class="col-lg-6">
                                                                            <div class="mb-3">
                                                                                <label for="choices-single-default" class="form-label">Company Type</label>
                                                                                <select class="form-control" data-trigger="" name="choices-single-default" id="choices-single-default">
                                                                                    <option value="">Select type</option>
                                                                                    <option value="All" selected="">All</option>
                                                                                    <option value="Merchandising">Merchandising</option>
                                                                                    <option value="Manufacturing">Manufacturing</option>
                                                                                    <option value="Partnership">Partnership</option>
                                                                                    <option value="Corporation">Corporation</option>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                        <!--end col-->
                                                                        <div class="col-lg-6">
                                                                            <div class="mb-3">
                                                                                <label for="pancardInput" class="form-label">Pan Card Number</label>
                                                                                <input type="text" class="form-control" id="pancardInput" placeholder="Enter your pan-card number"/>
                                                                            </div>
                                                                        </div>
                                                                        <!--end col-->
                                                                        <div class="col-lg-4">
                                                                            <div class="mb-3">
                                                                                <label for="websiteInput" class="form-label">Website</label>
                                                                                <input type="url" class="form-control" id="websiteInput" placeholder="Enter your URL"/>
                                                                            </div>
                                                                        </div>
                                                                        <!--end col-->
                                                                        <div class="col-lg-4">
                                                                            <div class="mb-3">
                                                                                <label for="faxInput" class="form-label">Fax</label>
                                                                                <input type="text" class="form-control" id="faxInput" placeholder="Enter your fax"/>
                                                                            </div>
                                                                        </div>
                                                                        <!--end col-->
                                                                        <div class="col-lg-4">
                                                                            <div class="mb-3">
                                                                                <label for="companyemailInput" class="form-label">Email</label>
                                                                                <input type="email" class="form-control" id="companyemailInput" placeholder="Enter your email"/>
                                                                            </div>
                                                                        </div>
                                                                        <!--end col-->
                                                                        <div class="col-lg-6">
                                                                            <div class="mb-3">
                                                                                <label for="worknumberInput" class="form-label">Number</label>
                                                                                <input type="number" class="form-control" id="worknumberInput" placeholder="Enter your number"/>
                                                                            </div>
                                                                        </div>
                                                                        <!--end col-->
                                                                        <div class="col-lg-6">
                                                                            <div class="mb-3">
                                                                                <label for="companylogoInput" class="form-label">Company Logo</label>
                                                                                <input type="file" class="form-control" id="companylogoInput"/>
                                                                            </div>
                                                                        </div>
                                                                        <!--end col-->
                                                                        <div class="col-lg-12">
                                                                            <div class="hstack gap-2 justify-content-end">
                                                                                <button class="btn btn-link link-success text-decoration-none fw-medium" data-bs-dismiss="modal">
                                                                                    <i class="ri-close-line me-1 align-middle"></i> Close</button>
                                                                                <button type="submit" class="btn btn-primary">
                                                                                    <i class="ri-save-3-line align-bottom me-1"></i> Save</button>
                                                                            </div>
                                                                        </div>
                                                                        <!--end col-->
                                                                    </div>
                                                                    <!--end row-->
                                                                </form>
                                                            </div>
                                                            <div class="tab-pane" id="bankDetails" role="tabpanel">
                                                                <form action="#">
                                                                    <div class="row">
                                                                        <div class="col-lg-6">
                                                                            <div class="mb-3">
                                                                                <label for="banknameInput" class="form-label">Bank Name</label>
                                                                                <input type="text" class="form-control" id="banknameInput" placeholder="Enter your bank name"/>
                                                                            </div>
                                                                        </div>
                                                                        <!--end col-->
                                                                        <div class="col-lg-6">
                                                                            <div class="mb-3">
                                                                                <label for="branchInput" class="form-label">Branch</label>
                                                                                <input type="text" class="form-control" id="branchInput" placeholder="Branch"/>
                                                                            </div>
                                                                        </div>
                                                                        <!--end col-->
                                                                        <div class="col-lg-12">
                                                                            <div class="mb-3">
                                                                                <label for="accountnameInput" class="form-label">Account Holder Name</label>
                                                                                <input type="text" class="form-control" id="accountnameInput" placeholder="Enter account holder name"/>
                                                                            </div>
                                                                        </div>
                                                                        <!--end col-->
                                                                        <div class="col-lg-6">
                                                                            <div class="mb-3">
                                                                                <label for="accountnumberInput" class="form-label">Account Number</label>
                                                                                <input type="number" class="form-control" id="accountnumberInput" placeholder="Enter account number"/>
                                                                            </div>
                                                                        </div>
                                                                        <!--end col-->
                                                                        <div class="col-lg-6">
                                                                            <div class="mb-3">
                                                                                <label for="ifscInput" class="form-label">IFSC</label>
                                                                                <input type="number" class="form-control" id="ifscInput" placeholder="IFSC"/>
                                                                            </div>
                                                                        </div>
                                                                        <!--end col-->
                                                                        <div class="col-lg-12">
                                                                            <div class="hstack gap-2 justify-content-end">
                                                                                <button class="btn btn-link link-success text-decoration-none fw-medium" data-bs-dismiss="modal">
                                                                                    <i class="ri-close-line me-1 align-middle"></i> Close</button>
                                                                                <button type="submit" class="btn btn-primary">
                                                                                    <i class="ri-save-3-line align-bottom me-1"></i> Save</button>
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
                                        </div>
                                        <!--end modal-->

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
                <!-- apexcharts -->
                <script src="{$path}/libs/apexcharts/apexcharts.min.js"></script>

                <!-- sellers init js -->
                <script src="{$themePath}/assets/js/pages/sellers.init.js"></script>

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
