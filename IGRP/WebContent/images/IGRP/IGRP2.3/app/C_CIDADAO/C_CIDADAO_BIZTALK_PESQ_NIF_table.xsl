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
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FILTER--><div class="box-content resetPadding">
                <div class="col">
                  <xsl:if test="rows/content/form/label/nifnome">
                    <div class="col-1-4 item" item-name="nifnome">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/nifnome" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/nifnome/@name}" value="{rows/content/form/value/nifnome}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/nifnome"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <div class="_clear"/>
                </div><!--START TOOL BAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/form/tools-bar"/><!--END TOOL BAR FILTER--></div><!-- END FILTER--><!-- START TABELA--><div class="box-content resetPadding">
                <div class="box-table table-responsive">
                  <div class="table-container">
                    <table class="IGRP_table default-table" data-control="table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/nif">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/nif"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/nome">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/nome"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/tipo">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/tipo"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/area_fiscal">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/area_fiscal"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/morada">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/morada"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/atividade">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/atividade"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <tr row="{position()}" class="">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="nif">
                              <td align="" data-row="{position()}" data-title="{../../label/nif}">
                                <xsl:value-of select="nif"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="nome">
                              <td align="" data-row="{position()}" data-title="{../../label/nome}">
                                <xsl:value-of select="nome"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="tipo">
                              <td align="" data-row="{position()}" data-title="{../../label/tipo}">
                                <xsl:value-of select="tipo"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="area_fiscal">
                              <td align="" data-row="{position()}" data-title="{../../label/area_fiscal}">
                                <xsl:value-of select="area_fiscal"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="morada">
                              <td align="" data-row="{position()}" data-title="{../../label/morada}">
                                <xsl:value-of select="morada"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="atividade">
                              <td align="" data-row="{position()}" data-title="{../../label/atividade}">
                                <xsl:value-of select="atividade"/>
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
</xsl:stylesheet>
