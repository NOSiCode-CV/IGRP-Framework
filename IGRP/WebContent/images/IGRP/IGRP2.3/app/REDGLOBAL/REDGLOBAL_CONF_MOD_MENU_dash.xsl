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
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FORM--><div class="col addMarginTop" sep-name="form">
                <xsl:if test="rows/content/form/label/tipo">
                  <xsl:if test="rows/content/form/label/tipo">
                    <div class="col-1-4 item" item-name="tipo">
                      <div class="igrp_item radiolist">
                        <label>
                          <xsl:value-of select="rows/content/form/label/tipo" disable-output-escaping="yes"/>
                        </label>
                        <xsl:for-each select="rows/content/form/list/tipo/option">
                          <div class="col-1-1">
                            <input type="radio" name="{../@name}" value="{value}" class="radiolist">
                              <xsl:call-template name="FIELD_validator">
                                <xsl:with-param name="field" select="../../../label/tipo"/>
                              </xsl:call-template>
                              <xsl:if test="@selected='true'">
                                <xsl:attribute name="checked">checked</xsl:attribute>
                              </xsl:if>
                            </input>
                            <xsl:value-of select="text" disable-output-escaping="yes"/>
                          </div>
                        </xsl:for-each>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/align">
                  <xsl:if test="rows/content/form/label/align">
                    <div class="col-1-4 item" item-name="align">
                      <div class="igrp_item select">
                        <label>
                          <xsl:value-of select="rows/content/form/label/align" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/align/@name}" chosen="select" data-placeholder="{rows/content/form/list/align/option[position() = 1]}" class="select">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/align"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/align/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/aplicacao">
                  <xsl:if test="rows/content/form/label/aplicacao">
                    <div class="col-1-4 item" item-name="aplicacao">
                      <div class="igrp_item selectchange">
                        <a id="idp_aplicacao"/>
                        <label>
                          <xsl:value-of select="rows/content/form/label/aplicacao" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/aplicacao/@name}" chosen="select" data-placeholder="{rows/content/form/list/aplicacao/option[position() = 1]}" class="selectchange IGRP_change">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/aplicacao"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/aplicacao/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/pagina">
                  <xsl:if test="rows/content/form/label/pagina">
                    <div class="col-1-4 item" item-name="pagina">
                      <div class="igrp_item select">
                        <label>
                          <xsl:value-of select="rows/content/form/label/pagina" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/pagina/@name}" chosen="select" data-placeholder="{rows/content/form/list/pagina/option[position() = 1]}" class="select">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/pagina"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/pagina/option[position() != 1]">
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
                </xsl:if><!-- INICIO SEPARADOR lista--><xsl:if test="rows/content/form/label/lista">
                  <div class="box-content resetPadding" list-name="lista">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/lista"/>
                    </xsl:call-template>
                    <div class="box-collapser"><!-- START TABELA LIST--><div class="box-table table-responsive">
                        <table rel="T_lista" data-control="data-lista">
                          <thead>
                            <tr>
                              <xsl:if test="rows/content/form/table/lista/label/new">
                                <xsl:if test="not(rows/content/form/table/lista/label/new/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista/label/new" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista/label/order">
                                <xsl:if test="not(rows/content/form/table/lista/label/order/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista/label/order" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista/label/descricao">
                                <xsl:if test="not(rows/content/form/table/lista/label/descricao/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista/label/descricao" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista/label/accao">
                                <xsl:if test="not(rows/content/form/table/lista/label/accao/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista/label/accao" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista/label/imagem">
                                <xsl:if test="not(rows/content/form/table/lista/label/imagem/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista/label/imagem" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista/label/target">
                                <xsl:if test="not(rows/content/form/table/lista/label/target/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista/label/target" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista/label/transaccao">
                                <xsl:if test="not(rows/content/form/table/lista/label/transaccao/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista/label/transaccao" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista/label/accoes">
                                <xsl:if test="not(rows/content/form/table/lista/label/accoes/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista/label/accoes" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                            </tr>
                          </thead>
                          <tbody>
                            <xsl:for-each select="rows/content/form/table/lista/value/row[not(@total='yes')]">
                              <tr row="{position()}">
                                <xsl:if test="new">
                                  <xsl:if test="not(new/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/new}" class="text">
                                      <xsl:value-of select="new" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_new_fk" value="{new}"/>
                                      <span class="showResponsiveTable ctxmenu"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="new/@visible = 'false'">
                                    <input type="hidden" name="p_new_fk" value="{new}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="order">
                                  <xsl:if test="not(order/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/order}" class="text">
                                      <xsl:value-of select="order" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_order_fk" value="{order}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="order/@visible = 'false'">
                                    <input type="hidden" name="p_order_fk" value="{order}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="descricao">
                                  <xsl:if test="not(descricao/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/descricao}" class="text">
                                      <xsl:value-of select="descricao" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_descricao_fk" value="{descricao}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="descricao/@visible = 'false'">
                                    <input type="hidden" name="p_descricao_fk" value="{descricao}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="accao">
                                  <xsl:if test="not(accao/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/accao}" class="select">
                                      <xsl:value-of select="accao" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_accao_fk" value="{accao}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="accao/@visible = 'false'">
                                    <input type="hidden" name="p_accao_fk" value="{accao}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="imagem">
                                  <xsl:if test="not(imagem/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/imagem}" class="text">
                                      <xsl:value-of select="imagem" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_imagem_fk" value="{imagem}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="imagem/@visible = 'false'">
                                    <input type="hidden" name="p_imagem_fk" value="{imagem}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="target">
                                  <xsl:if test="not(target/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/target}" class="select">
                                      <xsl:value-of select="target" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_target_fk" value="{target}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="target/@visible = 'false'">
                                    <input type="hidden" name="p_target_fk" value="{target}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="transaccao">
                                  <xsl:if test="not(transaccao/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/transaccao}" class="select">
                                      <xsl:value-of select="transaccao" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_transaccao_fk" value="{transaccao}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="transaccao/@visible = 'false'">
                                    <input type="hidden" name="p_transaccao_fk" value="{transaccao}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="accoes">
                                  <xsl:if test="not(accoes/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/accoes}" class="text">
                                      <xsl:value-of select="accoes" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_accoes_fk" value="{accoes}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="accoes/@visible = 'false'">
                                    <input type="hidden" name="p_accoes_fk" value="{accoes}"/>
                                  </xsl:if>
                                </xsl:if>
                                <input type="hidden" name="p_lista_id" value="{lista_id}"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150309"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150309"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150309"/>
</xsl:stylesheet>
