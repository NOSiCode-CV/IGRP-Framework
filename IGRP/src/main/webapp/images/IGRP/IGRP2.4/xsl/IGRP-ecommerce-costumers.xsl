<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/>

  <xsl:template match="/">
    <html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">
      <head>

        <!-- page includes css -->
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
                            <div class="card" id="customerList">
                                <div class="card-header border-bottom-dashed">

                                    <div class="row g-4 align-items-center">
                                        <div class="col-sm">
                                            <div>
                                                <h5 class="card-title mb-0">Customer List</h5>
                                            </div>
                                        </div>
                                        <div class="col-sm-auto">
                                            <div class="d-flex flex-wrap align-items-start gap-2">
                                                <button class="btn btn-soft-danger" id="remove-actions" onClick="deleteMultiple()"><i class="ri-delete-bin-2-line"></i></button>
                                                <button type="button" class="btn btn-success add-btn" data-bs-toggle="modal" id="create-btn" data-bs-target="#showModal"><i class="ri-add-line align-bottom me-1"></i> Add Customer</button>
                                                <button type="button" class="btn btn-info"><i class="ri-file-download-line align-bottom me-1"></i> Import</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body border-bottom-dashed border-bottom">
                                    <form>
                                        <div class="row g-3">
                                            <div class="col-xl-6">
                                                <div class="search-box">
                                                    <input type="text" class="form-control search" placeholder="Search for customer, email, phone, status or something..."/>
                                                    <i class="ri-search-line search-icon"></i>
                                                </div>
                                            </div>
                                            <!--end col-->
                                            <div class="col-xl-6">
                                                <div class="row g-3">
                                                    <div class="col-sm-4">
                                                        <div class="">
                                                            <input type="text" class="form-control" id="datepicker-range" data-provider="flatpickr" data-date-format="d M, Y" data-range-date="true" placeholder="Select date"/>
                                                        </div>
                                                    </div>
                                                    <!--end col-->
                                                    <div class="col-sm-4">
                                                        <div>
                                                            <select class="form-control" data-plugin="choices" data-choices="" data-choices-search-false="" name="choices-single-default" id="idStatus">
                                                                <option value="">Status</option>
                                                                <option value="all" selected="">All</option>
                                                                <option value="Active">Active</option>
                                                                <option value="Block">Block</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <!--end col-->

                                                    <div class="col-sm-4">
                                                        <div>
                                                            <button type="button" class="btn btn-primary w-100" onclick="SearchData();"> <i class="ri-equalizer-fill me-2 align-bottom"></i>Filters</button>
                                                        </div>
                                                    </div>
                                                    <!--end col-->
                                                </div>
                                            </div>
                                        </div>
                                        <!--end row-->
                                    </form>
                                </div>
                                <div class="card-body">
                                    <div>
                                        <div class="table-responsive table-card mb-1">
                                            <table class="table align-middle" id="customerTable">
                                                <thead class="table-light text-muted">
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
                                                        <th class="sort" data-sort="status">Status</th>
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
                                                        <td class="id" style="display:none;"><a href="javascript:void(0);" class="fw-medium link-primary">#VZ2101</a></td>
                                                        <td class="customer_name">Mary Cousar</td>
                                                        <td class="email">marycousar@velzon.com</td>
                                                        <td class="phone">580-464-4694</td>
                                                        <td class="date">06 Apr, 2021</td>
                                                        <td class="status"><span class="badge badge-soft-success text-uppercase">Active</span>
                                                        </td>
                                                        <td>
                                                            <ul class="list-inline hstack gap-2 mb-0">
                                                                <li class="list-inline-item edit" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="Edit">
                                                                    <a href="#showModal" data-bs-toggle="modal" class="text-primary d-inline-block edit-item-btn">
                                                                        <i class="ri-pencil-fill fs-16"></i>
                                                                    </a>
                                                                </li>
                                                                <li class="list-inline-item" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="Remove">
                                                                    <a class="text-danger d-inline-block remove-item-btn" data-bs-toggle="modal" href="#deleteRecordModal">
                                                                        <i class="ri-delete-bin-5-fill fs-16"></i>
                                                                    </a>
                                                                </li>
                                                            </ul>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <div class="noresult" style="display: none">
                                                <div class="text-center">
                                                    <lord-icon src="https://cdn.lordicon.com/msoeawqm.json" trigger="loop" colors="primary:#121331,secondary:#08a88a" style="width:75px;height:75px"></lord-icon>
                                                    <h5 class="mt-2">Sorry! No Result Found</h5>
                                                    <p class="text-muted mb-0">We've searched more than 150+ customer We did not find any customer for you search.</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="d-flex justify-content-end">
                                            <div class="pagination-wrap hstack gap-2">
                                                <a class="page-item pagination-prev disabled" href="#">
                                                    Previous
                                                </a>
                                                <ul class="pagination listjs-pagination mb-0"></ul>
                                                <a class="page-item pagination-next" href="#">
                                                    Next
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal fade" id="showModal" tabindex="-1" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header bg-light p-3">
                                                    <h5 class="modal-title" id="exampleModalLabel"></h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="close-modal"></button>
                                                </div>
                                                <form class="tablelist-form" autocomplete="off">
                                                    <div class="modal-body">
                                                        <input type="hidden" id="id-field" />

                                                        <div class="mb-3" id="modal-id" style="display: none;">
                                                            <label for="id-field1" class="form-label">ID</label>
                                                            <input type="text" id="id-field1" class="form-control" placeholder="ID" readonly="" />
                                                        </div>

                                                        <div class="mb-3">
                                                            <label for="customername-field" class="form-label">Customer Name</label>
                                                            <input type="text" id="customername-field" class="form-control" placeholder="Enter name" required="" />
                                                            <div class="invalid-feedback">Please enter a customer name.</div>
                                                        </div>

                                                        <div class="mb-3">
                                                            <label for="email-field" class="form-label">Email</label>
                                                            <input type="email" id="email-field" class="form-control" placeholder="Enter email" required="" />
                                                            <div class="invalid-feedback">Please enter an email.</div>
                                                        </div>

                                                        <div class="mb-3">
                                                            <label for="phone-field" class="form-label">Phone</label>
                                                            <input type="text" id="phone-field" class="form-control" placeholder="Enter phone no." required="" />
                                                            <div class="invalid-feedback">Please enter a phone.</div>
                                                        </div>

                                                        <div class="mb-3">
                                                            <label for="date-field" class="form-label">Joining Date</label>
                                                            <input type="date" id="date-field" class="form-control" data-provider="flatpickr" data-date-format="d M, Y" required="" placeholder="Select date" />
                                                            <div class="invalid-feedback">Please select a date.</div>
                                                        </div>

                                                        <div>
                                                            <label for="status-field" class="form-label">Status</label>
                                                            <select class="form-control" data-choices="" data-choices-search-false="" name="status-field" id="status-field"  required="">
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
                                                    <button type="button" class="btn-close" id="deleteRecord-close" data-bs-dismiss="modal" aria-label="Close" ></button>  
                                                    <!--  <button type="button" class="btn-close" id="deleteRecord-close" data-bs-dismiss="modal" aria-label="Close" id="btn-close"></button>   -->
                                                </div>
                                                <div class="modal-body">
                                                    <div class="mt-2 text-center">
                                                        <lord-icon src="https://cdn.lordicon.com/gsqxdxog.json" trigger="loop" colors="primary:#f7b84b,secondary:#f06548" style="width:100px;height:100px"></lord-icon>
                                                        <div class="mt-4 pt-2 fs-15 mx-4 mx-sm-5">
                                                            <h4>Are you sure ?</h4>
                                                            <p class="text-muted mx-4 mb-0">Are you sure you want to remove this record ?</p>
                                                        </div>
                                                    </div>
                                                    <div class="d-flex gap-2 justify-content-center mt-4 mb-2">
                                                        <button type="button" class="btn w-sm btn-light" data-bs-dismiss="modal">Close</button>
                                                        <button type="button" class="btn w-sm btn-danger" id="delete-record">Yes, Delete It!</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--end modal -->
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

        <!-- list.js min js -->
        <script src="{$path}/libs/list.js/list.min.js"></script>
        <script src="{$path}/libs/list.pagination.js/list.pagination.min.js"></script>

        <!--ecommerce-customer init js -->
        <script src="{$themePath}/assets/js/pages/ecommerce-customer-list.init.js"></script>

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
  <xsl:include href="../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1515664208567"/>
<xsl:include href="../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1515664208567"/>

</xsl:stylesheet>
