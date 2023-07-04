<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "entity-value">
]>
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
                        <div class="card" id="orderList">
                          <div class="card-header border-0">
                            <div class="row align-items-center gy-3">
                              <div class="col-sm">
                                <h5 class="card-title mb-0">Order History</h5>
                              </div>
                              <div class="col-sm-auto">
                                <div class="d-flex gap-1 flex-wrap">
                                  <button type="button" class="btn btn-success add-btn" data-bs-toggle="modal" id="create-btn" data-bs-target="#showModal">
                                    <i class="ri-add-line align-bottom me-1"></i> Create Order</button>
                                  <button type="button" class="btn btn-info">
                                    <i class="ri-file-download-line align-bottom me-1"></i> Import</button>
                                  <button class="btn btn-soft-danger" id="remove-actions" onClick="deleteMultiple()">
                                    <i class="ri-delete-bin-2-line"></i>
                                  </button>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="card-body border border-dashed border-end-0 border-start-0">
                            <form>
                              <div class="row g-3">
                                <div class="col-xxl-5 col-sm-6">
                                  <div class="search-box">
                                    <input type="text" class="form-control search" placeholder="Search for order ID, customer, order status or something..."/>
                                    <i class="ri-search-line search-icon"></i>
                                  </div>
                                </div>
                                <!--end col-->
                                <div class="col-xxl-2 col-sm-6">
                                  <div>
                                    <input type="text" class="form-control" data-provider="flatpickr" data-date-format="d M, Y" data-range-date="true" id="demo-datepicker" placeholder="Select date"/>
                                  </div>
                                </div>
                                <!--end col-->
                                <div class="col-xxl-2 col-sm-4">
                                  <div>
                                    <select class="form-control" data-choices="" data-choices-search-false="" name="choices-single-default" id="idStatus">
                                      <option value="">Status</option>
                                      <option value="all" selected="">All</option>
                                      <option value="Pending">Pending</option>
                                      <option value="Inprogress">Inprogress</option>
                                      <option value="Cancelled">Cancelled</option>
                                      <option value="Pickups">Pickups</option>
                                      <option value="Returns">Returns</option>
                                      <option value="Delivered">Delivered</option>
                                    </select>
                                  </div>
                                </div>
                                <!--end col-->
                                <div class="col-xxl-2 col-sm-4">
                                  <div>
                                    <select class="form-control" data-choices="" data-choices-search-false="" name="choices-single-default" id="idPayment">
                                      <option value="">Select Payment</option>
                                      <option value="all" selected="">All</option>
                                      <option value="Mastercard">Mastercard</option>
                                      <option value="Paypal">Paypal</option>
                                      <option value="Visa">Visa</option>
                                      <option value="COD">COD</option>
                                    </select>
                                  </div>
                                </div>
                                <!--end col-->
                                <div class="col-xxl-1 col-sm-4">
                                  <div>
                                    <button type="button" class="btn btn-primary w-100" onclick="SearchData();">
                                      <i class="ri-equalizer-fill me-1 align-bottom"></i>
                                                        Filters
                                    </button>
                                  </div>
                                </div>
                                <!--end col-->
                              </div>
                              <!--end row-->
                            </form>
                          </div>
                          <div class="card-body pt-0">
                            <div>
                              <ul class="nav nav-tabs nav-tabs-custom nav-success mb-3" role="tablist">
                                <li class="nav-item">
                                  <a class="nav-link active All py-3" data-bs-toggle="tab" id="All" href="#home1" role="tab" aria-selected="true">
                                    <i class="ri-store-2-fill me-1 align-bottom"></i> All Orders
                                  </a>
                                </li>
                                <li class="nav-item">
                                  <a class="nav-link py-3 Delivered" data-bs-toggle="tab" id="Delivered" href="#delivered" role="tab" aria-selected="false">
                                    <i class="ri-checkbox-circle-line me-1 align-bottom"></i> Delivered
                                  </a>
                                </li>
                                <li class="nav-item">
                                  <a class="nav-link py-3 Pickups" data-bs-toggle="tab" id="Pickups" href="#pickups" role="tab" aria-selected="false">
                                    <i class="ri-truck-line me-1 align-bottom"></i> Pickups <span class="badge bg-danger align-middle ms-1">2</span>
                                  </a>
                                </li>
                                <li class="nav-item">
                                  <a class="nav-link py-3 Returns" data-bs-toggle="tab" id="Returns" href="#returns" role="tab" aria-selected="false">
                                    <i class="ri-arrow-left-right-fill me-1 align-bottom"></i> Returns
                                  </a>
                                </li>
                                <li class="nav-item">
                                  <a class="nav-link py-3 Cancelled" data-bs-toggle="tab" id="Cancelled" href="#cancelled" role="tab" aria-selected="false">
                                    <i class="ri-close-circle-line me-1 align-bottom"></i> Cancelled
                                  </a>
                                </li>
                              </ul>

                              <div class="table-responsive table-card mb-1">
                                <table class="table table-nowrap align-middle" id="orderTable">
                                  <thead class="text-muted table-light">
                                    <tr class="text-uppercase">
                                      <th scope="col" style="width: 25px;">
                                        <div class="form-check">
                                          <input class="form-check-input" type="checkbox" id="checkAll" value="option"/>
                                        </div>
                                      </th>
                                      <th class="sort" data-sort="id">Order ID</th>
                                      <th class="sort" data-sort="customer_name">Customer</th>
                                      <th class="sort" data-sort="product_name">Product</th>
                                      <th class="sort" data-sort="date">Order Date</th>
                                      <th class="sort" data-sort="amount">Amount</th>
                                      <th class="sort" data-sort="payment">Payment Method</th>
                                      <th class="sort" data-sort="status">Delivery Status</th>
                                      <th class="sort" data-sort="city">Action</th>
                                    </tr>
                                  </thead>
                                  <tbody class="list form-check-all">
                                    <tr>
                                      <th scope="row">
                                        <div class="form-check">
                                          <input class="form-check-input" type="checkbox" name="checkAll" value="option1"/>
                                        </div>
                                      </th>
                                      <td class="id">
                                        <a href="apps-ecommerce-order-details.html" class="fw-medium link-primary">#VZ2101</a>
                                      </td>
                                      <td class="customer_name">Frank Hook</td>
                                      <td class="product_name">Puma Tshirt</td>
                                      <td class="date">20 Dec, 2021, <small class="text-muted">02:21 AM</small>
                                      </td>
                                      <td class="amount">$654</td>
                                      <td class="payment">Mastercard</td>
                                      <td class="status">
                                        <span class="badge badge-soft-warning text-uppercase">Pending</span>
                                      </td>
                                      <td>
                                        <ul class="list-inline hstack gap-2 mb-0">
                                          <li class="list-inline-item" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="View">
                                            <a href="apps-ecommerce-order-details.html" class="text-primary d-inline-block">
                                              <i class="ri-eye-fill fs-16"></i>
                                            </a>
                                          </li>
                                          <li class="list-inline-item edit" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="Edit">
                                            <a href="#showModal" data-bs-toggle="modal" class="text-primary d-inline-block edit-item-btn">
                                              <i class="ri-pencil-fill fs-16"></i>
                                            </a>
                                          </li>
                                          <li class="list-inline-item" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="Remove">
                                            <a class="text-danger d-inline-block remove-item-btn" data-bs-toggle="modal" href="#deleteOrder">
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
                                    <lord-icon src="https://cdn.lordicon.com/msoeawqm.json" trigger="loop" colors="primary:#405189,secondary:#0ab39c" style="width:75px;height:75px"></lord-icon>
                                    <h5 class="mt-2">Sorry! No Result Found</h5>
                                    <p class="text-muted">We've searched more than 150+ Orders We did not find any orders for you search.</p>
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
                            <div class="modal fade" id="showModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                              <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                  <div class="modal-header bg-light p-3">
                                    <h5 class="modal-title" id="exampleModalLabel">&nbsp;</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="close-modal"></button>
                                  </div>
                                  <form class="tablelist-form" autocomplete="off">
                                    <div class="modal-body">
                                      <input type="hidden" id="id-field" />

                                      <div class="mb-3" id="modal-id">
                                        <label for="orderId" class="form-label">ID</label>
                                        <input type="text" id="orderId" class="form-control" placeholder="ID" readonly="" />
                                      </div>

                                      <div class="mb-3">
                                        <label for="customername-field" class="form-label">Customer Name</label>
                                        <input type="text" id="customername-field" class="form-control" placeholder="Enter name" required="" />
                                      </div>

                                      <div class="mb-3">
                                        <label for="productname-field" class="form-label">Product</label>
                                        <select class="form-control" data-trigger="" name="productname-field" id="productname-field" required="">
                                          <option value="">Product</option>
                                          <option value="Puma Tshirt">Puma Tshirt</option>
                                          <option value="Adidas Sneakers">Adidas Sneakers</option>
                                          <option value="350 ml Glass Grocery Container">350 ml Glass Grocery Container</option>
                                          <option value="American egale outfitters Shirt">American egale outfitters Shirt</option>
                                          <option value="Galaxy Watch4">Galaxy Watch4</option>
                                          <option value="Apple iPhone 12">Apple iPhone 12</option>
                                          <option value="Funky Prints T-shirt">Funky Prints T-shirt</option>
                                          <option value="USB Flash Drive Personalized with 3D Print">USB Flash Drive Personalized with 3D Print</option>
                                          <option value="Oxford Button-Down Shirt">Oxford Button-Down Shirt</option>
                                          <option value="Classic Short Sleeve Shirt">Classic Short Sleeve Shirt</option>
                                          <option value="Half Sleeve T-Shirts (Blue)">Half Sleeve T-Shirts (Blue)</option>
                                          <option value="Noise Evolve Smartwatch">Noise Evolve Smartwatch</option>
                                        </select>
                                      </div>

                                      <div class="mb-3">
                                        <label for="date-field" class="form-label">Order Date</label>
                                        <input type="date" id="date-field" class="form-control" data-provider="flatpickr" required="" data-date-format="d M, Y" data-enable-time="" placeholder="Select date" />
                                      </div>

                                      <div class="row gy-4 mb-3">
                                        <div class="col-md-6">
                                          <div>
                                            <label for="amount-field" class="form-label">Amount</label>
                                            <input type="text" id="amount-field" class="form-control" placeholder="Total amount" required="" />
                                          </div>
                                        </div>
                                        <div class="col-md-6">
                                          <div>
                                            <label for="payment-field" class="form-label">Payment Method</label>
                                            <select class="form-control" data-trigger="" name="payment-method" required="" id="payment-field">
                                              <option value="">Payment Method</option>
                                              <option value="Mastercard">Mastercard</option>
                                              <option value="Visa">Visa</option>
                                              <option value="COD">COD</option>
                                              <option value="Paypal">Paypal</option>
                                            </select>
                                          </div>
                                        </div>
                                      </div>

                                      <div>
                                        <label for="delivered-status" class="form-label">Delivery Status</label>
                                        <select class="form-control" data-trigger="" name="delivered-status" required="" id="delivered-status">
                                          <option value="">Delivery Status</option>
                                          <option value="Pending">Pending</option>
                                          <option value="Inprogress">Inprogress</option>
                                          <option value="Cancelled">Cancelled</option>
                                          <option value="Pickups">Pickups</option>
                                          <option value="Delivered">Delivered</option>
                                          <option value="Returns">Returns</option>
                                        </select>
                                      </div>
                                    </div>
                                    <div class="modal-footer">
                                      <div class="hstack gap-2 justify-content-end">
                                        <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-success" id="add-btn">Add Order</button>
                                        <!-- <button type="button" class="btn btn-success" id="edit-btn">Update</button> -->
                                      </div>
                                    </div>
                                  </form>
                                </div>
                              </div>
                            </div>

                            <!-- Modal -->
                            <div class="modal fade flip" id="deleteOrder" tabindex="-1" aria-hidden="true">
                              <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                  <div class="modal-body p-5 text-center">
                                    <lord-icon src="https://cdn.lordicon.com/gsqxdxog.json" trigger="loop" colors="primary:#405189,secondary:#f06548" style="width:90px;height:90px"></lord-icon>
                                    <div class="mt-4 text-center">
                                      <h4>You are about to delete a order ?</h4>
                                      <p class="text-muted fs-15 mb-4">Deleting your order will remove all of your information from our database.</p>
                                      <div class="hstack gap-2 justify-content-center remove">
                                        <button class="btn btn-link link-success fw-medium text-decoration-none" id="deleteRecord-close" data-bs-dismiss="modal">
                                          <i class="ri-close-line me-1 align-middle"></i> Close</button>
                                        <button class="btn btn-danger" id="delete-record">Yes, Delete It</button>
                                      </div>
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

        <!--list pagination js-->
        <script src="{$path}/libs/list.pagination.js/list.pagination.min.js"></script>

        <!-- ecommerce-order init js -->
        <script src="{$themePath}/assets/js/pages/ecommerce-order.init.js"></script>
        <!-- TODO Order init couldn't find choice -->

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
