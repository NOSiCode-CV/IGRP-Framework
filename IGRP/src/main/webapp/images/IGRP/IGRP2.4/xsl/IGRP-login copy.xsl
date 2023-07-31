<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
   <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat" />

   <xsl:variable name="login-slides" select="document(concat($path,'/xml/IGRP-login-banner.xml'))/rows/content/table/value"/>
   <xsl:variable name="slides-total" select="count($login-slides/images/row)"/>
 
  <xsl:template match="/">
   
 
    <html id="igrp-login">
      <head>
        <TITLE>IGRP - Login</TITLE>
        <xsl:call-template name="IGRP-head"/>
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/form/igrp.forms.css"/>
        <style>
          
        </style>
      </head>
      <body class="fluid" has-menu="false">
        
        <form action="{rows/content/action}" method="post">
          
          <xsl:for-each select="rows/content/form/value/hidden">
              <input type="hidden" name="{@name}" value="{.}"/>
          </xsl:for-each>

          <div id="app-login-slider" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
              <xsl:for-each select="$login-slides/row">
                <xsl:variable name="active">
                  <xsl:if test="position() = 1">active</xsl:if>
                </xsl:variable>
                <li data-target="#app-login-slider" data-slide-to="{position()-1}" class="{$active}"></li>
              </xsl:for-each>
            </ol>
            <div class="carousel-inner">
              <xsl:for-each select="$login-slides/row">
                <xsl:variable name="active">
                  <xsl:if test="position() = 1">active</xsl:if>
                </xsl:variable>
                <div class="item {$active}" style="background-image:url({$path}/assets/img/login/{image})">

                </div>
              </xsl:for-each>
              
            </div>
          </div>
          
          <div id="igrp-login-wrapper" class="main-centered col-xs-10 col-sm-3">
            
            <div class="box igrp-forms gen-container-item">
              <div class="box-body clearfix">

                <section id="igrp-login-logo" class="content-header gen-container-item text-center">
                  <img src="{$path}/assets/img/loginLogo.svg"/>
                </section>
      
                <div class="">
                  <div role="form" class="clearfix">
                    <xsl:apply-templates select="rows/content/messages" mode="igrp-messages"/>
                    <xsl:if test="rows/content/form/label/user">
                      <div class="input-group col-md-12" item-name="user" item-type="text">
                        <input placeholder="{rows/content/form/label/user}" type="{rows/content/form/value/user/@type}" value="{rows/content/form/value/user}" class="form-control" id="{rows/content/form/value/user/@name}" name="{rows/content/form/value/user/@name}"/>
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                      </div>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/password">
                      <div class="input-group col-md-12" item-name="password" item-type="password">
                        <input placeholder="{rows/content/form/label/password}" type="password" value="{rows/content/form/value/password}" class="form-control" id="{rows/content/form/value/password/@name}" name="{rows/content/form/value/password/@name}"/>
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                      </div>
                    </xsl:if>
                    
                    <xsl:if test="rows/content/form/label/key1">
                      <div class="form-group col-xs-6" item-name="key1" item-type="number">
                        <input type="number" name="{rows/content/form/value/key_value1/@name}" placeholder="{rows/content/form/label/key1}º" autocomplete="off" class="form-control"/>
                        <input type="hidden" name="{rows/content/form/value/key1/@name}" value="{rows/content/form/value/key1}"/>
                      </div>
                    </xsl:if>

                    <xsl:if test="rows/content/form/label/key2">
                      <div class="form-group col-xs-6" item-name="key2" item-type="number">
                        <input type="number" name="{rows/content/form/value/key_value2/@name}" placeholder="{rows/content/form/label/key2}º" autocomplete="off" class="form-control"/>
                        <input type="hidden" name="{rows/content/form/value/key2/@name}" value="{rows/content/form/value/key2}"/>
                      </div>
                    </xsl:if>

                    <xsl:if test="rows/content/form/label/button">
                      <div class="form-group col-xs-12" item-name="button" item-type="button">
                          
                        <button name="p_button" value="p_button" type="submit" class="btn btn-primary form-control" id="{rows/content/form/value/button/@name}" >
                          <span><xsl:value-of select="rows/content/form/label/button"/> <i class="fa fa-sign-in"/></span>
                        </button>

                      </div>
                    </xsl:if>
                    
                    <xsl:if test="rows/content/form/label/button2">
                      <div class="form-group col-xs-12" item-name="button2" item-type="link">
                      
                      	<button style="margin: 0 auto;text-transform:none;" name="p_button2" value="p_button2" type="submit" class="link btn btn-link form-link" id="{rows/content/form/value/button2/@name}" >
                         	<span><xsl:value-of select="rows/content/form/label/button2"/></span>
                        </button>
                        
                      </div>
                    </xsl:if>

                  </div>
                </div>
                <br/>
                <p id="igrp-login-footer" class="text-primary clear text-right">
                  <xsl:value-of select="rows/content/footer_note"/>
                </p>

              </div>
            </div>

          </div>

          <xsl:call-template name="IGRP-bottom"/>
          
        </form>
        <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js"/>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150615"/>
  <xsl:include href="../xsl/tmpl/IGRP-variables.tmpl.xsl?v=20150615"/>
  <xsl:include href="../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1463090556311"/>
  <xsl:include href="../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1463090556312"/>
  <xsl:include href="../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1463090556312"/>
  <xsl:include href="../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1463090556312"/>
</xsl:stylesheet>