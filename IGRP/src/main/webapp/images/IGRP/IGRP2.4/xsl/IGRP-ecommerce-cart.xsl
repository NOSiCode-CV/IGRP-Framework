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

                                        <div class="row mb-3">
                                            <div class="col-xl-8">
                                                <div class="row align-items-center gy-3 mb-3">
                                                    <div class="col-sm">
                                                        <div>
                                                            <h5 class="fs-14 mb-0">Your Cart (03 items)</h5>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-auto">
                                                        <a href="apps-ecommerce-products.html" class="link-primary text-decoration-underline">Continue Shopping</a>
                                                    </div>
                                                </div>

                                                <div class="card product">
                                                    <div class="card-body">
                                                        <div class="row gy-3">
                                                            <div class="col-sm-auto">
                                                                <div class="avatar-lg bg-light rounded p-1">
                                                                    <img src="{$themePath}/assets/images/products/img-8.png" alt="" class="img-fluid d-block"/>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm">
                                                                <h5 class="fs-14 text-truncate">
                                                                    <a href="ecommerce-product-detail.html" class="text-dark">Sweatshirt for Men (Pink)</a>
                                                                </h5>
                                                                <ul class="list-inline text-muted">
                                                                    <li class="list-inline-item">Color : <span class="fw-medium">Pink</span>
                                                                    </li>
                                                                    <li class="list-inline-item">Size : <span class="fw-medium">M</span>
                                                                    </li>
                                                                </ul>

                                                                <div class="input-step">
                                                                    <button type="button" class="minus">–</button>
                                                                    <input type="number" class="product-quantity" value="2" min="0" max="100"/>
                                                                    <button type="button" class="plus">+</button>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-auto">
                                                                <div class="text-lg-end">
                                                                    <p class="text-muted mb-1">Item Price:</p>
                                                                    <h5 class="fs-14">$                                                                        <span id="ticket_price" class="product-price">119.99</span>
                                                                    </h5>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- card body -->
                                                    <div class="card-footer">
                                                        <div class="row align-items-center gy-3">
                                                            <div class="col-sm">
                                                                <div class="d-flex flex-wrap my-n1">
                                                                    <div>
                                                                        <a href="#" class="d-block text-body p-1 px-2" data-bs-toggle="modal" data-bs-target="#removeItemModal">
                                                                            <i class="ri-delete-bin-fill text-muted align-bottom me-1"></i> Remove</a>
                                                                    </div>
                                                                    <div>
                                                                        <a href="#" class="d-block text-body p-1 px-2">
                                                                            <i class="ri-star-fill text-muted align-bottom me-1"></i> Add Wishlist</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-auto">
                                                                <div class="d-flex align-items-center gap-2 text-muted">
                                                                    <div>Total :</div>
                                                                    <h5 class="fs-14 mb-0">$                                                                        <span class="product-line-price">239.98</span>
                                                                    </h5>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- end card footer -->
                                                </div>
                                                <!-- end card -->

                                                <div class="card product">
                                                    <div class="card-body">
                                                        <div class="row gy-3">
                                                            <div class="col-sm-auto">
                                                                <div class="avatar-lg bg-light rounded p-1">
                                                                    <img src="{$themePath}/assets/images/products/img-7.png" alt="" class="img-fluid d-block"/>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm">
                                                                <h5 class="fs-14 text-truncate">
                                                                    <a href="ecommerce-product-detail.html" class="text-dark">Noise NoiseFit Endure Smart Watch</a>
                                                                </h5>

                                                                <ul class="list-inline text-muted">
                                                                    <li class="list-inline-item">Color : <span class="fw-medium">Black</span>
                                                                    </li>
                                                                    <li class="list-inline-item">Size : <span class="fw-medium">32.5mm</span>
                                                                    </li>
                                                                </ul>

                                                                <div class="input-step">
                                                                    <button type="button" class="minus">–</button>
                                                                    <input type="number" class="product-quantity" value="1" min="0" max="100"/>
                                                                    <button type="button" class="plus">+</button>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-auto">
                                                                <div class="text-lg-end">
                                                                    <p class="text-muted mb-1">Item Price:</p>
                                                                    <h5 class="fs-14">$                                                                        <span class="product-price">94.99</span>
                                                                    </h5>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- card body -->
                                                    <div class="card-footer">
                                                        <div class="row align-items-center gy-3">
                                                            <div class="col-sm">
                                                                <div class="d-flex flex-wrap my-n1">
                                                                    <div>
                                                                        <a href="#" class="d-block text-body p-1 px-2" data-bs-toggle="modal" data-bs-target="#removeItemModal">
                                                                            <i class="ri-delete-bin-fill text-muted align-bottom me-1"></i> Remove</a>
                                                                    </div>
                                                                    <div>
                                                                        <a href="#" class="d-block text-body p-1 px-2">
                                                                            <i class="ri-star-fill text-muted align-bottom me-1"></i> Add Wishlist</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-auto">
                                                                <div class="d-flex align-items-center gap-2 text-muted">
                                                                    <div>Total :</div>
                                                                    <h5 class="fs-14 mb-0">$                                                                        <span class="product-line-price">94.99</span>
                                                                    </h5>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- end card footer -->
                                                </div>
                                                <!-- end card -->

                                                <div class="card product">
                                                    <div class="card-body">
                                                        <div class="row gy-3">
                                                            <div class="col-sm-auto">
                                                                <div class="avatar-lg bg-light rounded p-1">
                                                                    <img src="{$themePath}/assets/images/products/img-3.png" alt="" class="img-fluid d-block"/>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm">
                                                                <h5 class="fs-14 text-truncate">
                                                                    <a href="ecommerce-product-detail.html" class="text-dark">350 ml Glass Grocery Container</a>
                                                                </h5>

                                                                <ul class="list-inline text-muted">
                                                                    <li class="list-inline-item">Color : <span class="fw-medium">White</span>
                                                                    </li>
                                                                    <li class="list-inline-item">Size : <span class="fw-medium">350 ml</span>
                                                                    </li>
                                                                </ul>

                                                                <div class="input-step">
                                                                    <button type="button" class="minus">–</button>
                                                                    <input type="number" class="product-quantity" value="1" min="0" max="100"/>
                                                                    <button type="button" class="plus">+</button>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-auto">
                                                                <div class="text-lg-end">
                                                                    <p class="text-muted mb-1">Item Price:</p>
                                                                    <h5 class="fs-14">$                                                                        <span class="product-price">24.99</span>
                                                                    </h5>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- card body -->
                                                    <div class="card-footer">
                                                        <div class="row align-items-center gy-3">
                                                            <div class="col-sm">
                                                                <div class="d-flex flex-wrap my-n1">
                                                                    <div>
                                                                        <a href="#" class="d-block text-body p-1 px-2" data-bs-toggle="modal" data-bs-target="#removeItemModal">
                                                                            <i class="ri-delete-bin-fill text-muted align-bottom me-1"></i> Remove</a>
                                                                    </div>
                                                                    <div>
                                                                        <a href="#" class="d-block text-body p-1 px-2">
                                                                            <i class="ri-star-fill text-muted align-bottom me-1"></i> Add Wishlist</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-auto">
                                                                <div class="d-flex align-items-center gap-2 text-muted">
                                                                    <div>Total :</div>
                                                                    <h5 class="fs-14 mb-0">$                                                                        <span class="product-line-price">24.99</span>
                                                                    </h5>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- end card footer -->
                                                </div>
                                                <!-- end card -->


                                                <div class="text-end mb-4">
                                                    <a href="apps-ecommerce-checkout.html" class="btn btn-success btn-label right ms-auto">
                                                        <i class="ri-arrow-right-line label-icon align-bottom fs-16 ms-2"></i> Checkout</a>
                                                </div>
                                            </div>
                                            <!-- end col -->

                                            <div class="col-xl-4">
                                                <div class="sticky-side-div">
                                                    <div class="card">
                                                        <div class="card-header border-bottom-dashed">
                                                            <h5 class="card-title mb-0">Order Summary</h5>
                                                        </div>
                                                        <div class="card-header bg-soft-light border-bottom-dashed">
                                                            <div class="text-center">
                                                                <h6 class="mb-2">Have a <span class="fw-semibold">promo</span> code ?</h6>
                                                            </div>
                                                            <div class="hstack gap-3 px-3 mx-n3">
                                                                <input class="form-control me-auto" type="text" placeholder="Enter coupon code" aria-label="Add Promo Code here..."/>
                                                                <button type="button" class="btn btn-success w-xs">Apply</button>
                                                            </div>
                                                        </div>
                                                        <div class="card-body pt-2">
                                                            <div class="table-responsive">
                                                                <table class="table table-borderless mb-0">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td>Sub Total :</td>
                                                                            <td class="text-end" id="cart-subtotal">$ 359.96</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>Discount <span class="text-muted">(VELZON15)</span> : 
                                                                            </td>
                                                                            <td class="text-end" id="cart-discount">- $ 53.99</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>Shipping Charge :</td>
                                                                            <td class="text-end" id="cart-shipping">$ 65.00</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>Estimated Tax (12.5%) : </td>
                                                                            <td class="text-end" id="cart-tax">$ 44.99</td>
                                                                        </tr>
                                                                        <tr class="table-active">
                                                                            <th>Total (USD) :</th>
                                                                            <td class="text-end">
                                                                                <span class="fw-semibold" id="cart-total">
                                                                $415.96
                                                                                </span>
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                            <!-- end table-responsive -->
                                                        </div>
                                                    </div>

                                                    <div class="alert border-dashed alert-danger" role="alert">
                                                        <div class="d-flex align-items-center">
                                                            <lord-icon src="https://cdn.lordicon.com/nkmsrxys.json" trigger="loop" colors="primary:#121331,secondary:#f06548" style="width:80px;height:80px"></lord-icon>
                                                            <div class="ms-2">
                                                                <h5 class="fs-14 text-danger fw-semibold"> Buying for a loved one?</h5>
                                                                <p class="text-black mb-1">Gift wrap and personalised message on card, <br />
Only for <span class="fw-semibold">$9.99</span> USD </p>
                                                            <button type="button" class="btn ps-0 btn-sm btn-link text-danger text-uppercase">Add Gift Wrap</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- end stickey -->

                                        </div>
                                    </div>
                                    <!-- end row -->
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

            <!-- input step init -->
            <script src="{$themePath}/assets/js/pages/form-input-spin.init.js"></script>

            <!-- ecommerce cart js -->
            <script src="{$themePath}/assets/js/pages/ecommerce-cart.init.js"></script>

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
