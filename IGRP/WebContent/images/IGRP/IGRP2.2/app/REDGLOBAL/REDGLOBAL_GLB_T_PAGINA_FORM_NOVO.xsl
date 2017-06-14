<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html><!--XSL Generator (RED/DIM 2015)--><head><!--HOME-HEADER--><xsl:call-template name="home-header"/>
      </head>
      <body class="bodyColor">
        <div class="IGRP_overlay"/><!--HOME TOP--><xsl:call-template name="home-top-main"/><!--HOME--><div id="igrp-bodyPage"><!--HOME LEFT--><xsl:call-template name="home-slide-menu"/><!--HOME RIGTH--><div class="bodyPageRigth"><!-- START YOUR CODE HERE --><!-- SHOW TABLET AND MOBILE TITLE --><div class="box-head showTabMobile">
              <xsl:value-of select="rows/content/title"/>
            </div><!-- SHOW NOTIFICATION MESSAGES--><xsl:apply-templates mode="notif_messages" select="rows/content/messages"/>
            <form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!-- SHOW HIDDEN--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FORM--><!--START TOOLS BAR FROM--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar"/><!--END TOOLS BAR FORM--><div class="col addMarginTop" sep-name="form">
                 <xsl:if test="rows/content/form/label/env_fk">
                  <div class="col-1-4 item" item-name="env_fk">
                    <div class="igrp_item select">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/env_fk) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/env_fk" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/env_fk" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/env_fk/@name}" chosen="select" data-placeholder="{rows/content/form/list/env_fk/option[position() = 1]}" class="select required">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/env_fk"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/env_fk/option[position() != 1]">
                          <option value="{value}">
                            <xsl:if test="@selected='true'">
                              <xsl:attribute name="selected">selected</xsl:attribute>
                            </xsl:if>
                            <xsl:value-of select="text"/>
                          </option>
                        </xsl:for-each>
                      </select>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
				<xsl:if test="rows/content/form/label/version">
                  <div class="col-1-4 item" item-name="version">
                    <div class="igrp_item select">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/version) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/version" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/version" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/version/@name}" chosen="select" data-placeholder="{rows/content/form/list/version/option[position() = 1]}" class="select required">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/version"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/version/option[position() != 1]">
                          <option value="{value}">
                            <xsl:if test="@selected='true'">
                              <xsl:attribute name="selected">selected</xsl:attribute>
                            </xsl:if>
                            <xsl:value-of select="text"/>
                          </option>
                        </xsl:for-each>
                      </select>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
				 <xsl:if test="rows/content/form/label/page">
                  <div class="col-1-4 item" item-name="page">
                    <div class="igrp_item page">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/page) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/page" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/page" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/page/@name}" value="{rows/content/form/value/page}" class="page required">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/page"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
               <xsl:if test="rows/content/form/label/action">
                  <div class="col-1-4 item" item-name="action">
                    <div class="igrp_item action">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/action) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/action" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/action" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/action/@name}" value="{rows/content/form/value/action}" class="action required">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/action"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
				<xsl:if test="rows/content/form/label/page_descr">
                    <div class="col-1-4 item" item-name="page_descr">
                      <div class="igrp_item page_descr">
                        <label>
                          <xsl:if test="string-length(rows/content/form/label/page_descr) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/form/label/page_descr" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/form/label/page_descr" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/page_descr/@name}" value="{rows/content/form/value/page_descr}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/page_descr"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
				  
				  <xsl:if test="rows/content/form/label/action_descr">
                    <div class="col-1-4 item" item-name="action_descr">
                      <div class="igrp_item action_descr">
                        <label>
                          <xsl:if test="string-length(rows/content/form/label/action_descr) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/form/label/action_descr" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/form/label/action_descr" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/action_descr/@name}" value="{rows/content/form/value/action_descr}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/action_descr"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
				
                <div class="_clear"/>
              </div>
            </form><!-- END YOUR CODE HERE --><div class="_clear"/>
          </div>
          <div class="_clear"/>
        </div><!--FOOTER PAGE--><div id="igrp-footerPage">
          <xsl:call-template name="footer"/>
        </div>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150311"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150311"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150311"/>
</xsl:stylesheet>
