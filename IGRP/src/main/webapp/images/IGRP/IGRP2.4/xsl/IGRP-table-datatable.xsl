<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/>

  <xsl:template match="/">
    <html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">
      <head>

        <!-- page includes css -->
        <!--datatable css-->
        <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css" />
        <!--datatable responsive css-->
        <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.9/css/responsive.bootstrap.min.css" />

        <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.2.2/css/buttons.dataTables.min.css"/>


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
                    <div class="alert alert-danger" role="alert">
                        This is <strong>Datatable</strong> page in wihch we have used <b>jQuery</b> with cnd link!
                    </div>

                    <div class="row">
                      <div class="col-lg-12">
                        <div class="card">
                          <div class="card-header">
                            <h5 class="card-title mb-0">Basic Datatables</h5>
                          </div>
                          <div class="card-body">
                            <table id="example" class="table table-bordered dt-responsive nowrap table-striped align-middle" style="width:100%">
                              <thead>
                                <tr>
                                  <th scope="col" style="width: 10px;">
                                    <div class="form-check">
                                      <input class="form-check-input fs-15" type="checkbox" id="checkAll" value="option"/>
                                    </div>
                                  </th>
                                  <th data-ordering="false">SR No.</th>
                                  <th data-ordering="false">ID</th>
                                  <th data-ordering="false">Purchase ID</th>
                                  <th data-ordering="false">Title</th>
                                  <th data-ordering="false">User</th>
                                  <th>Assigned To</th>
                                  <th>Created By</th>
                                  <th>Create Date</th>
                                  <th>Status</th>
                                  <th>Priority</th>
                                  <th>Action</th>
                                </tr>
                              </thead>
                              <tbody>
                                <tr>
                                  <th scope="row">
                                    <div class="form-check">
                                      <input class="form-check-input fs-15" type="checkbox" name="checkAll" value="option1"/>
                                    </div>
                                  </th>
                                  <td>01</td>
                                  <td>VLZ-452</td>
                                  <td>VLZ1400087402</td>
                                  <td>
                                    <a href="#!">Post launch reminder/ post list</a>
                                  </td>
                                  <td>Joseph Parker</td>
                                  <td>Alexis Clarke</td>
                                  <td>Joseph Parker</td>
                                  <td>03 Oct, 2021</td>
                                  <td>
                                    <span class="badge badge-soft-info">Re-open</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-danger">High</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <th scope="row">
                                    <div class="form-check">
                                      <input class="form-check-input fs-15" type="checkbox" name="checkAll" value="option1"/>
                                    </div>
                                  </th>
                                  <td>02</td>
                                  <td>VLZ-453</td>
                                  <td>VLZ1400087425</td>
                                  <td>
                                    <a href="#!">Additional Calendar</a>
                                  </td>
                                  <td>Diana Kohler</td>
                                  <td>Admin</td>
                                  <td>Mary Rucker</td>
                                  <td>05 Oct, 2021</td>
                                  <td>
                                    <span class="badge badge-soft-secondary">On-Hold</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-info">Medium</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <th scope="row">
                                    <div class="form-check">
                                      <input class="form-check-input fs-15" type="checkbox" name="checkAll" value="option1"/>
                                    </div>
                                  </th>
                                  <td>03</td>
                                  <td>VLZ-454</td>
                                  <td>VLZ1400087438</td>
                                  <td>
                                    <a href="#!">Make a creating an account profile</a>
                                  </td>
                                  <td>Tonya Noble</td>
                                  <td>Admin</td>
                                  <td>Tonya Noble</td>
                                  <td>27 April, 2022</td>
                                  <td>
                                    <span class="badge badge-soft-danger">Closed</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-success">Low</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <th scope="row">
                                    <div class="form-check">
                                      <input class="form-check-input fs-15" type="checkbox" name="checkAll" value="option1"/>
                                    </div>
                                  </th>
                                  <td>04</td>
                                  <td>VLZ-455</td>
                                  <td>VLZ1400087748</td>
                                  <td>
                                    <a href="#!">Apologize for shopping Error!</a>
                                  </td>
                                  <td>Joseph Parker</td>
                                  <td>Alexis Clarke</td>
                                  <td>Joseph Parker</td>
                                  <td>14 June, 2021</td>
                                  <td>
                                    <span class="badge badge-soft-warning">Inprogress</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-info">Medium</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <th scope="row">
                                    <div class="form-check">
                                      <input class="form-check-input fs-15" type="checkbox" name="checkAll" value="option1"/>
                                    </div>
                                  </th>
                                  <td>05</td>
                                  <td>VLZ-456</td>
                                  <td>VLZ1400087547</td>
                                  <td>
                                    <a href="#!">Support for theme</a>
                                  </td>
                                  <td>Donald Palmer</td>
                                  <td>Admin</td>
                                  <td>Donald Palmer</td>
                                  <td>25 June, 2021</td>
                                  <td>
                                    <span class="badge badge-soft-danger">Closed</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-success">Low</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <th scope="row">
                                    <div class="form-check">
                                      <input class="form-check-input fs-15" type="checkbox" name="checkAll" value="option1"/>
                                    </div>
                                  </th>
                                  <td>06</td>
                                  <td>VLZ-457</td>
                                  <td>VLZ1400087245</td>
                                  <td>
                                    <a href="#!">Benner design for FB &amp; Twitter</a>
                                  </td>
                                  <td>Mary Rucker</td>
                                  <td>Jennifer Carter</td>
                                  <td>Mary Rucker</td>
                                  <td>14 Aug, 2021</td>
                                  <td>
                                    <span class="badge badge-soft-warning">Inprogress</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-info">Medium</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <th scope="row">
                                    <div class="form-check">
                                      <input class="form-check-input fs-15" type="checkbox" name="checkAll" value="option1"/>
                                    </div>
                                  </th>
                                  <td>07</td>
                                  <td>VLZ-458</td>
                                  <td>VLZ1400087785</td>
                                  <td>
                                    <a href="#!">Change email option process</a>
                                  </td>
                                  <td>James Morris</td>
                                  <td>Admin</td>
                                  <td>James Morris</td>
                                  <td>12 March, 2022</td>
                                  <td>
                                    <span class="badge badge-soft-primary">Open</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-danger">High</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <th scope="row">
                                    <div class="form-check">
                                      <input class="form-check-input fs-15" type="checkbox" name="checkAll" value="option1"/>
                                    </div>
                                  </th>
                                  <td>08</td>
                                  <td>VLZ-460</td>
                                  <td>VLZ1400087745</td>
                                  <td>
                                    <a href="#!">Support for theme</a>
                                  </td>
                                  <td>Nathan Cole</td>
                                  <td>Nancy Martino</td>
                                  <td>Nathan Cole</td>
                                  <td>28 Feb, 2022</td>
                                  <td>
                                    <span class="badge badge-soft-secondary">On-Hold</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-success">Low</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <th scope="row">
                                    <div class="form-check">
                                      <input class="form-check-input fs-15" type="checkbox" name="checkAll" value="option1"/>
                                    </div>
                                  </th>
                                  <td>09</td>
                                  <td>VLZ-461</td>
                                  <td>VLZ1400087179</td>
                                  <td>
                                    <a href="#!">Form submit issue</a>
                                  </td>
                                  <td>Grace Coles</td>
                                  <td>Admin</td>
                                  <td>Grace Coles</td>
                                  <td>07 Jan, 2022</td>
                                  <td>
                                    <span class="badge badge-soft-success">New</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-danger">High</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <th scope="row">
                                    <div class="form-check">
                                      <input class="form-check-input fs-15" type="checkbox" name="checkAll" value="option1"/>
                                    </div>
                                  </th>
                                  <td>10</td>
                                  <td>VLZ-462</td>
                                  <td>VLZ140008856</td>
                                  <td>
                                    <a href="#!">Edit customer testimonial</a>
                                  </td>
                                  <td>Freda</td>
                                  <td>Alexis Clarke</td>
                                  <td>Freda</td>
                                  <td>16 Aug, 2021</td>
                                  <td>
                                    <span class="badge badge-soft-danger">Closed</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-info">Medium</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <th scope="row">
                                    <div class="form-check">
                                      <input class="form-check-input fs-15" type="checkbox" name="checkAll" value="option1"/>
                                    </div>
                                  </th>
                                  <td>11</td>
                                  <td>VLZ-463</td>
                                  <td>VLZ1400078031</td>
                                  <td>
                                    <a href="#!">Ca i have an e-copy invoice</a>
                                  </td>
                                  <td>Williams</td>
                                  <td>Admin</td>
                                  <td>Williams</td>
                                  <td>24 Feb, 2022</td>
                                  <td>
                                    <span class="badge badge-soft-primary">Open</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-success">Low</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <th scope="row">
                                    <div class="form-check">
                                      <input class="form-check-input fs-15" type="checkbox" name="checkAll" value="option1"/>
                                    </div>
                                  </th>
                                  <td>12</td>
                                  <td>VLZ-464</td>
                                  <td>VLZ1400087416</td>
                                  <td>
                                    <a href="#!">Brand logo design</a>
                                  </td>
                                  <td>Richard V.</td>
                                  <td>Admin</td>
                                  <td>Richard V.</td>
                                  <td>16 March, 2021</td>
                                  <td>
                                    <span class="badge badge-soft-warning">Inprogress</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-danger">High</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <th scope="row">
                                    <div class="form-check">
                                      <input class="form-check-input fs-15" type="checkbox" name="checkAll" value="option1"/>
                                    </div>
                                  </th>
                                  <td>13</td>
                                  <td>VLZ-466</td>
                                  <td>VLZ1400089015</td>
                                  <td>
                                    <a href="#!">Issue with finding information about order ?</a>
                                  </td>
                                  <td>Olive Gunther</td>
                                  <td>Alexis Clarke</td>
                                  <td>Schaefer</td>
                                  <td>32 March, 2022</td>
                                  <td>
                                    <span class="badge badge-soft-success">New</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-danger">High</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <th scope="row">
                                    <div class="form-check">
                                      <input class="form-check-input fs-15" type="checkbox" name="checkAll" value="option1"/>
                                    </div>
                                  </th>
                                  <td>14</td>
                                  <td>VLZ-467</td>
                                  <td>VLZ1400090324</td>
                                  <td>
                                    <a href="#!">Make a creating an account profile</a>
                                  </td>
                                  <td>Edwin</td>
                                  <td>Admin</td>
                                  <td>Edwin</td>
                                  <td>05 April, 2022</td>
                                  <td>
                                    <span class="badge badge-soft-warning">Inprogress</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-success">Low</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                              </tbody>
                            </table>
                          </div>
                        </div>
                      </div>                      <!--end col-->
                    </div>                    <!--end row-->

                    <div class="row">
                      <div class="col-lg-12">
                        <div class="card">
                          <div class="card-header">
                            <h5 class="card-title mb-0">Scroll - Vertical</h5>
                          </div>
                          <div class="card-body">
                            <table id="scroll-vertical" class="table table-bordered dt-responsive nowrap align-middle mdl-data-table" style="width:100%">
                              <thead>
                                <tr>
                                  <th>ID</th>
                                  <th>Project</th>
                                  <th>Task</th>
                                  <th>Client Name</th>
                                  <th>Assigned To</th>
                                  <th>Due Date</th>
                                  <th>Status</th>
                                  <th>Priority</th>
                                </tr>
                              </thead>
                              <tbody>
                                <tr>
                                  <td>VLZ-452</td>
                                  <td>Symox v1.0.0</td>
                                  <td>
                                    <a href="#!">Add Dynamic Contact List</a>
                                  </td>
                                  <td>RH Nichols</td>
                                  <td>
                                    <div class="avatar-group">
                                      <a href="javascript: void(0);" class="avatar-group-item" data-img="avatar-3.jpg" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="Username">
                                        <img src="{$themePath}/assets/images/users/avatar-3.jpg" alt="" class="rounded-circle avatar-xxs"/>
                                      </a>
                                    </div>
                                  </td>
                                  <td>03 Oct, 2021</td>
                                  <td>
                                    <span class="badge badge-soft-info">Re-open</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-danger">High</span>
                                  </td>
                                </tr>
                                <tr>
                                  <td>VLZ-453</td>
                                  <td>Doot - Chat App Template</td>
                                  <td>
                                    <a href="#!">Additional Calendar</a>
                                  </td>
                                  <td>Diana Kohler</td>
                                  <td>
                                    <div class="avatar-group">
                                      <a href="javascript: void(0);" class="avatar-group-item" data-img="avatar-4.jpg" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="Username">
                                        <img src="{$themePath}/assets/images/users/avatar-4.jpg" alt="" class="rounded-circle avatar-xxs"/>
                                      </a>

                                      <a href="javascript: void(0);" class="avatar-group-item" data-img="avatar-5.jpg" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="Username">
                                        <img src="{$themePath}/assets/images/users/avatar-5.jpg" alt="" class="rounded-circle avatar-xxs"/>
                                      </a>
                                    </div>
                                  </td>
                                  <td>05 Oct, 2021</td>
                                  <td>
                                    <span class="badge badge-soft-secondary">On-Hold</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-info">Medium</span>
                                  </td>
                                </tr>
                                <tr>
                                  <td>VLZ-454</td>
                                  <td>Qexal - Landing Page</td>
                                  <td>
                                    <a href="#!">Make a creating an account profile</a>
                                  </td>
                                  <td>David Nichols</td>
                                  <td>
                                    <div class="avatar-group">
                                      <a href="javascript: void(0);" class="avatar-group-item" data-img="avatar-6.jpg" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="Username">
                                        <img src="{$themePath}/assets/images/users/avatar-6.jpg" alt="" class="rounded-circle avatar-xxs"/>
                                      </a>

                                      <a href="javascript: void(0);" class="avatar-group-item" data-img="avatar-7.jpg" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="Username">
                                        <img src="{$themePath}/assets/images/users/avatar-7.jpg" alt="" class="rounded-circle avatar-xxs"/>
                                      </a>

                                      <a href="javascript: void(0);" class="avatar-group-item" data-img="avatar-8.jpg" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="Username">
                                        <img src="{$themePath}/assets/images/users/avatar-8.jpg" alt="" class="rounded-circle avatar-xxs"/>
                                      </a>
                                    </div>
                                  </td>
                                  <td>27 April, 2022</td>
                                  <td>
                                    <span class="badge badge-soft-danger">Closed</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-success">Low</span>
                                  </td>
                                </tr>
                                <tr>
                                  <td>VLZ-455</td>
                                  <td>Dorsin - Landing Page</td>
                                  <td>
                                    <a href="#!">Apologize for shopping Error!</a>
                                  </td>
                                  <td>Tonya Noble</td>
                                  <td>
                                    <div class="avatar-group">
                                      <a href="javascript: void(0);" class="avatar-group-item" data-img="avatar-6.jpg" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="Username">
                                        <img src="{$themePath}/assets/images/users/avatar-6.jpg" alt="" class="rounded-circle avatar-xxs"/>
                                      </a>

                                      <a href="javascript: void(0);" class="avatar-group-item" data-img="avatar-7.jpg" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="Username">
                                        <img src="{$themePath}/assets/images/users/avatar-7.jpg" alt="" class="rounded-circle avatar-xxs"/>
                                      </a>
                                    </div>
                                  </td>
                                  <td>14 June, 2021</td>
                                  <td>
                                    <span class="badge badge-soft-warning">Inprogress</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-info">Medium</span>
                                  </td>
                                </tr>
                                <tr>
                                  <td>VLZ-456</td>
                                  <td>Minimal - v2.1.0</td>
                                  <td>
                                    <a href="#!">Support for theme</a>
                                  </td>
                                  <td>Donald Palmer</td>
                                  <td>
                                    <div class="avatar-group">
                                      <a href="javascript: void(0);" class="avatar-group-item" data-img="avatar-2.jpg" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="Username">
                                        <img src="{$themePath}/assets/images/users/avatar-2.jpg" alt="" class="rounded-circle avatar-xxs"/>
                                      </a>
                                    </div>
                                  </td>
                                  <td>25 June, 2021</td>
                                  <td>
                                    <span class="badge badge-soft-danger">Closed</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-success">Low</span>
                                  </td>
                                </tr>
                                <tr>
                                  <td>VLZ-457</td>
                                  <td>Dason - v1.0.0</td>
                                  <td>
                                    <a href="#!">Benner design for FB &amp; Twitter</a>
                                  </td>
                                  <td>Jennifer Carter</td>
                                  <td>
                                    <div class="avatar-group">
                                      <a href="javascript: void(0);" class="avatar-group-item" data-img="avatar-5.jpg" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="Username">
                                        <img src="{$themePath}/assets/images/users/avatar-5.jpg" alt="" class="rounded-circle avatar-xxs"/>
                                      </a>

                                      <a href="javascript: void(0);" class="avatar-group-item" data-img="avatar-6.jpg" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="Username">
                                        <img src="{$themePath}/assets/images/users/avatar-6.jpg" alt="" class="rounded-circle avatar-xxs"/>
                                      </a>

                                      <a href="javascript: void(0);" class="avatar-group-item" data-img="avatar-7.jpg" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="Username">
                                        <img src="{$themePath}/assets/images/users/avatar-7.jpg" alt="" class="rounded-circle avatar-xxs"/>
                                      </a>

                                      <a href="javascript: void(0);" class="avatar-group-item" data-img="avatar-8.jpg" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="Username">
                                        <img src="{$themePath}/assets/images/users/avatar-8.jpg" alt="" class="rounded-circle avatar-xxs"/>
                                      </a>
                                    </div>
                                  </td>
                                  <td>14 Aug, 2021</td>
                                  <td>
                                    <span class="badge badge-soft-warning">Inprogress</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-info">Medium</span>
                                  </td>
                                </tr>
                                <tr>
                                  <td>VLZ-458</td>
                                  <td>Velzon v1.6.0</td>
                                  <td>
                                    <a href="#!">Add datatables</a>
                                  </td>
                                  <td>James Morris</td>
                                  <td>
                                    <div class="avatar-group">
                                      <a href="javascript: void(0);" class="avatar-group-item" data-img="avatar-4.jpg" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="Username">
                                        <img src="{$themePath}/assets/images/users/avatar-4.jpg" alt="" class="rounded-circle avatar-xxs"/>
                                      </a>

                                      <a href="javascript: void(0);" class="avatar-group-item" data-img="avatar-5.jpg" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="Username">
                                        <img src="{$themePath}/assets/images/users/avatar-5.jpg" alt="" class="rounded-circle avatar-xxs"/>
                                      </a>
                                    </div>
                                  </td>
                                  <td>12 March, 2022</td>
                                  <td>
                                    <span class="badge badge-soft-primary">Open</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-danger">High</span>
                                  </td>
                                </tr>
                                <tr>
                                  <td>VLZ-460</td>
                                  <td>Skote v2.0.0</td>
                                  <td>
                                    <a href="#!">Support for theme</a>
                                  </td>
                                  <td>Nancy Martino</td>
                                  <td>
                                    <div class="avatar-group">
                                      <a href="javascript: void(0);" class="avatar-group-item" data-img="avatar-3.jpg" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="Username">
                                        <img src="{$themePath}/assets/images/users/avatar-3.jpg" alt="" class="rounded-circle avatar-xxs"/>
                                      </a>

                                      <a href="javascript: void(0);" class="avatar-group-item" data-img="avatar-10.jpg" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="Username">
                                        <img src="{$themePath}/assets/images/users/avatar-10.jpg" alt="" class="rounded-circle avatar-xxs"/>
                                      </a>

                                      <a href="javascript: void(0);" class="avatar-group-item" data-img="avatar-9.jpg" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="Username">
                                        <img src="{$themePath}/assets/images/users/avatar-9.jpg" alt="" class="rounded-circle avatar-xxs"/>
                                      </a>
                                    </div>
                                  </td>
                                  <td>28 Feb, 2022</td>
                                  <td>
                                    <span class="badge badge-soft-secondary">On-Hold</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-success">Low</span>
                                  </td>
                                </tr>
                                <tr>
                                  <td>VLZ-461</td>
                                  <td>Velzon v1.0.0</td>
                                  <td>
                                    <a href="#!">Form submit issue</a>
                                  </td>
                                  <td>Grace Coles</td>
                                  <td>
                                    <div class="avatar-group">
                                      <a href="javascript: void(0);" class="avatar-group-item" data-img="avatar-5.jpg" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="Username">
                                        <img src="{$themePath}/assets/images/users/avatar-5.jpg" alt="" class="rounded-circle avatar-xxs"/>
                                      </a>

                                      <a href="javascript: void(0);" class="avatar-group-item" data-img="avatar-9.jpg" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="Username">
                                        <img src="{$themePath}/assets/images/users/avatar-9.jpg" alt="" class="rounded-circle avatar-xxs"/>
                                      </a>

                                      <a href="javascript: void(0);" class="avatar-group-item" data-img="avatar-10.jpg" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="Username">
                                        <img src="{$themePath}/assets/images/users/avatar-10.jpg" alt="" class="rounded-circle avatar-xxs"/>
                                      </a>
                                    </div>
                                  </td>
                                  <td>07 Jan, 2022</td>
                                  <td>
                                    <span class="badge badge-soft-success">New</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-danger">High</span>
                                  </td>
                                </tr>
                                <tr>
                                  <td>VLZ-462</td>
                                  <td>Minimal - v2.2.0</td>
                                  <td>
                                    <a href="#!">Edit customer testimonial</a>
                                  </td>
                                  <td>Freda</td>
                                  <td>
                                    <div class="avatar-group">
                                      <a href="javascript: void(0);" class="avatar-group-item" data-img="avatar-2.jpg" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="Username">
                                        <img src="{$themePath}/assets/images/users/avatar-2.jpg" alt="" class="rounded-circle avatar-xxs"/>
                                      </a>
                                    </div>
                                  </td>
                                  <td>16 Aug, 2021</td>
                                  <td>
                                    <span class="badge badge-soft-danger">Closed</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-info">Medium</span>
                                  </td>
                                </tr>
                                <tr>
                                  <td>VLZ-454</td>
                                  <td>Qexal - Landing Page</td>
                                  <td>
                                    <a href="#!">Make a creating an account profile</a>
                                  </td>
                                  <td>David Nichols</td>
                                  <td>
                                    <div class="avatar-group">
                                      <a href="javascript: void(0);" class="avatar-group-item" data-img="avatar-6.jpg" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="Username">
                                        <img src="{$themePath}/assets/images/users/avatar-6.jpg" alt="" class="rounded-circle avatar-xxs"/>
                                      </a>

                                      <a href="javascript: void(0);" class="avatar-group-item" data-img="avatar-7.jpg" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="Username">
                                        <img src="{$themePath}/assets/images/users/avatar-7.jpg" alt="" class="rounded-circle avatar-xxs"/>
                                      </a>

                                      <a href="javascript: void(0);" class="avatar-group-item" data-img="avatar-8.jpg" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="Username">
                                        <img src="{$themePath}/assets/images/users/avatar-8.jpg" alt="" class="rounded-circle avatar-xxs"/>
                                      </a>
                                    </div>
                                  </td>
                                  <td>27 April, 2022</td>
                                  <td>
                                    <span class="badge badge-soft-danger">Closed</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-success">Low</span>
                                  </td>
                                </tr>
                                <tr>
                                  <td>VLZ-455</td>
                                  <td>Dorsin - Landing Page</td>
                                  <td>
                                    <a href="#!">Apologize for shopping Error!</a>
                                  </td>
                                  <td>Tonya Noble</td>
                                  <td>
                                    <div class="avatar-group">
                                      <a href="javascript: void(0);" class="avatar-group-item" data-img="avatar-6.jpg" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="Username">
                                        <img src="{$themePath}/assets/images/users/avatar-6.jpg" alt="" class="rounded-circle avatar-xxs"/>
                                      </a>

                                      <a href="javascript: void(0);" class="avatar-group-item" data-img="avatar-7.jpg" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="Username">
                                        <img src="{$themePath}/assets/images/users/avatar-7.jpg" alt="" class="rounded-circle avatar-xxs"/>
                                      </a>
                                    </div>
                                  </td>
                                  <td>14 June, 2021</td>
                                  <td>
                                    <span class="badge badge-soft-warning">Inprogress</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-info">Medium</span>
                                  </td>
                                </tr>
                                <tr>
                                  <td>VLZ-456</td>
                                  <td>Minimal - v2.1.0</td>
                                  <td>
                                    <a href="#!">Support for theme</a>
                                  </td>
                                  <td>Donald Palmer</td>
                                  <td>
                                    <div class="avatar-group">
                                      <a href="javascript: void(0);" class="avatar-group-item" data-img="avatar-2.jpg" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="Username">
                                        <img src="{$themePath}/assets/images/users/avatar-2.jpg" alt="" class="rounded-circle avatar-xxs"/>
                                      </a>
                                    </div>
                                  </td>
                                  <td>25 June, 2021</td>
                                  <td>
                                    <span class="badge badge-soft-danger">Closed</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-success">Low</span>
                                  </td>
                                </tr>
                                <tr>
                                  <td>VLZ-457</td>
                                  <td>Dason - v1.0.0</td>
                                  <td>
                                    <a href="#!">Benner design for FB &amp; Twitter</a>
                                  </td>
                                  <td>Jennifer Carter</td>
                                  <td>
                                    <div class="avatar-group">
                                      <a href="javascript: void(0);" class="avatar-group-item" data-img="avatar-5.jpg" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="Username">
                                        <img src="{$themePath}/assets/images/users/avatar-5.jpg" alt="" class="rounded-circle avatar-xxs"/>
                                      </a>

                                      <a href="javascript: void(0);" class="avatar-group-item" data-img="avatar-6.jpg" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="Username">
                                        <img src="{$themePath}/assets/images/users/avatar-6.jpg" alt="" class="rounded-circle avatar-xxs"/>
                                      </a>

                                      <a href="javascript: void(0);" class="avatar-group-item" data-img="avatar-7.jpg" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="Username">
                                        <img src="{$themePath}/assets/images/users/avatar-7.jpg" alt="" class="rounded-circle avatar-xxs"/>
                                      </a>

                                      <a href="javascript: void(0);" class="avatar-group-item" data-img="avatar-8.jpg" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="Username">
                                        <img src="{$themePath}/assets/images/users/avatar-8.jpg" alt="" class="rounded-circle avatar-xxs"/>
                                      </a>
                                    </div>
                                  </td>
                                  <td>14 Aug, 2021</td>
                                  <td>
                                    <span class="badge badge-soft-warning">Inprogress</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-info">Medium</span>
                                  </td>
                                </tr>
                              </tbody>
                            </table>
                          </div>
                        </div>
                      </div>                      <!--end col-->
                    </div>                    <!--end row-->

                    <div class="row">
                      <div class="col-lg-12">
                        <div class="card">
                          <div class="card-header">
                            <h5 class="card-title mb-0">Scroll - Horizontal</h5>
                          </div>
                          <div class="card-body">
                            <table id="scroll-horizontal" class="table nowrap align-middle" style="width:100%">
                              <thead>
                                <tr>
                                  <th scope="col" style="width: 10px;">
                                    <div class="form-check">
                                      <input class="form-check-input fs-15" type="checkbox" id="checkAll" value="option"/>
                                    </div>
                                  </th>
                                  <th>SR No.</th>
                                  <th>ID</th>
                                  <th>Purchase ID</th>
                                  <th>Title</th>
                                  <th>User</th>
                                  <th>Assigned To</th>
                                  <th>Created By</th>
                                  <th>Create Date</th>
                                  <th>Status</th>
                                  <th>Priority</th>
                                  <th>Action</th>
                                </tr>
                              </thead>
                              <tbody>
                                <tr>
                                  <th scope="row">
                                    <div class="form-check">
                                      <input class="form-check-input fs-15" type="checkbox" name="checkAll" value="option1"/>
                                    </div>
                                  </th>
                                  <td>01</td>
                                  <td>VLZ-452</td>
                                  <td>VLZ1400087402</td>
                                  <td>
                                    <a href="#!">Post launch reminder/ post list</a>
                                  </td>
                                  <td>Joseph Parker</td>
                                  <td>Alexis Clarke</td>
                                  <td>Joseph Parker</td>
                                  <td>03 Oct, 2021</td>
                                  <td>
                                    <span class="badge badge-soft-info">Re-open</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-danger">High</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <th scope="row">
                                    <div class="form-check">
                                      <input class="form-check-input fs-15" type="checkbox" name="checkAll" value="option1"/>
                                    </div>
                                  </th>
                                  <td>02</td>
                                  <td>VLZ-453</td>
                                  <td>VLZ1400087425</td>
                                  <td>
                                    <a href="#!">Additional Calendar</a>
                                  </td>
                                  <td>Diana Kohler</td>
                                  <td>Admin</td>
                                  <td>Mary Rucker</td>
                                  <td>05 Oct, 2021</td>
                                  <td>
                                    <span class="badge badge-soft-secondary">On-Hold</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-info">Medium</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <th scope="row">
                                    <div class="form-check">
                                      <input class="form-check-input fs-15" type="checkbox" name="checkAll" value="option1"/>
                                    </div>
                                  </th>
                                  <td>03</td>
                                  <td>VLZ-454</td>
                                  <td>VLZ1400087438</td>
                                  <td>
                                    <a href="#!">Make a creating an account profile</a>
                                  </td>
                                  <td>Tonya Noble</td>
                                  <td>Admin</td>
                                  <td>Tonya Noble</td>
                                  <td>27 April, 2022</td>
                                  <td>
                                    <span class="badge badge-soft-danger">Closed</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-success">Low</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <th scope="row">
                                    <div class="form-check">
                                      <input class="form-check-input fs-15" type="checkbox" name="checkAll" value="option1"/>
                                    </div>
                                  </th>
                                  <td>04</td>
                                  <td>VLZ-455</td>
                                  <td>VLZ1400087748</td>
                                  <td>
                                    <a href="#!">Apologize for shopping Error!</a>
                                  </td>
                                  <td>Joseph Parker</td>
                                  <td>Alexis Clarke</td>
                                  <td>Joseph Parker</td>
                                  <td>14 June, 2021</td>
                                  <td>
                                    <span class="badge badge-soft-warning">Inprogress</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-info">Medium</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <th scope="row">
                                    <div class="form-check">
                                      <input class="form-check-input fs-15" type="checkbox" name="checkAll" value="option1"/>
                                    </div>
                                  </th>
                                  <td>05</td>
                                  <td>VLZ-456</td>
                                  <td>VLZ1400087547</td>
                                  <td>
                                    <a href="#!">Support for theme</a>
                                  </td>
                                  <td>Donald Palmer</td>
                                  <td>Admin</td>
                                  <td>Donald Palmer</td>
                                  <td>25 June, 2021</td>
                                  <td>
                                    <span class="badge badge-soft-danger">Closed</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-success">Low</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <th scope="row">
                                    <div class="form-check">
                                      <input class="form-check-input fs-15" type="checkbox" name="checkAll" value="option1"/>
                                    </div>
                                  </th>
                                  <td>06</td>
                                  <td>VLZ-457</td>
                                  <td>VLZ1400087245</td>
                                  <td>
                                    <a href="#!">Benner design for FB &amp; Twitter</a>
                                  </td>
                                  <td>Mary Rucker</td>
                                  <td>Jennifer Carter</td>
                                  <td>Mary Rucker</td>
                                  <td>14 Aug, 2021</td>
                                  <td>
                                    <span class="badge badge-soft-warning">Inprogress</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-info">Medium</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <th scope="row">
                                    <div class="form-check">
                                      <input class="form-check-input fs-15" type="checkbox" name="checkAll" value="option1"/>
                                    </div>
                                  </th>
                                  <td>07</td>
                                  <td>VLZ-458</td>
                                  <td>VLZ1400087785</td>
                                  <td>
                                    <a href="#!">Change email option process</a>
                                  </td>
                                  <td>James Morris</td>
                                  <td>Admin</td>
                                  <td>James Morris</td>
                                  <td>12 March, 2022</td>
                                  <td>
                                    <span class="badge badge-soft-primary">Open</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-danger">High</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <th scope="row">
                                    <div class="form-check">
                                      <input class="form-check-input fs-15" type="checkbox" name="checkAll" value="option1"/>
                                    </div>
                                  </th>
                                  <td>08</td>
                                  <td>VLZ-460</td>
                                  <td>VLZ1400087745</td>
                                  <td>
                                    <a href="#!">Support for theme</a>
                                  </td>
                                  <td>Nathan Cole</td>
                                  <td>Nancy Martino</td>
                                  <td>Nathan Cole</td>
                                  <td>28 Feb, 2022</td>
                                  <td>
                                    <span class="badge badge-soft-secondary">On-Hold</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-success">Low</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <th scope="row">
                                    <div class="form-check">
                                      <input class="form-check-input fs-15" type="checkbox" name="checkAll" value="option1"/>
                                    </div>
                                  </th>
                                  <td>09</td>
                                  <td>VLZ-461</td>
                                  <td>VLZ1400087179</td>
                                  <td>
                                    <a href="#!">Form submit issue</a>
                                  </td>
                                  <td>Grace Coles</td>
                                  <td>Admin</td>
                                  <td>Grace Coles</td>
                                  <td>07 Jan, 2022</td>
                                  <td>
                                    <span class="badge badge-soft-success">New</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-danger">High</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <th scope="row">
                                    <div class="form-check">
                                      <input class="form-check-input fs-15" type="checkbox" name="checkAll" value="option1"/>
                                    </div>
                                  </th>
                                  <td>10</td>
                                  <td>VLZ-462</td>
                                  <td>VLZ140008856</td>
                                  <td>
                                    <a href="#!">Edit customer testimonial</a>
                                  </td>
                                  <td>Freda</td>
                                  <td>Alexis Clarke</td>
                                  <td>Freda</td>
                                  <td>16 Aug, 2021</td>
                                  <td>
                                    <span class="badge badge-soft-danger">Closed</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-info">Medium</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <th scope="row">
                                    <div class="form-check">
                                      <input class="form-check-input fs-15" type="checkbox" name="checkAll" value="option1"/>
                                    </div>
                                  </th>
                                  <td>11</td>
                                  <td>VLZ-463</td>
                                  <td>VLZ1400078031</td>
                                  <td>
                                    <a href="#!">Ca i have an e-copy invoice</a>
                                  </td>
                                  <td>Williams</td>
                                  <td>Admin</td>
                                  <td>Williams</td>
                                  <td>24 Feb, 2022</td>
                                  <td>
                                    <span class="badge badge-soft-primary">Open</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-success">Low</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <th scope="row">
                                    <div class="form-check">
                                      <input class="form-check-input fs-15" type="checkbox" name="checkAll" value="option1"/>
                                    </div>
                                  </th>
                                  <td>12</td>
                                  <td>VLZ-464</td>
                                  <td>VLZ1400087416</td>
                                  <td>
                                    <a href="#!">Brand logo design</a>
                                  </td>
                                  <td>Richard V.</td>
                                  <td>Admin</td>
                                  <td>Richard V.</td>
                                  <td>16 March, 2021</td>
                                  <td>
                                    <span class="badge badge-soft-warning">Inprogress</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-danger">High</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <th scope="row">
                                    <div class="form-check">
                                      <input class="form-check-input fs-15" type="checkbox" name="checkAll" value="option1"/>
                                    </div>
                                  </th>
                                  <td>13</td>
                                  <td>VLZ-466</td>
                                  <td>VLZ1400089015</td>
                                  <td>
                                    <a href="#!">Issue with finding information about order ?</a>
                                  </td>
                                  <td>Olive Gunther</td>
                                  <td>Alexis Clarke</td>
                                  <td>Schaefer</td>
                                  <td>32 March, 2022</td>
                                  <td>
                                    <span class="badge badge-soft-success">New</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-danger">High</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <th scope="row">
                                    <div class="form-check">
                                      <input class="form-check-input fs-15" type="checkbox" name="checkAll" value="option1"/>
                                    </div>
                                  </th>
                                  <td>14</td>
                                  <td>VLZ-467</td>
                                  <td>VLZ1400090324</td>
                                  <td>
                                    <a href="#!">Make a creating an account profile</a>
                                  </td>
                                  <td>Edwin</td>
                                  <td>Admin</td>
                                  <td>Edwin</td>
                                  <td>05 April, 2022</td>
                                  <td>
                                    <span class="badge badge-soft-warning">Inprogress</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-success">Low</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                              </tbody>
                            </table>
                          </div>
                        </div>
                      </div>                      <!--end col-->
                    </div>                    <!--end row-->

                    <div class="row">
                      <div class="col-lg-12">
                        <div class="card">
                          <div class="card-header">
                            <h5 class="card-title mb-0">Alternative Pagination</h5>
                          </div>
                          <div class="card-body">
                            <table id="alternative-pagination" class="table nowrap dt-responsive align-middle table-hover table-bordered" style="width:100%">
                              <thead>
                                <tr>
                                  <th>SR No.</th>
                                  <th>Currency</th>
                                  <th>Price</th>
                                  <th>Pairs</th>
                                  <th>24 High</th>
                                  <th>24 Low</th>
                                  <th>Market Volume</th>
                                  <th>Volume %</th>
                                  <th>Action</th>
                                </tr>
                              </thead>
                              <tbody>
                                <tr>
                                  <td>01</td>
                                  <td>
                                    <div class="d-flex align-items-center fw-medium">
                                      <img src="{$themePath}/assets/images/svg/crypto-icons/btc.svg" alt="" class="avatar-xxs me-2"/>
                                      <a href="javascript:void(0);" class="currency_name">Bitcoin (BTC)</a>
                                    </div>
                                  </td>
                                  <td>$47,071.60</td>
                                  <td>BTC/USD</td>
                                  <td>$28,722.76</td>
                                  <td>$68,789.63</td>
                                  <td>$888,411,910</td>
                                  <td>
                                    <h6 class="text-success fs-13 mb-0">
                                      <i class="mdi mdi-trending-up align-middle me-1"></i>1.50%</h6>
                                  </td>
                                  <td>
                                    <button class="btn btn-sm btn-soft-info">Trade Now</button>
                                  </td>
                                </tr>
                                <tr>
                                  <td>02</td>
                                  <td>
                                    <div class="d-flex align-items-center fw-medium">
                                      <img src="{$themePath}/assets/images/svg/crypto-icons/eth.svg" alt="" class="avatar-xxs me-2"/>
                                      <a href="javascript:void(0);" class="currency_name">Ethereum (ETH)</a>
                                    </div>
                                  </td>
                                  <td>$3,813.14</td>
                                  <td>ETH/USDT</td>
                                  <td>$4,036.24</td>
                                  <td>$3,588.14</td>
                                  <td>$314,520,675</td>
                                  <td>
                                    <h6 class="text-danger fs-13 mb-0">
                                      <i class="mdi mdi-trending-down align-middle me-1"></i>0.42%</h6>
                                  </td>
                                  <td>
                                    <button class="btn btn-sm btn-soft-info">Trade Now</button>
                                  </td>
                                </tr>
                                <tr>
                                  <td>03</td>
                                  <td>
                                    <div class="d-flex align-items-center fw-medium">
                                      <img src="{$themePath}/assets/images/svg/crypto-icons/ltc.svg" alt="" class="avatar-xxs me-2"/>
                                      <a href="javascript:void(0);" class="currency_name">Litecoin (LTC)</a>
                                    </div>
                                  </td>
                                  <td>$149.65</td>
                                  <td>LTC/USDT</td>
                                  <td>$412.96</td>
                                  <td>$104.33</td>
                                  <td>$314,520,675</td>
                                  <td>
                                    <h6 class="text-success fs-13 mb-0">
                                      <i class="mdi mdi-trending-up align-middle me-1"></i>0.89%</h6>
                                  </td>
                                  <td>
                                    <button class="btn btn-sm btn-soft-info">Trade Now</button>
                                  </td>
                                </tr>
                                <tr>
                                  <td>04</td>
                                  <td>
                                    <div class="d-flex align-items-center fw-medium">
                                      <img src="{$themePath}/assets/images/svg/crypto-icons/xmr.svg" alt="" class="avatar-xxs me-2"/>
                                      <a href="javascript:void(0);" class="currency_name">Monero (XMR)</a>
                                    </div>
                                  </td>
                                  <td>$17,491.16</td>
                                  <td>XRM/USDT</td>
                                  <td>$31,578.35</td>
                                  <td>$8691.75</td>
                                  <td>$9,847,327</td>
                                  <td>
                                    <h6 class="text-success fs-13 mb-0">
                                      <i class="mdi mdi-trending-up align-middle me-1"></i>1.92%</h6>
                                  </td>
                                  <td>
                                    <button class="btn btn-sm btn-soft-info">Trade Now</button>
                                  </td>
                                </tr>
                                <tr>
                                  <td>05</td>
                                  <td>
                                    <div class="d-flex align-items-center fw-medium">
                                      <img src="{$themePath}/assets/images/svg/crypto-icons/ant.svg" alt="" class="avatar-xxs me-2"/>
                                      <a href="javascript:void(0);" class="currency_name">Aragon (ANT)</a>
                                    </div>
                                  </td>
                                  <td>$172.93</td>
                                  <td>SOL/USD</td>
                                  <td>$178.37</td>
                                  <td>$172.3</td>
                                  <td>$40,559,274</td>
                                  <td>
                                    <h6 class="text-danger fs-13 mb-0">
                                      <i class="mdi mdi-trending-down align-middle me-1"></i>2.87%</h6>
                                  </td>
                                  <td>
                                    <button class="btn btn-sm btn-soft-info">Trade Now</button>
                                  </td>
                                </tr>
                                <tr>
                                  <td>06</td>
                                  <td>
                                    <div class="d-flex align-items-center fw-medium">
                                      <img src="{$themePath}/assets/images/svg/crypto-icons/sol.svg" alt="" class="avatar-xxs me-2"/>
                                      <a href="javascript:void(0);" class="currency_name">Solana (SOL)</a>
                                    </div>
                                  </td>
                                  <td>$17,491.16</td>
                                  <td>XRM/USDT</td>
                                  <td>$31,578.35</td>
                                  <td>$8691.75</td>
                                  <td>$9,847,327</td>
                                  <td>
                                    <h6 class="text-success fs-13 mb-0">
                                      <i class="mdi mdi-trending-up align-middle me-1"></i>1.92%</h6>
                                  </td>
                                  <td>
                                    <button class="btn btn-sm btn-soft-info">Trade Now</button>
                                  </td>
                                </tr>
                                <tr>
                                  <td>07</td>
                                  <td>
                                    <div class="d-flex align-items-center fw-medium">
                                      <img src="{$themePath}/assets/images/svg/crypto-icons/fil.svg" alt="" class="avatar-xxs me-2"/>
                                      <a href="javascript:void(0);" class="currency_name">Filecoin (FIL)</a>
                                    </div>
                                  </td>
                                  <td>$13.31</td>
                                  <td>ANT/USD</td>
                                  <td>$13.85</td>
                                  <td>$12.53</td>
                                  <td>$156,209,195.18</td>
                                  <td>
                                    <h6 class="text-success fs-13 mb-0">
                                      <i class="mdi mdi-trending-up align-middle me-1"></i>3.96%</h6>
                                  </td>
                                  <td>
                                    <button class="btn btn-sm btn-soft-info">Trade Now</button>
                                  </td>
                                </tr>
                                <tr>
                                  <td>08</td>
                                  <td>
                                    <div class="d-flex align-items-center fw-medium">
                                      <img src="{$themePath}/assets/images/svg/crypto-icons/fil.svg" alt="" class="avatar-xxs me-2"/>
                                      <a href="javascript:void(0);" class="currency_name">Filecoin (FIL)</a>
                                    </div>
                                  </td>
                                  <td>$35.21</td>
                                  <td>FIL/USD</td>
                                  <td>$36.41</td>
                                  <td>$35.03</td>
                                  <td>$374,618,945.51</td>
                                  <td>
                                    <h6 class="text-danger fs-13 mb-0">
                                      <i class="mdi mdi-trending-down align-middle me-1"></i>0.84%</h6>
                                  </td>
                                  <td>
                                    <button class="btn btn-sm btn-soft-info">Trade Now</button>
                                  </td>
                                </tr>
                                <tr>
                                  <td>09</td>
                                  <td>
                                    <div class="d-flex align-items-center fw-medium">
                                      <img src="{$themePath}/assets/images/svg/crypto-icons/aave.svg" alt="" class="avatar-xxs me-2"/>
                                      <a href="javascript:void(0);" class="currency_name">Aave (AAVE)</a>
                                    </div>
                                  </td>
                                  <td>$275.47</td>
                                  <td>AAVE/USDT</td>
                                  <td>$277.11</td>
                                  <td>$255.01</td>
                                  <td>$156,209,195.18</td>
                                  <td>
                                    <h6 class="text-success fs-13 mb-0">
                                      <i class="mdi mdi-trending-up align-middle me-1"></i>8.20%</h6>
                                  </td>
                                  <td>
                                    <button class="btn btn-sm btn-soft-info">Trade Now</button>
                                  </td>
                                </tr>
                                <tr>
                                  <td>10</td>
                                  <td>
                                    <div class="d-flex align-items-center fw-medium">
                                      <img src="{$themePath}/assets/images/svg/crypto-icons/ada.svg" alt="" class="avatar-xxs me-2"/>
                                      <a href="javascript:void(0);" class="currency_name">Cardano (ADA)</a>
                                    </div>
                                  </td>
                                  <td>$1.35</td>
                                  <td>ADA/USD</td>
                                  <td>$1.39</td>
                                  <td>$1.32</td>
                                  <td>$880,387,980.14</td>
                                  <td>
                                    <h6 class="text-danger fs-13 mb-0">
                                      <i class="mdi mdi-trending-down align-middle me-1"></i>0.42%</h6>
                                  </td>
                                  <td>
                                    <button class="btn btn-sm btn-soft-info">Trade Now</button>
                                  </td>
                                </tr>
                                <tr>
                                  <td>11</td>
                                  <td>
                                    <div class="d-flex align-items-center fw-medium">
                                      <img src="{$themePath}/assets/images/svg/crypto-icons/fil.svg" alt="" class="avatar-xxs me-2"/>
                                      <a href="javascript:void(0);" class="currency_name">Filecoin (FIL)</a>
                                    </div>
                                  </td>
                                  <td>$35.21</td>
                                  <td>FIL/USD</td>
                                  <td>$36.41</td>
                                  <td>$35.03</td>
                                  <td>$374,618,945.51</td>
                                  <td>
                                    <h6 class="text-danger fs-13 mb-0">
                                      <i class="mdi mdi-trending-down align-middle me-1"></i>0.84%</h6>
                                  </td>
                                  <td>
                                    <button class="btn btn-sm btn-soft-info">Trade Now</button>
                                  </td>
                                </tr>
                                <tr>
                                  <td>12</td>
                                  <td>
                                    <div class="d-flex align-items-center fw-medium">
                                      <img src="{$themePath}/assets/images/svg/crypto-icons/aave.svg" alt="" class="avatar-xxs me-2"/>
                                      <a href="javascript:void(0);" class="currency_name">Aave (AAVE)</a>
                                    </div>
                                  </td>
                                  <td>$275.47</td>
                                  <td>AAVE/USDT</td>
                                  <td>$277.11</td>
                                  <td>$255.01</td>
                                  <td>$156,209,195.18</td>
                                  <td>
                                    <h6 class="text-success fs-13 mb-0">
                                      <i class="mdi mdi-trending-up align-middle me-1"></i>8.20%</h6>
                                  </td>
                                  <td>
                                    <button class="btn btn-sm btn-soft-info">Trade Now</button>
                                  </td>
                                </tr>
                                <tr>
                                  <td>13</td>
                                  <td>
                                    <div class="d-flex align-items-center fw-medium">
                                      <img src="{$themePath}/assets/images/svg/crypto-icons/ada.svg" alt="" class="avatar-xxs me-2"/>
                                      <a href="javascript:void(0);" class="currency_name">Cardano (ADA)</a>
                                    </div>
                                  </td>
                                  <td>$1.35</td>
                                  <td>ADA/USD</td>
                                  <td>$1.39</td>
                                  <td>$1.32</td>
                                  <td>$880,387,980.14</td>
                                  <td>
                                    <h6 class="text-danger fs-13 mb-0">
                                      <i class="mdi mdi-trending-down align-middle me-1"></i>0.42%</h6>
                                  </td>
                                  <td>
                                    <button class="btn btn-sm btn-soft-info">Trade Now</button>
                                  </td>
                                </tr>
                              </tbody>
                            </table>
                          </div>
                        </div>
                      </div>                      <!--end col-->
                    </div>                    <!--end row-->


                    <div class="row">
                      <div class="col-lg-12">
                        <div class="card">
                          <div class="card-header d-flex align-items-center">
                            <h5 class="card-title mb-0 flex-grow-1">Add Rows</h5>
                            <div>
                              <button id="addRow" class="btn btn-primary">Add New Row</button>
                            </div>
                          </div>
                          <div class="card-body">

                            <table id="add-rows" class="table table-nowrap dt-responsive table-bordered display" style="width:100%">
                              <thead>
                                <tr>
                                  <th>Column 1</th>
                                  <th>Column 2</th>
                                  <th>Column 3</th>
                                  <th>Column 4</th>
                                  <th>Column 5</th>
                                </tr>
                              </thead>
                            </table>
                          </div>
                        </div>
                      </div>                      <!--end col-->
                    </div>                    <!--end row-->

                    <div class="row">
                      <div class="col-lg-12">
                        <div class="card">
                          <div class="card-header">
                            <h5 class="card-title mb-0">Fixed Header Datatables</h5>
                          </div>
                          <div class="card-body">
                            <table id="fixed-header" class="table table-bordered dt-responsive nowrap table-striped align-middle" style="width:100%">
                              <thead>
                                <tr>
                                  <th scope="col" style="width: 10px;">
                                    <div class="form-check">
                                      <input class="form-check-input fs-15" type="checkbox" id="checkAll" value="option"/>
                                    </div>
                                  </th>
                                  <th>SR No.</th>
                                  <th>ID</th>
                                  <th>Purchase ID</th>
                                  <th>Title</th>
                                  <th>User</th>
                                  <th>Assigned To</th>
                                  <th>Created By</th>
                                  <th>Create Date</th>
                                  <th>Status</th>
                                  <th>Priority</th>
                                  <th>Action</th>
                                </tr>
                              </thead>
                              <tbody>
                                <tr>
                                  <th scope="row">
                                    <div class="form-check">
                                      <input class="form-check-input fs-15" type="checkbox" name="checkAll" value="option1"/>
                                    </div>
                                  </th>
                                  <td>01</td>
                                  <td>VLZ-452</td>
                                  <td>VLZ1400087402</td>
                                  <td>
                                    <a href="#!">Post launch reminder/ post list</a>
                                  </td>
                                  <td>Joseph Parker</td>
                                  <td>Alexis Clarke</td>
                                  <td>Joseph Parker</td>
                                  <td>03 Oct, 2021</td>
                                  <td>
                                    <span class="badge badge-soft-info">Re-open</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-danger">High</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <th scope="row">
                                    <div class="form-check">
                                      <input class="form-check-input fs-15" type="checkbox" name="checkAll" value="option1"/>
                                    </div>
                                  </th>
                                  <td>02</td>
                                  <td>VLZ-453</td>
                                  <td>VLZ1400087425</td>
                                  <td>
                                    <a href="#!">Additional Calendar</a>
                                  </td>
                                  <td>Diana Kohler</td>
                                  <td>Admin</td>
                                  <td>Mary Rucker</td>
                                  <td>05 Oct, 2021</td>
                                  <td>
                                    <span class="badge badge-soft-secondary">On-Hold</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-info">Medium</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <th scope="row">
                                    <div class="form-check">
                                      <input class="form-check-input fs-15" type="checkbox" name="checkAll" value="option1"/>
                                    </div>
                                  </th>
                                  <td>03</td>
                                  <td>VLZ-454</td>
                                  <td>VLZ1400087438</td>
                                  <td>
                                    <a href="#!">Make a creating an account profile</a>
                                  </td>
                                  <td>Tonya Noble</td>
                                  <td>Admin</td>
                                  <td>Tonya Noble</td>
                                  <td>27 April, 2022</td>
                                  <td>
                                    <span class="badge badge-soft-danger">Closed</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-success">Low</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <th scope="row">
                                    <div class="form-check">
                                      <input class="form-check-input fs-15" type="checkbox" name="checkAll" value="option1"/>
                                    </div>
                                  </th>
                                  <td>04</td>
                                  <td>VLZ-455</td>
                                  <td>VLZ1400087748</td>
                                  <td>
                                    <a href="#!">Apologize for shopping Error!</a>
                                  </td>
                                  <td>Joseph Parker</td>
                                  <td>Alexis Clarke</td>
                                  <td>Joseph Parker</td>
                                  <td>14 June, 2021</td>
                                  <td>
                                    <span class="badge badge-soft-warning">Inprogress</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-info">Medium</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <th scope="row">
                                    <div class="form-check">
                                      <input class="form-check-input fs-15" type="checkbox" name="checkAll" value="option1"/>
                                    </div>
                                  </th>
                                  <td>05</td>
                                  <td>VLZ-456</td>
                                  <td>VLZ1400087547</td>
                                  <td>
                                    <a href="#!">Support for theme</a>
                                  </td>
                                  <td>Donald Palmer</td>
                                  <td>Admin</td>
                                  <td>Donald Palmer</td>
                                  <td>25 June, 2021</td>
                                  <td>
                                    <span class="badge badge-soft-danger">Closed</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-success">Low</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <th scope="row">
                                    <div class="form-check">
                                      <input class="form-check-input fs-15" type="checkbox" name="checkAll" value="option1"/>
                                    </div>
                                  </th>
                                  <td>06</td>
                                  <td>VLZ-457</td>
                                  <td>VLZ1400087245</td>
                                  <td>
                                    <a href="#!">Benner design for FB &amp; Twitter</a>
                                  </td>
                                  <td>Mary Rucker</td>
                                  <td>Jennifer Carter</td>
                                  <td>Mary Rucker</td>
                                  <td>14 Aug, 2021</td>
                                  <td>
                                    <span class="badge badge-soft-warning">Inprogress</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-info">Medium</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <th scope="row">
                                    <div class="form-check">
                                      <input class="form-check-input fs-15" type="checkbox" name="checkAll" value="option1"/>
                                    </div>
                                  </th>
                                  <td>07</td>
                                  <td>VLZ-458</td>
                                  <td>VLZ1400087785</td>
                                  <td>
                                    <a href="#!">Change email option process</a>
                                  </td>
                                  <td>James Morris</td>
                                  <td>Admin</td>
                                  <td>James Morris</td>
                                  <td>12 March, 2022</td>
                                  <td>
                                    <span class="badge badge-soft-primary">Open</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-danger">High</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <th scope="row">
                                    <div class="form-check">
                                      <input class="form-check-input fs-15" type="checkbox" name="checkAll" value="option1"/>
                                    </div>
                                  </th>
                                  <td>08</td>
                                  <td>VLZ-460</td>
                                  <td>VLZ1400087745</td>
                                  <td>
                                    <a href="#!">Support for theme</a>
                                  </td>
                                  <td>Nathan Cole</td>
                                  <td>Nancy Martino</td>
                                  <td>Nathan Cole</td>
                                  <td>28 Feb, 2022</td>
                                  <td>
                                    <span class="badge badge-soft-secondary">On-Hold</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-success">Low</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <th scope="row">
                                    <div class="form-check">
                                      <input class="form-check-input fs-15" type="checkbox" name="checkAll" value="option1"/>
                                    </div>
                                  </th>
                                  <td>09</td>
                                  <td>VLZ-461</td>
                                  <td>VLZ1400087179</td>
                                  <td>
                                    <a href="#!">Form submit issue</a>
                                  </td>
                                  <td>Grace Coles</td>
                                  <td>Admin</td>
                                  <td>Grace Coles</td>
                                  <td>07 Jan, 2022</td>
                                  <td>
                                    <span class="badge badge-soft-success">New</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-danger">High</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <th scope="row">
                                    <div class="form-check">
                                      <input class="form-check-input fs-15" type="checkbox" name="checkAll" value="option1"/>
                                    </div>
                                  </th>
                                  <td>10</td>
                                  <td>VLZ-462</td>
                                  <td>VLZ140008856</td>
                                  <td>
                                    <a href="#!">Edit customer testimonial</a>
                                  </td>
                                  <td>Freda</td>
                                  <td>Alexis Clarke</td>
                                  <td>Freda</td>
                                  <td>16 Aug, 2021</td>
                                  <td>
                                    <span class="badge badge-soft-danger">Closed</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-info">Medium</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <th scope="row">
                                    <div class="form-check">
                                      <input class="form-check-input fs-15" type="checkbox" name="checkAll" value="option1"/>
                                    </div>
                                  </th>
                                  <td>11</td>
                                  <td>VLZ-463</td>
                                  <td>VLZ1400078031</td>
                                  <td>
                                    <a href="#!">Ca i have an e-copy invoice</a>
                                  </td>
                                  <td>Williams</td>
                                  <td>Admin</td>
                                  <td>Williams</td>
                                  <td>24 Feb, 2022</td>
                                  <td>
                                    <span class="badge badge-soft-primary">Open</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-success">Low</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <th scope="row">
                                    <div class="form-check">
                                      <input class="form-check-input fs-15" type="checkbox" name="checkAll" value="option1"/>
                                    </div>
                                  </th>
                                  <td>12</td>
                                  <td>VLZ-464</td>
                                  <td>VLZ1400087416</td>
                                  <td>
                                    <a href="#!">Brand logo design</a>
                                  </td>
                                  <td>Richard V.</td>
                                  <td>Admin</td>
                                  <td>Richard V.</td>
                                  <td>16 March, 2021</td>
                                  <td>
                                    <span class="badge badge-soft-warning">Inprogress</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-danger">High</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <th scope="row">
                                    <div class="form-check">
                                      <input class="form-check-input fs-15" type="checkbox" name="checkAll" value="option1"/>
                                    </div>
                                  </th>
                                  <td>13</td>
                                  <td>VLZ-466</td>
                                  <td>VLZ1400089015</td>
                                  <td>
                                    <a href="#!">Issue with finding information about order ?</a>
                                  </td>
                                  <td>Olive Gunther</td>
                                  <td>Alexis Clarke</td>
                                  <td>Schaefer</td>
                                  <td>32 March, 2022</td>
                                  <td>
                                    <span class="badge badge-soft-success">New</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-danger">High</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <th scope="row">
                                    <div class="form-check">
                                      <input class="form-check-input fs-15" type="checkbox" name="checkAll" value="option1"/>
                                    </div>
                                  </th>
                                  <td>14</td>
                                  <td>VLZ-467</td>
                                  <td>VLZ1400090324</td>
                                  <td>
                                    <a href="#!">Make a creating an account profile</a>
                                  </td>
                                  <td>Edwin</td>
                                  <td>Admin</td>
                                  <td>Edwin</td>
                                  <td>05 April, 2022</td>
                                  <td>
                                    <span class="badge badge-soft-warning">Inprogress</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-success">Low</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                              </tbody>
                            </table>
                          </div>
                        </div>
                      </div>
                    </div>                    <!--end row-->

                    <div class="row">
                      <div class="col-lg-12">
                        <div class="card">
                          <div class="card-header">
                            <h5 class="card-title mb-0">Modal Data Datatables</h5>
                          </div>
                          <div class="card-body">
                            <table id="model-datatables" class="table table-bordered nowrap table-striped align-middle" style="width:100%">
                              <thead>
                                <tr>
                                  <th>SR No.</th>
                                  <th>ID</th>
                                  <th>Purchase ID</th>
                                  <th>Title</th>
                                  <th>User</th>
                                  <th>Assigned To</th>
                                  <th>Created By</th>
                                  <th>Create Date</th>
                                  <th>Status</th>
                                  <th>Priority</th>
                                  <th>Action</th>
                                </tr>
                              </thead>
                              <tbody>
                                <tr>
                                  <td>01</td>
                                  <td>VLZ-452</td>
                                  <td>VLZ1400087402</td>
                                  <td>
                                    <a href="#!">Post launch reminder/ post list</a>
                                  </td>
                                  <td>Joseph Parker</td>
                                  <td>Alexis Clarke</td>
                                  <td>Joseph Parker</td>
                                  <td>03 Oct, 2021</td>
                                  <td>
                                    <span class="badge badge-soft-info">Re-open</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-danger">High</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <td>02</td>
                                  <td>VLZ-453</td>
                                  <td>VLZ1400087425</td>
                                  <td>
                                    <a href="#!">Additional Calendar</a>
                                  </td>
                                  <td>Diana Kohler</td>
                                  <td>Admin</td>
                                  <td>Mary Rucker</td>
                                  <td>05 Oct, 2021</td>
                                  <td>
                                    <span class="badge badge-soft-secondary">On-Hold</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-info">Medium</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <td>03</td>
                                  <td>VLZ-454</td>
                                  <td>VLZ1400087438</td>
                                  <td>
                                    <a href="#!">Make a creating an account profile</a>
                                  </td>
                                  <td>Tonya Noble</td>
                                  <td>Admin</td>
                                  <td>Tonya Noble</td>
                                  <td>27 April, 2022</td>
                                  <td>
                                    <span class="badge badge-soft-danger">Closed</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-success">Low</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <td>04</td>
                                  <td>VLZ-455</td>
                                  <td>VLZ1400087748</td>
                                  <td>
                                    <a href="#!">Apologize for shopping Error!</a>
                                  </td>
                                  <td>Joseph Parker</td>
                                  <td>Alexis Clarke</td>
                                  <td>Joseph Parker</td>
                                  <td>14 June, 2021</td>
                                  <td>
                                    <span class="badge badge-soft-warning">Inprogress</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-info">Medium</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <td>05</td>
                                  <td>VLZ-456</td>
                                  <td>VLZ1400087547</td>
                                  <td>
                                    <a href="#!">Support for theme</a>
                                  </td>
                                  <td>Donald Palmer</td>
                                  <td>Admin</td>
                                  <td>Donald Palmer</td>
                                  <td>25 June, 2021</td>
                                  <td>
                                    <span class="badge badge-soft-danger">Closed</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-success">Low</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <td>06</td>
                                  <td>VLZ-457</td>
                                  <td>VLZ1400087245</td>
                                  <td>
                                    <a href="#!">Benner design for FB &amp; Twitter</a>
                                  </td>
                                  <td>Mary Rucker</td>
                                  <td>Jennifer Carter</td>
                                  <td>Mary Rucker</td>
                                  <td>14 Aug, 2021</td>
                                  <td>
                                    <span class="badge badge-soft-warning">Inprogress</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-info">Medium</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <td>07</td>
                                  <td>VLZ-458</td>
                                  <td>VLZ1400087785</td>
                                  <td>
                                    <a href="#!">Change email option process</a>
                                  </td>
                                  <td>James Morris</td>
                                  <td>Admin</td>
                                  <td>James Morris</td>
                                  <td>12 March, 2022</td>
                                  <td>
                                    <span class="badge badge-soft-primary">Open</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-danger">High</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <td>08</td>
                                  <td>VLZ-460</td>
                                  <td>VLZ1400087745</td>
                                  <td>
                                    <a href="#!">Support for theme</a>
                                  </td>
                                  <td>Nathan Cole</td>
                                  <td>Nancy Martino</td>
                                  <td>Nathan Cole</td>
                                  <td>28 Feb, 2022</td>
                                  <td>
                                    <span class="badge badge-soft-secondary">On-Hold</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-success">Low</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <td>09</td>
                                  <td>VLZ-461</td>
                                  <td>VLZ1400087179</td>
                                  <td>
                                    <a href="#!">Form submit issue</a>
                                  </td>
                                  <td>Grace Coles</td>
                                  <td>Admin</td>
                                  <td>Grace Coles</td>
                                  <td>07 Jan, 2022</td>
                                  <td>
                                    <span class="badge badge-soft-success">New</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-danger">High</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <td>10</td>
                                  <td>VLZ-462</td>
                                  <td>VLZ140008856</td>
                                  <td>
                                    <a href="#!">Edit customer testimonial</a>
                                  </td>
                                  <td>Freda</td>
                                  <td>Alexis Clarke</td>
                                  <td>Freda</td>
                                  <td>16 Aug, 2021</td>
                                  <td>
                                    <span class="badge badge-soft-danger">Closed</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-info">Medium</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <td>11</td>
                                  <td>VLZ-463</td>
                                  <td>VLZ1400078031</td>
                                  <td>
                                    <a href="#!">Ca i have an e-copy invoice</a>
                                  </td>
                                  <td>Williams</td>
                                  <td>Admin</td>
                                  <td>Williams</td>
                                  <td>24 Feb, 2022</td>
                                  <td>
                                    <span class="badge badge-soft-primary">Open</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-success">Low</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <td>12</td>
                                  <td>VLZ-464</td>
                                  <td>VLZ1400087416</td>
                                  <td>
                                    <a href="#!">Brand logo design</a>
                                  </td>
                                  <td>Richard V.</td>
                                  <td>Admin</td>
                                  <td>Richard V.</td>
                                  <td>16 March, 2021</td>
                                  <td>
                                    <span class="badge badge-soft-warning">Inprogress</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-danger">High</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <td>13</td>
                                  <td>VLZ-466</td>
                                  <td>VLZ1400089015</td>
                                  <td>
                                    <a href="#!">Issue with finding information about order ?</a>
                                  </td>
                                  <td>Olive Gunther</td>
                                  <td>Alexis Clarke</td>
                                  <td>Schaefer</td>
                                  <td>32 March, 2022</td>
                                  <td>
                                    <span class="badge badge-soft-success">New</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-danger">High</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <td>14</td>
                                  <td>VLZ-467</td>
                                  <td>VLZ1400090324</td>
                                  <td>
                                    <a href="#!">Make a creating an account profile</a>
                                  </td>
                                  <td>Edwin</td>
                                  <td>Admin</td>
                                  <td>Edwin</td>
                                  <td>05 April, 2022</td>
                                  <td>
                                    <span class="badge badge-soft-warning">Inprogress</span>
                                  </td>
                                  <td>
                                    <span class="badge bg-success">Low</span>
                                  </td>
                                  <td>
                                    <div class="dropdown d-inline-block">
                                      <button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="ri-more-fill align-middle"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <a href="#!" class="dropdown-item">
                                            <i class="ri-eye-fill align-bottom me-2 text-muted"></i> View</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item edit-item-btn">
                                            <i class="ri-pencil-fill align-bottom me-2 text-muted"></i> Edit</a>
                                        </li>
                                        <li>
                                          <a class="dropdown-item remove-item-btn">
                                            <i class="ri-delete-bin-fill align-bottom me-2 text-muted"></i> Delete
                                          </a>
                                        </li>
                                      </ul>
                                    </div>
                                  </td>
                                </tr>
                              </tbody>
                            </table>
                          </div>
                        </div>
                      </div>
                    </div>                    <!--end row-->

                    <div class="row">
                      <div class="col-lg-12">
                        <div class="card">
                          <div class="card-header">
                            <h5 class="card-title mb-0">Buttons Datatables</h5>
                          </div>
                          <div class="card-body">
                            <table id="buttons-datatables" class="display table table-bordered" style="width:100%">
                              <thead>
                                <tr>
                                  <th>Name</th>
                                  <th>Position</th>
                                  <th>Office</th>
                                  <th>Age</th>
                                  <th>Start date</th>
                                  <th>Salary</th>
                                </tr>
                              </thead>
                              <tbody>
                                <tr>
                                  <td>Tiger Nixon</td>
                                  <td>System Architect</td>
                                  <td>Edinburgh</td>
                                  <td>61</td>
                                  <td>2011/04/25</td>
                                  <td>$320,800</td>
                                </tr>
                                <tr>
                                  <td>Garrett Winters</td>
                                  <td>Accountant</td>
                                  <td>Tokyo</td>
                                  <td>63</td>
                                  <td>2011/07/25</td>
                                  <td>$170,750</td>
                                </tr>
                                <tr>
                                  <td>Ashton Cox</td>
                                  <td>Junior Technical Author</td>
                                  <td>San Francisco</td>
                                  <td>66</td>
                                  <td>2009/01/12</td>
                                  <td>$86,000</td>
                                </tr>
                                <tr>
                                  <td>Cedric Kelly</td>
                                  <td>Senior Javascript Developer</td>
                                  <td>Edinburgh</td>
                                  <td>22</td>
                                  <td>2012/03/29</td>
                                  <td>$433,060</td>
                                </tr>
                                <tr>
                                  <td>Airi Satou</td>
                                  <td>Accountant</td>
                                  <td>Tokyo</td>
                                  <td>33</td>
                                  <td>2008/11/28</td>
                                  <td>$162,700</td>
                                </tr>
                                <tr>
                                  <td>Brielle Williamson</td>
                                  <td>Integration Specialist</td>
                                  <td>New York</td>
                                  <td>61</td>
                                  <td>2012/12/02</td>
                                  <td>$372,000</td>
                                </tr>
                                <tr>
                                  <td>Herrod Chandler</td>
                                  <td>Sales Assistant</td>
                                  <td>San Francisco</td>
                                  <td>59</td>
                                  <td>2012/08/06</td>
                                  <td>$137,500</td>
                                </tr>
                                <tr>
                                  <td>Rhona Davidson</td>
                                  <td>Integration Specialist</td>
                                  <td>Tokyo</td>
                                  <td>55</td>
                                  <td>2010/10/14</td>
                                  <td>$327,900</td>
                                </tr>
                                <tr>
                                  <td>Colleen Hurst</td>
                                  <td>Javascript Developer</td>
                                  <td>San Francisco</td>
                                  <td>39</td>
                                  <td>2009/09/15</td>
                                  <td>$205,500</td>
                                </tr>
                                <tr>
                                  <td>Sonya Frost</td>
                                  <td>Software Engineer</td>
                                  <td>Edinburgh</td>
                                  <td>23</td>
                                  <td>2008/12/13</td>
                                  <td>$103,600</td>
                                </tr>
                                <tr>
                                  <td>Jena Gaines</td>
                                  <td>Office Manager</td>
                                  <td>London</td>
                                  <td>30</td>
                                  <td>2008/12/19</td>
                                  <td>$90,560</td>
                                </tr>
                                <tr>
                                  <td>Quinn Flynn</td>
                                  <td>Support Lead</td>
                                  <td>Edinburgh</td>
                                  <td>22</td>
                                  <td>2013/03/03</td>
                                  <td>$342,000</td>
                                </tr>
                                <tr>
                                  <td>Charde Marshall</td>
                                  <td>Regional Director</td>
                                  <td>San Francisco</td>
                                  <td>36</td>
                                  <td>2008/10/16</td>
                                  <td>$470,600</td>
                                </tr>
                                <tr>
                                  <td>Haley Kennedy</td>
                                  <td>Senior Marketing Designer</td>
                                  <td>London</td>
                                  <td>43</td>
                                  <td>2012/12/18</td>
                                  <td>$313,500</td>
                                </tr>
                                <tr>
                                  <td>Tatyana Fitzpatrick</td>
                                  <td>Regional Director</td>
                                  <td>London</td>
                                  <td>19</td>
                                  <td>2010/03/17</td>
                                  <td>$385,750</td>
                                </tr>
                                <tr>
                                  <td>Michael Silva</td>
                                  <td>Marketing Designer</td>
                                  <td>London</td>
                                  <td>66</td>
                                  <td>2012/11/27</td>
                                  <td>$198,500</td>
                                </tr>
                                <tr>
                                  <td>Paul Byrd</td>
                                  <td>Chief Financial Officer (CFO)</td>
                                  <td>New York</td>
                                  <td>64</td>
                                  <td>2010/06/09</td>
                                  <td>$725,000</td>
                                </tr>
                                <tr>
                                  <td>Gloria Little</td>
                                  <td>Systems Administrator</td>
                                  <td>New York</td>
                                  <td>59</td>
                                  <td>2009/04/10</td>
                                  <td>$237,500</td>
                                </tr>
                                <tr>
                                  <td>Bradley Greer</td>
                                  <td>Software Engineer</td>
                                  <td>London</td>
                                  <td>41</td>
                                  <td>2012/10/13</td>
                                  <td>$132,000</td>
                                </tr>
                                <tr>
                                  <td>Dai Rios</td>
                                  <td>Personnel Lead</td>
                                  <td>Edinburgh</td>
                                  <td>35</td>
                                  <td>2012/09/26</td>
                                  <td>$217,500</td>
                                </tr>
                                <tr>
                                  <td>Jenette Caldwell</td>
                                  <td>Development Lead</td>
                                  <td>New York</td>
                                  <td>30</td>
                                  <td>2011/09/03</td>
                                  <td>$345,000</td>
                                </tr>
                                <tr>
                                  <td>Yuri Berry</td>
                                  <td>Chief Marketing Officer (CMO)</td>
                                  <td>New York</td>
                                  <td>40</td>
                                  <td>2009/06/25</td>
                                  <td>$675,000</td>
                                </tr>
                                <tr>
                                  <td>Caesar Vance</td>
                                  <td>Pre-Sales Support</td>
                                  <td>New York</td>
                                  <td>21</td>
                                  <td>2011/12/12</td>
                                  <td>$106,450</td>
                                </tr>
                                <tr>
                                  <td>Doris Wilder</td>
                                  <td>Sales Assistant</td>
                                  <td>Sydney</td>
                                  <td>23</td>
                                  <td>2010/09/20</td>
                                  <td>$85,600</td>
                                </tr>

                                <tr>
                                  <td>Gavin Cortez</td>
                                  <td>Team Leader</td>
                                  <td>San Francisco</td>
                                  <td>22</td>
                                  <td>2008/10/26</td>
                                  <td>$235,500</td>
                                </tr>
                                <tr>
                                  <td>Martena Mccray</td>
                                  <td>Post-Sales support</td>
                                  <td>Edinburgh</td>
                                  <td>46</td>
                                  <td>2011/03/09</td>
                                  <td>$324,050</td>
                                </tr>
                                <tr>
                                  <td>Unity Butler</td>
                                  <td>Marketing Designer</td>
                                  <td>San Francisco</td>
                                  <td>47</td>
                                  <td>2009/12/09</td>
                                  <td>$85,675</td>
                                </tr>
                              </tbody>
                            </table>
                          </div>
                        </div>
                      </div>
                    </div>                    <!--end row-->


                    <div class="row">
                      <div class="col-lg-12">
                        <div class="card">
                          <div class="card-header">
                            <h5 class="card-title mb-0">Ajax Datatables</h5>
                          </div>
                          <div class="card-body">
                            <table id="ajax-datatables" class="display table table-bordered dt-responsive" style="width:100%">
                              <thead>
                                <tr>
                                  <th>Name</th>
                                  <th>Position</th>
                                  <th>Office</th>
                                  <th>Extn.</th>
                                  <th>Start date</th>
                                  <th>Salary</th>
                                </tr>
                              </thead>
                              <tfoot>
                                <tr>
                                  <th>Name</th>
                                  <th>Position</th>
                                  <th>Office</th>
                                  <th>Extn.</th>
                                  <th>Start date</th>
                                  <th>Salary</th>
                                </tr>
                              </tfoot>
                            </table>
                          </div>
                        </div>
                      </div>                      <!--end col-->
                    </div>                    <!--end row-->

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
