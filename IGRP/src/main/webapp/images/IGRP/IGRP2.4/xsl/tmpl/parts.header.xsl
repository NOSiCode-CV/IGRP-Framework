<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template name="igrp-header">
    <xsl:if test="$hasMenu = 'true'">
      <header id="page-topbar">
        <div class="layout-width">
          <div class="navbar-header">
            <div class="d-flex">
              <!-- LOGO -->
              <div class="navbar-brand-box horizontal-logo">
                <a href="index.html" class="logo logo-dark">
                  <span class="logo-sm">
                    <img
                      src="{$themePath}/assets/images/logo-dark.svg"
                      alt=""
                      height="40"
                    />
                  </span>
                  <span class="logo-lg">
                    <img
                      src="{$themePath}/assets/images/logo-dark.svg"
                      alt=""
                      height="40"
                    />
                  </span>
                </a>

                <a href="index.html" class="logo logo-light">
                  <span class="logo-sm">
                    <img
                      src="{$themePath}/assets/images/logo-white.svg"
                      alt=""
                      height="22"
                    />
                  </span>
                  <span class="logo-lg">
                    <img
                      
                      src="{$themePath}/assets/images/logo-white.svg"
                      alt=""
                      height="40"
                      
                    />
                  </span>
                </a>
              </div>

              <button
                type="button"
                class="btn btn-sm px-3 fs-16 header-item vertical-menu-btn topnav-hamburger"
                id="topnav-hamburger-icon"
              >
                <span class="hamburger-icon">
                  <span></span>
                  <span></span>
                  <span></span>
                </span>
              </button>

              <!-- App Search-->
              <form class="app-search d-none d-md-block">
                <div class="position-relative">
                  <input
                    type="text"
                    class="form-control"
                    placeholder="Pesquisar..."
                    autocomplete="off"
                    id="search-options"
                    value=""
                  />
                  <span class="mdi mdi-magnify search-widget-icon"></span>
                  <span
                    class="mdi mdi-close-circle search-widget-icon search-widget-icon-close d-none"
                    id="search-close-options"
                  ></span>
                </div>
                <div class="dropdown-menu dropdown-menu-lg" id="search-dropdown">
                  <div data-simplebar="" style="max-height: 320px">
                    <!-- item-->
                    <div class="dropdown-header">
                      <h6 class="text-overflow text-muted mb-0 text-uppercase">
                        Recent Searches
                      </h6>
                    </div>

                    <div class="dropdown-item bg-transparent text-wrap">
                      <a
                        href="index.html"
                        class="btn btn-soft-secondary btn-sm btn-rounded"
                        >how to setup <i class="mdi mdi-magnify ms-1"></i>
                      </a>
                      <a
                        href="index.html"
                        class="btn btn-soft-secondary btn-sm btn-rounded"
                        >buttons <i class="mdi mdi-magnify ms-1"></i>
                      </a>
                    </div>
                    <!-- item-->
                    <div class="dropdown-header mt-2">
                      <h6 class="text-overflow text-muted mb-1 text-uppercase">
                        Pages
                      </h6>
                    </div>

                    <!-- item-->
                    <a
                      href="javascript:void(0);"
                      class="dropdown-item notify-item"
                    >
                      <i
                        class="ri-bubble-chart-line align-middle fs-18 text-muted me-2"
                      ></i>
                      <span>Analytics Dashboard</span>
                    </a>

                    <!-- item-->
                    <a
                      href="javascript:void(0);"
                      class="dropdown-item notify-item"
                    >
                      <i
                        class="ri-lifebuoy-line align-middle fs-18 text-muted me-2"
                      ></i>
                      <span>Help Center</span>
                    </a>

                    <!-- item-->
                    <a
                      href="javascript:void(0);"
                      class="dropdown-item notify-item"
                    >
                      <i
                        class="ri-user-settings-line align-middle fs-18 text-muted me-2"
                      ></i>
                      <span>My account settings</span>
                    </a>

                    <!-- item-->
                    <div class="dropdown-header mt-2">
                      <h6 class="text-overflow text-muted mb-2 text-uppercase">
                        Members
                      </h6>
                    </div>

                    <div class="notification-list">
                      <!-- item -->
                      <a
                        href="javascript:void(0);"
                        class="dropdown-item notify-item py-2"
                      >
                        <div class="d-flex">
                          <img
                            src="{$themePath}/assets/images/users/avatar-2.jpg"
                            class="me-3 rounded-circle avatar-xs"
                            alt="user-pic"
                          />
                          <div class="flex-1">
                            <h6 class="m-0">Angela Bernier</h6>
                            <span class="fs-11 mb-0 text-muted">Manager</span>
                          </div>
                        </div>
                      </a>
                      <!-- item -->
                      <a
                        href="javascript:void(0);"
                        class="dropdown-item notify-item py-2"
                      >
                        <div class="d-flex">
                          <img
                            src="{$themePath}/assets/images/users/avatar-3.jpg"
                            class="me-3 rounded-circle avatar-xs"
                            alt="user-pic"
                          />
                          <div class="flex-1">
                            <h6 class="m-0">David Grasso</h6>
                            <span class="fs-11 mb-0 text-muted"
                              >Web Designer</span
                            >
                          </div>
                        </div>
                      </a>
                      <!-- item -->
                      <a
                        href="javascript:void(0);"
                        class="dropdown-item notify-item py-2"
                      >
                        <div class="d-flex">
                          <img
                            src="{$themePath}/assets/images/users/avatar-5.jpg"
                            class="me-3 rounded-circle avatar-xs"
                            alt="user-pic"
                          />
                          <div class="flex-1">
                            <h6 class="m-0">Mike Bunch</h6>
                            <span class="fs-11 mb-0 text-muted"
                              >React Developer</span
                            >
                          </div>
                        </div>
                      </a>
                    </div>
                  </div>

                  <div class="text-center pt-3 pb-1">
                    <a
                      href="pages-search-results.html"
                      class="btn btn-primary btn-sm"
                      >View All Results <i class="ri-arrow-right-line ms-1"></i>
                    </a>
                  </div>
                </div>
              </form>
            </div>

            <div class="d-flex align-items-center">
              <div class="dropdown d-md-none topbar-head-dropdown header-item d-none">
                <button
                  type="button"
                  class="btn btn-icon btn-topbar btn-ghost-secondary rounded-circle"
                  id="page-header-search-dropdown"
                  data-bs-toggle="dropdown"
                  aria-haspopup="true"
                  aria-expanded="false"
                >
                  <i class="bx bx-search fs-22"></i>
                </button>
                <div
                  class="dropdown-menu dropdown-menu-lg dropdown-menu-end p-0"
                  aria-labelledby="page-header-search-dropdown"
                >
                  <form class="p-3">
                    <div class="form-group m-0">
                      <div class="input-group">
                        <input
                          type="text"
                          class="form-control"
                          placeholder="Search ..."
                          aria-label="Recipient's username"
                        />
                        <button class="btn btn-primary" type="submit">
                          <i class="mdi mdi-magnify"></i>
                        </button>
                      </div>
                    </div>
                  </form>
                </div>
              </div>

              <div class="d-none dropdown ms-1 topbar-head-dropdown header-item ">
                <button
                  type="button"
                  class="btn btn-icon btn-topbar btn-ghost-secondary rounded-circle"
                  data-bs-toggle="dropdown"
                  aria-haspopup="true"
                  aria-expanded="false"
                >
                  <img
                    id="header-lang-img"
                    src="{$path}/assets/img/flags/us.svg"
                    alt="Header Language"
                    height="20"
                    class="rounded"
                  />
                </button>
                <div class="dropdown-menu dropdown-menu-end">
                  <!-- item-->
                  <a
                    href="javascript:void(0);"
                    class="dropdown-item notify-item language py-2"
                    data-lang="en"
                    title="English"
                  >
                    <img
                      src="{$path}/assets/img/flags/us.svg"
                      alt="user-image"
                      class="me-2 rounded"
                      height="18"
                    />
                    <span class="align-middle">English</span>
                  </a>

                  <!-- item-->
                  <a
                    href="javascript:void(0);"
                    class="dropdown-item notify-item language"
                    data-lang="sp"
                    title="Spanish"
                  >
                    <img
                      src="{$path}/assets/img/flags/spain.svg"
                      alt="user-image"
                      class="me-2 rounded"
                      height="18"
                    />
                    <span class="align-middle">Española</span>
                  </a>

                  <!-- item-->
                  <a
                    href="javascript:void(0);"
                    class="dropdown-item notify-item language"
                    data-lang="gr"
                    title="German"
                  >
                    <img
                      src="{$path}/assets/img/flags/germany.svg"
                      alt="user-image"
                      class="me-2 rounded"
                      height="18"
                    />
                    <span class="align-middle">Deutsche</span>
                  </a>

                  <!-- item-->
                  <a
                    href="javascript:void(0);"
                    class="dropdown-item notify-item language"
                    data-lang="it"
                    title="Italian"
                  >
                    <img
                      src="{$path}/assets/img/flags/italy.svg"
                      alt="user-image"
                      class="me-2 rounded"
                      height="18"
                    />
                    <span class="align-middle">Italiana</span>
                  </a>

                  <!-- item-->
                  <a
                    href="javascript:void(0);"
                    class="dropdown-item notify-item language"
                    data-lang="ru"
                    title="Russian"
                  >
                    <img
                      src="{$path}/assets/img/flags/russia.svg"
                      alt="user-image"
                      class="me-2 rounded"
                      height="18"
                    />
                    <span class="align-middle">русский</span>
                  </a>

                  <!-- item-->
                  <a
                    href="javascript:void(0);"
                    class="dropdown-item notify-item language"
                    data-lang="ch"
                    title="Chinese"
                  >
                    <img
                      src="{$path}/assets/img/flags/china.svg"
                      alt="user-image"
                      class="me-2 rounded"
                      height="18"
                    />
                    <span class="align-middle">中国人</span>
                  </a>

                  <!-- item-->
                  <a
                    href="javascript:void(0);"
                    class="dropdown-item notify-item language"
                    data-lang="fr"
                    title="French"
                  >
                    <img
                      src="{$path}/assets/img/flags/french.svg"
                      alt="user-image"
                      class="me-2 rounded"
                      height="18"
                    />
                    <span class="align-middle">français</span>
                  </a>
                </div>
              </div>

              <div class="dropdown topbar-head-dropdown ms-1 header-item d-none">
                <button
                  type="button"
                  class="btn btn-icon btn-topbar btn-ghost-secondary rounded-circle"
                  data-bs-toggle="dropdown"
                  aria-haspopup="true"
                  aria-expanded="false"
                >
                  <i class="bx bx-category-alt fs-22"></i>
                </button>
                <div class="dropdown-menu dropdown-menu-lg p-0 dropdown-menu-end">
                  <div
                    class="p-3 border-top-0 border-start-0 border-end-0 border-dashed border"
                  >
                    <div class="row align-items-center">
                      <div class="col">
                        <h6 class="m-0 fw-semibold fs-15">Web Apps</h6>
                      </div>
                      <div class="col-auto">
                        <a href="#!" class="btn btn-sm btn-soft-info">
                          View All Apps
                          <i class="ri-arrow-right-s-line align-middle"></i>
                        </a>
                      </div>
                    </div>
                  </div>

                  <div class="p-2">
                    <div class="row g-0">
                      <div class="col">
                        <a class="dropdown-icon-item" href="#!">
                          <img
                            src="{$themePath}/assets/images/brands/github.png"
                            alt="Github"
                          />
                          <span>GitHub</span>
                        </a>
                      </div>
                      <div class="col">
                        <a class="dropdown-icon-item" href="#!">
                          <img
                            src="{$themePath}/assets/images/brands/bitbucket.png"
                            alt="bitbucket"
                          />
                          <span>Bitbucket</span>
                        </a>
                      </div>
                      <div class="col">
                        <a class="dropdown-icon-item" href="#!">
                          <img
                            src="{$themePath}/assets/images/brands/dribbble.png"
                            alt="dribbble"
                          />
                          <span>Dribbble</span>
                        </a>
                      </div>
                    </div>

                    <div class="row g-0">
                      <div class="col">
                        <a class="dropdown-icon-item" href="#!">
                          <img
                            src="{$themePath}/assets/images/brands/dropbox.png"
                            alt="dropbox"
                          />
                          <span>Dropbox</span>
                        </a>
                      </div>
                      <div class="col">
                        <a class="dropdown-icon-item" href="#!">
                          <img
                            src="{$themePath}/assets/images/brands/mail_chimp.png"
                            alt="mail_chimp"
                          />
                          <span>Mail Chimp</span>
                        </a>
                      </div>
                      <div class="col">
                        <a class="dropdown-icon-item" href="#!">
                          <img
                            src="{$themePath}/assets/images/brands/slack.png"
                            alt="slack"
                          />
                          <span>Slack</span>
                        </a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="dropdown topbar-head-dropdown ms-1 header-item d-none">
                <button
                  type="button"
                  class="btn btn-icon btn-topbar btn-ghost-secondary rounded-circle"
                  id="page-header-cart-dropdown"
                  data-bs-toggle="dropdown"
                  data-bs-auto-close="outside"
                  aria-haspopup="true"
                  aria-expanded="false"
                >
                  <i class="bx bx-shopping-bag fs-22"></i>
                  <span
                    class="position-absolute topbar-badge cartitem-badge fs-10 translate-middle badge rounded-pill bg-info"
                    >5</span
                  >
                </button>
                <div
                  class="dropdown-menu dropdown-menu-xl dropdown-menu-end p-0 dropdown-menu-cart"
                  aria-labelledby="page-header-cart-dropdown"
                >
                  <div
                    class="p-3 border-top-0 border-start-0 border-end-0 border-dashed border"
                  >
                    <div class="row align-items-center">
                      <div class="col">
                        <h6 class="m-0 fs-16 fw-semibold">My Cart</h6>
                      </div>
                      <div class="col-auto">
                        <span class="badge badge-soft-warning fs-13">
                          <span class="cartitem-badge">7</span> items</span
                        >
                      </div>
                    </div>
                  </div>
                  <div data-simplebar="" style="max-height: 300px">
                    <div class="p-2">
                      <div class="text-center empty-cart" id="empty-cart">
                        <div class="avatar-md mx-auto my-3">
                          <div
                            class="avatar-title bg-soft-info text-info fs-36 rounded-circle"
                          >
                            <i class="bx bx-cart"></i>
                          </div>
                        </div>
                        <h5 class="mb-3">Your Cart is Empty!</h5>
                        <a
                          href="apps-ecommerce-products.html"
                          class="btn btn-success w-md mb-3"
                          >Shop Now</a
                        >
                      </div>
                      <div
                        class="d-block dropdown-item dropdown-item-cart text-wrap px-3 py-2"
                      >
                        <div class="d-flex align-items-center">
                          <img
                            src="{$themePath}/assets/images/products/img-1.png"
                            class="me-3 rounded-circle avatar-sm p-2 bg-light"
                            alt="user-pic"
                          />
                          <div class="flex-1">
                            <h6 class="mt-0 mb-1 fs-14">
                              <a
                                href="apps-ecommerce-product-details.html"
                                class="text-reset"
                                >Branded T-Shirts</a
                              >
                            </h6>
                            <p class="mb-0 fs-12 text-muted">
                              Quantity: <span>10 x $32</span>
                            </p>
                          </div>
                          <div class="px-2">
                            <h5 class="m-0 fw-normal">
                              $ <span class="cart-item-price">320</span>
                            </h5>
                          </div>
                          <div class="ps-2">
                            <button
                              type="button"
                              class="btn btn-icon btn-sm btn-ghost-secondary remove-item-btn"
                            >
                              <i class="ri-close-fill fs-16"></i>
                            </button>
                          </div>
                        </div>
                      </div>

                      <div
                        class="d-block dropdown-item dropdown-item-cart text-wrap px-3 py-2"
                      >
                        <div class="d-flex align-items-center">
                          <img
                            src="{$themePath}/assets/images/products/img-2.png"
                            class="me-3 rounded-circle avatar-sm p-2 bg-light"
                            alt="user-pic"
                          />
                          <div class="flex-1">
                            <h6 class="mt-0 mb-1 fs-14">
                              <a
                                href="apps-ecommerce-product-details.html"
                                class="text-reset"
                                >Bentwood Chair</a
                              >
                            </h6>
                            <p class="mb-0 fs-12 text-muted">
                              Quantity: <span>5 x $18</span>
                            </p>
                          </div>
                          <div class="px-2">
                            <h5 class="m-0 fw-normal">
                              $ <span class="cart-item-price">89</span>
                            </h5>
                          </div>
                          <div class="ps-2">
                            <button
                              type="button"
                              class="btn btn-icon btn-sm btn-ghost-secondary remove-item-btn"
                            >
                              <i class="ri-close-fill fs-16"></i>
                            </button>
                          </div>
                        </div>
                      </div>

                      <div
                        class="d-block dropdown-item dropdown-item-cart text-wrap px-3 py-2"
                      >
                        <div class="d-flex align-items-center">
                          <img
                            src="{$themePath}/assets/images/products/img-3.png"
                            class="me-3 rounded-circle avatar-sm p-2 bg-light"
                            alt="user-pic"
                          />
                          <div class="flex-1">
                            <h6 class="mt-0 mb-1 fs-14">
                              <a
                                href="apps-ecommerce-product-details.html"
                                class="text-reset"
                              >
                                Borosil Paper Cup</a
                              >
                            </h6>
                            <p class="mb-0 fs-12 text-muted">
                              Quantity: <span>3 x $250</span>
                            </p>
                          </div>
                          <div class="px-2">
                            <h5 class="m-0 fw-normal">
                              $ <span class="cart-item-price">750</span>
                            </h5>
                          </div>
                          <div class="ps-2">
                            <button
                              type="button"
                              class="btn btn-icon btn-sm btn-ghost-secondary remove-item-btn"
                            >
                              <i class="ri-close-fill fs-16"></i>
                            </button>
                          </div>
                        </div>
                      </div>

                      <div
                        class="d-block dropdown-item dropdown-item-cart text-wrap px-3 py-2"
                      >
                        <div class="d-flex align-items-center">
                          <img
                            src="{$themePath}/assets/images/products/img-6.png"
                            class="me-3 rounded-circle avatar-sm p-2 bg-light"
                            alt="user-pic"
                          />
                          <div class="flex-1">
                            <h6 class="mt-0 mb-1 fs-14">
                              <a
                                href="apps-ecommerce-product-details.html"
                                class="text-reset"
                                >Gray Styled T-Shirt</a
                              >
                            </h6>
                            <p class="mb-0 fs-12 text-muted">
                              Quantity: <span>1 x $1250</span>
                            </p>
                          </div>
                          <div class="px-2">
                            <h5 class="m-0 fw-normal">
                              $ <span class="cart-item-price">1250</span>
                            </h5>
                          </div>
                          <div class="ps-2">
                            <button
                              type="button"
                              class="btn btn-icon btn-sm btn-ghost-secondary remove-item-btn"
                            >
                              <i class="ri-close-fill fs-16"></i>
                            </button>
                          </div>
                        </div>
                      </div>

                      <div
                        class="d-block dropdown-item dropdown-item-cart text-wrap px-3 py-2"
                      >
                        <div class="d-flex align-items-center">
                          <img
                            src="{$themePath}/assets/images/products/img-5.png"
                            class="me-3 rounded-circle avatar-sm p-2 bg-light"
                            alt="user-pic"
                          />
                          <div class="flex-1">
                            <h6 class="mt-0 mb-1 fs-14">
                              <a
                                href="apps-ecommerce-product-details.html"
                                class="text-reset"
                                >Stillbird Helmet</a
                              >
                            </h6>
                            <p class="mb-0 fs-12 text-muted">
                              Quantity: <span>2 x $495</span>
                            </p>
                          </div>
                          <div class="px-2">
                            <h5 class="m-0 fw-normal">
                              $ <span class="cart-item-price">990</span>
                            </h5>
                          </div>
                          <div class="ps-2">
                            <button
                              type="button"
                              class="btn btn-icon btn-sm btn-ghost-secondary remove-item-btn"
                            >
                              <i class="ri-close-fill fs-16"></i>
                            </button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div
                    class="p-3 border-bottom-0 border-start-0 border-end-0 border-dashed border"
                    id="checkout-elem"
                  >
                    <div
                      class="d-flex justify-content-between align-items-center pb-3"
                    >
                      <h5 class="m-0 text-muted">Total:</h5>
                      <div class="px-2">
                        <h5 class="m-0" id="cart-item-total">$1258.58</h5>
                      </div>
                    </div>

                    <a
                      href="apps-ecommerce-checkout.html"
                      class="btn btn-success text-center w-100"
                    >
                      Checkout
                    </a>
                  </div>
                </div>
              </div>

              <div class="ms-1 header-item d-none d-sm-flex">
                <button
                  type="button"
                  class="btn btn-icon btn-topbar btn-ghost-secondary rounded-circle"
                  data-toggle="fullscreen"
                >
                  <i class="bx bx-fullscreen fs-22"></i>
                </button>
              </div>

              <div class="ms-1 header-item d-none d-sm-flex">
                <button
                  type="button"
                  class="btn btn-icon btn-topbar btn-ghost-secondary rounded-circle light-dark-mode"
                >
                  <i class="bx bx-moon fs-22"></i>
                </button>
              </div>

              <div class="dropdown topbar-head-dropdown ms-1 header-item d-none" id="notificationDropdown">
                <button
                  type="button"
                  class="btn btn-icon btn-topbar btn-ghost-secondary rounded-circle"
                  id="page-header-notifications-dropdown"
                  data-bs-toggle="dropdown"
                  aria-haspopup="true"
                  aria-expanded="false"
                >
                  <i class="bx bx-bell fs-22"></i>
                  <span
                    class="position-absolute topbar-badge fs-10 translate-middle badge rounded-pill bg-danger"
                    >3<span class="visually-hidden">unread messages</span>
                  </span>
                </button>
                <div
                  class="dropdown-menu dropdown-menu-lg dropdown-menu-end p-0"
                  aria-labelledby="page-header-notifications-dropdown"
                >
                  <div class="dropdown-head bg-primary bg-pattern rounded-top">
                    <div class="p-3">
                      <div class="row align-items-center">
                        <div class="col">
                          <h6 class="m-0 fs-16 fw-semibold text-white">
                            Notifications
                          </h6>
                        </div>
                        <div class="col-auto dropdown-tabs">
                          <span class="badge badge-soft-light fs-13"> 4 New</span>
                        </div>
                      </div>
                    </div>

                    <div class="px-2 pt-2">
                      <ul
                        class="nav nav-tabs dropdown-tabs nav-tabs-custom"
                        data-dropdown-tabs="true"
                        id="notificationItemsTab"
                        role="tablist"
                      >
                        <li class="nav-item waves-effect waves-light">
                          <a
                            class="nav-link active"
                            data-bs-toggle="tab"
                            href="#all-noti-tab"
                            role="tab"
                            aria-selected="true"
                          >
                            All (4)
                          </a>
                        </li>
                        <li class="nav-item waves-effect waves-light">
                          <a
                            class="nav-link"
                            data-bs-toggle="tab"
                            href="#messages-tab"
                            role="tab"
                            aria-selected="false"
                          >
                            Messages
                          </a>
                        </li>
                        <li class="nav-item waves-effect waves-light">
                          <a
                            class="nav-link"
                            data-bs-toggle="tab"
                            href="#alerts-tab"
                            role="tab"
                            aria-selected="false"
                          >
                            Alerts
                          </a>
                        </li>
                      </ul>
                    </div>
                  </div>

                  <div class="tab-content" id="notificationItemsTabContent">
                    <div
                      class="tab-pane fade show active py-2 ps-2"
                      id="all-noti-tab"
                      role="tabpanel"
                    >
                      <div
                        data-simplebar=""
                        style="max-height: 300px"
                        class="pe-2"
                      >
                        <div
                          class="text-reset notification-item d-block dropdown-item position-relative"
                        >
                          <div class="d-flex">
                            <div class="avatar-xs me-3">
                              <span
                                class="avatar-title bg-soft-info text-info rounded-circle fs-16"
                              >
                                <i class="bx bx-badge-check"></i>
                              </span>
                            </div>
                            <div class="flex-1">
                              <a href="#!" class="stretched-link">
                                <h6 class="mt-0 mb-2 lh-base">
                                  Your <b>Elite</b> author Graphic Optimization
                                  <span class="text-secondary">reward</span> is
                                  ready!
                                </h6>
                              </a>
                              <p
                                class="mb-0 fs-11 fw-medium text-uppercase text-muted"
                              >
                                <span>
                                  <i class="mdi mdi-clock-outline"></i> Just 30
                                  sec ago</span
                                >
                              </p>
                            </div>
                            <div class="px-2 fs-15">
                              <div class="form-check notification-check">
                                <input
                                  class="form-check-input"
                                  type="checkbox"
                                  value=""
                                  id="all-notification-check01"
                                />
                                <label
                                  class="form-check-label"
                                  for="all-notification-check01"
                                ></label>
                              </div>
                            </div>
                          </div>
                        </div>

                        <div
                          class="text-reset notification-item d-block dropdown-item position-relative active"
                        >
                          <div class="d-flex">
                            <img
                              src="{$themePath}/assets/images/users/avatar-2.jpg"
                              class="me-3 rounded-circle avatar-xs"
                              alt="user-pic"
                            />
                            <div class="flex-1">
                              <a href="#!" class="stretched-link">
                                <h6 class="mt-0 mb-1 fs-13 fw-semibold">
                                  Angela Bernier
                                </h6>
                              </a>
                              <div class="fs-13 text-muted">
                                <p class="mb-1">
                                  Answered to your comment on the cash flow
                                  forecast's graph 🔔.
                                </p>
                              </div>
                              <p
                                class="mb-0 fs-11 fw-medium text-uppercase text-muted"
                              >
                                <span>
                                  <i class="mdi mdi-clock-outline"></i> 48 min
                                  ago</span
                                >
                              </p>
                            </div>
                            <div class="px-2 fs-15">
                              <div class="form-check notification-check">
                                <input
                                  class="form-check-input"
                                  type="checkbox"
                                  value=""
                                  id="all-notification-check02"
                                  checked="checked"
                                />
                                <label
                                  class="form-check-label"
                                  for="all-notification-check02"
                                ></label>
                              </div>
                            </div>
                          </div>
                        </div>

                        <div
                          class="text-reset notification-item d-block dropdown-item position-relative"
                        >
                          <div class="d-flex">
                            <div class="avatar-xs me-3">
                              <span
                                class="avatar-title bg-soft-danger text-danger rounded-circle fs-16"
                              >
                                <i class="bx bx-message-square-dots"></i>
                              </span>
                            </div>
                            <div class="flex-1">
                              <a href="#!" class="stretched-link">
                                <h6 class="mt-0 mb-2 fs-13 lh-base">
                                  You have received
                                  <b class="text-success">20</b> new messages in
                                  the conversation
                                </h6>
                              </a>
                              <p
                                class="mb-0 fs-11 fw-medium text-uppercase text-muted"
                              >
                                <span>
                                  <i class="mdi mdi-clock-outline"></i> 2 hrs
                                  ago</span
                                >
                              </p>
                            </div>
                            <div class="px-2 fs-15">
                              <div class="form-check notification-check">
                                <input
                                  class="form-check-input"
                                  type="checkbox"
                                  value=""
                                  id="all-notification-check03"
                                />
                                <label
                                  class="form-check-label"
                                  for="all-notification-check03"
                                ></label>
                              </div>
                            </div>
                          </div>
                        </div>

                        <div
                          class="text-reset notification-item d-block dropdown-item position-relative"
                        >
                          <div class="d-flex">
                            <img
                              src="{$themePath}/assets/images/users/avatar-8.jpg"
                              class="me-3 rounded-circle avatar-xs"
                              alt="user-pic"
                            />
                            <div class="flex-1">
                              <a href="#!" class="stretched-link">
                                <h6 class="mt-0 mb-1 fs-13 fw-semibold">
                                  Maureen Gibson
                                </h6>
                              </a>
                              <div class="fs-13 text-muted">
                                <p class="mb-1">
                                  We talked about a project on linkedin.
                                </p>
                              </div>
                              <p
                                class="mb-0 fs-11 fw-medium text-uppercase text-muted"
                              >
                                <span>
                                  <i class="mdi mdi-clock-outline"></i> 4 hrs
                                  ago</span
                                >
                              </p>
                            </div>
                            <div class="px-2 fs-15">
                              <div class="form-check notification-check">
                                <input
                                  class="form-check-input"
                                  type="checkbox"
                                  value=""
                                  id="all-notification-check04"
                                />
                                <label
                                  class="form-check-label"
                                  for="all-notification-check04"
                                ></label>
                              </div>
                            </div>
                          </div>
                        </div>

                        <div class="my-3 text-center">
                          <button
                            type="button"
                            class="btn btn-soft-success waves-effect waves-light"
                          >
                            View All Notifications
                            <i class="ri-arrow-right-line align-middle"></i>
                          </button>
                        </div>
                      </div>
                    </div>

                    <div
                      class="tab-pane fade py-2 ps-2"
                      id="messages-tab"
                      role="tabpanel"
                      aria-labelledby="messages-tab"
                    >
                      <div
                        data-simplebar=""
                        style="max-height: 300px"
                        class="pe-2"
                      >
                        <div
                          class="text-reset notification-item d-block dropdown-item"
                        >
                          <div class="d-flex">
                            <img
                              src="{$themePath}/assets/images/users/avatar-3.jpg"
                              class="me-3 rounded-circle avatar-xs"
                              alt="user-pic"
                            />
                            <div class="flex-1">
                              <a href="#!" class="stretched-link">
                                <h6 class="mt-0 mb-1 fs-13 fw-semibold">
                                  James Lemire
                                </h6>
                              </a>
                              <div class="fs-13 text-muted">
                                <p class="mb-1">
                                  We talked about a project on linkedin.
                                </p>
                              </div>
                              <p
                                class="mb-0 fs-11 fw-medium text-uppercase text-muted"
                              >
                                <span>
                                  <i class="mdi mdi-clock-outline"></i> 30 min
                                  ago</span
                                >
                              </p>
                            </div>
                            <div class="px-2 fs-15">
                              <div class="form-check notification-check">
                                <input
                                  class="form-check-input"
                                  type="checkbox"
                                  value=""
                                  id="messages-notification-check01"
                                />
                                <label
                                  class="form-check-label"
                                  for="messages-notification-check01"
                                ></label>
                              </div>
                            </div>
                          </div>
                        </div>

                        <div
                          class="text-reset notification-item d-block dropdown-item"
                        >
                          <div class="d-flex">
                            <img
                              src="{$themePath}/assets/images/users/avatar-2.jpg"
                              class="me-3 rounded-circle avatar-xs"
                              alt="user-pic"
                            />
                            <div class="flex-1">
                              <a href="#!" class="stretched-link">
                                <h6 class="mt-0 mb-1 fs-13 fw-semibold">
                                  Angela Bernier
                                </h6>
                              </a>
                              <div class="fs-13 text-muted">
                                <p class="mb-1">
                                  Answered to your comment on the cash flow
                                  forecast's graph 🔔.
                                </p>
                              </div>
                              <p
                                class="mb-0 fs-11 fw-medium text-uppercase text-muted"
                              >
                                <span>
                                  <i class="mdi mdi-clock-outline"></i> 2 hrs
                                  ago</span
                                >
                              </p>
                            </div>
                            <div class="px-2 fs-15">
                              <div class="form-check notification-check">
                                <input
                                  class="form-check-input"
                                  type="checkbox"
                                  value=""
                                  id="messages-notification-check02"
                                />
                                <label
                                  class="form-check-label"
                                  for="messages-notification-check02"
                                ></label>
                              </div>
                            </div>
                          </div>
                        </div>

                        <div
                          class="text-reset notification-item d-block dropdown-item"
                        >
                          <div class="d-flex">
                            <img
                              src="{$themePath}/assets/images/users/avatar-6.jpg"
                              class="me-3 rounded-circle avatar-xs"
                              alt="user-pic"
                            />
                            <div class="flex-1">
                              <a href="#!" class="stretched-link">
                                <h6 class="mt-0 mb-1 fs-13 fw-semibold">
                                  Kenneth Brown
                                </h6>
                              </a>
                              <div class="fs-13 text-muted">
                                <p class="mb-1">
                                  Mentionned you in his comment on 📃 invoice
                                  #12501.
                                </p>
                              </div>
                              <p
                                class="mb-0 fs-11 fw-medium text-uppercase text-muted"
                              >
                                <span>
                                  <i class="mdi mdi-clock-outline"></i> 10 hrs
                                  ago</span
                                >
                              </p>
                            </div>
                            <div class="px-2 fs-15">
                              <div class="form-check notification-check">
                                <input
                                  class="form-check-input"
                                  type="checkbox"
                                  value=""
                                  id="messages-notification-check03"
                                />
                                <label
                                  class="form-check-label"
                                  for="messages-notification-check03"
                                ></label>
                              </div>
                            </div>
                          </div>
                        </div>

                        <div
                          class="text-reset notification-item d-block dropdown-item"
                        >
                          <div class="d-flex">
                            <img
                              src="{$themePath}/assets/images/users/avatar-8.jpg"
                              class="me-3 rounded-circle avatar-xs"
                              alt="user-pic"
                            />
                            <div class="flex-1">
                              <a href="#!" class="stretched-link">
                                <h6 class="mt-0 mb-1 fs-13 fw-semibold">
                                  Maureen Gibson
                                </h6>
                              </a>
                              <div class="fs-13 text-muted">
                                <p class="mb-1">
                                  We talked about a project on linkedin.
                                </p>
                              </div>
                              <p
                                class="mb-0 fs-11 fw-medium text-uppercase text-muted"
                              >
                                <span>
                                  <i class="mdi mdi-clock-outline"></i> 3 days
                                  ago</span
                                >
                              </p>
                            </div>
                            <div class="px-2 fs-15">
                              <div class="form-check notification-check">
                                <input
                                  class="form-check-input"
                                  type="checkbox"
                                  value=""
                                  id="messages-notification-check04"
                                />
                                <label
                                  class="form-check-label"
                                  for="messages-notification-check04"
                                ></label>
                              </div>
                            </div>
                          </div>
                        </div>

                        <div class="my-3 text-center">
                          <button
                            type="button"
                            class="btn btn-soft-success waves-effect waves-light"
                          >
                            View All Messages
                            <i class="ri-arrow-right-line align-middle"></i>
                          </button>
                        </div>
                      </div>
                    </div>
                    <div
                      class="tab-pane fade p-4"
                      id="alerts-tab"
                      role="tabpanel"
                      aria-labelledby="alerts-tab"
                    >
                      <div class="w-25 w-sm-50 pt-3 mx-auto">
                        <img
                          src="{$themePath}/assets/images/svg/bell.svg"
                          class="img-fluid"
                          alt="user-pic"
                        />
                      </div>
                      <div class="text-center pb-5 mt-2">
                        <h6 class="fs-18 fw-semibold lh-base">
                          Hey! You have no any notifications
                        </h6>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="dropdown ms-sm-3 header-item topbar-user">
                <button
                  type="button"
                  class="btn"
                  id="page-header-user-dropdown"
                  data-bs-toggle="dropdown"
                  aria-haspopup="true"
                  aria-expanded="false"
                >
                  <span class="d-flex align-items-center">
                    <img
                      class="rounded-circle header-profile-user"
                      src="https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png"
                      alt="Header Avatar"
                    />
                    <span class="text-start ms-xl-2">
                      <span class="d-none d-xl-inline-block ms-1 fw-medium user-name-text">
                        <xsl:value-of select="rows/site/user_name"/>
                      </span>
                      <span class="d-none d-xl-block ms-1 fs-12 text-muted user-name-sub-text">Perfil</span>
                    </span>
                  </span>
                </button>
                <div class="dropdown-menu dropdown-menu-end">
                  <!-- item-->
                  <h6 class="dropdown-header">John Doe!</h6>

                  <a class="dropdown-item" href="apps-tasks-kanban.html">
                    <i
                      class="mdi mdi-calendar-check-outline text-muted fs-16 align-middle me-1"
                    ></i>
                    <span class="align-middle">Minhas Tarefas</span>
                  </a>
                  <a class="dropdown-item" href="pages-faqs.html">
                    <i
                      class="mdi mdi-lifebuoy text-muted fs-16 align-middle me-1"
                    ></i>
                    <span class="align-middle">Suporte</span>
                  </a>
                  <div class="dropdown-divider"></div>

                  <a class="dropdown-item" href="pages-profile-settings.html">
                    <i
                      class="mdi mdi-cog-outline text-muted fs-16 align-middle me-1"
                    ></i>
                    <span class="align-middle">Configurações</span>
                  </a>
          
                  <a class="dropdown-item" href="http://localhost/igrp-design-system-beta/IGRP2.4/xml/IGRP-login.xml">
                    <i
                      class="mdi mdi-logout text-muted fs-16 align-middle me-1"
                    ></i>
                    <span class="align-middle" data-key="t-logout">Sair</span>
                  </a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </header>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
