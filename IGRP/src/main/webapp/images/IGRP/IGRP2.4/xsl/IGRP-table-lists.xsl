<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/>

  <xsl:template match="/">
    <html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">
      <head>

        <!-- page includes css -->

        <!-- Include Choices CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/choices.js/public/assets/styles/choices.min.css" />

        <script src="https://cdn.jsdelivr.net/npm/choices.js@9.0.1/public/assets/scripts/choices.min.js"></script>

        <!-- Sweet Alert css-->
        <link href="{$path}/libs/sweetalert2/sweetalert2.min.css" rel="stylesheet" type="text/css" />

        

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
                      <div class="col-lg-12">
                        <div class="card">
                          <div class="card-header">
                            <h4 class="card-title mb-0">Add, Edit &amp; Remove</h4>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <div class="listjs-table" id="customerList">
                              <div class="row g-4 mb-3">
                                <div class="col-sm-auto">
                                  <div>
                                    <button type="button" class="btn btn-success add-btn" data-bs-toggle="modal" id="create-btn" data-bs-target="#showModal">
                                      <i class="ri-add-line align-bottom me-1"></i> Add</button>
                                    <button class="btn btn-soft-danger" onClick="deleteMultiple()">
                                      <i class="ri-delete-bin-2-line"></i>
                                    </button>
                                  </div>
                                </div>
                                <div class="col-sm">
                                  <div class="d-flex justify-content-sm-end">
                                    <div class="search-box ms-2">
                                      <input type="text" class="form-control search" placeholder="Search..."/>
                                      <i class="ri-search-line search-icon"></i>
                                    </div>
                                  </div>
                                </div>
                              </div>

                              <div class="table-responsive table-card mt-3 mb-1">
                                <table class="table align-middle table-nowrap" id="customerTable">
                                  <thead class="table-light">
                                    <tr>
                                      <th scope="col" style="width: 50px;">
                                        <div class="form-check">
                                          <input class="form-check-input" type="checkbox" id="checkAll" value="option"/>
                                        </div>
                                      </th>
                                      <th class="sort" data-sort="customer_name">Customer</th>
                                      <th class="sort" data-sort="email">Email</th>
                                      <th class="sort" data-sort="phone">Phone</th>
                                      <th class="sort" data-sort="date">Joining Date</th>
                                      <th class="sort" data-sort="status">Delivery Status</th>
                                      <th class="sort" data-sort="action">Action</th>
                                    </tr>
                                  </thead>
                                  <tbody class="list form-check-all">
                                    <tr>
                                      <th scope="row">
                                        <div class="form-check">
                                          <input class="form-check-input" type="checkbox" name="chk_child" value="option1"/>
                                        </div>
                                      </th>
                                      <td class="id" style="display:none;">
                                        <a href="javascript:void(0);" class="fw-medium link-primary">#VZ2101</a>
                                      </td>
                                      <td class="customer_name">Mary Cousar</td>
                                      <td class="email">marycousar@velzon.com</td>
                                      <td class="phone">580-464-4694</td>
                                      <td class="date">06 Apr, 2021</td>
                                      <td class="status">
                                        <span class="badge badge-soft-success text-uppercase">Active</span>
                                      </td>
                                      <td>
                                        <div class="d-flex gap-2">
                                          <div class="edit">
                                            <button class="btn btn-sm btn-success edit-item-btn" data-bs-toggle="modal" data-bs-target="#showModal">Edit</button>
                                          </div>
                                          <div class="remove">
                                            <button class="btn btn-sm btn-danger remove-item-btn" data-bs-toggle="modal" data-bs-target="#deleteRecordModal">Remove</button>
                                          </div>
                                        </div>
                                      </td>
                                    </tr>
                                  </tbody>
                                </table>
                                <div class="noresult" style="display: none">
                                  <div class="text-center">
                                    <lord-icon src="https://cdn.lordicon.com/msoeawqm.json" trigger="loop" colors="primary:#121331,secondary:#08a88a" style="width:75px;height:75px"></lord-icon>
                                    <h5 class="mt-2">Sorry! No Result Found</h5>
                                    <p class="text-muted mb-0">We've searched more than 150+ Orders We did not find any orders for you search.</p>
                                  </div>
                                </div>
                              </div>

                              <div class="d-flex justify-content-end">
                                <div class="pagination-wrap hstack gap-2">
                                  <a class="page-item pagination-prev disabled" href="javascrpit:void(0)">
                                                    Previous
                                  </a>
                                  <ul class="pagination listjs-pagination mb-0"></ul>
                                  <a class="page-item pagination-next" href="javascrpit:void(0)">
                                                    Next
                                  </a>
                                </div>
                              </div>
                            </div>
                          </div>                          <!-- end card -->
                        </div>
                        <!-- end col -->
                      </div>
                      <!-- end col -->
                    </div>
                    <!-- end row -->

                    <div class="row">
                      <div class="col-xl-4">
                        <div class="card">
                          <div class="card-header">
                            <h4 class="card-title mb-0">Data Attributes + Custom</h4>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <p class="text-muted">Use data attributes and other custom attributes as keys</p>
                            <div id="users">
                              <div class="row mb-2">
                                <div class="col">
                                  <div>
                                    <input class="search form-control" placeholder="Search" />
                                  </div>
                                </div>
                                <div class="col-auto">
                                  <button class="btn btn-light sort" data-sort="name">
                                                    Sort by name
                                  </button>
                                </div>
                              </div>

                              <div data-simplebar="" style="height: 242px;" class="mx-n3">
                                <ul class="list list-group list-group-flush mb-0">
                                  <li class="list-group-item" data-id="1">
                                    <div class="d-flex">
                                      <div class="flex-grow-1">
                                        <h5 class="fs-13 mb-1">
                                          <a href="#" class="link name text-dark">Jonny Stromberg</a>
                                        </h5>
                                        <p class="born timestamp text-muted mb-0" data-timestamp="12345">1986</p>
                                      </div>
                                      <div class="flex-shrink-0">
                                        <div>
                                          <img class="image avatar-xs rounded-circle" alt="" src="{$themePath}/assets/images/users/avatar-1.jpg"/>
                                        </div>
                                      </div>
                                    </div>
                                  </li>
                                  <!-- end list item -->
                                  <li class="list-group-item" data-id="2">
                                    <div class="d-flex">
                                      <div class="flex-grow-1">
                                        <h5 class="fs-13 mb-1">
                                          <a href="#" class="link name text-dark">Jonas Arnklint</a>
                                        </h5>
                                        <p class="born timestamp text-muted mb-0" data-timestamp="23456">1985</p>
                                      </div>
                                      <div class="flex-shrink-0">
                                        <div>
                                          <img class="image avatar-xs rounded-circle" alt="" src="{$themePath}/assets/images/users/avatar-2.jpg"/>
                                        </div>
                                      </div>
                                    </div>
                                  </li>
                                  <!-- end list item -->
                                  <li class="list-group-item" data-id="3">
                                    <div class="d-flex">
                                      <div class="flex-grow-1">
                                        <h5 class="fs-13 mb-1">
                                          <a href="#" class="link name text-dark">Martina Elm</a>
                                        </h5>
                                        <p class="born timestamp text-muted mb-0" data-timestamp="34567">1986</p>
                                      </div>
                                      <div class="flex-shrink-0">
                                        <div>
                                          <img class="image avatar-xs rounded-circle" alt="" src="{$themePath}/assets/images/users/avatar-3.jpg"/>
                                        </div>
                                      </div>
                                    </div>
                                  </li>
                                  <!-- end list item -->
                                  <li class="list-group-item" data-id="4">
                                    <div class="d-flex">
                                      <div class="flex-grow-1">
                                        <h5 class="fs-13 mb-1">
                                          <a href="#" class="link name text-dark">Gustaf Lindqvist</a>
                                        </h5>
                                        <p class="born timestamp text-muted mb-0" data-timestamp="45678">1983</p>
                                      </div>
                                      <div class="flex-shrink-0">
                                        <div>
                                          <img class="image avatar-xs rounded-circle" alt="" src="{$themePath}/assets/images/users/avatar-4.jpg"/>
                                        </div>
                                      </div>
                                    </div>
                                  </li>
                                  <!-- end list item -->
                                </ul>
                                <!-- end ul list -->
                              </div>
                            </div>
                          </div>                          <!-- end card body -->
                        </div>
                        <!-- end card -->
                      </div>
                      <!-- end col -->

                      <div class="col-xl-4">
                        <div class="card">
                          <div class="card-header">
                            <h4 class="card-title mb-0">Existing List</h4>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <p class="text-muted">Basic Example with Existing List</p>
                            <div id="contact-existing-list">
                              <div class="row mb-2">
                                <div class="col">
                                  <div>
                                    <input class="search form-control" placeholder="Search" />
                                  </div>
                                </div>
                                <div class="col-auto">
                                  <button class="btn btn-light sort" data-sort="contact-name">
                                                    Sort by name
                                  </button>
                                </div>
                              </div>

                              <div data-simplebar="" style="height: 242px;" class="mx-n3">
                                <ul class="list list-group list-group-flush mb-0">
                                  <li class="list-group-item" data-id="01">
                                    <div class="d-flex align-items-start">
                                      <div class="flex-shrink-0 me-3">
                                        <div>
                                          <img class="image avatar-xs rounded-circle" alt="" src="{$themePath}/assets/images/users/avatar-1.jpg"/>
                                        </div>
                                      </div>

                                      <div class="flex-grow-1 overflow-hidden">
                                        <h5 class="contact-name fs-13 mb-1">
                                          <a href="#" class="link text-dark">Jonny Stromberg</a>
                                        </h5>
                                        <p class="contact-born text-muted mb-0">New updates for ABC Theme</p>
                                      </div>

                                      <div class="flex-shrink-0 ms-2">
                                        <div class="fs-11 text-muted">06 min</div>
                                      </div>
                                    </div>
                                  </li>
                                  <!-- end list item -->
                                  <li class="list-group-item" data-id="02">
                                    <div class="d-flex align-items-center">
                                      <div class="flex-shrink-0 me-3">
                                        <div>
                                          <img class="image avatar-xs rounded-circle" alt="" src="{$themePath}/assets/images/users/avatar-2.jpg"/>
                                        </div>
                                      </div>
                                      <div class="flex-grow-1 overflow-hidden">
                                        <h5 class="contact-name fs-13 mb-1">
                                          <a href="#" class="link text-dark">Jonas Arnklint</a>
                                        </h5>
                                        <p class="contact-born text-muted mb-0">Bug Report - abc theme</p>
                                      </div>
                                      <div class="flex-shrink-0 ms-2">
                                        <div class="fs-11 text-muted">12 min</div>
                                      </div>
                                    </div>
                                  </li>
                                  <!-- end list item -->
                                  <li class="list-group-item" data-id="03">
                                    <div class="d-flex align-items-center">
                                      <div class="flex-shrink-0 me-3">
                                        <div>
                                          <img class="image avatar-xs rounded-circle" alt="" src="{$themePath}/assets/images/users/avatar-3.jpg"/>
                                        </div>
                                      </div>
                                      <div class="flex-grow-1">
                                        <h5 class="contact-name fs-13 mb-1">
                                          <a href="#" class="link text-dark">Martina Elm</a>
                                        </h5>
                                        <p class="contact-born text-muted mb-0">Nice to meet you</p>
                                      </div>
                                      <div class="flex-shrink-0 ms-2">
                                        <div class="fs-11 text-muted">28 min</div>
                                      </div>
                                    </div>
                                  </li>
                                  <!-- end list item -->
                                  <li class="list-group-item" data-id="04">
                                    <div class="d-flex align-items-center">
                                      <div class="flex-shrink-0 me-3">
                                        <div>
                                          <img class="image avatar-xs rounded-circle" alt="" src="{$themePath}/assets/images/users/avatar-4.jpg"/>
                                        </div>
                                      </div>
                                      <div class="flex-grow-1">
                                        <h5 class="contact-name fs-13 mb-1">
                                          <a href="#" class="link text-dark">Gustaf Lindqvist</a>
                                        </h5>
                                        <p class="contact-born text-muted mb-0">I've finished it! See you so</p>
                                      </div>
                                      <div class="flex-shrink-0 ms-2">
                                        <div class="fs-11 text-muted">01 hrs</div>
                                      </div>
                                    </div>
                                  </li>
                                  <!-- end list item -->
                                </ul>
                                <!-- end ul list -->
                              </div>
                            </div>
                          </div>                          <!-- end card -->
                        </div>
                        <!-- end col -->
                      </div>
                      <!-- end col -->

                      <div class="col-xl-4">
                        <div class="card">
                          <div class="card-header">
                            <h4 class="card-title mb-0">Fuzzy Search</h4>
                          </div>                          <!-- end card header -->
                          <div class="card-body">
                            <p class="text-muted">Example of how to use the fuzzy search plugin</p>
                            <div id="fuzzysearch-list">
                              <input type="text" class="fuzzy-search form-control mb-2" placeholder="Search" />

                              <div data-simplebar="" style="height: 242px;">
                                <ul class="list mb-0">
                                  <li>
                                    <p class="name">Guybrush Threepwood</p>
                                  </li>
                                  <li>
                                    <p class="name">Elaine Marley</p>
                                  </li>
                                  <li>
                                    <p class="name">LeChuck</p>
                                  </li>
                                  <li>
                                    <p class="name">Stan</p>
                                  </li>
                                  <li>
                                    <p class="name">Voodoo Lady</p>
                                  </li>
                                  <li>
                                    <p class="name">Herman Toothrot</p>
                                  </li>
                                  <li>
                                    <p class="name">Meathook</p>
                                  </li>
                                  <li>
                                    <p class="name">Carla</p>
                                  </li>
                                  <li>
                                    <p class="name">Otis</p>
                                  </li>
                                  <li>
                                    <p class="name">Rapp Scallion</p>
                                  </li>
                                  <li>
                                    <p class="name">Rum Rogers Sr.</p>
                                  </li>
                                  <li>
                                    <p class="name">Men of Low Moral Fiber</p>
                                  </li>
                                  <li>
                                    <p class="name">Murray</p>
                                  </li>
                                  <li>
                                    <p class="name">Cannibals</p>
                                  </li>
                                </ul>
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
                      <div class="col-xl-4">
                        <div class="card">
                          <div class="card-header">
                            <h4 class="card-title mb-0">Pagination</h4>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <p class="text-muted">Example of how to use the pagination plugin</p>

                            <div class="listjs-table" id="pagination-list">
                              <div class="mb-2">
                                <input class="search form-control" placeholder="Search" />
                              </div>

                              <div class="mx-n3">
                                <ul class="list list-group list-group-flush mb-0">
                                  <li class="list-group-item">
                                    <div class="d-flex align-items-center pagi-list">
                                      <div class="flex-shrink-0 me-3">
                                        <div>
                                          <img class="image avatar-xs rounded-circle" alt="" src="{$themePath}/assets/images/users/avatar-1.jpg"/>
                                        </div>
                                      </div>

                                      <div class="flex-grow-1 overflow-hidden">
                                        <h5 class="fs-13 mb-1">
                                          <a href="#" class="link text-dark">Jonny Stromberg</a>
                                        </h5>
                                        <p class="born timestamp text-muted mb-0">Front end Developer</p>
                                      </div>

                                      <div class="flex-shrink-0 ms-2">
                                        <div>
                                          <button type="button" class="btn btn-sm btn-light">
                                            <i class="ri-mail-line align-bottom"></i> Message</button>
                                        </div>
                                      </div>
                                    </div>
                                  </li>
                                  <!-- end list item -->
                                  <li class="list-group-item">
                                    <div class="d-flex align-items-center pagi-list">
                                      <div class="flex-shrink-0 me-3">
                                        <div>
                                          <img class="image avatar-xs rounded-circle" alt="" src="{$themePath}/assets/images/users/avatar-2.jpg"/>
                                        </div>
                                      </div>
                                      <div class="flex-grow-1 overflow-hidden">
                                        <h5 class="fs-13 mb-1">
                                          <a href="#" class="link text-dark">Jonas Arnklint</a>
                                        </h5>
                                        <p class="born fs-12 timestamp text-muted mb-0">Backend Developer</p>
                                      </div>
                                      <div class="flex-shrink-0 ms-2">
                                        <div>
                                          <button type="button" class="btn btn-sm btn-light">
                                            <i class="ri-mail-line align-bottom"></i> Message</button>
                                        </div>
                                      </div>
                                    </div>
                                  </li>
                                  <!-- end list item -->
                                  <li class="list-group-item">
                                    <div class="d-flex align-items-center pagi-list">
                                      <div class="flex-shrink-0 me-3">
                                        <div>
                                          <img class="image avatar-xs rounded-circle" alt="" src="{$themePath}/assets/images/users/avatar-3.jpg"/>
                                        </div>
                                      </div>
                                      <div class="flex-grow-1">
                                        <h5 class="fs-13 mb-1">
                                          <a href="#" class="link text-dark">Martina Elm</a>
                                        </h5>
                                        <p class="born fs-12 timestamp text-muted mb-0">UI/UX Designer</p>
                                      </div>
                                      <div class="flex-shrink-0 ms-2">
                                        <div>
                                          <button type="button" class="btn btn-sm btn-light">
                                            <i class="ri-mail-line align-bottom"></i> Message</button>
                                        </div>
                                      </div>
                                    </div>
                                  </li>
                                  <!-- end list item -->
                                  <li class="list-group-item">
                                    <div class="d-flex align-items-center pagi-list">
                                      <div class="flex-shrink-0 me-3">
                                        <div>
                                          <img class="image avatar-xs rounded-circle" alt="" src="{$themePath}/assets/images/users/avatar-4.jpg"/>
                                        </div>
                                      </div>
                                      <div class="flex-grow-1">
                                        <h5 class="fs-13 mb-1">
                                          <a href="#" class="link text-dark">Gustaf Lindqvist</a>
                                        </h5>
                                        <p class="born fs-12 timestamp text-muted mb-0">Full Stack Developer</p>
                                      </div>
                                      <div class="flex-shrink-0 ms-2">
                                        <div>
                                          <button type="button" class="btn btn-sm btn-light">
                                            <i class="ri-mail-line align-bottom"></i> Message</button>
                                        </div>
                                      </div>
                                    </div>
                                  </li>
                                  <!-- end list item -->
                                  <li class="list-group-item">
                                    <div class="d-flex align-items-center pagi-list">
                                      <div class="flex-shrink-0 me-3">
                                        <div>
                                          <img class="image avatar-xs rounded-circle" alt="" src="{$themePath}/assets/images/users/avatar-1.jpg"/>
                                        </div>
                                      </div>

                                      <div class="flex-grow-1 overflow-hidden">
                                        <h5 class="fs-13 mb-1">
                                          <a href="#" class="link text-dark">Jonny Stromberg</a>
                                        </h5>
                                        <p class="born timestamp text-muted mb-0">Front end Developer</p>
                                      </div>

                                      <div class="flex-shrink-0 ms-2">
                                        <div>
                                          <button type="button" class="btn btn-sm btn-light">
                                            <i class="ri-mail-line align-bottom"></i> Message</button>
                                        </div>
                                      </div>
                                    </div>
                                  </li>
                                  <!-- end list item -->
                                  <li class="list-group-item">
                                    <div class="d-flex align-items-center pagi-list">
                                      <div class="flex-shrink-0 me-3">
                                        <div>
                                          <img class="image avatar-xs rounded-circle" alt="" src="{$themePath}/assets/images/users/avatar-2.jpg"/>
                                        </div>
                                      </div>
                                      <div class="flex-grow-1 overflow-hidden">
                                        <h5 class="fs-13 mb-1">
                                          <a href="#" class="link text-dark">Jonas Arnklint</a>
                                        </h5>
                                        <p class="born fs-12 timestamp text-muted mb-0">Backend Developer</p>
                                      </div>
                                      <div class="flex-shrink-0 ms-2">
                                        <div>
                                          <button type="button" class="btn btn-sm btn-light">
                                            <i class="ri-mail-line align-bottom"></i> Message</button>
                                        </div>
                                      </div>
                                    </div>
                                  </li>
                                  <!-- end list item -->
                                </ul>
                                <!-- end ul list -->

                                <div class="d-flex justify-content-center">
                                  <div class="pagination-wrap hstack gap-2">
                                    <a class="page-item pagination-prev disabled" href="javascrpit:void(0)">
                                                        Previous
                                    </a>
                                    <ul class="pagination listjs-pagination mb-0"></ul>
                                    <a class="page-item pagination-next" href="javascrpit:void(0)">
                                                        Next
                                    </a>
                                  </div>
                                </div>

                              </div>
                            </div>
                          </div>                          <!-- end card -->
                        </div>
                        <!-- end col -->
                      </div>
                      <!-- end col -->
                    </div>
                    <!-- end row -->

                    <div class="modal fade" id="showModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                          <div class="modal-header bg-light p-3">
                            <h5 class="modal-title" id="exampleModalLabel"></h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="close-modal"></button>
                          </div>
                          <form class="tablelist-form" autocomplete="off">
                            <div class="modal-body">
                              <div class="mb-3" id="modal-id" style="display: none;">
                                <label for="id-field" class="form-label">ID</label>
                                <input type="text" id="id-field" class="form-control" placeholder="ID" readonly="" />
                              </div>

                              <div class="mb-3">
                                <label for="customername-field" class="form-label">Customer Name</label>
                                <input type="text" id="customername-field" class="form-control" placeholder="Enter Name" required="" />
                                <div class="invalid-feedback">Please enter a customer name.</div>
                              </div>

                              <div class="mb-3">
                                <label for="email-field" class="form-label">Email</label>
                                <input type="email" id="email-field" class="form-control" placeholder="Enter Email" required="" />
                                <div class="invalid-feedback">Please enter an email.</div>
                              </div>

                              <div class="mb-3">
                                <label for="phone-field" class="form-label">Phone</label>
                                <input type="text" id="phone-field" class="form-control" placeholder="Enter Phone no." required="" />
                                <div class="invalid-feedback">Please enter a phone.</div>
                              </div>

                              <div class="mb-3">
                                <label for="date-field" class="form-label">Joining Date</label>
                                <input type="text" id="date-field" class="form-control" placeholder="Select Date" required="" />
                                <div class="invalid-feedback">Please select a date.</div>
                              </div>

                              <div>
                                <label for="status-field" class="form-label">Status</label>
                                <select class="form-control" data-trigger="" name="status-field" id="status-field" required="">
                                  <option value="">Status</option>
                                  <option value="Active">Active</option>
                                  <option value="Block">Block</option>
                                </select>
                              </div>
                            </div>
                            <div class="modal-footer">
                              <div class="hstack gap-2 justify-content-end">
                                <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-success" id="add-btn">Add Customer</button>
                                <!-- <button type="button" class="btn btn-success" id="edit-btn">Update</button> -->
                              </div>
                            </div>
                          </form>
                        </div>
                      </div>
                    </div>

                    <!-- Modal -->
                    <div class="modal fade zoomIn" id="deleteRecordModal" tabindex="-1" aria-hidden="true">
                      <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="btn-close"></button>
                          </div>
                          <div class="modal-body">
                            <div class="mt-2 text-center">
                              <lord-icon src="https://cdn.lordicon.com/gsqxdxog.json" trigger="loop" colors="primary:#f7b84b,secondary:#f06548" style="width:100px;height:100px"></lord-icon>
                              <div class="mt-4 pt-2 fs-15 mx-4 mx-sm-5">
                                <h4>Are you Sure ?</h4>
                                <p class="text-muted mx-4 mb-0">Are you Sure You want to Remove this Record ?</p>
                              </div>
                            </div>
                            <div class="d-flex gap-2 justify-content-center mt-4 mb-2">
                              <button type="button" class="btn w-sm btn-light" data-bs-dismiss="modal">Close</button>
                              <button type="button" class="btn w-sm btn-danger " id="delete-record">Yes, Delete It!</button>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!--end modal -->

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
        <script src="{$path}/libs/list.js/list.min.js"></script>
        <script src="{$path}/libs/list.pagination.js/list.pagination.min.js"></script>

        <!-- listjs init -->
        <script src="{$themePath}/assets/js/pages/listjs.init.js"></script>

        <!-- Sweet Alerts js -->
        <script src="{$path}/libs/sweetalert2/sweetalert2.min.js"></script>



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
