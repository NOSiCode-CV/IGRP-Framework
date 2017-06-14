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
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FORM--><!--START TOOLS BAR FROM--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar"/><!--END TOOLS BAR FORM--><div class="col addMarginTop addPaddingBottom10" sep-name="form">
                <xsl:if test="rows/content/form/label/code">
                  <div class="col-1-4 item" item-name="code">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/code) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/code" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/code" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/code/@name}" value="{rows/content/form/value/code}" class="text required" maxlength="50">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/code"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/descr">
                  <div class="col-1-4 item" item-name="descr">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/descr) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/descr" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/descr" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/descr/@name}" value="{rows/content/form/value/descr}" class="text" maxlength="250">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/descr"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/proc_name">
                  <div class="col-1-4 item" item-name="proc_name">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/proc_name) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/proc_name" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/proc_name" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/proc_name/@name}" value="{rows/content/form/value/proc_name}" class="text required" maxlength="250">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/proc_name"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
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
                      <select name="{rows/content/form/list/env_fk/@name}" chosen="select" id="{rows/content/form/list/env_fk/@name}" data-placeholder="{rows/content/form/list/env_fk/option[position() = 1]}" class="select required">
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
                <xsl:if test="rows/content/form/label/type">
                  <div class="col-1-4 item" item-name="type">
                    <div class="igrp_item select">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/type) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/type" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/type" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/type/@name}" chosen="select" id="{rows/content/form/list/type/@name}" data-placeholder="{rows/content/form/list/type/option[position() = 1]}" class="select required">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/type"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/type/option[position() != 1]">
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150923"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150923"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150923"/>
</xsl:stylesheet>
