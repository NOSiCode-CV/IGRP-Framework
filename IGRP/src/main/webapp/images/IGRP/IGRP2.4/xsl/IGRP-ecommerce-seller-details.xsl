<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/>

    <xsl:template match="/">
        <html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">
            <head>

                <!-- page includes css -->

                <!-- gridjs css -->
                <link rel="stylesheet" href="{$path}/libs/gridjs/theme/mermaid.min.css"/>

                <!--Swiper slider css-->
                <link href="{$path}/libs/swiper/swiper-bundle.min.css" rel="stylesheet" type="text/css" />


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
                                                    <h4 class="mb-sm-0">Seller Details</h4>

                                                    <div class="page-title-right">
                                                        <ol class="breadcrumb m-0">
                                                            <li class="breadcrumb-item">
                                                                <a href="javascript: void(0);">Ecommerce</a>
                                                            </li>
                                                            <li class="breadcrumb-item active">Seller Details</li>
                                                        </ol>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <!-- end page title -->

                                        <div class="row">
                                            <div class="col-xxl-3">
                                                <div class="card">
                                                    <div class="card-body p-4">
                                                        <div>
                                                            <div class="flex-shrink-0 avatar-md mx-auto">
                                                                <div class="avatar-title bg-light rounded">
                                                                    <img src="{$themePath}/assets/images/companies/img-2.png" alt="" height="50" />
                                                                </div>
                                                            </div>
                                                            <div class="mt-4 text-center">
                                                                <h5 class="mb-1">Force Medicines</h5>
                                                                <p class="text-muted">Since 1987</p>
                                                            </div>
                                                            <div class="table-responsive">
                                                                <table class="table mb-0 table-borderless">
                                                                    <tbody>
                                                                        <tr>
                                                                            <th>
                                                                                <span class="fw-medium">Owner Name</span>
                                                                            </th>
                                                                            <td>David Marshall</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th>
                                                                                <span class="fw-medium">Company Type</span>
                                                                            </th>
                                                                            <td>Partnership</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th>
                                                                                <span class="fw-medium">Email</span>
                                                                            </th>
                                                                            <td>forcemedicines@gamil.com</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th>
                                                                                <span class="fw-medium">Website</span>
                                                                            </th>
                                                                            <td>
                                                                                <a href="javascript:void(0);" class="link-primary">www.forcemedicines.com</a>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th>
                                                                                <span class="fw-medium">Contact No.</span>
                                                                            </th>
                                                                            <td>+(123) 9876 654 321</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th>
                                                                                <span class="fw-medium">Fax</span>
                                                                            </th>
                                                                            <td>+1 999 876 5432</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th>
                                                                                <span class="fw-medium">Location</span>
                                                                            </th>
                                                                            <td>United Kingdom</td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--end card-body-->
                                                    <div class="card-body border-top border-top-dashed p-4">
                                                        <div>
                                                            <h6 class="text-muted text-uppercase fw-semibold mb-4">Customer Reviews</h6>
                                                            <div>
                                                                <div>
                                                                    <div class="bg-light px-3 py-2 rounded-2 mb-2">
                                                                        <div class="d-flex align-items-center">
                                                                            <div class="flex-grow-1">
                                                                                <div class="fs-16 align-middle text-warning">
                                                                                    <i class="ri-star-fill"></i>
                                                                                    <i class="ri-star-fill"></i>
                                                                                    <i class="ri-star-fill"></i>
                                                                                    <i class="ri-star-fill"></i>
                                                                                    <i class="ri-star-half-fill"></i>
                                                                                </div>
                                                                            </div>
                                                                            <div class="flex-shrink-0">
                                                                                <h6 class="mb-0">4.5 out of 5</h6>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="text-center">
                                                                        <div class="text-muted">Total <span class="fw-medium">5.50k</span> reviews</div>
                                                                    </div>
                                                                </div>

                                                                <div class="mt-3">
                                                                    <div class="row align-items-center g-2">
                                                                        <div class="col-auto">
                                                                            <div class="p-1">
                                                                                <h6 class="mb-0">5 star</h6>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col">
                                                                            <div class="p-1">
                                                                                <div class="progress animated-progress progress-sm">
                                                                                    <div class="progress-bar bg-success" role="progressbar" style="width: 50.16%" aria-valuenow="50.16" aria-valuemin="0" aria-valuemax="100"></div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-auto">
                                                                            <div class="p-1">
                                                                                <h6 class="mb-0 text-muted">2758</h6>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <!-- end row -->

                                                                    <div class="row align-items-center g-2">
                                                                        <div class="col-auto">
                                                                            <div class="p-1">
                                                                                <h6 class="mb-0">4 star</h6>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col">
                                                                            <div class="p-1">
                                                                                <div class="progress animated-progress progress-sm">
                                                                                    <div class="progress-bar bg-success" role="progressbar" style="width: 29.32%" aria-valuenow="29.32" aria-valuemin="0" aria-valuemax="100"></div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-auto">
                                                                            <div class="p-1">
                                                                                <h6 class="mb-0 text-muted">1063</h6>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <!-- end row -->

                                                                    <div class="row align-items-center g-2">
                                                                        <div class="col-auto">
                                                                            <div class="p-1">
                                                                                <h6 class="mb-0">3 star</h6>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col">
                                                                            <div class="p-1">
                                                                                <div class="progress animated-progress progress-sm">
                                                                                    <div class="progress-bar bg-warning" role="progressbar" style="width: 18.12%" aria-valuenow="18.12" aria-valuemin="0" aria-valuemax="100"></div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-auto">
                                                                            <div class="p-1">
                                                                                <h6 class="mb-0 text-muted">997</h6>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <!-- end row -->

                                                                    <div class="row align-items-center g-2">
                                                                        <div class="col-auto">
                                                                            <div class="p-1">
                                                                                <h6 class="mb-0">2 star</h6>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col">
                                                                            <div class="p-1">
                                                                                <div class="progress animated-progress progress-sm">
                                                                                    <div class="progress-bar bg-success" role="progressbar" style="width: 4.98%" aria-valuenow="4.98" aria-valuemin="0" aria-valuemax="100"></div>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <div class="col-auto">
                                                                            <div class="p-1">
                                                                                <h6 class="mb-0 text-muted">227</h6>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <!-- end row -->

                                                                    <div class="row align-items-center g-2">
                                                                        <div class="col-auto">
                                                                            <div class="p-1">
                                                                                <h6 class="mb-0">1 star</h6>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col">
                                                                            <div class="p-1">
                                                                                <div class="progress animated-progress progress-sm">
                                                                                    <div class="progress-bar bg-danger" role="progressbar" style="width: 7.42%" aria-valuenow="7.42" aria-valuemin="0" aria-valuemax="100"></div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-auto">
                                                                            <div class="p-1">
                                                                                <h6 class="mb-0 text-muted">408</h6>
                                                                            </div>
                                                                        </div>
                                                                    </div>                                                                    <!-- end row -->
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--end card-body-->
                                                    <div class="card-body p-4 border-top border-top-dashed">
                                                        <h6 class="text-muted text-uppercase fw-semibold mb-4">Products Reviews</h6>
                                                        <!-- Swiper -->
                                                        <div class="swiper vertical-swiper" style="height: 242px;">
                                                            <div class="swiper-wrapper">
                                                                <div class="swiper-slide">
                                                                    <div class="card border border-dashed shadow-none">
                                                                        <div class="card-body">
                                                                            <div class="d-flex">
                                                                                <div class="flex-shrink-0 avatar-sm">
                                                                                    <div class="avatar-title bg-light rounded">
                                                                                        <img src="{$themePath}/assets/images/companies/img-1.png" alt="" height="30"/>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="flex-grow-1 ms-3">
                                                                                    <div>
                                                                                        <p class="text-muted mb-1 fst-italic">" Great product and looks great, lots of features. "</p>
                                                                                        <div class="fs-11 align-middle text-warning">
                                                                                            <i class="ri-star-fill"></i>
                                                                                            <i class="ri-star-fill"></i>
                                                                                            <i class="ri-star-fill"></i>
                                                                                            <i class="ri-star-fill"></i>
                                                                                            <i class="ri-star-fill"></i>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="text-end mb-0 text-muted">
                                                                    - by <cite title="Source Title">Force Medicines</cite>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="swiper-slide">
                                                                    <div class="card border border-dashed shadow-none">
                                                                        <div class="card-body">
                                                                            <div class="d-flex">
                                                                                <div class="flex-shrink-0">
                                                                                    <img src="{$themePath}/assets/images/users/avatar-3.jpg" alt="" class="avatar-sm rounded"/>
                                                                                </div>
                                                                                <div class="flex-grow-1 ms-3">
                                                                                    <div>
                                                                                        <p class="text-muted mb-1 fst-italic">" Amazing template, very easy to understand and manipulate. "</p>
                                                                                        <div class="fs-11 align-middle text-warning">
                                                                                            <i class="ri-star-fill"></i>
                                                                                            <i class="ri-star-fill"></i>
                                                                                            <i class="ri-star-fill"></i>
                                                                                            <i class="ri-star-fill"></i>
                                                                                            <i class="ri-star-half-fill"></i>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="text-end mb-0 text-muted">
                                                                    - by <cite title="Source Title">Henry Baird</cite>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="swiper-slide">
                                                                    <div class="card border border-dashed shadow-none">
                                                                        <div class="card-body">
                                                                            <div class="d-flex">
                                                                                <div class="flex-shrink-0 avatar-sm">
                                                                                    <div class="avatar-title bg-light rounded">
                                                                                        <img src="{$themePath}/assets/images/companies/img-8.png" alt="" height="30"/>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="flex-grow-1 ms-3">
                                                                                    <div>
                                                                                        <p class="text-muted mb-1 fst-italic">"Very beautiful product and Very helpful customer service."</p>
                                                                                        <div class="fs-11 align-middle text-warning">
                                                                                            <i class="ri-star-fill"></i>
                                                                                            <i class="ri-star-fill"></i>
                                                                                            <i class="ri-star-fill"></i>
                                                                                            <i class="ri-star-line"></i>
                                                                                            <i class="ri-star-line"></i>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="text-end mb-0 text-muted">
                                                                    - by <cite title="Source Title">Zoetic Fashion</cite>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="swiper-slide">
                                                                    <div class="card border border-dashed shadow-none">
                                                                        <div class="card-body">
                                                                            <div class="d-flex">
                                                                                <div class="flex-shrink-0">
                                                                                    <img src="{$themePath}/assets/images/users/avatar-2.jpg" alt="" class="avatar-sm rounded"/>
                                                                                </div>
                                                                                <div class="flex-grow-1 ms-3">
                                                                                    <div>
                                                                                        <p class="text-muted mb-1 fst-italic">" The product is very beautiful. I like it. "</p>
                                                                                        <div class="fs-11 align-middle text-warning">
                                                                                            <i class="ri-star-fill"></i>
                                                                                            <i class="ri-star-fill"></i>
                                                                                            <i class="ri-star-fill"></i>
                                                                                            <i class="ri-star-half-fill"></i>
                                                                                            <i class="ri-star-line"></i>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="text-end mb-0 text-muted">
                                                                    - by <cite title="Source Title">Nancy Martino</cite>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="text-center mt-3">
                                                            <a href="javascript:void(0)" class="link-primary">View All Reviews <i class="ri-arrow-right-line align-bottom ms-1"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div class="card-body p-4 border-top border-top-dashed">
                                                        <h6 class="text-muted text-uppercase fw-semibold mb-4">Contact Support</h6>
                                                        <form action="#">
                                                            <div class="mb-3">
                                                                <textarea class="form-control" id="exampleFormControlTextarea1" rows="4" placeholder="Enter your messages..."></textarea>
                                                            </div>
                                                            <div class="text-end">
                                                                <button type="submit" class="btn btn-primary">
                                                                    <i class="ri-mail-send-line align-bottom me-1"></i> Send Messages</button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                    <!--end card-body-->
                                                </div>
                                                <!--end card-->
                                            </div>
                                            <!--end col-->

                                            <div class="col-xxl-9">
                                                <div class="card">
                                                    <div class="card-header border-0 align-items-center d-flex">
                                                        <h4 class="card-title mb-0 flex-grow-1">Revenue</h4>
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
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-header p-0 border-0 bg-soft-light">
                                                        <div class="row g-0 text-center">
                                                            <div class="col-6 col-sm-3">
                                                                <div class="p-3 border border-dashed border-start-0">
                                                                    <h5 class="mb-1">
                                                                        <span class="counter-value" data-target="7585">0</span>
                                                                    </h5>
                                                                    <p class="text-muted mb-0">Orders</p>
                                                                </div>
                                                            </div>
                                                            <!--end col-->
                                                            <div class="col-6 col-sm-3">
                                                                <div class="p-3 border border-dashed border-start-0">
                                                                    <h5 class="mb-1">$                                                                        <span class="counter-value" data-target="22.89">0</span>k</h5>
                                                                    <p class="text-muted mb-0">Earnings</p>
                                                                </div>
                                                            </div>
                                                            <!--end col-->
                                                            <div class="col-6 col-sm-3">
                                                                <div class="p-3 border border-dashed border-start-0">
                                                                    <h5 class="mb-1">
                                                                        <span class="counter-value" data-target="367">0</span>
                                                                    </h5>
                                                                    <p class="text-muted mb-0">Refunds</p>
                                                                </div>
                                                            </div>
                                                            <!--end col-->
                                                            <div class="col-6 col-sm-3">
                                                                <div class="p-3 border border-dashed border-start-0 border-end-0">
                                                                    <h5 class="mb-1 text-success">
                                                                        <span class="counter-value" data-target="18.92">0</span>%
                                                                    </h5>
                                                                    <p class="text-muted mb-0">Conversation Ratio</p>
                                                                </div>
                                                            </div>
                                                            <!--end col-->
                                                        </div>
                                                    </div>                                                    <!-- end card header -->

                                                    <div class="card-body p-0 pb-2">
                                                        <div>
                                                            <div id="customer_impression_charts" data-colors='["--vz-primary", "--vz-success", "--vz-danger"]' class="apex-charts"></div>
                                                        </div>
                                                    </div>                                                    <!-- end card body -->
                                                </div>                                                <!-- end card -->

                                                <div class="row g-4 mb-3">
                                                    <div class="col-sm-auto">
                                                        <div>
                                                            <a href="apps-ecommerce-add-product.html" class="btn btn-success">
                                                                <i class="ri-add-line align-bottom me-1"></i> Add New</a>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm">
                                                        <div class="d-flex justify-content-sm-end">
                                                            <div class="search-box ms-2">
                                                                <input type="text" class="form-control" placeholder="Search Products..."/>
                                                                <i class="ri-search-line search-icon"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="card">
                                                    <div class="card-body">
                                                        <div id="table-product-list-all" class="table-card gridjs-border-none"></div>
                                                    </div>
                                                </div>

                                            </div>
                                            <!--end col-->
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

                <!-- apexcharts -->
                <script src="{$path}/libs/apexcharts/apexcharts.min.js"></script>

                <!-- gridjs js -->
                <script src="{$path}/libs/gridjs/gridjs.umd.js"></script>
                <script src="https://unpkg.com/gridjs/plugins/selection/dist/selection.umd.js"></script>

                <!--Swiper slider js-->
                <script src="{$path}/libs/swiper/swiper-bundle.min.js"></script>

                <!--seller-details init js -->
                <script src="{$themePath}/assets/js/pages/seller-details.init.js"></script>


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
