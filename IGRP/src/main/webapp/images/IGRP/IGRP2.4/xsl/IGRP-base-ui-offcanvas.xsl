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
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header align-items-center d-flex">
                                    <h4 class="card-title mb-0 flex-grow-1">Default Offcanvas</h4>
                                    <div class="flex-shrink-0">
                                        <div class="form-check form-switch form-switch-right form-switch-md">
                                            <label for="default-example" class="form-label text-muted">Show Code</label>
                                            <input class="form-check-input code-switcher" type="checkbox" id="default-example"></input>
                                        </div>
                                    </div>
                                </div><!-- end card header -->
                                <div class="card-body">
                                    <p class="text-muted">Use the <code>offcanvas</code> class to set a default offcanvas.</p>
                                    <div class="live-preview">
                                        <div class="hstack flex-wrap gap-2">
                                            <a class="btn btn-secondary" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" aria-controls="offcanvasExample">
                                                Link with href
                                            </a>
                                            <button class="btn btn-secondary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample" aria-controls="offcanvasExample">
                                                Button with data-bs-target
                                            </button>
                                        </div>

                                        <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
                                            <div class="offcanvas-header border-bottom">
                                                <h5 class="offcanvas-title" id="offcanvasExampleLabel">Recent Acitivity</h5>
                                                <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                                            </div>
                                            <div class="offcanvas-body p-0 overflow-hidden">
                                                <div data-simplebar="" style="height: calc(100vh - 112px);">
                                                    <div class="acitivity-timeline p-4">
                                                        <div class="acitivity-item d-flex">
                                                            <div class="flex-shrink-0">
                                                                <img src="{$themePath}/assets/images/users/avatar-1.jpg" alt="" class="avatar-xs rounded-circle acitivity-avatar"></img>
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h6 class="mb-1">Oliver Phillips <span class="badge bg-soft-primary text-primary align-middle">New</span></h6>
                                                                <p class="text-muted mb-2">We talked about a project on linkedin.</p>
                                                                <small class="mb-0 text-muted">Today</small>
                                                            </div>
                                                        </div>
                                                        <div class="acitivity-item py-3 d-flex">
                                                            <div class="flex-shrink-0 avatar-xs acitivity-avatar">
                                                                <div class="avatar-title bg-soft-success text-success rounded-circle">
                                                                    N
                                                                </div>
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h6 class="mb-1">Nancy Martino <span class="badge bg-soft-secondary text-secondary align-middle">In Progress</span></h6>
                                                                <p class="text-muted mb-2"><i class="ri-file-text-line align-middle ms-2"></i> Create new project Buildng product</p>
                                                                <div class="avatar-group mb-2">
                                                                    <a href="javascript: void(0);" class="avatar-group-item" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Christi">
                                                                        <img src="{$themePath}/assets/images/users/avatar-4.jpg" alt="" class="rounded-circle avatar-xs"></img>
                                                                    </a>
                                                                    <a href="javascript: void(0);" class="avatar-group-item" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Frank Hook">
                                                                        <img src="{$themePath}/assets/images/users/avatar-3.jpg" alt="" class="rounded-circle avatar-xs"></img>
                                                                    </a>
                                                                    <a href="javascript: void(0);" class="avatar-group-item" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title=" Ruby">
                                                                        <div class="avatar-xs">
                                                                            <div class="avatar-title rounded-circle bg-light text-primary">
                                                                                R
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                    <a href="javascript: void(0);" class="avatar-group-item" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="more">
                                                                        <div class="avatar-xs">
                                                                            <div class="avatar-title rounded-circle">
                                                                                2+
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                </div>
                                                                <small class="mb-0 text-muted">Yesterday</small>
                                                            </div>
                                                        </div>
                                                        <div class="acitivity-item py-3 d-flex">
                                                            <div class="flex-shrink-0">
                                                                <img src="{$themePath}/assets/images/users/avatar-2.jpg" alt="" class="avatar-xs rounded-circle acitivity-avatar"></img>
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h6 class="mb-1">Natasha Carey <span class="badge bg-soft-success text-success align-middle">Completed</span></h6>
                                                                <p class="text-muted mb-2">Adding a new event with attachments</p>
                                                                <div class="row border border-dashed gx-2 p-2 mb-2">
                                                                    <div class="col-4">
                                                                        <img src="{$themePath}/assets/images/small/img-2.jpg" alt="" class="img-fluid rounded" />
                                                                    </div>
                                                                    <div class="col-4">
                                                                        <img src="{$themePath}/assets/images/small/img-3.jpg" alt="" class="img-fluid rounded" />
                                                                    </div>
                                                                    <div class="col-4">
                                                                        <img src="{$themePath}/assets/images/small/img-4.jpg" alt="" class="img-fluid rounded" />
                                                                    </div>
                                                                </div>
                                                                <small class="mb-0 text-muted">25 Nov</small>
                                                            </div>
                                                        </div>
                                                        <div class="acitivity-item py-3 d-flex">
                                                            <div class="flex-shrink-0">
                                                                <img src="{$themePath}/assets/images/users/avatar-6.jpg" alt="" class="avatar-xs rounded-circle acitivity-avatar"></img>
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h6 class="mb-1">Bethany Johnson</h6>
                                                                <p class="text-muted mb-2">added a new member to velzon dashboard</p>
                                                                <small class="mb-0 text-muted">19 Nov</small>
                                                            </div>
                                                        </div>
                                                        <div class="acitivity-item py-3 d-flex">
                                                            <div class="flex-shrink-0">
                                                                <div class="avatar-xs acitivity-avatar">
                                                                    <div class="avatar-title rounded-circle bg-soft-danger text-danger">
                                                                        <i class="ri-shopping-bag-line"></i>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h6 class="mb-1">Your order is placed <span class="badge bg-soft-danger text-danger align-middle ms-1">Out of Delivery</span></h6>
                                                                <p class="text-muted mb-2">These customers can rest assured their order has been placed.</p>
                                                                <small class="mb-0 text-muted">16 Nov</small>
                                                            </div>
                                                        </div>
                                                        <div class="acitivity-item py-3 d-flex">
                                                            <div class="flex-shrink-0">
                                                                <img src="{$themePath}/assets/images/users/avatar-7.jpg" alt="" class="avatar-xs rounded-circle acitivity-avatar"></img>
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h6 class="mb-1">Lewis Pratt</h6>
                                                                <p class="text-muted mb-2">They all have something to say beyond the words on the page. They can come across as casual or neutral, exotic or graphic. </p>
                                                                <small class="mb-0 text-muted">22 Oct</small>
                                                            </div>
                                                        </div>
                                                        <div class="acitivity-item py-3 d-flex">
                                                            <div class="flex-shrink-0">
                                                                <div class="avatar-xs acitivity-avatar">
                                                                    <div class="avatar-title rounded-circle bg-soft-info text-info">
                                                                        <i class="ri-line-chart-line"></i>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h6 class="mb-1">Monthly sales report</h6>
                                                                <p class="text-muted mb-2"><span class="text-danger">2 days left</span> notification to submit the monthly sales report. <a href="javascript:void(0);" class="link-warning text-decoration-underline">Reports Builder</a></p>
                                                                <small class="mb-0 text-muted">15 Oct</small>
                                                            </div>
                                                        </div>
                                                        <div class="acitivity-item d-flex">
                                                            <div class="flex-shrink-0">
                                                                <img src="{$themePath}/assets/images/users/avatar-8.jpg" alt="" class="avatar-xs rounded-circle acitivity-avatar" />
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h6 class="mb-1">New ticket received <span class="badge bg-soft-success text-success align-middle">Completed</span></h6>
                                                                <p class="text-muted mb-2">User <span class="text-secondary">Erica245</span> submitted a ticket.</p>
                                                                <small class="mb-0 text-muted">26 Aug</small>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="offcanvas-foorter border-top p-3 text-center">
                                                <a href="javascript:void(0);" class="link-success">View All Acitivity <i class="ri-arrow-right-s-line align-middle ms-1"></i></a>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="d-none code-view">
                                        <pre class="language-markup" style="height: 275px;">
<code>&lt;!-- Base Examples --&gt;
&lt;div class=&quot;hstack flex-wrap gap-2&quot;&gt;
    &lt;a class=&quot;btn btn-light&quot; data-bs-toggle=&quot;offcanvas&quot; href=&quot;#offcanvasExample&quot; role=&quot;button&quot; aria-controls=&quot;offcanvasExample&quot;&gt;
        Link with href
    &lt;/a&gt;
    &lt;button class=&quot;btn btn-light&quot; type=&quot;button&quot; data-bs-toggle=&quot;offcanvas&quot; data-bs-target=&quot;#offcanvasExample&quot; aria-controls=&quot;offcanvasExample&quot;&gt;
        Button with data-bs-target
    &lt;/button&gt;
&lt;/div&gt;

&lt;div class=&quot;offcanvas offcanvas-start&quot; tabindex=&quot;-1&quot; id=&quot;offcanvasExample&quot; aria-labelledby=&quot;offcanvasExampleLabel&quot;&gt;
    &lt;div class=&quot;offcanvas-header&quot;&gt;
        &lt;h5 class=&quot;offcanvas-title&quot; id=&quot;offcanvasExampleLabel&quot;&gt;Offcanvas&lt;/h5&gt;
        &lt;button type=&quot;button&quot; class=&quot;btn-close text-reset&quot; data-bs-dismiss=&quot;offcanvas&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
    &lt;/div&gt;
    &lt;div class=&quot;offcanvas-body&quot;&gt;
        ...
    &lt;/div&gt;
&lt;/div&gt;</code></pre>
                                    </div>
                                </div><!-- end card-body -->
                            </div><!-- end card -->
                        </div><!-- end col -->
                    </div><!-- end row -->

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header align-items-center d-flex">
                                    <h4 class="card-title mb-0 flex-grow-1">Placement Offcanvas</h4>
                                    <div class="flex-shrink-0">
                                        <div class="form-check form-switch form-switch-right form-switch-md">
                                            <label for="placement-showcode" class="form-label text-muted">Show Code</label>
                                            <input class="form-check-input code-switcher" type="checkbox" id="placement-showcode"></input>
                                        </div>
                                    </div>
                                </div><!-- end card header -->
                                <div class="card-body">
                                    <p class="text-muted">Use <code>offcanvas-top</code>, <code>offcanvas-end</code>, <code>offcanvas-bottom</code>, or <code>offcanvas-start</code> to offcanvas class to set different Offcanvas Placement.</p>
                                    <div class="live-preview">
                                        <div class="d-flex flex-wrap gap-2">
                                            <button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasTop" aria-controls="offcanvasTop">Toggle Top Offcanvas</button>
                                            <button class="btn btn-secondary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">Toggle Right Offcanvas</button>
                                            <button class="btn btn-success" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasBottom" aria-controls="offcanvasBottom">Toggle Bottom Offcanvas</button>
                                            <button class="btn btn-danger" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasLeft" aria-controls="offcanvasLeft">Toggle Left Offcanvas</button>
                                        </div>

                                        <!-- top offcanvas -->
                                        <div class="offcanvas offcanvas-top" tabindex="-1" id="offcanvasTop" aria-labelledby="offcanvasTopLabel" style="min-height:46vh;">
                                            <div class="offcanvas-header border-bottom">
                                                <h5 class="offcanvas-title" id="offcanvasTopLabel">Gallery</h5>
                                                <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                                            </div>
                                            <div class="offcanvas-body">
                                                <div class="row gallery-light">
                                                    <div class="col-xl-3 col-lg-4 col-sm-6">
                                                        <div class="gallery-box card light mb-0">
                                                            <div class="gallery-container">
                                                                <a href="#" title="">
                                                                    <img class="gallery-img img-fluid mx-auto" src="{$themePath}/assets/images/small/img-12.jpg" alt="" />
                                                                    <div class="gallery-overlay">
                                                                        <h5 class="overlay-caption">A mix of friends and strangers heading off to find an adventure.</h5>
                                                                    </div>
                                                                </a>
                                                            </div>
                                                            <div class="box-content">
                                                                <div class="d-flex align-items-center mt-1">
                                                                    <div class="flex-grow-1 text-muted">by <a href="" class="text-body text-truncate">Erica Kernan</a></div>
                                                                    <div class="flex-shrink-0">
                                                                        <div class="d-flex gap-3">
                                                                            <button type="button" class="btn btn-sm fs-12 btn-link text-body text-decoration-none px-0">
                                                                                <i class="ri-thumb-up-fill text-muted align-bottom me-1"></i> 3.4K
                                                                            </button>
                                                                            <button type="button" class="btn btn-sm fs-12 btn-link text-body text-decoration-none px-0">
                                                                                <i class="ri-question-answer-fill text-muted align-bottom me-1"></i> 1.3k
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--end col-->
                                                    <div class="col-xl-3 col-lg-4 col-sm-6">
                                                        <div class="gallery-box card light mb-0">
                                                            <div class="gallery-container">
                                                                <a href="#" title="">
                                                                    <img class="gallery-img img-fluid mx-auto" src="{$themePath}/assets/images/small/img-9.jpg" alt="" />
                                                                    <div class="gallery-overlay">
                                                                        <h5 class="overlay-caption">Dramatic clouds at the Golden Gate Bridge</h5>
                                                                    </div>
                                                                </a>
                                                            </div>
                                                            <div class="box-content">
                                                                <div class="d-flex align-items-center mt-1">
                                                                    <div class="flex-grow-1 text-muted">by <a href="" class="text-body text-truncate">Ron Mackie</a></div>
                                                                    <div class="flex-shrink-0">
                                                                        <div class="d-flex gap-3">
                                                                            <button type="button" class="btn btn-sm fs-12 btn-link text-body text-decoration-none px-0">
                                                                                <i class="ri-thumb-up-fill text-muted align-bottom me-1"></i> 5.1K
                                                                            </button>
                                                                            <button type="button" class="btn btn-sm fs-12 btn-link text-body text-decoration-none px-0">
                                                                                <i class="ri-question-answer-fill text-muted align-bottom me-1"></i> 4.7k
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--end col-->
                                                    <div class="col-xl-3 col-lg-4 col-sm-6">
                                                        <div class="gallery-box card mb-0">
                                                            <div class="gallery-container">
                                                                <a href="#" title="">
                                                                    <img class="gallery-img img-fluid mx-auto" src="{$themePath}/assets/images/small/img-11.jpg" alt="" />
                                                                    <div class="gallery-overlay">
                                                                        <h5 class="overlay-caption">Cycling in the countryside</h5>
                                                                    </div>
                                                                </a>

                                                            </div>

                                                            <div class="box-content">
                                                                <div class="d-flex align-items-center mt-1">
                                                                    <div class="flex-grow-1 text-muted">by <a href="" class="text-body text-truncate">Nancy Martino</a></div>
                                                                    <div class="flex-shrink-0">
                                                                        <div class="d-flex gap-3">
                                                                            <button type="button" class="btn btn-sm fs-12 btn-link text-body text-decoration-none px-0">
                                                                                <i class="ri-thumb-up-fill text-muted align-bottom me-1"></i> 3.2K
                                                                            </button>
                                                                            <button type="button" class="btn btn-sm fs-12 btn-link text-body text-decoration-none px-0">
                                                                                <i class="ri-question-answer-fill text-muted align-bottom me-1"></i> 1.1K
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--end col-->
                                                    <div class="col-xl-3 col-lg-4 col-sm-6 d-md-none d-xl-block">
                                                        <div class="gallery-box card mb-0">
                                                            <div class="gallery-container">
                                                                <a href="#" title="">
                                                                    <img class="gallery-img img-fluid mx-auto" src="{$themePath}/assets/images/small/img-10.jpg" alt="" />
                                                                    <div class="gallery-overlay">
                                                                        <h5 class="overlay-caption">Fun day at the Hill Station</h5>
                                                                    </div>
                                                                </a>
                                                            </div>
                                                            <div class="box-content">
                                                                <div class="d-flex align-items-center mt-1">
                                                                    <div class="flex-grow-1 text-muted">by <a href="" class="text-body text-truncate">Henry Baird</a></div>
                                                                    <div class="flex-shrink-0">
                                                                        <div class="d-flex gap-3">
                                                                            <button type="button" class="btn btn-sm fs-12 btn-link text-body text-decoration-none px-0">
                                                                                <i class="ri-thumb-up-fill text-muted align-bottom me-1"></i> 632
                                                                            </button>
                                                                            <button type="button" class="btn btn-sm fs-12 btn-link text-body text-decoration-none px-0">
                                                                                <i class="ri-question-answer-fill text-muted align-bottom me-1"></i> 95
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--end col-->
                                                </div>
                                                <!--end row-->
                                            </div>
                                        </div>

                                        <!-- right offcanvas -->
                                        <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
                                            <div class="offcanvas-header border-bottom">
                                                <h5 class="offcanvas-title" id="offcanvasRightLabel">Recent Acitivity</h5>
                                                <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                                            </div>
                                            <div class="offcanvas-body p-0 overflow-hidden">
                                                <div data-simplebar="" style="height: calc(100vh - 112px);">
                                                    <div class="acitivity-timeline p-4">
                                                        <div class="acitivity-item d-flex">
                                                            <div class="flex-shrink-0">
                                                                <img src="{$themePath}/assets/images/users/avatar-1.jpg" alt="" class="avatar-xs rounded-circle acitivity-avatar"></img>
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h6 class="mb-1">Oliver Phillips <span class="badge bg-soft-primary text-primary align-middle">New</span></h6>
                                                                <p class="text-muted mb-2">We talked about a project on linkedin.</p>
                                                                <small class="mb-0 text-muted">Today</small>
                                                            </div>
                                                        </div>
                                                        <div class="acitivity-item py-3 d-flex">
                                                            <div class="flex-shrink-0 avatar-xs acitivity-avatar">
                                                                <div class="avatar-title bg-soft-success text-success rounded-circle">
                                                                    N
                                                                </div>
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h6 class="mb-1">Nancy Martino <span class="badge bg-soft-secondary text-secondary align-middle">In Progress</span></h6>
                                                                <p class="text-muted mb-2"><i class="ri-file-text-line align-middle ms-2"></i> Create new project Buildng product</p>
                                                                <div class="avatar-group mb-2">
                                                                    <a href="javascript: void(0);" class="avatar-group-item" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Christi">
                                                                        <img src="{$themePath}/assets/images/users/avatar-4.jpg" alt="" class="rounded-circle avatar-xs"></img>
                                                                    </a>
                                                                    <a href="javascript: void(0);" class="avatar-group-item" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Frank Hook">
                                                                        <img src="{$themePath}/assets/images/users/avatar-3.jpg" alt="" class="rounded-circle avatar-xs"></img>
                                                                    </a>
                                                                    <a href="javascript: void(0);" class="avatar-group-item" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title=" Ruby">
                                                                        <div class="avatar-xs">
                                                                            <div class="avatar-title rounded-circle bg-light text-primary">
                                                                                R
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                    <a href="javascript: void(0);" class="avatar-group-item" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="more">
                                                                        <div class="avatar-xs">
                                                                            <div class="avatar-title rounded-circle">
                                                                                2+
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                </div>
                                                                <small class="mb-0 text-muted">Yesterday</small>
                                                            </div>
                                                        </div>
                                                        <div class="acitivity-item py-3 d-flex">
                                                            <div class="flex-shrink-0">
                                                                <img src="{$themePath}/assets/images/users/avatar-2.jpg" alt="" class="avatar-xs rounded-circle acitivity-avatar"></img>
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h6 class="mb-1">Natasha Carey <span class="badge bg-soft-success text-success align-middle">Completed</span></h6>
                                                                <p class="text-muted mb-2">Adding a new event with attachments</p>
                                                                <div class="row border border-dashed gx-2 p-2 mb-2">
                                                                    <div class="col-4">
                                                                        <img src="{$themePath}/assets/images/small/img-2.jpg" alt="" class="img-fluid rounded" />
                                                                    </div>
                                                                    <div class="col-4">
                                                                        <img src="{$themePath}/assets/images/small/img-3.jpg" alt="" class="img-fluid rounded" />
                                                                    </div>
                                                                    <div class="col-4">
                                                                        <img src="{$themePath}/assets/images/small/img-4.jpg" alt="" class="img-fluid rounded" />
                                                                    </div>
                                                                </div>
                                                                <small class="mb-0 text-muted">25 Nov</small>
                                                            </div>
                                                        </div>
                                                        <div class="acitivity-item py-3 d-flex">
                                                            <div class="flex-shrink-0">
                                                                <img src="{$themePath}/assets/images/users/avatar-6.jpg" alt="" class="avatar-xs rounded-circle acitivity-avatar"></img>
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h6 class="mb-1">Bethany Johnson</h6>
                                                                <p class="text-muted mb-2">added a new member to velzon dashboard</p>
                                                                <small class="mb-0 text-muted">19 Nov</small>
                                                            </div>
                                                        </div>
                                                        <div class="acitivity-item py-3 d-flex">
                                                            <div class="flex-shrink-0">
                                                                <div class="avatar-xs acitivity-avatar">
                                                                    <div class="avatar-title rounded-circle bg-soft-danger text-danger">
                                                                        <i class="ri-shopping-bag-line"></i>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h6 class="mb-1">Your order is placed <span class="badge bg-soft-danger text-danger align-middle ms-1">Out of Delivery</span></h6>
                                                                <p class="text-muted mb-2">These customers can rest assured their order has been placed.</p>
                                                                <small class="mb-0 text-muted">16 Nov</small>
                                                            </div>
                                                        </div>
                                                        <div class="acitivity-item py-3 d-flex">
                                                            <div class="flex-shrink-0">
                                                                <img src="{$themePath}/assets/images/users/avatar-7.jpg" alt="" class="avatar-xs rounded-circle acitivity-avatar"></img>
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h6 class="mb-1">Lewis Pratt</h6>
                                                                <p class="text-muted mb-2">They all have something to say beyond the words on the page. They can come across as casual or neutral, exotic or graphic. </p>
                                                                <small class="mb-0 text-muted">22 Oct</small>
                                                            </div>
                                                        </div>
                                                        <div class="acitivity-item py-3 d-flex">
                                                            <div class="flex-shrink-0">
                                                                <div class="avatar-xs acitivity-avatar">
                                                                    <div class="avatar-title rounded-circle bg-soft-info text-info">
                                                                        <i class="ri-line-chart-line"></i>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h6 class="mb-1">Monthly sales report</h6>
                                                                <p class="text-muted mb-2"><span class="text-danger">2 days left</span> notification to submit the monthly sales report. <a href="javascript:void(0);" class="link-warning text-decoration-underline">Reports Builder</a></p>
                                                                <small class="mb-0 text-muted">15 Oct</small>
                                                            </div>
                                                        </div>
                                                        <div class="acitivity-item d-flex">
                                                            <div class="flex-shrink-0">
                                                                <img src="{$themePath}/assets/images/users/avatar-8.jpg" alt="" class="avatar-xs rounded-circle acitivity-avatar" />
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h6 class="mb-1">New ticket received <span class="badge bg-soft-success text-success align-middle">Completed</span></h6>
                                                                <p class="text-muted mb-2">User <span class="text-secondary">Erica245</span> submitted a ticket.</p>
                                                                <small class="mb-0 text-muted">26 Aug</small>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="offcanvas-foorter border p-3 text-center">
                                                <a href="javascript:void(0);" class="link-success">View All Acitivity <i class="ri-arrow-right-s-line align-middle ms-1"></i></a>
                                            </div>
                                        </div>

                                        <!-- bottom offcanvas -->
                                        <div class="offcanvas offcanvas-bottom" tabindex="-1" id="offcanvasBottom" aria-labelledby="offcanvasBottomLabel" style="min-height:46vh;">
                                            <div class="offcanvas-header border-bottom">
                                                <h5 class="offcanvas-title" id="offcanvasBottomLabel">Gallery</h5>
                                                <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                                            </div>
                                            <div class="offcanvas-body">
                                                <div class="row gallery-light">
                                                    <div class="col-xl-3 col-lg-4 col-sm-6">
                                                        <div class="gallery-box card light mb-0">
                                                            <div class="gallery-container">
                                                                <a href="#" title="">
                                                                    <img class="gallery-img img-fluid mx-auto" src="{$themePath}/assets/images/small/img-12.jpg" alt="" />
                                                                    <div class="gallery-overlay">
                                                                        <h5 class="overlay-caption">A mix of friends and strangers heading off to find an adventure.</h5>
                                                                    </div>
                                                                </a>
                                                            </div>
                                                            <div class="box-content">
                                                                <div class="d-flex align-items-center mt-1">
                                                                    <div class="flex-grow-1 text-muted">by <a href="" class="text-body text-truncate">Erica Kernan</a></div>
                                                                    <div class="flex-shrink-0">
                                                                        <div class="d-flex gap-3">
                                                                            <button type="button" class="btn btn-sm fs-12 btn-link text-body text-decoration-none px-0">
                                                                                <i class="ri-thumb-up-fill text-muted align-bottom me-1"></i> 3.4K
                                                                            </button>
                                                                            <button type="button" class="btn btn-sm fs-12 btn-link text-body text-decoration-none px-0">
                                                                                <i class="ri-question-answer-fill text-muted align-bottom me-1"></i> 1.3k
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--end col-->
                                                    <div class="col-xl-3 col-lg-4 col-sm-6">
                                                        <div class="gallery-box card light mb-0">
                                                            <div class="gallery-container">
                                                                <a href="#" title="">
                                                                    <img class="gallery-img img-fluid mx-auto" src="{$themePath}/assets/images/small/img-9.jpg" alt="" />
                                                                    <div class="gallery-overlay">
                                                                        <h5 class="overlay-caption">Dramatic clouds at the Golden Gate Bridge</h5>
                                                                    </div>
                                                                </a>
                                                            </div>
                                                            <div class="box-content">
                                                                <div class="d-flex align-items-center mt-1">
                                                                    <div class="flex-grow-1 text-muted">by <a href="" class="text-body text-truncate">Ron Mackie</a></div>
                                                                    <div class="flex-shrink-0">
                                                                        <div class="d-flex gap-3">
                                                                            <button type="button" class="btn btn-sm fs-12 btn-link text-body text-decoration-none px-0">
                                                                                <i class="ri-thumb-up-fill text-muted align-bottom me-1"></i> 5.1K
                                                                            </button>
                                                                            <button type="button" class="btn btn-sm fs-12 btn-link text-body text-decoration-none px-0">
                                                                                <i class="ri-question-answer-fill text-muted align-bottom me-1"></i> 4.7k
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--end col-->
                                                    <div class="col-xl-3 col-lg-4 col-sm-6">
                                                        <div class="gallery-box card mb-0">
                                                            <div class="gallery-container">
                                                                <a href="#" title="">
                                                                    <img class="gallery-img img-fluid mx-auto" src="{$themePath}/assets/images/small/img-11.jpg" alt="" />
                                                                    <div class="gallery-overlay">
                                                                        <h5 class="overlay-caption">Cycling in the countryside</h5>
                                                                    </div>
                                                                </a>

                                                            </div>

                                                            <div class="box-content">
                                                                <div class="d-flex align-items-center mt-1">
                                                                    <div class="flex-grow-1 text-muted">by <a href="" class="text-body text-truncate">Nancy Martino</a></div>
                                                                    <div class="flex-shrink-0">
                                                                        <div class="d-flex gap-3">
                                                                            <button type="button" class="btn btn-sm fs-12 btn-link text-body text-decoration-none px-0">
                                                                                <i class="ri-thumb-up-fill text-muted align-bottom me-1"></i> 3.2K
                                                                            </button>
                                                                            <button type="button" class="btn btn-sm fs-12 btn-link text-body text-decoration-none px-0">
                                                                                <i class="ri-question-answer-fill text-muted align-bottom me-1"></i> 1.1K
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--end col-->
                                                    <div class="col-xl-3 col-lg-4 col-sm-6 d-md-none d-xl-block">
                                                        <div class="gallery-box card mb-0">
                                                            <div class="gallery-container">
                                                                <a href="#" title="">
                                                                    <img class="gallery-img img-fluid mx-auto" src="{$themePath}/assets/images/small/img-10.jpg" alt="" />
                                                                    <div class="gallery-overlay">
                                                                        <h5 class="overlay-caption">Fun day at the Hill Station</h5>
                                                                    </div>
                                                                </a>
                                                            </div>
                                                            <div class="box-content">
                                                                <div class="d-flex align-items-center mt-1">
                                                                    <div class="flex-grow-1 text-muted">by <a href="" class="text-body text-truncate">Henry Baird</a></div>
                                                                    <div class="flex-shrink-0">
                                                                        <div class="d-flex gap-3">
                                                                            <button type="button" class="btn btn-sm fs-12 btn-link text-body text-decoration-none px-0">
                                                                                <i class="ri-thumb-up-fill text-muted align-bottom me-1"></i> 632
                                                                            </button>
                                                                            <button type="button" class="btn btn-sm fs-12 btn-link text-body text-decoration-none px-0">
                                                                                <i class="ri-question-answer-fill text-muted align-bottom me-1"></i> 95
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--end col-->
                                                </div>
                                                <!--end row-->
                                            </div>
                                        </div>

                                        <!-- left offcanvas -->
                                        <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasLeft" aria-labelledby="offcanvasLeftLabel">
                                            <div class="offcanvas-header border-bottom">
                                                <h5 class="offcanvas-title" id="offcanvasLeftLabel">Recent Acitivity</h5>
                                                <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                                            </div>
                                            <div class="offcanvas-body p-0 overflow-hidden">
                                                <div data-simplebar="" style="height: calc(100vh - 112px);">
                                                    <div class="acitivity-timeline p-4">
                                                        <div class="acitivity-item d-flex">
                                                            <div class="flex-shrink-0">
                                                                <img src="{$themePath}/assets/images/users/avatar-1.jpg" alt="" class="avatar-xs rounded-circle acitivity-avatar"></img>
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h6 class="mb-1">Oliver Phillips <span class="badge bg-soft-primary text-primary align-middle">New</span></h6>
                                                                <p class="text-muted mb-2">We talked about a project on linkedin.</p>
                                                                <small class="mb-0 text-muted">Today</small>
                                                            </div>
                                                        </div>
                                                        <div class="acitivity-item py-3 d-flex">
                                                            <div class="flex-shrink-0 avatar-xs acitivity-avatar">
                                                                <div class="avatar-title bg-soft-success text-success rounded-circle">
                                                                    N
                                                                </div>
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h6 class="mb-1">Nancy Martino <span class="badge bg-soft-secondary text-secondary align-middle">In Progress</span></h6>
                                                                <p class="text-muted mb-2"><i class="ri-file-text-line align-middle ms-2"></i> Create new project Buildng product</p>
                                                                <div class="avatar-group mb-2">
                                                                    <a href="javascript: void(0);" class="avatar-group-item" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Christi">
                                                                        <img src="{$themePath}/assets/images/users/avatar-4.jpg" alt="" class="rounded-circle avatar-xs"></img>
                                                                    </a>
                                                                    <a href="javascript: void(0);" class="avatar-group-item" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Frank Hook">
                                                                        <img src="{$themePath}/assets/images/users/avatar-3.jpg" alt="" class="rounded-circle avatar-xs"></img>
                                                                    </a>
                                                                    <a href="javascript: void(0);" class="avatar-group-item" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title=" Ruby">
                                                                        <div class="avatar-xs">
                                                                            <div class="avatar-title rounded-circle bg-light text-primary">
                                                                                R
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                    <a href="javascript: void(0);" class="avatar-group-item" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="more">
                                                                        <div class="avatar-xs">
                                                                            <div class="avatar-title rounded-circle">
                                                                                2+
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                </div>
                                                                <small class="mb-0 text-muted">Yesterday</small>
                                                            </div>
                                                        </div>
                                                        <div class="acitivity-item py-3 d-flex">
                                                            <div class="flex-shrink-0">
                                                                <img src="{$themePath}/assets/images/users/avatar-2.jpg" alt="" class="avatar-xs rounded-circle acitivity-avatar"></img>
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h6 class="mb-1">Natasha Carey <span class="badge bg-soft-success text-success align-middle">Completed</span></h6>
                                                                <p class="text-muted mb-2">Adding a new event with attachments</p>
                                                                <div class="row border border-dashed gx-2 p-2 mb-2">
                                                                    <div class="col-4">
                                                                        <img src="{$themePath}/assets/images/small/img-2.jpg" alt="" class="img-fluid rounded" />
                                                                    </div>
                                                                    <div class="col-4">
                                                                        <img src="{$themePath}/assets/images/small/img-3.jpg" alt="" class="img-fluid rounded" />
                                                                    </div>
                                                                    <div class="col-4">
                                                                        <img src="{$themePath}/assets/images/small/img-4.jpg" alt="" class="img-fluid rounded" />
                                                                    </div>
                                                                </div>
                                                                <small class="mb-0 text-muted">25 Nov</small>
                                                            </div>
                                                        </div>
                                                        <div class="acitivity-item py-3 d-flex">
                                                            <div class="flex-shrink-0">
                                                                <img src="{$themePath}/assets/images/users/avatar-6.jpg" alt="" class="avatar-xs rounded-circle acitivity-avatar"></img>
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h6 class="mb-1">Bethany Johnson</h6>
                                                                <p class="text-muted mb-2">added a new member to velzon dashboard</p>
                                                                <small class="mb-0 text-muted">19 Nov</small>
                                                            </div>
                                                        </div>
                                                        <div class="acitivity-item py-3 d-flex">
                                                            <div class="flex-shrink-0">
                                                                <div class="avatar-xs acitivity-avatar">
                                                                    <div class="avatar-title rounded-circle bg-soft-danger text-danger">
                                                                        <i class="ri-shopping-bag-line"></i>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h6 class="mb-1">Your order is placed <span class="badge bg-soft-danger text-danger align-middle ms-1">Out of Delivery</span></h6>
                                                                <p class="text-muted mb-2">These customers can rest assured their order has been placed.</p>
                                                                <small class="mb-0 text-muted">16 Nov</small>
                                                            </div>
                                                        </div>
                                                        <div class="acitivity-item py-3 d-flex">
                                                            <div class="flex-shrink-0">
                                                                <img src="{$themePath}/assets/images/users/avatar-7.jpg" alt="" class="avatar-xs rounded-circle acitivity-avatar"></img>
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h6 class="mb-1">Lewis Pratt</h6>
                                                                <p class="text-muted mb-2">They all have something to say beyond the words on the page. They can come across as casual or neutral, exotic or graphic. </p>
                                                                <small class="mb-0 text-muted">22 Oct</small>
                                                            </div>
                                                        </div>
                                                        <div class="acitivity-item py-3 d-flex">
                                                            <div class="flex-shrink-0">
                                                                <div class="avatar-xs acitivity-avatar">
                                                                    <div class="avatar-title rounded-circle bg-soft-info text-info">
                                                                        <i class="ri-line-chart-line"></i>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h6 class="mb-1">Monthly sales report</h6>
                                                                <p class="text-muted mb-2"><span class="text-danger">2 days left</span> notification to submit the monthly sales report. <a href="javascript:void(0);" class="link-warning text-decoration-underline">Reports Builder</a></p>
                                                                <small class="mb-0 text-muted">15 Oct</small>
                                                            </div>
                                                        </div>
                                                        <div class="acitivity-item d-flex">
                                                            <div class="flex-shrink-0">
                                                                <img src="{$themePath}/assets/images/users/avatar-8.jpg" alt="" class="avatar-xs rounded-circle acitivity-avatar" />
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h6 class="mb-1">New ticket received <span class="badge bg-soft-success text-success align-middle">Completed</span></h6>
                                                                <p class="text-muted mb-2">User <span class="text-secondary">Erica245</span> submitted a ticket.</p>
                                                                <small class="mb-0 text-muted">26 Aug</small>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="offcanvas-foorter border-top p-3 text-center">
                                                <a href="javascript:void(0);" class="link-success">View All Acitivity <i class="ri-arrow-right-s-line align-middle ms-1"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="d-none code-view">
                                        <pre class="language-markup" style="height: 275px;">
<code>&lt;!-- Placement Offcanvas --&gt;
&lt;div class=&quot;d-flex flex-wrap gap-2&quot;&gt;
    &lt;button class=&quot;btn btn-light&quot; type=&quot;button&quot; data-bs-toggle=&quot;offcanvas&quot; data-bs-target=&quot;#offcanvasTop&quot; aria-controls=&quot;offcanvasTop&quot;&gt;Toggle Top offcanvas&lt;/button&gt;
    &lt;button class=&quot;btn btn-light&quot; type=&quot;button&quot; data-bs-toggle=&quot;offcanvas&quot; data-bs-target=&quot;#offcanvasRight&quot; aria-controls=&quot;offcanvasRight&quot;&gt;Toggle Right offcanvas&lt;/button&gt;
    &lt;button class=&quot;btn btn-light&quot; type=&quot;button&quot; data-bs-toggle=&quot;offcanvas&quot; data-bs-target=&quot;#offcanvasBottom&quot; aria-controls=&quot;offcanvasBottom&quot;&gt;Toggle Bottom offcanvas&lt;/button&gt;
    &lt;button class=&quot;btn btn-light&quot; type=&quot;button&quot; data-bs-toggle=&quot;offcanvas&quot; data-bs-target=&quot;#offcanvasLeft&quot; aria-controls=&quot;offcanvasLeft&quot;&gt;Toggle Left offcanvas&lt;/button&gt;
&lt;/div&gt;</code>

<code>&lt;!-- top offcanvas --&gt;
&lt;div class=&quot;offcanvas offcanvas-top&quot; tabindex=&quot;-1&quot; id=&quot;offcanvasTop&quot; aria-labelledby=&quot;offcanvasTopLabel&quot;&gt;
    &lt;div class=&quot;offcanvas-header&quot;&gt;
        &lt;h5 id=&quot;offcanvasTopLabel&quot;&gt;Offcanvas Top&lt;/h5&gt;
        &lt;button type=&quot;button&quot; class=&quot;btn-close text-reset&quot; data-bs-dismiss=&quot;offcanvas&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
    &lt;/div&gt;
    &lt;div class=&quot;offcanvas-body&quot;&gt;
        ...
    &lt;/div&gt;
&lt;/d0iv&gt;</code>

<code>&lt;!-- right offcanvas --&gt;
&lt;div class=&quot;offcanvas offcanvas-end&quot; tabindex=&quot;-1&quot; id=&quot;offcanvasRight&quot; aria-labelledby=&quot;offcanvasRightLabel&quot;&gt;
    &lt;div class=&quot;offcanvas-header&quot;&gt;
        &lt;h5 id=&quot;offcanvasRightLabel&quot;&gt;Offcanvas Right&lt;/h5&gt;
        &lt;button type=&quot;button&quot; class=&quot;btn-close text-reset&quot; data-bs-dismiss=&quot;offcanvas&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
    &lt;/div&gt;
    &lt;div class=&quot;offcanvas-body&quot;&gt;
        ...
    &lt;/div&gt;
&lt;/div&gt;</code>

<code>&lt;!-- bottom offcanvas --&gt;
&lt;div class=&quot;offcanvas offcanvas-bottom&quot; tabindex=&quot;-1&quot; id=&quot;offcanvasBottom&quot; aria-labelledby=&quot;offcanvasBottomLabel&quot;&gt;
    &lt;div class=&quot;offcanvas-header&quot;&gt;
        &lt;h5 id=&quot;offcanvasBottomLabel&quot;&gt;Offcanvas Bottom&lt;/h5&gt;
        &lt;button type=&quot;button&quot; class=&quot;btn-close text-reset&quot; data-bs-dismiss=&quot;offcanvas&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
    &lt;/div&gt;
    &lt;div class=&quot;offcanvas-body&quot;&gt;
        ...
    &lt;/div&gt;
&lt;/div&gt;</code>

<code>&lt;!-- left offcanvas --&gt;
&lt;div class=&quot;offcanvas offcanvas-start&quot; tabindex=&quot;-1&quot; id=&quot;offcanvasLeft&quot; aria-labelledby=&quot;offcanvasLeftLabel&quot;&gt;
    &lt;div class=&quot;offcanvas-header&quot;&gt;
        &lt;h5 id=&quot;offcanvasLeftLabel&quot;&gt;Offcanvas Left&lt;/h5&gt;
        &lt;button type=&quot;button&quot; class=&quot;btn-close text-reset&quot; data-bs-dismiss=&quot;offcanvas&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
    &lt;/div&gt;
    &lt;div class=&quot;offcanvas-body&quot;&gt;
        ...
    &lt;/div&gt;
&lt;/div&gt;</code></pre>
                                    </div>
                                </div><!-- end card-body -->
                            </div><!-- end card -->
                        </div><!-- end col -->
                    </div><!-- end row -->

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header align-items-center d-flex">
                                    <h4 class="card-title mb-0 flex-grow-1">Backdrop Offcanvas</h4>
                                    <div class="flex-shrink-0">
                                        <div class="form-check form-switch form-switch-right form-switch-md">
                                            <label for="backdrop-showcode" class="form-label text-muted">Show Code</label>
                                            <input class="form-check-input code-switcher" type="checkbox" id="backdrop-showcode"></input>
                                        </div>
                                    </div>
                                </div><!-- end card header -->
                                <div class="card-body">
                                    <p class="text-muted">Here are the example of offcanvas with scrolling active and backdrop visible.</p>
                                    <div class="live-preview">
                                        <div class="d-flex flex-wrap gap-2">
                                            <button class="btn btn-light" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasScrolling" aria-controls="offcanvasScrolling">Enable Body Scrolling</button>
                                            <button class="btn btn-light" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasWithBackdrop" aria-controls="offcanvasWithBackdrop">Enable Backdrop (Default)</button>
                                            <button class="btn btn-light" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasWithBothOptions" aria-controls="offcanvasWithBothOptions">Enable Both Scrolling &amp; Backdrop</button>
                                        </div>

                                        <div class="offcanvas offcanvas-start" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling" aria-labelledby="offcanvasScrollingLabel">
                                            <div class="offcanvas-header border-bottom">
                                                <h5 class="offcanvas-title" id="offcanvasScrollingLabel">Customer Activity</h5>
                                                <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                                            </div>
                                            <div class="offcanvas-body p-0 overflow-hidden">
                                                <div data-simplebar="" style="height: calc(100vh - 112px);">
                                                    <div class="acitivity-timeline p-4">
                                                        <div class="acitivity-item d-flex">
                                                            <div class="flex-shrink-0">
                                                                <img src="{$themePath}/assets/images/users/avatar-1.jpg" alt="" class="avatar-xs rounded-circle acitivity-avatar"></img>
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h6 class="mb-1">Oliver Phillips <span class="badge bg-soft-primary text-primary align-middle">New</span></h6>
                                                                <p class="text-muted mb-2">We talked about a project on linkedin.</p>
                                                                <small class="mb-0 text-muted">Today</small>
                                                            </div>
                                                        </div>
                                                        <div class="acitivity-item py-3 d-flex">
                                                            <div class="flex-shrink-0 avatar-xs acitivity-avatar">
                                                                <div class="avatar-title bg-soft-success text-success rounded-circle">
                                                                    N
                                                                </div>
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h6 class="mb-1">Nancy Martino <span class="badge bg-soft-secondary text-secondary align-middle">In Progress</span></h6>
                                                                <p class="text-muted mb-2"><i class="ri-file-text-line align-middle ms-2"></i> Create new project Buildng product</p>
                                                                <div class="avatar-group mb-2">
                                                                    <a href="javascript: void(0);" class="avatar-group-item" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Christi">
                                                                        <img src="{$themePath}/assets/images/users/avatar-4.jpg" alt="" class="rounded-circle avatar-xs"></img>
                                                                    </a>
                                                                    <a href="javascript: void(0);" class="avatar-group-item" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Frank Hook">
                                                                        <img src="{$themePath}/assets/images/users/avatar-3.jpg" alt="" class="rounded-circle avatar-xs"></img>
                                                                    </a>
                                                                    <a href="javascript: void(0);" class="avatar-group-item" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title=" Ruby">
                                                                        <div class="avatar-xs">
                                                                            <div class="avatar-title rounded-circle bg-light text-primary">
                                                                                R
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                    <a href="javascript: void(0);" class="avatar-group-item" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="more">
                                                                        <div class="avatar-xs">
                                                                            <div class="avatar-title rounded-circle">
                                                                                2+
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                </div>
                                                                <small class="mb-0 text-muted">Yesterday</small>
                                                            </div>
                                                        </div>
                                                        <div class="acitivity-item py-3 d-flex">
                                                            <div class="flex-shrink-0">
                                                                <img src="{$themePath}/assets/images/users/avatar-2.jpg" alt="" class="avatar-xs rounded-circle acitivity-avatar"></img>
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h6 class="mb-1">Natasha Carey <span class="badge bg-soft-success text-success align-middle">Completed</span></h6>
                                                                <p class="text-muted mb-2">Adding a new event with attachments</p>
                                                                <div class="row border border-dashed gx-2 p-2 mb-2">
                                                                    <div class="col-4">
                                                                        <img src="{$themePath}/assets/images/small/img-2.jpg" alt="" class="img-fluid rounded" />
                                                                    </div>
                                                                    <div class="col-4">
                                                                        <img src="{$themePath}/assets/images/small/img-3.jpg" alt="" class="img-fluid rounded" />
                                                                    </div>
                                                                    <div class="col-4">
                                                                        <img src="{$themePath}/assets/images/small/img-4.jpg" alt="" class="img-fluid rounded" />
                                                                    </div>
                                                                </div>
                                                                <small class="mb-0 text-muted">25 Nov</small>
                                                            </div>
                                                        </div>
                                                        <div class="acitivity-item py-3 d-flex">
                                                            <div class="flex-shrink-0">
                                                                <img src="{$themePath}/assets/images/users/avatar-6.jpg" alt="" class="avatar-xs rounded-circle acitivity-avatar"></img>
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h6 class="mb-1">Bethany Johnson</h6>
                                                                <p class="text-muted mb-2">added a new member to velzon dashboard</p>
                                                                <small class="mb-0 text-muted">19 Nov</small>
                                                            </div>
                                                        </div>
                                                        <div class="acitivity-item py-3 d-flex">
                                                            <div class="flex-shrink-0">
                                                                <div class="avatar-xs acitivity-avatar">
                                                                    <div class="avatar-title rounded-circle bg-soft-danger text-danger">
                                                                        <i class="ri-shopping-bag-line"></i>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h6 class="mb-1">Your order is placed <span class="badge bg-soft-danger text-danger align-middle ms-1">Out of Delivery</span></h6>
                                                                <p class="text-muted mb-2">These customers can rest assured their order has been placed.</p>
                                                                <small class="mb-0 text-muted">16 Nov</small>
                                                            </div>
                                                        </div>
                                                        <div class="acitivity-item py-3 d-flex">
                                                            <div class="flex-shrink-0">
                                                                <img src="{$themePath}/assets/images/users/avatar-7.jpg" alt="" class="avatar-xs rounded-circle acitivity-avatar"></img>
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h6 class="mb-1">Lewis Pratt</h6>
                                                                <p class="text-muted mb-2">They all have something to say beyond the words on the page. They can come across as casual or neutral, exotic or graphic. </p>
                                                                <small class="mb-0 text-muted">22 Oct</small>
                                                            </div>
                                                        </div>
                                                        <div class="acitivity-item py-3 d-flex">
                                                            <div class="flex-shrink-0">
                                                                <div class="avatar-xs acitivity-avatar">
                                                                    <div class="avatar-title rounded-circle bg-soft-info text-info">
                                                                        <i class="ri-line-chart-line"></i>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h6 class="mb-1">Monthly sales report</h6>
                                                                <p class="text-muted mb-2"><span class="text-danger">2 days left</span> notification to submit the monthly sales report. <a href="javascript:void(0);" class="link-warning text-decoration-underline">Reports Builder</a></p>
                                                                <small class="mb-0 text-muted">15 Oct</small>
                                                            </div>
                                                        </div>
                                                        <div class="acitivity-item d-flex">
                                                            <div class="flex-shrink-0">
                                                                <img src="{$themePath}/assets/images/users/avatar-8.jpg" alt="" class="avatar-xs rounded-circle acitivity-avatar" />
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h6 class="mb-1">New ticket received <span class="badge bg-soft-success text-success align-middle">Completed</span></h6>
                                                                <p class="text-muted mb-2">User <span class="text-secondary">Erica245</span> submitted a ticket.</p>
                                                                <small class="mb-0 text-muted">26 Aug</small>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="offcanvas-foorter border-top p-3 text-center">
                                                <a href="javascript:void(0);" class="link-success">View All Acitivity <i class="ri-arrow-right-s-line align-middle ms-1"></i></a>
                                            </div>
                                        </div>

                                        <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasWithBackdrop" aria-labelledby="offcanvasWithBackdropLabel">
                                            <div class="offcanvas-header border-bottom">
                                                <h5 class="offcanvas-title" id="offcanvasWithBackdropLabel">Customer Activity</h5>
                                                <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                                            </div>
                                            <div class="offcanvas-body p-0 overflow-hidden">
                                                <div data-simplebar="" style="height: calc(100vh - 112px);">
                                                    <div class="acitivity-timeline p-4">
                                                        <div class="acitivity-item d-flex">
                                                            <div class="flex-shrink-0">
                                                                <img src="{$themePath}/assets/images/users/avatar-1.jpg" alt="" class="avatar-xs rounded-circle acitivity-avatar"></img>
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h6 class="mb-1">Oliver Phillips <span class="badge bg-soft-primary text-primary align-middle">New</span></h6>
                                                                <p class="text-muted mb-2">We talked about a project on linkedin.</p>
                                                                <small class="mb-0 text-muted">Today</small>
                                                            </div>
                                                        </div>
                                                        <div class="acitivity-item py-3 d-flex">
                                                            <div class="flex-shrink-0 avatar-xs acitivity-avatar">
                                                                <div class="avatar-title bg-soft-success text-success rounded-circle">
                                                                    N
                                                                </div>
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h6 class="mb-1">Nancy Martino <span class="badge bg-soft-secondary text-secondary align-middle">In Progress</span></h6>
                                                                <p class="text-muted mb-2"><i class="ri-file-text-line align-middle ms-2"></i> Create new project Buildng product</p>
                                                                <div class="avatar-group mb-2">
                                                                    <a href="javascript: void(0);" class="avatar-group-item" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Christi">
                                                                        <img src="{$themePath}/assets/images/users/avatar-4.jpg" alt="" class="rounded-circle avatar-xs"></img>
                                                                    </a>
                                                                    <a href="javascript: void(0);" class="avatar-group-item" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Frank Hook">
                                                                        <img src="{$themePath}/assets/images/users/avatar-3.jpg" alt="" class="rounded-circle avatar-xs"></img>
                                                                    </a>
                                                                    <a href="javascript: void(0);" class="avatar-group-item" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title=" Ruby">
                                                                        <div class="avatar-xs">
                                                                            <div class="avatar-title rounded-circle bg-light text-primary">
                                                                                R
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                    <a href="javascript: void(0);" class="avatar-group-item" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="more">
                                                                        <div class="avatar-xs">
                                                                            <div class="avatar-title rounded-circle">
                                                                                2+
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                </div>
                                                                <small class="mb-0 text-muted">Yesterday</small>
                                                            </div>
                                                        </div>
                                                        <div class="acitivity-item py-3 d-flex">
                                                            <div class="flex-shrink-0">
                                                                <img src="{$themePath}/assets/images/users/avatar-2.jpg" alt="" class="avatar-xs rounded-circle acitivity-avatar"></img>
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h6 class="mb-1">Natasha Carey <span class="badge bg-soft-success text-success align-middle">Completed</span></h6>
                                                                <p class="text-muted mb-2">Adding a new event with attachments</p>
                                                                <div class="row border border-dashed gx-2 p-2 mb-2">
                                                                    <div class="col-4">
                                                                        <img src="{$themePath}/assets/images/small/img-2.jpg" alt="" class="img-fluid rounded" />
                                                                    </div>
                                                                    <div class="col-4">
                                                                        <img src="{$themePath}/assets/images/small/img-3.jpg" alt="" class="img-fluid rounded" />
                                                                    </div>
                                                                    <div class="col-4">
                                                                        <img src="{$themePath}/assets/images/small/img-4.jpg" alt="" class="img-fluid rounded" />
                                                                    </div>
                                                                </div>
                                                                <small class="mb-0 text-muted">25 Nov</small>
                                                            </div>
                                                        </div>
                                                        <div class="acitivity-item py-3 d-flex">
                                                            <div class="flex-shrink-0">
                                                                <img src="{$themePath}/assets/images/users/avatar-6.jpg" alt="" class="avatar-xs rounded-circle acitivity-avatar"></img>
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h6 class="mb-1">Bethany Johnson</h6>
                                                                <p class="text-muted mb-2">added a new member to velzon dashboard</p>
                                                                <small class="mb-0 text-muted">19 Nov</small>
                                                            </div>
                                                        </div>
                                                        <div class="acitivity-item py-3 d-flex">
                                                            <div class="flex-shrink-0">
                                                                <div class="avatar-xs acitivity-avatar">
                                                                    <div class="avatar-title rounded-circle bg-soft-danger text-danger">
                                                                        <i class="ri-shopping-bag-line"></i>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h6 class="mb-1">Your order is placed <span class="badge bg-soft-danger text-danger align-middle ms-1">Out of Delivery</span></h6>
                                                                <p class="text-muted mb-2">These customers can rest assured their order has been placed.</p>
                                                                <small class="mb-0 text-muted">16 Nov</small>
                                                            </div>
                                                        </div>
                                                        <div class="acitivity-item py-3 d-flex">
                                                            <div class="flex-shrink-0">
                                                                <img src="{$themePath}/assets/images/users/avatar-7.jpg" alt="" class="avatar-xs rounded-circle acitivity-avatar"></img>
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h6 class="mb-1">Lewis Pratt</h6>
                                                                <p class="text-muted mb-2">They all have something to say beyond the words on the page. They can come across as casual or neutral, exotic or graphic. </p>
                                                                <small class="mb-0 text-muted">22 Oct</small>
                                                            </div>
                                                        </div>
                                                        <div class="acitivity-item py-3 d-flex">
                                                            <div class="flex-shrink-0">
                                                                <div class="avatar-xs acitivity-avatar">
                                                                    <div class="avatar-title rounded-circle bg-soft-info text-info">
                                                                        <i class="ri-line-chart-line"></i>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h6 class="mb-1">Monthly sales report</h6>
                                                                <p class="text-muted mb-2"><span class="text-danger">2 days left</span> notification to submit the monthly sales report. <a href="javascript:void(0);" class="link-warning text-decoration-underline">Reports Builder</a></p>
                                                                <small class="mb-0 text-muted">15 Oct</small>
                                                            </div>
                                                        </div>
                                                        <div class="acitivity-item d-flex">
                                                            <div class="flex-shrink-0">
                                                                <img src="{$themePath}/assets/images/users/avatar-8.jpg" alt="" class="avatar-xs rounded-circle acitivity-avatar" />
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h6 class="mb-1">New ticket received <span class="badge bg-soft-success text-success align-middle">Completed</span></h6>
                                                                <p class="text-muted mb-2">User <span class="text-secondary">Erica245</span> submitted a ticket.</p>
                                                                <small class="mb-0 text-muted">26 Aug</small>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="offcanvas-foorter border-top p-3 text-center">
                                                <a href="javascript:void(0);" class="link-success">View All Acitivity <i class="ri-arrow-right-s-line align-middle ms-1"></i></a>
                                            </div>
                                        </div>

                                        <div class="offcanvas offcanvas-start" data-bs-scroll="true" tabindex="-1" id="offcanvasWithBothOptions" aria-labelledby="offcanvasWithBothOptionsLabel">
                                            <div class="offcanvas-header border-bottom">
                                                <h5 class="offcanvas-title" id="offcanvasWithBothOptionsLabel">Customer Activity</h5>
                                                <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                                            </div>
                                            <div class="offcanvas-body p-0 overflow-hidden">
                                                <div data-simplebar="" style="height: calc(100vh - 112px);">
                                                    <div class="acitivity-timeline p-4">
                                                        <div class="acitivity-item d-flex">
                                                            <div class="flex-shrink-0">
                                                                <img src="{$themePath}/assets/images/users/avatar-1.jpg" alt="" class="avatar-xs rounded-circle acitivity-avatar"></img>
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h6 class="mb-1">Oliver Phillips <span class="badge bg-soft-primary text-primary align-middle">New</span></h6>
                                                                <p class="text-muted mb-2">We talked about a project on linkedin.</p>
                                                                <small class="mb-0 text-muted">Today</small>
                                                            </div>
                                                        </div>
                                                        <div class="acitivity-item py-3 d-flex">
                                                            <div class="flex-shrink-0 avatar-xs acitivity-avatar">
                                                                <div class="avatar-title bg-soft-success text-success rounded-circle">
                                                                    N
                                                                </div>
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h6 class="mb-1">Nancy Martino <span class="badge bg-soft-secondary text-secondary align-middle">In Progress</span></h6>
                                                                <p class="text-muted mb-2"><i class="ri-file-text-line align-middle ms-2"></i> Create new project Buildng product</p>
                                                                <div class="avatar-group mb-2">
                                                                    <a href="javascript: void(0);" class="avatar-group-item" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Christi">
                                                                        <img src="{$themePath}/assets/images/users/avatar-4.jpg" alt="" class="rounded-circle avatar-xs"></img>
                                                                    </a>
                                                                    <a href="javascript: void(0);" class="avatar-group-item" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Frank Hook">
                                                                        <img src="{$themePath}/assets/images/users/avatar-3.jpg" alt="" class="rounded-circle avatar-xs"></img>
                                                                    </a>
                                                                    <a href="javascript: void(0);" class="avatar-group-item" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title=" Ruby">
                                                                        <div class="avatar-xs">
                                                                            <div class="avatar-title rounded-circle bg-light text-primary">
                                                                                R
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                    <a href="javascript: void(0);" class="avatar-group-item" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="more">
                                                                        <div class="avatar-xs">
                                                                            <div class="avatar-title rounded-circle">
                                                                                2+
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                </div>
                                                                <small class="mb-0 text-muted">Yesterday</small>
                                                            </div>
                                                        </div>
                                                        <div class="acitivity-item py-3 d-flex">
                                                            <div class="flex-shrink-0">
                                                                <img src="{$themePath}/assets/images/users/avatar-2.jpg" alt="" class="avatar-xs rounded-circle acitivity-avatar"></img>
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h6 class="mb-1">Natasha Carey <span class="badge bg-soft-success text-success align-middle">Completed</span></h6>
                                                                <p class="text-muted mb-2">Adding a new event with attachments</p>
                                                                <div class="row border border-dashed gx-2 p-2 mb-2">
                                                                    <div class="col-4">
                                                                        <img src="{$themePath}/assets/images/small/img-2.jpg" alt="" class="img-fluid rounded" />
                                                                    </div>
                                                                    <div class="col-4">
                                                                        <img src="{$themePath}/assets/images/small/img-3.jpg" alt="" class="img-fluid rounded" />
                                                                    </div>
                                                                    <div class="col-4">
                                                                        <img src="{$themePath}/assets/images/small/img-4.jpg" alt="" class="img-fluid rounded" />
                                                                    </div>
                                                                </div>
                                                                <small class="mb-0 text-muted">25 Nov</small>
                                                            </div>
                                                        </div>
                                                        <div class="acitivity-item py-3 d-flex">
                                                            <div class="flex-shrink-0">
                                                                <img src="{$themePath}/assets/images/users/avatar-6.jpg" alt="" class="avatar-xs rounded-circle acitivity-avatar"></img>
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h6 class="mb-1">Bethany Johnson</h6>
                                                                <p class="text-muted mb-2">added a new member to velzon dashboard</p>
                                                                <small class="mb-0 text-muted">19 Nov</small>
                                                            </div>
                                                        </div>
                                                        <div class="acitivity-item py-3 d-flex">
                                                            <div class="flex-shrink-0">
                                                                <div class="avatar-xs acitivity-avatar">
                                                                    <div class="avatar-title rounded-circle bg-soft-danger text-danger">
                                                                        <i class="ri-shopping-bag-line"></i>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h6 class="mb-1">Your order is placed <span class="badge bg-soft-danger text-danger align-middle ms-1">Out of Delivery</span></h6>
                                                                <p class="text-muted mb-2">These customers can rest assured their order has been placed.</p>
                                                                <small class="mb-0 text-muted">16 Nov</small>
                                                            </div>
                                                        </div>
                                                        <div class="acitivity-item py-3 d-flex">
                                                            <div class="flex-shrink-0">
                                                                <img src="{$themePath}/assets/images/users/avatar-7.jpg" alt="" class="avatar-xs rounded-circle acitivity-avatar"></img>
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h6 class="mb-1">Lewis Pratt</h6>
                                                                <p class="text-muted mb-2">They all have something to say beyond the words on the page. They can come across as casual or neutral, exotic or graphic. </p>
                                                                <small class="mb-0 text-muted">22 Oct</small>
                                                            </div>
                                                        </div>
                                                        <div class="acitivity-item py-3 d-flex">
                                                            <div class="flex-shrink-0">
                                                                <div class="avatar-xs acitivity-avatar">
                                                                    <div class="avatar-title rounded-circle bg-soft-info text-info">
                                                                        <i class="ri-line-chart-line"></i>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h6 class="mb-1">Monthly sales report</h6>
                                                                <p class="text-muted mb-2"><span class="text-danger">2 days left</span> notification to submit the monthly sales report. <a href="javascript:void(0);" class="link-warning text-decoration-underline">Reports Builder</a></p>
                                                                <small class="mb-0 text-muted">15 Oct</small>
                                                            </div>
                                                        </div>
                                                        <div class="acitivity-item d-flex">
                                                            <div class="flex-shrink-0">
                                                                <img src="{$themePath}/assets/images/users/avatar-8.jpg" alt="" class="avatar-xs rounded-circle acitivity-avatar" />
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h6 class="mb-1">New ticket received <span class="badge bg-soft-success text-success align-middle">Completed</span></h6>
                                                                <p class="text-muted mb-2">User <span class="text-secondary">Erica245</span> submitted a ticket.</p>
                                                                <small class="mb-0 text-muted">26 Aug</small>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="offcanvas-foorter border-top p-3 text-center">
                                                <a href="javascript:void(0);" class="link-success">View All Acitivity <i class="ri-arrow-right-s-line align-middle ms-1"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="d-none code-view">
                                        <pre class="language-markup" style="height: 275px;">
<code>&lt;!-- Backdrop Offcanvas --&gt;
&lt;div class=&quot;d-flex flex-wrap gap-2&quot;&gt;
    &lt;button class=&quot;btn btn-light&quot; type=&quot;button&quot; data-bs-toggle=&quot;offcanvas&quot; data-bs-target=&quot;#offcanvasScrolling&quot; aria-controls=&quot;offcanvasScrolling&quot;&gt;Enable body scrolling&lt;/button&gt;
    &lt;button class=&quot;btn btn-light&quot; type=&quot;button&quot; data-bs-toggle=&quot;offcanvas&quot; data-bs-target=&quot;#offcanvasWithBackdrop&quot; aria-controls=&quot;offcanvasWithBackdrop&quot;&gt;Enable backdrop (default)&lt;/button&gt;
    &lt;button class=&quot;btn btn-light&quot; type=&quot;button&quot; data-bs-toggle=&quot;offcanvas&quot; data-bs-target=&quot;#offcanvasWithBothOptions&quot; aria-controls=&quot;offcanvasWithBothOptions&quot;&gt;Enable both scrolling &amp; backdrop&lt;/button&gt;
&lt;/div&gt;</code>    

<code>&lt;div class=&quot;offcanvas offcanvas-start&quot; data-bs-scroll=&quot;true&quot; data-bs-backdrop=&quot;false&quot; tabindex=&quot;-1&quot; id=&quot;offcanvasScrolling&quot; aria-labelledby=&quot;offcanvasScrollingLabel&quot;&gt;
    &lt;div class=&quot;offcanvas-header&quot;&gt;
      &lt;h5 class=&quot;offcanvas-title&quot; id=&quot;offcanvasScrollingLabel&quot;&gt;Colored with scrolling&lt;/h5&gt;
      &lt;button type=&quot;button&quot; class=&quot;btn-close text-reset&quot; data-bs-dismiss=&quot;offcanvas&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
    &lt;/div&gt;
    &lt;div class=&quot;offcanvas-body&quot;&gt;
        ...
    &lt;/div&gt;
&lt;/div&gt;</code>

<code>&lt;div class=&quot;offcanvas offcanvas-start&quot; tabindex=&quot;-1&quot; id=&quot;offcanvasWithBackdrop&quot; aria-labelledby=&quot;offcanvasWithBackdropLabel&quot;&gt;
    &lt;div class=&quot;offcanvas-header&quot;&gt;
      &lt;h5 class=&quot;offcanvas-title&quot; id=&quot;offcanvasWithBackdropLabel&quot;&gt;Offcanvas with backdrop&lt;/h5&gt;
      &lt;button type=&quot;button&quot; class=&quot;btn-close text-reset&quot; data-bs-dismiss=&quot;offcanvas&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
    &lt;/div&gt;
    &lt;div class=&quot;offcanvas-body&quot;&gt;
      ...
    &lt;/div&gt;
&lt;/div&gt;</code>

<code>&lt;div class=&quot;offcanvas offcanvas-start&quot; data-bs-scroll=&quot;true&quot; tabindex=&quot;-1&quot; id=&quot;offcanvasWithBothOptions&quot; aria-labelledby=&quot;offcanvasWithBothOptionsLabel&quot;&gt;
    &lt;div class=&quot;offcanvas-header&quot;&gt;
      &lt;h5 class=&quot;offcanvas-title&quot; id=&quot;offcanvasWithBothOptionsLabel&quot;&gt;Backdroped with scrolling&lt;/h5&gt;
      &lt;button type=&quot;button&quot; class=&quot;btn-close text-reset&quot; data-bs-dismiss=&quot;offcanvas&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
    &lt;/div&gt;
    &lt;div class=&quot;offcanvas-body&quot;&gt;
        ...
    &lt;/div&gt;
&lt;/div&gt;</code></pre>
                                    </div>
                                </div><!-- end card-body -->
                            </div><!-- end card -->
                        </div>
                        <!-- end col -->
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

        <!-- prismjs plugin -->
        <script src="{$path}/libs/prismjs/prism.js"></script>


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
