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
                <xsl:if test="rows/content/form/label/descriptionevent">
                  <xsl:if test="rows/content/form/label/descriptionevent">
                    <div class="col" sep-name="descriptionevent">
                      <xsl:call-template name="page-title">
                        <xsl:with-param name="title" select="rows/content/form/label/descriptionevent"/>
                        <xsl:with-param name="class" select="'subtitle'"/>
                      </xsl:call-template>
                    </div>
                  </xsl:if>
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
                <xsl:if test="rows/content/form/label/event">
                  <div class="col-1-4 item" item-name="event">
                    <div class="igrp_item select">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/event) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/event" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/event" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/event/@name}" chosen="select" id="{rows/content/form/list/event/@name}" data-placeholder="{rows/content/form/list/event/option[position() = 1]}" class="select required">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/event"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/event/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/conditon_value">
                  <xsl:if test="rows/content/form/label/conditon_value">
                    <div class="col" sep-name="conditon_value">
                      <xsl:call-template name="page-title">
                        <xsl:with-param name="title" select="rows/content/form/label/conditon_value"/>
                        <xsl:with-param name="class" select="'subtitle'"/>
                      </xsl:call-template>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/condition">
                  <div class="col-1-4 item" item-name="condition">
                    <div class="igrp_item select">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/condition) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/condition" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/condition" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/condition/@name}" chosen="select" id="{rows/content/form/list/condition/@name}" data-placeholder="{rows/content/form/list/condition/option[position() = 1]}" class="select">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/condition"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/condition/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/value">
                  <div class="col-1-4 item" item-name="value">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/value) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/value" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/value" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/value/@name}" value="{rows/content/form/value/value}" class="text" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/value"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/value2">
                  <div class="col-1-4 item" item-name="value2">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/value2) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/value2" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/value2" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/value2/@name}" value="{rows/content/form/value/value2}" class="text" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/value2"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/patern">
                  <div class="col-1-4 item" item-name="patern">
                    <div class="igrp_item select">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/patern) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/patern" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/patern" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/patern/@name}" chosen="select" id="{rows/content/form/list/patern/@name}" data-placeholder="{rows/content/form/list/patern/option[position() = 1]}" class="select">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/patern"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/patern/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/acttiontarget">
                  <xsl:if test="rows/content/form/label/acttiontarget">
                    <div class="col" sep-name="acttiontarget">
                      <xsl:call-template name="page-title">
                        <xsl:with-param name="title" select="rows/content/form/label/acttiontarget"/>
                        <xsl:with-param name="class" select="'subtitle'"/>
                      </xsl:call-template>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/action">
                  <div class="col-1-4 item" item-name="action">
                    <div class="igrp_item select">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/action) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/action" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/action" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/action/@name}" chosen="select" id="{rows/content/form/list/action/@name}" data-placeholder="{rows/content/form/list/action/option[position() = 1]}" class="select required">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/action"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/action/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/valuesum">
                  <div class="col-1-4 item" item-name="valuesum">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/valuesum) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/valuesum" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/valuesum" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/valuesum/@name}" value="{rows/content/form/value/valuesum}" class="text" maxlength="200">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/valuesum"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/target">
                  <div class="col-1-4 item" item-name="target">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/target) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/target" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/target" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/target/@name}" value="{rows/content/form/value/target}" class="text" maxlength="200">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/target"/>
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
                        <xsl:value-of select="rows/content/form/label/proc_name" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/proc_name/@name}" value="{rows/content/form/value/proc_name}" class="text" maxlength="200">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/proc_name"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/tipo_msg">
                  <div class="col-1-4 item" item-name="tipo_msg">
                    <div class="igrp_item select">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/tipo_msg) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/tipo_msg" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/tipo_msg" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/tipo_msg/@name}" chosen="select" id="{rows/content/form/list/tipo_msg/@name}" data-placeholder="{rows/content/form/list/tipo_msg/option[position() = 1]}" class="select">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/tipo_msg"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/tipo_msg/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/mensagem">
                  <div class="col-1-4 item" item-name="mensagem">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/mensagem) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/mensagem" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/mensagem" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/mensagem/@name}" value="{rows/content/form/value/mensagem}" class="text" maxlength="100">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/mensagem"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150507"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150507"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150507"/>
</xsl:stylesheet>
