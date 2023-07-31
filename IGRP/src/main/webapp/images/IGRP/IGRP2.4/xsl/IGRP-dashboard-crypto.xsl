<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/>

	<xsl:template match="/">
		<html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">
			<head>
				<xsl:call-template name="igrp-head"/>
         <link href="{$path}/libs/swiper/swiper-bundle.min.css" rel="stylesheet" />
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

            <div class="row">
              <div class="col-xxl-3">
                <div class="card card-height-100">
                  <div class="card-header border-0 align-items-center d-flex">
                    <h4 class="card-title mb-0 flex-grow-1">My Portfolio</h4>
                    <div>
                      <div class="dropdown">
                        <button
                          class="btn btn-soft-primary btn-sm"
                          data-bs-toggle="dropdown"
                          aria-haspopup="true"
                          aria-expanded="false"
                        >
                          <span class="text-uppercase"
                            >Btc<i
                              class="mdi mdi-chevron-down align-middle ms-1"
                            ></i
                          ></span>
                        </button>
                        <div class="dropdown-menu dropdown-menu-end">
                          <a class="dropdown-item" href="#">BTC</a>
                          <a class="dropdown-item" href="#">USD</a>
                          <a class="dropdown-item" href="#">Euro</a>
                        </div>
                      </div>
                    </div>
                  </div>
                  <!-- end cardheader -->
                  <div class="card-body">
                    <div
                      id="portfolio_donut_charts"
                      data-colors='["--vz-primary", "--vz-info", "--vz-warning", "--vz-success"]'
                      class="apex-charts"
                      dir="ltr"
                    ></div>

                    <ul
                      class="list-group list-group-flush border-dashed mb-0 mt-3 pt-2"
                    >
                      <li class="list-group-item px-0">
                        <div class="d-flex">
                          <div class="flex-shrink-0 avatar-xs">
                            <span
                              class="avatar-title bg-light p-1 rounded-circle"
                            >
                              <img
                                src="{$themePath}/assets/images/svg/crypto-icons/btc.svg"
                                class="img-fluid"
                                alt=""
                              />
                            </span>
                          </div>
                          <div class="flex-grow-1 ms-2">
                            <h6 class="mb-1">Bitcoin</h6>
                            <p class="fs-12 mb-0 text-muted">
                              <i
                                class="mdi mdi-circle fs-10 align-middle text-primary me-1"
                              ></i
                              >BTC
                            </p>
                          </div>
                          <div class="flex-shrink-0 text-end">
                            <h6 class="mb-1">BTC 0.00584875</h6>
                            <p class="text-success fs-12 mb-0">$19,405.12</p>
                          </div>
                        </div>
                      </li>
                      <!-- end -->
                      <li class="list-group-item px-0">
                        <div class="d-flex">
                          <div class="flex-shrink-0 avatar-xs">
                            <span
                              class="avatar-title bg-light p-1 rounded-circle"
                            >
                              <img
                                src="{$themePath}/assets/images/svg/crypto-icons/eth.svg"
                                class="img-fluid"
                                alt=""
                              />
                            </span>
                          </div>
                          <div class="flex-grow-1 ms-2">
                            <h6 class="mb-1">Ethereum</h6>
                            <p class="fs-12 mb-0 text-muted">
                              <i
                                class="mdi mdi-circle fs-10 align-middle text-info me-1"
                              ></i
                              >ETH
                            </p>
                          </div>
                          <div class="flex-shrink-0 text-end">
                            <h6 class="mb-1">ETH 2.25842108</h6>
                            <p class="text-danger fs-12 mb-0">$40552.18</p>
                          </div>
                        </div>
                      </li>
                      <!-- end -->
                      <li class="list-group-item px-0">
                        <div class="d-flex">
                          <div class="flex-shrink-0 avatar-xs">
                            <span
                              class="avatar-title bg-light p-1 rounded-circle"
                            >
                              <img
                                src="{$themePath}/assets/images/svg/crypto-icons/ltc.svg"
                                class="img-fluid"
                                alt=""
                              />
                            </span>
                          </div>
                          <div class="flex-grow-1 ms-2">
                            <h6 class="mb-1">Litecoin</h6>
                            <p class="fs-12 mb-0 text-muted">
                              <i
                                class="mdi mdi-circle fs-10 align-middle text-warning me-1"
                              ></i
                              >LTC
                            </p>
                          </div>
                          <div class="flex-shrink-0 text-end">
                            <h6 class="mb-1">LTC 10.58963217</h6>
                            <p class="text-success fs-12 mb-0">$15824.58</p>
                          </div>
                        </div>
                      </li>
                      <!-- end -->
                      <li class="list-group-item px-0 pb-0">
                        <div class="d-flex">
                          <div class="flex-shrink-0 avatar-xs">
                            <span
                              class="avatar-title bg-light p-1 rounded-circle"
                            >
                              <img
                                src="{$themePath}/assets/images/svg/crypto-icons/dash.svg"
                                class="img-fluid"
                                alt=""
                              />
                            </span>
                          </div>
                          <div class="flex-grow-1 ms-2">
                            <h6 class="mb-1">Dash</h6>
                            <p class="fs-12 mb-0 text-muted">
                              <i
                                class="mdi mdi-circle fs-10 align-middle text-success me-1"
                              ></i
                              >DASH
                            </p>
                          </div>
                          <div class="flex-shrink-0 text-end">
                            <h6 class="mb-1">DASH 204.28565885</h6>
                            <p class="text-success fs-12 mb-0">$30635.84</p>
                          </div>
                        </div>
                      </li>
                      <!-- end -->
                    </ul>
                    <!-- end -->
                  </div>
                  <!-- end card body -->
                </div>
                <!-- end card -->
              </div>
              <!-- end col -->

              <div class="col-xxl-9 order-xxl-0 order-first">
                <div class="d-flex flex-column h-100">
                  <div class="row h-100">
                    <div class="col-lg-4 col-md-6">
                      <div class="card">
                        <div class="card-body">
                          <div class="d-flex align-items-center">
                            <div class="avatar-sm flex-shrink-0">
                              <span
                                class="avatar-title bg-light text-primary rounded-circle fs-3"
                              >
                                <i
                                  class="ri-money-dollar-circle-fill align-middle"
                                ></i>
                              </span>
                            </div>
                            <div class="flex-grow-1 ms-3">
                              <p
                                class="text-uppercase fw-semibold fs-12 text-muted mb-1"
                              >
                                Total Invested
                              </p>
                              <h4 class="mb-0">
                                $<span
                                  class="counter-value"
                                  data-target="2390.68"
                                  >0</span
                                >
                              </h4>
                            </div>
                            <div class="flex-shrink-0 align-self-end">
                              <span class="badge badge-soft-success"
                                ><i
                                  class="ri-arrow-up-s-fill align-middle me-1"
                                ></i
                                >6.24 %<span> </span
                              ></span>
                            </div>
                          </div>
                        </div>
                        <!-- end card body -->
                      </div>
                      <!-- end card -->
                    </div>
                    <!-- end col -->
                    <div class="col-lg-4 col-md-6">
                      <div class="card">
                        <div class="card-body">
                          <div class="d-flex align-items-center">
                            <div class="avatar-sm flex-shrink-0">
                              <span
                                class="avatar-title bg-light text-primary rounded-circle fs-3"
                              >
                                <i
                                  class="ri-arrow-up-circle-fill align-middle"
                                ></i>
                              </span>
                            </div>
                            <div class="flex-grow-1 ms-3">
                              <p
                                class="text-uppercase fw-semibold fs-12 text-muted mb-1"
                              >
                                Total Change
                              </p>
                              <h4 class="mb-0">
                                $<span
                                  class="counter-value"
                                  data-target="19523.25"
                                  >0</span
                                >
                              </h4>
                            </div>
                            <div class="flex-shrink-0 align-self-end">
                              <span class="badge badge-soft-success"
                                ><i
                                  class="ri-arrow-up-s-fill align-middle me-1"
                                ></i
                                >3.67 %<span> </span
                              ></span>
                            </div>
                          </div>
                        </div>
                        <!-- end card body -->
                      </div>
                      <!-- end card -->
                    </div>
                    <!-- end col -->
                    <div class="col-lg-4 col-md-6">
                      <div class="card">
                        <div class="card-body">
                          <div class="d-flex align-items-center">
                            <div class="avatar-sm flex-shrink-0">
                              <span
                                class="avatar-title bg-light text-primary rounded-circle fs-3"
                              >
                                <i
                                  class="ri-arrow-down-circle-fill align-middle"
                                ></i>
                              </span>
                            </div>
                            <div class="flex-grow-1 ms-3">
                              <p
                                class="text-uppercase fw-semibold fs-12 text-muted mb-1"
                              >
                                Day Change
                              </p>
                              <h4 class="mb-0">
                                $<span
                                  class="counter-value"
                                  data-target="14799.44"
                                  >0</span
                                >
                              </h4>
                            </div>
                            <div class="flex-shrink-0 align-self-end">
                              <span class="badge badge-soft-danger"
                                ><i
                                  class="ri-arrow-down-s-fill align-middle me-1"
                                ></i
                                >4.80 %<span> </span
                              ></span>
                            </div>
                          </div>
                        </div>
                        <!-- end card body -->
                      </div>
                      <!-- end card -->
                    </div>
                    <!-- end col -->
                  </div>
                  <!-- end row -->

                  <div class="row">
                    <div class="col-xl-12">
                      <div class="card">
                        <div
                          class="card-header border-0 align-items-center d-flex"
                        >
                          <h4 class="card-title mb-0 flex-grow-1">
                            Market Graph
                          </h4>
                          <div>
                            <button
                              type="button"
                              class="btn btn-soft-secondary btn-sm"
                            >
                              1H
                            </button>
                            <button
                              type="button"
                              class="btn btn-soft-secondary btn-sm"
                            >
                              7D
                            </button>
                            <button
                              type="button"
                              class="btn btn-soft-secondary btn-sm"
                            >
                              1M
                            </button>
                            <button
                              type="button"
                              class="btn btn-soft-secondary btn-sm"
                            >
                              1Y
                            </button>
                            <button
                              type="button"
                              class="btn btn-soft-primary btn-sm"
                            >
                              ALL
                            </button>
                          </div>
                        </div>
                        <!-- end card header -->
                        <div class="card-body p-0">
                          <div
                            class="bg-soft-light border-top-dashed border border-start-0 border-end-0 border-bottom-dashed py-3 px-4"
                          >
                            <div class="row align-items-center">
                              <div class="col-6">
                                <div
                                  class="d-flex flex-wrap gap-4 align-items-center"
                                >
                                  <h5 class="fs-19 mb-0">0.014756</h5>
                                  <p class="fw-medium text-muted mb-0">
                                    $75.69
                                    <span class="text-success fs-11 ms-1"
                                      >+1.99%</span
                                    >
                                  </p>
                                  <p class="fw-medium text-muted mb-0">
                                    High
                                    <span class="text-dark fs-11 ms-1"
                                      >0.014578</span
                                    >
                                  </p>
                                  <p class="fw-medium text-muted mb-0">
                                    Low
                                    <span class="text-dark fs-11 ms-1"
                                      >0.0175489</span
                                    >
                                  </p>
                                </div>
                              </div>
                              <!-- end col -->
                              <div class="col-6">
                                <div class="d-flex">
                                  <div
                                    class="d-flex justify-content-end text-end flex-wrap gap-4 ms-auto"
                                  >
                                    <div class="pe-3">
                                      <h6 class="mb-2 text-truncate text-muted">
                                        Total Balance
                                      </h6>
                                      <h5 class="mb-0">$72.8k</h5>
                                    </div>
                                    <div class="pe-3">
                                      <h6 class="mb-2 text-muted">Profit</h6>
                                      <h5 class="text-success mb-0">+$49.7k</h5>
                                    </div>
                                    <div class="pe-3">
                                      <h6 class="mb-2 text-muted">Loss</h6>
                                      <h5 class="text-danger mb-0">-$23.1k</h5>
                                    </div>
                                  </div>
                                </div>
                              </div>
                              <!-- end col -->
                            </div>
                            <!-- end row -->
                          </div>
                        </div>
                        <!-- end cardbody -->
                        <div class="card-body p-0 pb-3">
                          <div
                            id="Market_chart"
                            data-colors='["--vz-success", "--vz-danger"]'
                            class="apex-charts"
                            dir="ltr"
                          ></div>
                        </div>
                        <!-- end cardbody -->
                      </div>
                      <!-- end card -->
                    </div>
                    <!-- end col -->
                  </div>
                  <!-- end row -->
                </div>
              </div>
              <!-- end col -->
            </div>
            <!-- end row -->

            <div class="row">
              <div class="col-lg-12">
                <div class="swiper cryptoSlider">
                  <div class="swiper-wrapper">
                    <div class="swiper-slide">
                      <div class="card">
                        <div class="card-body">
                          <div class="float-end">
                            <div class="dropdown">
                              <a
                                class="text-reset"
                                href="#"
                                data-bs-toggle="dropdown"
                                aria-haspopup="true"
                                aria-expanded="false"
                              >
                                <span class="text-muted fs-18"
                                  ><i class="mdi mdi-dots-horizontal"></i
                                ></span>
                              </a>
                              <div class="dropdown-menu dropdown-menu-end">
                                <a class="dropdown-item" href="#">Details</a>
                                <a class="dropdown-item" href="#">Cancel</a>
                              </div>
                            </div>
                          </div>
                          <div class="d-flex align-items-center">
                            <img
                              src="{$themePath}/assets/images/svg/crypto-icons/btc.svg"
                              class="bg-light rounded-circle p-1 avatar-xs img-fluid"
                              alt=""
                            />
                            <h6 class="ms-2 mb-0 fs-14">Bitcoin</h6>
                          </div>
                          <div class="row align-items-end g-0">
                            <div class="col-6">
                              <h5 class="mb-1 mt-4">$1,523,647</h5>
                              <p class="text-success fs-13 fw-medium mb-0">
                                +13.11%<span
                                  class="text-muted ms-2 fs-10 text-uppercase"
                                  >(btc)</span
                                >
                              </p>
                            </div>
                            <!-- end col -->
                            <div class="col-6">
                              <div
                                class="apex-charts crypto-widget"
                                data-colors='["--vz-success" , "--vz-transparent"]'
                                dir="ltr"
                                id="bitcoin_sparkline_charts"
                              ></div>
                            </div>
                            <!-- end col -->
                          </div>
                          <!-- end row -->
                        </div>
                        <!-- end card body -->
                      </div>
                      <!-- end card -->
                    </div>
                    <!-- end -->

                    <div class="swiper-slide">
                      <div class="card">
                        <div class="card-body">
                          <div class="float-end">
                            <div class="dropdown">
                              <a
                                class="text-reset"
                                href="#"
                                data-bs-toggle="dropdown"
                                aria-haspopup="true"
                                aria-expanded="false"
                              >
                                <span class="text-muted fs-18"
                                  ><i class="mdi mdi-dots-horizontal"></i
                                ></span>
                              </a>
                              <div class="dropdown-menu dropdown-menu-end">
                                <a class="dropdown-item" href="#">Details</a>
                                <a class="dropdown-item" href="#">Cancel</a>
                              </div>
                            </div>
                          </div>
                          <div class="d-flex align-items-center">
                            <img
                              src="{$themePath}/assets/images/svg/crypto-icons/ltc.svg"
                              class="bg-light rounded-circle p-1 avatar-xs img-fluid"
                              alt=""
                            />
                            <h6 class="ms-2 mb-0 fs-14">Litecoin</h6>
                          </div>
                          <div class="row align-items-end g-0">
                            <div class="col-6">
                              <h5 class="mb-1 mt-4">$2,145,687</h5>
                              <p class="text-success fs-13 fw-medium mb-0">
                                +15.08%<span
                                  class="text-muted ms-2 fs-10 text-uppercase"
                                  >(ltc)</span
                                >
                              </p>
                            </div>
                            <!-- end col -->
                            <div class="col-6">
                              <div
                                class="apex-charts crypto-widget"
                                data-colors='["--vz-success", "--vz-transparent"]'
                                dir="ltr"
                                id="litecoin_sparkline_charts"
                              ></div>
                            </div>
                            <!-- end col -->
                          </div>
                          <!-- end row -->
                        </div>
                        <!-- end card body -->
                      </div>
                      <!-- end card -->
                    </div>
                    <!-- end -->

                    <div class="swiper-slide">
                      <div class="card">
                        <div class="card-body">
                          <div class="float-end">
                            <div class="dropdown">
                              <a
                                class="text-reset"
                                href="#"
                                data-bs-toggle="dropdown"
                                aria-haspopup="true"
                                aria-expanded="false"
                              >
                                <span class="text-muted fs-18"
                                  ><i class="mdi mdi-dots-horizontal"></i></span
                              ></a>
                              <div class="dropdown-menu dropdown-menu-end">
                                <a class="dropdown-item" href="#">Details</a>
                                <a class="dropdown-item" href="#">Cancel</a>
                              </div>
                            </div>
                          </div>
                          <div class="d-flex align-items-center">
                            <img
                              src="{$themePath}/assets/images/svg/crypto-icons/etc.svg"
                              class="bg-light rounded-circle p-1 avatar-xs img-fluid"
                              alt=""
                            />
                            <h6 class="ms-2 mb-0 fs-14">Eathereum</h6>
                          </div>
                          <div class="row align-items-end g-0">
                            <div class="col-6">
                              <h5 class="mb-1 mt-4">$3,312,870</h5>
                              <p class="text-success fs-13 fw-medium mb-0">
                                +08.57%<span
                                  class="text-muted ms-2 fs-10 text-uppercase"
                                  >(etc)</span
                                >
                              </p>
                            </div>
                            <!-- end col -->
                            <div class="col-6">
                              <div
                                class="apex-charts crypto-widget"
                                data-colors='["--vz-success", "--vz-transparent"]'
                                dir="ltr"
                                id="eathereum_sparkline_charts"
                              ></div>
                            </div>
                            <!-- end col -->
                          </div>
                          <!-- end row -->
                        </div>
                        <!-- end card body -->
                      </div>
                      <!-- end card -->
                    </div>
                    <!-- end -->

                    <div class="swiper-slide">
                      <div class="card">
                        <div class="card-body">
                          <div class="float-end">
                            <div class="dropdown">
                              <a
                                class="text-reset"
                                href="#"
                                data-bs-toggle="dropdown"
                                aria-haspopup="true"
                                aria-expanded="false"
                              >
                                <span class="text-muted fs-18"
                                  ><i class="mdi mdi-dots-horizontal"></i
                                ></span>
                              </a>
                              <div class="dropdown-menu dropdown-menu-end">
                                <a class="dropdown-item" href="#">Details</a>
                                <a class="dropdown-item" href="#">Cancel</a>
                              </div>
                            </div>
                          </div>
                          <div class="d-flex align-items-center">
                            <img
                              src="{$themePath}/assets/images/svg/crypto-icons/bnb.svg"
                              class="bg-light rounded-circle p-1 avatar-xs img-fluid"
                              alt=""
                            />
                            <h6 class="ms-2 mb-0 fs-14">Binance</h6>
                          </div>
                          <div class="row align-items-end g-0">
                            <div class="col-6">
                              <h5 class="mb-1 mt-4">$1,820,045</h5>
                              <p class="text-danger fs-13 fw-medium mb-0">
                                -09.21%<span
                                  class="text-muted ms-2 fs-10 text-uppercase"
                                  >(bnb)</span
                                >
                              </p>
                            </div>
                            <!-- end col -->
                            <div class="col-6">
                              <div
                                class="apex-charts crypto-widget"
                                data-colors='["--vz-danger", "--vz-transparent"]'
                                dir="ltr"
                                id="binance_sparkline_charts"
                              ></div>
                            </div>
                            <!-- end col -->
                          </div>
                          <!-- end row -->
                        </div>
                        <!-- end card body -->
                      </div>
                      <!-- end card -->
                    </div>
                    <!-- end -->

                    <div class="swiper-slide">
                      <div class="card">
                        <div class="card-body">
                          <div class="float-end">
                            <div class="dropdown">
                              <a
                                class="text-reset"
                                href="#"
                                data-bs-toggle="dropdown"
                                aria-haspopup="true"
                                aria-expanded="false"
                              >
                                <span class="text-muted fs-18"
                                  ><i class="mdi mdi-dots-horizontal"></i
                                ></span>
                              </a>
                              <div class="dropdown-menu dropdown-menu-end">
                                <a class="dropdown-item" href="#">Details</a>
                                <a class="dropdown-item" href="#">Cancel</a>
                              </div>
                            </div>
                          </div>
                          <div class="d-flex align-items-center">
                            <img
                              src="{$themePath}/assets/images/svg/crypto-icons/dash.svg"
                              class="bg-light rounded-circle p-1 avatar-xs img-fluid"
                              alt=""
                            />
                            <h6 class="ms-2 mb-0 fs-14">Dash</h6>
                          </div>
                          <div class="row align-items-end g-0">
                            <div class="col-6">
                              <h5 class="mb-1 mt-4">$9,458,153</h5>
                              <p class="text-success fs-13 fw-medium mb-0">
                                +12.07%<span
                                  class="text-muted ms-2 fs-10 text-uppercase"
                                  >(dash)</span
                                >
                              </p>
                            </div>
                            <!-- end col -->
                            <div class="col-6">
                              <div
                                class="apex-charts crypto-widget"
                                data-colors='["--vz-success", "--vz-transparent"]'
                                dir="ltr"
                                id="dash_sparkline_charts"
                              ></div>
                            </div>
                            <!-- end col -->
                          </div>
                          <!-- end row -->
                        </div>
                        <!-- end card body -->
                      </div>
                      <!-- end card -->
                    </div>
                    <!-- end -->

                    <div class="swiper-slide">
                      <div class="card">
                        <div class="card-body">
                          <div class="float-end">
                            <div class="dropdown">
                              <a
                                class="text-reset"
                                href="#"
                                data-bs-toggle="dropdown"
                                aria-haspopup="true"
                                aria-expanded="false"
                              >
                                <span class="text-muted fs-18"
                                  ><i class="mdi mdi-dots-horizontal"></i
                                ></span>
                              </a>
                              <div class="dropdown-menu dropdown-menu-end">
                                <a class="dropdown-item" href="#">Details</a>
                                <a class="dropdown-item" href="#">Cancel</a>
                              </div>
                            </div>
                          </div>
                          <div class="d-flex align-items-center">
                            <img
                              src="{$themePath}/assets/images/svg/crypto-icons/usdt.svg"
                              class="bg-light rounded-circle p-1 avatar-xs img-fluid"
                              alt=""
                            />
                            <h6 class="ms-2 mb-0 fs-14">Tether</h6>
                          </div>
                          <div class="row align-items-end g-0">
                            <div class="col-6">
                              <h5 class="mb-1 mt-4">$5,201,458</h5>
                              <p class="text-success fs-13 fw-medium mb-0">
                                +14.99%<span
                                  class="text-muted ms-2 fs-10 text-uppercase"
                                  >(usdt)</span
                                >
                              </p>
                            </div>
                            <!-- end col -->
                            <div class="col-6">
                              <div
                                class="apex-charts crypto-widget"
                                data-colors='["--vz-success", "--vz-transparent"]'
                                dir="ltr"
                                id="tether_sparkline_charts"
                              ></div>
                            </div>
                            <!-- end col -->
                          </div>
                          <!-- end row -->
                        </div>
                        <!-- end card body -->
                      </div>
                      <!-- end card -->
                    </div>
                    <!-- end -->

                    <div class="swiper-slide">
                      <div class="card">
                        <div class="card-body">
                          <div class="float-end">
                            <div class="dropdown">
                              <a
                                class="text-reset"
                                href="#"
                                data-bs-toggle="dropdown"
                                aria-haspopup="true"
                                aria-expanded="false"
                              >
                                <span class="text-muted fs-18"
                                  ><i class="mdi mdi-dots-horizontal"></i
                                ></span>
                              </a>
                              <div class="dropdown-menu dropdown-menu-end">
                                <a class="dropdown-item" href="#">Details</a>
                                <a class="dropdown-item" href="#">Cancel</a>
                              </div>
                            </div>
                          </div>
                          <div class="d-flex align-items-center">
                            <img
                              src="{$themePath}/assets/images/svg/crypto-icons/neo.svg"
                              class="bg-light rounded-circle p-1 avatar-xs img-fluid"
                              alt=""
                            />
                            <h6 class="ms-2 mb-0 fs-14">NEO</h6>
                          </div>
                          <div class="row align-items-end g-0">
                            <div class="col-6">
                              <h5 class="mb-1 mt-4">$6,147,957</h5>
                              <p class="text-danger fs-13 fw-medium mb-0">
                                -05.07%<span
                                  class="text-muted ms-2 fs-10 text-uppercase"
                                  >(neo)</span
                                >
                              </p>
                            </div>
                            <!-- end col -->
                            <div class="col-6">
                              <div
                                class="apex-charts crypto-widget"
                                data-colors='["--vz-danger", "--vz-transparent"]'
                                dir="ltr"
                                id="neo_sparkline_charts"
                              ></div>
                            </div>
                            <!-- end col -->
                          </div>
                          <!-- end row -->
                        </div>
                        <!-- end card body -->
                      </div>
                      <!-- end card -->
                    </div>
                    <!-- end -->
                  </div>
                  <!-- end swiper wrapper -->
                </div>
                <!-- end swiper -->
              </div>
              <!-- end col -->
            </div>
            <!-- end row -->

            <div class="row">
              <div class="col-xl-8">
                <div class="card">
                  <div class="card-header align-items-center d-flex">
                    <h4 class="card-title mb-0 flex-grow-1">My Currencies</h4>
                    <div class="flex-shrink-0">
                      <button class="btn btn-soft-primary btn-sm">24H</button>
                    </div>
                    <div class="flex-shrink-0 ms-2">
                      <div class="dropdown card-header-dropdown">
                        <a
                          class="btn btn-soft-primary btn-sm"
                          role="button"
                          href="#"
                          data-bs-toggle="dropdown"
                          aria-haspopup="true"
                          aria-expanded="false"
                        >
                          Get Report<i
                            class="mdi mdi-chevron-down align-middle ms-1"
                          ></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end">
                          <a class="dropdown-item" href="#">Download Report</a>
                          <a class="dropdown-item" href="#">Export</a>
                          <a class="dropdown-item" href="#">Import</a>
                        </div>
                      </div>
                    </div>
                  </div>
                  <!-- end card header -->
                  <div class="card-body">
                    <div class="table-responsive table-card">
                      <table
                        class="table table-hover table-borderless table-centered align-middle table-nowrap mb-0"
                      >
                        <thead class="text-muted bg-soft-light">
                          <tr>
                            <th>Coin Name</th>
                            <th>Price</th>
                            <th>24h Change</th>
                            <th>Total Balance</th>
                            <th>Total Coin</th>
                            <th>Actions</th>
                          </tr>
                        </thead>
                        <!-- end thead -->
                        <tbody>
                          <tr>
                            <td>
                              <div class="d-flex align-items-center">
                                <div class="me-2">
                                  <img
                                    src="{$themePath}/assets/images/svg/crypto-icons/btc.svg"
                                    alt=""
                                    class="avatar-xxs"
                                  />
                                </div>
                                <div>
                                  <h6 class="fs-14 mb-0">Bitcoin</h6>
                                </div>
                              </div>
                            </td>
                            <td>$48,568.025</td>
                            <td>
                              <h6 class="text-success fs-13 mb-0">
                                <i
                                  class="mdi mdi-trending-up align-middle me-1"
                                ></i
                                >5.26
                              </h6>
                            </td>
                            <td>$53,914.025</td>
                            <td>1.25634801</td>
                            <td>
                              <a
                                href="apps-crypto-buy-sell.html"
                                class="btn btn-sm btn-soft-secondary"
                                >Trade</a
                              >
                            </td>
                          </tr>
                          <!-- end -->
                          <tr>
                            <td>
                              <div class="d-flex align-items-center">
                                <div class="me-2">
                                  <img
                                    src="{$themePath}/assets/images/svg/crypto-icons/ltc.svg"
                                    alt=""
                                    class="avatar-xxs"
                                  />
                                </div>
                                <div>
                                  <h6 class="fs-14 mb-0">Litecoin</h6>
                                </div>
                              </div>
                            </td>
                            <td>$87,142.027</td>
                            <td>
                              <h6 class="text-danger fs-13 mb-0">
                                <i
                                  class="mdi mdi-trending-down align-middle me-1"
                                ></i
                                >3.07
                              </h6>
                            </td>
                            <td>$75,854.127</td>
                            <td>2.85472161</td>
                            <td>
                              <a
                                href="apps-crypto-buy-sell.html"
                                class="btn btn-sm btn-soft-secondary"
                                >Trade</a
                              >
                            </td>
                          </tr>
                          <!-- end -->
                          <tr>
                            <td>
                              <div class="d-flex align-items-center">
                                <div class="me-2">
                                  <img
                                    src="{$themePath}/assets/images/svg/crypto-icons/eth.svg"
                                    alt=""
                                    class="avatar-xxs"
                                  />
                                </div>
                                <div>
                                  <h6 class="fs-14 mb-0">Eathereum</h6>
                                </div>
                              </div>
                            </td>
                            <td>$33,847.961</td>
                            <td>
                              <h6 class="text-success fs-13 mb-0">
                                <i
                                  class="mdi mdi-trending-up align-middle me-1"
                                ></i
                                >7.13
                              </h6>
                            </td>
                            <td>$44,152.185</td>
                            <td>1.45612347</td>
                            <td>
                              <a
                                href="apps-crypto-buy-sell.html"
                                class="btn btn-sm btn-soft-secondary"
                                >Trade</a
                              >
                            </td>
                          </tr>
                          <!-- end -->
                          <tr>
                            <td>
                              <div class="d-flex align-items-center">
                                <div class="me-2">
                                  <img
                                    src="{$themePath}/assets/images/svg/crypto-icons/bnb.svg"
                                    alt=""
                                    class="avatar-xxs"
                                  />
                                </div>
                                <div>
                                  <h6 class="fs-14 mb-0">Binance</h6>
                                </div>
                              </div>
                            </td>
                            <td>$73,654.421</td>
                            <td>
                              <h6 class="text-success fs-13 mb-0">
                                <i
                                  class="mdi mdi-trending-up align-middle me-1"
                                ></i
                                >0.97
                              </h6>
                            </td>
                            <td>$48,367.125</td>
                            <td>0.35734601</td>
                            <td>
                              <a
                                href="apps-crypto-buy-sell.html"
                                class="btn btn-sm btn-soft-secondary"
                                >Trade</a
                              >
                            </td>
                          </tr>
                          <!-- end -->
                          <tr>
                            <td>
                              <div class="d-flex align-items-center">
                                <div class="me-2">
                                  <img
                                    src="{$themePath}/assets/images/svg/crypto-icons/usdt.svg"
                                    alt=""
                                    class="avatar-xxs"
                                  />
                                </div>
                                <div>
                                  <h6 class="fs-14 mb-0">Tether</h6>
                                </div>
                              </div>
                            </td>
                            <td>$66,742.077</td>
                            <td>
                              <h6 class="text-danger fs-13 mb-0">
                                <i
                                  class="mdi mdi-trending-down align-middle me-1"
                                ></i
                                >1.08
                              </h6>
                            </td>
                            <td>$53,487.083</td>
                            <td>3.62912570</td>
                            <td>
                              <a
                                href="apps-crypto-buy-sell.html"
                                class="btn btn-sm btn-soft-secondary"
                                >Trade</a
                              >
                            </td>
                          </tr>
                          <!-- end -->
                          <tr>
                            <td>
                              <div class="d-flex align-items-center">
                                <div class="me-2">
                                  <img
                                    src="{$themePath}/assets/images/svg/crypto-icons/dash.svg"
                                    alt=""
                                    class="avatar-xxs"
                                  />
                                </div>
                                <div>
                                  <h6 class="fs-14 mb-0">Dash</h6>
                                </div>
                              </div>
                            </td>
                            <td>$34,736.209</td>
                            <td>
                              <h6 class="text-success fs-13 mb-0">
                                <i
                                  class="mdi mdi-trending-up align-middle me-1"
                                ></i
                                >4.52
                              </h6>
                            </td>
                            <td>$15,203.347</td>
                            <td>1.85412740</td>
                            <td>
                              <a
                                href="apps-crypto-buy-sell.html"
                                class="btn btn-sm btn-soft-secondary"
                                >Trade</a
                              >
                            </td>
                          </tr>
                          <!-- end -->
                          <tr>
                            <td>
                              <div class="d-flex align-items-center">
                                <div class="me-2">
                                  <img
                                    src="{$themePath}/assets/images/svg/crypto-icons/neo.svg"
                                    alt=""
                                    class="avatar-xxs"
                                  />
                                </div>
                                <div>
                                  <h6 class="fs-14 mb-0">Neo</h6>
                                </div>
                              </div>
                            </td>
                            <td>$56,357.313</td>
                            <td>
                              <h6 class="text-danger fs-13 mb-0">
                                <i
                                  class="mdi mdi-trending-down align-middle me-1"
                                ></i
                                >2.87
                              </h6>
                            </td>
                            <td>$61,843.173</td>
                            <td>1.87732061</td>
                            <td>
                              <a
                                href="apps-crypto-buy-sell.html"
                                class="btn btn-sm btn-soft-secondary"
                                >Trade</a
                              >
                            </td>
                          </tr>
                          <!-- end -->
                          <tr>
                            <td>
                              <div class="d-flex align-items-center">
                                <div class="me-2">
                                  <img
                                    src="{$themePath}/assets/images/svg/crypto-icons/doge.svg"
                                    alt=""
                                    class="avatar-xxs"
                                  />
                                </div>
                                <div>
                                  <h6 class="fs-14 mb-0">Dogecoin</h6>
                                </div>
                              </div>
                            </td>
                            <td>$62,357.649</td>
                            <td>
                              <h6 class="text-success fs-13 mb-0">
                                <i
                                  class="mdi mdi-trending-up align-middle me-1"
                                ></i
                                >3.45
                              </h6>
                            </td>
                            <td>$54,843.173</td>
                            <td>0.95632087</td>
                            <td>
                              <a
                                href="apps-crypto-buy-sell.html"
                                class="btn btn-sm btn-soft-secondary"
                                >Trade</a
                              >
                            </td>
                          </tr>
                          <!-- end -->
                        </tbody>
                        <!-- end tbody -->
                      </table>
                      <!-- end table -->
                    </div>
                    <!-- end tbody -->
                  </div>
                  <!-- end cardbody -->
                </div>
                <!-- end card -->
              </div>
              <!-- end col -->

              <div class="col-xl-4">
                <div class="card">
                  <div class="card-header align-items-center border-0 d-flex">
                    <h4 class="card-title mb-0 flex-grow-1">Trading</h4>
                    <div class="flex-shrink-0">
                      <ul
                        class="nav justify-content-end nav-tabs-custom rounded card-header-tabs border-bottom-0"
                        role="tablist"
                      >
                        <li class="nav-item">
                          <a
                            class="nav-link active"
                            data-bs-toggle="tab"
                            href="#buy-tab"
                            role="tab"
                            aria-selected="false"
                            >Buy</a
                          >
                        </li>
                        <li class="nav-item">
                          <a
                            class="nav-link"
                            data-bs-toggle="tab"
                            href="#sell-tab"
                            role="tab"
                            aria-selected="true"
                            >Sell</a
                          >
                        </li>
                      </ul>
                      <!-- end ul -->
                    </div>
                  </div>
                  <!-- end cardheader -->
                  <div class="card-body p-0">
                    <div class="tab-content p-0">
                      <div class="tab-pane active" id="buy-tab" role="tabpanel">
                        <div class="p-3 bg-soft-warning">
                          <div class="float-end ms-2">
                            <h6 class="text-warning mb-0">
                              USD Balance :
                              <span class="text-dark">$12,426.07</span>
                            </h6>
                          </div>
                          <h6 class="mb-0 text-danger">Buy Coin</h6>
                        </div>
                        <div class="p-3">
                          <div class="row">
                            <div class="col-6">
                              <div class="mb-3">
                                <label>Currency :</label>
                                <select class="form-select">
                                  <option>BTC</option>
                                  <option>ETH</option>
                                  <option>LTC</option>
                                </select>
                              </div>
                            </div>
                            <!-- end col -->
                            <div class="col-6">
                              <div class="mb-3">
                                <label>Payment Method :</label>
                                <select class="form-select">
                                  <option>Wallet Balance</option>
                                  <option>Credit / Debit Card</option>
                                  <option>PayPal</option>
                                  <option>Payoneer</option>
                                </select>
                              </div>
                            </div>
                            <!-- end col -->
                          </div>
                          <!-- end row -->
                          <div>
                            <div class="input-group mb-3">
                              <label class="input-group-text">Amount</label>
                              <input
                                type="text"
                                class="form-control"
                                placeholder="0"
                              />
                            </div>

                            <div class="input-group mb-3">
                              <label class="input-group-text">Price</label>
                              <input
                                type="text"
                                class="form-control"
                                placeholder="2.045585"
                              />
                              <label class="input-group-text">$</label>
                            </div>

                            <div class="input-group mb-0">
                              <label class="input-group-text">Total</label>
                              <input
                                type="text"
                                class="form-control"
                                placeholder="2700.16"
                              />
                            </div>
                          </div>
                          <div class="mt-3 pt-2">
                            <div class="d-flex mb-2">
                              <div class="flex-grow-1">
                                <p class="fs-13 mb-0">
                                  Transaction Fees<span
                                    class="text-muted ms-1 fs-11"
                                    >(0.05%)</span
                                  >
                                </p>
                              </div>
                              <div class="flex-shrink-0">
                                <h6 class="mb-0">$1.08</h6>
                              </div>
                            </div>
                            <div class="d-flex mb-2">
                              <div class="flex-grow-1">
                                <p class="fs-13 mb-0">
                                  Minimum Received<span
                                    class="text-muted ms-1 fs-11"
                                    >(2%)</span
                                  >
                                </p>
                              </div>
                              <div class="flex-shrink-0">
                                <h6 class="mb-0">$7.85</h6>
                              </div>
                            </div>
                            <div class="d-flex">
                              <div class="flex-grow-1">
                                <p class="fs-13 mb-0">Estimated Rate</p>
                              </div>
                              <div class="flex-shrink-0">
                                <h6 class="mb-0">1 BTC ~ $34572.00</h6>
                              </div>
                            </div>
                          </div>
                          <div class="mt-3 pt-2">
                            <button type="button" class="btn btn-primary w-100">
                              Buy Coin
                            </button>
                          </div>
                        </div>
                      </div>
                      <!-- end tabpane -->

                      <div class="tab-pane" id="sell-tab" role="tabpanel">
                        <div class="p-3 bg-soft-warning">
                          <div class="float-end ms-2">
                            <h6 class="text-warning mb-0">
                              USD Balance :
                              <span class="text-dark">$12,426.07</span>
                            </h6>
                          </div>
                          <h6 class="mb-0 text-danger">Sell Coin</h6>
                        </div>
                        <div class="p-3">
                          <div class="row">
                            <div class="col-6">
                              <div class="mb-3">
                                <label>Currency :</label>
                                <select class="form-select">
                                  <option>BTC</option>
                                  <option>ETH</option>
                                  <option>LTC</option>
                                </select>
                              </div>
                            </div>
                            <!-- end col -->
                            <div class="col-6">
                              <div class="mb-3">
                                <label>Email :</label>
                                <input
                                  type="email"
                                  class="form-control"
                                  placeholder="example@email.com"
                                />
                              </div>
                            </div>
                            <!-- end col -->
                          </div>
                          <!-- end row -->
                          <div>
                            <div class="input-group mb-3">
                              <label class="input-group-text">Amount</label>
                              <input
                                type="text"
                                class="form-control"
                                placeholder="0"
                              />
                            </div>
                            <div class="input-group mb-3">
                              <label class="input-group-text">Price</label>
                              <input
                                type="text"
                                class="form-control"
                                placeholder="2.045585"
                              />
                              <label class="input-group-text">$</label>
                            </div>
                            <div class="input-group mb-0">
                              <label class="input-group-text">Total</label>
                              <input
                                type="text"
                                class="form-control"
                                placeholder="2700.16"
                              />
                            </div>
                          </div>
                          <div class="mt-3 pt-2">
                            <div class="d-flex mb-2">
                              <div class="flex-grow-1">
                                <p class="fs-13 mb-0">
                                  Transaction Fees<span
                                    class="text-muted ms-1 fs-11"
                                    >(0.05%)</span
                                  >
                                </p>
                              </div>
                              <div class="flex-shrink-0">
                                <h6 class="mb-0">$1.08</h6>
                              </div>
                            </div>
                            <div class="d-flex mb-2">
                              <div class="flex-grow-1">
                                <p class="fs-13 mb-0">
                                  Minimum Received<span
                                    class="text-muted ms-1 fs-11"
                                    >(2%)</span
                                  >
                                </p>
                              </div>
                              <div class="flex-shrink-0">
                                <h6 class="mb-0">$7.85</h6>
                              </div>
                            </div>
                            <div class="d-flex">
                              <div class="flex-grow-1">
                                <p class="fs-13 mb-0">Estimated Rate</p>
                              </div>
                              <div class="flex-shrink-0">
                                <h6 class="mb-0">1 BTC ~ $34572.00</h6>
                              </div>
                            </div>
                          </div>
                          <div class="mt-3 pt-2">
                            <button type="button" class="btn btn-danger w-100">
                              Sell Coin
                            </button>
                          </div>
                        </div>
                      </div>
                      <!-- end tab pane -->
                    </div>
                    <!-- end tab pane -->
                  </div>
                  <!-- end card body -->
                </div>
                <!-- end card -->
              </div>
              <!-- end col -->
            </div>
            <!-- end row -->

            <div class="row">
              <div class="col-xxl-4 col-lg-6">
                <div class="card card-height-100">
                  <div class="card-header align-items-center d-flex">
                    <h4 class="card-title mb-0 flex-grow-1">Recent Activity</h4>
                    <div class="flex-shrink-0">
                      <div class="dropdown card-header-dropdown">
                        <a
                          class="text-reset dropdown-btn"
                          href="#"
                          data-bs-toggle="dropdown"
                          aria-haspopup="true"
                          aria-expanded="false"
                        >
                          <span class="fw-semibold text-uppercase fs-12"
                            >Sort by: </span
                          ><span class="text-muted"
                            >Current Week<i
                              class="mdi mdi-chevron-down ms-1"
                            ></i
                          ></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end">
                          <a class="dropdown-item" href="#">Today</a>
                          <a class="dropdown-item" href="#">Last Week</a>
                          <a class="dropdown-item" href="#">Last Month</a>
                          <a class="dropdown-item" href="#">Current Year</a>
                        </div>
                      </div>
                    </div>
                  </div>
                  <!-- end card header -->
                  <div class="card-body p-0">
                    <div data-simplebar="" style="height: 390px">
                      <div class="p-3">
                        <h6 class="text-muted text-uppercase mb-3 fs-11">
                          25 Dec 2021
                        </h6>
                        <div class="d-flex align-items-center">
                          <div class="avatar-xs flex-shrink-0">
                            <span class="avatar-title bg-light rounded-circle">
                              <i
                                data-feather="arrow-down-circle"
                                class="icon-dual-success icon-sm"
                              ></i>
                            </span>
                          </div>
                          <div class="flex-grow-1 ms-3">
                            <h6 class="fs-14 mb-1">Bought Bitcoin</h6>
                            <p class="text-muted fs-12 mb-0">
                              <i
                                class="mdi mdi-circle-medium text-success fs-15 align-middle"
                              ></i>
                              Visa Debit Card ***6
                            </p>
                          </div>
                          <div class="flex-shrink-0 text-end">
                            <h6 class="mb-1 text-success">
                              +0.04025745<span class="text-uppercase ms-1"
                                >Btc</span
                              >
                            </h6>
                            <p class="text-muted fs-13 mb-0">+878.52 USD</p>
                          </div>
                        </div>
                        <!-- end -->
                        <div class="d-flex align-items-center mt-3">
                          <div class="avatar-xs flex-shrink-0">
                            <span class="avatar-title bg-light rounded-circle">
                              <i
                                data-feather="send"
                                class="icon-dual-warning icon-sm"
                              ></i>
                            </span>
                          </div>
                          <div class="flex-grow-1 ms-3">
                            <h6 class="fs-14 mb-1">Sent Eathereum</h6>
                            <p class="text-muted fs-12 mb-0">
                              <i
                                class="mdi mdi-circle-medium text-warning fs-15 align-middle"
                              ></i>
                              Sofia Cunha
                            </p>
                          </div>
                          <div class="flex-shrink-0 text-end">
                            <h6 class="mb-1 text-muted">
                              -0.09025182<span class="text-uppercase ms-1"
                                >Eth</span
                              >
                            </h6>
                            <p class="text-muted fs-13 mb-0">-659.35 USD</p>
                          </div>
                        </div>
                        <!-- end -->

                        <h6 class="text-muted text-uppercase mb-3 mt-4 fs-11">
                          24 Dec 2021
                        </h6>
                        <div class="d-flex align-items-center">
                          <div class="avatar-xs flex-shrink-0">
                            <span class="avatar-title bg-light rounded-circle">
                              <i
                                data-feather="arrow-up-circle"
                                class="icon-dual-danger icon-sm"
                              ></i>
                            </span>
                          </div>
                          <div class="flex-grow-1 ms-3">
                            <h6 class="fs-14 mb-1">Sell Dash</h6>
                            <p class="text-muted fs-12 mb-0">
                              <i
                                class="mdi mdi-circle-medium text-danger fs-15 align-middle"
                              ></i>
                              www.cryptomarket.com
                            </p>
                          </div>
                          <div class="flex-shrink-0 text-end">
                            <h6 class="mb-1 text-danger">
                              -98.6025422<span class="text-uppercase ms-1"
                                >Dash</span
                              >
                            </h6>
                            <p class="text-muted fs-13 mb-0">-1508.98 USD</p>
                          </div>
                        </div>
                        <!-- end -->
                        <div class="d-flex align-items-center mt-3">
                          <div class="avatar-xs flex-shrink-0">
                            <span class="avatar-title bg-light rounded-circle">
                              <i
                                data-feather="arrow-up-circle"
                                class="icon-dual-danger icon-sm"
                              ></i>
                            </span>
                          </div>
                          <div class="flex-grow-1 ms-3">
                            <h6 class="fs-14 mb-1">Sell Dogecoin</h6>
                            <p class="text-muted fs-12 mb-0">
                              <i
                                class="mdi mdi-circle-medium text-success fs-15 align-middle"
                              ></i>
                              www.coinmarket.com
                            </p>
                          </div>
                          <div class="flex-shrink-0 text-end">
                            <h6 class="mb-1 text-danger">
                              -1058.08025142<span class="text-uppercase ms-1"
                                >Doge</span
                              >
                            </h6>
                            <p class="text-muted fs-13 mb-0">-89.36 USD</p>
                          </div>
                        </div>
                        <!-- end -->
                        <div class="d-flex align-items-center mt-3">
                          <div class="avatar-xs flex-shrink-0">
                            <span class="avatar-title bg-light rounded-circle">
                              <i
                                data-feather="arrow-up-circle"
                                class="icon-dual-success icon-sm"
                              ></i>
                            </span>
                          </div>
                          <div class="flex-grow-1 ms-3">
                            <h6 class="fs-14 mb-1">Bought Litecoin</h6>
                            <p class="text-muted fs-12 mb-0">
                              <i
                                class="mdi mdi-circle-medium text-warning fs-15 align-middle"
                              ></i>
                              Payment via Wallet
                            </p>
                          </div>
                          <div class="flex-shrink-0 text-end">
                            <h6 class="mb-1 text-success">
                              +0.07225912<span class="text-uppercase ms-1"
                                >Ltc</span
                              >
                            </h6>
                            <p class="text-muted fs-13 mb-0">+759.45 USD</p>
                          </div>
                        </div>
                        <!-- end -->

                        <h6 class="text-muted text-uppercase mb-3 mt-4 fs-11">
                          20 Dec 2021
                        </h6>
                        <div class="d-flex align-items-center">
                          <div class="avatar-xs flex-shrink-0">
                            <span class="avatar-title bg-light rounded-circle">
                              <i
                                data-feather="send"
                                class="icon-dual-warning icon-sm"
                              ></i>
                            </span>
                          </div>
                          <div class="flex-grow-1 ms-3">
                            <h6 class="fs-14 mb-1">Sent Eathereum</h6>
                            <p class="text-muted fs-12 mb-0">
                              <i
                                class="mdi mdi-circle-medium text-warning fs-15 align-middle"
                              ></i>
                              Sofia Cunha
                            </p>
                          </div>
                          <div class="flex-shrink-0 text-end">
                            <h6 class="mb-1 text-muted">
                              -0.09025182<span class="text-uppercase ms-1"
                                >Eth</span
                              >
                            </h6>
                            <p class="text-muted fs-13 mb-0">-659.35 USD</p>
                          </div>
                        </div>
                        <!-- end -->

                        <div class="d-flex align-items-center mt-3">
                          <div class="avatar-xs flex-shrink-0">
                            <span class="avatar-title bg-light rounded-circle">
                              <i
                                data-feather="arrow-down-circle"
                                class="icon-dual-success icon-sm"
                              ></i>
                            </span>
                          </div>
                          <div class="flex-grow-1 ms-3">
                            <h6 class="fs-14 mb-1">Bought Bitcoin</h6>
                            <p class="text-muted fs-12 mb-0">
                              <i
                                class="mdi mdi-circle-medium text-success fs-15 align-middle"
                              ></i>
                              Visa Debit Card ***6
                            </p>
                          </div>
                          <div class="flex-shrink-0 text-end">
                            <h6 class="mb-1 text-success">
                              +0.04025745<span class="text-uppercase ms-1"
                                >Btc</span
                              >
                            </h6>
                            <p class="text-muted fs-13 mb-0">+878.52 USD</p>
                          </div>
                        </div>
                        <!-- end -->

                        <div class="mt-3 text-center">
                          <a
                            href="javascript:void(0);"
                            class="text-muted text-decoration-underline"
                            >Load More</a
                          >
                        </div>
                      </div>
                    </div>
                  </div>
                  <!-- end cardbody -->
                </div>
                <!-- end card -->
              </div>
              <!-- end col -->

              <div class="col-xxl-4 col-lg-6">
                <div class="card card-height-100">
                  <div class="card-header align-items-center d-flex">
                    <h4 class="card-title mb-0 flex-grow-1">Top Performers</h4>
                    <div>
                      <button type="button" class="btn btn-soft-info btn-sm">
                        1H
                      </button>
                      <button type="button" class="btn btn-soft-info btn-sm">
                        1D
                      </button>
                      <button type="button" class="btn btn-soft-info btn-sm">
                        7D
                      </button>
                      <button type="button" class="btn btn-soft-primary btn-sm">
                        1M
                      </button>
                    </div>
                  </div>
                  <!-- end card-header -->
                  <div class="card-body p-0">
                    <ul class="list-group list-group-flush border-dashed mb-0">
                      <li class="list-group-item d-flex align-items-center">
                        <div class="flex-shrink-0">
                          <img
                            src="{$themePath}/assets/images/svg/crypto-icons/btc.svg"
                            class="avatar-xs"
                            alt=""
                          />
                        </div>
                        <div class="flex-grow-1 ms-3">
                          <h6 class="fs-14 mb-1">Bitcoin</h6>
                          <p class="text-muted mb-0">$18.7 Billions</p>
                        </div>
                        <div class="flex-shrink-0 text-end">
                          <h6 class="fs-14 mb-1">$12,863.08</h6>
                          <p class="text-success fs-12 mb-0">
                            +$67.21 (+4.33%)
                          </p>
                        </div>
                      </li>
                      <!-- end -->
                      <li class="list-group-item d-flex align-items-center">
                        <div class="flex-shrink-0">
                          <img
                            src="{$themePath}/assets/images/svg/crypto-icons/eth.svg"
                            class="avatar-xs"
                            alt=""
                          />
                        </div>
                        <div class="flex-grow-1 ms-3">
                          <h6 class="fs-14 mb-1">Eathereum</h6>
                          <p class="text-muted mb-0">$27.4 Billions</p>
                        </div>
                        <div class="flex-shrink-0 text-end">
                          <h6 class="fs-14 mb-1">$08,256.04</h6>
                          <p class="text-success fs-12 mb-0">
                            +$51.19<span class="ms-1">(+5.64%)</span>
                          </p>
                        </div>
                      </li>
                      <!-- end -->
                      <li class="list-group-item d-flex align-items-center">
                        <div class="flex-shrink-0">
                          <img
                            src="{$themePath}/assets/images/svg/crypto-icons/aave.svg"
                            class="avatar-xs"
                            alt=""
                          />
                        </div>
                        <div class="flex-grow-1 ms-3">
                          <h6 class="fs-14 mb-1">Avalanche</h6>
                          <p class="text-muted mb-0">$12.9 Billions</p>
                        </div>
                        <div class="flex-shrink-0 text-end">
                          <h6 class="fs-14 mb-1">$11,896.13</h6>
                          <p class="text-danger fs-12 mb-0">
                            -$59.01<span class="ms-1">(-4.08%)</span>
                          </p>
                        </div>
                      </li>
                      <!-- end -->
                      <li class="list-group-item d-flex align-items-center">
                        <div class="flex-shrink-0">
                          <img
                            src="{$themePath}/assets/images/svg/crypto-icons/doge.svg"
                            class="avatar-xs"
                            alt=""
                          />
                        </div>
                        <div class="flex-grow-1 ms-3">
                          <h6 class="fs-14 mb-1">Dogecoin</h6>
                          <p class="text-muted mb-0">$09.5 Billions</p>
                        </div>
                        <div class="flex-shrink-0 text-end">
                          <h6 class="fs-14 mb-1">$15,999.06</h6>
                          <p class="text-success fs-12 mb-0">
                            +$74.05<span class="ms-1">(+3.12%)</span>
                          </p>
                        </div>
                      </li>
                      <!-- end -->
                      <li class="list-group-item d-flex align-items-center">
                        <div class="flex-shrink-0">
                          <img
                            src="{$themePath}/assets/images/svg/crypto-icons/bnb.svg"
                            class="avatar-xs"
                            alt=""
                          />
                        </div>
                        <div class="flex-grow-1 ms-3">
                          <h6 class="fs-14 mb-1">Binance</h6>
                          <p class="text-muted mb-0">$14.2 Billions</p>
                        </div>
                        <div class="flex-shrink-0 text-end">
                          <h6 class="fs-14 mb-1">$13,786.18</h6>
                          <p class="text-danger fs-12 mb-0">
                            -$61.05<span class="ms-1">(-9.22%)</span>
                          </p>
                        </div>
                      </li>
                      <!-- end -->
                      <li class="list-group-item d-flex align-items-center">
                        <div class="flex-shrink-0">
                          <img
                            src="{$themePath}/assets/images/svg/crypto-icons/ltc.svg"
                            class="avatar-xs"
                            alt=""
                          />
                        </div>
                        <div class="flex-grow-1 ms-3">
                          <h6 class="fs-14 mb-1">Litecoin</h6>
                          <p class="text-muted mb-0">$09.5 Billions</p>
                        </div>
                        <div class="flex-shrink-0 text-end">
                          <h6 class="fs-14 mb-1">$10,604.27</h6>
                          <p class="text-success fs-12 mb-0">
                            +$76.12<span class="ms-1">(+4.92%)</span>
                          </p>
                        </div>
                      </li>
                      <!-- end -->
                    </ul>
                    <!-- end ul -->
                  </div>
                  <!-- end card body -->
                </div>
                <!-- end card -->
              </div>
              <!-- end col -->

              <div class="col-xxl-4">
                <div class="card">
                  <div class="card-header align-items-center d-flex">
                    <h4 class="card-title mb-0 flex-grow-1">News Feed</h4>
                    <div>
                      <button type="button" class="btn btn-soft-primary btn-sm">
                        View all
                      </button>
                    </div>
                  </div>
                  <!-- end card-header -->

                  <div class="card-body">
                    <div class="d-flex align-middle">
                      <div class="flex-shrink-0">
                        <img
                          src="{$themePath}/assets/images/small/img-1.jpg"
                          class="rounded img-fluid"
                          style="height: 60px"
                          alt=""
                        />
                      </div>
                      <div class="flex-grow-1 ms-3">
                        <h6 class="mb-1 lh-base">
                          <a href="#" class="text-reset"
                            >One stop shop destination on all the latest news in
                            crypto currencies</a
                          >
                        </h6>
                        <p class="text-muted fs-12 mb-0">
                          Dec 12, 2021
                          <i class="mdi mdi-circle-medium align-middle mx-1"></i
                          >09:22 AM
                        </p>
                      </div>
                    </div>
                    <!-- end -->
                    <div class="d-flex mt-4">
                      <div class="flex-shrink-0">
                        <img
                          src="{$themePath}/assets/images/small/img-2.jpg"
                          class="rounded img-fluid"
                          style="height: 60px"
                          alt=""
                        />
                      </div>
                      <div class="flex-grow-1 ms-3">
                        <h6 class="mb-1 lh-base">
                          <a href="#" class="text-reset"
                            >Coin Journal is dedicated to delivering stories on
                            the latest crypto</a
                          >
                        </h6>
                        <p class="text-muted fs-12 mb-0">
                          Dec 03, 2021
                          <i class="mdi mdi-circle-medium align-middle mx-1"></i
                          >12:09 PM
                        </p>
                      </div>
                    </div>
                    <!-- end -->
                    <div class="d-flex mt-4">
                      <div class="flex-shrink-0">
                        <img
                          src="{$themePath}/assets/images/small/img-3.jpg"
                          class="rounded img-fluid"
                          style="height: 60px"
                          alt=""
                        />
                      </div>
                      <div class="flex-grow-1 ms-3">
                        <h6 class="mb-1 lh-base">
                          <a href="#" class="text-reset"
                            >The bitcoin-holding U.S. senator is trying to
                            “fully integrate” crypto
                          </a>
                        </h6>
                        <p class="text-muted fs-12 mb-0">
                          Nov 22, 2021
                          <i class="mdi mdi-circle-medium align-middle mx-1"></i
                          >11:47 AM
                        </p>
                      </div>
                    </div>
                    <!-- end -->
                    <div class="d-flex mt-4">
                      <div class="flex-shrink-0">
                        <img
                          src="{$themePath}/assets/images/small/img-6.jpg"
                          class="rounded img-fluid"
                          style="height: 60px"
                          alt=""
                        />
                      </div>
                      <div class="flex-grow-1 ms-3">
                        <h6 class="mb-1 lh-base">
                          <a href="#" class="text-reset"
                            >Cryptocurrency price like Bitcoin, Dash, Dogecoin,
                            Ripple and Litecoin</a
                          >
                        </h6>
                        <p class="text-muted fs-12 mb-0">
                          Nov 18, 2021
                          <i class="mdi mdi-circle-medium align-middle mx-1"></i
                          >06:13 PM
                        </p>
                      </div>
                    </div>
                    <!-- end -->

                    <div class="mt-3 text-center">
                      <a
                        href="javascript:void(0);"
                        class="text-muted text-decoration-underline"
                        >View all News</a
                      >
                    </div>
                  </div>
                  <!-- end card body -->
                </div>
                <!-- end card -->
              </div>
              <!-- end col -->
            </div>

								</div>
							</div>
						</div>
						<xsl:call-template name="igrp-footer"/>
					</div>
				</div>


				<xsl:call-template name="igrp-page-helpers"/>

				<!-- apexcharts -->
				<script src="{$path}/libs/apexcharts/apexcharts.min.js"></script>


    <!-- Swiper Js -->
    <script src="{$path}/libs/swiper/swiper-bundle.min.js"></script>

    <!-- CRM js -->
    <script src="{$themePath}/assets/js/pages/dashboard-crypto.init.js"></script>


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
