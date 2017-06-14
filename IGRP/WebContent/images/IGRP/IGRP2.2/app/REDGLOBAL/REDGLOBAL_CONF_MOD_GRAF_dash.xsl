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
                <xsl:if test="rows/content/form/label/aplicacao_graf">
                  <xsl:if test="rows/content/form/label/aplicacao_graf">
                    <div class="col-1-4 item" item-name="aplicacao_graf">
                      <div class="igrp_item selectchange">
                        <a id="idp_aplicacao_graf"/>
                        <label>
                          <xsl:value-of select="rows/content/form/label/aplicacao_graf" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/aplicacao_graf/@name}" chosen="select" data-placeholder="{rows/content/form/list/aplicacao_graf/option[position() = 1]}" class="selectchange IGRP_change">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/aplicacao_graf"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/aplicacao_graf/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/pagina_graf">
                  <xsl:if test="rows/content/form/label/pagina_graf">
                    <div class="col-1-4 item" item-name="pagina_graf">
                      <div class="igrp_item select">
                        <label>
                          <xsl:value-of select="rows/content/form/label/pagina_graf" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/pagina_graf/@name}" chosen="select" data-placeholder="{rows/content/form/list/pagina_graf/option[position() = 1]}" class="select">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/pagina_graf"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/pagina_graf/option[position() != 1]">
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
                </xsl:if><!-- INICIO SEPARADOR lista_grafico--><xsl:if test="rows/content/form/label/lista_grafico">
                  <div class="box-content resetPadding" list-name="lista_grafico">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/lista_grafico"/>
                    </xsl:call-template>
                    <div class="box-collapser"><!-- START TABELA LIST--><div class="box-table table-responsive">
                        <table rel="T_lista_grafico" data-control="data-lista_grafico">
                          <thead>
                            <tr>
                              <xsl:if test="rows/content/form/table/lista_grafico/label/new_graf">
                                <xsl:if test="not(rows/content/form/table/lista_grafico/label/new_graf/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista_grafico/label/new_graf" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista_grafico/label/order_graf">
                                <xsl:if test="not(rows/content/form/table/lista_grafico/label/order_graf/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista_grafico/label/order_graf" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista_grafico/label/desc_graf">
                                <xsl:if test="not(rows/content/form/table/lista_grafico/label/desc_graf/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista_grafico/label/desc_graf" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista_grafico/label/accao_graf">
                                <xsl:if test="not(rows/content/form/table/lista_grafico/label/accao_graf/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista_grafico/label/accao_graf" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista_grafico/label/img_graf">
                                <xsl:if test="not(rows/content/form/table/lista_grafico/label/img_graf/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista_grafico/label/img_graf" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista_grafico/label/target_graf">
                                <xsl:if test="not(rows/content/form/table/lista_grafico/label/target_graf/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista_grafico/label/target_graf" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista_grafico/label/tipo">
                                <xsl:if test="not(rows/content/form/table/lista_grafico/label/tipo/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista_grafico/label/tipo" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista_grafico/label/width">
                                <xsl:if test="not(rows/content/form/table/lista_grafico/label/width/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista_grafico/label/width" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista_grafico/label/height">
                                <xsl:if test="not(rows/content/form/table/lista_grafico/label/height/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista_grafico/label/height" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista_grafico/label/area">
                                <xsl:if test="not(rows/content/form/table/lista_grafico/label/area/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista_grafico/label/area" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista_grafico/label/eliminar_graf">
                                <xsl:if test="not(rows/content/form/table/lista_grafico/label/eliminar_graf/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista_grafico/label/eliminar_graf" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                            </tr>
                          </thead>
                          <tbody>
                            <xsl:for-each select="rows/content/form/table/lista_grafico/value/row[not(@total='yes')]">
                              <tr row="{position()}">
                                <xsl:if test="new_graf">
                                  <xsl:if test="not(new_graf/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/new_graf}" class="text">
                                      <xsl:value-of select="new_graf" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_new_graf_fk" value="{new_graf}"/>
                                      <span class="showResponsiveTable ctxmenu"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="new_graf/@visible = 'false'">
                                    <input type="hidden" name="p_new_graf_fk" value="{new_graf}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="order_graf">
                                  <xsl:if test="not(order_graf/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/order_graf}" class="text">
                                      <xsl:value-of select="order_graf" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_order_graf_fk" value="{order_graf}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="order_graf/@visible = 'false'">
                                    <input type="hidden" name="p_order_graf_fk" value="{order_graf}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="desc_graf">
                                  <xsl:if test="not(desc_graf/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/desc_graf}" class="text">
                                      <xsl:value-of select="desc_graf" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_desc_graf_fk" value="{desc_graf}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="desc_graf/@visible = 'false'">
                                    <input type="hidden" name="p_desc_graf_fk" value="{desc_graf}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="accao_graf">
                                  <xsl:if test="not(accao_graf/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/accao_graf}" class="select">
                                      <xsl:value-of select="accao_graf" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_accao_graf_fk" value="{accao_graf}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="accao_graf/@visible = 'false'">
                                    <input type="hidden" name="p_accao_graf_fk" value="{accao_graf}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="img_graf">
                                  <xsl:if test="not(img_graf/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/img_graf}" class="text">
                                      <xsl:value-of select="img_graf" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_img_graf_fk" value="{img_graf}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="img_graf/@visible = 'false'">
                                    <input type="hidden" name="p_img_graf_fk" value="{img_graf}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="target_graf">
                                  <xsl:if test="not(target_graf/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/target_graf}" class="select">
                                      <xsl:value-of select="target_graf" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_target_graf_fk" value="{target_graf}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="target_graf/@visible = 'false'">
                                    <input type="hidden" name="p_target_graf_fk" value="{target_graf}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="tipo">
                                  <xsl:if test="not(tipo/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/tipo}" class="select">
                                      <xsl:value-of select="tipo" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_tipo_fk" value="{tipo}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="tipo/@visible = 'false'">
                                    <input type="hidden" name="p_tipo_fk" value="{tipo}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="width">
                                  <xsl:if test="not(width/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/width}" class="number">
                                      <xsl:value-of select="width" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_width_fk" value="{width}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="width/@visible = 'false'">
                                    <input type="hidden" name="p_width_fk" value="{width}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="height">
                                  <xsl:if test="not(height/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/height}" class="number">
                                      <xsl:value-of select="height" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_height_fk" value="{height}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="height/@visible = 'false'">
                                    <input type="hidden" name="p_height_fk" value="{height}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="area">
                                  <xsl:if test="not(area/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/area}" class="select">
                                      <xsl:value-of select="area" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_area_fk" value="{area}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="area/@visible = 'false'">
                                    <input type="hidden" name="p_area_fk" value="{area}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="eliminar_graf">
                                  <xsl:if test="not(eliminar_graf/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/eliminar_graf}" class="text">
                                      <xsl:value-of select="eliminar_graf" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_eliminar_graf_fk" value="{eliminar_graf}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="eliminar_graf/@visible = 'false'">
                                    <input type="hidden" name="p_eliminar_graf_fk" value="{eliminar_graf}"/>
                                  </xsl:if>
                                </xsl:if>
                                <input type="hidden" name="p_lista_grafico_id" value="{lista_grafico_id}"/>
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
