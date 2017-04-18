<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="IGRP-head"/>
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/form/igrp.forms.css"/>
        <style>
          
        </style>
      </head>
      <body class="old-v fluid" has-menu="false">
        
        <form action="{rows/content/action}" method="post">
          <div class="container-fluid">
            <div class="row">

              <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
                <div id="igrp-login-wrapper" class="content main-centered">
                  
                  <section class="content-header gen-container-item">
                    <img src="{$path}/assets/img/loginlogo.png"/>
                  </section>

                  <xsl:apply-templates select="rows/content/messages" mode="igrp-messages"/>
                                    
                  <div class="box igrp-forms gen-container-item">
                    <div class="box-body">
                      
                      <div role="form" gen-id="drop-zone" first-type-container="" last-type-container="">

                        <xsl:if test="rows/content/form/label/user">
                          <div class="form-group col-md-12" item-name="user" item-type="text">
                            <label for="{rows/content/form/label/user/@name}">
                              <xsl:value-of select="rows/content/form/label/user"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/user}" class="form-control" id="{rows/content/form/value/user/@name}" name="{rows/content/form/value/user/@name}"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/password">
                          <div class="form-group col-md-12" item-name="password" item-type="password">
                            <label for="{rows/content/form/label/password/@name}">
                              <xsl:value-of select="rows/content/form/label/password"/>
                            </label>
                            <input type="password" value="{rows/content/form/value/password}" class="form-control" id="{rows/content/form/value/password/@name}" name="{rows/content/form/value/password/@name}"/>
                          </div>
                        </xsl:if>
                        
                        <xsl:if test="rows/content/form/label/key1">
                          <div class="form-group col-xs-3" item-name="key1" item-type="number">
                            <input type="number" name="{rows/content/form/value/key_value1/@name}" placeholder="{rows/content/form/label/key1}º" autocomplete="off" class="form-control"/>
                            <input type="hidden" name="{rows/content/form/value/key1/@name}" value="{rows/content/form/value/key1}"/>
                          </div>
                        </xsl:if>

                        <xsl:if test="rows/content/form/label/key2">
                          <div class="form-group col-xs-3" item-name="key2" item-type="number">
                            <input type="number" name="{rows/content/form/value/key_value2/@name}" placeholder="{rows/content/form/label/key2}º" autocomplete="off" class="form-control"/>
                            <input type="hidden" name="{rows/content/form/value/key2/@name}" value="{rows/content/form/value/key2}"/>
                          </div>
                        </xsl:if>

                        <xsl:if test="rows/content/form/label/button">
                          <div class="form-group col-xs-6" item-name="button" item-type="button">
                            <input type="submit" value="{rows/content/form/label/button}" class="btn btn-primary form-control" id="{rows/content/form/value/button/@name}" />
                          </div>
                        </xsl:if>

                      </div>
                    </div>

                  </div>
                  
                  <p id="igrp-login-footer" class="pull-right text-primary">
                    <xsl:value-of select="rows/content/footer_note"/>
                  </p>

                </div>
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