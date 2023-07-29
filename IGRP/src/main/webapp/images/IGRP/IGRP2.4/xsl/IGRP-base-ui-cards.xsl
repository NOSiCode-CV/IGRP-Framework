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
                      <div class="col-sm-6 col-xl-3">
                        <!-- Simple card -->
                        <div class="card">
                          <img class="card-img-top img-fluid" src="{$themePath}/assets/images/small/img-1.jpg" alt="Card image cap"/>
                          <div class="card-body">
                            <h4 class="card-title mb-2">Web Developer</h4>
                            <p class="card-text">At missed advice my it no sister. Miss told ham dull knew see she spot near can. Spirit her entire her called.</p>
                            <div class="text-end">
                              <a href="javascript:void(0);" class="btn btn-primary">Submit</a>
                            </div>
                          </div>
                        </div>                        <!-- end card -->
                      </div>                      <!-- end col -->
                      <div class="col-sm-6 col-xl-3">
                        <div class="card">
                          <img class="card-img-top img-fluid" src="{$themePath}/assets/images/small/img-2.jpg" alt="Card image cap"/>
                          <div class="card-body">
                            <h4 class="card-title mb-2">How apps is changing the IT world</h4>
                            <p class="card-text mb-0">Whether article spirits new her covered hastily sitting her. Money witty books nor son add. Chicken age had evening believe but proceed pretend mrs.</p>
                          </div>
                          <div class="card-footer">
                            <a href="javascript:void(0);" class="card-link link-secondary">Read More <i class="ri-arrow-right-s-line ms-1 align-middle lh-1"></i>
                            </a>
                            <a href="javascript:void(0);" class="card-link link-success">Bookmark <i class="ri-bookmark-line align-middle ms-1 lh-1"></i>
                            </a>
                          </div>
                        </div>                        <!-- end card -->
                      </div>                      <!-- end col -->
                      <div class="col-sm-6 col-xl-3">
                        <div class="card">
                          <img class="card-img-top img-fluid" src="{$themePath}/assets/images/small/img-3.jpg" alt="Card image cap"/>
                          <div class="card-body">
                            <p class="card-text">We quickly learn to fear and thus automatically avoid potentially stressful situations of all kinds, including the most common of all making mistakes.</p>
                          </div>
                          <ul class="list-group list-group-flush">
                            <li class="list-group-item">An item</li>
                            <li class="list-group-item">A second item</li>
                            <li class="list-group-item">A third item</li>
                          </ul>
                        </div>                        <!-- end card -->
                      </div>                      <!-- end col -->
                      <div class="col-sm-6 col-xl-3">
                        <div class="card">
                          <div class="card-body">
                            <h4 class="card-title mb-2">What planning process needs ?</h4>
                            <h6 class="card-subtitle font-14 text-muted">Development</h6>
                          </div>
                          <img class="img-fluid" src="{$themePath}/assets/images/small/img-4.jpg" alt="Card image cap"/>
                          <div class="card-body">
                            <p class="card-text">Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer revolutionary meta-services.</p>
                          </div>
                          <div class="card-footer">
                            <a href="javascript:void(0);" class="card-link link-secondary">Read More <i class="ri-arrow-right-s-line ms-1 align-middle lh-1"></i>
                            </a>
                            <a href="javascript:void(0);" class="card-link link-success">Bookmark <i class="ri-bookmark-line align-middle ms-1 lh-1"></i>
                            </a>
                          </div>
                        </div>
                      </div>                      <!-- end col -->
                    </div>                    <!-- end row -->

                    <div class="row">
                      <div class="col-12">
                        <div class="justify-content-between d-flex align-items-center mt-3 mb-4">
                          <h5 class="mb-0 pb-1 text-decoration-underline">Using Grid Markup</h5>
                        </div>
                        <div class="row row-cols-xxl-5 row-cols-lg-3 row-cols-1">
                          <div class="col">
                            <div class="card card-body">
                              <div class="d-flex mb-4 align-items-center">
                                <div class="flex-shrink-0">
                                  <img src="{$themePath}/assets/images/users/avatar-1.jpg" alt="" class="avatar-sm rounded-circle"/>
                                </div>
                                <div class="flex-grow-1 ms-2">
                                  <h5 class="card-title mb-1">Oliver Phillips</h5>
                                  <p class="text-muted mb-0">Digital Marketing</p>
                                </div>
                              </div>
                              <h6 class="mb-1">$15,548</h6>
                              <p class="card-text text-muted">Expense Account</p>
                              <a href="javascript:void(0)" class="btn btn-primary btn-sm">See Details</a>
                            </div>
                          </div>                          <!-- end col -->
                          <div class="col">
                            <div class="card card-body">
                              <div class="d-flex mb-4 align-items-center">
                                <div class="flex-shrink-0">
                                  <img src="{$themePath}/assets/images/users/avatar-4.jpg" alt="" class="avatar-sm rounded-circle"/>
                                </div>
                                <div class="flex-grow-1 ms-2">
                                  <h5 class="card-title mb-1">Natasha Carey</h5>
                                  <p class="text-muted mb-0">Manager</p>
                                </div>
                              </div>
                              <h6 class="mb-1">$8,785</h6>
                              <p class="card-text text-muted">Expense Account</p>
                              <a href="javascript:void(0)" class="btn btn-primary btn-sm">See Details</a>
                            </div>
                          </div>                          <!-- end col -->
                          <div class="col">
                            <div class="card card-body">
                              <div class="d-flex mb-4 align-items-center">
                                <div class="flex-shrink-0">
                                  <img src="{$themePath}/assets/images/users/avatar-3.jpg" alt="" class="avatar-sm rounded-circle"/>
                                </div>
                                <div class="flex-grow-1 ms-2">
                                  <h5 class="card-title mb-1">Bethany Johnson</h5>
                                  <p class="text-muted mb-0">Development</p>
                                </div>
                              </div>
                              <h6 class="mb-1">$1,542</h6>
                              <p class="card-text text-muted">Expense Account</p>
                              <a href="javascript:void(0)" class="btn btn-primary btn-sm">See Details</a>
                            </div>
                          </div>                          <!-- end col -->
                          <div class="col">
                            <div class="card card-body">
                              <div class="d-flex mb-4 align-items-center">
                                <div class="flex-shrink-0">
                                  <img src="{$themePath}/assets/images/users/avatar-5.jpg" alt="" class="avatar-sm rounded-circle"/>
                                </div>
                                <div class="flex-grow-1 ms-2">
                                  <h5 class="card-title mb-1">Erica Kernan</h5>
                                  <p class="text-muted mb-0">Fashion Designer</p>
                                </div>
                              </div>
                              <h6 class="mb-1">$798</h6>
                              <p class="card-text text-muted">Expense Account</p>
                              <a href="javascript:void(0)" class="btn btn-primary btn-sm">See Details</a>
                            </div>
                          </div>                          <!-- end col -->
                          <div class="col">
                            <div class="card card-body">
                              <div class="d-flex mb-4 align-items-center">
                                <div class="flex-shrink-0">
                                  <img src="{$themePath}/assets/images/users/avatar-6.jpg" alt="" class="avatar-sm rounded-circle"/>
                                </div>
                                <div class="flex-grow-1 ms-2">
                                  <h5 class="card-title mb-1">Lewis Pratt</h5>
                                  <p class="text-muted mb-0">Design</p>
                                </div>
                              </div>
                              <h6 class="mb-1">$2,856</h6>
                              <p class="card-text text-muted">Expense Account</p>
                              <a href="javascript:void(0)" class="btn btn-primary btn-sm">See Details</a>
                            </div>
                          </div>                          <!-- end col -->
                        </div>                        <!-- end row -->
                      </div>                      <!-- end col -->
                    </div>                    <!-- end row -->

                    <div class="row">
                      <div class="col-12">
                        <div class="justify-content-between d-flex align-items-center mt-3 mb-4">
                          <h5 class="mb-0 pb-1 text-decoration-underline">Card Text Alignment</h5>
                        </div>
                        <div class="row">
                          <div class="col-xxl-4 col-lg-6">
                            <div class="card card-body">
                              <div class="avatar-sm mb-3">
                                <div class="avatar-title bg-soft-success text-success fs-17 rounded">
                                  <i class="ri-smartphone-line"></i>
                                </div>
                              </div>
                              <h4 class="card-title">Text Application</h4>
                              <p class="card-text text-muted">Send a link to apply on mobile device. Appropriately communicate one-to-one technology.</p>
                              <a href="javascript:void(0);" class="btn btn-success">Apply Now</a>
                            </div>
                          </div>                          <!-- end col -->
                          <div class="col-xxl-4 col-lg-6">
                            <div class="card card-body text-center">
                              <div class="avatar-sm mx-auto mb-3">
                                <div class="avatar-title bg-soft-success text-success fs-17 rounded">
                                  <i class="ri-add-line"></i>
                                </div>
                              </div>
                              <h4 class="card-title">Add New Application</h4>
                              <p class="card-text text-muted">Send a link to apply on mobile device. Appropriately communicate one-to-one technology.</p>
                              <a href="javascript:void(0);" class="btn btn-success">Add New</a>
                            </div>
                          </div>                          <!-- end col -->
                          <div class="col-xxl-4 col-lg-6">
                            <div class="card card-body text-end">
                              <div class="avatar-sm ms-auto mb-3">
                                <div class="avatar-title bg-soft-success text-success fs-17 rounded">
                                  <i class="ri-gift-fill"></i>
                                </div>
                              </div>
                              <h4 class="card-title">Text Application</h4>
                              <p class="card-text text-muted">Send a link to apply on mobile device. Appropriately communicate one-to-one technology.</p>
                              <a href="javascript:void(0);" class="btn btn-success">Add New</a>
                            </div>
                          </div>                          <!-- end col -->
                        </div>                        <!-- end row -->
                      </div>                      <!-- end col -->
                    </div>                    <!-- end row -->

                    <div class="row">
                      <div class="col-12">
                        <div class="justify-content-between d-flex align-items-center mt-3 mb-4">
                          <h5 class="mb-0 pb-1 text-decoration-underline">Card Header and Footer</h5>
                        </div>
                        <div class="row">
                          <div class="col-xxl-4 col-lg-6">
                            <div class="card">
                              <div class="card-header">
                                <button type="button" class="btn-close float-end fs-11" aria-label="Close"></button>
                                <h6 class="card-title mb-0">Hi, Erica Kernan</h6>
                              </div>
                              <div class="card-body">
                                <h6 class="card-title">How to get creative in your work ?</h6>
                                <p class="card-text text-muted mb-0">A business consulting agency is involved in the planning, implementation, and education of businesses. Miss told ham dull knew see she spot near can. Spirit her entire her called.</p>
                              </div>
                              <div class="card-footer">
                                <a href="javascript:void(0);" class="link-success float-end">Read More <i class="ri-arrow-right-s-line align-middle ms-1 lh-1"></i>
                                </a>
                                <p class="text-muted mb-0">1 days Ago</p>
                              </div>
                            </div>
                          </div>                          <!-- end col -->
                          <div class="col-xxl-4 col-lg-6">
                            <div class="card">
                              <div class="card-header">
                                <button type="button" class="btn-close float-end fs-11" aria-label="Close"></button>
                                <h6 class="card-title mb-0">Invoice<span class="text-secondary">#45155468</span>
                                </h6>
                              </div>
                              <div class="card-body">
                                <h6 class="card-title">What planning process needs ?</h6>
                                <p class="card-text text-muted mb-0">Intrinsically incubate intuitive opportunities and real-time potentialities for change for interoperable meta-services itself or distract the viewer's attention from the layout.</p>
                              </div>
                              <div class="card-footer">
                                <a href="javascript:void(0);" class="link-success float-end">Payment Now <i class="ri-arrow-right-s-line align-middle ms-1 lh-1"></i>
                                </a>
                                <p class="text-muted mb-0">5 days Left</p>
                              </div>
                            </div>
                          </div>                          <!-- end col -->
                          <div class="col-xxl-4 col-lg-6">
                            <div class="card">
                              <div class="card-header">
                                <h6 class="card-title mb-0">Creative Agency Quote</h6>
                              </div>
                              <div class="card-body">
                                <blockquote class="card-blockquote mb-0">
                                  <p class="text-muted mb-2">There are many variations of passages of Lorem Ipsum available.</p>
                                  <figure class="mb-0">
                                    <blockquote class="blockquote">
                                      <p class="lead">"A business consulting agency is involved in the planning, implementation, and education of businesses."</p>
                                    </blockquote>
                                    <figcaption class="blockquote-footer fs-13 text-end mb-0">
                                                        Creative Agency<cite title="Source Title" class="text-primary fw-semibold"> Alice Mellor</cite>
                                    </figcaption>
                                  </figure>
                                </blockquote>
                              </div>
                            </div>
                          </div>                          <!-- end col -->
                        </div>                        <!-- end row -->
                      </div>                      <!-- end col -->
                    </div>                    <!-- end row -->

                    <div class="row">
                      <div class="col-xl-4">
                        <div class="card">
                          <div class="card-body">
                            <h4 class="card-title mb-3">
                              <i class="ri-user-3-fill align-middle me-1 text-muted"></i> Natasha Carey</h4>
                            <p class="text-muted">Too much or too little spacing, as in the example below, can make things unpleasant for the reader. The goal is to make your text as comfortable to read as possible.</p>
                            <p class="text-muted mb-0">This response is important for our ability to learn from mistakes, but it alsogives rise to self-criticism.</p>
                          </div>
                          <div class="card-footer text-center">
                            <a href="javascript:void(0);" class="link-secondary">View All Notification (2) <i class="ri-arrow-right-s-line align-middle ms-1 lh-1"></i>
                            </a>
                          </div>
                        </div>
                      </div>                      <!-- end col -->
                      <div class="col-xl-4">
                        <div class="card">
                          <div class="card-header">
                            <span class="float-end text-secondary">Overview</span>
                            <h6 class="card-title">Give your text a good structure</h6>
                            <p class="card-subtitle text-muted mb-0">Fantastic Design</p>
                          </div>
                          <div class="card-body">
                            <p class="text-muted">
                                        Contrary to popular belief, you don’t have to work endless nights and hours to create a <a href="javascript:void(0);" class="text-decoration-underline">
                              <b>Fantastic Design</b>
                            </a> by using complicated 3D elements. Flat design is your friend. Remember that. And the great thing about flat design is that it has become more and more popular over the years.
                          </p>
                          <p class="text-muted mb-0">In some designs, you might adjust your tracking to create a certain artistic effect.</p>
                        </div>
                      </div>
                    </div>                    <!-- end col -->
                    <div class="col-xl-4">
                      <div class="card">
                        <div class="card-header">
                          <h6 class="card-title mb-0">
                            <i class="ri-gift-line align-middle me-1 lh-1"></i> You've made it!</h6>
                        </div>
                        <div class="card-body">
                          <p class="text-muted">After gathering lots of different opinions and graphic design basics, I came up with a list of 30 graphic design tips that you can start implementing. Each design is a new, unique piece of art birthed into this world.</p>
                          <p class="text-muted mb-0">Art party locavore wolf cliche high life echo park Austin.</p>
                        </div>
                        <div class="card-footer">
                          <div class="hstack gap-2 justify-content-end">
                            <a href="javascript:void(0)" class="btn btn-link btn-sm link-success">
                              <i class="ri-close-line align-middle lh-1"></i> Close</a>
                            <a href="javasceript:void(0);" class="btn btn-primary btn-sm">Read More</a>
                          </div>
                        </div>
                      </div>
                    </div>                    <!-- end col -->
                  </div>                  <!-- end row -->

                  <div class="row">
                    <div class="col-xl-4">
                      <div class="card">
                        <div class="card-header">
                          <button type="button" class="btn-close float-end fs-11" aria-label="Close"></button>
                          <h6 class="card-title mb-0">Employee Card</h6>
                        </div>
                        <div class="card-body p-4 text-center">
                          <div class="mx-auto avatar-md mb-3">
                            <img src="{$themePath}/assets/images/users/avatar-8.jpg" alt="" class="img-fluid rounded-circle"/>
                          </div>
                          <h5 class="card-title mb-1">Gabriel Palmer</h5>
                          <p class="text-muted mb-0">Graphic Designer</p>
                        </div>
                        <div class="card-footer text-center">
                          <ul class="list-inline mb-0">
                            <li class="list-inline-item">
                              <a href="javascript:void(0);" class="lh-1 align-middle link-secondary">
                                <i class="ri-facebook-fill"></i>
                              </a>
                            </li>
                            <li class="list-inline-item">
                              <a href="javascript:void(0);" class="lh-1 align-middle link-success">
                                <i class="ri-whatsapp-line"></i>
                              </a>
                            </li>
                            <li class="list-inline-item">
                              <a href="javascript:void(0);" class="lh-1 align-middle link-primary">
                                <i class="ri-linkedin-fill"></i>
                              </a>
                            </li>
                            <li class="list-inline-item">
                              <a href="javascript:void(0);" class="lh-1 align-middle link-danger">
                                <i class="ri-slack-fill"></i>
                              </a>
                            </li>
                          </ul>
                        </div>
                      </div>
                    </div>                    <!-- end col -->
                    <div class="col-xl-4">
                      <div class="card">
                        <div class="card-header">
                          <button type="button" class="btn-close float-end fs-11" aria-label="Close"></button>
                          <h6 class="card-title mb-0">Employee Card</h6>
                        </div>
                        <div class="card-body p-4 text-center">
                          <div class="mx-auto avatar-md mb-3">
                            <img src="{$themePath}/assets/images/users/avatar-5.jpg" alt="" class="img-fluid rounded-circle"/>
                          </div>
                          <h5 class="card-title mb-1">Amelie Townsend</h5>
                          <p class="text-muted mb-0">Project Manager</p>
                        </div>
                        <div class="card-footer text-center">
                          <ul class="list-inline mb-0">
                            <li class="list-inline-item">
                              <a href="javascript:void(0);" class="lh-1 align-middle link-secondary">
                                <i class="ri-facebook-fill"></i>
                              </a>
                            </li>
                            <li class="list-inline-item">
                              <a href="javascript:void(0);" class="lh-1 align-middle link-success">
                                <i class="ri-whatsapp-line"></i>
                              </a>
                            </li>
                            <li class="list-inline-item">
                              <a href="javascript:void(0);" class="lh-1 align-middle link-primary">
                                <i class="ri-linkedin-fill"></i>
                              </a>
                            </li>
                            <li class="list-inline-item">
                              <a href="javascript:void(0);" class="lh-1 align-middle link-danger">
                                <i class="ri-slack-fill"></i>
                              </a>
                            </li>
                          </ul>
                        </div>
                      </div>
                    </div>                    <!-- end col -->
                    <div class="col-xl-4">
                      <div class="card">
                        <div class="card-header">
                          <button type="button" class="btn-close float-end fs-11" aria-label="Close"></button>
                          <h6 class="card-title mb-0">Employee Card</h6>
                        </div>
                        <div class="card-body p-4 text-center">
                          <div class="mx-auto avatar-md mb-3">
                            <img src="{$themePath}/assets/images/users/avatar-3.jpg" alt="" class="img-fluid rounded-circle"/>
                          </div>
                          <h5 class="card-title mb-1">Jeffrey Montgomery</h5>
                          <p class="text-muted mb-0">UI/UX Designer</p>
                        </div>
                        <div class="card-footer text-center">
                          <ul class="list-inline mb-0">
                            <li class="list-inline-item">
                              <a href="javascript:void(0);" class="lh-1 align-middle link-secondary">
                                <i class="ri-facebook-fill"></i>
                              </a>
                            </li>
                            <li class="list-inline-item">
                              <a href="javascript:void(0);" class="lh-1 align-middle link-success">
                                <i class="ri-whatsapp-line"></i>
                              </a>
                            </li>
                            <li class="list-inline-item">
                              <a href="javascript:void(0);" class="lh-1 align-middle link-primary">
                                <i class="ri-linkedin-fill"></i>
                              </a>
                            </li>
                            <li class="list-inline-item">
                              <a href="javascript:void(0);" class="lh-1 align-middle link-danger">
                                <i class="ri-slack-fill"></i>
                              </a>
                            </li>
                          </ul>
                        </div>
                      </div>
                    </div>                    <!-- end col -->
                  </div>                  <!-- end row -->

                  <div class="row">
                    <div class="col-xl-4" id="card-none1">
                      <div class="card">
                        <div class="card-header">
                          <div class="d-flex align-items-center">
                            <div class="flex-grow-1">
                              <h6 class="card-title mb-0">Card with Spinner Loader</h6>
                            </div>
                            <div class="flex-shrink-0">
                              <ul class="list-inline card-toolbar-menu d-flex align-items-center mb-0">
                                <li class="list-inline-item">
                                  <a class="align-middle" data-toggle="reload" href="javascript:void(0);">
                                    <i class="mdi mdi-refresh align-middle"></i>
                                  </a>
                                </li>
                                <li class="list-inline-item">
                                  <a class="align-middle minimize-card" data-bs-toggle="collapse" href="#collapseexample1" role="button" aria-expanded="false" aria-controls="collapseExample2">
                                    <i class="mdi mdi-plus align-middle plus"></i>
                                    <i class="mdi mdi-minus align-middle minus"></i>
                                  </a>
                                </li>
                                <li class="list-inline-item">
                                  <button type="button" onclick="delthis('card-none1')" class="btn-close fs-10 align-middle"></button>
                                </li>
                              </ul>
                            </div>
                          </div>
                        </div>
                        <div class="card-body collapse show" id="collapseexample1">
                          <div class="d-flex">
                            <div class="flex-shrink-0">
                              <i class="ri-checkbox-circle-fill text-success"></i>
                            </div>
                            <div class="flex-grow-1 ms-2 text-muted">
                                            Some placeholder content for the collapse component. This panel is hidden by default but revealed when the user activates.
                            </div>
                          </div>
                          <div class="d-flex mt-2">
                            <div class="flex-shrink-0">
                              <i class="ri-checkbox-circle-fill text-success"></i>
                            </div>
                            <div class="flex-grow-1 ms-2 text-muted">
                                            Too much or too little spacing, as in the example below, can make things unpleasant for the reader. The goal is to make your text as comfortable to read as possible.
                            </div>
                          </div>
                          <div class="d-flex mt-2">
                            <div class="flex-shrink-0">
                              <i class="ri-checkbox-circle-fill text-success"></i>
                            </div>
                            <div class="flex-grow-1 ms-2 text-muted">
                                            This may be the most commonly encountered tip I received from the designers I spoke with. They highly encourage that you use different fonts in one design, but do not over-exaggerate and go overboard.
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>                    <!-- end col -->
                    <div class="col-xl-4" id="card-none2">
                      <div class="card">
                        <div class="card-header">
                          <div class="d-flex align-items-center">
                            <div class="flex-grow-1">
                              <h6 class="card-title mb-0">Card with Growing Spinner Loader</h6>
                            </div>
                            <div class="flex-shrink-0">
                              <ul class="list-inline card-toolbar-menu d-flex align-items-center mb-0">
                                <li class="list-inline-item">
                                  <a class="align-middle" href="javascript:void(0);" data-toggle="growing-reload">
                                    <i class="mdi mdi-refresh align-middle"></i>
                                  </a>
                                </li>
                                <li class="list-inline-item">
                                  <a class="align-middle minimize-card" data-bs-toggle="collapse" href="#collapseExample2" role="button" aria-expanded="false" aria-controls="collapseExample2">
                                    <i class="mdi mdi-plus align-middle plus"></i>
                                    <i class="mdi mdi-minus align-middle minus"></i>
                                  </a>
                                </li>
                                <li class="list-inline-item">
                                  <button type="button" onclick="delthis('card-none2')" class="btn-close fs-10 align-middle"></button>
                                </li>
                              </ul>
                            </div>
                          </div>
                        </div>
                        <div class="card-body collapse show" id="collapseExample2">
                          <div class="d-flex">
                            <div class="flex-shrink-0">
                              <i class="ri-checkbox-circle-fill text-success"></i>
                            </div>
                            <div class="flex-grow-1 ms-2 text-muted">
                                            Some placeholder content for the collapse component. This panel is hidden by default but revealed when the user activates.
                            </div>
                          </div>
                          <div class="d-flex mt-2">
                            <div class="flex-shrink-0">
                              <i class="ri-checkbox-circle-fill text-success"></i>
                            </div>
                            <div class="flex-grow-1 ms-2 text-muted">
                                            Too much or too little spacing, as in the example below, can make things unpleasant for the reader. The goal is to make your text as comfortable to read as possible.
                            </div>
                          </div>
                          <div class="d-flex mt-2">
                            <div class="flex-shrink-0">
                              <i class="ri-checkbox-circle-fill text-success"></i>
                            </div>
                            <div class="flex-grow-1 ms-2 text-muted">
                                            This may be the most commonly encountered tip I received from the designers I spoke with. They highly encourage that you use different fonts in one design, but do not over-exaggerate and go overboard.
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>                    <!-- end col -->
                    <div class="col-xl-4" id="card-none3">
                      <div class="card">
                        <div class="card-header">
                          <div class="d-flex align-items-center">
                            <div class="flex-grow-1">
                              <h6 class="card-title mb-0">Card with Custom Loader</h6>
                            </div>
                            <div class="flex-shrink-0">
                              <ul class="list-inline card-toolbar-menu d-flex align-items-center mb-0">
                                <li class="list-inline-item">
                                  <a class="align-middle" href="javascript:void(0);" data-toggle="customer-loader">
                                    <i class="mdi mdi-refresh align-middle"></i>
                                  </a>
                                </li>
                                <li class="list-inline-item">
                                  <a class="align-middle minimize-card" data-bs-toggle="collapse" href="#collapseExample3" role="button" aria-expanded="false" aria-controls="collapseExample2">
                                    <i class="mdi mdi-plus align-middle plus"></i>
                                    <i class="mdi mdi-minus align-middle minus"></i>
                                  </a>
                                </li>
                                <li class="list-inline-item">
                                  <button type="button" onclick="delthis('card-none3')" class="btn-close fs-10 align-middle"></button>
                                </li>
                              </ul>
                            </div>
                          </div>
                        </div>
                        <div class="card-body collapse show" id="collapseExample3">
                          <div class="d-flex">
                            <div class="flex-shrink-0">
                              <i class="ri-checkbox-circle-fill text-success"></i>
                            </div>
                            <div class="flex-grow-1 ms-2 text-muted">
                                            Some placeholder content for the collapse component. This panel is hidden by default but revealed when the user activates.
                            </div>
                          </div>
                          <div class="d-flex mt-2">
                            <div class="flex-shrink-0">
                              <i class="ri-checkbox-circle-fill text-success"></i>
                            </div>
                            <div class="flex-grow-1 ms-2 text-muted">
                                            Too much or too little spacing, as in the example below, can make things unpleasant for the reader. The goal is to make your text as comfortable to read as possible.
                            </div>
                          </div>
                          <div class="d-flex mt-2">
                            <div class="flex-shrink-0">
                              <i class="ri-checkbox-circle-fill text-success"></i>
                            </div>
                            <div class="flex-grow-1 ms-2 text-muted">
                                            This may be the most commonly encountered tip I received from the designers I spoke with. They highly encourage that you use different fonts in one design, but do not over-exaggerate and go overboard.
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>                    <!-- end col -->
                  </div>                  <!-- end row -->

                  <div class="row">
                    <div class="col-12">
                      <div class="justify-content-between d-flex align-items-center mt-3 mb-4">
                        <h5 class="mb-0 text-decoration-underline">Card Image Caps &amp; Overlays</h5>
                      </div>
                      <div class="row">
                        <div class="col-xxl-4 col-lg-6">
                          <div class="card card-overlay">
                            <img class="card-img img-fluid" src="{$themePath}/assets/images/small/img-12.jpg" alt="Card image"/>
                            <div class="card-img-overlay p-0 d-flex flex-column">
                              <div class="card-header bg-transparent">
                                <h4 class="card-title text-white mb-0">Design your apps in your own way</h4>
                              </div>
                              <div class="card-body">
                                <p class="card-text text-white mb-2">Each design is a new, unique piece of art birthed into this world, and while you have the opportunity to be creative and make your unpleasant for the reader. </p>
                                <p class="card-text">
                                  <small class="text-white">Last updated 3 mins ago</small>
                                </p>
                              </div>
                              <div class="card-footer bg-transparent text-center">
                                <a href="javascript:void(0);" class="link-light">Read More <i class="ri-arrow-right-s-line align-middle ms-1 lh-1"></i>
                                </a>
                              </div>
                            </div>
                          </div>
                        </div>                        <!-- end col -->
                        <div class="col-xxl-4 col-lg-6">
                          <div class="card card-overlay">
                            <img class="card-img img-fluid" src="{$themePath}/assets/images/small/img-1.jpg" alt="Card image"/>
                            <div class="card-img-overlay p-0">
                              <div class="card-header bg-transparent">
                                <h4 class="card-title text-white mb-0">Design your apps in your own way</h4>
                              </div>
                              <div class="card-body">
                                <p class="card-text text-white mb-2">Each design is a new, unique piece of art birthed into this world, and while you have the opportunity to be creative and make your unpleasant for the reader. </p>
                                <p class="card-text">
                                  <small class="text-white">Last updated 3 mins ago</small>
                                </p>
                              </div>
                            </div>
                          </div>
                        </div>                        <!-- end col -->
                        <div class="col-xxl-4 col-lg-6">
                          <div class="card card-overlay">
                            <img class="card-img img-fluid" src="{$themePath}/assets/images/small/img-5.jpg" alt="Card image"/>
                            <div class="card-img-overlay p-0" style="top:auto;">
                              <div class="card-body">
                                <p class="card-text text-white mb-2">Each design is a new, unique piece of art birthed into this world, and while you have the opportunity to be creative and make your unpleasant for the reader. </p>
                                <p class="card-text">
                                  <small class="text-white">Last updated 3 mins ago</small>
                                </p>
                              </div>
                              <div class="card-footer bg-transparent">
                                <h4 class="card-title text-white mb-0">Design your apps in your own way</h4>
                              </div>
                            </div>
                          </div>
                        </div>                        <!-- end col -->
                      </div>                      <!-- end row -->

                      <div class="row">
                        <div class="col-xxl-4 col-lg-6">
                          <div class="card">
                            <img class="card-img-top img-fluid" src="{$themePath}/assets/images/small/img-6.jpg" alt="Card image cap"/>
                            <div class="card-body">
                              <h4 class="card-title mb-2">A day in the of a professional fashion designer</h4>
                              <p class="card-text text-muted"> Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee. commodo enim craft beer mlkshk aliquip jean shorts ullamco.</p>
                              <p class="card-text">
                                                Last updated 3 mins ago
                              </p>
                            </div>
                          </div>
                        </div>                        <!-- end col -->
                        <div class="col-xxl-4 col-lg-6">
                          <div class="card">
                            <div class="card-body">
                              <h4 class="card-title mb-2">A day in the of a professional fashion designer</h4>
                              <p class="card-text text-muted"> Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee. commodo enim craft beer mlkshk aliquip jean shorts ullamco.</p>
                              <p class="card-text">
                                                Last updated 3 mins ago
                              </p>
                            </div>
                            <img class="card-img-bottom img-fluid" src="{$themePath}/assets/images/small/img-7.jpg" alt="Card image cap"/>
                          </div>
                        </div>                        <!-- end col -->

                        <div class="col-xxl-4 col-lg-6">
                          <div class="card">
                            <div class="card-body">
                              <h4 class="card-title mb-2">A day in the of a professional fashion designer</h4>
                              <p class="card-text text-muted"> Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee.</p>
                            </div>
                            <img class="card-img rounded-0 img-fluid" src="{$themePath}/assets/images/small/img-8.jpg" alt="Card image cap"/>
                            <div class="card-footer">
                              <p class="card-text mb-0">
                                                Last updated 3 mins ago
                              </p>
                            </div>
                          </div>
                        </div>                        <!-- end col -->

                        <div class="col-xxl-4 col-lg-6">
                          <div class="card">
                            <div class="card-header">
                              <h4 class="card-title mb-0">A day in the of a professional fashion designer</h4>
                            </div>
                            <div class="card-body">
                              <p class="card-text text-muted"> Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee.</p>
                            </div>
                            <img class="card-img rounded-0 img-fluid" src="{$themePath}/assets/images/small/img-10.jpg" alt="Card image cap"/>
                            <div class="card-footer">
                              <p class="card-text mb-0">
                                                Last updated 3 mins ago
                              </p>
                            </div>
                          </div>
                        </div>                        <!-- end col -->

                        <div class="col-xxl-4 col-lg-6">
                          <div class="card">
                            <img class="card-img-top img-fluid" src="{$themePath}/assets/images/small/img-11.jpg" alt="Card image cap"/>
                            <div class="card-header">
                              <h4 class="card-title mb-0">A day in the of a professional fashion designer</h4>
                            </div>
                            <div class="card-body">
                              <p class="card-text text-muted"> Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee.</p>
                            </div>
                            <div class="card-footer">
                              <p class="card-text mb-0">
                                                Last updated 3 mins ago
                              </p>
                            </div>
                          </div>
                        </div>                        <!-- end col -->

                        <div class="col-xxl-4 col-lg-6">
                          <div class="card">
                            <div class="card-header">
                              <h4 class="card-title mb-0">A day in the of a professional fashion designer</h4>
                            </div>
                            <div class="card-body">
                              <p class="card-text text-muted"> Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee. ommodo enim craft beer mlkshk aliquip jean shorts ullamco.</p>
                              <p class="card-text mb-0">
                                                Last updated 3 mins ago
                              </p>
                            </div>
                            <img class="card-img-bottom img-fluid" src="{$themePath}/assets/images/small/img-11.jpg" alt="Card image cap"/>
                          </div>
                        </div>                        <!-- end col -->
                      </div>

                    </div>                    <!-- end col -->
                  </div>                  <!-- end row -->

                  <div class="row">
                    <div class="col-12">
                      <div class="justify-content-between d-flex align-items-center mt-3 mb-4">
                        <h5 class="mb-0 pb-1 text-decoration-underline">Horizontal Card</h5>
                      </div>
                      <div class="row">
                        <div class="col-xxl-6">
                          <div class="card">
                            <div class="row g-0">
                              <div class="col-md-4">
                                <img class="rounded-start img-fluid h-100 object-cover" src="{$themePath}/assets/images/small/img-12.jpg" alt="Card image"/>
                              </div>
                              <div class="col-md-8">
                                <div class="card-header">
                                  <h5 class="card-title mb-0">Give your text a good structure</h5>
                                </div>
                                <div class="card-body">
                                  <p class="card-text mb-2">For that very reason, I went on a quest and spoke to many different professional graphic designers and asked them what graphic design tips they live.</p>
                                  <p class="card-text">
                                    <small class="text-muted">Last updated 3 mins ago</small>
                                  </p>
                                </div>
                              </div>
                            </div>
                          </div>                          <!-- end card -->
                        </div>                        <!-- end col -->
                        <div class="col-xxl-6">
                          <div class="card">
                            <div class="row g-0">
                              <div class="col-md-8">
                                <div class="card-header">
                                  <h5 class="card-title mb-0">Manage white space in responsive layouts ?</h5>
                                </div>
                                <div class="card-body">
                                  <p class="card-text mb-2">For that very reason, I went on a quest and spoke to many different professional graphic designers and asked them what graphic design tips they live.</p>
                                  <p class="card-text">
                                    <small class="text-muted">Last updated 3 mins ago</small>
                                  </p>
                                </div>
                              </div>
                              <div class="col-md-4">
                                <img class="rounded-end img-fluid h-100 object-cover" src="{$themePath}/assets/images/small/img-4.jpg" alt="Card image"/>
                              </div>
                            </div>
                          </div>                          <!-- end card -->
                        </div>                        <!-- end col -->

                        <div class="col-xxl-6">
                          <div class="card">
                            <div class="row g-0">
                              <div class="col-md-4">
                                <img class="rounded-start img-fluid h-100 object-cover" src="{$themePath}/assets/images/small/img-9.jpg" alt="Card image"/>
                              </div>
                              <div class="col-md-8">
                                <div class="card-body">
                                  <h5 class="card-title mb-2">Give your text a good structure</h5>
                                  <p class="card-text text-muted mb-0">For that very reason, I went on a quest and spoke to many different professional graphic designers and asked them what graphic design tips they live.</p>
                                </div>
                                <div class="card-footer">
                                  <p class="card-text">
                                    <small class="text-muted">Last updated 3 mins ago</small>
                                  </p>
                                </div>
                              </div>
                            </div>
                          </div>                          <!-- end card -->
                        </div>                        <!-- end col -->

                        <div class="col-xxl-6">
                          <div class="card">
                            <div class="row g-0">
                              <div class="col-md-8">
                                <div class="card-body">
                                  <h5 class="card-title mb-2">Manage white space in responsive layouts ?</h5>
                                  <p class="card-text text-muted mb-0">For that very reason, I went on a quest and spoke to many different professional graphic designers and asked them what graphic design tips they live.</p>
                                </div>
                                <div class="card-footer">
                                  <p class="card-text">
                                    <small class="text-muted">Last updated 3 mins ago</small>
                                  </p>
                                </div>
                              </div>
                              <div class="col-md-4">
                                <img class="rounded-end img-fluid h-100 object-cover" src="{$themePath}/assets/images/small/img-2.jpg" alt="Card image"/>
                              </div>
                            </div>
                          </div>                          <!-- end card -->
                        </div>                        <!-- end col -->
                      </div>                      <!-- end row -->
                    </div>                    <!-- end col -->
                  </div>                  <!-- end row -->

                  <div class="row">
                    <div class="col-12">
                      <div class="justify-content-between d-flex align-items-center mt-3 mb-4">
                        <h5 class="mb-0 pb-1 text-decoration-underline">Card Background Color</h5>
                      </div>
                      <div class="row">
                        <div class="col-xxl-4">
                          <div class="card card-primary">
                            <div class="card-body">
                              <div class="d-flex align-items-center">
                                <div class="flex-shrink-0">
                                  <img src="{$themePath}/assets/images/users/avatar-1.jpg" alt="" class="avatar-sm rounded-circle"/>

                                </div>
                                <div class="flex-grow-1 ms-3">
                                  <p class="card-text">
                                    <span class="fw-medium">Jeffrey Montgomery</span> (Graphic Designer) started a new conversation.</p>
                                </div>
                              </div>
                            </div>
                            <div class="card-footer">
                              <div class="text-center">
                                <a href="javascript:void(0);" class="link-light">Connect Now <i class="ri-arrow-right-s-line align-middle lh-1"></i>
                                </a>
                              </div>
                            </div>
                          </div>
                        </div>                        <!-- end col -->
                        <div class="col-xxl-4">
                          <div class="card card-success">
                            <div class="card-body">
                              <div class="d-flex align-items-center">
                                <div class="flex-shrink-0">
                                  <img src="{$themePath}/assets/images/users/avatar-2.jpg" alt="" class="avatar-sm rounded-circle"/>

                                </div>
                                <div class="flex-grow-1 ms-3">
                                  <p class="card-text">
                                    <span class="fw-medium">Charles Dickens</span> (Financial Analyst) started a new conversation.</p>
                                </div>
                              </div>
                            </div>
                            <div class="card-footer">
                              <div class="text-center">
                                <a href="javascript:void(0);" class="link-light">Connect Now <i class="ri-arrow-right-s-line align-middle lh-1"></i>
                                </a>
                              </div>
                            </div>
                          </div>
                        </div>                        <!-- end col -->
                        <div class="col-xxl-4">
                          <div class="card card-info">
                            <div class="card-body">
                              <div class="d-flex align-items-center">
                                <div class="flex-shrink-0">
                                  <img src="{$themePath}/assets/images/users/avatar-3.jpg" alt="" class="avatar-sm rounded-circle"/>

                                </div>
                                <div class="flex-grow-1 ms-3">
                                  <p class="card-text">
                                    <span class="fw-medium">Oliver Phillips</span> (UI/UX Designer) started a new conversation.</p>
                                </div>
                              </div>
                            </div>
                            <div class="card-footer">
                              <div class="text-center">
                                <a href="javascript:void(0);" class="link-light">Connect Now <i class="ri-arrow-right-s-line align-middle lh-1"></i>
                                </a>
                              </div>
                            </div>
                          </div>
                        </div>                        <!-- end col -->
                      </div>                      <!-- end row -->
                    </div>                    <!-- end col -->
                  </div>                  <!-- end row -->

                  <div class="row">
                    <div class="col-xxl-4">
                      <div class="card card-warning">
                        <div class="card-body">
                          <div class="d-flex align-items-center">
                            <div class="flex-shrink-0">
                              <img src="{$themePath}/assets/images/users/avatar-4.jpg" alt="" class="avatar-sm rounded-circle"/>

                            </div>
                            <div class="flex-grow-1 ms-3">
                              <p class="card-text">
                                <span class="fw-medium">Rebecca Swartz</span> (Graphic Designer) started a new conversation.</p>
                            </div>
                          </div>
                        </div>
                        <div class="card-footer">
                          <div class="text-center">
                            <a href="javascript:void(0);" class="link-light">Connect Now <i class="ri-arrow-right-s-line align-middle lh-1"></i>
                            </a>
                          </div>
                        </div>
                      </div>
                    </div>                    <!-- end col -->
                    <div class="col-xxl-4">
                      <div class="card card-danger">
                        <div class="card-body">
                          <div class="d-flex align-items-center">
                            <div class="flex-shrink-0">
                              <img src="{$themePath}/assets/images/users/avatar-6.jpg" alt="" class="avatar-sm rounded-circle"/>

                            </div>
                            <div class="flex-grow-1 ms-3">
                              <p class="card-text">
                                <span class="fw-medium">Betty Richards</span> (Back End Developer) started a new conversation.</p>
                            </div>
                          </div>
                        </div>
                        <div class="card-footer">
                          <div class="text-center">
                            <a href="javascript:void(0);" class="link-light">Connect Now <i class="ri-arrow-right-s-line align-middle lh-1"></i>
                            </a>
                          </div>
                        </div>
                      </div>
                    </div>                    <!-- end col -->
                    <div class="col-xxl-4">
                      <div class="card card-dark">
                        <div class="card-body">
                          <div class="d-flex align-items-center">
                            <div class="flex-shrink-0">
                              <img src="{$themePath}/assets/images/users/avatar-5.jpg" alt="" class="avatar-sm rounded-circle"/>
                            </div>
                            <div class="flex-grow-1 ms-3">
                              <p class="card-text">
                                <span class="fw-medium">Brooke Hayes</span> (Founder &amp; CEO) started a new conversation.</p>
                            </div>
                          </div>
                        </div>
                        <div class="card-footer">
                          <div class="text-center">
                            <a href="javascript:void(0);" class="link-light">Connect Now <i class="ri-arrow-right-s-line align-middle lh-1"></i>
                            </a>
                          </div>
                        </div>
                      </div>
                    </div>                    <!-- end col -->
                  </div>                  <!-- end row -->

                  <div class="row">
                    <div class="col-xxl-4">
                      <div class="card card-secondary">
                        <div class="card-body">
                          <div class="d-flex align-items-center">
                            <div class="flex-shrink-0">
                              <img src="{$themePath}/assets/images/users/avatar-7.jpg" alt="" class="avatar-sm rounded-circle"/>

                            </div>
                            <div class="flex-grow-1 ms-3">
                              <p class="card-text">
                                <span class="fw-medium">Bethany Johnson</span> (Team Leader) started a new conversation.</p>
                            </div>
                          </div>
                        </div>
                        <div class="card-footer">
                          <div class="text-center">
                            <a href="javascript:void(0);" class="link-light">Connect Now <i class="ri-arrow-right-s-line align-middle lh-1"></i>
                            </a>
                          </div>
                        </div>
                      </div>
                    </div>                    <!-- end col -->
                    <div class="col-xxl-4">
                      <div class="card card-light">
                        <div class="card-body">
                          <div class="d-flex align-items-center">
                            <div class="flex-shrink-0">
                              <img src="{$themePath}/assets/images/users/avatar-8.jpg" alt="" class="avatar-sm rounded-circle"/>

                            </div>
                            <div class="flex-grow-1 ms-3">
                              <p class="card-text">
                                <span class="fw-medium">Amelie Townsend</span> (UI/UX Designer) started a new conversation.</p>
                            </div>
                          </div>
                        </div>
                        <div class="card-footer">
                          <div class="text-center">
                            <a href="javascript:void(0);" class="link-dark">Connect Now <i class="ri-arrow-right-s-line align-middle lh-1"></i>
                            </a>
                          </div>
                        </div>
                      </div>
                    </div>                    <!-- end col -->
                  </div>                  <!-- end row -->

                  <div class="row">
                    <div class="col-12">
                      <div class="justify-content-between d-flex align-items-center mt-3 mb-4">
                        <h5 class="mb-0 pb-1 text-decoration-underline">Card Border Color</h5>
                      </div>

                      <div class="row">
                        <div class="col-xxl-4">
                          <div class="card border card-border-primary">
                            <div class="card-header">
                              <span class="float-end">75%</span>
                              <h6 class="card-title mb-0">Handle to Forcast <span class="badge bg-danger align-middle fs-10">Poor</span>
                              </h6>
                            </div>
                            <div class="card-body">
                              <p class="card-text">Whether article spirits new her covered hastily sitting her. Money witty books nor son add build on the card Chicken age had evening believe but proceed pretend mrs.</p>
                              <div class="text-end">
                                <a href="javascript:void(0);" class="link-primary fw-medium">Read More <i class="ri-arrow-right-line align-middle"></i>
                                </a>
                              </div>
                            </div>
                          </div>
                        </div>                        <!-- end col -->
                        <div class="col-xxl-4">
                          <div class="card border card-border-success">
                            <div class="card-header">
                              <span class="float-end">100%</span>
                              <h6 class="card-title mb-0">Quality Forcast <span class="badge bg-success align-middle fs-10">Excellent</span>
                              </h6>
                            </div>
                            <div class="card-body">
                              <p class="card-text">They all have something to say beyond the words on the page. They can come across as casual or neutral, exotic or graphic. Cosby sweater eu banh mi, qui irure terry richardson ex squid.</p>
                              <div class="text-end">
                                <a href="javascript:void(0);" class="link-success fw-medium">Read More <i class="ri-arrow-right-line align-middle"></i>
                                </a>
                              </div>
                            </div>
                          </div>
                        </div>                        <!-- end col -->
                        <div class="col-xxl-4">
                          <div class="card border card-border-info">
                            <div class="card-header">
                              <h6 class="card-title mb-0">Check your E-mails <span class="badge bg-info align-middle fs-10">In Process</span>
                              </h6>
                            </div>
                            <div class="card-body">
                              <p class="card-text">They all have something to say beyond the words on the page. They can come across as casual or neutral, exotic or graphic. Cosby sweater eu banh mi, qui irure terry richardson ex squid.</p>
                              <div class="text-end">
                                <a href="javascript:void(0);" class="link-info fw-medium">Read More <i class="ri-arrow-right-line align-middle"></i>
                                </a>
                              </div>
                            </div>
                          </div>
                        </div>                        <!-- end col -->
                      </div>                      <!-- end row -->
                    </div>                    <!-- end col -->
                  </div>                  <!-- end row -->

                  <div class="row">
                    <div class="col-xxl-4">
                      <div class="card border card-border-warning">
                        <div class="card-header">
                          <h6 class="card-title mb-0">Check your Payment <span class="badge bg-warning align-middle fs-10">Pending</span>
                          </h6>
                        </div>
                        <div class="card-body">
                          <p class="card-text">They all have something to say beyond the words on the page. They can come across as casual or neutral, exotic or graphic. Cosby sweater eu banh mi, qui irure terry richardson ex squid.</p>
                          <div class="text-end">
                            <a href="javascript:void(0);" class="link-warning fw-medium">Read More <i class="ri-arrow-right-line align-middle"></i>
                            </a>
                          </div>
                        </div>
                      </div>
                    </div>                    <!-- end col -->
                    <div class="col-xxl-4">
                      <div class="card border card-border-danger">
                        <div class="card-header">
                          <h6 class="card-title mb-0">Your Ordered Cancel <span class="badge bg-danger align-middle fs-10">Cancel</span>
                          </h6>
                        </div>
                        <div class="card-body">
                          <p class="card-text">They all have something to say beyond the words on the page. They can come across as casual or neutral, exotic or graphic. Cosby sweater eu banh mi, qui irure terry richardson ex squid.</p>
                          <div class="text-end">
                            <a href="javascript:void(0);" class="link-danger fw-medium">Read More <i class="ri-arrow-right-line align-middle"></i>
                            </a>
                          </div>
                        </div>
                      </div>
                    </div>                    <!-- end col -->
                    <div class="col-xxl-4">
                      <div class="card border card-border-dark">
                        <div class="card-header">
                          <h6 class="card-title mb-0">Handle to Forcast</h6>
                        </div>
                        <div class="card-body">
                          <p class="card-text">They all have something to say beyond the words on the page. They can come across as casual or neutral, exotic or graphic. Cosby sweater eu banh mi, qui irure terry richardson ex squid.</p>
                          <div class="text-end">
                            <a href="javascript:void(0);" class="link-dark fw-medium">Read More <i class="ri-arrow-right-line align-middle"></i>
                            </a>
                          </div>
                        </div>
                      </div>
                    </div>                    <!-- end col -->
                  </div>                  <!-- end row -->

                  <div class="row">
                    <div class="col-xxl-4">
                      <div class="card border card-border-secondary">
                        <div class="card-header">
                          <h6 class="card-title mb-0">Quality Forcast </h6>
                        </div>
                        <div class="card-body">
                          <p class="card-text">They all have something to say beyond the words on the page. They can come across as casual or neutral, exotic or graphic. Cosby sweater eu banh mi, qui irure terry richardson ex squid.</p>
                          <div class="text-end">
                            <a href="javascript:void(0);" class="link-secondary fw-medium">Read More <i class="ri-arrow-right-line align-middle"></i>
                            </a>
                          </div>
                        </div>
                      </div>
                    </div>                    <!-- end col -->
                    <div class="col-xxl-4">
                      <div class="card border card-border-light">
                        <div class="card-header">
                          <h6 class="card-title mb-0">Check your E-mails</h6>
                        </div>
                        <div class="card-body">
                          <p class="card-text">They all have something to say beyond the words on the page. They can come across as casual or neutral, exotic or graphic. Cosby sweater eu banh mi, qui irure terry richardson ex squid.</p>
                          <div class="text-end">
                            <a href="javascript:void(0);" class="link-dark fw-medium">Read More <i class="ri-arrow-right-line align-middle"></i>
                            </a>
                          </div>
                        </div>
                      </div>
                    </div>                    <!-- end col -->
                  </div>                  <!-- end row -->

                  <div class="row">
                    <div class="col-12">
                      <div class="justify-content-between d-flex align-items-center mt-3 mb-4">
                        <h5 class="mb-0 pb-1 text-decoration-underline">Card Groups</h5>
                      </div>
                      <div class="card-group">
                        <div class="card mb-4">
                          <img class="card-img-top img-fluid" src="{$themePath}/assets/images/small/img-4.jpg" alt="Card image cap"/>
                          <div class="card-body">
                            <h4 class="card-title">A day in the of a professional fashion designer</h4>
                            <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                          </div>
                          <div class="card-footer">
                            <p class="card-text">
                              <small class="text-muted">Last updated 3 mins ago</small>
                            </p>
                          </div>
                        </div>                        <!-- end card -->
                        <div class="card mb-4">
                          <img class="card-img-top img-fluid" src="{$themePath}/assets/images/small/img-5.jpg" alt="Card image cap"/>
                          <div class="card-body">
                            <h4 class="card-title">Manage white space in responsive layouts ?</h4>
                            <p class="card-text">This card has supporting text below as a natural lead-in to additional content.</p>
                          </div>
                          <div class="card-footer">
                            <p class="card-text">
                              <small class="text-muted">Last updated 3 mins ago</small>
                            </p>
                          </div>
                        </div>                        <!-- end card -->
                        <div class="card mb-4">
                          <img class="card-img-top img-fluid" src="{$themePath}/assets/images/small/img-6.jpg" alt="Card image cap"/>
                          <div class="card-body">
                            <h4 class="card-title">Give your text a good structure?</h4>
                            <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.</p>
                          </div>
                          <div class="card-footer">
                            <p class="card-text">
                              <small class="text-muted">Last updated 3 mins ago</small>
                            </p>
                          </div>
                        </div>                        <!-- end card -->
                      </div>                      <!-- end card group-->
                    </div>                    <!-- end col -->
                  </div>                  <!-- end row -->

                  <div class="row g-3">
                    <div class="justify-content-between d-flex align-items-center mt-3 mb-4">
                      <h5 class="mb-0 pb-1 text-decoration-underline">Grid Card Groups</h5>
                    </div>
                    <div class="col-xxl col-6">
                      <div class="card h-100">
                        <div class="card-header">
                          <h4 class="card-title mb-0">A day in the of a professional fashion designer</h4>
                        </div>
                        <img class="img-fluid" src="{$themePath}/assets/images/small/img-11.jpg" alt="Card image cap"/>
                        <div class="card-body">
                          <p class="card-text">This may be the most commonly encountered tip I received from the designers I spoke with. They highly encourage that you use different fonts in one design, but do not over-exaggerate and go overboard.</p>
                        </div>
                        <div class="card-footer">
                          <p class="card-text">
                            <small class="text-muted">Last updated 3 mins ago</small>
                          </p>
                        </div>
                      </div>
                    </div>
                    <!--end col-->
                    <div class="col-xxl col-6">
                      <div class="card h-100">
                        <img class="card-img-top img-fluid" src="{$themePath}/assets/images/small/img-10.jpg" alt="Card image cap"/>
                        <div class="card-body">
                          <h4 class="card-title">Give your text a good structure?</h4>
                          <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.</p>
                        </div>
                        <div class="card-footer">
                          <p class="card-text">
                            <small class="text-muted">Last updated 3 mins ago</small>
                          </p>
                        </div>
                      </div>
                    </div>
                    <!--end col-->
                    <div class="col-xxl col-6">
                      <div class="card h-100">
                        <img class="card-img-top img-fluid" src="{$themePath}/assets/images/small/img-5.jpg" alt="Card image cap"/>
                        <div class="card-body">
                          <h4 class="card-title">Manage white space in responsive layouts ?</h4>
                          <p class="card-text">Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee. ommodo enim craft beer mlkshk aliquip jean shorts ullamco.</p>
                        </div>
                        <div class="card-footer">
                          <p class="card-text">
                            <small class="text-muted">Last updated 3 mins ago</small>
                          </p>
                        </div>
                      </div>
                    </div>
                    <!--end col-->
                  </div>
                  <!--end row-->


                  <!-- TODO COde is commented because it wont let the page render -->


                  <div class="row">
                    <div class="col-sm-12">
                      <div class="justify-content-between d-flex align-items-center mt-5 mb-4">
                        <h5 class="mb-0 pb-1 text-decoration-underline">Cards Masonry</h5>
                      </div>
                      <div class="row"   >
                      
                      <!-- data-masonry='{"percentPosition": true }'  IS FROM THE ROW ABOVE-->
                        <div class="col-sm-6 col-lg-4">
                          <div class="card">
                            <img src="{$themePath}/assets/images/small/img-3.jpg" class="card-img-top" alt="..."/>
                            <div class="card-body">
                              <h5 class="card-title mb-1">Card title that wraps to a new line</h5>
                              <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                            </div>
                          </div>
                        </div>                        <!-- end col -->
                        <div class="col-sm-6 col-lg-4">
                          <div class="card">
                            <div class="card-body">
                              <h4 class="card-title mb-2">A day in the of a professional fashion designer</h4>
                              <p class="card-text text-muted"> Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee.</p>
                            </div>
                            <img class="card-img rounded-0 img-fluid" src="{$themePath}/assets/images/small/img-8.jpg" alt="Card image cap"/>
                            <div class="card-footer">
                              <p class="card-text mb-0">
                                                Last updated 3 mins ago
                              </p>
                            </div>
                          </div>
                        </div>                        <!-- end col -->
                        <div class="col-sm-6 col-lg-4">
                          <div class="card">
                            <img src="{$themePath}/assets/images/small/img-7.jpg" class="card-img" alt="..."/>
                          </div>
                        </div>                        <!-- end col -->
                        <div class="col-sm-6 col-lg-4">
                          <div class="card p-3">
                            <figure class="mb-0">
                              <blockquote class="blockquote">
                                <p class="lead">"A business consulting agency is involved in the planning, implementation, and education of businesses."</p>
                              </blockquote>
                              <figcaption class="blockquote-footer fs-13 text-end mb-0">
                                                Creative Agency<cite title="Source Title" class="text-primary fw-semibold"> Alice Mellor</cite>
                              </figcaption>
                            </figure>
                          </div>
                        </div>                        <!-- end col -->
                        <div class="col-sm-6 col-lg-4">
                          <div class="card">
                            <div class="card-header">
                              <button type="button" class="btn-close float-end fs-11" aria-label="Close"></button>
                              <h6 class="fs-15 mb-0">Hi, Erica Kernan</h6>
                            </div>
                            <div class="card-body">
                              <h6 class="card-title">How to get creative in your work ?</h6>
                              <p class="card-text text-muted mb-0">A business consulting agency is involved in the planning, implementation, and education of businesses. Miss told ham dull knew see she spot near can. Spirit her entire her called.</p>
                            </div>
                            <div class="card-footer">
                              <a href="javascript:void(0);" class="link-success float-end">Read More <i class="ri-arrow-right-s-line align-middle ms-1 lh-1"></i>
                              </a>
                              <p class="text-muted mb-0">1 days Ago</p>
                            </div>
                          </div>
                        </div>                        <!-- end col -->
                        <div class="col-sm-6 col-lg-4">
                          <div class="card bg-primary text-white text-center p-3">
                            <blockquote class="card-blockquote m-0">
                              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat.</p>
                              <footer class="blockquote-footer text-white font-size-12 mt-0 mb-0">
                                                Someone famous in <cite title="Source Title">Source Title</cite>
                              </footer>
                            </blockquote>
                          </div>
                        </div>                        <!-- end col -->
                        <div class="col-sm-6 col-lg-4">
                          <div class="card card-success">
                            <div class="card-body">
                              <div class="d-flex align-items-center">
                                <div class="flex-shrink-0">
                                  <img src="{$themePath}/assets/images/users/avatar-2.jpg" alt="" class="avatar-sm rounded-circle"/>
                                </div>
                                <div class="flex-grow-1 ms-3">
                                  <p class="card-text">
                                    <span class="fw-medium">Charles Dickens</span> (Financial Analyst) started a new conversation.</p>
                                </div>
                              </div>
                            </div>
                            <div class="card-footer">
                              <div class="text-center">
                                <a href="javascript:void(0);" class="link-light">Connect Now <i class="ri-arrow-right-s-line align-middle lh-1"></i>
                                </a>
                              </div>
                            </div>
                          </div>
                        </div>                        <!-- end col -->
                        <div class="col-sm-6 col-lg-4">
                          <div class="card">
                            <div class="card-body">
                              <h5 class="card-title mb-1">Card title</h5>
                              <p class="card-text">This is another card with title and supporting text below. This card has some additional content to make it slightly taller overall.</p>
                              <p class="card-text">
                                <small class="text-muted">Last updated 3 mins ago</small>
                              </p>
                            </div>
                          </div>
                        </div>                        <!-- end col -->
                        <div class="col-sm-6 col-lg-4">
                          <div class="card text-center">
                            <div class="card-body">
                              <h5 class="card-title mb-1">Card title</h5>
                              <p class="card-text">This card has a regular title and short paragraphy of text below it.</p>
                              <p class="card-text">
                                <small class="text-muted">Last updated 3 mins ago</small>
                              </p>
                            </div>
                          </div>
                        </div>                        <!-- end col -->
                      </div>                      <!-- end row -->
                    </div>                    <!-- end col -->
                  </div>                  <!-- end row -->

                  <div class="row">
                    <div class="col-12">
                      <div class="justify-content-between d-flex align-items-center mt-3 mb-4">
                        <h5 class="mb-0 pb-1 text-decoration-underline">Stretched Link</h5>
                      </div>                      <!-- end col -->
                      <div class="row">
                        <div class="col-xl-4">
                          <div class="card">
                            <img src="{$themePath}/assets/images/small/img-3.jpg" class="card-img-top" alt="..."/>
                            <div class="card-body">
                              <h5 class="card-title">Card with stretched link</h5>
                              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                              <a href="javascript:void(0);" class="btn btn-primary stretched-link">Go somewhere</a>
                            </div>
                          </div>
                        </div>                        <!-- end col -->
                        <div class="col-xl-8">
                          <div class="card">
                            <div class="card-body">
                              <div class="d-flex position-relative">
                                <img src="{$themePath}/assets/images/users/avatar-3.jpg" class="flex-shrink-0 me-3 avatar-xl rounded" alt="..."/>
                                <div>
                                  <h5 class="mt-0">Custom component with stretched link</h5>
                                  <p>This is some placeholder content for the custom component. It is intended to mimic what some real-world content would look like, and we're using it here to give the component a bit of body and size.</p>
                                  <a href="javascript:void(0);" class="stretched-link">Go somewhere</a>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="card">
                            <div class="card-body">
                              <div class="row g-0 bg-light position-relative">
                                <div class="col-md-5">
                                  <img src="{$themePath}/assets/images/small/img-4.jpg" class="rounded-start img-fluid" alt="..."/>
                                </div>
                                <div class="col-md-7 p-4">
                                  <h5 class="mt-0">Columns with stretched link</h5>
                                  <p>Another instance of placeholder content for this other custom component. It is intended to mimic what some real-world content would look like, and we're using it here to give the component a bit of body and size.</p>
                                  <a href="javascript:void(0);" class="stretched-link">Go somewhere</a>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>                        <!-- end col -->
                      </div>                      <!-- end row -->
                    </div>                    <!-- end col -->
                  </div>                  <!-- end row -->

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

      <!-- Masonry plugin -->
      <script src="{$path}/libs/masonry-layout/masonry.pkgd.min.js"></script>

      <script src="{$themePath}/assets/js/pages/card.init.js"></script>


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
