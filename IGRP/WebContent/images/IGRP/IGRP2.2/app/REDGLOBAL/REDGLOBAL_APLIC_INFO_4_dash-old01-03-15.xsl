<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html>
    <!--XSL Generator (RED/DIM 2015)-->
    <head>
    <!--HOME-HEADER-->
    <xsl:call-template name="home-header"/>
    </head>
    <body class="bodyColor">
    <div class="IGRP_overlay"/>
    <!--HOME TOP-->
    <xsl:call-template name="home-top-main"/>
    <!--HOME-->
    <div id="igrp-bodyPage"><!--HOME LEFT-->
      
      <xsl:call-template name="home-slide-menu"/>
      
      <!--HOME RIGTH-->
      <div class="bodyPageRigth"> 
        <!-- START YOUR CODE HERE --> 
        <!-- SHOW TABLET AND MOBILE TITLE -->
        <div class="box-head showTabMobile"> <xsl:value-of select="rows/content/title"/> </div>
        <!-- SHOW NOTIFICATION MESSAGES-->
        <xsl:apply-templates mode="notif_messages" select="rows/content/messages"/>
        <!-- START SIMPLE-MENU -->
        
        <div class="box-content app-box-content-alter">
          <div class="col50100">
            <xsl:if test="rows/content/filter/label/img_app">
              <img class="app-img-logo" src="{rows/content/filter/value/img_app}"/>
            </xsl:if>
            <xsl:if test="rows/content/filter/label/name">
              <p class="app-titulo-logo"><xsl:value-of select="rows/content/filter/value/name" disable-output-escaping="yes"/></p>
            </xsl:if>
            <div class="_clear"/>
          </div>
          <div class="col50100">
            <xsl:apply-templates mode="simple-menu" select="rows/content/menu"/>
            
          </div>
          <div class="_clear"/>
        </div>
        
        <!-- END SIMPLE-MENU -->
        <form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data">
          <!-- SHOW HIDDEN-->
          <xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
          
          <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/>
          <!-- START FORM-->
          <div class="box-content home-app" sep-name="form"><!-- INICIO SEPARADOR favorites-->
            <xsl:if test="rows/content/form/label/favorites">
              <div class="col50100">
                <div class="app-col">
                  <div class="box-content resetPadding" list-name="favorites">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/favorites"/>
                      
                    </xsl:call-template>
                    <div class="box-collapser"> 
                      <!-- START TABELA LIST-->
                      
                      <ul  class="app-list1">
                        <xsl:for-each select="rows/content/form/table/favorites/value/row[not(@total='yes')]">
                          <li class="col-1-2"> <span class="app-img-icon"> <a href="{fav_link}" class="link bClick" target="_self" name="fav_link"> <xsl:value-of select="fav_title" disable-output-escaping="yes"/> </a> </span> </li>
                        </xsl:for-each>
                        <div class="_clear"/>
                      </ul>
                      
                      <!-- END TABELA LIST-->
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </div>
              </div>
            </xsl:if>
            <!-- INICIO SEPARADOR notification-->
            <div class="col50100">
              <div class="app-col">
                <xsl:if test="rows/content/form/label/notification">
                  <div class="box-content resetPadding" list-name="notification">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/notification"/>
                      
                    </xsl:call-template>
                    <div class="box-collapser"><!-- START TABELA LIST-->
                      <div class="box-table table-responsive">
                        <ul class="app-list2">
                          <xsl:for-each select="rows/content/form/table/notification/value/row[not(@total='yes')]">
                            <li> 
                              <!-- <p class="app-p1"><xsl:value-of select="not_title" disable-output-escaping="yes"/></p> -->
                              <p class="app-p1"><xsl:value-of select="not_data" disable-output-escaping="yes"/></p>
                              <div class="_clear"/>
                              <p class="app-p3 borderColor"><xsl:value-of select="not_description" disable-output-escaping="yes"/></p>
                            </li>
                          </xsl:for-each>
                        </ul>
                      </div>
                      <!-- END TABELA LIST-->
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <!-- INICIO SEPARADOR last_task-->
                <xsl:if test="rows/content/form/label/last_task">
                  <div class="box-content resetPadding" list-name="last_task">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/last_task"/>
                      
                    </xsl:call-template>
                    <div class="box-collapser"><!-- START TABELA LIST-->
                      <div class="box-table table-responsive">
                        <ul class="app-list3">
                          <xsl:for-each select="rows/content/form/table/last_task/value/row[not(@total='yes')]">
                            <li class="borderColor">
                              <p class="app-p1"><xsl:value-of select="task_title" disable-output-escaping="yes"/></p>
                              <p class="app-p2 borderColor"><xsl:value-of select="task_data" disable-output-escaping="yes"/></p>
                              <div class="_clear"/>
                              <p class="app-p3 borderColor"><xsl:value-of select="task_description" disable-output-escaping="yes"/></p>
                            </li>
                          </xsl:for-each>
                        </ul>
                      </div>
                      <!-- END TABELA LIST-->
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
              </div>
            </div>
            <div class="_clear"/>
          </div>
          <!-- START FILTER--> 
          
          <!-- END FILTER-->
        </form>
        <!-- END YOUR CODE HERE -->
        <div class="_clear"/>
      </div>
      <div class="_clear"/>
    </div>
    <!--FOOTER PAGE-->
    <div id="igrp-footerPage">
      <xsl:call-template name="footer"/>
      
    </div>
    </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150319"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150319"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150319"/>
  <xsl:include href="../../xsl/tmpl/IGRP-menu.tmpl.xsl?v=20150319"/>
</xsl:stylesheet>
