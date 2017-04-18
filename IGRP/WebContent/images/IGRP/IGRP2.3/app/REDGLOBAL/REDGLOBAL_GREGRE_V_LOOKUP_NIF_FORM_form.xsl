<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html><!--XSL Generator (RED/DIM 2015)--><head><!--HOME-HEADER--><xsl:call-template name="home-header"/>
      </head>
      <body class="bodyColor">
        <div class="IGRP_overlay"/><!--HOME TOP--><xsl:call-template name="home-top-main"/><!--HOME--><div id="igrp-bodyPage"><!--HOME LEFT--><xsl:call-template name="home-slide-menu"/><!--HOME RIGTH--><div class="bodyPageRigth"><!-- START YOUR CODE HERE --><!-- SHOW TABLET AND MOBILE TITLE --><div class="box-head showTabMobile">
              <xsl:value-of select="rows/content/title"/>
            </div><!-- SHOW NOTIFICATION MESSAGES--><xsl:apply-templates mode="notif_messages" select="rows/content/messages"/>
            <form action="#" method="post" id="formular_default" name="formular_default" class="default_filter"><!-- SHOW HIDDEN--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FILTER--><div class="box-content resetPadding">
                <div class="col">
                  <xsl:if test="rows/content/filter/label/fw_db">
                    <div class="col-1-4 item" item-name="fw_db">
                      <div class="igrp_item select">
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/fw_db) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/fw_db" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/fw_db" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/filter/list/fw_db/@name}" chosen="select" data-placeholder="{rows/content/filter/list/fw_db/option[position() = 1]}" class="select">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/fw_db"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/filter/list/fw_db/option[position() != 1]">
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
                  <xsl:if test="rows/content/filter/label/nu_nif">
                    <div class="col-1-4 item" item-name="nu_nif">
                      <div class="igrp_item number">
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/nu_nif) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/nu_nif" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/nu_nif" disable-output-escaping="yes"/>
                        </label>
                        <input type="number" name="{rows/content/filter/value/nu_nif/@name}" value="{rows/content/filter/value/nu_nif}" class="number" maxlength="22">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/nu_nif"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/filter/label/nm_pesquisa">
                    <div class="col-1-4 item" item-name="nm_pesquisa">
                      <div class="igrp_item text">
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/nm_pesquisa) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/nm_pesquisa" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/nm_pesquisa" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/filter/value/nm_pesquisa/@name}" value="{rows/content/filter/value/nm_pesquisa}" class="text" maxlength="250">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/nm_pesquisa"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/filter/label/nu_bi">
                    <div class="col-1-4 item" item-name="nu_bi">
                      <div class="igrp_item number">
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/nu_bi) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/nu_bi" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/nu_bi" disable-output-escaping="yes"/>
                        </label>
                        <input type="number" name="{rows/content/filter/value/nu_bi/@name}" value="{rows/content/filter/value/nu_bi}" class="number" maxlength="22">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/nu_bi"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/filter/label/tp_contribuinte">
                    <div class="col-1-4 item" item-name="tp_contribuinte">
                      <div class="igrp_item select">
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/tp_contribuinte) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/tp_contribuinte" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/filter/label/tp_contribuinte" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/filter/list/tp_contribuinte/@name}" chosen="select" data-placeholder="{rows/content/filter/list/tp_contribuinte/option[position() = 1]}" class="select required">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/tp_contribuinte"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/filter/list/tp_contribuinte/option[position() != 1]">
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
                </div><!--START TOOL BAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar"/><!--END TOOL BAR FILTER--></div><!-- END FILTER--><!-- START TABELA--><div class="col addBorderLeftRight borderColor">
                <div class="box-table table-responsive">
                  <div class="table-container">
                    <table class="IGRP_table default-table" data-control="table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/nu_nif">
                            <th align="center">
                              <xsl:value-of select="rows/content/table/label/nu_nif"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/nm_contribuinte">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/nm_contribuinte"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/nm_dcomercial">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/nm_dcomercial"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/dt_nascimento">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/dt_nascimento"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/nm_pai">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/nm_pai"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/nm_mae">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/nm_mae"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/nu_documento">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/nu_documento"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <tr row="{position()}" class="">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="nu_nif">
                              <td align="center" data-row="{position()}" data-title="{../../label/nu_nif}" class="js_passa_valor">
                                <a class="link bClick" title="Passa Valor" target="lookup">
                                  <xsl:value-of select="nu_nif" disable-output-escaping="yes"/>
                                </a>
                              </td>
                            </xsl:if>
                            <xsl:if test="nm_contribuinte">
                              <td align="left" data-row="{position()}" data-title="{../../label/nm_contribuinte}" class="js_passa_valor">
                                <a class="link bClick" title="Passa Valor" target="lookup">
                                  <xsl:value-of select="nm_contribuinte" disable-output-escaping="yes"/>
                                </a>
                              </td>
                            </xsl:if>
                            <xsl:if test="nm_dcomercial">
                              <td align="left" data-row="{position()}" data-title="{../../label/nm_dcomercial}" class="text">
                                <xsl:value-of select="nm_dcomercial"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="dt_nascimento">
                              <td align="left" data-row="{position()}" data-title="{../../label/dt_nascimento}" class="text">
                                <xsl:value-of select="dt_nascimento"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="nm_pai">
                              <td align="left" data-row="{position()}" data-title="{../../label/nm_pai}" class="text">
                                <xsl:value-of select="nm_pai"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="nm_mae">
                              <td align="left" data-row="{position()}" data-title="{../../label/nm_mae}" class="text">
                                <xsl:value-of select="nm_mae"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="nu_documento">
                              <td align="left" data-row="{position()}" data-title="{../../label/nu_documento}" class="text">
                                <xsl:value-of select="nu_documento"/>
                              </td>
                            </xsl:if>
                          </tr>
                        </xsl:for-each>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div><!-- END TABELA--></form><!-- END YOUR CODE HERE --><div class="_clear"/>
          </div>
          <div class="_clear"/>
        </div><!--FOOTER PAGE--><div id="igrp-footerPage">
          <xsl:call-template name="footer"/>
        </div>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150317"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150317"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150317"/>
  <xsl:include href="../../xsl/tmpl/IGRP-context.tmpl.xsl?v=20150317"/>
</xsl:stylesheet>
