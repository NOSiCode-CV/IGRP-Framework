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
                            <h4 class="card-title mb-0 flex-grow-1">Scrollspy in Navbar</h4>
                            <div class="flex-shrink-0">
                              <div class="form-check form-switch form-switch-right form-switch-md">
                                <label for="navbarscrollspy-showcode" class="form-label text-muted">Show Code</label>
                                <input class="form-check-input code-switcher" type="checkbox" id="navbarscrollspy-showcode"></input>
                              </div>
                            </div>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <p class="text-muted">Use <code>data-bs-spy="scroll"</code> attribute to update links in a navigation list based on the current scroll position. Scroll the area below the navbar and watch the active class change.</p>

                            <div class="live-preview">
                              <nav id="navbar-example" class="navbar navbar-dark bg-light px-3">
                                <a class="navbar-brand" href="#">
                                  <img src="{$themePath}/assets/images/logo-dark.png" class="card-logo card-logo-dark" alt="logo dark" height="14">
                                    <img src="{$themePath}/assets/images/logo-light.png" class="card-logo card-logo-light" alt="logo light" height="14">
                                    </img>
                                  </img>
                                </a>
                                <ul class="nav nav-pills">
                                  <li class="nav-item">
                                    <a class="nav-link" href="#fat">@fat</a>
                                  </li>
                                  <li class="nav-item">
                                    <a class="nav-link" href="#mdo">@mdo</a>
                                  </li>
                                  <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Dropdown</a>
                                    <div class="dropdown-menu dropdown-menu-end">
                                      <a class="dropdown-item" href="#one">one</a>
                                      <a class="dropdown-item" href="#two">two</a>
                                      <div role="separator" class="dropdown-divider"></div>
                                      <a class="dropdown-item" href="#three">three</a>
                                    </div>
                                  </li>
                                </ul>
                              </nav>
                              <div data-bs-spy="scroll" data-bs-target="#navbar-example" class="scrollspy-example p-2" data-bs-offset="8">
                                <div class="text-muted">
                                  <h5 id="fat">@fat</h5>
                                  <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis
                                                    praesentium voluptatum deleniti atque corrupti quos dolores et quas
                                                    molestias excepturi sint occaecati cupiditate non provident, similique
                                                    sunt in culpa qui officia deserunt mollitia animi, id est laborum et
                                                    dolorum fuga.</p>
                                  <h5 id="mdo">@mdo</h5>
                                  <p>Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil
                                                    impedit quo minus id quod maxime placeat facere possimus, omnis voluptas
                                                    assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et
                                                    aut officiis debitis aut rerum necessitatibus saepe eveniet ut et
                                                    voluptates repudiandae sint et molestiae non recusandae., sed quia non
                                                    numquam eius modi tempora incidunt ut labore et dolore magnam aliquam
                                                    quaerat voluptatem.</p>
                                  <h5 id="one">one</h5>
                                  <p>Ad leggings keytar, brunch id art party dolor labore. Pitchfork yr enim
                                                    lo-fi before they sold out qui. Tumblr farm-to-table bicycle rights
                                                    whatever. Anim keffiyeh carles cardigan. Velit seitan mcsweeney's photo
                                                    booth 3 wolf moon irure. Cosby sweater lomo jean shorts, williamsburg
                                                    hoodie minim qui you probably haven't heard of them et cardigan trust
                                                    fund culpa biodiesel wes anderson aesthetic. Nihil tattooed accusamus,
                                                    cred irony biodiesel keffiyeh artisan ullamco consequat.</p>
                                  <h5 id="two">two</h5>
                                  <p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet,
                                                    consectetur, adipisci velit, sed quia non numquam eius modi tempora
                                                    incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim
                                                    ad minima veniam.</p>
                                  <h5 id="three">three</h5>
                                  <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem
                                                    accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab
                                                    illo inventore veritatis et quasi architecto beatae vitae dicta sunt
                                                    explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut
                                                    odit aut fugit</p>
                                  <p>Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis
                                                    suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur autem vel
                                                    eum iure reprehenderit qui in ea voluptate velit esse quam nihil
                                                    molestiae consequatur, vel illum qui dolorem eum</p>
                                </div>
                              </div>
                            </div>
                            <!-- end live preview -->

                            <div class="d-none code-view">
                              <pre>
                                <code class="language-markup">&lt;nav id=&quot;navbar-example&quot; class=&quot;navbar navbar-dark bg-light px-3&quot;&gt;
    &lt;a class=&quot;navbar-brand&quot; href=&quot;#&quot;&gt;
        &lt;img src=&quot;...&quot; alt=&quot;...&quot;&gt;
    &lt;/a&gt;
    &lt;ul class=&quot;nav nav-pills&quot;&gt;
        &lt;li class=&quot;nav-item&quot;&gt;
            &lt;a class=&quot;nav-link&quot; href=&quot;#fat&quot;&gt;@fat&lt;/a&gt;
        &lt;/li&gt;
        &lt;li class=&quot;nav-item&quot;&gt;
            &lt;a class=&quot;nav-link&quot; href=&quot;#mdo&quot;&gt;@mdo&lt;/a&gt;
        &lt;/li&gt;
        &lt;li class=&quot;nav-item dropdown&quot;&gt;
            &lt;a class=&quot;nav-link dropdown-toggle&quot; data-bs-toggle=&quot;dropdown&quot; href=&quot;#&quot; role=&quot;button&quot; aria-haspopup=&quot;true&quot; aria-expanded=&quot;false&quot;&gt;Dropdown&lt;/a&gt;
            &lt;div class=&quot;dropdown-menu dropdown-menu-end&quot;&gt;
                &lt;a class=&quot;dropdown-item&quot; href=&quot;#one&quot;&gt;one&lt;/a&gt;
                &lt;a class=&quot;dropdown-item&quot; href=&quot;#two&quot;&gt;two&lt;/a&gt;
                &lt;div role=&quot;separator&quot; class=&quot;dropdown-divider&quot;&gt;&lt;/div&gt;
                &lt;a class=&quot;dropdown-item&quot; href=&quot;#three&quot;&gt;three&lt;/a&gt;
            &lt;/div&gt;
        &lt;/li&gt;
    &lt;/ul&gt;
&lt;/nav&gt;
                                </code>
                                <code class="language-markup">&lt;div data-bs-spy=&quot;scroll&quot; data-bs-target=&quot;#navbar-example&quot; class=&quot;scrollspy-example p-2&quot; data-bs-offset=&quot;8&quot;&gt;
    &lt;div class=&quot;text-muted&quot;&gt;
        &lt;h5 id=&quot;fat&quot;&gt;@fat&lt;/h5&gt;
        &lt;p&gt;...&lt;/p&gt;

        &lt;h5 id=&quot;mdo&quot;&gt;@mdo&lt;/h5&gt;
        &lt;p&gt;...&lt;/p&gt;

        &lt;h5 id=&quot;one&quot;&gt;one&lt;/h5&gt;
        &lt;p&gt;...&lt;/p&gt;
        
        &lt;h5 id=&quot;two&quot;&gt;two&lt;/h5&gt;
        &lt;p&gt;...&lt;/p&gt;
        &lt;h5 id=&quot;three&quot;&gt;three&lt;/h5&gt;
        &lt;p&gt;...&lt;/p&gt;
    &lt;/div&gt;
&lt;/div&gt;</code>
                              </pre>
                            </div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>
                      <!-- end col -->
                    </div>
                    <!-- end row -->

                    <div class="row">
                      <div class="col-lg-12">
                        <div class="card">
                          <div class="card-header align-items-center d-flex">
                            <h4 class="card-title mb-0 flex-grow-1">Scrollspy with nested nav</h4>
                            <div class="flex-shrink-0">
                              <div class="form-check form-switch form-switch-right form-switch-md">
                                <label for="nestednavscrollspy-showcode" class="form-label text-muted">Show Code</label>
                                <input class="form-check-input code-switcher" type="checkbox" id="nestednavscrollspy-showcode"></input>
                              </div>
                            </div>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <p class="text-muted">Use <code>data-bs-spy="scroll"</code> attribute. Scrollspy also works with nested nav. If a nested nav is active, its parents will also be active. Scroll the area next to the navbar and watch the active class change.</p>
                            <div class="live-preview">
                              <div class="row gy-4">
                                <div class="col-xxl-3">
                                  <nav id="navbar-examplenested" class="navbar navbar-dark bg-light flex-column">
                                    <a class="navbar-brand mb-2" href="#">
                                      <img src="{$themePath}/assets/images/logo-dark.png" class="card-logo card-logo-dark" alt="logo dark" height="15">
                                        <img src="{$themePath}/assets/images/logo-light.png" class="card-logo card-logo-light" alt="logo light" height="15">
                                        </img>
                                      </img>
                                    </a>
                                    <nav class="nav nav-pills flex-column p-3 w-100">
                                      <a class="nav-link" href="#item-1">
                                        <i class="ri-dashboard-2-line align-middle me-2 fs-16"></i>
                                        <span>Dashboards</span>
                                      </a>
                                      <nav class="nav nav-pills flex-column">
                                        <a class="nav-link" href="#item-1-1">
                                          <i class="ri-subtract-fill align-middle me-2 fs-15"></i>
                                          <span>Ecommerce</span>
                                        </a>
                                        <a class="nav-link" href="#item-1-2">
                                          <i class="ri-subtract-fill align-middle me-2 fs-15"></i>
                                          <span>Analytics</span>
                                        </a>
                                      </nav>
                                      <a class="nav-link active" href="#item-2">
                                        <i class="ri-pencil-ruler-2-line align-middle me-2 fs-16"></i>
                                        <span>Base UI</span>
                                      </a>
                                      <a class="nav-link" href="#item-3">
                                        <i class="ri-apps-2-line align-middle me-2 fs-16"></i>
                                        <span>Apps</span>
                                      </a>
                                      <nav class="nav nav-pills flex-column">
                                        <a class="nav-link" href="#item-3-1">
                                          <i class="ri-subtract-fill align-middle me-2 fs-15"></i>
                                          <span>Chat</span>
                                        </a>
                                        <a class="nav-link" href="#item-3-2">
                                          <i class="ri-subtract-fill align-middle me-2 fs-15"></i>
                                          <span>Email</span>
                                        </a>
                                      </nav>
                                    </nav>
                                  </nav>
                                </div>
                                <!-- end col -->
                                <div class="col-xxl-9">
                                  <div data-bs-spy="scroll" data-bs-target="#navbar-examplenested" data-bs-offset="0" class="scrollspy-example-2">
                                    <div class="text-muted">
                                      <h5 id="item-1">Item 1</h5>
                                      <p>Ex consequat commodo adipisicing exercitation aute excepteur occaecat
                                                            ullamco duis aliqua id magna ullamco eu. Do aute ipsum ipsum ullamco
                                                            cillum consectetur ut et aute consectetur labore. Fugiat laborum
                                                            incididunt tempor eu consequat enim dolore proident. Qui laborum do
                                                            non excepteur nulla magna eiusmod consectetur in. Aliqua et aliqua
                                                            officia quis et incididunt voluptate non anim reprehenderit
                                                            adipisicing dolore ut consequat deserunt mollit dolore. Aliquip
                                                            nulla enim veniam non fugiat id cupidatat nulla elit cupidatat
                                                            commodo velit ut eiusmod cupidatat elit dolore.</p>
                                      <h5 id="item-1-1">Item 1-1</h5>
                                      <p>Amet tempor mollit aliquip pariatur excepteur commodo do ea cillum
                                                            commodo Lorem et occaecat elit qui et. Aliquip labore ex ex esse
                                                            voluptate occaecat Lorem ullamco deserunt. Aliqua cillum excepteur
                                                            irure consequat id quis ea. Sit proident ullamco aute magna pariatur
                                                            nostrud labore. Reprehenderit aliqua commodo eiusmod aliquip est do
                                                            duis amet proident magna consectetur consequat eu commodo fugiat non
                                                            quis. Enim aliquip exercitation ullamco adipisicing voluptate
                                                            excepteur minim exercitation minim minim commodo adipisicing
                                                            exercitation officia nisi adipisicing. Anim id duis qui consequat
                                                            labore adipisicing sint dolor elit cillum anim et fugiat.</p>
                                      <h5 id="item-1-2">Item 1-2</h5>
                                      <p>Cillum nisi deserunt magna eiusmod qui eiusmod velit voluptate
                                                            pariatur laborum sunt enim. Irure laboris mollit consequat
                                                            incididunt sint et culpa culpa incididunt adipisicing magna magna
                                                            occaecat. Nulla ipsum cillum eiusmod sint elit excepteur ea labore
                                                            enim consectetur in labore anim. Proident ullamco ipsum esse elit ut
                                                            Lorem eiusmod dolor et eiusmod. Anim occaecat nulla in non consequat
                                                            eiusmod velit incididunt.</p>
                                      <h5 id="item-2">Item 2</h5>
                                      <p>Quis magna Lorem anim amet ipsum do mollit sit cillum voluptate ex
                                                            nulla tempor. Laborum consequat non elit enim exercitation cillum
                                                            aliqua consequat id aliqua. Esse ex consectetur mollit voluptate est
                                                            in duis laboris ad sit ipsum anim Lorem. Incididunt veniam velit
                                                            elit elit veniam Lorem aliqua quis ullamco deserunt sit enim elit
                                                            aliqua esse irure. Laborum nisi sit est tempor laborum mollit labore
                                                            officia laborum excepteur commodo non commodo dolor excepteur
                                                            commodo. Ipsum fugiat ex est consectetur ipsum commodo tempor sunt
                                                            in proident.</p>
                                      <h5 id="item-3">Item 3</h5>
                                      <p>Quis anim sit do amet fugiat dolor velit sit ea ea do reprehenderit
                                                            culpa duis. Nostrud aliqua ipsum fugiat minim proident occaecat
                                                            excepteur aliquip culpa aute tempor reprehenderit. Deserunt tempor
                                                            mollit elit ex pariatur dolore velit fugiat mollit culpa irure
                                                            ullamco est ex ullamco excepteur.</p>
                                      <h5 id="item-3-1">Item 3-1</h5>
                                      <p>Deserunt quis elit Lorem eiusmod amet enim enim amet minim Lorem
                                                            proident nostrud. Ea id dolore anim exercitation aute fugiat labore
                                                            voluptate cillum do laboris labore. Ex velit exercitation nisi enim
                                                            labore reprehenderit labore nostrud ut ut. Esse officia sunt duis
                                                            aliquip ullamco tempor eiusmod deserunt irure nostrud irure. Ullamco
                                                            proident veniam laboris ea consectetur magna sunt ex exercitation
                                                            aliquip minim enim culpa occaecat exercitation. Est tempor excepteur
                                                            aliquip laborum consequat do deserunt laborum esse eiusmod irure
                                                            proident ipsum esse qui.</p>
                                      <h5 id="item-3-2">Item 3-2</h5>
                                      <p>Labore sit culpa commodo elit adipisicing sit aliquip elit proident
                                                            voluptate minim mollit nostrud aute reprehenderit do. Mollit
                                                            excepteur eu Lorem ipsum anim commodo sint labore Lorem in
                                                            exercitation velit incididunt. Occaecat consectetur nisi in occaecat
                                                            proident minim enim sunt reprehenderit exercitation cupidatat et do
                                                            officia. Aliquip consequat ad labore labore mollit ut amet. Sit
                                                            pariatur tempor proident in veniam culpa aliqua excepteur elit magna
                                                            fugiat eiusmod amet officia.</p>
                                    </div>
                                  </div>
                                </div>
                                <!-- end col -->
                              </div>
                              <!-- end row -->
                            </div>
                            <!-- end live preview -->

                            <div class="d-none code-view">
                              <pre>
                                <code class="language-markup">&lt;div class=&quot;row&quot;&gt;
    &lt;div class=&quot;col-xxl-3&quot;&gt;
        &lt;nav id=&quot;navbar-examplenested&quot; class=&quot;navbar navbar-dark bg-light flex-column&quot;&gt;
            &lt;a class=&quot;navbar-brand mb-2&quot; href=&quot;#&quot;&gt;
                &lt;img src=&quot;...&quot; alt=&quot;...&quot;&gt;
            &lt;/a&gt;
            &lt;nav class=&quot;nav nav-pills flex-column p-3 w-100&quot;&gt;
                &lt;a class=&quot;nav-link&quot; href=&quot;#item-1&quot;&gt;&lt;i class=&quot;ri-dashboard-2-line align-middle me-2 fs-16&quot;&gt;&lt;/i&gt; &lt;span&gt;Dashboards&lt;/span&gt;&lt;/a&gt;
                &lt;nav class=&quot;nav nav-pills flex-column&quot;&gt;
                    &lt;a class=&quot;nav-link&quot; href=&quot;#item-1-1&quot;&gt;&lt;i class=&quot;ri-subtract-fill align-middle me-2 fs-15&quot;&gt;&lt;/i&gt; &lt;span&gt;Ecommerce&lt;/span&gt;&lt;/a&gt;
                    &lt;a class=&quot;nav-link&quot; href=&quot;#item-1-2&quot;&gt;&lt;i class=&quot;ri-subtract-fill align-middle me-2 fs-15&quot;&gt;&lt;/i&gt; &lt;span&gt;Analytics&lt;/span&gt;&lt;/a&gt;
                &lt;/nav&gt;
                &lt;a class=&quot;nav-link active&quot; href=&quot;#item-2&quot;&gt;&lt;i class=&quot;ri-pencil-ruler-2-line align-middle me-2 fs-16&quot;&gt;&lt;/i&gt; &lt;span&gt;Base UI&lt;/span&gt;&lt;/a&gt;
                &lt;a class=&quot;nav-link&quot; href=&quot;#item-3&quot;&gt;&lt;i class=&quot;ri-apps-2-line align-middle me-2 fs-16&quot;&gt;&lt;/i&gt; &lt;span&gt;Apps&lt;/span&gt;&lt;/a&gt;
                &lt;nav class=&quot;nav nav-pills flex-column&quot;&gt;
                    &lt;a class=&quot;nav-link&quot; href=&quot;#item-3-1&quot;&gt;&lt;i class=&quot;ri-subtract-fill align-middle me-2 fs-15&quot;&gt;&lt;/i&gt; &lt;span&gt;Chat&lt;/span&gt;&lt;/a&gt;
                    &lt;a class=&quot;nav-link&quot; href=&quot;#item-3-2&quot;&gt;&lt;i class=&quot;ri-subtract-fill align-middle me-2 fs-15&quot;&gt;&lt;/i&gt; &lt;span&gt;Email&lt;/span&gt;&lt;/a&gt;
                &lt;/nav&gt;
            &lt;/nav&gt;
        &lt;/nav&gt;
    &lt;/div&gt;
    &lt;!-- end col --&gt;
    &lt;div class=&quot;col-xxl-9&quot;&gt;
        &lt;div data-bs-spy=&quot;scroll&quot; data-bs-target=&quot;#navbar-examplenested&quot; data-bs-offset=&quot;0&quot; class=&quot;scrollspy-example-2&quot;&gt;
            &lt;div class=&quot;text-muted&quot;&gt;
                &lt;h5 id=&quot;item-1&quot;&gt;Item 1&lt;/h5&gt;
                &lt;p&gt;...&lt;/p&gt;

                &lt;h5 id=&quot;item-1-1&quot;&gt;Item 1-1&lt;/h5&gt;
                &lt;p&gt;...&lt;/p&gt;
                
                &lt;h5 id=&quot;item-1-2&quot;&gt;Item 1-2&lt;/h5&gt;
                &lt;p&gt;...&lt;/p&gt;

                &lt;h5 id=&quot;item-2&quot;&gt;Item 2&lt;/h5&gt;
                &lt;p&gt;...&lt;/p&gt;
                
                &lt;h5 id=&quot;item-3&quot;&gt;Item 3&lt;/h5&gt;
                &lt;p&gt;...&lt;/p&gt;

                &lt;h5 id=&quot;item-3-1&quot;&gt;Item 3-1&lt;/h5&gt;
                &lt;p&gt;...&lt;/p&gt;
                
                &lt;h5 id=&quot;item-3-2&quot;&gt;Item 3-2&lt;/h5&gt;
                &lt;p&gt;...&lt;/p&gt;
            &lt;/div&gt;
        &lt;/div&gt;
    &lt;/div&gt;
    &lt;!-- end col --&gt;
&lt;/div&gt;
&lt;!-- end row --&gt;</code>
                              </pre>
                            </div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
                      </div>
                      <!-- end col -->
                    </div>
                    <!-- end row -->

                    <div class="row">
                      <div class="col-lg-12">
                        <div class="card">
                          <div class="card-header align-items-center d-flex">
                            <h4 class="card-title mb-0 flex-grow-1">Scrollspy with list-group</h4>
                            <div class="flex-shrink-0">
                              <div class="form-check form-switch form-switch-right form-switch-md">
                                <label for="listgroupscrollspy-showcode" class="form-label text-muted">Show Code</label>
                                <input class="form-check-input code-switcher" type="checkbox" id="listgroupscrollspy-showcode"></input>
                              </div>
                            </div>
                          </div>                          <!-- end card header -->

                          <div class="card-body">
                            <p class="text-muted">Use <code>data-bs-spy="scroll"</code> attribute. Scrollspy also works with the list-group. Scroll the area next to the list group and watch the active class change.</p>
                            <div class="live-preview">
                              <div class="row gy-4">
                                <div class="col-xxl-3">
                                  <div id="list-example" class="list-group">
                                    <a class="list-group-item list-group-item-action" href="#list-item-1">Item 1</a>
                                    <a class="list-group-item list-group-item-action active" href="#list-item-2">Item 2</a>
                                    <a class="list-group-item list-group-item-action" href="#list-item-3">Item 3</a>
                                    <a class="list-group-item list-group-item-action" href="#list-item-4">Item 4</a>
                                  </div>
                                </div>
                                <div class="col-xxl-9">
                                  <div data-bs-spy="scroll" data-bs-target="#list-example" data-bs-offset="0" class="scrollspy-example mt-0">
                                    <div class="text-muted">
                                      <h5 id="list-item-1">Item 1</h5>
                                      <p>Ex consequat commodo adipisicing exercitation aute excepteur occaecat ullamco duis aliqua id magna ullamco eu. Do aute ipsum ipsum ullamco cillum consectetur ut et aute consectetur labore. Fugiat laborum incididunt tempor eu consequat enim dolore proident. Qui laborum do non excepteur nulla magna eiusmod consectetur in. Aliqua et aliqua officia quis et incididunt voluptate non anim reprehenderit adipisicing dolore ut consequat deserunt mollit dolore. Aliquip nulla enim veniam non fugiat id cupidatat nulla elit cupidatat commodo velit ut eiusmod cupidatat elit dolore.</p>
                                      <h5 id="list-item-2">Item 2</h5>
                                      <p>Quis magna Lorem anim amet ipsum do mollit sit cillum voluptate ex nulla tempor. Laborum consequat non elit enim exercitation cillum aliqua consequat id aliqua. Esse ex consectetur mollit voluptate est in duis laboris ad sit ipsum anim Lorem. Incididunt veniam velit elit elit veniam Lorem aliqua quis ullamco deserunt sit enim elit aliqua esse irure. Laborum nisi sit est tempor laborum mollit labore officia laborum excepteur commodo non commodo dolor excepteur commodo. Ipsum fugiat ex est consectetur ipsum commodo tempor sunt in proident.</p>
                                      <h5 id="list-item-3">Item 3</h5>
                                      <p>Quis anim sit do amet fugiat dolor velit sit ea ea do reprehenderit culpa duis. Nostrud aliqua ipsum fugiat minim proident occaecat excepteur aliquip culpa aute tempor reprehenderit. Deserunt tempor mollit elit ex pariatur dolore velit fugiat mollit culpa irure ullamco est ex ullamco excepteur.</p>
                                      <h5 id="list-item-4">Item 4</h5>
                                      <p>Quis anim sit do amet fugiat dolor velit sit ea ea do reprehenderit culpa duis. Nostrud aliqua ipsum fugiat minim proident occaecat excepteur aliquip culpa aute tempor reprehenderit. Deserunt tempor mollit elit ex pariatur dolore velit fugiat mollit culpa irure ullamco est ex ullamco excepteur.</p>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <!-- end live preview -->

                            <div class="d-none code-view">
                              <pre>
                                <code class="language-markup">&lt;div class=&quot;row&quot;&gt;
    &lt;div class=&quot;col-xxl-3&quot;&gt;
        &lt;div id=&quot;list-example&quot; class=&quot;list-group&quot;&gt;
            &lt;a class=&quot;list-group-item list-group-item-action&quot; href=&quot;#list-item-1&quot;&gt;Item 1&lt;/a&gt;
            &lt;a class=&quot;list-group-item list-group-item-action active&quot; href=&quot;#list-item-2&quot;&gt;Item 2&lt;/a&gt;
            &lt;a class=&quot;list-group-item list-group-item-action&quot; href=&quot;#list-item-3&quot;&gt;Item 3&lt;/a&gt;
            &lt;a class=&quot;list-group-item list-group-item-action&quot; href=&quot;#list-item-4&quot;&gt;Item 4&lt;/a&gt;
        &lt;/div&gt;
    &lt;/div&gt;
    &lt;div class=&quot;col-xxl-9&quot;&gt;
        &lt;div data-bs-spy=&quot;scroll&quot; data-bs-target=&quot;#list-example&quot; data-bs-offset=&quot;0&quot; class=&quot;scrollspy-example mt-0&quot;&gt;
            &lt;div class=&quot;text-muted&quot;&gt;
                &lt;h5 id=&quot;list-item-1&quot;&gt;Item 1&lt;/h5&gt;
                &lt;p&gt;...&lt;/p&gt;
                
                &lt;h5 id=&quot;list-item-2&quot;&gt;Item 2&lt;/h5&gt;
                &lt;p&gt;...&lt;/p&gt;

                &lt;h5 id=&quot;list-item-3&quot;&gt;Item 3&lt;/h5&gt;
                &lt;p&gt;...&lt;/p&gt;

                &lt;h5 id=&quot;list-item-4&quot;&gt;Item 4&lt;/h5&gt;
                &lt;p&gt;...&lt;/p&gt;
            &lt;/div&gt;
        &lt;/div&gt;
    &lt;/div&gt;
&lt;/div&gt;</code>
                              </pre>
                            </div>
                          </div>                          <!-- end card-body -->
                        </div>                        <!-- end card -->
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
<xsl:include href="../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1515664208567"/>

</xsl:stylesheet>
