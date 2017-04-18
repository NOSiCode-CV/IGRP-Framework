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
                <xsl:if test="rows/content/form/label/f_nome">
                  <xsl:if test="rows/content/form/label/f_nome">
                    <div class="col-1-4 item" item-name="f_nome">
                      <div class="igrp_item text">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/f_nome" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/f_nome/@name}" value="{rows/content/form/value/f_nome}" class="text required" maxlength="100">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/f_nome"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/f_categoria">
                  <xsl:if test="rows/content/form/label/f_categoria">
                    <div class="col-1-4 item" item-name="f_categoria">
                      <div class="igrp_item select">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/f_categoria" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/f_categoria/@name}" chosen="select" data-placeholder="{rows/content/form/list/f_categoria/option[position() = 1]}" class="select required">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/f_categoria"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/f_categoria/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/f_data_public">
                  <xsl:if test="rows/content/form/label/f_data_public">
                    <div class="col-1-4 item" item-name="f_data_public">
                      <div class="igrp_item date">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/f_data_public" disable-output-escaping="yes"/>
                        </label>
                        <div class="itemIcon">
                          <input type="text" name="{rows/content/form/value/f_data_public/@name}" value="{rows/content/form/value/f_data_public}" class="date required" trel="IGRP_datePicker">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/form/label/f_data_public"/>
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
                <xsl:if test="rows/content/form/label/f_copias_disp">
                  <xsl:if test="rows/content/form/label/f_copias_disp">
                    <div class="col-1-4 item" item-name="f_copias_disp">
                      <div class="igrp_item number">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/f_copias_disp" disable-output-escaping="yes"/>
                        </label>
                        <input type="number" name="{rows/content/form/value/f_copias_disp/@name}" value="{rows/content/form/value/f_copias_disp}" class="number required" maxlength="3">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/f_copias_disp"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/f_descricao">
                  <xsl:if test="rows/content/form/label/f_descricao">
                    <div class="col-1-4 item" item-name="f_descricao">
                      <div class="igrp_item textarea">
                        <label>
                          <xsl:value-of select="rows/content/form/label/f_descricao" disable-output-escaping="yes"/>
                        </label>
                        <textarea name="{rows/content/form/value/f_descricao/@name}" class="textarea" maxlength="3000">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/f_descricao"/>
                          </xsl:call-template>
                          <xsl:value-of select="rows/content/form/value/f_descricao" disable-output-escaping="yes"/>
                        </textarea>
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
