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
                <xsl:if test="rows/content/form/label/bi">
                  <xsl:if test="rows/content/form/label/bi">
                    <div class="col-1-4 item" item-name="bi">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/bi" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/bi/@name}" value="{rows/content/form/value/bi}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/bi"/>
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
                          <xsl:value-of select="rows/content/form/label/nome" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/nome/@name}" value="{rows/content/form/value/nome}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/nome"/>
                          </xsl:call-template>
                        </input>
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
                </xsl:if><!-- INICIO SEPARADOR lista_resp--><xsl:if test="rows/content/form/label/lista_resp">
                  <div class="box-content addPaddingBottom10" list-name="lista_resp">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/lista_resp"/>
                    </xsl:call-template>
                    <div class="box-collapser"><!-- START TABELA LIST--><div class="box-table table-responsive">
                        <table rel="T_lista_resp" data-control="data-lista_resp">
                          <thead>
                            <tr>
                              <xsl:if test="rows/content/form/table/lista_resp/label/bi_resp">
                                <xsl:if test="not(rows/content/form/table/lista_resp/label/bi_resp/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista_resp/label/bi_resp" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista_resp/label/nome_resp">
                                <xsl:if test="not(rows/content/form/table/lista_resp/label/nome_resp/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista_resp/label/nome_resp" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista_resp/label/morada_resp">
                                <xsl:if test="not(rows/content/form/table/lista_resp/label/morada_resp/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista_resp/label/morada_resp" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                            </tr>
                          </thead>
                          <tbody>
                            <xsl:for-each select="rows/content/form/table/lista_resp/value/row[not(@total='yes')]">
                              <tr row="{position()}">
                                <xsl:if test="bi_resp">
                                  <xsl:if test="not(bi_resp/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/bi_resp}">
                                      <xsl:value-of select="bi_resp" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_bi_resp_fk" value="{bi_resp}"/>
                                      <span class="showResponsiveTable ctxmenu"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="bi_resp/@visible = 'false'">
                                    <input type="hidden" name="p_bi_resp_fk" value="{bi_resp}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="nome_resp">
                                  <xsl:if test="not(nome_resp/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/nome_resp}">
                                      <xsl:value-of select="nome_resp" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_nome_resp_fk" value="{nome_resp}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="nome_resp/@visible = 'false'">
                                    <input type="hidden" name="p_nome_resp_fk" value="{nome_resp}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="morada_resp">
                                  <xsl:if test="not(morada_resp/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/morada_resp}">
                                      <xsl:value-of select="morada_resp" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_morada_resp_fk" value="{morada_resp}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="morada_resp/@visible = 'false'">
                                    <input type="hidden" name="p_morada_resp_fk" value="{morada_resp}"/>
                                  </xsl:if>
                                </xsl:if>
                                <input type="hidden" name="p_lista_resp_id" value="{lista_resp_id}"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150306"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150306"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150306"/>
</xsl:stylesheet>
