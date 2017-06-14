<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html><!--XSL Generator (RED/DIM 2015)--><head><!--HOME-HEADER--><xsl:call-template name="home-header"/>
      </head>
      <body class="bodyColor">
        <div class="IGRP_overlay"/><!--HOME TOP--><xsl:call-template name="home-top-main"/><!--HOME--><div id="igrp-bodyPage"><!--HOME LEFT--><xsl:if test="not(rows/target) or rows/target!='_blank'"><!--MENU--><div class="bodyPageLeft">
              <xsl:apply-templates mode="slide-menu" select="document(rows/slide-menu/@file)"/>
            </div>
          </xsl:if><!--HOME RIGTH--><div class="bodyPageRigth"><!-- START YOUR CODE HERE --><!-- SHOW TABLET AND MOBILE TITLE --><div class="box-head showTabMobile">
              <xsl:value-of select="rows/content/title"/>
            </div><!-- SHOW NOTIFICATION MESSAGES--><xsl:apply-templates mode="notif_messages" select="rows/content/messages"/>
            <form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!-- SHOW HIDDEN--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FORM--><!--START TOOLS BAR FROM--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar"/><!--END TOOLS BAR FORM--><div class="col addMarginTop" sep-name="form">
                <xsl:if test="rows/content/form/label/id"/>
                <xsl:if test="rows/content/form/label/class_fk"/>
                <xsl:if test="rows/content/form/label/start_mode"/>
                <xsl:if test="rows/content/form/label/status"/>
                <xsl:if test="rows/content/form/label/event_time"/>
                <xsl:if test="rows/content/form/label/proc_name"/>
                <xsl:if test="rows/content/form/label/proc_tp_fk"/>
                <xsl:if test="rows/content/form/label/form_proc_name"/>
                <xsl:if test="rows/content/form/label/acti_tp_fk"/>
                <xsl:if test="rows/content/form/label/self_id"/>
                <xsl:if test="rows/content/form/label/env_fk"/>
                <xsl:if test="rows/content/form/label/area_super_fk"/>
                <xsl:if test="rows/content/form/label/code"/>
                <xsl:if test="rows/content/form/label/name">
                  <xsl:if test="rows/content/form/label/name">
                    <div class="col-1-4 item" item-name="name">
                      <div class="igrp_item text">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/name" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/name/@name}" value="{rows/content/form/value/name}" class="text required" maxlength="100">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/name"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/description">
                  <xsl:if test="rows/content/form/label/description">
                    <div class="col-1-4 item" item-name="description">
                      <div class="igrp_item textarea">
                        <label>
                          <xsl:value-of select="rows/content/form/label/description" disable-output-escaping="yes"/>
                        </label>
                        <textarea name="{rows/content/form/value/description/@name}" class="textarea" maxlength="4000">
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
                </xsl:if>
                <xsl:if test="rows/content/form/label/priority">
                  <xsl:if test="rows/content/form/label/priority">
                    <div class="col-1-4 item" item-name="priority">
                      <div class="igrp_item select">
                        <label>
                          <xsl:value-of select="rows/content/form/label/priority" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/priority/@name}" chosen="select" data-placeholder="{rows/content/form/list/priority/option[position() = 1]}" class="select">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/priority"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/priority/option[position() != 1]">
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
                </xsl:if>
                <xsl:if test="rows/content/form/label/flag_payment"/><!-- INICIO SEPARADOR tempos--><xsl:if test="rows/content/form/label/tempos">
                  <div class="box-content resetPadding" sep-name="tempos">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/tempos"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/time_unity">
                  <xsl:if test="rows/content/form/label/time_unity">
                    <div class="col-1-4 item" item-name="time_unity">
                      <div class="igrp_item select">
                        <label>
                          <xsl:value-of select="rows/content/form/label/time_unity" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/time_unity/@name}" chosen="select" data-placeholder="{rows/content/form/list/time_unity/option[position() = 1]}" class="select">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/time_unity"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/time_unity/option[position() != 1]">
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
                </xsl:if>
                <xsl:if test="rows/content/form/label/optimal_time">
                  <xsl:if test="rows/content/form/label/optimal_time">
                    <div class="col-1-4 item" item-name="optimal_time">
                      <div class="igrp_item number">
                        <label>
                          <xsl:value-of select="rows/content/form/label/optimal_time" disable-output-escaping="yes"/>
                        </label>
                        <input type="number" name="{rows/content/form/value/optimal_time/@name}" value="{rows/content/form/value/optimal_time}" class="number" maxlength="22">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/optimal_time"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/warn_time">
                  <xsl:if test="rows/content/form/label/warn_time">
                    <div class="col-1-4 item" item-name="warn_time">
                      <div class="igrp_item number">
                        <label>
                          <xsl:value-of select="rows/content/form/label/warn_time" disable-output-escaping="yes"/>
                        </label>
                        <input type="number" name="{rows/content/form/value/warn_time/@name}" value="{rows/content/form/value/warn_time}" class="number" maxlength="22">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/warn_time"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/limit_time">
                  <xsl:if test="rows/content/form/label/limit_time">
                    <div class="col-1-4 item" item-name="limit_time">
                      <div class="igrp_item number">
                        <label>
                          <xsl:value-of select="rows/content/form/label/limit_time" disable-output-escaping="yes"/>
                        </label>
                        <input type="number" name="{rows/content/form/value/limit_time/@name}" value="{rows/content/form/value/limit_time}" class="number" maxlength="22">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/limit_time"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/flag_multi"/>
                <xsl:if test="rows/content/form/label/multi_flow"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150309"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150309"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150309"/>
</xsl:stylesheet>
