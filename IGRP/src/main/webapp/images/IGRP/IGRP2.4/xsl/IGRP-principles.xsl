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
                  <div class="card">
                    <div class="card-body">
                      <img class="center" src="{$themePath}/assets/images/igrpweb-design-system-wallpaper_v1.0.svg" style="width:100%"></img>

                      <h1 class="py-4">IGRP Design System</h1>

                      <div class="text-muted">
                        <p >IGRP Design System is an open-source platform that facilitates the creation of web applications. 
                  This user-friendly system <b>emphasizes branding, customization, personalization, and user interface (UI) component reuse.</b>
                        </p>

                        <p>At its core, the system is structured around the IGRP brand identity, but it also provides a customization feature 
                  that enables organizations to adapt the system according to their specific brand. This includes modifying colors, fonts, 
                  icons, and visual elements, as well as adding or removing components to match corporate aesthetics or introduce new product features.
                        </p>

                        <p>One of the key features of the IGRP Design System is personalization. It adapts the content and interactions for individual 
                  users based on factors such as usage data, organizational attributes, and more, ensuring relevance in what they encounter.
                        </p>

                        <p>Promoting simplicity and component reuse, the design system enhances user experience by employing clear language, 
                  making interactions straightforward, and providing various ways for users to engage with the system. Users can easily 
                  find what they need and they can be confident that the UI components will work in a consistent way.
                  Developers also benefit from reusable UI components, allowing them to establish a uniform look and feel across their projects. 
                  This streamlined approach boosts efficiency and effectiveness, making the system more powerful and flexible.
                        </p>

                        <p>
                  The IGRP Design System is an indispensable tool for building exceptional web applications. 
                  It offers an extensive array of components and tools to design visually appealing and functional interfaces.
                        </p>

                        <h4>Here are the key benefits of using the IGRP Design System:</h4>
                        <ul class="pt-1">
                          <li>
                            <b>Consistency</b>: The system ensures a uniform look and feel across all your web applications, enhancing brand recognition and memorability.</li>
                          <br/>
                          <li>
                            <b>Efficiency</b>: It offers a library of pre-built components that expedite development, saving time and resources.</li>
                          <br/>
                          <li>
                            <b>Flexibility</b>: With high customizability, the system can be tailored to your specific requirements, making it a versatile tool for diverse projects.</li>
                        </ul>
                      </div>
                    </div>
                  </div>
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