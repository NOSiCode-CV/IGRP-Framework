<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/>

  <xsl:template match="/">
    <html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">
      <head>
        <link href="{$path}/libs/swiper/swiper-bundle.min.css" rel="stylesheet" />
        <!-- jsvectormap css -->
        <link href="assets/libs/jsvectormap/css/jsvectormap.min.css" rel="stylesheet" type="text/css" />
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


                  <div class="row dash-nft">
                    <div class="col-xxl-9">
                      <div class="row">
                        <div class="col-xl-6">
                          <div class="card overflow-hidden">
                            <div class="card-body bg-marketplace d-flex">
                              <div class="flex-grow-1">
                                <h4 class="fs-18 lh-base mb-0">
                Discover, Collect, Sell and Create <br />
                your own <span class="text-success">NFTs.</span>
                              </h4>
                              <p class="mb-0 mt-2 pt-1 text-muted">
                The world's first and largest digital marketplace.
                              </p>
                              <div class="d-flex gap-3 mt-4">
                                <a href="" class="btn btn-primary">Discover Now </a>
                                <a href="" class="btn btn-success">Create Your Own</a>
                              </div>
                            </div>
                            <img src="{$themePath}/assets/images/bg-d.png" alt="" class="img-fluid" />
                          </div>
                        </div>
                      </div>
                      <!--end col-->
                      <div class="col-xl-3 col-md-6">
                        <div class="card card-height-100">
                          <div class="card-body">
                            <div class="float-end">
                              <div class="dropdown card-header-dropdown">
                                <a class="text-reset dropdown-btn" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                  <span class="text-muted fs-18">
                                    <i class="mdi mdi-dots-vertical align-middle"></i
                  >                                  </span>
                                </a>
                                <div class="dropdown-menu dropdown-menu-end">
                                  <a class="dropdown-item" href="#">Today</a>
                                  <a class="dropdown-item" href="#">Last Week</a>
                                  <a class="dropdown-item" href="#">Last Month</a>
                                  <a class="dropdown-item" href="#">Current Year</a>
                                </div>
                              </div>
                            </div>
                            <div class="d-flex align-items-center">
                              <div class="avatar-sm flex-shrink-0">
                                <span class="avatar-title bg-soft-info rounded fs-3">
                                  <i class="bx bx-dollar-circle text-info"></i>
                                </span>
                              </div>
                              <div class="flex-grow-1 ps-3">
                                <h5 class="text-muted text-uppercase fs-13 mb-0">
                  Total Revenue
                                </h5>
                              </div>
                            </div>
                            <div class="mt-4 pt-1">
                              <h4 class="fs-22 fw-semibold ff-secondary mb-0">
                $                                <span class="counter-value" data-target="559526.564"></span>
                              </h4>
                              <p class="mt-4 mb-0 text-muted">
                                <span class="badge bg-soft-danger text-danger mb-0 me-1">
                                  <i class="ri-arrow-down-line align-middle"></i> 3.96 %
                                </span>
                vs. previous month
                              </p>
                            </div>
                          </div>
                        </div>
                      </div>
                      <!--end col-->
                      <div class="col-xl-3 col-md-6">
                        <div class="card card-height-100">
                          <div class="card-body">
                            <div class="float-end">
                              <div class="dropdown card-header-dropdown">
                                <a class="text-reset dropdown-btn" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                  <span class="text-muted fs-18">
                                    <i class="mdi mdi-dots-vertical align-middle"></i
                  >                                  </span>
                                </a>
                                <div class="dropdown-menu dropdown-menu-end">
                                  <a class="dropdown-item" href="#">Today</a>
                                  <a class="dropdown-item" href="#">Last Week</a>
                                  <a class="dropdown-item" href="#">Last Month</a>
                                  <a class="dropdown-item" href="#">Current Year</a>
                                </div>
                              </div>
                            </div>
                            <div class="d-flex align-items-center">
                              <div class="avatar-sm flex-shrink-0">
                                <span class="avatar-title bg-soft-info rounded fs-3">
                                  <i class="bx bx-wallet text-info"></i>
                                </span>
                              </div>
                              <div class="flex-grow-1 ps-3">
                                <h5 class="text-muted text-uppercase fs-13 mb-0">Estimated</h5>
                              </div>
                            </div>
                            <div class="mt-4 pt-1">
                              <h4 class="fs-22 fw-semibold ff-secondary mb-0">
                $                                <span class="counter-value" data-target="624562.564"></span>
                              </h4>
                              <p class="mt-4 mb-0 text-muted">
                                <span class="badge bg-soft-success text-success mb-0">
                                  <i class="ri-arrow-up-line align-middle"></i> 16.24 %
                                </span>
                vs. previous month
                              </p>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!--end row-->

                    <div class="row">
                      <div class="col-xxl-12">
                        <div class="card">
                          <div class="card-body p-0">
                            <div class="row g-0">
                              <div class="col-xxl-8">
                                <div class="">
                                  <div class="card-header border-0 align-items-center d-flex">
                                    <h4 class="card-title mb-0 flex-grow-1">Marketplace</h4>
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
                                  </div>
                                  <!-- end card header -->
                                  <div class="row g-0 text-center">
                                    <div class="col-6 col-sm-4">
                                      <div class="p-3 border border-dashed border-start-0">
                                        <h5 class="mb-1">
                                          <span class="counter-value" data-target="36.48">0</span
                          >k
                                        </h5>
                                        <p class="text-muted mb-0">Aetworks</p>
                                      </div>
                                    </div>
                                    <!--end col-->
                                    <div class="col-6 col-sm-4">
                                      <div class="p-3 border border-dashed border-start-0">
                                        <h5 class="mb-1">
                                          <span class="counter-value" data-target="92.54">0</span
                          >k
                                        </h5>
                                        <p class="text-muted mb-0">Auction</p>
                                      </div>
                                    </div>
                                    <!--end col-->
                                    <div class="col-6 col-sm-4">
                                      <div class="p-3 border border-dashed border-end-0">
                                        <h5 class="mb-1">
                                          <span class="counter-value" data-target="8.62">0</span
                          >k
                                        </h5>
                                        <p class="text-muted mb-0">Creators</p>
                                      </div>
                                    </div>
                                    <!--end col-->
                                  </div>
                                  <div id="line_chart_basic" data-colors='["--vz-primary","--vz-success", "--vz-gray-300"]' class="apex-charts" dir="ltr"></div>
                                </div>
                              </div>

                              <div class="col-xxl-4">
                                <div class="border-start p-4 h-100 d-flex flex-column">
                                  <div class="w-100">
                                    <div class="d-flex align-items-center">
                                      <img src="https://dl.dropboxusercontent.com/s/z5c1lprcdrxpgo9/img-2.gif" class="img-fluid avatar-xs rounded-circle object-cover" alt="" />
                                      <div class="ms-3 flex-grow-1">
                                        <h5 class="fs-16 mb-1">Trendy Fashion Portraits</h5>
                                        <p class="text-muted mb-0">Artwork</p>
                                      </div>
                                      <div class="dropdown">
                                        <a href="javascript:void(0);" class="align-middle text-muted" role="button" id="dropdownMenuButton5" data-bs-toggle="dropdown" aria-expanded="false">
                                          <i class="ri-share-line fs-18"></i>
                                        </a>
                                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton5">
                                          <li>
                                            <a href="#" class="dropdown-item">
                                              <i class="ri-twitter-fill text-primary align-bottom me-1"></i>
                              Twitter
                                            </a>
                                          </li>
                                          <li>
                                            <a href="#" class="dropdown-item">
                                              <i class="ri-facebook-circle-fill text-info align-bottom me-1"></i>
                              Facebook
                                            </a>
                                          </li>
                                          <li>
                                            <a href="#" class="dropdown-item">
                                              <i class="ri-google-fill text-danger align-bottom me-1"></i>
                              Google
                                            </a>
                                          </li>
                                        </ul>
                                      </div>
                                    </div>

                                    <h3 class="ff-secondary fw-bold mt-4">
                                      <i class="mdi mdi-ethereum text-primary"></i> 346.12 ETH
                                    </h3>
                                    <p class="text-success mb-3">+586.85 (40.6%)</p>

                                    <p class="text-muted">
                      NFT art is a digital asset that is collectable, unique,
                      and non-transferrable, Cortes explained Every NFT is
                      unique duplicated.
                                    </p>

                                    <div class="d-flex align-items-end justify-content-between mt-4">
                                      <div>
                                        <p class="fs-14 text-muted mb-1">Current Bid</p>
                                        <h4 class="fs-20 ff-secondary fw-semibold mb-0">
                          342.74 ETH
                                        </h4>
                                      </div>

                                      <div>
                                        <p class="fs-14 text-muted mb-1">Highest Bid</p>
                                        <h4 class="fs-20 ff-secondary fw-semibold mb-0">
                          346.67 ETH
                                        </h4>
                                      </div>
                                    </div>

                                    <div class="dash-countdown mt-4 pt-1">
                                      <div id="countdown" class="countdownlist"></div>
                                    </div>

                                    <div class="row mt-4 pt-2">
                                      <div class="col">
                                        <a href="apps-nft-item-details.html" class="btn btn-primary w-100">View Details</a
                        >
                                      </div>
                                      <div class="col">
                                        <button class="btn btn-info w-100">Bid Now</button>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                      <!--end col-->
                    </div>
                    <!--end row-->
                  </div>
                  <!--end col-->

                  <div class="col-xxl-3">
                    <div class="card">
                      <div class="card-header border-0 pb-0">
                        <h6 class="card-title mb-0">Popularity</h6>
                      </div>
                      <div>
                        <div id="market-overview" data-colors='["--vz-success", "--vz-warning"]' class="apex-charts mt-n4"></div>
                      </div>
                    </div>

                    <div class="card">
                      <div class="card-header d-flex align-items-center">
                        <h6 class="card-title mb-0 flex-grow-1">History of Bids</h6>
                        <a class="text-muted" href="apps-nft-item-details.html">
          See All <i class="ri-arrow-right-line align-bottom"></i>
                        </a>
                      </div>
                      <div class="card-body">
                        <div class="table-responsive table-card">
                          <div data-simplebar="" style="max-height: 365px">
                            <ul class="list-group list-group-flush">
                              <li class="list-group-item list-group-item-action">
                                <div class="d-flex align-items-center">
                                  <img src="{$themePath}/assets/images/users/avatar-10.jpg" alt="" class="avatar-xs object-cover rounded-circle" />
                                  <div class="ms-3 flex-grow-1">
                                    <a href="#!" class="stretched-link">
                                      <h6 class="fs-14 mb-1">Herbert Stokes</h6>
                                    </a>
                                    <p class="mb-0 text-muted">@herbert10</p>
                                  </div>
                                  <div>
                                    <h6>174.36 ETH</h6>
                                  </div>
                                </div>
                              </li>
                              <li class="list-group-item list-group-item-action">
                                <div class="d-flex align-items-center">
                                  <img src="{$themePath}/assets/images/nft/img-01.jpg" alt="" class="avatar-xs object-cover rounded-circle" />
                                  <div class="ms-3 flex-grow-1">
                                    <a href="#!">
                                      <h6 class="fs-14 mb-1">Nancy Martino</h6>
                                    </a>
                                    <p class="mb-0 text-muted">@nancyMt</p>
                                  </div>
                                  <div>
                                    <h6>346.47 ETH</h6>
                                  </div>
                                </div>
                              </li>
                              <li class="list-group-item list-group-item-action">
                                <div class="d-flex align-items-center">
                                  <img src="{$themePath}/assets/images/nft/img-04.jpg" alt="" class="avatar-xs object-cover rounded-circle" />
                                  <div class="ms-3 flex-grow-1">
                                    <a href="#!">
                                      <h6 class="fs-14 mb-1">Timothy Smith</h6>
                                    </a>
                                    <p class="mb-0 text-muted">@timothy</p>
                                  </div>
                                  <div>
                                    <h6>349.08 ETH</h6>
                                  </div>
                                </div>
                              </li>
                              <li class="list-group-item list-group-item-action">
                                <div class="d-flex align-items-center">
                                  <img src="{$themePath}/assets/images/nft/img-06.jpg" alt="" class="avatar-xs object-cover rounded-circle" />
                                  <div class="ms-3 flex-grow-1">
                                    <a href="#!">
                                      <h6 class="fs-14 mb-1">Glen Matney</h6>
                                    </a>
                                    <p class="mb-0 text-muted">@matney10</p>
                                  </div>
                                  <div>
                                    <h6>852.34 ETH</h6>
                                  </div>
                                </div>
                              </li>
                              <li class="list-group-item list-group-item-action">
                                <div class="d-flex align-items-center">
                                  <img src="{$themePath}/assets/images/users/avatar-8.jpg" alt="" class="avatar-xs object-cover rounded-circle" />
                                  <div class="ms-3 flex-grow-1">
                                    <a href="#!">
                                      <h6 class="fs-14 mb-1">Michael Morris</h6>
                                    </a>
                                    <p class="mb-0 text-muted">@michael</p>
                                  </div>
                                  <div>
                                    <h6>4.071 ETH</h6>
                                  </div>
                                </div>
                              </li>
                              <li class="list-group-item list-group-item-action">
                                <div class="d-flex align-items-center">
                                  <img src="{$themePath}/assets/images/nft/img-03.jpg" alt="" class="avatar-xs object-cover rounded-circle" />
                                  <div class="ms-3 flex-grow-1">
                                    <a href="#!">
                                      <h6 class="fs-14 mb-1">Alexis Clarke</h6>
                                    </a>
                                    <p class="mb-0 text-muted">@alexis_30</p>
                                  </div>
                                  <div>
                                    <h6>30.749 ETH</h6>
                                  </div>
                                </div>
                              </li>
                              <li class="list-group-item list-group-item-action">
                                <div class="d-flex align-items-center">
                                  <img src="{$themePath}/assets/images/nft/img-05.jpg" alt="" class="avatar-xs object-cover rounded-circle" />
                                  <div class="ms-3 flex-grow-1">
                                    <a href="#!">
                                      <h6 class="fs-14 mb-1">Timothy Smith</h6>
                                    </a>
                                    <p class="mb-0 text-muted">@timothy</p>
                                  </div>
                                  <div>
                                    <h6>349.08 ETH</h6>
                                  </div>
                                </div>
                              </li>
                            </ul>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <!--end col-->
                </div>
                <!--end row-->

                <div class="row">
                  <div class="col-xxl-8">
                    <div class="swiper marketplace-swiper rounded gallery-light">
                      <div class="d-flex pt-2 pb-4">
                        <h5 class="card-title fs-18 mb-1">Featured NFTs Artworks</h5>
                      </div>
                      <div class="swiper-wrapper">
                        <div class="swiper-slide">
                          <div class="card explore-box card-animate rounded">
                            <div class="bookmark-icon position-absolute top-0 end-0 p-2">
                              <button type="button" class="btn btn-icon active" data-bs-toggle="button" aria-pressed="true">
                                <i class="mdi mdi-cards-heart fs-16"></i>
                              </button>
                            </div>
                            <div class="explore-place-bid-img">
                              <img src="https://dl.dropboxusercontent.com/s/uzn97d4hl9znuyt/img-3.gif" alt="" class="img-fluid card-img-top explore-img" />
                              <div class="bg-overlay"></div>
                              <div class="place-bid-btn">
                                <a href="#!" class="btn btn-success">
                                  <i class="ri-auction-fill align-bottom me-1"></i> Place
                  Bid</a
                >
                              </div>
                            </div>
                            <div class="card-body">
                              <p class="fw-medium mb-0 float-end">
                                <i class="mdi mdi-heart text-danger align-middle"></i> 37.41k
                              </p>
                              <h5 class="mb-1">
                                <a href="apps-nft-item-details.html">Walking On Air</a>
                              </h5>
                              <p class="text-muted mb-0">Artwork</p>
                            </div>
                            <div class="card-footer border-top border-top-dashed">
                              <div class="d-flex align-items-center">
                                <div class="flex-grow-1 fs-14">
                                  <i class="ri-price-tag-3-fill text-warning align-bottom me-1"></i>
                  Highest: <span class="fw-medium">10.35ETH</span>
                                </div>
                                <h5 class="flex-shrink-0 fs-14 text-primary mb-0">
                  14.167 ETH
                                </h5>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="swiper-slide">
                          <div class="card explore-box card-animate rounded">
                            <div class="bookmark-icon position-absolute top-0 end-0 p-2">
                              <button type="button" class="btn btn-icon" data-bs-toggle="button" aria-pressed="true">
                                <i class="mdi mdi-cards-heart fs-16"></i>
                              </button>
                            </div>
                            <div class="explore-place-bid-img">
                              <img src="{$themePath}/assets/images/nft/img-03.jpg" alt="" class="img-fluid card-img-top explore-img" />
                              <div class="bg-overlay"></div>
                              <div class="place-bid-btn">
                                <a href="#!" class="btn btn-success">
                                  <i class="ri-auction-fill align-bottom me-1"></i> Place
                  Bid</a
                >
                              </div>
                            </div>
                            <div class="card-body">
                              <p class="fw-medium mb-0 float-end">
                                <i class="mdi mdi-heart text-danger align-middle"></i> 19.29k
                              </p>
                              <h5 class="mb-1">
                                <a href="apps-nft-item-details.html">Filtered Portrait</a>
                              </h5>
                              <p class="text-muted mb-0">Photography</p>
                            </div>
                            <div class="card-footer border-top border-top-dashed">
                              <div class="d-flex align-items-center">
                                <div class="flex-grow-1 fs-14">
                                  <i class="ri-price-tag-3-fill text-warning align-bottom me-1"></i>
                  Highest: <span class="fw-medium">75.3ETH</span>
                                </div>
                                <h5 class="flex-shrink-0 fs-14 text-primary mb-0">67.36 ETH</h5>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="swiper-slide">
                          <div class="card explore-box card-animate rounded">
                            <div class="bookmark-icon position-absolute top-0 end-0 p-2">
                              <button type="button" class="btn btn-icon active" data-bs-toggle="button" aria-pressed="true">
                                <i class="mdi mdi-cards-heart fs-16"></i>
                              </button>
                            </div>
                            <div class="explore-place-bid-img">
                              <img src="https://dl.dropboxusercontent.com/s/su8eohrbpbh3m7n/img-1.gif" alt="" class="img-fluid card-img-top explore-img" />
                              <div class="bg-overlay"></div>
                              <div class="place-bid-btn">
                                <a href="#!" class="btn btn-success">
                                  <i class="ri-auction-fill align-bottom me-1"></i> Place
                  Bid</a
                >
                              </div>
                            </div>
                            <div class="card-body">
                              <p class="fw-medium mb-0 float-end">
                                <i class="mdi mdi-heart text-danger align-middle"></i> 8.42k
                              </p>
                              <h5 class="mb-1">
                                <a href="apps-nft-item-details.html">Patterns Arts &amp; Culture</a>
                              </h5>
                              <p class="text-muted mb-0">Artwork</p>
                            </div>
                            <div class="card-footer border-top border-top-dashed">
                              <div class="d-flex align-items-center">
                                <div class="flex-grow-1 fs-14">
                                  <i class="ri-price-tag-3-fill text-warning align-bottom me-1"></i>
                  Highest: <span class="fw-medium">9.64ETH</span>
                                </div>
                                <h5 class="flex-shrink-0 fs-14 text-primary mb-0">
                  14.167 ETH
                                </h5>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="swiper-slide">
                          <div class="card explore-box card-animate rounded">
                            <div class="bookmark-icon position-absolute top-0 end-0 p-2">
                              <button type="button" class="btn btn-icon" data-bs-toggle="button" aria-pressed="true">
                                <i class="mdi mdi-cards-heart fs-16"></i>
                              </button>
                            </div>
                            <div class="explore-place-bid-img">
                              <img src="https://dl.dropboxusercontent.com/s/btp4y39rjs3iopw/img-4.gif" alt="" class="img-fluid card-img-top explore-img" />
                              <div class="bg-overlay"></div>
                              <div class="place-bid-btn">
                                <a href="#!" class="btn btn-success">
                                  <i class="ri-auction-fill align-bottom me-1"></i> Place
                  Bid</a
                >
                              </div>
                            </div>
                            <div class="card-body">
                              <p class="fw-medium mb-0 float-end">
                                <i class="mdi mdi-heart text-danger align-middle"></i> 15.93k
                              </p>
                              <h5 class="mb-1">
                                <a href="apps-nft-item-details.html">Evolved Reality</a>
                              </h5>
                              <p class="text-muted mb-0">Video</p>
                            </div>
                            <div class="card-footer border-top border-top-dashed">
                              <div class="d-flex align-items-center">
                                <div class="flex-grow-1 fs-14">
                                  <i class="ri-price-tag-3-fill text-warning align-bottom me-1"></i>
                  Highest: <span class="fw-medium">2.75ETH</span>
                                </div>
                                <h5 class="flex-shrink-0 fs-14 text-primary mb-0">3.167 ETH</h5>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="swiper-button-next"></div>
                      <div class="swiper-button-prev"></div>
                    </div>
                  </div>
                  <!--end col-->
                  <div class="col-xxl-4">
                    <div class="card">
                      <div class="card-header align-items-center d-flex">
                        <h4 class="card-title mb-0 flex-grow-1">Top Artworks</h4>
                        <div class="flex-shrink-0">
                          <div>
                            <button type="button" class="btn btn-soft-primary btn-sm">
              See All
                            </button>
                          </div>
                        </div>
                      </div>
                      <div class="card-body">
                        <div class="table-responsive table-card">
                          <div data-simplebar="" style="max-height: 405px">
                            <table class="table table-borderless align-middle">
                              <tbody>
                                <tr>
                                  <td>
                                    <div class="d-flex align-items-center">
                                      <img src="{$themePath}/assets/images/nft/img-01.jpg" alt="" class="avatar-sm rounded-circle" />
                                      <div class="ms-3">
                                        <a href="#!">
                                          <h6 class="fs-15 mb-1">One shop destination on</h6>
                                        </a>
                                        <p class="mb-0 text-muted">13,450 Sales</p>
                                      </div>
                                    </div>
                                  </td>
                                  <td>
                                    <div id="mini-chart-1" data-colors='["--vz-danger"]' class="apex-charts" dir="ltr"></div>
                                  </td>
                                  <td class="text-end">
                                    <a href="#!">
                                      <h6 class="fs-15 mb-1">$235,000+</h6>
                                    </a>
                                    <p class="mb-0 text-muted">Total USD</p>
                                  </td>
                                </tr>

                                <tr>
                                  <td>
                                    <div class="d-flex align-items-center">
                                      <img src="{$themePath}/assets/images/nft/img-02.jpg" alt="" class="avatar-sm rounded-circle" />
                                      <div class="ms-3">
                                        <a href="#!">
                                          <h6 class="fs-15 mb-1">Coin Journal is dedicated</h6>
                                        </a>
                                        <p class="mb-0 text-muted">11,752 Sales</p>
                                      </div>
                                    </div>
                                  </td>
                                  <td>
                                    <div id="mini-chart-2" data-colors='["--vz-danger"]' class="apex-charts" dir="ltr"></div>
                                  </td>
                                  <td class="text-end">
                                    <a href="#!">
                                      <h6 class="fs-15 mb-1">$632,000+</h6>
                                    </a>
                                    <p class="mb-0 text-muted">Total USD</p>
                                  </td>
                                </tr>

                                <tr>
                                  <td>
                                    <div class="d-flex align-items-center">
                                      <img src="{$themePath}/assets/images/nft/img-03.jpg" alt="" class="avatar-sm rounded-circle" />
                                      <div class="ms-3">
                                        <a href="#!">
                                          <h6 class="fs-15 mb-1">The Bitcoin-holding U.S.</h6>
                                        </a>
                                        <p class="mb-0 text-muted">7,526 Sales</p>
                                      </div>
                                    </div>
                                  </td>
                                  <td>
                                    <div id="mini-chart-3" data-colors='["--vz-danger"]' class="apex-charts" dir="ltr"></div>
                                  </td>
                                  <td class="text-end">
                                    <a href="#!">
                                      <h6 class="fs-15 mb-1">$468,000+</h6>
                                    </a>
                                    <p class="mb-0 text-muted">Total USD</p>
                                  </td>
                                </tr>

                                <tr>
                                  <td>
                                    <div class="d-flex align-items-center">
                                      <img src="{$themePath}/assets/images/nft/img-04.jpg" alt="" class="avatar-sm rounded-circle" />
                                      <div class="ms-3">
                                        <a href="#!">
                                          <h6 class="fs-15 mb-1">
                            Cryptocurrency Price Bitcoin
                                          </h6>
                                        </a>
                                        <p class="mb-0 text-muted">15,521 Sales</p>
                                      </div>
                                    </div>
                                  </td>
                                  <td>
                                    <div id="mini-chart-4" data-colors='["--vz-success"]' class="apex-charts" dir="ltr"></div>
                                  </td>
                                  <td class="text-end">
                                    <a href="#!">
                                      <h6 class="fs-15 mb-1">$265,000+</h6>
                                    </a>
                                    <p class="mb-0 text-muted">Total USD</p>
                                  </td>
                                </tr>

                                <tr>
                                  <td>
                                    <div class="d-flex align-items-center">
                                      <img src="{$themePath}/assets/images/nft/img-05.jpg" alt="" class="avatar-sm rounded-circle" />
                                      <div class="ms-3">
                                        <a href="#!">
                                          <h6 class="fs-15 mb-1">Dash, Ripple and Litecoin</h6>
                                        </a>
                                        <p class="mb-0 text-muted">12,652 Sales</p>
                                      </div>
                                    </div>
                                  </td>
                                  <td>
                                    <div id="mini-chart-5" data-colors='["--vz-success"]' class="apex-charts" dir="ltr"></div>
                                  </td>
                                  <td class="text-end">
                                    <a href="#!">
                                      <h6 class="fs-15 mb-1">$456,000+</h6>
                                    </a>
                                    <p class="mb-0 text-muted">Total USD</p>
                                  </td>
                                </tr>

                                <tr>
                                  <td>
                                    <div class="d-flex align-items-center">
                                      <img src="{$themePath}/assets/images/nft/img-06.jpg" alt="" class="avatar-sm rounded-circle" />
                                      <div class="ms-3">
                                        <a href="#!">
                                          <h6 class="fs-15 mb-1">The Cat X Takashi</h6>
                                        </a>
                                        <p class="mb-0 text-muted">11,745 Sales</p>
                                      </div>
                                    </div>
                                  </td>
                                  <td>
                                    <div id="mini-chart-6" data-colors='["--vz-danger"]' class="apex-charts" dir="ltr"></div>
                                  </td>
                                  <td class="text-end">
                                    <a href="#!">
                                      <h6 class="fs-15 mb-1">$256,000+</h6>
                                    </a>
                                    <p class="mb-0 text-muted">Total USD</p>
                                  </td>
                                </tr>
                                <tr>
                                  <td>
                                    <div class="d-flex align-items-center">
                                      <img src="{$themePath}/assets/images/nft/img-01.jpg" alt="" class="avatar-sm rounded-circle" />
                                      <div class="ms-3">
                                        <a href="#!">
                                          <h6 class="fs-15 mb-1">Long-tailed Macaque</h6>
                                        </a>
                                        <p class="mb-0 text-muted">41,032 Sales</p>
                                      </div>
                                    </div>
                                  </td>
                                  <td>
                                    <div id="mini-chart-7" data-colors='["--vz-success"]' class="apex-charts" dir="ltr"></div>
                                  </td>
                                  <td class="text-end">
                                    <a href="#!">
                                      <h6 class="fs-15 mb-1">$745,000+</h6>
                                    </a>
                                    <p class="mb-0 text-muted">Total USD</p>
                                  </td>
                                </tr>
                                <tr>
                                  <td>
                                    <div class="d-flex align-items-center">
                                      <img src="https://dl.dropboxusercontent.com/s/1y965leasc7bsyt/img-5.gif" alt="" class="avatar-sm rounded-circle" />
                                      <div class="ms-3">
                                        <a href="#!">
                                          <h6 class="fs-15 mb-1">Evolved Reality</h6>
                                        </a>
                                        <p class="mb-0 text-muted">513,794 Sales</p>
                                      </div>
                                    </div>
                                  </td>
                                  <td>
                                    <div id="mini-chart-8" data-colors='["--vz-danger"]' class="apex-charts" dir="ltr"></div>
                                  </td>
                                  <td class="text-end">
                                    <a href="#!">
                                      <h6 class="fs-15 mb-1">$870,000+</h6>
                                    </a>
                                    <p class="mb-0 text-muted">Total USD</p>
                                  </td>
                                </tr>
                              </tbody>
                            </table>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <!--end col-->
                </div>
                <!--end row-->

                <div class="row">
                  <div class="col-xxl-6">
                    <div class="card">
                      <div class="card-header align-items-center d-flex">
                        <h4 class="card-title mb-0 flex-grow-1">Recent NFTs</h4>
                        <div class="flex-shrink-0">
                          <div class="dropdown card-header-dropdown">
                            <a class="text-reset dropdown-btn" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                              <span class="fw-semibold text-uppercase fs-12">Sort by: </span
              >
                              <span class="text-muted">Popular <i class="mdi mdi-chevron-down ms-1"></i
              >                              </span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end">
                              <a class="dropdown-item" href="#">Popular</a>
                              <a class="dropdown-item" href="#">Newest</a>
                              <a class="dropdown-item" href="#">Oldest</a>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="card-body">
                        <div class="table-responsive table-card">
                          <table class="table table-borderless table-centered align-middle table-nowrap mb-0">
                            <thead class="text-muted bg-soft-light">
                              <tr>
                                <th>Collection</th>
                                <th>Volume</th>
                                <th>24h %</th>
                                <th>Creators</th>
                                <th>Items</th>
                              </tr>
                            </thead>
                            <!-- end thead -->
                            <tbody>
                              <tr>
                                <td>
                                  <div class="d-flex align-items-center">
                                    <div class="me-2">
                                      <img src="{$themePath}/assets/images/nft/img-01.jpg" alt="" class="avatar-xs rounded-circle" />
                                    </div>
                                    <div class="flex-grow-1">
                                      <h6 class="mb-1">
                                        <a href="apps-nft-item-details.html">Abstract Face Painting</a
                        >
                                      </h6>
                                      <p class="text-muted mb-0">Artworks</p>
                                    </div>
                                  </div>
                                </td>
                                <td>
                                  <img src="{$themePath}/assets/images/svg/crypto-icons/btc.svg" class="avatar-xxs me-2" alt="" />
48,568.025
                                </td>
                                <td>
                                  <span class="text-success mb-0">
                                    <i class="mdi mdi-trending-up align-middle me-1"></i>5.26
                                  </span>
                                </td>
                                <td>6.8K</td>
                                <td>18.0K</td>
                              </tr>
                              <!-- end -->

                              <tr>
                                <td>
                                  <div class="d-flex align-items-center">
                                    <div class="me-2">
                                      <img src="https://dl.dropboxusercontent.com/s/1y965leasc7bsyt/img-5.gif" alt="" class="avatar-xs rounded-circle" />
                                    </div>
                                    <div class="flex-grow-1">
                                      <h6 class="mb-1">
                                        <a href="apps-nft-item-details.html">Long-tailed Macaque</a
                        >
                                      </h6>
                                      <p class="text-muted mb-0">Games</p>
                                    </div>
                                  </div>
                                </td>
                                <td>
                                  <img src="{$themePath}/assets/images/svg/crypto-icons/ltc.svg" class="avatar-xxs me-2" alt="" />
87,142.027
                                </td>
                                <td>
                                  <span class="text-danger mb-0">
                                    <i class="mdi mdi-trending-down align-middle me-1"></i>3.07
                                  </span>
                                </td>
                                <td>2.6K</td>
                                <td>6.3K</td>
                              </tr>
                              <!-- end -->
                              <tr>
                                <td>
                                  <div class="d-flex align-items-center">
                                    <div class="me-2">
                                      <img src="{$themePath}/assets/images/nft/img-06.jpg" alt="" class="avatar-xs rounded-circle" />
                                    </div>
                                    <div class="flex-grow-1">
                                      <h6 class="mb-1">
                                        <a href="apps-nft-item-details.html">Robotic Body Art</a
                        >
                                      </h6>
                                      <p class="text-muted mb-0">Photography</p>
                                    </div>
                                  </div>
                                </td>
                                <td>
                                  <img src="{$themePath}/assets/images/svg/crypto-icons/etc.svg" class="avatar-xxs me-2" alt="" />
33,847.961
                                </td>
                                <td>
                                  <span class="text-success mb-0">
                                    <i class="mdi mdi-trending-up align-middle me-1"></i>7.13
                                  </span>
                                </td>
                                <td>7.5K</td>
                                <td>14.6K</td>
                              </tr>
                              <!-- end -->
                              <tr>
                                <td>
                                  <div class="d-flex align-items-center">
                                    <div class="me-2">
                                      <img src="{$themePath}/assets/images/nft/img-04.jpg" alt="" class="avatar-xs rounded-circle" />
                                    </div>
                                    <div class="flex-grow-1">
                                      <h6 class="mb-1">
                                        <a href="apps-nft-item-details.html">Smillevers Crypto</a
                        >
                                      </h6>
                                      <p class="text-muted mb-0">Artworks</p>
                                    </div>
                                  </div>
                                </td>
                                <td>
                                  <img src="{$themePath}/assets/images/svg/crypto-icons/dash.svg" class="avatar-xxs me-2" alt="" />
73,654.421
                                </td>
                                <td>
                                  <span class="text-success mb-0">
                                    <i class="mdi mdi-trending-up align-middle me-1"></i>0.97
                                  </span>
                                </td>
                                <td>5.3K</td>
                                <td>36.4K</td>
                              </tr>
                              <!-- end -->
                              <tr>
                                <td>
                                  <div class="d-flex align-items-center">
                                    <div class="me-2">
                                      <img src="{$themePath}/assets/images/nft/img-03.jpg" alt="" class="avatar-xs rounded-circle" />
                                    </div>
                                    <div class="flex-grow-1">
                                      <h6 class="mb-1">
                                        <a href="apps-nft-item-details.html">Creative Filtered Portrait</a
                        >
                                      </h6>
                                      <p class="text-muted mb-0">3d Style</p>
                                    </div>
                                    <div class="flex-grow-1"></div>
                                  </div>
                                </td>
                                <td>
                                  <img src="{$themePath}/assets/images/svg/crypto-icons/bnb.svg" class="avatar-xxs me-2" alt="" />
66,742.077
                                </td>
                                <td>
                                  <span class="text-danger mb-0">
                                    <i class="mdi mdi-trending-down align-middle me-1"></i>1.08
                                  </span>
                                </td>
                                <td>3.1K</td>
                                <td>12.4K</td>
                              </tr>
                              <!-- end -->
                              <tr>
                                <td>
                                  <div class="d-flex align-items-center">
                                    <div class="me-2">
                                      <img src="{$themePath}/assets/images/nft/img-02.jpg" alt="" class="avatar-xs rounded-circle" />
                                    </div>
                                    <div class="flex-grow-1">
                                      <h6 class="mb-1">
                                        <a href="apps-nft-item-details.html">The Chirstoper</a>
                                      </h6>
                                      <p class="text-muted mb-0">Crypto Card</p>
                                    </div>
                                  </div>
                                </td>
                                <td>
                                  <img src="{$themePath}/assets/images/svg/crypto-icons/usdt.svg" class="avatar-xxs me-2" alt="" />
34,736.209
                                </td>
                                <td>
                                  <span class="text-success mb-0">
                                    <i class="mdi mdi-trending-up align-middle me-1"></i>4.52
                                  </span>
                                </td>
                                <td>7.2K</td>
                                <td>25.0K</td>
                              </tr>
                              <!-- end -->
                            </tbody>
                            <!-- end tbody -->
                          </table>
                          <!-- end table -->
                        </div>
                        <!-- end tbody -->
                      </div>
                    </div>
                  </div>
                  <!--end col-->
                  <!--end card-->
                  <div class="col-xxl-3 col-lg-6">
                    <div class="card card-height-100">
                      <div class="card-header align-items-center d-flex">
                        <h4 class="card-title mb-0 flex-grow-1">Worldwide Top Creators</h4>
                        <div class="flex-shrink-0">
                          <button type="button" class="btn btn-soft-primary btn-sm">
            Export Report
                          </button>
                        </div>
                      </div>
                      <!-- end card header -->

                      <!-- card body -->
                      <div class="card-body">
                        <div id="creators-by-locations" data-colors='["--vz-gray-200", "--vz-success", "--vz-primary"]' style="height: 265px" dir="ltr"></div>

                        <div class="mt-1">
                          <p class="mb-1">
                            <img src="{$themePath}/assets/images/flags/us.svg" alt="" height="15" class="rounded me-2" />
            United States <span class="float-end">34%</span>
                          </p>
                          <p class="mb-1">
                            <img src="{$themePath}/assets/images/flags/russia.svg" alt="" height="15" class="rounded me-2" />
            Russia <span class="float-end">27%</span>
                          </p>
                          <p class="mb-1">
                            <img src="{$themePath}/assets/images/flags/spain.svg" alt="" height="15" class="rounded me-2" />
            Spain <span class="float-end">21%</span>
                          </p>
                          <p class="mb-1">
                            <img src="{$themePath}/assets/images/flags/italy.svg" alt="" height="15" class="rounded me-2" />
            Italy <span class="float-end">13%</span>
                          </p>
                          <p class="mb-0">
                            <img src="{$themePath}/assets/images/flags/germany.svg" alt="" height="15" class="rounded me-2" />
            Germany <span class="float-end">5%</span>
                          </p>
                        </div>
                      </div>
                      <!-- end card body -->
                    </div>
                    <!-- end card -->
                  </div>
                  <!--end col-->
                  <div class="col-xxl-3 col-lg-6">
                    <div class="card">
                      <div class="card-header d-flex align-items-center">
                        <h6 class="card-title flex-grow-1 mb-0">Top Collections</h6>
                        <a href="apps-nft-collections.html" type="button" class="btn btn-soft-primary btn-sm flex-shrink-0">
          See All <i class="ri-arrow-right-line align-bottom"></i>
                        </a>
                      </div>
                      <div class="card-body">
                        <div class="swiper collection-slider">
                          <div class="swiper-wrapper">
                            <div class="swiper-slide">
                              <div class="dash-collection overflow-hidden rounded-top position-relative">
                                <img src="{$themePath}/assets/images/nft/img-03.jpg" alt="" height="220" class="object-cover w-100" />
                                <div class="content position-absolute bottom-0 m-2 p-2 start-0 end-0 rounded d-flex align-items-center">
                                  <div class="flex-grow-1">
                                    <a href="#!">
                                      <h5 class="text-white fs-16 mb-1">Artworks</h5>
                                    </a>
                                    <p class="text-white-75 mb-0">4700+ Items</p>
                                  </div>
                                  <div class="avatar-xxs">
                                    <div class="avatar-title bg-white rounded-circle">
                                      <a href="#!" class="link-success">
                                        <i class="ri-arrow-right-line"></i
                      >                                      </a>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="swiper-slide">
                              <div class="dash-collection overflow-hidden rounded-top position-relative">
                                <img src="{$themePath}/assets/images/nft/img-04.jpg" alt="" height="220" class="object-cover w-100" />
                                <div class="content position-absolute bottom-0 m-2 p-2 start-0 end-0 rounded d-flex align-items-center">
                                  <div class="flex-grow-1">
                                    <a href="#!">
                                      <h5 class="text-white fs-16 mb-1">Crypto Card</h5>
                                    </a>
                                    <p class="text-white-75 mb-0">743+ Items</p>
                                  </div>
                                  <div class="avatar-xxs">
                                    <div class="avatar-title bg-white rounded-circle">
                                      <a href="#!" class="link-success">
                                        <i class="ri-arrow-right-line"></i
                      >                                      </a>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="swiper-slide">
                              <div class="dash-collection overflow-hidden rounded-top position-relative">
                                <img src="https://dl.dropboxusercontent.com/s/1y965leasc7bsyt/img-5.gif" alt="" height="220" class="object-cover w-100" />
                                <div class="content position-absolute bottom-0 m-2 p-2 start-0 end-0 rounded d-flex align-items-center">
                                  <div class="flex-grow-1">
                                    <a href="#!">
                                      <h5 class="text-white fs-16 mb-1">3d Style</h5>
                                    </a>
                                    <p class="text-white-75 mb-0">4781+ Items</p>
                                  </div>
                                  <div class="avatar-xxs">
                                    <div class="avatar-title bg-white rounded-circle">
                                      <a href="#!" class="link-success">
                                        <i class="ri-arrow-right-line"></i
                      >                                      </a>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="swiper-slide">
                              <div class="dash-collection overflow-hidden rounded-top position-relative">
                                <img src="{$themePath}/assets/images/nft/img-06.jpg" alt="" height="220" class="object-cover w-100" />
                                <div class="content position-absolute bottom-0 m-2 p-2 start-0 end-0 rounded d-flex align-items-center">
                                  <div class="flex-grow-1">
                                    <a href="#!">
                                      <h5 class="text-white fs-16 mb-1">Collectibles</h5>
                                    </a>
                                    <p class="text-white-75 mb-0">3468+ Items</p>
                                  </div>
                                  <div class="avatar-xxs">
                                    <div class="avatar-title bg-white rounded-circle">
                                      <a href="#!" class="link-success">
                                        <i class="ri-arrow-right-line"></i
                      >                                      </a>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <!--end swiper-->
                      </div>
                    </div>
                    <div class="card">
                      <div class="card-header d-flex align-items-center">
                        <h5 class="card-title flex-grow-1 mb-0">Popular Creators</h5>
                        <a href="apps-nft-creators.html" type="button" class="btn btn-soft-primary btn-sm flex-shrink-0">
          See All <i class="ri-arrow-right-line align-bottom"></i>
                        </a>
                      </div>
                      <div class="card-body">
                        <div class="swiper collection-slider">
                          <div class="swiper-wrapper">
                            <div class="swiper-slide">
                              <div class="d-flex">
                                <div class="flex-shink-0">
                                  <img src="{$themePath}/assets/images/nft/img-02.jpg" alt="" class="avatar-sm object-cover rounded" />
                                </div>
                                <div class="ms-3 flex-grow-1">
                                  <a href="pages-profile.html">
                                    <h5 class="mb-1">Alexis Clarke</h5>
                                  </a>
                                  <p class="text-muted mb-0">
                                    <i class="mdi mdi-ethereum text-primary fs-14"></i> 81,369
                    ETH
                                  </p>
                                </div>
                                <div>
                                  <div class="dropdown float-end">
                                    <button class="btn btn-ghost-primary btn-icon dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                      <i class="ri-more-fill align-middle fs-16"></i>
                                    </button>
                                    <ul class="dropdown-menu dropdown-menu-end">
                                      <li>
                                        <a class="dropdown-item" href="javascript:void(0);">View</a
                        >
                                      </li>
                                      <li>
                                        <a class="dropdown-item" href="javascript:void(0);">Share</a
                        >
                                      </li>
                                      <li>
                                        <a class="dropdown-item" href="#!">Report</a>
                                      </li>
                                    </ul>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="swiper-slide">
                              <div class="d-flex">
                                <div class="flex-shink-0">
                                  <img src="{$themePath}/assets/images/nft/img-01.jpg" alt="" class="avatar-sm object-cover rounded" />
                                </div>
                                <div class="ms-3 flex-grow-1">
                                  <a href="pages-profile.html">
                                    <h5 class="mb-1">Timothy Smith</h5>
                                  </a>
                                  <p class="text-muted mb-0">
                                    <i class="mdi mdi-ethereum text-primary fs-14"></i> 4,754
                    ETH
                                  </p>
                                </div>
                                <div>
                                  <div class="dropdown float-end">
                                    <button class="btn btn-ghost-primary btn-icon dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                      <i class="ri-more-fill align-middle fs-16"></i>
                                    </button>
                                    <ul class="dropdown-menu dropdown-menu-end">
                                      <li>
                                        <a class="dropdown-item" href="javascript:void(0);">View</a
                        >
                                      </li>
                                      <li>
                                        <a class="dropdown-item" href="javascript:void(0);">Share</a
                        >
                                      </li>
                                      <li>
                                        <a class="dropdown-item" href="#!">Report</a>
                                      </li>
                                    </ul>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="swiper-slide">
                              <div class="d-flex">
                                <div class="flex-shink-0">
                                  <img src="{$themePath}/assets/images/nft/img-04.jpg" alt="" class="avatar-sm object-cover rounded" />
                                </div>
                                <div class="ms-3 flex-grow-1">
                                  <a href="pages-profile.html">
                                    <h5 class="mb-1">Herbert Stokes</h5>
                                  </a>
                                  <p class="text-muted mb-0">
                                    <i class="mdi mdi-ethereum text-primary fs-14"></i> 68,945
                    ETH
                                  </p>
                                </div>
                                <div>
                                  <div class="dropdown float-end">
                                    <button class="btn btn-ghost-primary btn-icon dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                      <i class="ri-more-fill align-middle fs-16"></i>
                                    </button>
                                    <ul class="dropdown-menu dropdown-menu-end">
                                      <li>
                                        <a class="dropdown-item" href="javascript:void(0);">View</a
                        >
                                      </li>
                                      <li>
                                        <a class="dropdown-item" href="javascript:void(0);">Share</a
                        >
                                      </li>
                                      <li>
                                        <a class="dropdown-item" href="#!">Report</a>
                                      </li>
                                    </ul>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="swiper-slide">
                              <div class="d-flex">
                                <div class="flex-shink-0">
                                  <img src="{$themePath}/assets/images/users/avatar-1.jpg" alt="" class="avatar-sm object-cover rounded" />
                                </div>
                                <div class="ms-3 flex-grow-1">
                                  <a href="pages-profile.html">
                                    <h5 class="mb-1">Glen Matney</h5>
                                  </a>
                                  <p class="text-muted mb-0">
                                    <i class="mdi mdi-ethereum text-primary fs-14"></i> 49,031
                    ETH
                                  </p>
                                </div>
                                <div>
                                  <div class="dropdown float-end">
                                    <button class="btn btn-ghost-primary btn-icon dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                      <i class="ri-more-fill align-middle fs-16"></i>
                                    </button>
                                    <ul class="dropdown-menu dropdown-menu-end">
                                      <li>
                                        <a class="dropdown-item" href="javascript:void(0);">View</a
                        >
                                      </li>
                                      <li>
                                        <a class="dropdown-item" href="javascript:void(0);">Share</a
                        >
                                      </li>
                                      <li>
                                        <a class="dropdown-item" href="#!">Report</a>
                                      </li>
                                    </ul>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <!--end swiper-->
                      </div>
                    </div>
                  </div>
                  <!--end col-->
                </div>
                <!--end row-->

              </div>
            </div>
          </div>
          <xsl:call-template name="igrp-footer"/>
        </div>
      </div>


      <xsl:call-template name="igrp-page-helpers"/>

      <!-- apexcharts -->
      <script src="{$path}/libs/apexcharts/apexcharts.min.js"></script>

      <!--Swiper slider js-->
      <script src="{$path}/libs/swiper/swiper-bundle.min.js"></script>

      <!-- Vector map-->
      <script src="{$path}/libs/jsvectormap/js/jsvectormap.min.js"></script>
      <script src="{$path}/libs/jsvectormap/maps/world-merc.js"></script>

      <!-- Countdown js -->
      <script src="{$themePath}/assets/js/pages/coming-soon.init.js"></script>

      <!-- Marketplace init -->
      <script src="{$themePath}/assets/js/pages/dashboard-nft.init.js"></script>


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
