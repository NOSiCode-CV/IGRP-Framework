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
                        <div class="col-xxl-6">
                            <h5 class="mb-3">Default Tabs</h5>
                            <div class="card">
                                <div class="card-body">
                                    <p class="text-muted">Use <code>nav-tabs</code> class to generate a default tabbed interface.</p>
                                    <!-- Nav tabs -->
                                    <ul class="nav nav-tabs mb-3" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link" data-bs-toggle="tab" href="#home" role="tab" aria-selected="false">
                                                Home
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link active" data-bs-toggle="tab" href="#product1" role="tab" aria-selected="false">
                                                Product
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" data-bs-toggle="tab" href="#messages" role="tab" aria-selected="false">
                                                Messages
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" data-bs-toggle="tab" href="#settings" role="tab" aria-selected="true">
                                                Settings
                                            </a>
                                        </li>
                                    </ul>
                                    <!-- Tab panes -->
                                    <div class="tab-content  text-muted">
                                        <div class="tab-pane" id="home" role="tabpanel">
                                            <h6>Graphic Design</h6>
                                            <p class="mb-0">
                                                They all have something to say beyond the words on the page. They can come across as casual or neutral, exotic or graphic. That's why it's important to think about your message, then choose a font that fits. Cosby sweater eu banh mi, qui irure terry richardson ex squid.
                                            </p>
                                        </div>
                                        <div class="tab-pane active" id="product1" role="tabpanel">
                                            <h6>Product</h6>
                                            <p class="mb-0">
                                                You've probably heard that opposites attract. The same is true for fonts. Don't be afraid to combine font styles that are different but complementary, like sans serif with serif, short with tall, or decorative with simple. Qui photo booth letterpress, commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR.
                                            </p>
                                        </div>
                                        <div class="tab-pane" id="messages" role="tabpanel">
                                            <h6>Messages</h6>
                                            <p class="mb-0">
                                                Etsy mixtape wayfarers, ethical wes anderson tofu before they
                                                sold out mcsweeney's organic lomo retro fanny pack lo-fi
                                                farm-to-table readymade. Messenger bag gentrify pitchfork
                                                tattooed craft beer, iphone skateboard locavore carles etsy
                                                salvia banksy hoodie helvetica. DIY synth PBR banksy irony.
                                            </p>
                                        </div>
                                        <div class="tab-pane" id="settings" role="tabpanel">
                                            <h6>Settings</h6>
                                            <p class="mb-0">
                                                Trust fund seitan letterpress, keytar raw denim keffiyeh etsy
                                                art party before they sold out master cleanse gluten-free squid
                                                scenester freegan cosby sweater. Fanny pack portland seitan DIY,
                                                art party locavore wolf cliche high life echo park Austin. Cred
                                                vinyl keffiyeh DIY salvia PBR, banh mi before they sold out
                                                farm-to-table VHS.
                                            </p>
                                        </div>
                                    </div>
                                </div><!-- end card-body -->
                            </div><!-- end card -->
                        </div>
                        <!--end col-->

                        <div class="col-xxl-6">
                            <h5 class="mb-3">Justify Tabs</h5>
                            <div class="card">
                                <div class="card-body">
                                    <p class="text-muted">Use <code>nav-justified</code> class to generate equal-width elements with all horizontal space will be occupied by nav links.</p>
                                    <!-- Nav tabs -->
                                    <ul class="nav nav-tabs nav-justified mb-3" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link" data-bs-toggle="tab" href="#base-justified-home" role="tab" aria-selected="false">
                                                Home
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link active" data-bs-toggle="tab" href="#base-justified-product" role="tab" aria-selected="false">
                                                Product
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" data-bs-toggle="tab" href="#base-justified-messages" role="tab" aria-selected="false">
                                                Messages
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" data-bs-toggle="tab" href="#base-justified-settings" role="tab" aria-selected="true">
                                                Settings
                                            </a>
                                        </li>
                                    </ul>
                                    <!-- Tab panes -->
                                    <div class="tab-content  text-muted">
                                        <div class="tab-pane" id="base-justified-home" role="tabpanel">
                                            <h6>Graphic Design</h6>
                                            <p class="mb-0">
                                                They all have something to say beyond the words on the page. They can come across as casual or neutral, exotic or graphic. That's why it's important to think about your message, then choose a font that fits. Cosby sweater eu banh mi, qui irure terry richardson ex squid.
                                            </p>
                                        </div>
                                        <div class="tab-pane active" id="product" role="tabpanel">
                                            <h6>Product</h6>
                                            <p class="mb-0">
                                                You've probably heard that opposites attract. The same is true for fonts. Don't be afraid to combine font styles that are different but complementary, like sans serif with serif, short with tall, or decorative with simple. Qui photo booth letterpress, commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR.
                                            </p>
                                        </div>
                                        <div class="tab-pane" id="base-justified-messages" role="tabpanel">
                                            <h6>Messages</h6>
                                            <p class="mb-0">
                                                Etsy mixtape wayfarers, ethical wes anderson tofu before they
                                                sold out mcsweeney's organic lomo retro fanny pack lo-fi
                                                farm-to-table readymade. Messenger bag gentrify pitchfork
                                                tattooed craft beer, iphone skateboard locavore carles etsy
                                                salvia banksy hoodie helvetica. DIY synth PBR banksy irony.
                                            </p>
                                        </div>
                                        <div class="tab-pane" id="base-justified-settings" role="tabpanel">
                                            <h6>Settings</h6>
                                            <p class="mb-0">
                                                Trust fund seitan letterpress, keytar raw denim keffiyeh etsy
                                                art party before they sold out master cleanse gluten-free squid
                                                scenester freegan cosby sweater. Fanny pack portland seitan DIY,
                                                art party locavore wolf cliche high life echo park Austin. Cred
                                                vinyl keffiyeh DIY salvia PBR, banh mi before they sold out
                                                farm-to-table VHS.
                                            </p>
                                        </div>
                                    </div>
                                </div><!-- end card-body -->
                            </div><!-- end card -->
                        </div>
                        <!--end col-->
                    </div>
                    <!--end row-->

                    <div class="row">
                        <div class="col-xxl-6">
                            <h5 class="mb-3">Pills Tabs</h5>
                            <div class="card">
                                <div class="card-body">
                                    <p class="text-muted">Use <code>nav-pills</code> class to generate particular selected nav links without borders.</p>
                                    <!-- Nav tabs -->
                                    <ul class="nav nav-pills nav-success mb-3" role="tablist">
                                        <li class="nav-item waves-effect waves-light">
                                            <a class="nav-link active" data-bs-toggle="tab" href="#home-1" role="tab">Home</a>
                                        </li>
                                        <li class="nav-item waves-effect waves-light">
                                            <a class="nav-link" data-bs-toggle="tab" href="#profile-1" role="tab">Profile</a>
                                        </li>
                                        <li class="nav-item waves-effect waves-light">
                                            <a class="nav-link" data-bs-toggle="tab" href="#messages-1" role="tab">Messages</a>
                                        </li>
                                        <li class="nav-item waves-effect waves-light">
                                            <a class="nav-link" data-bs-toggle="tab" href="#settings-1" role="tab">Settings</a>
                                        </li>
                                    </ul>
                                    <!-- Tab panes -->
                                    <div class="tab-content text-muted">
                                        <div class="tab-pane active" id="home-1" role="tabpanel">
                                            <div class="d-flex">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-circle-fill text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    Raw denim you probably haven't heard of them jean shorts Austin.
                                                    Nesciunt tofu stumptown aliqua, retro synth master cleanse.
                                                </div>
                                            </div>
                                            <div class="d-flex mt-2">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-circle-fill text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    Too much or too little spacing, as in the example below, can make things unpleasant for the reader. The goal is to make your text as comfortable to read as possible.
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="profile-1" role="tabpanel">
                                            <div class="d-flex">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-circle-fill text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    In some designs, you might adjust your tracking to create a certain artistic effect. It can also help you fix fonts that are poorly spaced to begin with.
                                                </div>
                                            </div>
                                            <div class="d-flex mt-2">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-circle-fill text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart.
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="messages-1" role="tabpanel">
                                            <div class="d-flex">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-circle-fill text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    Each design is a new, unique piece of art birthed into this world, and while you have the opportunity to be creative and make your own style choices.
                                                </div>
                                            </div>
                                            <div class="d-flex mt-2">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-circle-fill text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    For that very reason, I went on a quest and spoke to many different professional graphic designers and asked them what graphic design tips they live.
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="settings-1" role="tabpanel">
                                            <div class="d-flex mt-2">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-circle-fill text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    For that very reason, I went on a quest and spoke to many different professional graphic designers and asked them what graphic design tips they live.
                                                </div>
                                            </div>
                                            <div class="d-flex mt-2">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-circle-fill text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    After gathering lots of different opinions and graphic design basics, I came up with a list of 30 graphic design tips that you can start implementing.
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div><!-- end card-body -->
                            </div><!-- end card -->
                        </div>
                        <!--end col-->

                        <div class="col-xxl-6">
                            <h5 class="mb-3">Pills Justified Tabs</h5>
                            <div class="card">
                                <div class="card-body">
                                    <p class="text-muted">Use <code>nav-pills nav-justified</code> class to generate equal-width elements without borders, all horizontal space will be occupied by nav links.</p>
                                    <!-- Nav tabs -->
                                    <ul class="nav nav-pills nav-justified mb-3" role="tablist">
                                        <li class="nav-item waves-effect waves-light">
                                            <a class="nav-link active" data-bs-toggle="tab" href="#pill-justified-home-1" role="tab">
                                                Home
                                            </a>
                                        </li>
                                        <li class="nav-item waves-effect waves-light">
                                            <a class="nav-link" data-bs-toggle="tab" href="#pill-justified-profile-1" role="tab">
                                                Profile
                                            </a>
                                        </li>
                                        <li class="nav-item waves-effect waves-light">
                                            <a class="nav-link" data-bs-toggle="tab" href="#pill-justified-messages-1" role="tab">
                                                Messages
                                            </a>
                                        </li>
                                        <li class="nav-item waves-effect waves-light">
                                            <a class="nav-link" data-bs-toggle="tab" href="#pill-justified-settings-1" role="tab">
                                                Settings
                                            </a>
                                        </li>
                                    </ul>
                                    <!-- Tab panes -->
                                    <div class="tab-content text-muted">
                                        <div class="tab-pane active" id="pill-justified-home-1" role="tabpanel">
                                            <div class="d-flex">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-circle-fill text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    Raw denim you probably haven't heard of them jean shorts Austin.
                                                    Nesciunt tofu stumptown aliqua, retro synth master cleanse.
                                                </div>
                                            </div>
                                            <div class="d-flex mt-2">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-circle-fill text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    Too much or too little spacing, as in the example below, can make things unpleasant for the reader. The goal is to make your text as comfortable to read as possible.
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="pill-justified-profile-1" role="tabpanel">
                                            <div class="d-flex">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-circle-fill text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    In some designs, you might adjust your tracking to create a certain artistic effect. It can also help you fix fonts that are poorly spaced to begin with.
                                                </div>
                                            </div>
                                            <div class="d-flex mt-2">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-circle-fill text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart.
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="pill-justified-messages-1" role="tabpanel">
                                            <div class="d-flex">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-circle-fill text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    Each design is a new, unique piece of art birthed into this world, and while you have the opportunity to be creative and make your own style choices.
                                                </div>
                                            </div>
                                            <div class="d-flex mt-2">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-circle-fill text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    For that very reason, I went on a quest and spoke to many different professional graphic designers and asked them what graphic design tips they live.
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="pill-justified-settings-1" role="tabpanel">
                                            <div class="d-flex mt-2">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-circle-fill text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    For that very reason, I went on a quest and spoke to many different professional graphic designers and asked them what graphic design tips they live.
                                                </div>
                                            </div>
                                            <div class="d-flex mt-2">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-circle-fill text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    After gathering lots of different opinions and graphic design basics, I came up with a list of 30 graphic design tips that you can start implementing.
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div><!-- end card-body -->
                            </div><!-- end card -->
                        </div>
                        <!--end col-->
                    </div>
                    <!--end row-->

                    <div class="row">
                        <div class="col-xxl-6">
                            <h5 class="mb-3">Vertical Nav Tabs</h5>
                            <div class="card">
                                <div class="card-body">
                                    <p class="text-muted">Use <code>flex-column</code> class to create Vertical nav tabs.</p>
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="nav flex-column nav-pills text-center" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                                                <a class="nav-link mb-2 active" id="v-pills-home-tab" data-bs-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">Home</a>
                                                <a class="nav-link mb-2" id="v-pills-profile-tab" data-bs-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">Profile</a>
                                                <a class="nav-link mb-2" id="v-pills-messages-tab" data-bs-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false">Messages</a>
                                                <a class="nav-link" id="v-pills-settings-tab" data-bs-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false">Settings</a>
                                            </div>
                                        </div><!-- end col -->
                                        <div class="col-md-9">
                                            <div class="tab-content text-muted mt-4 mt-md-0" id="v-pills-tabContent">
                                                <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                                                    <div class="d-flex mb-2">
                                                        <div class="flex-shrink-0">
                                                            <img src="{$themePath}/assets/images/small/img-4.jpg" alt="" width="150" class="rounded"></img>
                                                        </div>
                                                        <div class="flex-grow-1 ms-3">
                                                            <p class="mb-0">You always want to make sure that your fonts work well together and try to limit the number of fonts you use to three or less. Experiment and play around with the fonts that you already have in the software you’re working with reputable font websites.</p>
                                                        </div>
                                                    </div>
                                                    <p class="mb-0">
                                                        This may be the most commonly encountered tip I received from the designers I spoke with. They highly encourage that you use different fonts in one design, but do not over-exaggerate and go overboard.
                                                    </p>
                                                </div>
                                                <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                                                    <div class="d-flex mb-2">
                                                        <div class="flex-shrink-0">
                                                            <img src="{$themePath}/assets/images/small/img-5.jpg" alt="" width="150" class="rounded"></img>
                                                        </div>
                                                        <div class="flex-grow-1 ms-3">
                                                            <p class="mb-0"> I also decreased the transparency in the text so that the mountains come through the text, bringing the quote truly to life. Make sure that the placement of your text is pleasing to look at, and you try to achieve symmetry for this effect.</p>
                                                        </div>
                                                    </div>
                                                    <p class="mb-0">
                                                        You've probably heard that opposites attract. The same is true for fonts. Don't be afraid to combine font styles that are different but complementary. You can always play around with the text that is overlaid on an image.
                                                    </p>
                                                </div>
                                                <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
                                                    <div class="d-flex mb-2">
                                                        <div class="flex-shrink-0">
                                                            <img src="{$themePath}/assets/images/small/img-6.jpg" alt="" width="150" class="rounded"></img>
                                                        </div>
                                                        <div class="flex-grow-1 ms-3">
                                                            <p class="mb-0">In this image, you can see that the line height has been reduced significantly, and the size was brought up exponentially. Experiment and play around with the fonts that you already have in the software you’re working with reputable font websites.</p>
                                                        </div>
                                                    </div>
                                                    <p class="mb-0">
                                                        They highly encourage that you use different fonts in one design, but do not over-exaggerate and go overboard This may be the most commonly encountered tip I received from the designers I spoke with.
                                                    </p>
                                                </div>
                                                <div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                                                    <div class="d-flex mb-2">
                                                        <div class="flex-shrink-0">
                                                            <img src="{$themePath}/assets/images/small/img-7.jpg" alt="" width="150" class="rounded"></img>
                                                        </div>
                                                        <div class="flex-grow-1 ms-3">
                                                            <p class="mb-0">When designing, the goal is to draw someone’s attention and portray to them what you’re trying to say. You can make a big statement by using little tricks, like this one. Use contrasting fonts. you can use a bold sanserif font with a cursive.</p>
                                                        </div>
                                                    </div>
                                                    <p class="mb-0">
                                                        If you’re using multiple elements, make sure that your principal object is larger than the others, as the eye of your viewer will automatically be drawn to the larger of the two objects.
                                                    </p>
                                                </div>
                                            </div>
                                        </div><!--  end col -->
                                    </div>
                                    <!--end row-->
                                </div><!-- end card-body -->
                            </div><!-- end card -->
                        </div>
                        <!--end col-->
                        <div class="col-xxl-6">
                            <h5 class="mb-3">Card Header Tabs</h5>
                            <div class="card">
                                <div class="card-header align-items-center d-flex">
                                    <div class="flex-grow-1 oveflow-hidden">
                                        <p class="text-muted text-truncates mb-0">Use <code>card-header-tabs</code> class to create card header tabs.</p>
                                    </div>
                                    <div class="flex-shrink-0 ms-2">
                                        <ul class="nav justify-content-end nav-tabs-custom rounded card-header-tabs border-bottom-0" role="tablist">
                                            <li class="nav-item">
                                                <a class="nav-link active" data-bs-toggle="tab" href="#home2" role="tab">
                                                    Home
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" data-bs-toggle="tab" href="#profile2" role="tab">
                                                    Profile
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" data-bs-toggle="tab" href="#messages2" role="tab">
                                                    Message
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <!-- Tab panes -->
                                    <div class="tab-content text-muted">
                                        <div class="tab-pane active" id="home2" role="tabpanel">
                                            <p class="flex-grow-1 mb-0"><img src="{$themePath}/assets/images/users/avatar-2.jpg" alt="" class="avatar-lg rounded float-start me-3">
                                                Food truck fixie locavore, accusamus mcsweeney's marfa nulla
                                                single-origin coffee squid. Exercitation +1 labore velit, blog
                                                sartorial PBR leggings next level wes anderson artisan four loko
                                                farm-to-table craft beer twee. commodo enim craft beer mlkshk aliquip jean shorts ullamco ad
                                                vinyl cillum PBR. Homo nostrud organic, assumenda labore
                                                aesthetic magna delectus.commodo enim craft beer mlkshk aliquip jean shorts ullamco ad
                                                vinyl cillum PBR. Homo nostrud organic, assumenda labore
                                                aesthetic magna delectus. If you’re using multiple elements, make sure that your principal object is larger than assumenda.</img>
                                            </p>
                                        </div>
                                        <div class="tab-pane" id="profile2" role="tabpanel">
                                            <p class="me-3 mb-0">
                                                <img src="{$themePath}/assets/images/users/avatar-3.jpg" alt="" class="avatar-lg rounded float-end ms-3"> Experiment and play around with the fonts that you already have in the software you’re working with reputable font websites. commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR. Homo nostrud organic, assumenda labore aesthetic magna delectus.commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR. Homo nostrud organic, assumenda labore aesthetic magna delectus Scale all elements of your design: text, elements, buttons, everything. Increase or decrease the letter spacing depending on the situation and try, try again until it looks right, and each.</img>
                                            </p>
                                        </div>
                                        <div class="tab-pane" id="messages2" role="tabpanel">
                                            <p class="ms-3 mb-0">
                                                <img src="{$themePath}/assets/images/users/avatar-5.jpg" alt="" class="avatar-lg rounded float-start me-3">Trust fund seitan letterpress, keytar raw denim keffiyeh etsy art party before they sold out master cleanse gluten-free squid scenester freegan cosby sweater. Fanny pack portland seitan DIY, art party locavore wolf cliche high life echo park Austin. Cred vinyl keffiyeh DIY salvia PBR, beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR. Homo nostrud organic, assumenda labore aes Homo nostrud organic, assumenda labore aesthetic magna delectus Scale all elements of your design: text, elements, buttons, everything.Increase or decrease the letter spacing depending on the situation and try, try again until it looks right, and each.</img>
                                            </p>
                                        </div>
                                    </div>
                                </div><!-- end card-body -->
                            </div><!-- end card -->
                        </div>
                        <!--end col-->
                    </div>
                    <!--end row-->

                    <div class="row">

                        <div class="col-xxl-6">
                            <h5 class="mb-3">Custom Tabs Bordered</h5>
                            <div class="card">
                                <div class="card-body">
                                    <p class="text-muted">Use <code>nav-tabs-custom</code> class to create custom tabs with borders.</p>
                                    <!-- Nav tabs -->
                                    <ul class="nav nav-tabs nav-tabs-custom nav-success nav-justified mb-3" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active" data-bs-toggle="tab" href="#home1" role="tab">
                                                Home
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" data-bs-toggle="tab" href="#profile1" role="tab">
                                                Profile
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" data-bs-toggle="tab" href="#messages1" role="tab">
                                                Messages
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" data-bs-toggle="tab" href="#settings1" role="tab">
                                                Settings
                                            </a>
                                        </li>
                                    </ul>

                                    <!-- Tab panes -->
                                    <div class="tab-content text-muted">
                                        <div class="tab-pane active" id="home1" role="tabpanel">
                                            <div class="d-flex">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-multiple-blank-fill text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    Trust fund seitan letterpress, keytar raw denim keffiyeh etsy art party before they sold out master cleanse gluten-free squid scenester freegan cosby sweater. Fanny pack portland seitan DIY, art party locavore wolf cliche high life echo park Austin. Cred vinyl keffiyeh DIY salvia PBR.
                                                    <div class="mt-2">
                                                        <a href="javascript:void(0);" class="btn btn-sm btn-soft-primary">Read More <i class="ri-arrow-right-line ms-1 align-middle"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="profile1" role="tabpanel">
                                            <div class="d-flex">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-multiple-blank-fill text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    When, while the lovely valley teems with vapour around me, and the meridian sun strikes the upper surface of the impenetrable foliage of my trees, and but a few stray gleams steal into the inner sanctuary, I throw myself down among the tall grass by the trickling stream; and, as I lie close to the earth, a thousand unknown.
                                                    <div class="mt-2">
                                                        <a href="javascript:void(0);" class="btn btn-sm btn-soft-primary">Read More <i class="ri-arrow-right-line ms-1 align-middle"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="messages1" role="tabpanel">
                                            <div class="d-flex">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-multiple-blank-fill text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    Etsy mixtape wayfarers, ethical wes anderson tofu before they sold out mcsweeney's organic lomo retro fanny pack lo-fi farm-to-table readymade. Messenger bag gentrify pitchfork tattooed craft beer, iphone skateboard locavore carles etsy salvia banksy hoodie helvetica. DIY synth PBR banksy irony.
                                                    <div class="mt-2">
                                                        <a href="javascript:void(0);" class="btn btn-sm btn-soft-primary">Read More <i class="ri-arrow-right-line ms-1 align-middle"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="settings1" role="tabpanel">
                                            <div class="d-flex">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-multiple-blank-fill text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    when darkness overspreads my eyes, and heaven and earth seem to dwell in my soul and absorb its power, like the form of a beloved mistress, then I often think with longing, Oh, would I could describe these conceptions, could impress upon paper all that is living so full and warm within me, that it might be the.
                                                    <div class="mt-2">
                                                        <a href="javascript:void(0);" class="btn btn-sm btn-soft-primary">Read More <i class="ri-arrow-right-line ms-1 align-middle"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div><!-- end card-body -->
                            </div><!-- end card -->
                        </div>
                        <!--end col-->

                        <div class="col-xxl-6">
                            <h5 class="mb-3">Arrow Nav tabs</h5>
                            <div class="card">
                                <div class="card-body">
                                    <p class="text-muted">Use <code>arrow-navtabs </code>class to create arrow nav tabs.</p>
                                    <ul class="nav nav-pills arrow-navtabs nav-success bg-light mb-3" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active" data-bs-toggle="tab" href="#arrow-overview" role="tab">
                                                <span class="d-block d-sm-none"><i class="mdi mdi-home-variant"></i></span>
                                                <span class="d-none d-sm-block">Overview</span>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" data-bs-toggle="tab" href="#arrow-profile" role="tab">
                                                <span class="d-block d-sm-none"><i class="mdi mdi-account"></i></span>
                                                <span class="d-none d-sm-block">Profile</span>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" data-bs-toggle="tab" href="#arrow-contact" role="tab">
                                                <span class="d-block d-sm-none"><i class="mdi mdi-email"></i></span>
                                                <span class="d-none d-sm-block">Contact</span>
                                            </a>
                                        </li>
                                    </ul>
                                    <!-- Tab panes -->
                                    <div class="tab-content text-muted">
                                        <div class="tab-pane active" id="arrow-overview" role="tabpanel">
                                            <h6>Give your text a good structure</h6>
                                            <p class="mb-0">
                                                Contrary to popular belief, you don’t have to work endless nights and hours to create a <a href="javascript:void(0);" class="text-decoration-underline"><b>Fantastic Design</b></a> by using complicated 3D elements. Flat design is your friend. Remember that. And the great thing about flat design is that it has become more and more popular over the years, which is excellent news to the beginner and advanced designer.
                                            </p>
                                        </div>
                                        <div class="tab-pane" id="arrow-profile" role="tabpanel">
                                            <h6>Use a color palette</h6>
                                            <p class="mb-0">
                                                Opposites attract, and that’s a fact. It’s in our nature to be interested in the unusual, and that’s why using contrasting colors in <a href="javascript:void(0);" class="text-decoration-underline"><b>Graphic Design</b></a> is a must. It’s eye-catching, it makes a statement, it’s impressive graphic design. Increase or decrease the letter spacing depending on the situation and try, try again until it looks right, and each letter has the perfect spot of its own.
                                            </p>
                                        </div>
                                        <div class="tab-pane" id="arrow-contact" role="tabpanel">
                                            <h6>Contact</h6>
                                            <p class="mb-0">
                                                Consistency is the one thing that can take all of the different elements in your design, and tie them all together and make them work. In an awareness campaign, it is vital for people to begin put 2 and 2 together and begin to recognize your cause. Consistency piques people’s interest is that it has become more and more popular over the years, which is excellent news to the beginner and advanced <a href="javascript:void(0);" class="text-decoration-underline"><b>Contact Designer</b></a>.
                                            </p>
                                        </div>
                                    </div>
                                </div><!-- end card-body -->
                            </div><!-- end card -->
                        </div>
                        <!--end col-->
                    </div>
                    <!--end row-->

                    <div class="row">
                        <div class="col-xxl-6">
                            <h5 class="mb-3">Header Justify Tabs</h5>
                            <div class="card">
                                <div class="card-header align-items-xl-center d-xl-flex">
                                    <p class="text-muted flex-grow-1 mb-xl-0">Use <code>card-header-pills</code> class to create header justify tab.</p>
                                    <div class="flex-shrink-0">
                                        <ul class="nav nav-pills card-header-pills" role="tablist">
                                            <li class="nav-item">
                                                <a class="nav-link active" data-bs-toggle="tab" href="#developers" role="tab">
                                                    Developers
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" data-bs-toggle="tab" href="#designers" role="tab">
                                                    Designers
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" data-bs-toggle="tab" href="#managers" role="tab">
                                                    Managers
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div><!-- end card header -->
                                <div class="card-body">
                                    <!-- Tab panes -->
                                    <div class="tab-content text-muted">
                                        <div class="tab-pane active" id="developers" role="tabpanel">
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div class="d-flex">
                                                        <div class="flex-shrink-0">
                                                            <img src="{$themePath}/assets/images/users/avatar-8.jpg" alt="" class="avatar-sm rounded" />
                                                        </div>
                                                        <div class="flex-grow-1 ms-3">
                                                            <h6 class="mb-1 fs-14">Dominic Charlton</h6>
                                                            <p class="mb-0">520 Followers</p>
                                                        </div>
                                                    </div>
                                                    <div class="d-flex mt-3">
                                                        <div class="flex-shrink-0">
                                                            <img src="{$themePath}/assets/images/users/avatar-7.jpg" alt="" class="avatar-sm rounded" />
                                                        </div>
                                                        <div class="flex-grow-1 ms-3">
                                                            <h6 class="mb-1 fs-14">Charlie Pritchard</h6>
                                                            <p class="mb-0">45.2K Followers</p>
                                                        </div>
                                                    </div>
                                                    <div class="d-flex mt-3">
                                                        <div class="flex-shrink-0">
                                                            <img src="{$themePath}/assets/images/users/avatar-6.jpg" alt="" class="avatar-sm rounded" />
                                                        </div>
                                                        <div class="flex-grow-1 ms-3">
                                                            <h6 class="mb-1 fs-14">Harvey Wells</h6>
                                                            <p class="mb-0">1025 Followers</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--end col-->
                                                <div class="col-sm-6">
                                                    <div class="d-flex mt-3 mt-sm-0">
                                                        <div class="flex-shrink-0">
                                                            <img src="{$themePath}/assets/images/users/avatar-5.jpg" alt="" class="avatar-sm rounded" />
                                                        </div>
                                                        <div class="flex-grow-1 ms-3">
                                                            <h6 class="mb-1 fs-14">Amelie Townsend</h6>
                                                            <p class="mb-0">6584 Followers</p>
                                                        </div>
                                                    </div>
                                                    <div class="d-flex mt-3">
                                                        <div class="flex-shrink-0">
                                                            <img src="{$themePath}/assets/images/users/avatar-4.jpg" alt="" class="avatar-sm rounded" />
                                                        </div>
                                                        <div class="flex-grow-1 ms-3">
                                                            <h6 class="mb-1 fs-14">Emily Slater</h6>
                                                            <p class="mb-0">24.8K Followers</p>
                                                        </div>
                                                    </div>
                                                    <div class="d-flex mt-3">
                                                        <div class="flex-shrink-0">
                                                            <img src="{$themePath}/assets/images/users/avatar-3.jpg" alt="" class="avatar-sm rounded" />
                                                        </div>
                                                        <div class="flex-grow-1 ms-3">
                                                            <h6 class="mb-1 fs-14">Declan Long</h6>
                                                            <p class="mb-0">1.5K Followers</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--end col-->
                                            </div>
                                            <!--end row-->
                                        </div>
                                        <div class="tab-pane" id="designers" role="tabpanel">
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div class="d-flex">
                                                        <div class="flex-shrink-0">
                                                            <img src="{$themePath}/assets/images/users/avatar-1.jpg" alt="" class="avatar-sm rounded" />
                                                        </div>
                                                        <div class="flex-grow-1 ms-3">
                                                            <h6 class="mb-1 fs-14">Luke Brown</h6>
                                                            <p class="mb-0">654 Followers</p>
                                                        </div>
                                                    </div>
                                                    <div class="d-flex mt-3">
                                                        <div class="flex-shrink-0">
                                                            <img src="{$themePath}/assets/images/users/avatar-2.jpg" alt="" class="avatar-sm rounded" />
                                                        </div>
                                                        <div class="flex-grow-1 ms-3">
                                                            <h6 class="mb-1 fs-14">Matilda Walker</h6>
                                                            <p class="mb-0">270 Followers</p>
                                                        </div>
                                                    </div>
                                                    <div class="d-flex mt-3">
                                                        <div class="flex-shrink-0">
                                                            <img src="{$themePath}/assets/images/users/avatar-3.jpg" alt="" class="avatar-sm rounded" />
                                                        </div>
                                                        <div class="flex-grow-1 ms-3">
                                                            <h6 class="mb-1 fs-14">Leo Stokes</h6>
                                                            <p class="mb-0">4120 Followers</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--end col-->
                                                <div class="col-sm-6">
                                                    <div class="d-flex mt-3 mt-sm-0">
                                                        <div class="flex-shrink-0">
                                                            <img src="{$themePath}/assets/images/users/avatar-4.jpg" alt="" class="avatar-sm rounded" />
                                                        </div>
                                                        <div class="flex-grow-1 ms-3">
                                                            <h6 class="mb-1 fs-14">Chelsea Preston</h6>
                                                            <p class="mb-0">9854 Followers</p>
                                                        </div>
                                                    </div>
                                                    <div class="d-flex mt-3">
                                                        <div class="flex-shrink-0">
                                                            <img src="{$themePath}/assets/images/users/avatar-5.jpg" alt="" class="avatar-sm rounded" />
                                                        </div>
                                                        <div class="flex-grow-1 ms-3">
                                                            <h6 class="mb-1 fs-14">Jennifer Barker</h6>
                                                            <p class="mb-0">15.8K Followers</p>
                                                        </div>
                                                    </div>
                                                    <div class="d-flex mt-3">
                                                        <div class="flex-shrink-0">
                                                            <img src="{$themePath}/assets/images/users/avatar-6.jpg" alt="" class="avatar-sm rounded" />
                                                        </div>
                                                        <div class="flex-grow-1 ms-3">
                                                            <h6 class="mb-1 fs-14">Callum Murray</h6>
                                                            <p class="mb-0">2K Followers</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--end col-->
                                            </div>
                                            <!--end row-->
                                        </div>
                                        <div class="tab-pane" id="managers" role="tabpanel">
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div class="d-flex">
                                                        <div class="flex-shrink-0">
                                                            <img src="{$themePath}/assets/images/users/avatar-7.jpg" alt="" class="avatar-sm rounded" />
                                                        </div>
                                                        <div class="flex-grow-1 ms-3">
                                                            <h6 class="mb-1 fs-14">Dominic Charlton</h6>
                                                            <p class="mb-0">784 Followers</p>
                                                        </div>
                                                    </div>
                                                    <div class="d-flex mt-3">
                                                        <div class="flex-shrink-0">
                                                            <img src="{$themePath}/assets/images/users/avatar-8.jpg" alt="" class="avatar-sm rounded" />
                                                        </div>
                                                        <div class="flex-grow-1 ms-3">
                                                            <h6 class="mb-1 fs-14">Matilda Walker</h6>
                                                            <p class="mb-0">6549 Followers</p>
                                                        </div>
                                                    </div>
                                                    <div class="d-flex mt-3">
                                                        <div class="flex-shrink-0">
                                                            <img src="{$themePath}/assets/images/users/avatar-4.jpg" alt="" class="avatar-sm rounded" />
                                                        </div>
                                                        <div class="flex-grow-1 ms-3">
                                                            <h6 class="mb-1 fs-14">Jennifer Barker</h6>
                                                            <p class="mb-0">2100 Followers</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--end col-->
                                                <div class="col-sm-6">
                                                    <div class="d-flex mt-3 mt-sm-0">
                                                        <div class="flex-shrink-0">
                                                            <img src="{$themePath}/assets/images/users/avatar-5.jpg" alt="" class="avatar-sm rounded" />
                                                        </div>
                                                        <div class="flex-grow-1 ms-3">
                                                            <h6 class="mb-1 fs-14">Amelie Townsend</h6>
                                                            <p class="mb-0">4565 Followers</p>
                                                        </div>
                                                    </div>
                                                    <div class="d-flex mt-3">
                                                        <div class="flex-shrink-0">
                                                            <img src="{$themePath}/assets/images/users/avatar-1.jpg" alt="" class="avatar-sm rounded" />
                                                        </div>
                                                        <div class="flex-grow-1 ms-3">
                                                            <h6 class="mb-1 fs-14">Emily Slater</h6>
                                                            <p class="mb-0">8K Followers</p>
                                                        </div>
                                                    </div>
                                                    <div class="d-flex mt-3">
                                                        <div class="flex-shrink-0">
                                                            <img src="{$themePath}/assets/images/users/avatar-2.jpg" alt="" class="avatar-sm rounded" />
                                                        </div>
                                                        <div class="flex-grow-1 ms-3">
                                                            <h6 class="mb-1 fs-14">Declan Long</h6>
                                                            <p class="mb-0">9800 Followers</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--end col-->
                                            </div>
                                            <!--end row-->
                                        </div>
                                    </div>
                                </div><!-- end card-body -->
                            </div><!-- end card -->
                        </div>
                        <!--end col-->

                        <div class="col-xxl-6">
                            <h5 class="mb-3">Bottom Card Nav Tabs</h5>
                            <div class="card">
                                <div class="card-body">
                                    <p class="text-muted">Use <code>card-footer-tabs</code> class to create the bottom card nav justify tab.</p>
                                    <div class="tab-content text-muted">
                                        <div class="tab-pane active" id="bottomtabs-home" role="tabpanel">
                                            <h5><i class="ri-home-3-line align-bottom me-1"></i> Home</h5>
                                            <p class="mb-2">
                                                On the note of consistency, color consistency is a MUST. If you’re not trying to create crazy contrast in your design, then a great idea would be for you to use a color palette throughout your entire design. It will subconsciously interest viewers and also is very pleasing to look at.
                                            </p>
                                            <p class="mb-0">
                                                Any bypasser will stop to see what you have to see, even if your design has nothing to do with them, for the simple fact that it is beautiful to look at.
                                            </p>
                                        </div>
                                        <div class="tab-pane" id="bottomtabs-profile" role="tabpanel">
                                            <h5><i class="ri-user-2-line align-bottom me-1"></i> Profile</h5>
                                            <p class="mb-2">
                                                Just like in the image where we talked about using multiple fonts, you can see that the background in this graphic design is blurred. Whenever you put text on top of an image, it’s important that your viewers can understand the text, and sometimes that means applying a gaussian readable.
                                            </p>
                                            <p class="mb-0">
                                                A very bad quack might jinx zippy fowls. Few quips galvanized the mock jury box. Quick brown dogs jump over the lazy fox. The jay, pig, fox, zebra, and my wolves.
                                            </p>
                                        </div>
                                        <div class="tab-pane" id="bottomtabs-messages" role="tabpanel">
                                            <h5><i class="ri-mail-line align-bottom me-1"></i> Messages</h5>
                                            <p class="mb-2">
                                                Blowzy red vixens fight for a quick jump. Joaquin Phoenix was gazed by MTV for luck. A wizard’s job is to vex chumps quickly in fog. Watch "Jeopardy! ", Alex Trebek's fun TV quiz game. Woven silk pyjamas exchanged for blue quartz. Brawny gods just flocked up to quiz and vex him.
                                            </p>
                                            <p class="mb-0">
                                                Big July earthquakes confound zany experimental vow. My girl wove six dozen plaid jackets before she quit. Six big devils from Japan quickly forgot how to waltz.
                                            </p>
                                        </div>
                                    </div>
                                </div><!-- end card-body -->
                                <div class="card-footer bg-transparent border-top">
                                    <!-- Nav tabs -->
                                    <ul class="nav nav-pills nav-justified card-footer-tabs fs-17" role="tablist">
                                        <li class="nav-item" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="Home">
                                            <a class="nav-link active" data-bs-toggle="tab" href="#bottomtabs-home" role="tab">
                                                <i class="ri-home-3-line"></i>
                                            </a>
                                        </li>
                                        <li class="nav-item" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="Profile">
                                            <a class="nav-link" data-bs-toggle="tab" href="#bottomtabs-profile" role="tab">
                                                <i class="ri-user-2-line"></i>
                                            </a>
                                        </li>
                                        <li class="nav-item" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="Messages">
                                            <a class="nav-link" data-bs-toggle="tab" href="#bottomtabs-messages" role="tab">
                                                <i class="ri-mail-line"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div><!-- end card -->
                        </div>
                        <!--end col-->
                    </div>
                    <!--end row-->

                    <div class="row">
                        <div class="col-xxl-6">
                            <h5 class="mb-3">Custom Hover Tabs</h5>
                            <div class="card">
                                <div class="card-body">
                                    <p class="text-muted">Use <code>custom-hover-nav-tabs</code> class to create custom hover tabs.</p>
                                </div>
                                <div class="border">
                                    <ul class="nav nav-pills custom-hover-nav-tabs">
                                        <li class="nav-item">
                                            <a href="#custom-hover-customere" data-bs-toggle="tab" aria-expanded="false" class="nav-link active">
                                                <i class="ri-user-fill nav-icon nav-tab-position"></i>
                                                <h5 class="nav-titl nav-tab-position m-0">Customer</h5>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="#custom-hover-description" data-bs-toggle="tab" aria-expanded="true" class="nav-link">
                                                <i class="ri-file-text-line nav-icon nav-tab-position"></i>
                                                <h5 class="nav-titl nav-tab-position m-0">Description</h5>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="#custom-hover-reviews" data-bs-toggle="tab" aria-expanded="false" class="nav-link">
                                                <i class="ri-star-half-line nav-icon nav-tab-position"></i>
                                                <h5 class="nav-titl nav-tab-position m-0">Reviews</h5>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="card-body">
                                    <div class="tab-content text-muted">
                                        <div class="tab-pane show active" id="custom-hover-customere">
                                            <h6>Customer Details</h6>
                                            <div class="table-responsive">
                                                <table class="table mb-0">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">#</th>
                                                            <th scope="col">Name</th>
                                                            <th scope="col">Address</th>
                                                            <th scope="col">Country</th>
                                                            <th scope="col">Pincode</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <th scope="row">1</th>
                                                            <td>Ruby Butcher</td>
                                                            <td>412 Rosewood Lane</td>
                                                            <td>New York</td>
                                                            <td>10019</td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row">2</th>
                                                            <td>Martha T Goldberg</td>
                                                            <td>2760 Clarksburg Park Road</td>
                                                            <td>Arizona</td>
                                                            <td>86038</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="custom-hover-description">
                                            <h6>Description</h6>
                                            <div class="table-responsive">
                                                <table class="table mb-0">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">Title</th>
                                                            <th scope="col">Categories</th>
                                                            <th scope="col">Author</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>Building Web Apps With Wordpress</td>
                                                            <td>Web, Wordpress, Design</td>
                                                            <td>Lucia Victor</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Information Technology</th>
                                                            <td>Management, Manager, Design</td>
                                                            <td>Arora Sumita</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="custom-hover-reviews">
                                            <h6>Customer Reviews</h6>
                                            <div class="table-responsive">
                                                <table class="table mb-0">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">Name</th>
                                                            <th scope="col">Location</th>
                                                            <th scope="col">Amount</th>
                                                            <th scope="col">Ratings</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>Luke Brown</td>
                                                            <td>New York</td>
                                                            <td>$745</td>
                                                            <td>4.4 <i class="ri-star-s-fill ms-1 text-warning align-middle"></i></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Matilda Walker</td>
                                                            <td>USA</td>
                                                            <td>$87.125</td>
                                                            <td>2.7 <i class="ri-star-s-fill ms-1 text-warning align-middle"></i></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div><!-- end card-body -->
                            </div>
                        </div>
                        <!--end col-->

                        <div class="col-xxl-6">
                            <h5 class="mb-3">Custom Vertical Tabs</h5>
                            <div class="card">
                                <div class="card-body">
                                    <p class="text-muted">Use <code>custom-verti-nav-pills</code> class to create custom vertical tabs.</p>
                                    <div class="row">
                                        <div class="col-lg-3">
                                            <div class="nav nav-pills flex-column nav-pills-tab custom-verti-nav-pills text-center" role="tablist" aria-orientation="vertical">
                                                <a class="nav-link active show" id="custom-v-pills-home-tab" data-bs-toggle="pill" href="#custom-v-pills-home" role="tab" aria-controls="custom-v-pills-home" aria-selected="true">
                                                    <i class="ri-home-4-line d-block fs-20 mb-1"></i> Home
                                                </a>
                                                <a class="nav-link" id="custom-v-pills-profile-tab" data-bs-toggle="pill" href="#custom-v-pills-profile" role="tab" aria-controls="custom-v-pills-profile" aria-selected="false">
                                                    <i class="ri-user-2-line d-block fs-20 mb-1"></i> Profile
                                                </a>
                                                <a class="nav-link" id="custom-v-pills-messages-tab" data-bs-toggle="pill" href="#custom-v-pills-messages" role="tab" aria-controls="custom-v-pills-messages" aria-selected="false">
                                                    <i class="ri-mail-line d-block fs-20 mb-1"></i> Messages
                                                </a>
                                            </div>
                                        </div> <!-- end col-->
                                        <div class="col-lg-9">
                                            <div class="tab-content text-muted mt-3 mt-lg-0">
                                                <div class="tab-pane fade active show" id="custom-v-pills-home" role="tabpanel" aria-labelledby="custom-v-pills-home-tab">
                                                    <div class="d-flex mb-4">
                                                        <div class="flex-shrink-0">
                                                            <img src="{$themePath}/assets/images/small/img-4.jpg" alt="" width="150" class="rounded"></img>
                                                        </div>
                                                        <div class="flex-grow-1 ms-3">
                                                            <p class="mb-0">Experiment and play around with the fonts that you already have in the software you’re working with reputable font websites. commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR. Homo nostrud organic, assumenda labore aesthetic magna delectus.</p>
                                                        </div>
                                                    </div>
                                                    <div class="d-flex">
                                                        <div class="flex-grow-1 me-3">
                                                            <p class="mb-0">Always want to make sure that your fonts work well together and try to limit the number of fonts you use to three or less. Experiment and play around with the fonts that you already have in the software you’re working with reputable font websites.</p>
                                                        </div>
                                                        <div class="flex-shrink-0">
                                                            <img src="{$themePath}/assets/images/small/img-5.jpg" alt="" width="150" class="rounded"></img>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--end tab-pane-->
                                                <div class="tab-pane fade" id="custom-v-pills-profile" role="tabpanel" aria-labelledby="custom-v-pills-profile-tab">
                                                    <div class="d-flex mb-4">
                                                        <div class="flex-shrink-0">
                                                            <img src="{$themePath}/assets/images/small/img-3.jpg" alt="" width="150" class="rounded"></img>
                                                        </div>
                                                        <div class="flex-grow-1 ms-3">
                                                            <p class="mb-0">In some designs, you might adjust your tracking to create a certain artistic effect. It can also help you fix fonts that are poorly spaced to begin with. A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart.</p>
                                                        </div>
                                                    </div>
                                                    <div class="d-flex">
                                                        <div class="flex-grow-1 me-3">
                                                            <p class="mb-0">Each design is a new, unique piece of art birthed into this world, and while you have the opportunity to be creative and make your own style choices. For that very reason, I went on a quest and spoke to many different professional graphic designers.</p>
                                                        </div>
                                                        <div class="flex-shrink-0">
                                                            <img src="{$themePath}/assets/images/small/img-6.jpg" alt="" width="150" class="rounded"></img>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--end tab-pane-->
                                                <div class="tab-pane fade" id="custom-v-pills-messages" role="tabpanel" aria-labelledby="custom-v-pills-messages-tab">
                                                    <div class="d-flex mb-4">
                                                        <div class="flex-shrink-0">
                                                            <img src="{$themePath}/assets/images/small/img-7.jpg" alt="" width="150" class="rounded"></img>
                                                        </div>
                                                        <div class="flex-grow-1 ms-3">
                                                            <p class="mb-0">Trust fund seitan letterpress, keytar raw denim keffiyeh etsy art party before they sold out master cleanse gluten-free squid scenester freegan cosby sweater. Fanny pack portland seitan DIY, art party locavore wolf cliche high life echo park Austin. Cred vinyl keffiyeh DIY salvia PBR.</p>
                                                        </div>
                                                    </div>
                                                    <div class="d-flex">
                                                        <div class="flex-grow-1 me-3">
                                                            <p class="mb-0">They all have something to say beyond the words on the page. They can come across as casual or neutral, exotic or graphic. That's why it's important to think about your message, then choose a font that fits. Cosby sweater eu banh mi, qui irure terry richardson ex squid.</p>
                                                        </div>
                                                        <div class="flex-shrink-0">
                                                            <img src="{$themePath}/assets/images/small/img-8.jpg" alt="" width="150" class="rounded"></img>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--end tab-pane-->
                                            </div>
                                        </div> <!-- end col-->
                                    </div> <!-- end row-->
                                </div><!-- end card-body -->
                            </div>
                            <!--end card-->
                        </div>
                        <!--end col-->

                    </div>
                    <!--end row-->

                    <div class="row">
                        <div class="col-xxl-6">
                            <h5 class="mb-3">Animation Nav</h5>
                            <div class="card">
                                <div class="card-body">
                                    <p class="text-muted">Use <code>animation-nav</code> class to create animated tabs.</p>
                                    <!-- Nav tabs -->
                                    <ul class="nav nav-pills animation-nav nav-justified gap-2 mb-3" role="tablist">
                                        <li class="nav-item waves-effect waves-light">
                                            <a class="nav-link active" data-bs-toggle="tab" href="#animation-home" role="tab">
                                                Home
                                            </a>
                                        </li>
                                        <li class="nav-item waves-effect waves-light">
                                            <a class="nav-link" data-bs-toggle="tab" href="#animation-profile" role="tab">
                                                Profile
                                            </a>
                                        </li>
                                        <li class="nav-item waves-effect waves-light">
                                            <a class="nav-link" data-bs-toggle="tab" href="#animation-messages" role="tab">
                                                Messages
                                            </a>
                                        </li>
                                        <li class="nav-item waves-effect waves-light">
                                            <a class="nav-link" data-bs-toggle="tab" href="#animation-settings" role="tab">
                                                Settings
                                            </a>
                                        </li>
                                    </ul>
                                    <div class="tab-content text-muted">
                                        <div class="tab-pane active" id="animation-home" role="tabpanel">
                                            <div class="d-flex">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-circle-fill text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    Raw denim you probably haven't heard of them jean shorts Austin.
                                                    Nesciunt tofu stumptown aliqua, retro synth master cleanse.
                                                </div>
                                            </div>
                                            <div class="d-flex mt-2">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-circle-fill text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    Too much or too little spacing, as in the example below, can make things unpleasant for the reader. The goal is to make your text as comfortable to read as possible.
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="animation-profile" role="tabpanel">
                                            <div class="d-flex">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-circle-fill text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    In some designs, you might adjust your tracking to create a certain artistic effect. It can also help you fix fonts that are poorly spaced to begin with.
                                                </div>
                                            </div>
                                            <div class="d-flex mt-2">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-circle-fill text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart.
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="animation-messages" role="tabpanel">
                                            <div class="d-flex">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-circle-fill text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    Each design is a new, unique piece of art birthed into this world, and while you have the opportunity to be creative and make your own style choices.
                                                </div>
                                            </div>
                                            <div class="d-flex mt-2">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-circle-fill text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    For that very reason, I went on a quest and spoke to many different professional graphic designers and asked them what graphic design tips they live.
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="animation-settings" role="tabpanel">
                                            <div class="d-flex mt-2">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-circle-fill text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    For that very reason, I went on a quest and spoke to many different professional graphic designers and asked them what graphic design tips they live.
                                                </div>
                                            </div>
                                            <div class="d-flex mt-2">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-circle-fill text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    After gathering lots of different opinions and graphic design basics, I came up with a list of 30 graphic design tips that you can start implementing.
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div><!-- end card-body -->
                            </div>
                        </div>
                        <!--end col-->
                        <div class="col-xxl-6">
                            <h5 class="mb-3">Nav with Badge</h5>
                            <div class="card">
                                <div class="card-body">
                                    <p class="text-muted">Example of nav tabs with badge wrapped in nav item.</p>
                                    <!-- Nav tabs -->
                                    <ul class="nav nav-tabs nav-justified mb-3" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link" data-bs-toggle="tab" href="#nav-badge-home" role="tab" aria-selected="false">
                                                Explore
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link align-middle" data-bs-toggle="tab" href="#nav-badge-profile" role="tab" aria-selected="false">
                                                Profile <span class="badge bg-success">Done</span>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link align-middle" data-bs-toggle="tab" href="#nav-badge-messages" role="tab" aria-selected="false">
                                                Messages <span class="badge bg-danger rounded-circle">5</span>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link active" data-bs-toggle="tab" href="#nav-badge-settings" role="tab" aria-selected="true">
                                                Settings
                                            </a>
                                        </li>
                                    </ul>
                                    <!-- Nav tabs -->
                                    <div class="tab-content text-muted">
                                        <div class="tab-pane active" id="nav-badge-home" role="tabpanel">
                                            <div class="d-flex">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-circle-fill text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    Raw denim you probably haven't heard of them jean shorts Austin.
                                                    Nesciunt tofu stumptown aliqua, retro synth master cleanse.
                                                </div>
                                            </div>
                                            <div class="d-flex mt-2">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-circle-fill text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    Too much or too little spacing, as in the example below, can make things unpleasant for the reader. The goal is to make your text as comfortable to read as possible.
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="nav-badge-profile" role="tabpanel">
                                            <div class="d-flex">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-circle-fill text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    In some designs, you might adjust your tracking to create a certain artistic effect. It can also help you fix fonts that are poorly spaced to begin with.
                                                </div>
                                            </div>
                                            <div class="d-flex mt-2">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-circle-fill text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart.
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="nav-badge-messages" role="tabpanel">
                                            <div class="d-flex">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-circle-fill text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    Each design is a new, unique piece of art birthed into this world, and while you have the opportunity to be creative and make your own style choices.
                                                </div>
                                            </div>
                                            <div class="d-flex mt-2">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-circle-fill text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    For that very reason, I went on a quest and spoke to many different professional graphic designers and asked them what graphic design tips they live.
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="nav-badge-settings" role="tabpanel">
                                            <div class="d-flex mt-2">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-circle-fill text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    For that very reason, I went on a quest and spoke to many different professional graphic designers and asked them what graphic design tips they live.
                                                </div>
                                            </div>
                                            <div class="d-flex mt-2">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-circle-fill text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    After gathering lots of different opinions and graphic design basics, I came up with a list of 30 graphic design tips that you can start implementing.
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div><!-- end card-body -->
                            </div>
                            <!--end card-->
                        </div>
                        <!--end col-->
                    </div>

                    <div class="row">
                        <div class="col-xxl-6">
                            <h5 class="mb-3">Border Top Nav</h5>
                            <div class="card">
                                <div class="card-body">
                                    <p class="text-muted">Use <code>nav-border-top</code> class to create nav tabs with border at top.</p>
                                    <!-- Nav tabs -->
                                    <ul class="nav nav-tabs nav-border-top nav-border-top-primary mb-3" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link" data-bs-toggle="tab" href="#nav-border-top-home" role="tab" aria-selected="false">
                                                Home
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" data-bs-toggle="tab" href="#nav-border-top-profile" role="tab" aria-selected="false">
                                                Profile
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" data-bs-toggle="tab" href="#nav-border-top-messages" role="tab" aria-selected="false">
                                                Messages
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link active" data-bs-toggle="tab" href="#nav-border-top-settings" role="tab" aria-selected="true">
                                                Settings
                                            </a>
                                        </li>
                                    </ul>
                                    <div class="tab-content text-muted">
                                        <div class="tab-pane active" id="nav-border-top-home" role="tabpanel">
                                            <div class="d-flex">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-circle-line text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    Trust fund seitan letterpress, keytar raw denim keffiyeh etsy art party before they sold out master cleanse gluten-free squid scenester freegan cosby sweater. Fanny pack portland seitan DIY, art party locavore wolf cliche high life echo park Austin. Cred vinyl keffiyeh DIY salvia PBR.
                                                    <div class="mt-2">
                                                        <a href="javascript:void(0);" class="btn btn-link">Read More <i class="ri-arrow-right-line ms-1 align-middle"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="nav-border-top-profile" role="tabpanel">
                                            <div class="d-flex">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-circle-line text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    When, while the lovely valley teems with vapour around me, and the meridian sun strikes the upper surface of the impenetrable foliage of my trees, and but a few stray gleams steal into the inner sanctuary, I throw myself down among the tall grass by the trickling stream; and, as I lie close to the earth, a thousand unknown.
                                                    <div class="mt-2">
                                                        <a href="javascript:void(0);" class="btn btn-link">Read More <i class="ri-arrow-right-line ms-1 align-middle"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="nav-border-top-messages" role="tabpanel">
                                            <div class="d-flex">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-circle-line text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    Etsy mixtape wayfarers, ethical wes anderson tofu before they sold out mcsweeney's organic lomo retro fanny pack lo-fi farm-to-table readymade. Messenger bag gentrify pitchfork tattooed craft beer, iphone skateboard locavore carles etsy salvia banksy hoodie helvetica. DIY synth PBR banksy irony.
                                                    <div class="mt-2">
                                                        <a href="javascript:void(0);" class="btn btn-link">Read More <i class="ri-arrow-right-line ms-1 align-middle"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="nav-border-top-settings" role="tabpanel">
                                            <div class="d-flex">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-circle-line text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    when darkness overspreads my eyes, and heaven and earth seem to dwell in my soul and absorb its power, like the form of a beloved mistress, then I often think with longing, Oh, would I could describe these conceptions, could impress upon paper all that is living so full and warm within me, that it might be the.
                                                    <div class="mt-2">
                                                        <a href="javascript:void(0);" class="btn btn-link">Read More <i class="ri-arrow-right-line ms-1 align-middle"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div><!-- end card-body -->
                            </div>
                        </div>
                        <!--end col-->

                        <div class="col-xxl-6">
                            <h5 class="mb-3">Border Top Nav Justified Tabs</h5>
                            <div class="card">
                                <div class="card-body">
                                    <p class="text-muted">Use <code>nav-border-top nav-justified</code> class to create nav tabs with border at top with justified tabs position.</p>
                                    <!-- Nav tabs -->
                                    <ul class="nav nav-tabs nav-justified nav-border-top nav-border-top-success mb-3" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active" data-bs-toggle="tab" href="#nav-border-justified-home" role="tab" aria-selected="false">
                                                <i class="ri-home-5-line align-middle me-1"></i> Home
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" data-bs-toggle="tab" href="#nav-border-justified-profile" role="tab" aria-selected="false">
                                                <i class="ri-user-line me-1 align-middle"></i> Profile
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" data-bs-toggle="tab" href="#nav-border-justified-messages" role="tab" aria-selected="false">
                                                <i class="ri-question-answer-line align-middle me-1"></i>Messages
                                            </a>
                                        </li>
                                    </ul>
                                    <div class="tab-content text-muted">
                                        <div class="tab-pane active" id="nav-border-justified-home" role="tabpanel">
                                            <h6>Give your text a good structure</h6>
                                            <p class="mb-0">
                                                Contrary to popular belief, you don’t have to work endless nights and hours to create a <a href="javascript:void(0);" class="text-decoration-underline"><b>Fantastic Design</b></a> by using complicated 3D elements. Flat design is your friend. Remember that. And the great thing about flat design is that it has become more and more popular over the years, which is excellent news to the beginner and advanced designer.
                                            </p>
                                        </div>
                                        <div class="tab-pane" id="nav-border-justified-profile" role="tabpanel">
                                            <h6>Use a color palette</h6>
                                            <p class="mb-0">
                                                Opposites attract, and that’s a fact. It’s in our nature to be interested in the unusual, and that’s why using contrasting colors in <a href="javascript:void(0);" class="text-decoration-underline"><b>Graphic Design</b></a> is a must. It’s eye-catching, it makes a statement, it’s impressive graphic design. Increase or decrease the letter spacing depending on the situation and try, try again until it looks right, and each letter has the perfect spot of its own.
                                            </p>
                                        </div>
                                        <div class="tab-pane" id="nav-border-justified-messages" role="tabpanel">
                                            <h6>Message</h6>
                                            <p class="mb-0">
                                                Consistency is the one thing that can take all of the different elements in your design, and tie them all together and make them work. In an awareness campaign, it is vital for people to begin put 2 and 2 together and begin to recognize your cause. Consistency piques people’s interest is that it has become more and more popular over the years, which is excellent news to the beginner and advanced <a href="javascript:void(0);" class="text-decoration-underline"><b>Contact Designer</b></a>.
                                            </p>
                                        </div>
                                    </div>
                                </div><!-- end card-body -->
                            </div>
                        </div>
                        <!--end col-->
                    </div>
                    <!--end row-->

                    <div class="row">
                        <div class="col-xxl-6">
                            <h5 class="mb-3">Outline Border Nav</h5>
                            <div class="card">
                                <div class="card-body">
                                    <p class="text-muted">*Use <code>nav-custom-</code> class with modifier class to color tabs.</p>
                                    <!-- Nav tabs -->
                                    <ul class="nav nav-pills nav-custom-outline nav-primary mb-3" role="tablist">
                                        <li class="nav-item waves-effect waves-light">
                                            <a class="nav-link active" data-bs-toggle="tab" href="#border-nav-home" role="tab">Home</a>
                                        </li>
                                        <li class="nav-item waves-effect waves-light">
                                            <a class="nav-link" data-bs-toggle="tab" href="#border-nav-profile" role="tab">Profile</a>
                                        </li>
                                        <li class="nav-item waves-effect waves-light">
                                            <a class="nav-link" data-bs-toggle="tab" href="#border-nav-messages" role="tab">Messages</a>
                                        </li>
                                        <li class="nav-item waves-effect waves-light">
                                            <a class="nav-link" data-bs-toggle="tab" href="#border-nav-settings" role="tab">Settings</a>
                                        </li>
                                    </ul>
                                    <!-- Tab panes -->
                                    <div class="tab-content text-muted">
                                        <div class="tab-pane active" id="border-nav-home" role="tabpanel">
                                            <div class="d-flex">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-circle-fill text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    Raw denim you probably haven't heard of them jean shorts Austin.
                                                    Nesciunt tofu stumptown aliqua, retro synth master cleanse.
                                                </div>
                                            </div>
                                            <div class="d-flex mt-2">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-circle-fill text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    Too much or too little spacing, as in the example below, can make things unpleasant for the reader. The
                                                    goal is to make your text as comfortable to read as possible.
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="border-nav-profile" role="tabpanel">
                                            <div class="d-flex">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-circle-fill text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    In some designs, you might adjust your tracking to create a certain artistic effect. It can also help
                                                    you fix fonts that are poorly spaced to begin with.
                                                </div>
                                            </div>
                                            <div class="d-flex mt-2">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-circle-fill text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I
                                                    enjoy with my whole heart.
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="border-nav-messages" role="tabpanel">
                                            <div class="d-flex">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-circle-fill text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    Each design is a new, unique piece of art birthed into this world, and while you have the opportunity to
                                                    be creative and make your own style choices.
                                                </div>
                                            </div>
                                            <div class="d-flex mt-2">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-circle-fill text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    For that very reason, I went on a quest and spoke to many different professional graphic designers and
                                                    asked them what graphic design tips they live.
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="border-nav-settings" role="tabpanel">
                                            <div class="d-flex mt-2">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-circle-fill text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    For that very reason, I went on a quest and spoke to many different professional graphic designers and
                                                    asked them what graphic design tips they live.
                                                </div>
                                            </div>
                                            <div class="d-flex mt-2">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-circle-fill text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    After gathering lots of different opinions and graphic design basics, I came up with a list of 30
                                                    graphic design tips that you can start implementing.
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div><!-- end card-body -->
                            </div>
                        </div>
                        <!--end col-->

                        <div class="col-xxl-6">
                            <h5 class="mb-3">Custom Nav</h5>
                            <div class="card">
                                <div class="card-body">
                                    <p class="text-muted">*Use <code>nav-custom-</code> class with modifier class to color tabs.</p>
                                    <!-- Nav tabs -->
                                    <ul class="nav nav-pills nav-customs nav-danger mb-3" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active" data-bs-toggle="tab" href="#border-navs-home" role="tab">Home</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" data-bs-toggle="tab" href="#border-navs-profile" role="tab">Profile</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" data-bs-toggle="tab" href="#border-navs-messages" role="tab">Messages</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" data-bs-toggle="tab" href="#border-navs-settings" role="tab">Settings</a>
                                        </li>
                                    </ul><!-- Tab panes -->
                                    <div class="tab-content text-muted">
                                        <div class="tab-pane active" id="border-navs-home" role="tabpanel">
                                            <div class="d-flex">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-circle-fill text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    Raw denim you probably haven't heard of them jean shorts Austin.
                                                    Nesciunt tofu stumptown aliqua, retro synth master cleanse.
                                                </div>
                                            </div>
                                            <div class="d-flex mt-2">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-circle-fill text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    Too much or too little spacing, as in the example below, can make things unpleasant for the
                                                    reader. The
                                                    goal is to make your text as comfortable to read as possible.
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="border-navs-profile" role="tabpanel">
                                            <div class="d-flex">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-circle-fill text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    In some designs, you might adjust your tracking to create a certain artistic effect. It can
                                                    also help
                                                    you fix fonts that are poorly spaced to begin with.
                                                </div>
                                            </div>
                                            <div class="d-flex mt-2">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-circle-fill text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    A wonderful serenity has taken possession of my entire soul, like these sweet mornings of
                                                    spring which I
                                                    enjoy with my whole heart.
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="border-navs-messages" role="tabpanel">
                                            <div class="d-flex">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-circle-fill text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    Each design is a new, unique piece of art birthed into this world, and while you have the
                                                    opportunity to
                                                    be creative and make your own style choices.
                                                </div>
                                            </div>
                                            <div class="d-flex mt-2">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-circle-fill text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    For that very reason, I went on a quest and spoke to many different professional graphic
                                                    designers and
                                                    asked them what graphic design tips they live.
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="border-navs-settings" role="tabpanel">
                                            <div class="d-flex mt-2">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-circle-fill text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    For that very reason, I went on a quest and spoke to many different professional graphic
                                                    designers and
                                                    asked them what graphic design tips they live.
                                                </div>
                                            </div>
                                            <div class="d-flex mt-2">
                                                <div class="flex-shrink-0">
                                                    <i class="ri-checkbox-circle-fill text-success"></i>
                                                </div>
                                                <div class="flex-grow-1 ms-2">
                                                    After gathering lots of different opinions and graphic design basics, I came up with a list
                                                    of 30
                                                    graphic design tips that you can start implementing.
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div><!-- end card-body -->
                            </div>
                        </div>
                        <!--end col-->
                    </div>
                    <!--end row-->

                    <div class="row">
                        <div class="col-xxl-6">
                            <h5 class="mb-3">Colored Nav</h5>
                            <div class="card">
                                <div class="card-body">
                                    <p class="text-muted">Use <code>nav-custom-</code> class with modifier class to color tabs.</p>
                                    <!-- Nav tabs -->
                                    <ul class="nav nav-pills nav-custom nav-custom-success mb-3" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active" data-bs-toggle="tab" href="#nav-colored-home" role="tab">
                                                Home
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" data-bs-toggle="tab" href="#nav-colored-profile" role="tab">
                                                Profile
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" data-bs-toggle="tab" href="#nav-colored-messages" role="tab">
                                                Messages
                                            </a>
                                        </li>
                                    </ul>
                                    <div class="tab-content text-muted">
                                        <div class="tab-pane active" id="nav-colored-home" role="tabpanel">
                                            <div class="d-flex mb-3">
                                                <div class="flex-shrink-0">
                                                    <img src="{$themePath}/assets/images/users/avatar-2.jpg" alt="" class="avatar-md rounded"></img>
                                                </div>
                                                <div class="flex-grow-1 ms-3">
                                                    Food truck fixie locavore, accusamus mcsweeney's marfa nulla
                                                    single-origin coffee squid. Exercitation +1 labore velit, blog
                                                    sartorial PBR leggings next level wes anderson artisan four loko
                                                    farm-to-table craft beer twee. commodo enim craft beer mlkshk aliquip jean shorts ullamco.
                                                </div>
                                            </div>
                                            <div class="d-flex">
                                                <div class="flex-grow-1 me-3">
                                                    For that very reason, I went on a quest and spoke to many different professional graphic designers and asked them what graphic design tips they live. vinyl cillum PBR. Homo nostrud organic, assumenda labore aesthetic magna delectus.
                                                </div>
                                                <div class="flex-shrink-0">
                                                    <img src="{$themePath}/assets/images/users/avatar-3.jpg" alt="" class="avatar-md rounded"></img>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="nav-colored-profile" role="tabpanel">
                                            <div class="d-flex mb-3">
                                                <div class="flex-shrink-0">
                                                    <img src="{$themePath}/assets/images/users/avatar-4.jpg" alt="" class="avatar-md rounded"></img>
                                                </div>
                                                <div class="flex-grow-1 ms-3">
                                                    Increase or decrease the letter spacing depending on the situation and try, try again until it looks right, and each. next level wes anderson artisan four loko farm-to-table craft beer twee. commodo enim craft beer mlkshk aliquip jean shorts ullamco.
                                                </div>
                                            </div>
                                            <div class="d-flex">
                                                <div class="flex-grow-1 me-3">
                                                    Experiment and play around with the fonts that you already have in the software you’re working with reputable font websites. commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR. Homo nostrud organic.
                                                </div>
                                                <div class="flex-shrink-0">
                                                    <img src="{$themePath}/assets/images/users/avatar-1.jpg" alt="" class="avatar-md rounded"></img>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="nav-colored-messages" role="tabpanel">
                                            <div class="d-flex mb-3">
                                                <div class="flex-shrink-0">
                                                    <img src="{$themePath}/assets/images/users/avatar-4.jpg" alt="" class="avatar-md rounded"></img>
                                                </div>
                                                <div class="flex-grow-1 ms-3">
                                                    Trust fund seitan letterpress, keytar raw denim keffiyeh etsy art party before they sold out master cleanse gluten-free squid scenester freegan cosby sweater. Fanny pack portland seitan DIY, art party locavore wolf cliche high life echo park Austin.
                                                </div>
                                            </div>
                                            <div class="d-flex">
                                                <div class="flex-grow-1 me-3">
                                                    Increase or decrease the letter spacing depending on the situation and try, try again until it looks right, and each assumenda labore aes Homo nostrud organic, assumenda labore aesthetic magna elements, buttons, everything..
                                                </div>
                                                <div class="flex-shrink-0">
                                                    <img src="{$themePath}/assets/images/users/avatar-1.jpg" alt="" class="avatar-md rounded"></img>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div><!-- end card-body -->
                            </div>
                        </div>
                        <!--end col-->

                        <div class="col-xxl-6">
                            <h5 class="mb-3">Light Nav</h5>
                            <div class="card">
                                <div class="card-body">
                                    <p class="text-muted">Use <code>nav-custom-light</code> class to lighten the nav tabs area.</p>
                                    <!-- Nav tabs -->
                                    <ul class="nav nav-pills nav-custom nav-custom-light mb-3" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active" data-bs-toggle="tab" href="#nav-light-home" role="tab">
                                                Home
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" data-bs-toggle="tab" href="#nav-light-profile" role="tab">
                                                Profile
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" data-bs-toggle="tab" href="#nav-light-messages" role="tab">
                                                Messages
                                            </a>
                                        </li>
                                    </ul>
                                    <div class="tab-content text-muted">
                                        <div class="tab-pane active" id="nav-light-home" role="tabpanel">
                                            <div class="d-flex mb-1">
                                                <div class="flex-grow-1 me-3">
                                                    Experiment and play around with the fonts that you already have in the software you’re working with reputable font websites. commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR. Homo nostrud organic, assumenda labore aesthetic magna delectus. pposites attract, and that’s a fact. It’s in our nature to be interested in the unusual, and that’s why using contrasting.
                                                </div>
                                                <div class="flex-shrink-0">
                                                    <img src="{$themePath}/assets/images/small/img-4.jpg" alt="" width="150" class="rounded"></img>
                                                </div>
                                            </div>
                                            <p class="mb-0"> Food truck fixie locavore, accusamus mcsweeney's marfa nulla
                                                single-origin coffee squid. Exercitation +1 labore velit, blog
                                                sartorial PBR leggings next level wes anderson artisan four loko
                                                farm-to-table craft beer twee. commodo enim craft beer mlkshk aliquip jean shorts ullamco.</p>
                                        </div>
                                        <div class="tab-pane" id="nav-light-profile" role="tabpanel">
                                            <div class="d-flex mb-1">
                                                <div class="flex-grow-1 me-3">
                                                    Just like in the image where we talked about using multiple fonts, you can see that the background in this graphic design is blurred. Whenever you put text on top of an image, it’s important that your viewers can understand the text, and sometimes that means applying a gaussian readable Any bypasser will stop to see what you have to see, even if your design has nothing to do with them.
                                                </div>
                                                <div class="flex-shrink-0">
                                                    <img src="{$themePath}/assets/images/small/img-5.jpg" alt="" width="150" class="rounded"></img>
                                                </div>
                                            </div>
                                            <p class="mb-0">It makes a statement, it’s impressive graphic design. Increase or decrease the letter spacing depending on the situation and try, try again until it looks right, and each letter has the perfect spot of its own. commodo enim craft beer mlkshk aliquip jean shorts ullamco.</p>
                                        </div>
                                        <div class="tab-pane" id="nav-light-messages" role="tabpanel">
                                            <div class="d-flex mb-1">
                                                <div class="flex-grow-1 me-3">
                                                    Trust fund seitan letterpress, keytar raw denim keffiyeh etsy art party before they sold out master cleanse gluten-free squid scenester freegan cosby sweater. Fanny pack portland seitan DIY, art party locavore wolf cliche high life echo park Austin On the note of consistency, color consistency is a MUST. If you’re not trying to create crazy contrast in your design.
                                                </div>
                                                <div class="flex-shrink-0">
                                                    <img src="{$themePath}/assets/images/small/img-5.jpg" alt="" width="150" class="rounded"></img>
                                                </div>
                                            </div>
                                            <p class="mb-0">Big July earthquakes confound zany experimental vow. My girl wove six dozen plaid jackets before she quit. Six big devils from Japan quickly forgot how to waltz. try again until it looks right, and each assumenda labore aes Homo nostrud organic, assumenda labore aesthetic magna elements, buttons, everything.</p>
                                        </div>
                                    </div>
                                </div><!-- end card-body -->
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
