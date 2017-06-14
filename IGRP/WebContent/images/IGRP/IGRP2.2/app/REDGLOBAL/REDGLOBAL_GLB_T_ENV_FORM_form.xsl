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
                <xsl:if test="rows/content/form/label/dad">
                  <div class="col-1-4 item" item-name="dad">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/dad) > 45">  
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/dad" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/dad" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/dad/@name}" value="{rows/content/form/value/dad}" class="text required" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/dad"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/name">
                  <div class="col-1-4 item" item-name="name">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/name) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/name" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/name" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/name/@name}" value="{rows/content/form/value/name}" class="text required" maxlength="50">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/name"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/description">
                  <div class="col-1-4 item" item-name="description">
                    <div class="igrp_item textarea">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/description) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/description" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/description" disable-output-escaping="yes"/>
                      </label>
                      <textarea name="{rows/content/form/value/description/@name}" class="textarea" maxlength="500">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/description"/>
                        </xsl:call-template>
                        <xsl:value-of select="rows/content/form/value/description" disable-output-escaping="yes"/>
                      </textarea>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/img_src">
                  <div class="col-1-4 item" item-name="img_src">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/img_src) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/img_src" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/img_src" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/img_src/@name}" value="{rows/content/form/value/img_src}" class="text" maxlength="50">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/img_src"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/action_fk">
                  <div class="col-1-4 item" item-name="action_fk">
                    <div class="igrp_item select">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/action_fk) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/action_fk" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/action_fk" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/action_fk/@name}" chosen="select" data-placeholder="{rows/content/form/list/action_fk/option[position() = 1]}" class="select">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/action_fk"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/action_fk/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/host">
                  <div class="col-1-4 item" item-name="host">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/host) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/host" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/host" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/host/@name}" value="{rows/content/form/value/host}" class="text" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/host"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/apache_dad">
                  <div class="col-1-4 item" item-name="apache_dad">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/apache_dad) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/apache_dad" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/apache_dad" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/apache_dad/@name}" value="{rows/content/form/value/apache_dad}" class="text" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/apache_dad"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/link_menu">
                  <div class="col-1-4 item" item-name="link_menu">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/link_menu) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/link_menu" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/link_menu" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/link_menu/@name}" value="{rows/content/form/value/link_menu}" class="text" maxlength="200">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/link_menu"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/link_center">
                  <div class="col-1-4 item" item-name="link_center">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/link_center) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/link_center" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/link_center" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/link_center/@name}" value="{rows/content/form/value/link_center}" class="text" maxlength="200">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/link_center"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/templates">
                  <div class="col-1-4 item" item-name="templates">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/templates) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/templates" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/templates" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/templates/@name}" value="{rows/content/form/value/templates}" class="text" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/templates"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/flg_old">
                  <div class="col-1-4 item" item-name="flg_old">
                    <div class="igrp_item checkbox">
                      <div class="col-1-1">
                        <input type="checkbox" name="{rows/content/form/value/flg_old/@name}" value="1" class="checkbox">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/flg_old"/>
                          </xsl:call-template>
                          <xsl:if test="rows/content/form/value/flg_old='1'">
                            <xsl:attribute name="checked">checked</xsl:attribute>
                          </xsl:if>
                        </input>
                        <xsl:value-of select="rows/content/form/label/flg_old" disable-output-escaping="yes"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/flg_external">
                  <div class="col-1-4 item" item-name="flg_external">
                    <div class="igrp_item checkbox">
                      <div class="col-1-1">
                        <input type="checkbox" name="{rows/content/form/value/flg_external/@name}" value="1" class="checkbox">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/flg_external"/>
                          </xsl:call-template>
                          <xsl:if test="rows/content/form/value/flg_external='1'">
                            <xsl:attribute name="checked">checked</xsl:attribute>
                          </xsl:if>
                        </input>
                        <xsl:value-of select="rows/content/form/label/flg_external" disable-output-escaping="yes"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/status">
                  <div class="col-1-4 item" item-name="status">
                    <div class="igrp_item checkbox">
                      <div class="col-1-1">
                        <input type="checkbox" name="{rows/content/form/value/status/@name}" value="1" class="checkbox">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/status"/>
                          </xsl:call-template>
                          <xsl:if test="rows/content/form/value/status='1'">
                            <xsl:attribute name="checked">checked</xsl:attribute>
                          </xsl:if>
                        </input>
                        <xsl:value-of select="rows/content/form/label/status" disable-output-escaping="yes"/>
                      </div>
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
