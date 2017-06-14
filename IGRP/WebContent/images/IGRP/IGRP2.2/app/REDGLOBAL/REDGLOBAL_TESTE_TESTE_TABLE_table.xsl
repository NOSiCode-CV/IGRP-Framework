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
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START TABELA--><div class="col addBorderLeftRight borderColor">
                <div class="box-table table-responsive"><!-- LEGENDA TABELA --><xsl:apply-templates mode="table-legend" select="rows/content/table/legend_color"/>
                  <div class="table-container">
                    <table class="IGRP_table default-table" data-control="table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/text">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/text"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/number">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/number"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/email">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/email"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/checkbox">
                            <th class="checkbox sorttable_nosort" align="center">
                              <input type="checkbox" name="p_checkbox_all" class="IGRP_checkall"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/radio">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/radio"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/hiperlink">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/hiperlink"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/estado">
                            <th class="tdcolor">
                              <xsl:value-of select="rows/content/table/label/estado"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <tr row="{position()}" class="">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="text">
                              <td align="" data-row="{position()}" data-title="{../../label/text}" class="text">
                                <xsl:value-of select="text"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="number">
                              <td align="" data-row="{position()}" data-title="{../../label/number}" class="number">
                                <xsl:value-of select="number"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="email">
                              <td align="" data-row="{position()}" data-title="{../../label/email}" class="email">
                                <xsl:value-of select="email"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="checkbox">
                              <td align="" data-row="{position()}" data-title="{../../label/checkbox}" class="checkbox">
                                <xsl:if test="checkbox != '-0'">
                                  <input type="checkbox" name="p_checkbox" value="{checkbox}">
                                    <xsl:if test="checkbox_check=checkbox">
                                      <xsl:attribute name="checked">checked</xsl:attribute>
                                    </xsl:if>
                                  </input>
                                </xsl:if>
                                <xsl:value-of select="checkbox_desc"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="radio">
                              <td align="" data-row="{position()}" data-title="{../../label/radio}" class="radio">
                                <xsl:if test="radio != '-0'">
                                  <input type="radio" name="p_radio" value="{radio}">
                                    <xsl:if test="radio_check=radio">
                                      <xsl:attribute name="checked">checked</xsl:attribute>
                                    </xsl:if>
                                  </input>
                                </xsl:if>
                                <xsl:value-of select="radio_desc"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="hiperlink">
                              <td align="" data-row="{position()}" data-title="{../../label/hiperlink}" class="link">
                                <xsl:choose>
                                  <xsl:when test="hiperlink != ''">
                                    <a href="{hiperlink}" class="link bClick" target="_blank" name="hiperlink">
                                      <xsl:value-of select="hiperlink_desc" disable-output-escaping="yes"/>
                                    </a>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <xsl:value-of select="hiperlink_desc" disable-output-escaping="yes"/>
                                  </xsl:otherwise>
                                </xsl:choose>
                              </td>
                            </xsl:if>
                            <xsl:if test="estado">
                              <td align="" data-row="{position()}" data-title="{../../label/estado}" class="tdcolorcolor_td">
                                <xsl:call-template name="tdcolor">
                                  <xsl:with-param name="color" select="estado"/>
                                </xsl:call-template>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150331"/>
  <xsl:include href="../../xsl/tmpl/IGRP-others.tmpl.xsl?v=20150331"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150331"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150331"/>
</xsl:stylesheet>
