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
                <xsl:if test="rows/content/form/label/codigo">
                  <xsl:if test="rows/content/form/label/codigo">
                    <div class="col-1-4 item" item-name="codigo">
                      <div class="igrp_item text">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/codigo" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/codigo/@name}" value="{rows/content/form/value/codigo}" class="text required" maxlength="20">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/codigo"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/nome">
                  <xsl:if test="rows/content/form/label/nome">
                    <div class="col-1-4 item" item-name="nome">
                      <div class="igrp_item text">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/nome" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/nome/@name}" value="{rows/content/form/value/nome}" class="text required" maxlength="100">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/nome"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/descricao">
                  <xsl:if test="rows/content/form/label/descricao">
                    <div class="col-1-4 item" item-name="descricao">
                      <div class="igrp_item textarea">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/descricao" disable-output-escaping="yes"/>
                        </label>
                        <textarea name="{rows/content/form/value/descricao/@name}" class="textarea required" maxlength="4000">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/descricao"/>
                          </xsl:call-template>
                          <xsl:value-of select="rows/content/form/value/descricao" disable-output-escaping="yes"/>
                        </textarea>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/uti_id">
                  <xsl:if test="rows/content/form/label/uti_id">
                    <div class="col-1-4 item" item-name="uti_id">
                      <div class="igrp_item select">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/uti_id" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/uti_id/@name}" chosen="select" data-placeholder="{rows/content/form/list/uti_id/option[position() = 1]}" class="select required">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/uti_id"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/uti_id/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/dt_insercao">
                  <xsl:if test="rows/content/form/label/dt_insercao">
                    <div class="col-1-4 item" item-name="dt_insercao">
                      <div class="igrp_item date">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/dt_insercao" disable-output-escaping="yes"/>
                        </label>
                        <div class="itemIcon">
                          <input type="text" name="{rows/content/form/value/dt_insercao/@name}" value="{rows/content/form/value/dt_insercao}" class="date required" trel="IGRP_datePicker">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/form/label/dt_insercao"/>
                            </xsl:call-template>
                          </input>
                          <div class="calendar"/>
                        </div>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/uti_actu_id">
                  <xsl:if test="rows/content/form/label/uti_actu_id">
                    <div class="col-1-4 item" item-name="uti_actu_id">
                      <div class="igrp_item number">
                        <label>
                          <xsl:value-of select="rows/content/form/label/uti_actu_id" disable-output-escaping="yes"/>
                        </label>
                        <input type="number" name="{rows/content/form/value/uti_actu_id/@name}" value="{rows/content/form/value/uti_actu_id}" class="number" maxlength="22">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/uti_actu_id"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/dt_actu">
                  <xsl:if test="rows/content/form/label/dt_actu">
                    <div class="col-1-4 item" item-name="dt_actu">
                      <div class="igrp_item date">
                        <label>
                          <xsl:value-of select="rows/content/form/label/dt_actu" disable-output-escaping="yes"/>
                        </label>
                        <div class="itemIcon">
                          <input type="text" name="{rows/content/form/value/dt_actu/@name}" value="{rows/content/form/value/dt_actu}" class="date" trel="IGRP_datePicker">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/form/label/dt_actu"/>
                            </xsl:call-template>
                          </input>
                          <div class="calendar"/>
                        </div>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if><!-- INICIO SEPARADOR response--><xsl:if test="rows/content/form/label/response">
                  <div class="box-content resetPadding" sep-name="response">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/response"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/id_resp"/>
                <xsl:if test="rows/content/form/label/codigo_resp">
                  <xsl:if test="rows/content/form/label/codigo_resp">
                    <div class="col-1-4 item" item-name="codigo_resp">
                      <div class="igrp_item text">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/codigo_resp" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/codigo_resp/@name}" value="{rows/content/form/value/codigo_resp}" class="text required" maxlength="20">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/codigo_resp"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/nome_resp">
                  <xsl:if test="rows/content/form/label/nome_resp">
                    <div class="col-1-4 item" item-name="nome_resp">
                      <div class="igrp_item text">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/nome_resp" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/nome_resp/@name}" value="{rows/content/form/value/nome_resp}" class="text required" maxlength="100">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/nome_resp"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/descricao_resp">
                  <xsl:if test="rows/content/form/label/descricao_resp">
                    <div class="col-1-4 item" item-name="descricao_resp">
                      <div class="igrp_item textarea">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/descricao_resp" disable-output-escaping="yes"/>
                        </label>
                        <textarea name="{rows/content/form/value/descricao_resp/@name}" class="textarea required" maxlength="4000">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/descricao_resp"/>
                          </xsl:call-template>
                          <xsl:value-of select="rows/content/form/value/descricao_resp" disable-output-escaping="yes"/>
                        </textarea>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/uti_id_resp">
                  <xsl:if test="rows/content/form/label/uti_id_resp">
                    <div class="col-1-4 item" item-name="uti_id_resp">
                      <div class="igrp_item select">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/uti_id_resp" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/uti_id_resp/@name}" chosen="select" data-placeholder="{rows/content/form/list/uti_id_resp/option[position() = 1]}" class="select required">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/uti_id_resp"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/uti_id_resp/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/dt_insercao_resp">
                  <xsl:if test="rows/content/form/label/dt_insercao_resp">
                    <div class="col-1-4 item" item-name="dt_insercao_resp">
                      <div class="igrp_item date">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/dt_insercao_resp" disable-output-escaping="yes"/>
                        </label>
                        <div class="itemIcon">
                          <input type="text" name="{rows/content/form/value/dt_insercao_resp/@name}" value="{rows/content/form/value/dt_insercao_resp}" class="date required" trel="IGRP_datePicker">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/form/label/dt_insercao_resp"/>
                            </xsl:call-template>
                          </input>
                          <div class="calendar"/>
                        </div>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/uti_actu_id_resp">
                  <xsl:if test="rows/content/form/label/uti_actu_id_resp">
                    <div class="col-1-4 item" item-name="uti_actu_id_resp">
                      <div class="igrp_item number">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/uti_actu_id_resp" disable-output-escaping="yes"/>
                        </label>
                        <input type="number" name="{rows/content/form/value/uti_actu_id_resp/@name}" value="{rows/content/form/value/uti_actu_id_resp}" class="number required" maxlength="22">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/uti_actu_id_resp"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/dt_actu_resp">
                  <xsl:if test="rows/content/form/label/dt_actu_resp">
                    <div class="col-1-4 item" item-name="dt_actu_resp">
                      <div class="igrp_item date">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/dt_actu_resp" disable-output-escaping="yes"/>
                        </label>
                        <div class="itemIcon">
                          <input type="text" name="{rows/content/form/value/dt_actu_resp/@name}" value="{rows/content/form/value/dt_actu_resp}" class="date required" trel="IGRP_datePicker">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/form/label/dt_actu_resp"/>
                            </xsl:call-template>
                          </input>
                          <div class="calendar"/>
                        </div>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150306"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150306"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150306"/>
</xsl:stylesheet>
