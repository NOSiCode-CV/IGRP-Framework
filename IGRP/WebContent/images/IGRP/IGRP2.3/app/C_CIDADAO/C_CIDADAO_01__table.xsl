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
                  <xsl:if test="rows/content/form/label/nr_lote">
                    <div class="col-1-4 item" item-name="nr_lote">
                      <div class="igrp_item number">
                        <label>
                          <xsl:value-of select="rows/content/form/label/nr_lote" disable-output-escaping="yes"/>
                        </label>
                        <input type="number" name="{rows/content/form/value/nr_lote/@name}" value="{rows/content/form/value/nr_lote}" class="number" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/nr_lote"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <div class="_clear"/>
                </div><!--START TOOL BAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/form/tools-bar"/><!--END TOOL BAR FILTER--></div><!-- END FILTER--><!-- START TABELA--><div class="box-content resetPadding"><!--START TOOL BAR TABLE--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar">
                  <xsl:with-param name="isTable" select="'true'"/>
                  <xsl:with-param name="rel" select="table"/>
                </xsl:apply-templates><!--END TOOL BAR TABLE--><div class="box-table table-responsive">
                  <div class="table-container">
                    <table class="IGRP_table default-table" data-control="table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/num_referencia">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/num_referencia"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/titulo_livro">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/titulo_livro"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/autor_livro">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/autor_livro"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/data_publicacao">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/data_publicacao"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/status">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/status"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/validacao_livro">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/validacao_livro"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/lote_livro">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/lote_livro"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <tr row="{position()}" class="">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="num_referencia">
                              <td align="" data-row="{position()}" data-title="{../../label/num_referencia}">
                                <xsl:value-of select="num_referencia"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="titulo_livro">
                              <td align="" data-row="{position()}" data-title="{../../label/titulo_livro}">
                                <xsl:value-of select="titulo_livro"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="autor_livro">
                              <td align="" data-row="{position()}" data-title="{../../label/autor_livro}">
                                <xsl:value-of select="autor_livro"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="data_publicacao">
                              <td align="" data-row="{position()}" data-title="{../../label/data_publicacao}">
                                <xsl:value-of select="data_publicacao"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="status">
                              <td align="" data-row="{position()}" data-title="{../../label/status}">
                                <xsl:value-of select="status"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="validacao_livro">
                              <td align="" data-row="{position()}" data-title="{../../label/validacao_livro}">
                                <xsl:value-of select="validacao_livro"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="lote_livro">
                              <td align="" data-row="{position()}" data-title="{../../label/lote_livro}">
                                <u class="IGRP_lookup" title="Passa Valor">
                                  <xsl:value-of select="lote_livro" disable-output-escaping="yes"/>
                                </u>
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
