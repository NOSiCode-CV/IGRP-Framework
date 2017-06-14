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
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FORM--><!--START TOOLS BAR FROM--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar"/><!--END TOOLS BAR FORM--><div class="col" sep-name="form">
                <xsl:if test="rows/content/form/label/page">
                  <div class="col-1-4 item" item-name="page">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/page) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/page" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/page" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/page/@name}" value="{rows/content/form/value/page}" class="text" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/page"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/page_descr">
                  <div class="col-1-4 item" item-name="page_descr">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/page_descr) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/page_descr" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/page_descr" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/page_descr/@name}" value="{rows/content/form/value/page_descr}" class="text" maxlength="100">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/page_descr"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/action">
                  <div class="col-1-4 item" item-name="action">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/action) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/action" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/action" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/action/@name}" value="{rows/content/form/value/action}" class="text" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/action"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/action_descr">
                  <div class="col-1-4 item" item-name="action_descr">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/action_descr) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/action_descr" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/action_descr" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/action_descr/@name}" value="{rows/content/form/value/action_descr}" class="text" maxlength="100">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/action_descr"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/page_type">
                  <div class="col-1-4 item" item-name="page_type">
                    <div class="igrp_item select">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/page_type) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/page_type" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/page_type" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/page_type/@name}" chosen="select" id="{rows/content/form/list/page_type/@name}" data-placeholder="{rows/content/form/list/page_type/option[position() = 1]}" class="select">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/page_type"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/page_type/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/proc_name">
                  <div class="col-1-4 item" item-name="proc_name">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/proc_name) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/proc_name" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/proc_name" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/proc_name/@name}" value="{rows/content/form/value/proc_name}" class="text" maxlength="1000">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/proc_name"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/xsl_src">
                  <div class="col-1-4 item" item-name="xsl_src">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/xsl_src) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/xsl_src" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/xsl_src" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/xsl_src/@name}" value="{rows/content/form/value/xsl_src}" class="text" maxlength="1000">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/xsl_src"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/flg_internet">
                  <div class="col-1-4 item" item-name="flg_internet">
                    <div class="igrp_item radiolist">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/flg_internet) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/flg_internet" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/flg_internet" disable-output-escaping="yes"/>
                      </label>
                      <xsl:for-each select="rows/content/form/list/flg_internet/option">
                        <div class="col-1-1">
                          <input type="radio" name="{../@name}" value="{value}" class="radiolist">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="../../../label/flg_internet"/>
                            </xsl:call-template>
                            <xsl:if test="@selected='true'">
                              <xsl:attribute name="checked">checked</xsl:attribute>
                            </xsl:if>
                          </input>
                          <xsl:value-of select="text" disable-output-escaping="yes"/>
                        </div>
                      </xsl:for-each>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/flg_menu">
                  <div class="col-1-4 item" item-name="flg_menu">
                    <div class="igrp_item checkbox">
                      <div class="col-1-1">
                        <input type="checkbox" name="{rows/content/form/value/flg_menu/@name}" value="1" class="checkbox">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/flg_menu"/>
                          </xsl:call-template>
                          <xsl:if test="rows/content/form/value/flg_menu='1'">
                            <xsl:attribute name="checked">checked</xsl:attribute>
                          </xsl:if>
                        </input>
                        <xsl:value-of select="rows/content/form/label/flg_menu" disable-output-escaping="yes"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/email">
                  <div class="col-1-4 item" item-name="email">
                    <div class="igrp_item email">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/email) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/email" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/email" disable-output-escaping="yes"/>
                      </label>
                      <input type="email" name="{rows/content/form/value/email/@name}" value="{rows/content/form/value/email}" class="email">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/email"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/mensagem">
                  <div class="col-1-4 item" item-name="mensagem">
                    <div class="igrp_item textarea">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/mensagem) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/mensagem" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/mensagem" disable-output-escaping="yes"/>
                      </label>
                      <textarea name="{rows/content/form/value/mensagem/@name}" class="textarea" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/mensagem"/>
                        </xsl:call-template>
                        <xsl:value-of select="rows/content/form/value/mensagem" disable-output-escaping="yes"/>
                      </textarea>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20160106"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20160106"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20160106"/>
</xsl:stylesheet>
