<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "entity-value">
]>
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

                    <form id="createproduct-form" autocomplete="off" class="needs-validation" novalidate="">
                      <div class="row">
                        <div class="col-lg-8">
                          <div class="card">
                            <div class="card-body">
                              <div class="mb-3">
                                <label class="form-label" for="product-title-input">Product Title</label>
                                <input type="hidden" class="form-control" id="formAction" name="formAction" value="add"/>
                                <input type="text" class="form-control d-none" id="product-id-input"/>
                                <input type="text" class="form-control" id="product-title-input" value="" placeholder="Enter product title" required=""/>
                                <div class="invalid-feedback">Please Enter a product title.</div>
                              </div>
                              <div>
                                <label>Product Description</label>

                                <div id="ckeditor-classic">
                                  <p>Tommy Hilfiger men striped pink sweatshirt. Crafted with cotton. Material composition is 100% organic cotton. This is one of the world’s leading designer lifestyle brands and is internationally recognized for celebrating the essence of classic American cool style, featuring preppy with a twist designs.</p>
                                  <ul>
                                    <li>Full Sleeve</li>
                                    <li>Cotton</li>
                                    <li>All Sizes available</li>
                                    <li>4 Different Color</li>
                                  </ul>
                                </div>
                              </div>
                            </div>
                          </div>
                          <!-- end card -->

                          <div class="card">
                            <div class="card-header">
                              <h5 class="card-title mb-0">Product Gallery</h5>
                            </div>
                            <div class="card-body">
                              <div class="mb-4">
                                <h5 class="fs-14 mb-1">Product Image</h5>
                                <p class="text-muted">Add Product main Image.</p>
                                <div class="text-center">
                                  <div class="position-relative d-inline-block">
                                    <div class="position-absolute top-100 start-100 translate-middle">
                                      <label for="product-image-input" class="mb-0" data-bs-toggle="tooltip" data-bs-placement="right" title="Select Image">
                                        <div class="avatar-xs">
                                          <div class="avatar-title bg-light border rounded-circle text-muted cursor-pointer">
                                            <i class="ri-image-fill"></i>
                                          </div>
                                        </div>
                                      </label>
                                      <input class="form-control d-none" value="" id="product-image-input" type="file" accept="image/png, image/gif, image/jpeg"/>
                                    </div>
                                    <div class="avatar-lg">
                                      <div class="avatar-title bg-light rounded">
                                        <img src="" id="product-img" class="avatar-md h-auto" />
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                              <div>
                                <h5 class="fs-14 mb-1">Product Gallery</h5>
                                <p class="text-muted">Add Product Gallery Images.</p>

                                <div class="dropzone">
                                  <div class="fallback">
                                    <input name="file" type="file" multiple="multiple"/>
                                  </div>
                                  <div class="dz-message needsclick">
                                    <div class="mb-3">
                                      <i class="display-4 text-muted ri-upload-cloud-2-fill"></i>
                                    </div>

                                    <h5>Drop files here or click to upload.</h5>
                                  </div>
                                </div>

                                <ul class="list-unstyled mb-0" id="dropzone-preview">
                                  <li class="mt-2" id="dropzone-preview-list">
                                    <!-- This is used as the file preview template -->
                                    <div class="border rounded">
                                      <div class="d-flex p-2">
                                        <div class="flex-shrink-0 me-3">
                                          <div class="avatar-sm bg-light rounded">
                                            <img data-dz-thumbnail="" class="img-fluid rounded d-block" src="#" alt="Product-Image" />
                                          </div>
                                        </div>
                                        <div class="flex-grow-1">
                                          <div class="pt-1">
                                            <h5 class="fs-14 mb-1" data-dz-name="">&nbsp;</h5>
                                            <p class="fs-13 text-muted mb-0" data-dz-size=""></p>
                                            <strong class="error text-danger" data-dz-errormessage=""></strong>
                                          </div>
                                        </div>
                                        <div class="flex-shrink-0 ms-3">
                                          <button data-dz-remove="" class="btn btn-sm btn-danger">Delete</button>
                                        </div>
                                      </div>
                                    </div>
                                  </li>
                                </ul>
                                <!-- end dropzon-preview -->
                              </div>
                            </div>
                          </div>
                          <!-- end card -->

                          <div class="card">
                            <div class="card-header">
                              <ul class="nav nav-tabs-custom card-header-tabs border-bottom-0" role="tablist">
                                <li class="nav-item">
                                  <a class="nav-link active" data-bs-toggle="tab" href="#addproduct-general-info" role="tab">
                                                    General Info
                                  </a>
                                </li>
                                <li class="nav-item">
                                  <a class="nav-link" data-bs-toggle="tab" href="#addproduct-metadata" role="tab">
                                                    Meta Data
                                  </a>
                                </li>
                              </ul>
                            </div>
                            <!-- end card header -->
                            <div class="card-body">
                              <div class="tab-content">
                                <div class="tab-pane active" id="addproduct-general-info" role="tabpanel">
                                  <div class="row">
                                    <div class="col-lg-6">
                                      <div class="mb-3">
                                        <label class="form-label" for="manufacturer-name-input">Manufacturer Name</label>
                                        <input type="text" class="form-control" id="manufacturer-name-input" placeholder="Enter manufacturer name"/>
                                      </div>
                                    </div>
                                    <div class="col-lg-6">
                                      <div class="mb-3">
                                        <label class="form-label" for="manufacturer-brand-input">Manufacturer Brand</label>
                                        <input type="text" class="form-control" id="manufacturer-brand-input" placeholder="Enter manufacturer brand"/>
                                      </div>
                                    </div>
                                  </div>
                                  <!-- end row -->

                                  <div class="row">
                                    <div class="col-lg-3 col-sm-6">
                                      <div class="mb-3">
                                        <label class="form-label" for="stocks-input">Stocks</label>
                                        <input type="text" class="form-control" id="stocks-input" placeholder="Stocks" required=""/>
                                        <div class="invalid-feedback">Please Enter a product stocks.</div>
                                      </div>
                                    </div>
                                    <div class="col-lg-3 col-sm-6">
                                      <div class="mb-3">
                                        <label class="form-label" for="product-price-input">Price</label>
                                        <div class="input-group has-validation mb-3">
                                          <span class="input-group-text" id="product-price-addon">$</span>
                                          <input type="text" class="form-control" id="product-price-input" placeholder="Enter price" aria-label="Price" aria-describedby="product-price-addon" required=""/>
                                          <div class="invalid-feedback">Please Enter a product price.</div>
                                        </div>

                                      </div>
                                    </div>
                                    <div class="col-lg-3 col-sm-6">
                                      <div class="mb-3">
                                        <label class="form-label" for="product-discount-input">Discount</label>
                                        <div class="input-group mb-3">
                                          <span class="input-group-text" id="product-discount-addon">%</span>
                                          <input type="text" class="form-control" id="product-discount-input" placeholder="Enter discount" aria-label="discount" aria-describedby="product-discount-addon"/>
                                        </div>
                                      </div>
                                    </div>
                                    <div class="col-lg-3 col-sm-6">
                                      <div class="mb-3">
                                        <label class="form-label" for="orders-input">Orders</label>
                                        <input type="text" class="form-control" id="orders-input" placeholder="Orders" required=""/>
                                        <div class="invalid-feedback">Please Enter a product orders.</div>
                                      </div>
                                    </div>
                                    <!-- end col -->
                                  </div>
                                  <!-- end row -->
                                </div>
                                <!-- end tab-pane -->

                                <div class="tab-pane" id="addproduct-metadata" role="tabpanel">
                                  <div class="row">
                                    <div class="col-lg-6">
                                      <div class="mb-3">
                                        <label class="form-label" for="meta-title-input">Meta title</label>
                                        <input type="text" class="form-control" placeholder="Enter meta title" id="meta-title-input"/>
                                      </div>
                                    </div>
                                    <!-- end col -->

                                    <div class="col-lg-6">
                                      <div class="mb-3">
                                        <label class="form-label" for="meta-keywords-input">Meta Keywords</label>
                                        <input type="text" class="form-control" placeholder="Enter meta keywords" id="meta-keywords-input"/>
                                      </div>
                                    </div>
                                    <!-- end col -->
                                  </div>
                                  <!-- end row -->

                                  <div>
                                    <label class="form-label" for="meta-description-input">Meta Description</label>
                                    <textarea class="form-control" id="meta-description-input" placeholder="Enter meta description" rows="3"></textarea>
                                  </div>
                                </div>
                                <!-- end tab pane -->
                              </div>
                              <!-- end tab content -->
                            </div>
                            <!-- end card body -->
                          </div>
                          <!-- end card -->
                          <div class="text-end mb-3">
                            <button type="submit" class="btn btn-success w-sm">Submit</button>
                          </div>
                        </div>
                        <!-- end col -->

                        <div class="col-lg-4">
                          <div class="card">
                            <div class="card-header">
                              <h5 class="card-title mb-0">Publish</h5>
                            </div>
                            <div class="card-body">
                              <div class="mb-3">
                                <label for="choices-publish-status-input" class="form-label">Status</label>

                                <select class="form-select" id="choices-publish-status-input" data-choices="" data-choices-search-false="">
                                  <option value="Published" selected="">Published</option>
                                  <option value="Scheduled">Scheduled</option>
                                  <option value="Draft">Draft</option>
                                </select>
                              </div>

                              <div>
                                <label for="choices-publish-visibility-input" class="form-label">Visibility</label>
                                <select class="form-select" id="choices-publish-visibility-input" data-choices="" data-choices-search-false="">
                                  <option value="Public" selected="">Public</option>
                                  <option value="Hidden">Hidden</option>
                                </select>
                              </div>
                            </div>
                            <!-- end card body -->
                          </div>
                          <!-- end card -->

                          <div class="card">
                            <div class="card-header">
                              <h5 class="card-title mb-0">Publish Schedule</h5>
                            </div>
                            <!-- end card body -->
                            <div class="card-body">
                              <div>
                                <label for="datepicker-publish-input" class="form-label">Publish Date  Time</label>
                                <input type="text" id="datepicker-publish-input" class="form-control" placeholder="Enter publish date" data-provider="flatpickr" data-date-format="d.m.y" data-enable-time=""/>
                              </div>
                            </div>
                          </div>
                          <!-- end card -->

                          <div class="card">
                            <div class="card-header">
                              <h5 class="card-title mb-0">Product Categories</h5>
                            </div>
                            <div class="card-body">
                              <p class="text-muted mb-2">
                                <a href="#" class="float-end text-decoration-underline">Add
                                                New</a>Select product category</p>
                              <select class="form-select" id="choices-category-input" name="choices-category-input" data-choices="" data-choices-search-false="">
                                <option value="Appliances">Appliances</option>
                                <option value="Automotive Accessories">Automotive Accessories</option>
                                <option value="Electronics">Electronics</option>
                                <option value="Fashion">Fashion</option>
                                <option value="Furniture">Furniture</option>
                                <option value="Grocery">Grocery</option>
                                <option value="Kids">Kids</option>
                                <option value="Watches">Watches</option>
                              </select>
                            </div>
                            <!-- end card body -->
                          </div>
                          <!-- end card -->
                          <div class="card">
                            <div class="card-header">
                              <h5 class="card-title mb-0">Product Tags</h5>
                            </div>
                            <div class="card-body">
                              <div class="hstack gap-3 align-items-start">
                                <div class="flex-grow-1">
                                  <input class="form-control" data-choices="" data-choices-multiple-remove="true" placeholder="Enter tags" type="text" value="Cotton" />
                                </div>
                              </div>
                            </div>
                            <!-- end card body -->
                          </div>
                          <!-- end card -->

                          <div class="card">
                            <div class="card-header">
                              <h5 class="card-title mb-0">Product Short Description</h5>
                            </div>
                            <div class="card-body">
                              <p class="text-muted mb-2">Add short description for product</p>
                              <textarea class="form-control" placeholder="Must enter minimum of a 100 characters" rows="3"></textarea>
                            </div>
                            <!-- end card body -->
                          </div>
                          <!-- end card -->

                        </div>
                        <!-- end row -->
                      </div>

                    </form>

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
