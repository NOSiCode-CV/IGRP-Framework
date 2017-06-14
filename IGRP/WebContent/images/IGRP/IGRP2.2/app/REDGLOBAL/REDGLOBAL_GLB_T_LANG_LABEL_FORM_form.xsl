<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html><!--XSL Generator (RED/DIM 2015)--><head><!--HOME-HEADER--><xsl:call-template name="home-header"/>
      </head>
      <body class="bodyColor">
        <div class="IGRP_overlay"/><!--HOME TOP--><xsl:call-template name="home-top-main"/><!--HOME--><div id="igrp-bodyPage"><!--HOME LEFT--><xsl:call-template name="home-slide-menu"/><!--HOME RIGTH--><div class="bodyPageRigth"><!-- START YOUR CODE HERE --><!-- SHOW TABLET AND MOBILE TITLE --><div class="box-head showTabMobile">
              <xsl:value-of select="rows/content/title"/>
            </div><!-- SHOW NOTIFICATION MESSAGES--><xsl:apply-templates mode="notif_messages" select="rows/content/messages"/><!-- START SIMPLE-MENU --><xsl:apply-templates mode="simple-menu" select="rows/content/menu"/><!-- END SIMPLE-MENU --><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!-- SHOW HIDDEN--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FORM--><!--START TOOLS BAR FROM--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar"/><!--END TOOLS BAR FORM--><div class="col addMarginTop addPaddingBottom10" sep-name="form">
                <xsl:if test="rows/content/form/label/code">
                  <div class="col-1-4 item" item-name="code">
                    <div class="igrp_item text">
                      <a id="idp_code"/>
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/code) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/code" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/code" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/code/@name}" value="{rows/content/form/value/code}" class="text required IGRP_change" maxlength="22">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/code"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/code_lang">
                  <div class="col-1-4 item" item-name="code_lang">
                    <div class="igrp_item select">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/code_lang) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/code_lang" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/code_lang" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/code_lang/@name}" chosen="select" id="{rows/content/form/list/code_lang/@name}" data-placeholder="{rows/content/form/list/code_lang/option[position() = 1]}" class="select required">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/code_lang"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/code_lang/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/label">
                  <div class="col-1-4 item" item-name="label">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/label) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/label" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/label" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/label/@name}" value="{rows/content/form/value/label}" class="text required" maxlength="250">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/label"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if><!-- INICIO SEPARADOR others--><xsl:if test="rows/content/form/label/others">
                  <div class="box-content resetPadding" sep-name="others">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/others"/>
                    </xsl:call-template>
                    <div class="box-collapser"><!-- START TABELA LIST--><div class="box-table table-responsive">
                        <table rel="T_others" data-control="data-others">
                          <thead>
                            <tr>
                              <xsl:if test="rows/content/form/table/others/label/other_lang">
                                <xsl:if test="not(rows/content/form/table/others/label/other_lang/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/others/label/other_lang" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/others/label/other_label">
                                <xsl:if test="not(rows/content/form/table/others/label/other_label/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/others/label/other_label" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                            </tr>
                          </thead>
                          <tbody>
                            <xsl:for-each select="rows/content/form/table/others/value/row[not(@total='yes')]">
                              <tr row="{position()}">
                                <xsl:if test="other_lang">
                                  <xsl:if test="not(other_lang/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/other_lang}" class="text">
                                      <xsl:value-of select="other_lang" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_other_lang_fk" value="{other_lang}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="other_lang/@visible = 'false'">
                                    <input type="hidden" name="p_other_lang_fk" value="{other_lang}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="other_label">
                                  <xsl:if test="not(other_label/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/other_label}" class="text">
                                      <xsl:value-of select="other_label" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_other_label_fk" value="{other_label}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="other_label/@visible = 'false'">
                                    <input type="hidden" name="p_other_label_fk" value="{other_label}"/>
                                  </xsl:if>
                                </xsl:if>
                                <input type="hidden" name="p_others_id" value="{others_id}"/>
                              </tr>
                            </xsl:for-each>
                          </tbody>
                        </table>
                      </div><!-- END TABELA LIST--><div class="_clear"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150617"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150617"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150617"/>
  <xsl:include href="../../xsl/tmpl/IGRP-menu.tmpl.xsl?v=20150617"/>
</xsl:stylesheet>
