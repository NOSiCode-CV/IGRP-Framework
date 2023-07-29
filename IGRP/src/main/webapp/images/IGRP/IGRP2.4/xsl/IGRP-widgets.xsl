<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/>

  <xsl:template match="/">
    <html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">
      <head>

        <!-- page includes css -->
        <!-- plugin css -->
    <link href="assets/libs/jsvectormap/css/jsvectormap.min.css" rel="stylesheet" type="text/css" />

    <link href="assets/libs/swiper/swiper-bundle.min.css" rel="stylesheet" />
      
      
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
                        <div class="col-12">
                            <h5 class="text-decoration-underline mb-3 pb-1">Tile Boxs</h5>
                        </div>
                    </div>
                    <!-- end row-->

                    <div class="row">
                        <div class="col-xl-3 col-md-6">
                            <!-- card -->
                            <div class="card card-animate">
                                <div class="card-body">
                                    <div class="d-flex align-items-center">
                                        <div class="flex-grow-1">
                                            <p class="text-uppercase fw-medium text-muted mb-0">Total Earnings</p>
                                        </div>
                                        <div class="flex-shrink-0">
                                            <h5 class="text-success fs-14 mb-0">
                                                <i class="ri-arrow-right-up-line fs-13 align-middle"></i> +16.24 %
                                            </h5>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-end justify-content-between mt-4">
                                        <div>
                                            <h4 class="fs-22 fw-semibold ff-secondary mb-4">$<span class="counter-value" data-target="559.25">0</span>k</h4>
                                            <a href="" class="text-decoration-underline">View net earnings</a>
                                        </div>
                                        <div class="avatar-sm flex-shrink-0">
                                            <span class="avatar-title bg-soft-success rounded fs-3">
                                                <i class="bx bx-dollar-circle text-success"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div><!-- end card body -->
                            </div><!-- end card -->
                        </div><!-- end col -->

                        <div class="col-xl-3 col-md-6">
                            <!-- card -->
                            <div class="card card-animate bg-info">
                                <div class="card-body">
                                    <div class="d-flex align-items-center">
                                        <div class="flex-grow-1">
                                            <p class="text-uppercase fw-medium text-white-50 mb-0">Orders</p>
                                        </div>
                                        <div class="flex-shrink-0">
                                            <h5 class="text-warning fs-14 mb-0">
                                                <i class="ri-arrow-right-down-line fs-13 align-middle"></i> -3.57 %
                                            </h5>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-end justify-content-between mt-4">
                                        <div>
                                            <h4 class="fs-22 fw-semibold ff-secondary mb-4 text-white"><span class="counter-value" data-target="36894">0</span></h4>
                                            <a href="" class="text-decoration-underline text-white-50">View all orders</a>
                                        </div>
                                        <div class="avatar-sm flex-shrink-0">
                                            <span class="avatar-title bg-soft-light rounded fs-3">
                                                <i class="bx bx-shopping-bag text-white"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div><!-- end card body -->
                            </div><!-- end card -->
                        </div><!-- end col -->

                        <div class="col-xl-3 col-md-6">
                            <!-- card -->
                            <div class="card card-animate">
                                <div class="card-body">
                                    <div class="d-flex align-items-center">
                                        <div class="flex-grow-1">
                                            <p class="text-uppercase fw-medium text-muted mb-0">Customers</p>
                                        </div>
                                        <div class="flex-shrink-0">
                                            <h5 class="text-success fs-14 mb-0">
                                                <i class="ri-arrow-right-up-line fs-13 align-middle"></i> +29.08 %
                                            </h5>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-end justify-content-between mt-4">
                                        <div>
                                            <h4 class="fs-22 fw-semibold ff-secondary mb-4"><span class="counter-value" data-target="183.35">0</span>M</h4>
                                            <a href="" class="text-decoration-underline">See details</a>
                                        </div>
                                        <div class="avatar-sm flex-shrink-0">
                                            <span class="avatar-title bg-soft-warning rounded fs-3">
                                                <i class="bx bx-user-circle text-warning"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div><!-- end card body -->
                            </div><!-- end card -->
                        </div><!-- end col -->

                        <div class="col-xl-3 col-md-6">
                            <!-- card -->
                            <div class="card card-animate">
                                <div class="card-body">
                                    <div class="d-flex align-items-center">
                                        <div class="flex-grow-1">
                                            <p class="text-uppercase fw-medium text-muted mb-0">My Balance</p>
                                        </div>
                                        <div class="flex-shrink-0">
                                            <h5 class="text-muted fs-14 mb-0">
                                                +0.00 %
                                            </h5>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-end justify-content-between mt-4">
                                        <div>
                                            <h4 class="fs-22 fw-semibold ff-secondary mb-4">$<span class="counter-value" data-target="165.89">0</span>k</h4>
                                            <a href="" class="text-decoration-underline">Withdraw money</a>
                                        </div>
                                        <div class="avatar-sm flex-shrink-0">
                                            <span class="avatar-title bg-soft-primary rounded fs-3">
                                                <i class="bx bx-wallet text-primary"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div><!-- end card body -->
                            </div><!-- end card -->
                        </div><!-- end col -->
                    </div> <!-- end row-->

                    <div class="row">
                        <div class="col-xl-12">
                            <div class="card crm-widget">
                                <div class="card-body p-0">
                                    <div class="row row-cols-md-3 row-cols-1">
                                        <div class="col col-lg border-end">
                                            <div class="py-4 px-3">
                                                <h5 class="text-muted text-uppercase fs-13">Campaign Sent <i class="ri-arrow-up-circle-line text-success fs-18 float-end align-middle"></i>
                                                </h5>
                                                <div class="d-flex align-items-center">
                                                    <div class="flex-shrink-0">
                                                        <i class="ri-space-ship-line display-6 text-muted"></i>
                                                    </div>
                                                    <div class="flex-grow-1 ms-3">
                                                        <h2 class="mb-0"><span class="counter-value" data-target="197">0</span></h2>
                                                    </div>
                                                </div>
                                            </div>
                                        </div><!-- end col -->
                                        <div class="col col-lg border-end">
                                            <div class="mt-3 mt-md-0 py-4 px-3">
                                                <h5 class="text-muted text-uppercase fs-13">Annual Profit <i class="ri-arrow-up-circle-line text-success fs-18 float-end align-middle"></i></h5>
                                                <div class="d-flex align-items-center">
                                                    <div class="flex-shrink-0">
                                                        <i class="ri-exchange-dollar-line display-6 text-muted"></i>
                                                    </div>
                                                    <div class="flex-grow-1 ms-3">
                                                        <h2 class="mb-0">$<span class="counter-value" data-target="489.4">0</span>k</h2>
                                                    </div>
                                                </div>
                                            </div>
                                        </div><!-- end col -->
                                        <div class="col col-lg border-end">
                                            <div class="mt-3 mt-md-0 py-4 px-3">
                                                <h5 class="text-muted text-uppercase fs-13">
                                                    Lead Coversation <i class="ri-arrow-down-circle-line text-danger fs-18 float-end align-middle"></i>
                                                </h5>
                                                <div class="d-flex align-items-center">
                                                    <div class="flex-shrink-0">
                                                        <i class="ri-pulse-line display-6 text-muted"></i>
                                                    </div>
                                                    <div class="flex-grow-1 ms-3">
                                                        <h2 class="mb-0"><span class="counter-value" data-target="32.89">0</span>%</h2>
                                                    </div>
                                                </div>
                                            </div>
                                        </div><!-- end col -->
                                        <div class="col col-lg border-end">
                                            <div class="mt-3 mt-lg-0 py-4 px-3">
                                                <h5 class="text-muted text-uppercase fs-13">
                                                    Daily Average Income <i class="ri-arrow-up-circle-line text-success fs-18 float-end align-middle"></i>
                                                </h5>
                                                <div class="d-flex align-items-center">
                                                    <div class="flex-shrink-0">
                                                        <i class="ri-trophy-line display-6 text-muted"></i>
                                                    </div>
                                                    <div class="flex-grow-1 ms-3">
                                                        <h2 class="mb-0">$<span class="counter-value" data-target="1596.5">0</span></h2>
                                                    </div>
                                                </div>
                                            </div>
                                        </div><!-- end col -->
                                        <div class="col col-lg">
                                            <div class="mt-3 mt-lg-0 py-4 px-3">
                                                <h5 class="text-muted text-uppercase fs-13">
                                                    Annual Deals <i class="ri-arrow-down-circle-line text-danger fs-18 float-end align-middle"></i>
                                                </h5>
                                                <div class="d-flex align-items-center">
                                                    <div class="flex-shrink-0">
                                                        <i class="ri-service-line display-6 text-muted"></i>
                                                    </div>
                                                    <div class="flex-grow-1 ms-3">
                                                        <h2 class="mb-0"><span class="counter-value" data-target="2659">0</span></h2>
                                                    </div>
                                                </div>
                                            </div>
                                        </div><!-- end col -->
                                    </div><!-- end row -->
                                </div><!-- end card body -->
                            </div><!-- end card -->
                        </div><!-- end col -->
                    </div><!-- end row -->

                    <div class="row">
                        <div class="col-xl-3 col-md-6">
                            <div class="card card-animate">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between">
                                        <div>
                                            <p class="fw-medium text-muted mb-0">Users</p>
                                            <h2 class="mt-4 ff-secondary fw-semibold"><span class="counter-value" data-target="28.05">0</span>k</h2>
                                            <p class="mb-0 text-muted"><span class="badge bg-light text-success mb-0"><i class="ri-arrow-up-line align-middle"></i> 16.24 % </span> vs. previous month</p>
                                        </div>
                                        <div>
                                            <div class="avatar-sm flex-shrink-0">
                                                <span class="avatar-title bg-soft-info rounded-circle fs-2">
                                                    <i data-feather="users" class="text-info"></i>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div><!-- end card body -->
                            </div> <!-- end card-->
                        </div> <!-- end col-->

                        <div class="col-xl-3 col-md-6">
                            <div class="card card-animate">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between">
                                        <div>
                                            <p class="fw-medium text-muted mb-0">Sessions</p>
                                            <h2 class="mt-4 ff-secondary fw-semibold"><span class="counter-value" data-target="97.66">0</span>k</h2>
                                            <p class="mb-0 text-muted"><span class="badge bg-light text-danger mb-0"><i class="ri-arrow-down-line align-middle"></i> 3.96 % </span> vs. previous month</p>
                                        </div>
                                        <div>
                                            <div class="avatar-sm flex-shrink-0">
                                                <span class="avatar-title bg-soft-info rounded-circle fs-2">
                                                    <i data-feather="activity" class="text-info"></i>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div><!-- end card body -->
                            </div> <!-- end card-->
                        </div> <!-- end col-->

                        <div class="col-xl-3 col-md-6">
                            <div class="card card-animate bg-primary">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between">
                                        <div>
                                            <p class="fw-medium text-white-50 mb-0">Avg. Visit Duration</p>
                                            <h2 class="mt-4 ff-secondary fw-semibold text-white"><span class="counter-value" data-target="3">0</span>m <span class="counter-value" data-target="40">0</span>sec</h2>
                                            <p class="mb-0 text-white-50"><span class="badge badge-soft-light mb-0"><i class="ri-arrow-down-line align-middle"></i> 0.24 % </span> vs. previous month</p>
                                        </div>
                                        <div>
                                            <div class="avatar-sm flex-shrink-0">
                                                <span class="avatar-title bg-soft-light rounded-circle fs-2">
                                                    <i data-feather="clock" class="text-white"></i>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div><!-- end card body -->
                            </div> <!-- end card-->
                        </div> <!-- end col-->

                        <div class="col-xl-3 col-md-6">
                            <div class="card card-animate">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between">
                                        <div>
                                            <p class="fw-medium text-muted mb-0">Bounce Rate</p>
                                            <h2 class="mt-4 ff-secondary fw-semibold"><span class="counter-value" data-target="33.48">0</span>%</h2>
                                            <p class="mb-0 text-muted"><span class="badge bg-light text-success mb-0"><i class="ri-arrow-up-line align-middle"></i> 7.05 % </span> vs. previous month</p>
                                        </div>
                                        <div>
                                            <div class="avatar-sm flex-shrink-0">
                                                <span class="avatar-title bg-soft-info rounded-circle fs-2">
                                                    <i data-feather="external-link" class="text-info"></i>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div><!-- end card body -->
                            </div> <!-- end card-->
                        </div> <!-- end col-->
                    </div> <!-- end row-->

                    <div class="row">
                        <div class="col-xl-3 col-md-6">
                            <div class="card bg-success card-height-100">
                                <div class="card-body">
                                    <div class="d-flex align-items-center">
                                        <div class="avatar-sm flex-shrink-0">
                                            <span class="avatar-title bg-soft-light text-white rounded-2 fs-2">
                                                <i class="bx bx-shopping-bag"></i>
                                            </span>
                                        </div>
                                        <div class="flex-grow-1 ms-3">
                                            <p class="text-uppercase fw-medium text-white-50 mb-3">Total Sales</p>
                                            <h4 class="fs-4 mb-3 text-white"><span class="counter-value" data-target="2045">0</span></h4>
                                            <p class="text-white-50 mb-0">From 1930 last year</p>
                                        </div>
                                        <div class="flex-shrink-0 align-self-center">
                                            <span class="badge badge-soft-light fs-12"><i class="ri-arrow-up-s-line fs-13 align-middle me-1"></i>6.11 %<span></span></span>
                                        </div>
                                    </div>
                                </div><!-- end card body -->
                            </div>
                        </div> <!-- end col-->

                        <div class="col-xl-3 col-md-6">
                            <div class="card card-height-100">
                                <div class="card-body">
                                    <div class="d-flex align-items-center">
                                        <div class="avatar-sm flex-shrink-0">
                                            <span class="avatar-title bg-soft-warning text-warning rounded-2 fs-2">
                                                <i class="bx bxs-user-account"></i>
                                            </span>
                                        </div>
                                        <div class="flex-grow-1 ms-3">
                                            <p class="text-uppercase fw-medium text-muted mb-3">Number of Users</p>
                                            <h4 class="fs-4 mb-3"><span class="counter-value" data-target="7522">0</span></h4>
                                            <p class="text-muted mb-0">From 9530 last year</p>
                                        </div>
                                        <div class="flex-shrink-0 align-self-center">
                                            <span class="badge badge-soft-danger fs-12"><i class="ri-arrow-down-s-line fs-13 align-middle me-1"></i>10.35 %<span></span></span>
                                        </div>
                                    </div>
                                </div><!-- end card body -->
                            </div>
                        </div> <!-- end col-->

                        <div class="col-xl-3 col-md-6">
                            <div class="card card-height-100">
                                <div class="card-body">
                                    <div class="d-flex align-items-center">
                                        <div class="avatar-sm flex-shrink-0">
                                            <span class="avatar-title bg-soft-danger text-danger rounded-2 fs-2">
                                                <i class="bx bxs-badge-dollar"></i>
                                            </span>
                                        </div>
                                        <div class="flex-grow-1 ms-3">
                                            <p class="text-uppercase fw-medium text-muted mb-3">Total Revenue</p>
                                            <h4 class="fs-4 mb-3">$<span class="counter-value" data-target="2845.05">0</span></h4>
                                            <p class="text-muted mb-0">From $1,750.04 last year</p>
                                        </div>
                                        <div class="flex-shrink-0 align-self-center">
                                            <span class="badge badge-soft-success fs-12"><i class="ri-arrow-up-s-line fs-13 align-middle me-1"></i>22.96 %<span></span></span>
                                        </div>
                                    </div>
                                </div><!-- end card body -->
                            </div>
                        </div> <!-- end col-->

                        <div class="col-xl-3 col-md-6">
                            <div class="card card-height-100">
                                <div class="card-body">
                                    <div class="d-flex align-items-center">
                                        <div class="avatar-sm flex-shrink-0">
                                            <span class="avatar-title bg-soft-info text-info rounded-2 fs-2">
                                                <i class="bx bx-store-alt"></i>
                                            </span>
                                        </div>
                                        <div class="flex-grow-1 ms-3">
                                            <p class="text-uppercase fw-medium text-muted mb-3">Number of Stores</p>
                                            <h4 class="fs-4 mb-3"><span class="counter-value" data-target="405">0</span>k</h4>
                                            <p class="text-muted mb-0">From 308 last year</p>
                                        </div>
                                        <div class="flex-shrink-0 align-self-center">
                                            <span class="badge badge-soft-success fs-12"><i class="ri-arrow-up-s-line fs-13 align-middle me-1"></i>16.31 %<span></span></span>
                                        </div>
                                    </div>
                                </div><!-- end card body -->
                            </div>
                        </div> <!-- end col-->
                    </div> <!-- end row-->

                    <div class="row">
                        <div class="col-xl-3 col-md-6">
                            <div class="card card-height-100">
                                <div class="card-body">
                                    <div class="dropdown float-end">
                                        <a class="text-reset dropdown-btn" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <span class="text-muted fs-18"><i class="mdi mdi-dots-vertical"></i></span>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-end">
                                            <a class="dropdown-item" href="#!">Favorite</a>
                                            <a class="dropdown-item" href="#!">Apply Now</a>
                                        </div>
                                    </div>
                                    <div class="mb-4 pb-2">
                                        <img src="assets/images/companies/img-3.png" alt="" class="avatar-sm"></img>
                                    </div>
                                    <a href="#!">
                                        <h6 class="fs-15 fw-semibold">Marketing Director <span class="text-muted fs-13">(2-4 Yrs Exp.)</span></h6>
                                    </a>
                                    <p class="text-muted mb-0"><i class="ri-building-line align-bottom"></i> Themesbrand <span class="ms-2"><i class="ri-map-pin-2-line align-bottom"></i> California</span></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-md-6">
                            <div class="card card-height-100">
                                <div class="card-body">
                                    <div class="dropdown float-end">
                                        <a class="text-reset dropdown-btn" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <span class="text-muted fs-18"><i class="mdi mdi-dots-vertical"></i></span>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-end">
                                            <a class="dropdown-item" href="#!">Favorite</a>
                                            <a class="dropdown-item" href="#!">Apply Now</a>
                                        </div>
                                    </div>
                                    <div class="mb-4 pb-2">
                                        <img src="assets/images/companies/img-4.png" alt="" class="avatar-sm"></img>
                                    </div>
                                    <a href="#!">
                                        <h6 class="fs-15 fw-semibold">Sr. Web Designer <span class="text-muted fs-13">(2+ Yrs Exp.)</span></h6>
                                    </a>
                                    <p class="text-muted mb-0"><i class="ri-building-line align-bottom"></i> Themesbrand <span class="ms-2"><i class="ri-map-pin-2-line align-bottom"></i> California</span></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-md-6">
                            <div class="card card-height-100 bg-soft-primary shadow-none bg-opacity-10">
                                <div class="card-body">
                                    <div class="dropdown float-end">
                                        <a class="text-reset dropdown-btn" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <span class="text-muted fs-18"><i class="mdi mdi-dots-vertical"></i></span>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-end">
                                            <a class="dropdown-item" href="#!">Favorite</a>
                                            <a class="dropdown-item" href="#!">Apply Now</a>
                                        </div>
                                    </div>
                                    <div class="mb-4 pb-2">
                                        <img src="assets/images/companies/img-6.png" alt="" class="avatar-sm"></img>
                                    </div>
                                    <a href="#!">
                                        <h6 class="fs-15 fw-semibold">Sr. Web Designer <span class="text-muted fs-13">(2+ Yrs Exp.)</span></h6>
                                    </a>
                                    <p class="text-muted mb-0"><i class="ri-building-line align-bottom"></i> Themesbrand <span class="ms-2"><i class="ri-map-pin-2-line align-bottom"></i> California</span></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-md-6">
                            <div class="card card-height-100 bg-soft-info shadow-none bg-opacity-10">
                                <div class="card-body">
                                    <div class="dropdown float-end">
                                        <a class="text-reset dropdown-btn" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <span class="text-muted fs-18"><i class="mdi mdi-dots-vertical"></i></span>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-end">
                                            <a class="dropdown-item" href="#!">Favorite</a>
                                            <a class="dropdown-item" href="#!">Apply Now</a>
                                        </div>
                                    </div>
                                    <div class="mb-4 pb-2">
                                        <img src="assets/images/companies/img-8.png" alt="" class="avatar-sm"></img>
                                    </div>
                                    <a href="#!">
                                        <h6 class="fs-15 fw-semibold">Sr. Web Designer <span class="text-muted fs-13">(2+ Yrs Exp.)</span></h6>
                                    </a>
                                    <p class="text-muted mb-0"><i class="ri-building-line align-bottom"></i> Themesbrand <span class="ms-2"><i class="ri-map-pin-2-line align-bottom"></i> California</span></p>
                                </div>
                            </div>
                        </div> <!-- end col-->
                    </div> <!-- end row-->

                    <div class="row">
                        <div class="col-12">
                            <h5 class="text-decoration-underline mb-3 mt-2 pb-3">Other Widgets</h5>
                        </div>
                    </div>
                    <!-- end row-->

                    <div class="row">
                        <div class="col-xl-4">
                            <div class="card">
                                <div class="card-body p-0">
                                    <div class="alert alert-warning border-0 rounded-top rounded-0 m-0 d-flex align-items-center" role="alert">
                                        <i data-feather="alert-triangle" class="text-warning me-2 icon-sm"></i>
                                        <div class="flex-grow-1 text-truncate">
                                            Your free trial expired in <b>17</b> days.
                                        </div>
                                        <div class="flex-shrink-0">
                                            <a href="pages-pricing.html" class="text-reset text-decoration-underline"><b>Upgrade</b></a>
                                        </div>
                                    </div>

                                    <div class="row align-items-end">
                                        <div class="col-sm-8">
                                            <div class="p-3">
                                                <p class="fs-16 lh-base">Upgrade your plan from a <span class="fw-semibold">Free trial</span>, to ‘Premium Plan’ <i class="mdi mdi-arrow-right"></i></p>
                                                <div class="mt-3">
                                                    <a href="pages-pricing.html" class="btn btn-success">Upgrade Account!</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="px-3">
                                                <img src="assets/images/user-illustarator-2.png" class="img-fluid" alt=""></img>
                                            </div>
                                        </div>
                                    </div>
                                </div> <!-- end card-body-->
                            </div>
                        </div> <!-- end col-->
                        <div class="col-xl-4">
                            <div class="card bg-primary">
                                <div class="card-body p-0">
                                    <div class="alert alert-danger rounded-top alert-solid alert-label-icon border-0 rounded-0 m-0 d-flex align-items-center" role="alert">
                                        <i class="ri-error-warning-line label-icon"></i>
                                        <div class="flex-grow-1 text-truncate">
                                            Your free trial expired in <b>17</b> days.
                                        </div>
                                        <div class="flex-shrink-0">
                                            <a href="pages-pricing.html" class="text-reset text-decoration-underline"><b>Upgrade</b></a>
                                        </div>
                                    </div>

                                    <div class="row align-items-end">
                                        <div class="col-sm-8">
                                            <div class="p-3">
                                                <p class="fs-16 lh-base text-white">Upgrade your plan from a <span class="fw-semibold">Free trial</span>, to ‘Premium Plan’ <i class="mdi mdi-arrow-right"></i></p>
                                                <div class="mt-3">
                                                    <a href="pages-pricing.html" class="btn btn-info">Upgrade Account!</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="px-3">
                                                <img src="assets/images/user-illustarator-1.png" class="img-fluid" alt=""></img>
                                            </div>
                                        </div>
                                    </div>
                                </div> <!-- end card-body-->
                            </div>
                        </div> <!-- end col-->
                        <div class="col-xl-4">
                            <div class="card">
                                <div class="card-body p-0">
                                    <div class="alert alert-warning border-0 rounded-top rounded-0 m-0 d-flex align-items-center" role="alert">
                                        <div class="flex-grow-1 text-truncate">
                                            We will choose a gift for you in <b>5</b> days.
                                        </div>
                                        <div class="flex-shrink-0">
                                            <a href="pages-pricing.html" class="text-reset text-decoration-underline"><b>Get Free Gift</b></a>
                                        </div>
                                    </div>
                                    <div class="d-flex p-3">
                                        <div class="flex-shrink-0">
                                            <div class="avatar-md me-3">
                                                <span class="avatar-title bg-soft-danger rounded-circle fs-1">
                                                    <i class="ri-gift-2-line text-danger"></i>
                                                </span>
                                            </div>
                                        </div>
                                        <div>
                                            <p class="fs-16 lh-base">Personalized <span class="fw-semibold">Gift Boxes</span>, with attitude, Let's collect your Xmas box <i class="mdi mdi-arrow-right"></i></p>
                                            <div class="mt-3">
                                                <a href="pages-pricing.html" class="btn btn-secondary">Get a Free Gift</a>
                                            </div>
                                        </div>
                                    </div>
                                </div> <!-- end card-body-->
                            </div>
                        </div> <!-- end col-->
                    </div> <!-- end row-->

                    <div class="row">
                        <div class="col-lg-4">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="fs-15 fw-semibold">Brand Logo Design - MD</h5>
                                    <p class="text-muted">Graphics Work</p>
                                    <div class="d-flex flex-wrap justify-content-evenly">
                                        <p class="text-muted mb-0">
                                            <i class="mdi mdi-numeric-1-circle text-success fs-18 align-middle me-2"></i>Completed
                                        </p>
                                        <p class="text-muted mb-0">
                                            <i class="mdi mdi-numeric-3-circle text-info fs-18 align-middle me-2"></i>In Progress
                                        </p>
                                        <p class="text-muted mb-0"><i class="mdi mdi-numeric-2-circle text-primary fs-18 align-middle me-2"></i>To Do</p>
                                    </div>
                                </div>
                                <div class="progress animated-progress rounded-bottom rounded-0" style="height: 6px;">
                                    <div class="progress-bar bg-success rounded-0" role="progressbar" style="width: 30%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
                                    <div class="progress-bar bg-info rounded-0" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                    <div class="progress-bar rounded-0" role="progressbar" style="width: 20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div><!-- end col -->
                        <div class="col-lg-4">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="fs-15 fw-semibold">Redesign - Landing Page</h5>
                                    <p class="text-muted">UI/UX Design</p>
                                    <div class="d-flex flex-wrap justify-content-evenly">
                                        <p class="text-muted mb-0">
                                            <i class="mdi mdi-numeric-3-circle text-success fs-18 align-middle me-2"></i>Completed
                                        </p>
                                        <p class="text-muted mb-0"><i class="mdi mdi-numeric-0-circle text-info fs-18 align-middle me-2"></i>In Progress</p>
                                        <p class="text-muted mb-0"><i class="mdi mdi-numeric-8-circle text-primary fs-18 align-middle me-2"></i>To Do</p>
                                    </div>
                                </div>
                                <div class="progress animated-progress rounded-bottom rounded-0" style="height: 6px;">
                                    <div class="progress-bar bg-success rounded-0" role="progressbar" style="width: 30%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
                                    <div class="progress-bar bg-info rounded-0" role="progressbar" style="width: 0%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                                    <div class="progress-bar rounded-0" role="progressbar" style="width: 70%" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div><!-- end col -->
                        <div class="col-lg-4">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="fs-15 fw-semibold">Ecommerce App for Web</h5>
                                    <p class="text-muted">CRM Project</p>
                                    <div class="d-flex flex-wrap justify-content-evenly">
                                        <p class="text-muted mb-0">
                                            <i class="mdi mdi-numeric-10-circle text-success fs-18 align-middle me-2"></i>Completed
                                        </p>
                                        <p class="text-muted mb-0"><i class="mdi mdi-numeric-3-circle text-info fs-18 align-middle me-2"></i>In Progress</p>
                                        <p class="text-muted mb-0"><i class="mdi mdi-numeric-2-circle text-primary fs-18 align-middle me-2"></i>To Do</p>
                                    </div>
                                </div>
                                <div class="progress animated-progress rounded-bottom rounded-0" style="height: 6px;">
                                    <div class="progress-bar bg-success rounded-0" role="progressbar" style="width: 60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                                    <div class="progress-bar bg-info rounded-0" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                    <div class="progress-bar rounded-0" role="progressbar" style="width: 15%" aria-valuenow="15" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div><!-- end col -->
                    </div> <!-- end row-->

                    <div class="row">
                        <div class="col-xxl-5">
                            <div class="card card-height-100">
                                <div class="card-header align-items-center d-flex">
                                    <h4 class="card-title mb-0 flex-grow-1">Upcoming Activities</h4>
                                    <div class="flex-shrink-0">
                                        <div class="dropdown card-header-dropdown">
                                            <a class="text-reset dropdown-btn" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <span class="text-muted fs-18"><i class="mdi mdi-dots-vertical"></i></span>
                                            </a>
                                            <div class="dropdown-menu dropdown-menu-end">
                                                <a class="dropdown-item" href="#">Edit</a>
                                                <a class="dropdown-item" href="#">Remove</a>
                                            </div>
                                        </div>
                                    </div>
                                </div><!-- end card header -->
                                <div class="card-body pt-0">
                                    <ul class="list-group list-group-flush border-dashed">
                                        <li class="list-group-item ps-0">
                                            <div class="row align-items-center g-3">
                                                <div class="col-auto">
                                                    <div class="avatar-sm p-1 py-2 h-auto bg-light rounded-3">
                                                        <div class="text-center">
                                                            <h5 class="mb-0">25</h5>
                                                            <div class="text-muted">Tue</div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <h5 class="text-muted mt-0 mb-1 fs-13">12:00am - 03:30pm</h5>
                                                    <a href="#" class="text-reset fs-14 mb-0">Meeting for campaign with sales team</a>
                                                </div>
                                                <div class="col-sm-auto">
                                                    <div class="avatar-group">
                                                        <div class="avatar-group-item">
                                                            <a href="javascript: void(0);" class="d-inline-block" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Stine Nielsen">
                                                                <img src="assets/images/users/avatar-1.jpg" alt="" class="rounded-circle avatar-xxs"></img>
                                                            </a>
                                                        </div>
                                                        <div class="avatar-group-item">
                                                            <a href="javascript: void(0);" class="d-inline-block" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Jansh Brown">
                                                                <img src="assets/images/users/avatar-2.jpg" alt="" class="rounded-circle avatar-xxs"></img>
                                                            </a>
                                                        </div>
                                                        <div class="avatar-group-item">
                                                            <a href="javascript: void(0);" class="d-inline-block" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Dan Gibson">
                                                                <img src="assets/images/users/avatar-3.jpg" alt="" class="rounded-circle avatar-xxs"></img>
                                                            </a>
                                                        </div>
                                                        <div class="avatar-group-item">
                                                            <a href="javascript: void(0);">
                                                                <div class="avatar-xxs">
                                                                    <span class="avatar-title rounded-circle bg-info text-white">
                                                                        5
                                                                    </span>
                                                                </div>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- end row -->
                                        </li><!-- end -->
                                        <li class="list-group-item ps-0">
                                            <div class="row align-items-center g-3">
                                                <div class="col-auto">
                                                    <div class="avatar-sm p-1 py-2 h-auto bg-light rounded-3">
                                                        <div class="text-center">
                                                            <h5 class="mb-0">20</h5>
                                                            <div class="text-muted">Wed</div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <h5 class="text-muted mt-0 mb-1 fs-13">02:00pm - 03:45pm</h5>
                                                    <a href="#" class="text-reset fs-14 mb-0">Adding a new event with attachments</a>
                                                </div>
                                                <div class="col-sm-auto">
                                                    <div class="avatar-group">
                                                        <div class="avatar-group-item">
                                                            <a href="javascript: void(0);" class="d-inline-block" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Frida Bang">
                                                                <img src="assets/images/users/avatar-4.jpg" alt="" class="rounded-circle avatar-xxs"></img>
                                                            </a>
                                                        </div>
                                                        <div class="avatar-group-item">
                                                            <a href="javascript: void(0);" class="d-inline-block" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Malou Silva">
                                                                <img src="assets/images/users/avatar-5.jpg" alt="" class="rounded-circle avatar-xxs"></img>
                                                            </a>
                                                        </div>
                                                        <div class="avatar-group-item">
                                                            <a href="javascript: void(0);" class="d-inline-block" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Simon Schmidt">
                                                                <img src="assets/images/users/avatar-6.jpg" alt="" class="rounded-circle avatar-xxs"></img>
                                                            </a>
                                                        </div>
                                                        <div class="avatar-group-item">
                                                            <a href="javascript: void(0);" class="d-inline-block" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Tosh Jessen">
                                                                <img src="assets/images/users/avatar-7.jpg" alt="" class="rounded-circle avatar-xxs"></img>
                                                            </a>
                                                        </div>
                                                        <div class="avatar-group-item">
                                                            <a href="javascript: void(0);">
                                                                <div class="avatar-xxs">
                                                                    <span class="avatar-title rounded-circle bg-success text-white">
                                                                        3
                                                                    </span>
                                                                </div>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- end row -->
                                        </li><!-- end -->
                                        <li class="list-group-item ps-0">
                                            <div class="row align-items-center g-3">
                                                <div class="col-auto">
                                                    <div class="avatar-sm p-1 py-2 h-auto bg-light rounded-3">
                                                        <div class="text-center">
                                                            <h5 class="mb-0">17</h5>
                                                            <div class="text-muted">Wed</div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <h5 class="text-muted mt-0 mb-1 fs-13">04:30pm - 07:15pm</h5>
                                                    <a href="#" class="text-reset fs-14 mb-0">Create new project Bundling Product</a>
                                                </div>
                                                <div class="col-sm-auto">
                                                    <div class="avatar-group">
                                                        <div class="avatar-group-item">
                                                            <a href="javascript: void(0);" class="d-inline-block" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Nina Schmidt">
                                                                <img src="assets/images/users/avatar-8.jpg" alt="" class="rounded-circle avatar-xxs"></img>
                                                            </a>
                                                        </div>
                                                        <div class="avatar-group-item">
                                                            <a href="javascript: void(0);" class="d-inline-block" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Stine Nielsen">
                                                                <img src="assets/images/users/avatar-1.jpg" alt="" class="rounded-circle avatar-xxs"></img>
                                                            </a>
                                                        </div>
                                                        <div class="avatar-group-item">
                                                            <a href="javascript: void(0);" class="d-inline-block" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Jansh Brown">
                                                                <img src="assets/images/users/avatar-2.jpg" alt="" class="rounded-circle avatar-xxs"></img>
                                                            </a>
                                                        </div>
                                                        <div class="avatar-group-item">
                                                            <a href="javascript: void(0);">
                                                                <div class="avatar-xxs">
                                                                    <span class="avatar-title rounded-circle bg-primary text-white">
                                                                        4
                                                                    </span>
                                                                </div>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- end row -->
                                        </li><!-- end -->
                                        <li class="list-group-item ps-0">
                                            <div class="row align-items-center g-3">
                                                <div class="col-auto">
                                                    <div class="avatar-sm p-1 py-2 h-auto bg-light rounded-3">
                                                        <div class="text-center">
                                                            <h5 class="mb-0">12</h5>
                                                            <div class="text-muted">Tue</div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <h5 class="text-muted mt-0 mb-1 fs-13">10:30am - 01:15pm</h5>
                                                    <a href="#" class="text-reset fs-14 mb-0">Weekly closed sales won checking with sales team</a>
                                                </div>
                                                <div class="col-sm-auto">
                                                    <div class="avatar-group">
                                                        <div class="avatar-group-item">
                                                            <a href="javascript: void(0);" class="d-inline-block" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Stine Nielsen">
                                                                <img src="assets/images/users/avatar-1.jpg" alt="" class="rounded-circle avatar-xxs"></img>
                                                            </a>
                                                        </div>
                                                        <div class="avatar-group-item">
                                                            <a href="javascript: void(0);" class="d-inline-block" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Jansh Brown">
                                                                <img src="assets/images/users/avatar-5.jpg" alt="" class="rounded-circle avatar-xxs"></img>
                                                            </a>
                                                        </div>
                                                        <div class="avatar-group-item">
                                                            <a href="javascript: void(0);" class="d-inline-block" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Dan Gibson">
                                                                <img src="assets/images/users/avatar-2.jpg" alt="" class="rounded-circle avatar-xxs"></img>
                                                            </a>
                                                        </div>
                                                        <div class="avatar-group-item">
                                                            <a href="javascript: void(0);">
                                                                <div class="avatar-xxs">
                                                                    <span class="avatar-title rounded-circle bg-warning text-white">
                                                                        9
                                                                    </span>
                                                                </div>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- end row -->
                                        </li><!-- end -->
                                    </ul><!-- end -->
                                    <div class="align-items-center mt-2 row text-center text-sm-start">
                                        <div class="col-sm">
                                            <div class="text-muted">Showing<span class="fw-semibold">4</span> of <span class="fw-semibold">125</span> Results</div>
                                        </div>
                                        <div class="col-sm-auto">
                                            <ul class="pagination pagination-separated pagination-sm justify-content-center justify-content-sm-start mb-0">
                                                <li class="page-item disabled">
                                                    <a href="#" class="page-link">←</a>
                                                </li>
                                                <li class="page-item">
                                                    <a href="#" class="page-link">1</a>
                                                </li>
                                                <li class="page-item active">
                                                    <a href="#" class="page-link">2</a>
                                                </li>
                                                <li class="page-item">
                                                    <a href="#" class="page-link">3</a>
                                                </li>
                                                <li class="page-item">
                                                    <a href="#" class="page-link">→</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div><!-- end card body -->
                            </div><!-- end card -->
                        </div> <!-- end col-->
                        <div class="col-xxl-7">
                            <div class="row">
                                <div class="col-xl-6">
                                    <div class="card card-height-100">
                                        <div class="card-header align-items-center d-flex">
                                            <h4 class="card-title mb-0 flex-grow-1">My Tasks</h4>
                                            <div class="flex-shrink-0">
                                                <div class="dropdown card-header-dropdown">
                                                    <a class="text-reset dropdown-btn" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        <span class="text-muted"><i class="ri-settings-4-line align-middle me-1 fs-15"></i>Settings</span>
                                                    </a>
                                                    <div class="dropdown-menu dropdown-menu-end">
                                                        <a class="dropdown-item" href="#">Edit</a>
                                                        <a class="dropdown-item" href="#">Remove</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div><!-- end card header -->

                                        <div class="card-body p-0">

                                            <div class="align-items-center p-3 justify-content-between d-flex">
                                                <div class="flex-shrink-0">
                                                    <div class="text-muted"><span class="fw-semibold">4</span> of <span class="fw-semibold">10</span> remaining</div>
                                                </div>
                                                <button type="button" class="btn btn-sm btn-success"><i class="ri-add-line align-middle me-1"></i> Add Task</button>
                                            </div><!-- end card header -->

                                            <div data-simplebar="" style="max-height: 257px;">
                                                <ul class="list-group list-group-flush border-dashed px-3">
                                                    <li class="list-group-item ps-0">
                                                        <div class="d-flex align-items-start">
                                                            <div class="form-check ps-0 flex-sharink-0">
                                                                <input type="checkbox" class="form-check-input ms-0" id="task_one"></input>
                                                            </div>
                                                            <div class="flex-grow-1">
                                                                <label class="form-check-label mb-0 ps-2" for="task_one">Review and make sure nothing slips through cracks</label>
                                                            </div>
                                                            <div class="flex-shrink-0 ms-2">
                                                                <p class="text-muted fs-12 mb-0">15 Sep, 2021</p>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="list-group-item ps-0">
                                                        <div class="d-flex align-items-start">
                                                            <div class="form-check ps-0 flex-sharink-0">
                                                                <input type="checkbox" class="form-check-input ms-0" id="task_two"></input>
                                                            </div>
                                                            <div class="flex-grow-1">
                                                                <label class="form-check-label mb-0 ps-2" for="task_two">Send meeting invites for sales upcampaign</label>
                                                            </div>
                                                            <div class="flex-shrink-0 ms-2">
                                                                <p class="text-muted fs-12 mb-0">20 Sep, 2021</p>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="list-group-item ps-0">
                                                        <div class="d-flex align-items-start">
                                                            <div class="form-check flex-sharink-0 ps-0">
                                                                <input type="checkbox" class="form-check-input ms-0" id="task_three"></input>
                                                            </div>
                                                            <div class="flex-grow-1">
                                                                <label class="form-check-label mb-0 ps-2" for="task_three">Weekly closed sales won checking with sales team</label>
                                                            </div>
                                                            <div class="flex-shrink-0 ms-2">
                                                                <p class="text-muted fs-12 mb-0">24 Sep, 2021</p>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="list-group-item ps-0">
                                                        <div class="d-flex align-items-start">
                                                            <div class="form-check ps-0 flex-sharink-0">
                                                                <input type="checkbox" class="form-check-input ms-0" id="task_four"></input>
                                                            </div>
                                                            <div class="flex-grow-1">
                                                                <label class="form-check-label mb-0 ps-2" for="task_four">Add notes that can be viewed from the individual view</label>
                                                            </div>
                                                            <div class="flex-shrink-0 ms-2">
                                                                <p class="text-muted fs-12 mb-0">27 Sep, 2021</p>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="list-group-item ps-0">
                                                        <div class="d-flex align-items-start">
                                                            <div class="form-check ps-0 flex-sharink-0">
                                                                <input type="checkbox" class="form-check-input ms-0" id="task_five"></input>
                                                            </div>
                                                            <div class="flex-grow-1">
                                                                <label class="form-check-label mb-0 ps-2" for="task_five">Move stuff to another page</label>
                                                            </div>
                                                            <div class="flex-shrink-0 ms-2">
                                                                <p class="text-muted fs-12 mb-0">27 Sep, 2021</p>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="list-group-item ps-0">
                                                        <div class="d-flex align-items-start">
                                                            <div class="form-check ps-0 flex-sharink-0">
                                                                <input type="checkbox" class="form-check-input ms-0" id="task_six"></input>
                                                            </div>
                                                            <div class="flex-grow-1">
                                                                <label class="form-check-label mb-0 ps-2" for="task_six">Styling wireframe design and documentation for velzon admin</label>
                                                            </div>
                                                            <div class="flex-shrink-0 ms-2">
                                                                <p class="text-muted fs-12 mb-0">27 Sep, 2021</p>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ul><!-- end ul -->
                                            </div>
                                            <div class="p-3">
                                                <a href="javascript:void(0);" class="text-muted text-decoration-underline">Show more...</a>
                                            </div>
                                        </div><!-- end card body -->
                                    </div><!-- end card -->
                                </div><!-- end col -->
                                <div class="col-xl-6">
                                    <div class="card card-height-100">
                                        <div class="card-header border-bottom-dashed align-items-center d-flex">
                                            <h4 class="card-title mb-0 flex-grow-1">Recent Activity</h4>
                                            <div class="flex-shrink-0">
                                                <button type="button" class="btn btn-soft-primary btn-sm">
                                                    View All Activity
                                                </button>
                                            </div>
                                        </div><!-- end cardheader -->
                                        <div class="card-body p-0">
                                            <div data-simplebar="" style="max-height: 364px;" class="p-3">
                                                <div class="acitivity-timeline acitivity-main">
                                                    <div class="acitivity-item d-flex">
                                                        <div class="flex-shrink-0 avatar-xs acitivity-avatar">
                                                            <div class="avatar-title bg-soft-success text-success rounded-circle">
                                                                <i class="ri-shopping-cart-2-line"></i>
                                                            </div>
                                                        </div>
                                                        <div class="flex-grow-1 ms-3">
                                                            <h6 class="mb-1">Purchase by James Price</h6>
                                                            <p class="text-muted mb-1">Product noise evolve smartwatch</p>
                                                            <small class="mb-0 text-muted">02:14 PM Today</small>
                                                        </div>
                                                    </div>
                                                    <div class="acitivity-item py-3 d-flex">
                                                        <div class="flex-shrink-0 avatar-xs acitivity-avatar">
                                                            <div class="avatar-title bg-soft-primary text-primary rounded-circle">
                                                                <i class="ri-stack-fill"></i>
                                                            </div>
                                                        </div>
                                                        <div class="flex-grow-1 ms-3">
                                                            <h6 class="mb-1">Added new <span class="fw-semibold">style collection</span></h6>
                                                            <p class="text-muted mb-1">By Nesta Technologies</p>
                                                            <div class="d-inline-flex gap-2 border border-dashed p-2 mb-2 w-75">
                                                                <a href="apps-ecommerce-product-details.html" class="bg-light rounded p-1">
                                                                    <img src="assets/images/products/img-8.png" alt="" class="img-fluid d-block" />
                                                                </a>
                                                                <a href="apps-ecommerce-product-details.html" class="bg-light rounded p-1">
                                                                    <img src="assets/images/products/img-2.png" alt="" class="img-fluid d-block" />
                                                                </a>
                                                                <a href="apps-ecommerce-product-details.html" class="bg-light rounded p-1">
                                                                    <img src="assets/images/products/img-10.png" alt="" class="img-fluid d-block" />
                                                                </a>
                                                            </div>
                                                            <p class="mb-0 text-muted"><small>9:47 PM Yesterday</small>
                                                            </p>
                                                        </div>
                                                    </div>
                                                    <div class="acitivity-item py-3 d-flex">
                                                        <div class="flex-shrink-0">
                                                            <img src="assets/images/users/avatar-2.jpg" alt="" class="avatar-xs rounded-circle acitivity-avatar"></img>
                                                        </div>
                                                        <div class="flex-grow-1 ms-3">
                                                            <h6 class="mb-1">Natasha Carey have liked the products</h6>
                                                            <p class="text-muted mb-1">Allow users to like products in your WooCommerce store.</p>
                                                            <small class="mb-0 text-muted">25 Dec, 2021</small>
                                                        </div>
                                                    </div>
                                                    <div class="acitivity-item py-3 d-flex">
                                                        <div class="flex-shrink-0">
                                                            <div class="avatar-xs acitivity-avatar">
                                                                <div class="avatar-title rounded-circle bg-secondary">
                                                                    <i class="mdi mdi-sale fs-14"></i>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="flex-grow-1 ms-3">
                                                            <h6 class="mb-1">Today offers by <a href="apps-ecommerce-seller-details.html" class="link-secondary">Digitech Galaxy</a></h6>
                                                            <p class="text-muted mb-2">Offer is valid on orders of Rs.500 Or above for selected products only.</p>
                                                            <small class="mb-0 text-muted">12 Dec, 2021</small>
                                                        </div>
                                                    </div>
                                                    <div class="acitivity-item py-3 d-flex">
                                                        <div class="flex-shrink-0">
                                                            <div class="avatar-xs acitivity-avatar">
                                                                <div class="avatar-title rounded-circle bg-soft-danger text-danger">
                                                                    <i class="ri-bookmark-fill"></i>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="flex-grow-1 ms-3">
                                                            <h6 class="mb-1">Favoried Product</h6>
                                                            <p class="text-muted mb-2">Esther James have favorited product.</p>
                                                            <small class="mb-0 text-muted">25 Nov, 2021</small>
                                                        </div>
                                                    </div>
                                                    <div class="acitivity-item py-3 d-flex">
                                                        <div class="flex-shrink-0">
                                                            <div class="avatar-xs acitivity-avatar">
                                                                <div class="avatar-title rounded-circle bg-secondary">
                                                                    <i class="mdi mdi-sale fs-14"></i>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="flex-grow-1 ms-3">
                                                            <h6 class="mb-1">Flash sale starting <span class="text-primary">Tomorrow.</span></h6>
                                                            <p class="text-muted mb-0">Flash sale by <a href="javascript:void(0);" class="link-secondary fw-medium">Zoetic Fashion</a></p>
                                                            <small class="mb-0 text-muted">22 Oct, 2021</small>
                                                        </div>
                                                    </div>
                                                    <div class="acitivity-item py-3 d-flex">
                                                        <div class="flex-shrink-0">
                                                            <div class="avatar-xs acitivity-avatar">
                                                                <div class="avatar-title rounded-circle bg-soft-info text-info">
                                                                    <i class="ri-line-chart-line"></i>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="flex-grow-1 ms-3">
                                                            <h6 class="mb-1">Monthly sales report</h6>
                                                            <p class="text-muted mb-2"><span class="text-danger">
                                                                    2 days left</span> notification to submit the monthly sales report. <a href="javascript:void(0);" class="link-warning text-decoration-underline">Reports Builder</a>
                                                            </p>
                                                            <small class="mb-0 text-muted">15 Oct</small>
                                                        </div>
                                                    </div>
                                                    <div class="acitivity-item d-flex">
                                                        <div class="flex-shrink-0">
                                                            <img src="assets/images/users/avatar-3.jpg" alt="" class="avatar-xs rounded-circle acitivity-avatar" />
                                                        </div>
                                                        <div class="flex-grow-1 ms-3">
                                                            <h6 class="mb-1">Frank Hook Commented</h6>
                                                            <p class="text-muted mb-2 fst-italic">" A product that has reviews is more likable to be sold than a product. "</p>
                                                            <small class="mb-0 text-muted">26 Aug, 2021</small>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div><!-- end card body -->
                                    </div><!-- end card -->
                                </div><!-- end col -->
                            </div> <!-- end row-->
                        </div> <!-- end col-xl-7-->
                    </div>
                    <!-- end row-->

                    <div class="row">
                        <div class="col-xl-4 col-md-6">
                            <div class="card card-height-100">
                                <div class="d-flex">
                                    <div class="flex-grow-1 p-3">
                                        <h5 class="mb-3">Application</h5>
                                        <p class="mb-0 text-muted"><span class="badge bg-light text-success mb-0"> <i class="ri-arrow-up-line align-middle"></i> 16.24 % </span> vs. previous month</p>
                                    </div>
                                    <div>
                                        <div class="apex-charts" data-colors='["--vz-success" , "--vz-transparent"]' dir="ltr" id="results_sparkline_charts"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4 col-md-6">
                            <div class="card card-height-100">
                                <div class="d-flex">
                                    <div class="flex-grow-1 p-3">
                                        <h5 class="mb-3">Interviewed</h5>
                                        <p class="mb-0 text-muted"><span class="badge bg-light text-success mb-0"> <i class="ri-arrow-up-line align-middle"></i> 34.24 % </span> vs. previous month</p>
                                    </div>
                                    <div>
                                        <div class="apex-charts" data-colors='["--vz-danger" , "--vz-transparent"]' dir="ltr" id="results_sparkline_charts2"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4 col-md-6">
                            <div class="card card-height-100">
                                <div class="d-flex">
                                    <div class="flex-grow-1 p-3">
                                        <h5 class="mb-3">Hired</h5>
                                        <p class="mb-0 text-muted"><span class="badge bg-light text-success mb-0"> <i class="ri-arrow-up-line align-middle"></i> 6.67 % </span> vs. previous month</p>
                                    </div>
                                    <div>
                                        <div class="apex-charts" data-colors='["--vz-success" , "--vz-transparent"]' dir="ltr" id="results_sparkline_charts3"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12">
                            <h5 class="text-decoration-underline mb-3 mt-2 pb-3">Chart &amp; Map Widgets</h5>
                        </div>
                    </div>
                    <!-- end row-->

                    <div class="row">
                        <div class="col-xxl-4 col-xl-6">
                            <div class="card card-height-100">
                                <div class="card-header align-items-center d-flex">
                                    <h4 class="card-title mb-0 flex-grow-1">Live Users By Country</h4>
                                    <div class="flex-shrink-0">
                                        <button type="button" class="btn btn-soft-primary btn-sm">
                                            Export Report
                                        </button>
                                    </div>
                                </div><!-- end card header -->

                                <!-- card body -->
                                <div class="card-body">

                                    <div id="users-by-country" data-colors='["--vz-light"]' style="height: 252px"></div>

                                    <div class="table-responsive table-card mt-3">
                                        <table class="table table-borderless table-sm table-centered align-middle table-nowrap mb-1">
                                            <thead class="text-muted border-dashed border border-start-0 border-end-0 bg-soft-light">
                                                <tr>
                                                    <th>Duration (Secs)</th>
                                                    <th style="width: 30%;">Sessions</th>
                                                    <th style="width: 30%;">Views</th>
                                                </tr>
                                            </thead>
                                            <tbody class="border-0">
                                                <tr>
                                                    <td>0-30</td>
                                                    <td>2,250</td>
                                                    <td>4,250</td>
                                                </tr>
                                                <tr>
                                                    <td>31-60</td>
                                                    <td>1,501</td>
                                                    <td>2,050</td>
                                                </tr>
                                                <tr>
                                                    <td>61-120</td>
                                                    <td>750</td>
                                                    <td>1,600</td>
                                                </tr>
                                                <tr>
                                                    <td>121-240</td>
                                                    <td>540</td>
                                                    <td>1,040</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <!-- end card body -->
                            </div><!-- end card -->
                        </div><!-- end col -->

                        <div class="col-xxl-4 col-xl-6">
                            <div class="card card-height-100">
                                <div class="card-header align-items-center d-flex">
                                    <h4 class="card-title mb-0 flex-grow-1">Sessions by Countries</h4>
                                    <div>
                                        <button type="button" class="btn btn-soft-secondary btn-sm">
                                            ALL
                                        </button>
                                        <button type="button" class="btn btn-soft-primary btn-sm">
                                            1M
                                        </button>
                                        <button type="button" class="btn btn-soft-secondary btn-sm">
                                            6M
                                        </button>
                                    </div>
                                </div>
                                <div class="card-body p-0">
                                    <div>
                                        <div id="countries_charts" data-colors='["--vz-info", "--vz-info", "--vz-info", "--vz-info", "--vz-danger", "--vz-info", "--vz-info", "--vz-info", "--vz-info", "--vz-info"]' class="apex-charts" dir="ltr"></div>
                                    </div>
                                </div><!-- end card body -->
                            </div><!-- end card -->
                        </div> <!-- end col-->

                        <div class="col-xxl-4">
                            <div class="card card-height-100">
                                <div class="card-header border-0 align-items-center d-flex">
                                    <h4 class="card-title mb-0 flex-grow-1">Audiences Metrics</h4>
                                    <div>
                                        <button type="button" class="btn btn-soft-secondary btn-sm">
                                            ALL
                                        </button>
                                        <button type="button" class="btn btn-soft-secondary btn-sm">
                                            1M
                                        </button>
                                        <button type="button" class="btn btn-soft-secondary btn-sm">
                                            6M
                                        </button>
                                        <button type="button" class="btn btn-soft-primary btn-sm">
                                            1Y
                                        </button>
                                    </div>
                                </div><!-- end card header -->
                                <div class="card-header p-0">
                                    <div class="alert alert-warning alert-solid alert-label-icon border-0 rounded-0 m-0 d-flex align-items-center" role="alert">
                                        <i class="ri-error-warning-line label-icon"></i>
                                        <div class="flex-grow-1 text-truncate">
                                            Your free trial expired in <b>17</b> days.
                                        </div>
                                        <div class="flex-shrink-0">
                                            <a href="pages-pricing.html" class="text-reset text-decoration-underline"><b>Upgrade</b></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-header p-0 border-0 bg-soft-light">
                                    <div class="row g-0 text-center">
                                        <div class="col-6 col-sm-4">
                                            <div class="p-3 border border-dashed border-start-0">
                                                <h5 class="mb-1"><span class="counter-value" data-target="854">0</span>
                                                    <span class="text-success ms-1 fs-12">49%<i class="ri-arrow-right-up-line ms-1 align-middle"></i></span>
                                                </h5>
                                                <p class="text-muted mb-0">Avg. Session</p>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-6 col-sm-4">
                                            <div class="p-3 border border-dashed border-start-0">
                                                <h5 class="mb-1"><span class="counter-value" data-target="1278">0</span>
                                                    <span class="text-success ms-1 fs-12">60%<i class="ri-arrow-right-up-line ms-1 align-middle"></i></span>
                                                </h5>
                                                <p class="text-muted mb-0">Conversion Rate</p>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-6 col-sm-4">
                                            <div class="p-3 border border-dashed border-start-0 border-end-0">
                                                <h5 class="mb-1"><span class="counter-value" data-target="3">0</span>m
                                                    <span class="counter-value" data-target="40">0</span>sec
                                                </h5>
                                                <p class="text-muted mb-0">Avg. Ses. Duration</p>
                                            </div>
                                        </div>
                                        <!--end col-->
                                    </div>
                                </div><!-- end card header -->

                                <div class="card-body p-0 pb-2">
                                    <div>
                                        <div id="audiences_metrics_charts" data-colors='["--vz-success", "--vz-gray-300"]' class="apex-charts" dir="ltr"></div>
                                    </div>
                                </div><!-- end card body -->
                            </div><!-- end card -->
                        </div><!-- end col -->

                    </div> <!-- end row-->

                    <div class="row">
                        <div class="col-xxl-4 col-xl-6">
                            <!-- card -->
                            <div class="card card-height-100">
                                <div class="card-header align-items-center d-flex">
                                    <h4 class="card-title mb-0 flex-grow-1">Sales by Locations</h4>
                                    <div class="flex-shrink-0">
                                        <button type="button" class="btn btn-soft-primary btn-sm">
                                            Export Report
                                        </button>
                                    </div>
                                </div><!-- end card header -->

                                <!-- card body -->
                                <div class="card-body">

                                    <div id="sales-by-locations" data-colors='["--vz-light"]' style="height: 269px">
                                    </div>

                                    <div class="px-2 py-2 mt-1">
                                        <p class="mb-1">New Maxico <span class="float-end">75%</span></p>
                                        <div class="progress mt-2" style="height: 6px;">
                                            <div class="progress-bar progress-bar-striped bg-primary" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="75"></div>
                                        </div>

                                        <p class="mt-3 mb-1">California <span class="float-end">47%</span></p>
                                        <div class="progress mt-2" style="height: 6px;">
                                            <div class="progress-bar progress-bar-striped bg-primary" role="progressbar" style="width: 47%" aria-valuenow="47" aria-valuemin="0" aria-valuemax="47"></div>
                                        </div>

                                        <p class="mt-3 mb-1">Texas <span class="float-end">82%</span></p>
                                        <div class="progress mt-2" style="height: 6px;">
                                            <div class="progress-bar progress-bar-striped bg-primary" role="progressbar" style="width: 82%" aria-valuenow="82" aria-valuemin="0" aria-valuemax="82"></div>
                                        </div>
                                    </div>
                                </div>
                                <!-- end card body -->
                            </div>
                            <!-- end card -->
                        </div>
                        <!-- end col -->

                        <div class="col-xxl-4 col-xl-6">
                            <div class="card card-height-100">
                                <div class="card-header border-bottom-dashed align-items-center d-flex">
                                    <h4 class="card-title mb-0 flex-grow-1">My Portfolio</h4>
                                    <div>
                                        <div class="dropdown">
                                            <button class="btn btn-soft-primary btn-sm" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <span class="text-uppercase">Btc<i class="mdi mdi-chevron-down align-middle ms-1"></i></span>
                                            </button>
                                            <div class="dropdown-menu dropdown-menu-end">
                                                <a class="dropdown-item" href="#">BTC</a>
                                                <a class="dropdown-item" href="#">USD</a>
                                                <a class="dropdown-item" href="#">Euro</a>
                                            </div>
                                        </div>
                                    </div>
                                </div><!-- end cardheader -->
                                <div class="card-body">
                                    <div id="portfolio_donut_charts" data-colors='["--vz-primary", "--vz-info", "--vz-warning", "--vz-success"]' class="apex-charts" dir="ltr"></div>

                                    <ul class="list-group list-group-flush border-dashed mb-0">
                                        <li class="list-group-item px-0">
                                            <div class="d-flex">
                                                <div class="flex-shrink-0 avatar-xs">
                                                    <span class="avatar-title bg-light p-1 rounded-circle">
                                                        <img src="assets/images/svg/crypto-icons/btc.svg" class="img-fluid" alt=""></img>
                                                    </span>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    <h6 class="mb-1">Bitcoin</h6>
                                                    <p class="fs-12 mb-0 text-muted">
                                                        <i class="mdi mdi-circle fs-10 align-middle text-primary me-1"></i>BTC
                                                    </p>
                                                </div>
                                                <div class="flex-shrink-0 text-end">
                                                    <h6 class="mb-1">BTC 0.00584875</h6>
                                                    <p class="text-success fs-12 mb-0">$19,405.12</p>
                                                </div>
                                            </div>
                                        </li><!-- end -->
                                        <li class="list-group-item px-0">
                                            <div class="d-flex">
                                                <div class="flex-shrink-0 avatar-xs">
                                                    <span class="avatar-title bg-light p-1 rounded-circle">
                                                        <img src="assets/images/svg/crypto-icons/eth.svg" class="img-fluid" alt=""></img>
                                                    </span>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    <h6 class="mb-1">Ethereum</h6>
                                                    <p class="fs-12 mb-0 text-muted">
                                                        <i class="mdi mdi-circle fs-10 align-middle text-info me-1"></i>ETH
                                                    </p>
                                                </div>
                                                <div class="flex-shrink-0 text-end">
                                                    <h6 class="mb-1">ETH 2.25842108</h6>
                                                    <p class="text-danger fs-12 mb-0">$40552.18</p>
                                                </div>
                                            </div>
                                        </li><!-- end -->
                                        <li class="list-group-item px-0">
                                            <div class="d-flex">
                                                <div class="flex-shrink-0 avatar-xs">
                                                    <span class="avatar-title bg-light p-1 rounded-circle">
                                                        <img src="assets/images/svg/crypto-icons/ltc.svg" class="img-fluid" alt=""></img>
                                                    </span>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    <h6 class="mb-1">Litecoin</h6>
                                                    <p class="fs-12 mb-0 text-muted">
                                                        <i class="mdi mdi-circle fs-10 align-middle text-warning me-1"></i>LTC
                                                    </p>
                                                </div>
                                                <div class="flex-shrink-0 text-end">
                                                    <h6 class="mb-1">LTC 10.58963217</h6>
                                                    <p class="text-success fs-12 mb-0">$15824.58</p>
                                                </div>
                                            </div>
                                        </li><!-- end -->
                                        <li class="list-group-item px-0 pb-0">
                                            <div class="d-flex">
                                                <div class="flex-shrink-0 avatar-xs">
                                                    <span class="avatar-title bg-light p-1 rounded-circle">
                                                        <img src="assets/images/svg/crypto-icons/dash.svg" class="img-fluid" alt=""></img>
                                                    </span>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    <h6 class="mb-1">Dash</h6>
                                                    <p class="fs-12 mb-0 text-muted">
                                                        <i class="mdi mdi-circle fs-10 align-middle text-success me-1"></i>DASH
                                                    </p>
                                                </div>
                                                <div class="flex-shrink-0 text-end">
                                                    <h6 class="mb-1">DASH 204.28565885</h6>
                                                    <p class="text-success fs-12 mb-0">$30635.84</p>
                                                </div>
                                            </div>
                                        </li><!-- end -->
                                    </ul><!-- end -->
                                </div><!-- end card body -->
                            </div><!-- end card -->
                        </div><!-- end col -->

                        <div class="col-xxl-4">
                            <div class="card card-height-100">
                                <div class="card-header align-items-center d-flex">
                                    <h4 class="card-title mb-0 flex-grow-1">Top Referrals Pages</h4>
                                    <div class="flex-shrink-0">
                                        <button type="button" class="btn btn-soft-primary btn-sm">
                                            Export Report
                                        </button>
                                    </div>
                                </div>

                                <div class="card-body">

                                    <div id="color_heatmap" data-colors='["--vz-success", "--vz-info", "--vz-primary", "--vz-warning", "--vz-secondary"]' class="apex-charts mt-n3" dir="ltr"></div>

                                    <div class="row g-3">
                                        <div class="col-md-6">
                                            <div class="d-flex mb-3">
                                                <div class="flex-grow-1">
                                                    <p class="text-truncate text-muted fs-14 mb-0">
                                                        <i class="mdi mdi-circle align-middle text-primary me-2"></i>www.google.com
                                                    </p>
                                                </div>
                                                <div class="flex-shrink-0">
                                                    <p class="mb-0">24.58%</p>
                                                </div>
                                            </div><!-- end -->
                                            <div class="d-flex mb-3">
                                                <div class="flex-grow-1">
                                                    <p class="text-truncate text-muted fs-14 mb-0">
                                                        <i class="mdi mdi-circle align-middle text-warning me-2"></i>www.medium.com
                                                    </p>
                                                </div>
                                                <div class="flex-shrink-0">
                                                    <p class="mb-0">12.22%</p>
                                                </div>
                                            </div><!-- end -->
                                            <div class="d-flex">
                                                <div class="flex-grow-1">
                                                    <p class="text-truncate text-muted fs-14 mb-0">
                                                        <i class="mdi mdi-circle align-middle text-secondary me-2"></i>Other
                                                    </p>
                                                </div>
                                                <div class="flex-shrink-0">
                                                    <p class="mb-0">17.58%</p>
                                                </div>
                                            </div><!-- end -->
                                        </div>
                                        <div class="col-md-6">
                                            <div class="d-flex mb-3">
                                                <div class="flex-grow-1">
                                                    <p class="text-truncate text-muted fs-14 mb-0">
                                                        <i class="mdi mdi-circle align-middle text-info me-2"></i>www.youtube.com
                                                    </p>
                                                </div>
                                                <div class="flex-shrink-0">
                                                    <p class="mb-0">17.51%</p>
                                                </div>
                                            </div><!-- end -->
                                            <div class="d-flex mb-3">
                                                <div class="flex-grow-1">
                                                    <p class="text-truncate text-muted fs-14 mb-0">
                                                        <i class="mdi mdi-circle align-middle text-success me-2"></i>www.meta.com
                                                    </p>
                                                </div>
                                                <div class="flex-shrink-0">
                                                    <p class="mb-0">23.05%</p>
                                                </div>
                                            </div><!-- end -->
                                        </div>
                                    </div>

                                    <div class="mt-2 text-center">
                                        <a href="javascript:void(0);" class="text-muted text-decoration-underline">Show All</a>
                                    </div>

                                </div><!-- end card body -->
                            </div>
                        </div>
                        <!--end col-->

                    </div>
                    <!-- end row-->

                    <div class="row">
                        <div class="col-12">
                            <h5 class="text-decoration-underline mb-3 mt-2 pb-3">Ecommerce Widgets</h5>
                        </div>
                    </div>
                    <!-- end row-->

                    <div class="row">
                        <div class="col-xl-3 col-md-6">
                            <div class="card card-height-100">
                                <div class="card-header align-items-center d-flex">
                                    <h4 class="card-title mb-0 flex-grow-1">Hot Products</h4>
                                    <div class="flex-shrink-0">
                                        <a class="text-muted" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            View All
                                        </a>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <!-- Swiper -->
                                    <div class="swiper mySwiper">
                                        <div class="swiper-wrapper">
                                            <div class="swiper-slide" style="max-width: 200px;">
                                                <div>
                                                    <div class="bg-soft-info rounded">
                                                        <img src="assets/images/products/img-3.png" alt="" style="max-height: 210px;max-width: auto;" />
                                                    </div>
                                                    <div class="pt-3">
                                                        <h5 class="text-secondary">$99.94</h5>
                                                        <a href="#!">
                                                            <h6 class="fs-15 lh-base text-truncate mb-0">350 ml Glass Grocery Container</h6>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="swiper-slide" style="max-width: 200px;">
                                                <div>
                                                    <div class="bg-soft-success rounded">
                                                        <img src="assets/images/products/img-4.png" alt="" style="max-height: 210px;max-width: auto;" />
                                                    </div>
                                                    <div class="pt-3">
                                                        <h5 class="text-secondary">$99.94</h5>
                                                        <a href="#!">
                                                            <h6 class="fs-15 lh-base text-truncate mb-0">Fabric Dual Tone Living Room Chair</h6>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="swiper-slide" style="max-width: 200px;">
                                                <div>
                                                    <div class="bg-soft-warning rounded">
                                                        <img src="assets/images/products/img-5.png" alt="" style="max-height: 210px;max-width: auto;" />
                                                    </div>
                                                    <div class="pt-3">
                                                        <h5 class="text-secondary">$99.94</h5>
                                                        <a href="#!">
                                                            <h6 class="fs-15 lh-base text-truncate mb-0">Crux Motorsports Helmet</h6>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="swiper-slide" style="max-width: 200px;">
                                                <div>
                                                    <div class="bg-soft-secondary rounded">
                                                        <img src="assets/images/products/img-6.png" alt="" style="max-height: 210px;max-width: auto;" />
                                                    </div>
                                                    <div class="pt-3">
                                                        <h5 class="text-secondary">$99.94</h5>
                                                        <a href="#!">
                                                            <h6 class="fs-15 lh-base text-truncate mb-0">Half Sleeve T-Shirts (Blue)</h6>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- <div class="swiper-pagination"></div> -->
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-md-6">
                            <div class="card card-height-100">
                                <div class="card-body">
                                    <div class="d-flex align-items-center mb-3">
                                        <div class="avatar-sm me-3 flex-shrink-0">
                                            <div class="avatar-title bg-soft-info rounded">
                                                <img src="assets/images/products/img-6.png" alt="" class="avatar-xs"></img>
                                            </div>
                                        </div>
                                        <div class="flex-grow-1">
                                            <p class="text-muted mb-2">Adidas</p>
                                            <h5 class="fs-15 mb-0">Half Sleeve T-Shirts (Blue)</h5>
                                        </div>
                                    </div>
                                    <p class="text-muted pb-1">If you couldn't relate to the information in the previous point, you might be looking for the singlet T-shirt, which is also known as the half T-shirt.</p>

                                    <div class="row mb-4">
                                        <div class="col-xl-6">
                                            <h6 class="fs-14 mb-2">Sizes</h6>
                                            <ul class="clothes-size list-unstyled hstack gap-2 mb-0">
                                                <li>
                                                    <input type="radio" name="sizes" id="color-1" disabled="" />
                                                    <label class="avatar-xs btn btn-soft-primary p-0 d-flex align-items-center justify-content-center rounded-circle" for="color-1">S</label>
                                                </li>
                                                <li>
                                                    <input type="radio" name="sizes" id="color-2" />
                                                    <label class="avatar-xs btn btn-soft-primary p-0 d-flex align-items-center justify-content-center rounded-circle" for="color-2">M</label>
                                                </li>
                                                <li>
                                                    <input type="radio" name="sizes" id="color-3" />
                                                    <label class="avatar-xs btn btn-soft-primary p-0 d-flex align-items-center justify-content-center rounded-circle" for="color-3">L</label>
                                                </li>
                                                <li>
                                                    <input type="radio" name="sizes" id="color-4" />
                                                    <label class="avatar-xs btn btn-soft-primary p-0 d-flex align-items-center justify-content-center rounded-circle" for="color-4">XL</label>
                                                </li>
                                            </ul>
                                        </div>
                                        <!-- end col -->

                                        <div class="col-xl-6">
                                            <div>
                                                <h6 class="fs-14 mb-2">Colors</h6>
                                                <div class="d-flex flex-wrap gap-2 select-color">
                                                    <div data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="Out of Stock">
                                                        <button type="button" class="btn avatar-xs p-0 d-flex align-items-center justify-content-center border rounded-circle fs-22 text-primary" disabled="">
                                                            <i class="ri-checkbox-blank-circle-fill"></i>
                                                        </button>
                                                    </div>
                                                    <div data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="03 Items Available">
                                                        <button type="button" class="btn avatar-xs p-0 d-flex align-items-center justify-content-center border rounded-circle fs-22 text-secondary">
                                                            <i class="ri-checkbox-blank-circle-fill"></i>
                                                        </button>
                                                    </div>
                                                    <div data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="03 Items Available">
                                                        <button type="button" class="btn avatar-xs p-0 d-flex align-items-center justify-content-center border rounded-circle fs-22 text-success">
                                                            <i class="ri-checkbox-blank-circle-fill"></i>
                                                        </button>
                                                    </div>
                                                    <div data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="02 Items Available">
                                                        <button type="button" class="btn avatar-xs p-0 d-flex align-items-center justify-content-center border rounded-circle fs-22 text-info">
                                                            <i class="ri-checkbox-blank-circle-fill"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- end col -->
                                    </div>
                                    <!-- end row -->

                                    <div class="d-flex mb-4 align-items-center">
                                        <div class="flex-grow-1">
                                            <h5 class="text-primary fs-18 mb-0"><span>$22.45</span> <small class="text-decoration-line-through text-muted fs-13">$37.45</small></h5>
                                        </div>
                                        
                                        <div class="input-step flex-shrink-0">
                                            <button type="button" class="minus">–</button>
                                            <input type="number" class="product-quantity" value="2" min="0" max="100" readonly="">
                                            <button type="button" class="plus">+</button>
                                            </input>
                                        </div>
                                    </div>

                                    <a href="#!" class="btn btn-soft-danger d-block">Add to Cart</a>

                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-md-6">
                            <div class="card">
                                <div class="card-body position-relative">
                                    <h5 class="mb-3">Select Bank</h5>
                                    <div class="vstack gap-2">
                                        <div class="form-check card-radio">
                                            <input id="listGroupRadioGrid1" name="listGroupRadioGrid" type="radio" class="form-check-input">
                                            <label class="form-check-label" for="listGroupRadioGrid1">
                                                <div class="d-flex align-items-center">
                                                    <div class="flex-shrink-0">
                                                        <div class="avatar-xs">
                                                            <div class="avatar-title bg-soft-success text-success fs-18 rounded">
                                                                <i class="ri-visa-fill"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="flex-grow-1 ms-3">
                                                        <h6 class="mb-1">Visa Card</h6>
                                                        <b class="pay-amount">$8,500</b>
                                                    </div>
                                                </div>
                                            </label>
                                            </input>
                                        </div>
                                        <div class="form-check card-radio">
                                            <input id="listGroupRadioGrid2" name="listGroupRadioGrid" type="radio" class="form-check-input">
                                            <label class="form-check-label" for="listGroupRadioGrid2">
                                                <div class="d-flex align-items-center">
                                                    <div class="flex-shrink-0">
                                                        <div class="avatar-xs">
                                                            <div class="avatar-title bg-soft-info text-info fs-18 rounded">
                                                                <i class="ri-bank-card-2-line"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="flex-grow-1 ms-3">
                                                        <h6 class="mb-1">Credit Card</h6>
                                                        <b class="pay-amount">$8,326</b>
                                                    </div>
                                                </div>
                                            </label>
                                            </input>
                                        </div>
                                        <div class="form-check card-radio">
                                            <input id="listGroupRadioGrid3" name="listGroupRadioGrid" type="radio" class="form-check-input">
                                            <label class="form-check-label" for="listGroupRadioGrid3">
                                                <div class="d-flex align-items-center">
                                                    <div class="flex-shrink-0">
                                                        <div class="avatar-xs">
                                                            <div class="avatar-title bg-soft-danger text-danger fs-18 rounded">
                                                                <i class="ri-mastercard-line"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="flex-grow-1 ms-3">
                                                        <h6 class="mb-1">Mastercard Card</h6>
                                                        <b class="pay-amount">$8,400</b>
                                                    </div>
                                                </div>
                                            </label>
                                            </input>
                                        </div>
                                    </div>
                        
                                    <button type="button" class="btn btn-success w-100 mt-3" id="confirm-btn">Confirm</button>
                        
                                    <div id="notification-warn" class="position-absolute top-0 start-0 end-0 d-none">
                                        <div class="alert alert-warning" role="alert">
                                            Select at list one item
                                        </div>
                                    </div>
                                    <!-- notification-warning -->
                        
                                    <div class="notification-elem" id="notification-overlay">
                                        <div class="text-center">
                                            <lord-icon src="https://cdn.lordicon.com/lupuorrc.json" trigger="loop" colors="primary:#0ab39c,secondary:#405189" style="width:120px;height:120px"></lord-icon>
                                            <div class="mt-4 pt-2">
                                                <h5 class="mb-1 success-pay">$6,201 Payment Successfully</h5>
                                                <p class="text-muted mx-4">Aww yeah, you successfully read this important message.</p>
                        
                                                <div>
                                                    <button type="button" class="btn btn-success btn-sm w-sm" id="back-btn">Back to Home</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- notification-overlay -->
                                </div>
                                <!-- end card body -->
                            </div>
                            <!-- end card -->
                        </div>
                        <!-- end col -->
                        <div class="col-xl-3 col-md-6">
                            <div class="card card-height-100">
                                <div class="card-body">
                                    <div class="d-flex align-items-center mb-3">
                                        <div class="avatar-sm me-3 flex-shrink-0">
                                            <div class="avatar-title bg-soft-danger rounded">
                                                <img src="assets/images/products/img-8.png" alt="" class="avatar-xs"></img>
                                            </div>
                                        </div>
                                        <div class="flex-grow-1">
                                            <p class="text-muted mb-2">Adidas</p>
                                            <h5 class="fs-15 mb-0">Half Sleeve T-Shirts (Pink)</h5>
                                        </div>
                                    </div>
                                    <p class="text-muted pb-1">If you couldn't relate to the information in the previous point, you might be looking for the singlet T-shirt, which is also known as the half T-shirt.</p>
                        
                                    <div class="row mb-4">
                                        <div class="col-xl-6">
                                            <h6 class="fs-14 mb-2">Sizes</h6>
                                            <ul class="clothes-size list-unstyled hstack gap-2 mb-0">
                                                <li>
                                                    <input type="radio" name="sizes" id="color-1" disabled="" />
                                                    <label class="avatar-xs btn btn-soft-primary p-0 d-flex align-items-center justify-content-center rounded-circle" for="color-1">S</label>
                                                </li>
                                                <li>
                                                    <input type="radio" name="sizes" id="color-2" />
                                                    <label class="avatar-xs btn btn-soft-primary p-0 d-flex align-items-center justify-content-center rounded-circle" for="color-2">M</label>
                                                </li>
                                                <li>
                                                    <input type="radio" name="sizes" id="color-3" />
                                                    <label class="avatar-xs btn btn-soft-primary p-0 d-flex align-items-center justify-content-center rounded-circle" for="color-3">L</label>
                                                </li>
                                                <li>
                                                    <input type="radio" name="sizes" id="color-4" />
                                                    <label class="avatar-xs btn btn-soft-primary p-0 d-flex align-items-center justify-content-center rounded-circle" for="color-4">XL</label>
                                                </li>
                                            </ul>
                                        </div>
                                        <!-- end col -->
                        
                                        <div class="col-xl-6">
                                            <div>
                                                <h6 class="fs-14 mb-2">Colors</h6>
                                                <div class="d-flex flex-wrap gap-2 select-color">
                                                    <div data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="Out of Stock">
                                                        <button type="button" class="btn avatar-xs p-0 d-flex align-items-center justify-content-center border rounded-circle fs-22 text-primary" disabled="">
                                                            <i class="ri-checkbox-blank-circle-fill"></i>
                                                        </button>
                                                    </div>
                                                    <div data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="03 Items Available">
                                                        <button type="button" class="btn avatar-xs p-0 d-flex align-items-center justify-content-center border rounded-circle fs-22 text-secondary">
                                                            <i class="ri-checkbox-blank-circle-fill"></i>
                                                        </button>
                                                    </div>
                                                    <div data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="03 Items Available">
                                                        <button type="button" class="btn avatar-xs p-0 d-flex align-items-center justify-content-center border rounded-circle fs-22 text-success">
                                                            <i class="ri-checkbox-blank-circle-fill"></i>
                                                        </button>
                                                    </div>
                                                    <div data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="02 Items Available">
                                                        <button type="button" class="btn avatar-xs p-0 d-flex align-items-center justify-content-center border rounded-circle fs-22 text-info">
                                                            <i class="ri-checkbox-blank-circle-fill"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- end col -->
                                    </div>
                                    <!-- end row -->
                        
                                    <div class="d-flex mb-4 align-items-center">
                                        <div class="flex-grow-1">
                                            <h5 class="text-primary fs-18 mb-0"><span>$48.20</span> <small class="text-decoration-line-through text-muted fs-13">$124.10</small></h5>
                                        </div>
                        
                                        <div class="input-step flex-shrink-0">
                                            <button type="button" class="minus">–</button>
                                            <input type="number" class="product-quantity" value="2" min="0" max="100" readonly="">
                                            <button type="button" class="plus">+</button>
                                            </input>
                                        </div>
                                    </div>
                        
                                    <a href="#!" class="btn btn-soft-danger d-block">Add to Cart</a>
                        
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-xxl-5">
                            <div class="card">
                                <div class="row g-0">
                                    <div class="col-lg-6">
                                        <div class="card-body border-end">
                                            <div class="search-box">
                                                <input type="text" class="form-control bg-light border-light" autocomplete="off" id="searchList" placeholder="Search candidate...">
                                                <i class="ri-search-line search-icon"></i>
                                                </input>
                                            </div>
                                            <div data-simplebar="" style="max-height: 190px" class="px-3 mx-n3">
                                                <ul class="list-unstyled mb-0 pt-2" id="candidate-list">
                                                    <li>
                                                        <a href="javascript:void(0);" class="d-flex align-items-center py-2">
                                                            <div class="flex-shrink-0 me-2">
                                                                <div class="avatar-xs">
                                                                    <img src="assets/images/users/avatar-1.jpg" alt="" class="img-fluid rounded-circle candidate-img"></img>
                                                                </div>
                                                            </div>
                                                            <div class="flex-grow-1">
                                                                <h5 class="fs-13 mb-1 text-truncate"><span class="candidate-name">Anna Adame</span> <span class="text-muted fw-normal">@Anna</span></h5>
                                                                <div class="d-none candidate-position">Web Developer</div>
                                                            </div>
                                                        </a>
                                                    </li>
                    
                                                    <li>
                                                        <a href="javascript:void(0);" class="d-flex align-items-center py-2">
                                                            <div class="flex-shrink-0 me-2">
                                                                <div class="avatar-xs">
                                                                    <img src="assets/images/users/avatar-2.jpg" alt="" class="img-fluid rounded-circle candidate-img"></img>
                                                                </div>
                                                            </div>
                                                            <div class="flex-grow-1">
                                                                <h5 class="fs-13 mb-1 text-truncate"><span class="candidate-name">Patricia Cavin</span> <span class="text-muted fw-normal">@Patricia</span></h5>
                                                                <div class="d-none candidate-position">Web Developer</div>
                                                            </div>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="javascript:void(0);" class="d-flex align-items-center py-2">
                                                            <div class="flex-shrink-0 me-2">
                                                                <div class="avatar-xs">
                                                                    <img src="assets/images/users/avatar-3.jpg" alt="" class="img-fluid rounded-circle candidate-img"></img>
                                                                </div>
                                                            </div>
                                                            <div class="flex-grow-1">
                                                                <h5 class="fs-13 mb-1 text-truncate"><span class="candidate-name">Jason Tran</span> <span class="text-muted fw-normal">@Jason</span></h5>
                                                                <div class="d-none candidate-position">Magento Developer</div>
                                                            </div>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="javascript:void(0);" class="d-flex align-items-center py-2">
                                                            <div class="flex-shrink-0 me-2">
                                                                <div class="avatar-xs">
                                                                    <img src="assets/images/users/avatar-4.jpg" alt="" class="img-fluid rounded-circle candidate-img"></img>
                                                                </div>
                                                            </div>
                                                            <div class="flex-grow-1">
                                                                <h5 class="fs-13 mb-1 text-truncate"><span class="candidate-name">Cheryl Moore</span> <span class="text-muted fw-normal">@Cheryl</span></h5>
                                                                <div class="d-none candidate-position">Product Designer</div>
                                                            </div>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="javascript:void(0);" class="d-flex align-items-center py-2">
                                                            <div class="flex-shrink-0 me-2">
                                                                <div class="avatar-xs">
                                                                    <img src="assets/images/users/avatar-5.jpg" alt="" class="img-fluid rounded-circle candidate-img"></img>
                                                                </div>
                                                            </div>
                                                            <div class="flex-grow-1">
                                                                <h5 class="fs-13 mb-1 text-truncate"><span class="candidate-name">Jennifer Bailey</span> <span class="text-muted fw-normal">@Jennifer</span></h5>
                                                                <div class="d-none candidate-position">Marketing Director</div>
                                                            </div>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="card-body text-center">
                                            <div class="avatar-md mb-3 mx-auto">
                                                <img src="assets/images/users/avatar-1.jpg" alt="" id="candidate-img" class="img-thumbnail rounded-circle shadow-none"></img>
                                            </div>
                    
                                            <h5 id="candidate-name" class="mb-0">Anna Adame</h5>
                                            <p id="candidate-position" class="text-muted">Web Developer</p>
                    
                                            <div class="d-flex gap-2 justify-content-center mb-3">
                                                <button type="button" class="btn avatar-xs p-0" data-bs-toggle="tooltip" data-bs-placement="top" title="Google">
                                                    <span class="avatar-title rounded-circle bg-light text-body">
                                                        <i class="ri-google-line"></i>
                                                    </span>
                                                </button>
                    
                                                <button type="button" class="btn avatar-xs p-0" data-bs-toggle="tooltip" data-bs-placement="top" title="Linkedin">
                                                    <span class="avatar-title rounded-circle bg-light text-body">
                                                        <i class="ri-linkedin-line"></i>
                                                    </span>
                                                </button>
                                                <button type="button" class="btn avatar-xs p-0" data-bs-toggle="tooltip" data-bs-placement="top" title="Dribbble">
                                                    <span class="avatar-title rounded-circle bg-light text-body">
                                                        <i class="ri-dribbble-fill"></i>
                                                    </span>
                                                </button>
                                            </div>
                    
                                            <div>
                                                <button type="button" class="btn btn-success rounded-pill w-sm"><i class="ri-add-fill me-1 align-bottom"></i> Follow</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- end card -->
                        </div>
                        <!-- end col -->
                    </div>
                    <!-- end row -->

                    <div class="row">
                        <div class="col-12">
                            <h5 class="text-decoration-underline mb-3 mt-2 pb-3">Credit Card</h5>
                        </div>
                    </div>
                    <!-- end row-->

                    <div class="row">
                        <div class="col-xxl-4">
                            <div class="card card-height-100 ">
                                <div class="card-header">
                                    <h5 class="card-title mb-0">Credit Card - Custom</h5>
                                </div>
                                <div class="card-body">
                                    <div class="mx-auto" style="max-width: 350px">
                                        <div class="text-bg-info bg-gradient p-4 rounded-3 mb-3">
                                            <div class="d-flex">
                                                <div class="flex-grow-1">
                                                    <i class="bx bx-chip h1 text-warning"></i>
                                                </div>
                                                <div class="flex-shrink-0">
                                                    <i class="bx bxl-visa display-2 mt-n3"></i>
                                                </div>
                                            </div>
                                            <div class="card-number fs-20" id="card-num-elem">
                                                XXXX XXXX XXXX XXXX
                                            </div>
                    
                                            <div class="row mt-4">
                                                <div class="col-4">
                                                    <div>
                                                        <div class="text-white-50">Card Holder</div>
                                                        <div id="card-holder-elem" class="fw-medium fs-14">Full Name</div>
                                                    </div>
                                                </div>
                                                <div class="col-4">
                                                    <div class="expiry">
                                                        <div class="text-white-50">Expires</div>
                                                        <div class="fw-medium fs-14">
                                                            <span id="expiry-month-elem">00</span>
                                                            /
                                                            <span id="expiry-year-elem">0000</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-4">
                                                    <div>
                                                        <div class="text-white-50">CVC</div>
                                                        <div id="cvc-elem" class="fw-medium fs-14">---</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- end card div elem -->
                                    </div>
                    
                    
                                    <form id="custom-card-form" autocomplete="off">
                                        <div class="mb-3">
                                            <label for="card-num-input" class="form-label">Card Number</label>
                                            <input id="card-num-input" class="form-control" maxlength="19" placeholder="0000 0000 0000 0000" />
                                        </div>
                    
                                        <div class="mb-3">
                                            <label for="card-holder-input" class="form-label">Card Holder</label>
                                            <input type="text" class="form-control" id="card-holder-input" placeholder="Enter holder name" />
                                        </div>
                    
                                        <div class="row">
                                            <div class="col-lg-4">
                                                <div>
                                                    <label for="expiry-month-input" class="form-label">Expiry Month</label>
                                                    <select class="form-select" id="expiry-month-input">
                                                        <option></option>
                                                        <option value="01">01</option>
                                                        <option value="02">02</option>
                                                        <option value="03">03</option>
                                                        <option value="04">04</option>
                                                        <option value="05">05</option>
                                                        <option value="06">06</option>
                                                        <option value="07">07</option>
                                                        <option value="08">08</option>
                                                        <option value="09">09</option>
                                                        <option value="10">10</option>
                                                        <option value="11">11</option>
                                                        <option value="12">12</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <!-- end col -->
                    
                                            <div class="col-lg-4">
                                                <div>
                                                    <label for="expiry-year-input" class="form-label">Expiry Year</label>
                                                    <select class="form-select" id="expiry-year-input">
                                                        <option></option>
                                                        <option value="2020">2020</option>
                                                        <option value="2021">2021</option>
                                                        <option value="2022">2022</option>
                                                        <option value="2023">2023</option>
                                                        <option value="2024">2024</option>
                                                        <option value="2025">2025</option>
                                                        <option value="2026">2026</option>
                                                        <option value="2027">2027</option>
                                                        <option value="2028">2028</option>
                                                        <option value="2029">2029</option>
                                                        <option value="2030">2030</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <!-- end col -->
                    
                                            <div class="col-lg-4">
                                                <div class="cvc">
                                                    <label for="cvc-input" class="form-label">CVC</label>
                                                    <input type="text" id="cvc-input" class="form-control" maxlength="3" />
                                                </div>
                                            </div>
                                            <!-- end col -->
                                        </div>
                                        <!-- end row -->
                    
                                        <button class="btn btn-danger w-100 mt-3" type="submit">Pay Now</button>
                                    </form>
                                    <!-- end card form elem -->
                                </div>
                            </div>
                            <!-- end card -->
                        </div>
                        <!-- end col -->
                    
                        <div class="col-xl-4">
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="card-title mb-0">Credit Card - card js plugin</h5>
                                </div>
                                <div class="card-body">
                                    <div class="card-wrapper mb-3"></div>
                    
                                    <div class="form-container active">
                                        <form action="" id="card-form-elem" autocomplete="off">
                                            <div class="mb-3">
                                                <label for="card-number-input" class="form-label">Card Number</label>
                                                <input class="form-control" placeholder="Card number" type="tel" id="card-number-input"></input>
                                            </div>
                                            <div class="mb-3">
                                                <label for="card-name-input" class="form-label">Card Holder</label>
                                                <input class="form-control" placeholder="Full name" type="text" id="card-name-input"></input>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div class="mb-3">
                                                        <label for="card-expiry-input" class="form-label">Expiry</label>
                                                        <input class="form-control" placeholder="MM/YY" type="tel" id="card-expiry-input"></input>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="mb-3">
                                                        <label for="card-cvc-input" class="form-label">CVC</label>
                                                        <input class="form-control" placeholder="CVC" type="number" id="card-cvc-input"></input>
                                                    </div>
                                                </div>
                                            </div>
                                            <button class="btn btn-danger w-100" type="submit">Pay Now</button>
                                        </form>
                                    </div>
                                </div>
                                <!-- end card-body -->
                            </div>
                            <!-- end card -->
                        </div>
                        <!-- end col -->
                    </div>
                    <!-- end row-->
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
        <script src="assets/libs/prismjs/prism.js"></script>


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
