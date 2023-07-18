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
                    
                    <div class="row">
                        <div class="col-xl-9">
                            <div class="card">
                                <div class="card-header">
                                    <div class="d-flex align-items-center">
                                        <h5 class="card-title flex-grow-1 mb-0">Order #VL2667</h5>
                                        <div class="flex-shrink-0">
                                            <a href="apps-invoices-details.html" class="btn btn-success btn-sm"><i class="ri-download-2-fill align-middle me-1"></i> Invoice</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive table-card">
                                        <table class="table table-nowrap align-middle table-borderless mb-0">
                                            <thead class="table-light text-muted">
                                                <tr>
                                                    <th scope="col">Product Details</th>
                                                    <th scope="col">Item Price</th>
                                                    <th scope="col">Quantity</th>
                                                    <th scope="col">Rating</th>
                                                    <th scope="col" class="text-end">Total Amount</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <div class="d-flex">
                                                            <div class="flex-shrink-0 avatar-md bg-light rounded p-1">
                                                                <img src="{$themePath}/assets/images/products/img-8.png" alt="" class="img-fluid d-block"/>
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h5 class="fs-15"><a href="IGRP-ecommerce-products-details.xml" class="link-primary">Sweatshirt for Men (Pink)</a></h5>
                                                                <p class="text-muted mb-0">Color: <span class="fw-medium">Pink</span></p>
                                                                <p class="text-muted mb-0">Size: <span class="fw-medium">M</span></p>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>$119.99</td>
                                                    <td>02</td>
                                                    <td>
                                                        <div class="text-warning fs-15">
                                                            <i class="ri-star-fill"></i><i class="ri-star-fill"></i><i class="ri-star-fill"></i><i class="ri-star-fill"></i><i class="ri-star-half-fill"></i>
                                                        </div>
                                                    </td>
                                                    <td class="fw-medium text-end">
                                                        $239.98
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="d-flex">
                                                            <div class="flex-shrink-0 avatar-md bg-light rounded p-1">
                                                                <img src="{$themePath}/assets/images/products/img-7.png" alt="" class="img-fluid d-block"/>
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h5 class="fs-15"><a href="IGRP-ecommerce-products-details.xml" class="link-primary">Noise NoiseFit Endure Smart Watch</a></h5>
                                                                <p class="text-muted mb-0">Color: <span class="fw-medium">Black</span></p>
                                                                <p class="text-muted mb-0">Size: <span class="fw-medium">32.5mm</span></p>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>$94.99</td>
                                                    <td>01</td>
                                                    <td>
                                                        <div class="text-warning fs-15">
                                                            <i class="ri-star-fill"></i><i class="ri-star-fill"></i><i class="ri-star-fill"></i><i class="ri-star-fill"></i><i class="ri-star-half-fill"></i>
                                                        </div>
                                                    </td>
                                                    <td class="fw-medium text-end">
                                                        $94.99
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="d-flex">
                                                            <div class="flex-shrink-0 avatar-md bg-light rounded p-1">
                                                                <img src="{$themePath}/assets/images/products/img-3.png" alt="" class="img-fluid d-block"/>
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h5 class="fs-15"><a href="IGRP-ecommerce-products-details.xml" class="link-primary">350 ml Glass Grocery Container</a></h5>
                                                                <p class="text-muted mb-0">Color: <span class="fw-medium">White</span></p>
                                                                <p class="text-muted mb-0">Size: <span class="fw-medium">350 ml</span></p>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>$24.99</td>
                                                    <td>01</td>
                                                    <td>
                                                        <div class="text-warning fs-15">
                                                            <i class="ri-star-fill"></i><i class="ri-star-fill"></i><i class="ri-star-half-fill"></i><i class="ri-star-line"></i><i class="ri-star-line"></i>
                                                        </div>
                                                    </td>
                                                    <td class="fw-medium text-end">
                                                        $24.99
                                                    </td>
                                                </tr>
                                                <tr class="border-top border-top-dashed">
                                                    <td colspan="3"></td>
                                                    <td colspan="2" class="fw-medium p-0">
                                                        <table class="table table-borderless mb-0">
                                                            <tbody>
                                                                <tr>
                                                                    <td>Sub Total :</td>
                                                                    <td class="text-end">$359.96</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Discount <span class="text-muted">(VELZON15)</span> : :</td>
                                                                    <td class="text-end">-$53.99</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Shipping Charge :</td>
                                                                    <td class="text-end">$65.00</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Estimated Tax :</td>
                                                                    <td class="text-end">$44.99</td>
                                                                </tr>
                                                                <tr class="border-top border-top-dashed">
                                                                    <th scope="row">Total (USD) :</th>
                                                                    <th class="text-end">$415.96</th>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <!--end card-->
                            <div class="card">
                                <div class="card-header">
                                    <div class="d-sm-flex align-items-center">
                                        <h5 class="card-title flex-grow-1 mb-0">Order Status</h5>
                                        <div class="flex-shrink-0 mt-2 mt-sm-0">
                                            <a href="javasccript:void(0;)" class="btn btn-soft-info btn-sm mt-2 mt-sm-0"><i class="ri-map-pin-line align-middle me-1"></i> Change Address</a>
                                            <a href="javasccript:void(0;)" class="btn btn-soft-danger btn-sm mt-2 mt-sm-0"><i class="mdi mdi-archive-remove-outline align-middle me-1"></i> Cancel Order</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="profile-timeline">
                                        <div class="accordion accordion-flush" id="accordionFlushExample">
                                            <div class="accordion-item border-0">
                                                <div class="accordion-header" id="headingOne">
                                                    <a class="accordion-button p-2 shadow-none" data-bs-toggle="collapse" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                                        <div class="d-flex align-items-center">
                                                            <div class="flex-shrink-0 avatar-xs">
                                                                <div class="avatar-title bg-success rounded-circle">
                                                                    <i class="ri-shopping-bag-line"></i>
                                                                </div>
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h6 class="fs-15 mb-0 fw-semibold">Order Placed - <span class="fw-normal">Wed, 15 Dec 2021</span></h6>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </div>
                                                <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                                                    <div class="accordion-body ms-2 ps-5 pt-0">
                                                        <h6 class="mb-1">An order has been placed.</h6>
                                                        <p class="text-muted">Wed, 15 Dec 2021 - 05:34PM</p>

                                                        <h6 class="mb-1">Seller has proccessed your order.</h6>
                                                        <p class="text-muted mb-0">Thu, 16 Dec 2021 - 5:48AM</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="accordion-item border-0">
                                                <div class="accordion-header" id="headingTwo">
                                                    <a class="accordion-button p-2 shadow-none" data-bs-toggle="collapse" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                                        <div class="d-flex align-items-center">
                                                            <div class="flex-shrink-0 avatar-xs">
                                                                <div class="avatar-title bg-success rounded-circle">
                                                                    <i class="mdi mdi-gift-outline"></i>
                                                                </div>
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h6 class="fs-15 mb-1 fw-semibold">Packed - <span class="fw-normal">Thu, 16 Dec 2021</span></h6>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </div>
                                                <div id="collapseTwo" class="accordion-collapse collapse show" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                                                    <div class="accordion-body ms-2 ps-5 pt-0">
                                                        <h6 class="mb-1">Your Item has been picked up by courier patner</h6>
                                                        <p class="text-muted mb-0">Fri, 17 Dec 2021 - 9:45AM</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="accordion-item border-0">
                                                <div class="accordion-header" id="headingThree">
                                                    <a class="accordion-button p-2 shadow-none" data-bs-toggle="collapse" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                                        <div class="d-flex align-items-center">
                                                            <div class="flex-shrink-0 avatar-xs">
                                                                <div class="avatar-title bg-success rounded-circle">
                                                                    <i class="ri-truck-line"></i>
                                                                </div>
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h6 class="fs-15 mb-1 fw-semibold">Shipping - <span class="fw-normal">Thu, 16 Dec 2021</span></h6>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </div>
                                                <div id="collapseThree" class="accordion-collapse collapse show" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                                                    <div class="accordion-body ms-2 ps-5 pt-0">
                                                        <h6 class="fs-14">RQK Logistics - MFDS1400457854</h6>
                                                        <h6 class="mb-1">Your item has been shipped.</h6>
                                                        <p class="text-muted mb-0">Sat, 18 Dec 2021 - 4.54PM</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="accordion-item border-0">
                                                <div class="accordion-header" id="headingFour">
                                                    <a class="accordion-button p-2 shadow-none" data-bs-toggle="collapse" href="#collapseFour" aria-expanded="false">
                                                        <div class="d-flex align-items-center">
                                                            <div class="flex-shrink-0 avatar-xs">
                                                                <div class="avatar-title bg-light text-success rounded-circle">
                                                                    <i class="ri-takeaway-fill"></i>
                                                                </div>
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h6 class="fs-14 mb-0 fw-semibold">Out For Delivery</h6>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="accordion-item border-0">
                                                <div class="accordion-header" id="headingFive">
                                                    <a class="accordion-button p-2 shadow-none" data-bs-toggle="collapse" href="#collapseFile" aria-expanded="false">
                                                        <div class="d-flex align-items-center">
                                                            <div class="flex-shrink-0 avatar-xs">
                                                                <div class="avatar-title bg-light text-success rounded-circle">
                                                                    <i class="mdi mdi-package-variant"></i>
                                                                </div>
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h6 class="fs-14 mb-0 fw-semibold">Delivered</h6>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <!--end accordion-->
                                    </div>
                                </div>
                            </div>
                            <!--end card-->
                        </div>
                        <!--end col-->
                        <div class="col-xl-3">
                            <div class="card">
                                <div class="card-header">
                                    <div class="d-flex">
                                        <h5 class="card-title flex-grow-1 mb-0"><i class="mdi mdi-truck-fast-outline align-middle me-1 text-muted"></i> Logistics Details</h5>
                                        <div class="flex-shrink-0">
                                            <a href="javascript:void(0);" class="badge badge-soft-primary fs-11">Track Order</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="text-center">
                                        <lord-icon src="https://cdn.lordicon.com/uetqnvvg.json" trigger="loop" colors="primary:#405189,secondary:#0ab39c" style="width:80px;height:80px"></lord-icon>
                                        <h5 class="fs-16 mt-2">RQK Logistics</h5>
                                        <p class="text-muted mb-0">ID: MFDS1400457854</p>
                                        <p class="text-muted mb-0">Payment Mode : Debit Card</p>
                                    </div>
                                </div>
                            </div>
                            <!--end card-->

                            <div class="card">
                                <div class="card-header">
                                    <div class="d-flex">
                                        <h5 class="card-title flex-grow-1 mb-0">Customer Details</h5>
                                        <div class="flex-shrink-0">
                                            <a href="javascript:void(0);" class="link-secondary">View Profile</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <ul class="list-unstyled mb-0 vstack gap-3">
                                        <li>
                                            <div class="d-flex align-items-center">
                                                <div class="flex-shrink-0">
                                                    <img src="{$themePath}/assets/images/users/avatar-3.jpg" alt="" class="avatar-sm rounded"/>
                                                </div>
                                                <div class="flex-grow-1 ms-3">
                                                    <h6 class="fs-14 mb-1">Joseph Parkers</h6>
                                                    <p class="text-muted mb-0">Customer</p>
                                                </div>
                                            </div>
                                        </li>
                                        <li><i class="ri-mail-line me-2 align-middle text-muted fs-16"></i>josephparker@gmail.com</li>
                                        <li><i class="ri-phone-line me-2 align-middle text-muted fs-16"></i>+(256) 245451 441</li>
                                    </ul>
                                </div>
                            </div>
                            <!--end card-->
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="card-title mb-0"><i class="ri-map-pin-line align-middle me-1 text-muted"></i> Billing Address</h5>
                                </div>
                                <div class="card-body">
                                    <ul class="list-unstyled vstack gap-2 fs-13 mb-0">
                                        <li class="fw-medium fs-14">Joseph Parker</li>
                                        <li>+(256) 245451 451</li>
                                        <li>2186 Joyce Street Rocky Mount</li>
                                        <li>New York - 25645</li>
                                        <li>United States</li>
                                    </ul>
                                </div>
                            </div>
                            <!--end card-->
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="card-title mb-0"><i class="ri-map-pin-line align-middle me-1 text-muted"></i> Shipping Address</h5>
                                </div>
                                <div class="card-body">
                                    <ul class="list-unstyled vstack gap-2 fs-13 mb-0">
                                        <li class="fw-medium fs-14">Joseph Parker</li>
                                        <li>+(256) 245451 451</li>
                                        <li>2186 Joyce Street Rocky Mount</li>
                                        <li>California - 24567</li>
                                        <li>United States</li>
                                    </ul>
                                </div>
                            </div>
                            <!--end card-->

                            <div class="card">
                                <div class="card-header">
                                    <h5 class="card-title mb-0"><i class="ri-secure-payment-line align-bottom me-1 text-muted"></i> Payment Details</h5>
                                </div>
                                <div class="card-body">
                                    <div class="d-flex align-items-center mb-2">
                                        <div class="flex-shrink-0">
                                            <p class="text-muted mb-0">Transactions:</p>
                                        </div>
                                        <div class="flex-grow-1 ms-2">
                                            <h6 class="mb-0">#VLZ124561278124</h6>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center mb-2">
                                        <div class="flex-shrink-0">
                                            <p class="text-muted mb-0">Payment Method:</p>
                                        </div>
                                        <div class="flex-grow-1 ms-2">
                                            <h6 class="mb-0">Debit Card</h6>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center mb-2">
                                        <div class="flex-shrink-0">
                                            <p class="text-muted mb-0">Card Holder Name:</p>
                                        </div>
                                        <div class="flex-grow-1 ms-2">
                                            <h6 class="mb-0">Joseph Parker</h6>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center mb-2">
                                        <div class="flex-shrink-0">
                                            <p class="text-muted mb-0">Card Number:</p>
                                        </div>
                                        <div class="flex-grow-1 ms-2">
                                            <h6 class="mb-0">xxxx xxxx xxxx 2456</h6>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center">
                                        <div class="flex-shrink-0">
                                            <p class="text-muted mb-0">Total Amount:</p>
                                        </div>
                                        <div class="flex-grow-1 ms-2">
                                            <h6 class="mb-0">$415.96</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--end card-->
                        </div>
                        <!--end col-->
                    </div>
                    <!--end row-->

                </div><!-- container-fluid -->
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

</xsl:stylesheet>
