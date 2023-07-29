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
                      <div class="col-xl-6">
                        <div class="card">
                          <div class="card-header align-items-center d-flex">
                            <h4 class="card-title mb-0 flex-grow-1">Slides Only</h4>
                            <div class="flex-shrink-0">
                              <div class="form-check form-switch form-switch-right form-switch-md">
                                <label for="default" class="form-label text-muted">Show Code</label>
                                <input class="form-check-input code-switcher" type="checkbox" id="default"/>
                              </div>
                            </div>
                          </div>                          <!-- end card header -->
                          <div class="card-body">
                            <p class="text-muted">Use<code> slide</code> class to set carousel with slides. Note the presence of the <code>d-block</code> and <code>w-100</code> class on carousel images to prevent browser default image alignment.</p>
                            <div class="live-preview">
                              <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel" data-bs-interval="3000">
                                <div class="carousel-inner" role="listbox">
                                  <div class="carousel-item carousel-item-next carousel-item-start">
                                    <img class="d-block img-fluid mx-auto" src="{$themePath}/assets/images/small/img-1.jpg" alt="First slide"/>
                                  </div>
                                  <div class="carousel-item">
                                    <img class="d-block img-fluid mx-auto" src="{$themePath}/assets/images/small/img-2.jpg" alt="Second slide"/>
                                  </div>
                                  <div class="carousel-item active carousel-item-start">
                                    <img class="d-block img-fluid mx-auto" src="{$themePath}/assets/images/small/img-3.jpg" alt="Third slide"/>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="d-none code-view">
                              <pre class="language-markup">
                                <code>&lt;!-- Slides Only --&gt;
&lt;div id=&quot;carouselExampleSlidesOnly&quot; class=&quot;carousel slide&quot; data-bs-ride=&quot;carousel&quot; data-bs-interval=&quot;3000&quot;&gt;
    &lt;div class=&quot;carousel-inner&quot; role=&quot;listbox&quot;&gt;
        &lt;div class=&quot;carousel-item carousel-item-next carousel-item-start&quot;&gt;
            &lt;img class=&quot;d-block img-fluid mx-auto&quot; src=&quot;...&quot; alt=&quot;First slide&quot;&gt;
        &lt;/div&gt;
        &lt;div class=&quot;carousel-item&quot;&gt;
            &lt;img class=&quot;d-block img-fluid mx-auto&quot; src=&quot;...&quot; alt=&quot;Second slide&quot;&gt;
        &lt;/div&gt;
        &lt;div class=&quot;carousel-item active carousel-item-start&quot;&gt;
            &lt;img class=&quot;d-block img-fluid mx-auto&quot; src=&quot;...&quot; alt=&quot;Third slide&quot;&gt;
        &lt;/div&gt;
    &lt;/div&gt;
&lt;/div&gt;</code>
                              </pre>
                            </div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>

                      <div class="col-xl-6">
                        <div class="card">
                          <div class="card-header align-items-center d-flex">
                            <h4 class="card-title mb-0 flex-grow-1">With Controls</h4>
                            <div class="flex-shrink-0">
                              <div class="form-check form-switch form-switch-right form-switch-md">
                                <label for="controls-slide" class="form-label text-muted">Show Code</label>
                                <input class="form-check-input code-switcher" type="checkbox" id="controls-slide"/>
                              </div>
                            </div>
                          </div>                          <!-- end card header -->
                          <div class="card-body">
                            <p class="text-muted">Use <code>carousel-control-prev</code> and <code>carousel-control-next</code> class with &lt;button&gt; or &lt;a&gt; tag element to show carousel with control navigation.</p>
                            <div class="live-preview">
                              <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                                <div class="carousel-inner" role="listbox">
                                  <div class="carousel-item active">
                                    <img class="d-block img-fluid mx-auto" src="{$themePath}/assets/images/small/img-4.jpg" alt="First slide"/>
                                  </div>
                                  <div class="carousel-item">
                                    <img class="d-block img-fluid mx-auto" src="{$themePath}/assets/images/small/img-5.jpg" alt="Second slide"/>
                                  </div>
                                  <div class="carousel-item">
                                    <img class="d-block img-fluid mx-auto" src="{$themePath}/assets/images/small/img-6.jpg" alt="Third slide"/>
                                  </div>
                                </div>
                                <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-bs-slide="prev">
                                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                  <span class="sr-only">Previous</span>
                                </a>
                                <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-bs-slide="next">
                                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                  <span class="sr-only">Next</span>
                                </a>
                              </div>
                            </div>

                            <div class="d-none code-view">
                              <pre class="language-markup" style="height: 375px;">
                                <code>&lt;!-- With Controls --&gt;
&lt;div id=&quot;carouselExampleControls&quot; class=&quot;carousel slide&quot; data-bs-ride=&quot;carousel&quot;&gt;
    &lt;div class=&quot;carousel-inner&quot; role=&quot;listbox&quot;&gt;
        &lt;div class=&quot;carousel-item active&quot;&gt;
            &lt;img class=&quot;d-block img-fluid mx-auto&quot; src=&quot;...&quot; alt=&quot;First slide&quot;&gt;
        &lt;/div&gt;
        &lt;div class=&quot;carousel-item&quot;&gt;
            &lt;img class=&quot;d-block img-fluid mx-auto&quot; src=&quot;...&quot; alt=&quot;Second slide&quot;&gt;
        &lt;/div&gt;
        &lt;div class=&quot;carousel-item&quot;&gt;
            &lt;img class=&quot;d-block img-fluid mx-auto&quot; src=&quot;...&quot; alt=&quot;Third slide&quot;&gt;
        &lt;/div&gt;
    &lt;/div&gt;
    &lt;a class=&quot;carousel-control-prev&quot; href=&quot;#carouselExampleControls&quot; role=&quot;button&quot; data-bs-slide=&quot;prev&quot;&gt;
        &lt;span class=&quot;carousel-control-prev-icon&quot; aria-hidden=&quot;true&quot;&gt;&lt;/span&gt;
        &lt;span class=&quot;sr-only&quot;&gt;Previous&lt;/span&gt;
    &lt;/a&gt;
    &lt;a class=&quot;carousel-control-next&quot; href=&quot;#carouselExampleControls&quot; role=&quot;button&quot; data-bs-slide=&quot;next&quot;&gt;
        &lt;span class=&quot;carousel-control-next-icon&quot; aria-hidden=&quot;true&quot;&gt;&lt;/span&gt;
        &lt;span class=&quot;sr-only&quot;&gt;Next&lt;/span&gt;
    &lt;/a&gt;
&lt;/div&gt;</code>
                              </pre>
                            </div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>
                    </div>

                    <div class="row">
                      <div class="col-xl-6">
                        <div class="card">
                          <div class="card-header align-items-center d-flex">
                            <h4 class="card-title mb-0 flex-grow-1">with Indicators</h4>
                            <div class="flex-shrink-0">
                              <div class="form-check form-switch form-switch-right form-switch-md">
                                <label for="indicators-slide" class="form-label text-muted">Show Code</label>
                                <input class="form-check-input code-switcher" type="checkbox" id="indicators-slide"/>
                              </div>
                            </div>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <p class="text-muted">Use <code>carousel-indicators</code> class with &lt;ol&gt; element to show carousel with indicators.</p>

                            <div class="live-preview">
                              <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                                <ol class="carousel-indicators">
                                  <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0"></li>
                                  <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"></li>
                                  <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" class="active" aria-current="true"></li>
                                </ol>
                                <div class="carousel-inner" role="listbox">
                                  <div class="carousel-item">
                                    <img class="d-block img-fluid mx-auto" src="{$themePath}/assets/images/small/img-3.jpg" alt="First slide"/>
                                  </div>
                                  <div class="carousel-item">
                                    <img class="d-block img-fluid mx-auto" src="{$themePath}/assets/images/small/img-2.jpg" alt="Second slide"/>
                                  </div>
                                  <div class="carousel-item active">
                                    <img class="d-block img-fluid mx-auto" src="{$themePath}/assets/images/small/img-1.jpg" alt="Third slide"/>
                                  </div>
                                </div>
                                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-bs-slide="prev">
                                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                  <span class="sr-only">Previous</span>
                                </a>
                                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-bs-slide="next">
                                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                  <span class="sr-only">Next</span>
                                </a>
                              </div>
                            </div>

                            <div class="d-none code-view">
                              <pre class="language-markup" style="height: 375px;">
                                <code>&lt;!-- With Indicators --&gt;
&lt;div id=&quot;carouselExampleIndicators&quot; class=&quot;carousel slide&quot; data-bs-ride=&quot;carousel&quot;&gt;
    &lt;ol class=&quot;carousel-indicators&quot;&gt;
        &lt;li data-bs-target=&quot;#carouselExampleIndicators&quot; data-bs-slide-to=&quot;0&quot; class=&quot;&quot;&gt;&lt;/li&gt;
        &lt;li data-bs-target=&quot;#carouselExampleIndicators&quot; data-bs-slide-to=&quot;1&quot; class=&quot;&quot;&gt;&lt;/li&gt;
        &lt;li data-bs-target=&quot;#carouselExampleIndicators&quot; data-bs-slide-to=&quot;2&quot; class=&quot;active&quot; aria-current=&quot;true&quot;&gt;&lt;/li&gt;
    &lt;/ol&gt;
    &lt;div class=&quot;carousel-inner&quot; role=&quot;listbox&quot;&gt;
        &lt;div class=&quot;carousel-item&quot;&gt;
            &lt;img class=&quot;d-block img-fluid mx-auto&quot; src=&quot;...&quot; alt=&quot;First slide&quot;&gt;
        &lt;/div&gt;
        &lt;div class=&quot;carousel-item&quot;&gt;
            &lt;img class=&quot;d-block img-fluid mx-auto&quot; src=&quot;...&quot; alt=&quot;Second slide&quot;&gt;
        &lt;/div&gt;
        &lt;div class=&quot;carousel-item active&quot;&gt;
            &lt;img class=&quot;d-block img-fluid mx-auto&quot; src=&quot;...&quot; alt=&quot;Third slide&quot;&gt;
        &lt;/div&gt;
    &lt;/div&gt;
    &lt;a class=&quot;carousel-control-prev&quot; href=&quot;#carouselExampleIndicators&quot; role=&quot;button&quot; data-bs-slide=&quot;prev&quot;&gt;
        &lt;span class=&quot;carousel-control-prev-icon&quot; aria-hidden=&quot;true&quot;&gt;&lt;/span&gt;
        &lt;span class=&quot;sr-only&quot;&gt;Previous&lt;/span&gt;
    &lt;/a&gt;
    &lt;a class=&quot;carousel-control-next&quot; href=&quot;#carouselExampleIndicators&quot; role=&quot;button&quot; data-bs-slide=&quot;next&quot;&gt;
        &lt;span class=&quot;carousel-control-next-icon&quot; aria-hidden=&quot;true&quot;&gt;&lt;/span&gt;
        &lt;span class=&quot;sr-only&quot;&gt;Next&lt;/span&gt;
    &lt;/a&gt;
&lt;/div&gt;</code>
                              </pre>
                            </div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>
                      <!--end col-->

                      <div class="col-xl-6">
                        <div class="card">
                          <div class="card-header align-items-center d-flex">
                            <h4 class="card-title mb-0 flex-grow-1">with Captions</h4>
                            <div class="flex-shrink-0">
                              <div class="form-check form-switch form-switch-right form-switch-md">
                                <label for="captions-slide" class="form-label text-muted">Show Code</label>
                                <input class="form-check-input code-switcher" type="checkbox" id="captions-slide"/>
                              </div>
                            </div>
                          </div>                          <!-- end card header -->
                          <div class="card-body">
                            <p class="text-muted">Use <code>carousel-caption</code> class to add captions to the carousel.</p>
                            <div class="live-preview">
                              <div id="carouselExampleCaption" class="carousel slide" data-bs-ride="carousel">
                                <div class="carousel-inner" role="listbox">
                                  <div class="carousel-item">
                                    <img src="{$themePath}/assets/images/small/img-7.jpg" alt="" class="d-block img-fluid mx-auto"/>
                                    <div class="carousel-caption text-white-50">
                                      <h5 class="text-white">Sunrise above a beach</h5>
                                      <p>You've probably heard that opposites attract. The same is true for fonts. Don't be afraid to combine font styles that are different but complementary.</p>
                                    </div>
                                  </div>
                                  <div class="carousel-item active">
                                    <img src="{$themePath}/assets/images/small/img-2.jpg" alt="" class="d-block img-fluid mx-auto"/>
                                    <div class="carousel-caption text-white-50">
                                      <h5 class="text-white">Working from home little spot</h5>
                                      <p>Consistency piques people’s interest is that it has become more and more popular over the years, which is excellent.</p>
                                    </div>
                                  </div>
                                  <div class="carousel-item">
                                    <img src="{$themePath}/assets/images/small/img-9.jpg" alt="" class="d-block img-fluid mx-auto"/>
                                    <div class="carousel-caption text-white-50">
                                      <h5 class="text-white">Dramatic clouds at the Golden Gate Bridge</h5>
                                      <p>Increase or decrease the letter spacing depending on the situation and try, try again until it looks right, and each letter.</p>
                                    </div>
                                  </div>
                                </div>
                                <a class="carousel-control-prev" href="#carouselExampleCaption" role="button" data-bs-slide="prev">
                                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                  <span class="sr-only">Previous</span>
                                </a>
                                <a class="carousel-control-next" href="#carouselExampleCaption" role="button" data-bs-slide="next">
                                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                  <span class="sr-only">Next</span>
                                </a>
                              </div>
                            </div>
                            <div class="d-none code-view">
                              <pre class="language-markup" style="height: 375px;">
                                <code>&lt;!-- With Captions --&gt;
&lt;div id=&quot;carouselExampleCaption&quot; class=&quot;carousel slide&quot; data-bs-ride=&quot;carousel&quot;&gt;
    &lt;div class=&quot;carousel-inner&quot; role=&quot;listbox&quot;&gt;
        &lt;div class=&quot;carousel-item&quot;&gt;
            &lt;img src=&quot;...&quot; alt=&quot;&quot; class=&quot;d-block img-fluid mx-auto&quot;&gt;
            &lt;div class=&quot;carousel-caption d-none d-md-block text-white-50&quot;&gt;
                &lt;h5 class=&quot;text-white&quot;&gt;Sunrise above a beach&lt;/h5&gt;
                &lt;p&gt;You've probably heard that opposites attract. The same is true for fonts. Don't be afraid to combine font styles that are different but complementary.&lt;/p&gt;
            &lt;/div&gt;
        &lt;/div&gt;
        &lt;div class=&quot;carousel-item active&quot;&gt;
            &lt;img src=&quot;...&quot; alt=&quot;&quot; class=&quot;d-block img-fluid mx-auto&quot;&gt;
            &lt;div class=&quot;carousel-caption d-none d-md-block text-white-50&quot;&gt;
                &lt;h5 class=&quot;text-white&quot;&gt;Working from home little spot&lt;/h5&gt;
                &lt;p&gt;Consistency piques people’s interest is that it has become more and more popular over the years, which is excellent.&lt;/p&gt;
            &lt;/div&gt;
        &lt;/div&gt;
        &lt;div class=&quot;carousel-item&quot;&gt;
            &lt;img src=&quot;...&quot; alt=&quot;&quot; class=&quot;d-block img-fluid mx-auto&quot;&gt;
            &lt;div class=&quot;carousel-caption d-none d-md-block text-white-50&quot;&gt;
                &lt;h5 class=&quot;text-white&quot;&gt;Dramatic clouds at the Golden Gate Bridge&lt;/h5&gt;
                &lt;p&gt;Increase or decrease the letter spacing depending on the situation and try, try again until it looks right, and each letter.&lt;/p&gt;
            &lt;/div&gt;
        &lt;/div&gt;
    &lt;/div&gt;
    &lt;a class=&quot;carousel-control-prev&quot; href=&quot;#carouselExampleCaption&quot; role=&quot;button&quot; data-bs-slide=&quot;prev&quot;&gt;
        &lt;span class=&quot;carousel-control-prev-icon&quot; aria-hidden=&quot;true&quot;&gt;&lt;/span&gt;
        &lt;span class=&quot;sr-only&quot;&gt;Previous&lt;/span&gt;
    &lt;/a&gt;
    &lt;a class=&quot;carousel-control-next&quot; href=&quot;#carouselExampleCaption&quot; role=&quot;button&quot; data-bs-slide=&quot;next&quot;&gt;
        &lt;span class=&quot;carousel-control-next-icon&quot; aria-hidden=&quot;true&quot;&gt;&lt;/span&gt;
        &lt;span class=&quot;sr-only&quot;&gt;Next&lt;/span&gt;
    &lt;/a&gt;
&lt;/div&gt;
                                </code>
                              </pre>
                            </div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>
                      <!--end col-->
                    </div>
                    <!--end row-->

                    <div class="row">
                      <div class="col-xl-6">
                        <div class="card">
                          <div class="card-header align-items-center d-flex">
                            <h4 class="card-title mb-0 flex-grow-1">Crossfade Animation</h4>
                            <div class="flex-shrink-0">
                              <div class="form-check form-switch form-switch-right form-switch-md">
                                <label for="crossfade-slide" class="form-label text-muted">Show Code</label>
                                <input class="form-check-input code-switcher" type="checkbox" id="crossfade-slide"/>
                              </div>
                            </div>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <p class="text-muted">Use <code>carousel-fade</code> class to the carousel to animate slides with a fade transition instead of a slide.</p>
                            <div class="live-preview">
                              <div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">
                                <ol class="carousel-indicators">
                                  <li data-bs-target="#carouselExampleFade" data-bs-slide-to="0" class="active"></li>
                                  <li data-bs-target="#carouselExampleFade" data-bs-slide-to="1"></li>
                                  <li data-bs-target="#carouselExampleFade" data-bs-slide-to="2"></li>
                                </ol>
                                <div class="carousel-inner">
                                  <div class="carousel-item active">
                                    <img class="d-block img-fluid mx-auto" src="{$themePath}/assets/images/small/img-1.jpg" alt="First slide"/>
                                  </div>
                                  <div class="carousel-item">
                                    <img class="d-block img-fluid mx-auto" src="{$themePath}/assets/images/small/img-2.jpg" alt="Second slide"/>
                                  </div>
                                  <div class="carousel-item">
                                    <img class="d-block img-fluid mx-auto" src="{$themePath}/assets/images/small/img-3.jpg" alt="Third slide"/>
                                  </div>
                                </div>
                                <a class="carousel-control-prev" href="#carouselExampleFade" role="button" data-bs-slide="prev">
                                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                  <span class="sr-only">Previous</span>
                                </a>
                                <a class="carousel-control-next" href="#carouselExampleFade" role="button" data-bs-slide="next">
                                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                  <span class="sr-only">Next</span>
                                </a>
                              </div>
                            </div>

                            <div class="d-none code-view">
                              <pre>
                                <code class="language-markup">&lt;!-- With Crossfade Animation --&gt;
&lt;div id=&quot;carouselExampleFade&quot; class=&quot;carousel slide carousel-fade&quot; data-ride=&quot;carousel&quot;&gt;
    &lt;ol class=&quot;carousel-indicators&quot;&gt;
        &lt;li data-bs-target=&quot;#carouselExampleFade&quot; data-bs-slide-to=&quot;0&quot; class=&quot;active&quot;&gt;&lt;/li&gt;
        &lt;li data-bs-target=&quot;#carouselExampleFade&quot; data-bs-slide-to=&quot;1&quot;&gt;&lt;/li&gt;
        &lt;li data-bs-target=&quot;#carouselExampleFade&quot; data-bs-slide-to=&quot;2&quot;&gt;&lt;/li&gt;
    &lt;/ol&gt;
    &lt;div class=&quot;carousel-inner&quot;&gt;
        &lt;div class=&quot;carousel-item active&quot;&gt;
            &lt;img class=&quot;d-block img-fluid mx-auto&quot; src=&quot;...&quot; alt=&quot;First slide&quot;&gt;
        &lt;/div&gt;
        &lt;div class=&quot;carousel-item&quot;&gt;
            &lt;img class=&quot;d-block img-fluid mx-auto&quot; src=&quot;...&quot; alt=&quot;Second slide&quot;&gt;
        &lt;/div&gt;
        &lt;div class=&quot;carousel-item&quot;&gt;
            &lt;img class=&quot;d-block img-fluid mx-auto&quot; src=&quot;...&quot; alt=&quot;Third slide&quot;&gt;
        &lt;/div&gt;
    &lt;/div&gt;
    &lt;a class=&quot;carousel-control-prev&quot; href=&quot;#carouselExampleFade&quot; role=&quot;button&quot; data-bs-slide=&quot;prev&quot;&gt;
        &lt;span class=&quot;carousel-control-prev-icon&quot; aria-hidden=&quot;true&quot;&gt;&lt;/span&gt;
        &lt;span class=&quot;sr-only&quot;&gt;Previous&lt;/span&gt;
    &lt;/a&gt;
    &lt;a class=&quot;carousel-control-next&quot; href=&quot;#carouselExampleFade&quot; role=&quot;button&quot; data-bs-slide=&quot;next&quot;&gt;
        &lt;span class=&quot;carousel-control-next-icon&quot; aria-hidden=&quot;true&quot;&gt;&lt;/span&gt;
        &lt;span class=&quot;sr-only&quot;&gt;Next&lt;/span&gt;
    &lt;/a&gt;
&lt;/div&gt;
                                </code>
                              </pre>
                            </div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>
                      <!--end col-->

                      <div class="col-xl-6">
                        <div class="card">
                          <div class="card-header align-items-center d-flex">
                            <h4 class="card-title mb-0 flex-grow-1">Individual carousel-item Interval</h4>
                            <div class="flex-shrink-0">
                              <div class="form-check form-switch form-switch-right form-switch-md">
                                <label for="individual-slide" class="form-label text-muted">Show Code</label>
                                <input class="form-check-input code-switcher" type="checkbox" id="individual-slide"/>
                              </div>
                            </div>
                          </div>                          <!-- end card header -->
                          <div class="card-body">
                            <p class="text-muted">Use <code>data-bs-interval=" "</code> to a carousel-item to change the amount of time to delay between automatically cycling to the next item.</p>
                            <div class="live-preview">
                              <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
                                <div class="carousel-inner">
                                  <div class="carousel-item active" data-bs-interval="10000">
                                    <img src="{$themePath}/assets//images/small/img-12.jpg" class="d-block w-100" alt="First slide" />
                                  </div>
                                  <div class="carousel-item" data-bs-interval="2000">
                                    <img src="{$themePath}/assets/images/small/img-11.jpg" class="d-block w-100" alt="two slide" />
                                  </div>
                                  <div class="carousel-item">
                                    <img src="{$themePath}/assets/images/small/img-10.jpg" class="d-block w-100" alt="There slide" />
                                  </div>
                                </div>
                                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
                                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                  <span class="visually-hidden">Previous</span>
                                </button>
                                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
                                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                  <span class="visually-hidden">Next</span>
                                </button>
                              </div>
                            </div>

                            <div class="d-none code-view">
                              <pre class="language-markup" style="height: 375px;">
                                <code>&lt;!-- Individual Slide --&gt;
&lt;div id=&quot;carouselExampleInterval&quot; class=&quot;carousel slide&quot; data-bs-ride=&quot;carousel&quot;&gt;
    &lt;div class=&quot;carousel-inner&quot;&gt;
      &lt;div class=&quot;carousel-item active&quot; data-bs-interval=&quot;10000&quot;&gt;
        &lt;img src=&quot;...&quot; class=&quot;d-block w-100&quot; alt=&quot;...&quot;&gt;
      &lt;/div&gt;
      &lt;div class=&quot;carousel-item&quot; data-bs-interval=&quot;2000&quot;&gt;
        &lt;img src=&quot;...&quot; class=&quot;d-block w-100&quot; alt=&quot;...&quot;&gt;
      &lt;/div&gt;
      &lt;div class=&quot;carousel-item&quot;&gt;
        &lt;img src=&quot;...&quot; class=&quot;d-block w-100&quot; alt=&quot;...&quot;&gt;
      &lt;/div&gt;
    &lt;/div&gt;
    &lt;button class=&quot;carousel-control-prev&quot; type=&quot;button&quot; data-bs-target=&quot;#carouselExampleInterval&quot; data-bs-slide=&quot;prev&quot;&gt;
      &lt;span class=&quot;carousel-control-prev-icon&quot; aria-hidden=&quot;true&quot;&gt;&lt;/span&gt;
      &lt;span class=&quot;visually-hidden&quot;&gt;Previous&lt;/span&gt;
    &lt;/button&gt;
    &lt;button class=&quot;carousel-control-next&quot; type=&quot;button&quot; data-bs-target=&quot;#carouselExampleInterval&quot; data-bs-slide=&quot;next&quot;&gt;
      &lt;span class=&quot;carousel-control-next-icon&quot; aria-hidden=&quot;true&quot;&gt;&lt;/span&gt;
      &lt;span class=&quot;visually-hidden&quot;&gt;Next&lt;/span&gt;
    &lt;/button&gt;
&lt;/div&gt;</code>
                              </pre>
                            </div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>
                      <!--end col-->
                    </div>
                    <!--end row-->

                    <div class="row">
                      <div class="col-xl-6">
                        <div class="card">
                          <div class="card-header align-items-center d-flex">
                            <h4 class="card-title mb-0 flex-grow-1">Disable Touch Swiping</h4>
                            <div class="flex-shrink-0">
                              <div class="form-check form-switch form-switch-right form-switch-md">
                                <label for="touch-disable-slide" class="form-label text-muted">Show Code</label>
                                <input class="form-check-input code-switcher" type="checkbox" id="touch-disable-slide"/>
                              </div>
                            </div>
                          </div>                          <!-- end card header -->
                          <div class="card-body">
                            <p class="text-muted">Carousels support swiping left/right on touchscreen devices to move between slides.
                                        This can be disabled using the <code>data-bs-touch</code> attribute. The example below also does not include the
                              <code>data-bs-ride attribute</code> and has <code>data-bs-interval="false"</code> so it doesn’t autoplay.
                            </p>
                            <div class="live-preview">
                              <div id="carouselExampleControlsNoTouching" class="carousel slide" data-bs-touch="false" data-bs-interval="false">
                                <div class="carousel-inner">
                                  <div class="carousel-item active">
                                    <img src="{$themePath}/assets/images/small/img-9.jpg" class="d-block w-100" alt="One Slide" />
                                  </div>
                                  <div class="carousel-item">
                                    <img src="{$themePath}/assets/images/small/img-8.jpg" class="d-block w-100" alt="Two Slide" />
                                  </div>
                                  <div class="carousel-item">
                                    <img src="{$themePath}/assets/images/small/img-7.jpg" class="d-block w-100" alt="Three Slide" />
                                  </div>
                                </div>
                                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControlsNoTouching" data-bs-slide="prev">
                                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                  <span class="visually-hidden">Previous</span>
                                </button>
                                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControlsNoTouching" data-bs-slide="next">
                                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                  <span class="visually-hidden">Next</span>
                                </button>
                              </div>
                            </div>

                            <div class="d-none code-view">
                              <pre class="language-markup" style="height: 375px;">
                                <code>&lt;!-- Disable Touch Swiping --&gt;
&lt;div id=&quot;carouselExampleControlsNoTouching&quot; class=&quot;carousel slide&quot; data-bs-touch=&quot;false&quot; data-bs-interval=&quot;false&quot;&gt;
    &lt;div class=&quot;carousel-inner&quot;&gt;
      &lt;div class=&quot;carousel-item active&quot;&gt;
        &lt;img src=&quot;...&quot; class=&quot;d-block w-100&quot; alt=&quot;...&quot;&gt;
      &lt;/div&gt;
      &lt;div class=&quot;carousel-item&quot;&gt;
        &lt;img src=&quot;...&quot; class=&quot;d-block w-100&quot; alt=&quot;...&quot;&gt;
      &lt;/div&gt;
      &lt;div class=&quot;carousel-item&quot;&gt;
        &lt;img src=&quot;...&quot; class=&quot;d-block w-100&quot; alt=&quot;...&quot;&gt;
      &lt;/div&gt;
    &lt;/div&gt;
    &lt;button class=&quot;carousel-control-prev&quot; type=&quot;button&quot; data-bs-target=&quot;#carouselExampleControlsNoTouching&quot; data-bs-slide=&quot;prev&quot;&gt;
      &lt;span class=&quot;carousel-control-prev-icon&quot; aria-hidden=&quot;true&quot;&gt;&lt;/span&gt;
      &lt;span class=&quot;visually-hidden&quot;&gt;Previous&lt;/span&gt;
    &lt;/button&gt;
    &lt;button class=&quot;carousel-control-next&quot; type=&quot;button&quot; data-bs-target=&quot;#carouselExampleControlsNoTouching&quot; data-bs-slide=&quot;next&quot;&gt;
      &lt;span class=&quot;carousel-control-next-icon&quot; aria-hidden=&quot;true&quot;&gt;&lt;/span&gt;
      &lt;span class=&quot;visually-hidden&quot;&gt;Next&lt;/span&gt;
    &lt;/button&gt;
&lt;/div&gt;</code>
                              </pre>
                            </div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>
                      <!--end col-->

                      <div class="col-xl-6">
                        <div class="card">
                          <div class="card-header align-items-center d-flex">
                            <h4 class="card-title mb-0 flex-grow-1">Dark Variant</h4>
                            <div class="flex-shrink-0">
                              <div class="form-check form-switch form-switch-right form-switch-md">
                                <label for="dark-variant-slide" class="form-label text-muted">Show Code</label>
                                <input class="form-check-input code-switcher" type="checkbox" id="dark-variant-slide"/>
                              </div>
                            </div>
                          </div>                          <!-- end card header -->
                          <div class="card-body">
                            <p class="text-muted">Use <code>carousel-dark</code> class to the carousel for darker controls, indicators, and captions.</p>
                            <div class="live-preview">
                              <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
                                <div class="carousel-indicators">
                                  <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                                  <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
                                  <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
                                </div>
                                <div class="carousel-inner">
                                  <div class="carousel-item active" data-bs-interval="10000">
                                    <img src="{$themePath}/assets/images/small/img-4.jpg" class="d-block w-100" alt="One Slide"/>
                                    <div class="carousel-caption d-none d-md-block">
                                      <h5>Drawing a sketch</h5>
                                      <p>Too much or too little spacing, as in the example below, can make things unpleasant for the reader.</p>
                                    </div>
                                  </div>
                                  <div class="carousel-item" data-bs-interval="2000">
                                    <img src="{$themePath}/assets/images/small/img-5.jpg" class="d-block w-100" alt="Two Slide"/>
                                    <div class="carousel-caption d-none d-md-block">
                                      <h5>Blue clock on a pastel background</h5>
                                      <p>In some designs, you might adjust your tracking to create a certain artistic effect asked them what graphic design tips they live.</p>
                                    </div>
                                  </div>
                                  <div class="carousel-item">
                                    <img src="{$themePath}/assets/images/small/img-6.jpg" class="d-block w-100" alt="Three Slide"/>
                                    <div class="carousel-caption d-none d-md-block">
                                      <h5>Working at a coffee shop</h5>
                                      <p>A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring.</p>
                                    </div>
                                  </div>
                                </div>
                                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
                                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                  <span class="visually-hidden">Previous</span>
                                </button>
                                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
                                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                  <span class="visually-hidden">Next</span>
                                </button>
                              </div>
                            </div>
                            <div class="d-none code-view">
                              <pre class="language-markup" style="height: 375px;">
                                <code>&lt;!-- Dark Variant --&gt;
&lt;div id=&quot;carouselExampleDark&quot; class=&quot;carousel carousel-dark slide&quot; data-bs-ride=&quot;carousel&quot;&gt;
    &lt;div class=&quot;carousel-indicators&quot;&gt;
      &lt;button type=&quot;button&quot; data-bs-target=&quot;#carouselExampleDark&quot; data-bs-slide-to=&quot;0&quot; class=&quot;active&quot; aria-current=&quot;true&quot; aria-label=&quot;Slide 1&quot;&gt;&lt;/button&gt;
      &lt;button type=&quot;button&quot; data-bs-target=&quot;#carouselExampleDark&quot; data-bs-slide-to=&quot;1&quot; aria-label=&quot;Slide 2&quot;&gt;&lt;/button&gt;
      &lt;button type=&quot;button&quot; data-bs-target=&quot;#carouselExampleDark&quot; data-bs-slide-to=&quot;2&quot; aria-label=&quot;Slide 3&quot;&gt;&lt;/button&gt;
    &lt;/div&gt;
    &lt;div class=&quot;carousel-inner&quot;&gt;
      &lt;div class=&quot;carousel-item active&quot; data-bs-interval=&quot;10000&quot;&gt;
        &lt;img src=&quot;...&quot; class=&quot;d-block w-100&quot; alt=&quot;...&quot;&gt;
        &lt;div class=&quot;carousel-caption d-none d-md-block&quot;&gt;
          &lt;h5&gt;First slide label&lt;/h5&gt;
          &lt;p&gt;Some representative placeholder content for the first slide.&lt;/p&gt;
        &lt;/div&gt;
      &lt;/div&gt;
      &lt;div class=&quot;carousel-item&quot; data-bs-interval=&quot;2000&quot;&gt;
        &lt;img src=&quot;...&quot; class=&quot;d-block w-100&quot; alt=&quot;...&quot;&gt;
        &lt;div class=&quot;carousel-caption d-none d-md-block&quot;&gt;
          &lt;h5&gt;Second slide label&lt;/h5&gt;
          &lt;p&gt;Some representative placeholder content for the second slide.&lt;/p&gt;
        &lt;/div&gt;
      &lt;/div&gt;
      &lt;div class=&quot;carousel-item&quot;&gt;
        &lt;img src=&quot;...&quot; class=&quot;d-block w-100&quot; alt=&quot;...&quot;&gt;
        &lt;div class=&quot;carousel-caption d-none d-md-block&quot;&gt;
          &lt;h5&gt;Third slide label&lt;/h5&gt;
          &lt;p&gt;Some representative placeholder content for the third slide.&lt;/p&gt;
        &lt;/div&gt;
      &lt;/div&gt;
    &lt;/div&gt;
    &lt;button class=&quot;carousel-control-prev&quot; type=&quot;button&quot; data-bs-target=&quot;#carouselExampleDark&quot; data-bs-slide=&quot;prev&quot;&gt;
      &lt;span class=&quot;carousel-control-prev-icon&quot; aria-hidden=&quot;true&quot;&gt;&lt;/span&gt;
      &lt;span class=&quot;visually-hidden&quot;&gt;Previous&lt;/span&gt;
    &lt;/button&gt;
    &lt;button class=&quot;carousel-control-next&quot; type=&quot;button&quot; data-bs-target=&quot;#carouselExampleDark&quot; data-bs-slide=&quot;next&quot;&gt;
      &lt;span class=&quot;carousel-control-next-icon&quot; aria-hidden=&quot;true&quot;&gt;&lt;/span&gt;
      &lt;span class=&quot;visually-hidden&quot;&gt;Next&lt;/span&gt;
    &lt;/button&gt;
&lt;/div&gt;</code>
                              </pre>
                            </div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
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
<xsl:include href="../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1515664208567"/>

</xsl:stylesheet>
