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
            </div><!-- SHOW NOTIFICATION MESSAGES--><xsl:apply-templates mode="notif_messages" select="rows/content/messages"/><!-- START VIEW --><xsl:apply-templates mode="IGRP-view" select="rows/content/view"/><!-- END VIEW --><form action="#" method="post" id="formular_default" name="formular_default" class="default_filter"><!-- SHOW HIDDEN--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START TABELA--><div class="box-content resetPadding"><!--START TOOL BAR TABLE--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar">
                  <xsl:with-param name="isTable" select="'true'"/>
                  <xsl:with-param name="rel" select="table"/>
                </xsl:apply-templates><!--END TOOL BAR TABLE--><div class="box-table table-responsive">
                  <div class="table-container">
                    <table class="IGRP_table default-table" data-control="table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/data">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/data"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/entidade_adjudicante">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/entidade_adjudicante"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/designacao">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/designacao"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/data_limite_entrega">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/data_limite_entrega"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/anuncio">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/anuncio"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <tr row="{position()}" class="">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="data">
                              <td align="" data-row="{position()}" data-title="{../../label/data}">
                                <xsl:value-of select="data"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="entidade_adjudicante">
                              <td align="" data-row="{position()}" data-title="{../../label/entidade_adjudicante}">
                                <xsl:value-of select="entidade_adjudicante"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="designacao">
                              <td align="" data-row="{position()}" data-title="{../../label/designacao}">
                                <xsl:value-of select="designacao"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="data_limite_entrega">
                              <td align="" data-row="{position()}" data-title="{../../label/data_limite_entrega}">
                                <xsl:value-of select="data_limite_entrega"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="anuncio">
                              <td align="" data-row="{position()}" data-title="{../../label/anuncio}">
                                <xsl:value-of select="anuncio"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150306"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150306"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150306"/>
  <xsl:include href="../../xsl/tmpl/IGRP-view.tmpl.xsl?v=20150306"/>
</xsl:stylesheet>
