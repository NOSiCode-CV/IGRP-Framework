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
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FORM--><div class="col addMarginTop" sep-name="form"><!-- INICIO SEPARADOR filtro--><xsl:if test="rows/content/form/label/filtro">
                  <div class="box-content resetPadding" sep-name="filtro">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/filtro"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/aplic_filt">
                  <xsl:if test="rows/content/form/label/aplic_filt">
                    <div class="col-1-4 item" item-name="aplic_filt">
                      <div class="igrp_item selectchange">
                        <a id="idp_aplic_filt"/>
                        <label>
                          <xsl:value-of select="rows/content/form/label/aplic_filt" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/aplic_filt/@name}" chosen="select" data-placeholder="{rows/content/form/list/aplic_filt/option[position() = 1]}" class="selectchange IGRP_change">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/aplic_filt"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/aplic_filt/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/pag_filt">
                  <xsl:if test="rows/content/form/label/pag_filt">
                    <div class="col-1-4 item" item-name="pag_filt">
                      <div class="igrp_item select">
                        <label>
                          <xsl:value-of select="rows/content/form/label/pag_filt" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/pag_filt/@name}" chosen="select" data-placeholder="{rows/content/form/list/pag_filt/option[position() = 1]}" class="select">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/pag_filt"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/pag_filt/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/check_filt">
                  <xsl:if test="rows/content/form/label/check_filt">
                    <div class="col-1-4 item" item-name="check_filt">
                      <div class="igrp_item checkbox">
                        <div class="col-1-1">
                          <input type="checkbox" name="{rows/content/form/value/check_filt/@name}" value="1" class="checkbox">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/form/label/check_filt"/>
                            </xsl:call-template>
                            <xsl:if test="rows/content/form/value/check_filt='1'">
                              <xsl:attribute name="checked">checked</xsl:attribute>
                            </xsl:if>
                          </input>
                          <xsl:value-of select="rows/content/form/label/check_filt" disable-output-escaping="yes"/>
                        </div>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if><!-- INICIO SEPARADOR lista_filtro--><xsl:if test="rows/content/form/label/lista_filtro">
                  <div class="box-content resetPadding" list-name="lista_filtro">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/lista_filtro"/>
                    </xsl:call-template>
                    <div class="box-collapser"><!-- START TABELA LIST--><div class="box-table table-responsive">
                        <table rel="T_lista_filtro" data-control="data-lista_filtro">
                          <thead>
                            <tr>
                              <xsl:if test="rows/content/form/table/lista_filtro/label/new_filt">
                                <xsl:if test="not(rows/content/form/table/lista_filtro/label/new_filt/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista_filtro/label/new_filt" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista_filtro/label/ord_filt">
                                <xsl:if test="not(rows/content/form/table/lista_filtro/label/ord_filt/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista_filtro/label/ord_filt" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista_filtro/label/lab_filt">
                                <xsl:if test="not(rows/content/form/table/lista_filtro/label/lab_filt/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista_filtro/label/lab_filt" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista_filtro/label/tag_filt">
                                <xsl:if test="not(rows/content/form/table/lista_filtro/label/tag_filt/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista_filtro/label/tag_filt" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista_filtro/label/tipo_filt">
                                <xsl:if test="not(rows/content/form/table/lista_filtro/label/tipo_filt/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista_filtro/label/tipo_filt" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista_filtro/label/max_filt">
                                <xsl:if test="not(rows/content/form/table/lista_filtro/label/max_filt/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista_filtro/label/max_filt" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista_filtro/label/sel_valor_filt">
                                <xsl:if test="not(rows/content/form/table/lista_filtro/label/sel_valor_filt/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista_filtro/label/sel_valor_filt" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista_filtro/label/sel_op_filt">
                                <xsl:if test="not(rows/content/form/table/lista_filtro/label/sel_op_filt/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista_filtro/label/sel_op_filt" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista_filtro/label/sel_tab_filt">
                                <xsl:if test="not(rows/content/form/table/lista_filtro/label/sel_tab_filt/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista_filtro/label/sel_tab_filt" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista_filtro/label/obrigatorio_filt">
                                <xsl:if test="not(rows/content/form/table/lista_filtro/label/obrigatorio_filt/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista_filtro/label/obrigatorio_filt" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista_filtro/label/atributo_filt">
                                <xsl:if test="not(rows/content/form/table/lista_filtro/label/atributo_filt/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista_filtro/label/atributo_filt" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista_filtro/label/eliminar_filt">
                                <xsl:if test="not(rows/content/form/table/lista_filtro/label/eliminar_filt/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista_filtro/label/eliminar_filt" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                            </tr>
                          </thead>
                          <tbody>
                            <xsl:for-each select="rows/content/form/table/lista_filtro/value/row[not(@total='yes')]">
                              <tr row="{position()}">
                                <xsl:if test="new_filt">
                                  <xsl:if test="not(new_filt/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/new_filt}" class="text">
                                      <xsl:value-of select="new_filt" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_new_filt_fk" value="{new_filt}"/>
                                      <span class="showResponsiveTable ctxmenu"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="new_filt/@visible = 'false'">
                                    <input type="hidden" name="p_new_filt_fk" value="{new_filt}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="ord_filt">
                                  <xsl:if test="not(ord_filt/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/ord_filt}" class="text">
                                      <xsl:value-of select="ord_filt" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_ord_filt_fk" value="{ord_filt}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="ord_filt/@visible = 'false'">
                                    <input type="hidden" name="p_ord_filt_fk" value="{ord_filt}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="lab_filt">
                                  <xsl:if test="not(lab_filt/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/lab_filt}" class="text">
                                      <xsl:value-of select="lab_filt" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_lab_filt_fk" value="{lab_filt}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="lab_filt/@visible = 'false'">
                                    <input type="hidden" name="p_lab_filt_fk" value="{lab_filt}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="tag_filt">
                                  <xsl:if test="not(tag_filt/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/tag_filt}" class="text">
                                      <xsl:value-of select="tag_filt" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_tag_filt_fk" value="{tag_filt}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="tag_filt/@visible = 'false'">
                                    <input type="hidden" name="p_tag_filt_fk" value="{tag_filt}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="tipo_filt">
                                  <xsl:if test="not(tipo_filt/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/tipo_filt}" class="select">
                                      <xsl:value-of select="tipo_filt" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_tipo_filt_fk" value="{tipo_filt}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="tipo_filt/@visible = 'false'">
                                    <input type="hidden" name="p_tipo_filt_fk" value="{tipo_filt}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="max_filt">
                                  <xsl:if test="not(max_filt/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/max_filt}" class="number">
                                      <xsl:value-of select="max_filt" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_max_filt_fk" value="{max_filt}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="max_filt/@visible = 'false'">
                                    <input type="hidden" name="p_max_filt_fk" value="{max_filt}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="sel_valor_filt">
                                  <xsl:if test="not(sel_valor_filt/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/sel_valor_filt}" class="text">
                                      <xsl:value-of select="sel_valor_filt" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_sel_valor_filt_fk" value="{sel_valor_filt}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="sel_valor_filt/@visible = 'false'">
                                    <input type="hidden" name="p_sel_valor_filt_fk" value="{sel_valor_filt}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="sel_op_filt">
                                  <xsl:if test="not(sel_op_filt/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/sel_op_filt}" class="text">
                                      <xsl:value-of select="sel_op_filt" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_sel_op_filt_fk" value="{sel_op_filt}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="sel_op_filt/@visible = 'false'">
                                    <input type="hidden" name="p_sel_op_filt_fk" value="{sel_op_filt}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="sel_tab_filt">
                                  <xsl:if test="not(sel_tab_filt/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/sel_tab_filt}" class="text">
                                      <xsl:value-of select="sel_tab_filt" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_sel_tab_filt_fk" value="{sel_tab_filt}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="sel_tab_filt/@visible = 'false'">
                                    <input type="hidden" name="p_sel_tab_filt_fk" value="{sel_tab_filt}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="obrigatorio_filt">
                                  <xsl:if test="not(obrigatorio_filt/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/obrigatorio_filt}" class="select">
                                      <xsl:value-of select="obrigatorio_filt" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_obrigatorio_filt_fk" value="{obrigatorio_filt}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="obrigatorio_filt/@visible = 'false'">
                                    <input type="hidden" name="p_obrigatorio_filt_fk" value="{obrigatorio_filt}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="atributo_filt">
                                  <xsl:if test="not(atributo_filt/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/atributo_filt}" class="select">
                                      <xsl:value-of select="atributo_filt" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_atributo_filt_fk" value="{atributo_filt}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="atributo_filt/@visible = 'false'">
                                    <input type="hidden" name="p_atributo_filt_fk" value="{atributo_filt}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="eliminar_filt">
                                  <xsl:if test="not(eliminar_filt/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/eliminar_filt}" class="text">
                                      <xsl:value-of select="eliminar_filt" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_eliminar_filt_fk" value="{eliminar_filt}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="eliminar_filt/@visible = 'false'">
                                    <input type="hidden" name="p_eliminar_filt_fk" value="{eliminar_filt}"/>
                                  </xsl:if>
                                </xsl:if>
                                <input type="hidden" name="p_lista_filtro_id" value="{lista_filtro_id}"/>
                              </tr>
                            </xsl:for-each>
                          </tbody>
                        </table>
                      </div><!-- END TABELA LIST--><div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if><!-- INICIO SEPARADOR geracao_lista--><xsl:if test="rows/content/form/label/geracao_lista">
                  <div class="box-content resetPadding" sep-name="geracao_lista">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/geracao_lista"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/aplicacao_list">
                  <xsl:if test="rows/content/form/label/aplicacao_list">
                    <div class="col-1-4 item" item-name="aplicacao_list">
                      <div class="igrp_item selectchange">
                        <a id="idp_aplicacao_list"/>
                        <label>
                          <xsl:value-of select="rows/content/form/label/aplicacao_list" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/aplicacao_list/@name}" chosen="select" data-placeholder="{rows/content/form/list/aplicacao_list/option[position() = 1]}" class="selectchange IGRP_change">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/aplicacao_list"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/aplicacao_list/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/pagina_list">
                  <xsl:if test="rows/content/form/label/pagina_list">
                    <div class="col-1-4 item" item-name="pagina_list">
                      <div class="igrp_item select">
                        <label>
                          <xsl:value-of select="rows/content/form/label/pagina_list" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/pagina_list/@name}" chosen="select" data-placeholder="{rows/content/form/list/pagina_list/option[position() = 1]}" class="select">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/pagina_list"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/pagina_list/option[position() != 1]">
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
                </xsl:if><!-- INICIO SEPARADOR lista_lista--><xsl:if test="rows/content/form/label/lista_lista">
                  <div class="box-content resetPadding" list-name="lista_lista">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/lista_lista"/>
                    </xsl:call-template>
                    <div class="box-collapser"><!-- START TABELA LIST--><div class="box-table table-responsive">
                        <table rel="T_lista_lista" data-control="data-lista_lista">
                          <thead>
                            <tr>
                              <xsl:if test="rows/content/form/table/lista_lista/label/new_list">
                                <xsl:if test="not(rows/content/form/table/lista_lista/label/new_list/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista_lista/label/new_list" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista_lista/label/order_list">
                                <xsl:if test="not(rows/content/form/table/lista_lista/label/order_list/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista_lista/label/order_list" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista_lista/label/label_list">
                                <xsl:if test="not(rows/content/form/table/lista_lista/label/label_list/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista_lista/label/label_list" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista_lista/label/tag_list">
                                <xsl:if test="not(rows/content/form/table/lista_lista/label/tag_list/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista_lista/label/tag_list" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista_lista/label/tipo_list">
                                <xsl:if test="not(rows/content/form/table/lista_lista/label/tipo_list/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista_lista/label/tipo_list" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista_lista/label/max_list">
                                <xsl:if test="not(rows/content/form/table/lista_lista/label/max_list/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista_lista/label/max_list" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista_lista/label/align_list">
                                <xsl:if test="not(rows/content/form/table/lista_lista/label/align_list/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista_lista/label/align_list" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista_lista/label/eliminar_list">
                                <xsl:if test="not(rows/content/form/table/lista_lista/label/eliminar_list/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista_lista/label/eliminar_list" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                            </tr>
                          </thead>
                          <tbody>
                            <xsl:for-each select="rows/content/form/table/lista_lista/value/row[not(@total='yes')]">
                              <tr row="{position()}">
                                <xsl:if test="new_list">
                                  <xsl:if test="not(new_list/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/new_list}" class="text">
                                      <xsl:value-of select="new_list" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_new_list_fk" value="{new_list}"/>
                                      <span class="showResponsiveTable ctxmenu"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="new_list/@visible = 'false'">
                                    <input type="hidden" name="p_new_list_fk" value="{new_list}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="order_list">
                                  <xsl:if test="not(order_list/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/order_list}" class="text">
                                      <xsl:value-of select="order_list" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_order_list_fk" value="{order_list}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="order_list/@visible = 'false'">
                                    <input type="hidden" name="p_order_list_fk" value="{order_list}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="label_list">
                                  <xsl:if test="not(label_list/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/label_list}" class="text">
                                      <xsl:value-of select="label_list" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_label_list_fk" value="{label_list}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="label_list/@visible = 'false'">
                                    <input type="hidden" name="p_label_list_fk" value="{label_list}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="tag_list">
                                  <xsl:if test="not(tag_list/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/tag_list}" class="text">
                                      <xsl:value-of select="tag_list" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_tag_list_fk" value="{tag_list}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="tag_list/@visible = 'false'">
                                    <input type="hidden" name="p_tag_list_fk" value="{tag_list}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="tipo_list">
                                  <xsl:if test="not(tipo_list/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/tipo_list}" class="select">
                                      <xsl:value-of select="tipo_list" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_tipo_list_fk" value="{tipo_list}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="tipo_list/@visible = 'false'">
                                    <input type="hidden" name="p_tipo_list_fk" value="{tipo_list}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="max_list">
                                  <xsl:if test="not(max_list/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/max_list}" class="number">
                                      <xsl:value-of select="max_list" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_max_list_fk" value="{max_list}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="max_list/@visible = 'false'">
                                    <input type="hidden" name="p_max_list_fk" value="{max_list}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="align_list">
                                  <xsl:if test="not(align_list/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/align_list}" class="select">
                                      <xsl:value-of select="align_list" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_align_list_fk" value="{align_list}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="align_list/@visible = 'false'">
                                    <input type="hidden" name="p_align_list_fk" value="{align_list}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="eliminar_list">
                                  <xsl:if test="not(eliminar_list/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/eliminar_list}" class="text">
                                      <xsl:value-of select="eliminar_list" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_eliminar_list_fk" value="{eliminar_list}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="eliminar_list/@visible = 'false'">
                                    <input type="hidden" name="p_eliminar_list_fk" value="{eliminar_list}"/>
                                  </xsl:if>
                                </xsl:if>
                                <input type="hidden" name="p_lista_lista_id" value="{lista_lista_id}"/>
                              </tr>
                            </xsl:for-each>
                          </tbody>
                        </table>
                      </div><!-- END TABELA LIST--><div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if><!-- INICIO SEPARADOR toolbar_operlista--><xsl:if test="rows/content/form/label/toolbar_operlista">
                  <div class="box-content resetPadding" sep-name="toolbar_operlista">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/toolbar_operlista"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/aplicacao_oplist">
                  <xsl:if test="rows/content/form/label/aplicacao_oplist">
                    <div class="col-1-4 item" item-name="aplicacao_oplist">
                      <div class="igrp_item selectchange">
                        <a id="idp_aplicacao_oplist"/>
                        <label>
                          <xsl:value-of select="rows/content/form/label/aplicacao_oplist" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/aplicacao_oplist/@name}" chosen="select" data-placeholder="{rows/content/form/list/aplicacao_oplist/option[position() = 1]}" class="selectchange IGRP_change">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/aplicacao_oplist"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/aplicacao_oplist/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/pagina_oplist">
                  <xsl:if test="rows/content/form/label/pagina_oplist">
                    <div class="col-1-4 item" item-name="pagina_oplist">
                      <div class="igrp_item select">
                        <label>
                          <xsl:value-of select="rows/content/form/label/pagina_oplist" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/pagina_oplist/@name}" chosen="select" data-placeholder="{rows/content/form/list/pagina_oplist/option[position() = 1]}" class="select">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/pagina_oplist"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/pagina_oplist/option[position() != 1]">
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
                </xsl:if><!-- INICIO SEPARADOR toolbar_operlist--><xsl:if test="rows/content/form/label/toolbar_operlist">
                  <div class="box-content resetPadding" list-name="toolbar_operlist">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/toolbar_operlist"/>
                    </xsl:call-template>
                    <div class="box-collapser"><!-- START TABELA LIST--><div class="box-table table-responsive">
                        <table rel="T_toolbar_operlist" data-control="data-toolbar_operlist">
                          <thead>
                            <tr>
                              <xsl:if test="rows/content/form/table/toolbar_operlist/label/new_oplist">
                                <xsl:if test="not(rows/content/form/table/toolbar_operlist/label/new_oplist/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/toolbar_operlist/label/new_oplist" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/toolbar_operlist/label/order_oplist">
                                <xsl:if test="not(rows/content/form/table/toolbar_operlist/label/order_oplist/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/toolbar_operlist/label/order_oplist" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/toolbar_operlist/label/desc_oplist">
                                <xsl:if test="not(rows/content/form/table/toolbar_operlist/label/desc_oplist/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/toolbar_operlist/label/desc_oplist" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/toolbar_operlist/label/accao_oplist">
                                <xsl:if test="not(rows/content/form/table/toolbar_operlist/label/accao_oplist/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/toolbar_operlist/label/accao_oplist" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/toolbar_operlist/label/img_oplist">
                                <xsl:if test="not(rows/content/form/table/toolbar_operlist/label/img_oplist/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/toolbar_operlist/label/img_oplist" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/toolbar_operlist/label/target_oplist">
                                <xsl:if test="not(rows/content/form/table/toolbar_operlist/label/target_oplist/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/toolbar_operlist/label/target_oplist" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/toolbar_operlist/label/trans_oplist">
                                <xsl:if test="not(rows/content/form/table/toolbar_operlist/label/trans_oplist/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/toolbar_operlist/label/trans_oplist" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/toolbar_operlist/label/eliminar_oplist">
                                <xsl:if test="not(rows/content/form/table/toolbar_operlist/label/eliminar_oplist/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/toolbar_operlist/label/eliminar_oplist" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                            </tr>
                          </thead>
                          <tbody>
                            <xsl:for-each select="rows/content/form/table/toolbar_operlist/value/row[not(@total='yes')]">
                              <tr row="{position()}">
                                <xsl:if test="new_oplist">
                                  <xsl:if test="not(new_oplist/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/new_oplist}" class="text">
                                      <xsl:value-of select="new_oplist" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_new_oplist_fk" value="{new_oplist}"/>
                                      <span class="showResponsiveTable ctxmenu"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="new_oplist/@visible = 'false'">
                                    <input type="hidden" name="p_new_oplist_fk" value="{new_oplist}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="order_oplist">
                                  <xsl:if test="not(order_oplist/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/order_oplist}" class="text">
                                      <xsl:value-of select="order_oplist" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_order_oplist_fk" value="{order_oplist}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="order_oplist/@visible = 'false'">
                                    <input type="hidden" name="p_order_oplist_fk" value="{order_oplist}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="desc_oplist">
                                  <xsl:if test="not(desc_oplist/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/desc_oplist}" class="text">
                                      <xsl:value-of select="desc_oplist" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_desc_oplist_fk" value="{desc_oplist}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="desc_oplist/@visible = 'false'">
                                    <input type="hidden" name="p_desc_oplist_fk" value="{desc_oplist}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="accao_oplist">
                                  <xsl:if test="not(accao_oplist/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/accao_oplist}" class="select">
                                      <xsl:value-of select="accao_oplist" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_accao_oplist_fk" value="{accao_oplist}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="accao_oplist/@visible = 'false'">
                                    <input type="hidden" name="p_accao_oplist_fk" value="{accao_oplist}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="img_oplist">
                                  <xsl:if test="not(img_oplist/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/img_oplist}" class="text">
                                      <xsl:value-of select="img_oplist" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_img_oplist_fk" value="{img_oplist}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="img_oplist/@visible = 'false'">
                                    <input type="hidden" name="p_img_oplist_fk" value="{img_oplist}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="target_oplist">
                                  <xsl:if test="not(target_oplist/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/target_oplist}" class="select">
                                      <xsl:value-of select="target_oplist" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_target_oplist_fk" value="{target_oplist}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="target_oplist/@visible = 'false'">
                                    <input type="hidden" name="p_target_oplist_fk" value="{target_oplist}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="trans_oplist">
                                  <xsl:if test="not(trans_oplist/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/trans_oplist}" class="select">
                                      <xsl:value-of select="trans_oplist" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_trans_oplist_fk" value="{trans_oplist}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="trans_oplist/@visible = 'false'">
                                    <input type="hidden" name="p_trans_oplist_fk" value="{trans_oplist}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="eliminar_oplist">
                                  <xsl:if test="not(eliminar_oplist/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/eliminar_oplist}" class="text">
                                      <xsl:value-of select="eliminar_oplist" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_eliminar_oplist_fk" value="{eliminar_oplist}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="eliminar_oplist/@visible = 'false'">
                                    <input type="hidden" name="p_eliminar_oplist_fk" value="{eliminar_oplist}"/>
                                  </xsl:if>
                                </xsl:if>
                                <input type="hidden" name="p_toolbar_operlist_id" value="{toolbar_operlist_id}"/>
                              </tr>
                            </xsl:for-each>
                          </tbody>
                        </table>
                      </div><!-- END TABELA LIST--><div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if><!-- INICIO SEPARADOR list_tool_itlist--><xsl:if test="rows/content/form/label/list_tool_itlist">
                  <div class="box-content resetPadding" sep-name="list_tool_itlist">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/list_tool_itlist"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/aplicacao_itlist">
                  <xsl:if test="rows/content/form/label/aplicacao_itlist">
                    <div class="col-1-4 item" item-name="aplicacao_itlist">
                      <div class="igrp_item selectchange">
                        <a id="idp_aplicacao_itlist"/>
                        <label>
                          <xsl:value-of select="rows/content/form/label/aplicacao_itlist" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/aplicacao_itlist/@name}" chosen="select" data-placeholder="{rows/content/form/list/aplicacao_itlist/option[position() = 1]}" class="selectchange IGRP_change">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/aplicacao_itlist"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/aplicacao_itlist/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/pagina_itlist">
                  <xsl:if test="rows/content/form/label/pagina_itlist">
                    <div class="col-1-4 item" item-name="pagina_itlist">
                      <div class="igrp_item select">
                        <label>
                          <xsl:value-of select="rows/content/form/label/pagina_itlist" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/pagina_itlist/@name}" chosen="select" data-placeholder="{rows/content/form/list/pagina_itlist/option[position() = 1]}" class="select">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/pagina_itlist"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/pagina_itlist/option[position() != 1]">
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
                </xsl:if><!-- INICIO SEPARADOR toolbar_itemlista--><xsl:if test="rows/content/form/label/toolbar_itemlista">
                  <div class="box-content resetPadding" list-name="toolbar_itemlista">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/toolbar_itemlista"/>
                    </xsl:call-template>
                    <div class="box-collapser"><!-- START TABELA LIST--><div class="box-table table-responsive">
                        <table rel="T_toolbar_itemlista" data-control="data-toolbar_itemlista">
                          <thead>
                            <tr>
                              <xsl:if test="rows/content/form/table/toolbar_itemlista/label/new_itlist">
                                <xsl:if test="not(rows/content/form/table/toolbar_itemlista/label/new_itlist/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/toolbar_itemlista/label/new_itlist" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/toolbar_itemlista/label/order_itlist">
                                <xsl:if test="not(rows/content/form/table/toolbar_itemlista/label/order_itlist/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/toolbar_itemlista/label/order_itlist" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/toolbar_itemlista/label/descricao_itlist">
                                <xsl:if test="not(rows/content/form/table/toolbar_itemlista/label/descricao_itlist/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/toolbar_itemlista/label/descricao_itlist" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/toolbar_itemlista/label/accao_itlist">
                                <xsl:if test="not(rows/content/form/table/toolbar_itemlista/label/accao_itlist/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/toolbar_itemlista/label/accao_itlist" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/toolbar_itemlista/label/img_itlist">
                                <xsl:if test="not(rows/content/form/table/toolbar_itemlista/label/img_itlist/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/toolbar_itemlista/label/img_itlist" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/toolbar_itemlista/label/target_itlist">
                                <xsl:if test="not(rows/content/form/table/toolbar_itemlista/label/target_itlist/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/toolbar_itemlista/label/target_itlist" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/toolbar_itemlista/label/trans_itlist">
                                <xsl:if test="not(rows/content/form/table/toolbar_itemlista/label/trans_itlist/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/toolbar_itemlista/label/trans_itlist" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/toolbar_itemlista/label/eliminar_itlist">
                                <xsl:if test="not(rows/content/form/table/toolbar_itemlista/label/eliminar_itlist/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/toolbar_itemlista/label/eliminar_itlist" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                            </tr>
                          </thead>
                          <tbody>
                            <xsl:for-each select="rows/content/form/table/toolbar_itemlista/value/row[not(@total='yes')]">
                              <tr row="{position()}">
                                <xsl:if test="new_itlist">
                                  <xsl:if test="not(new_itlist/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/new_itlist}" class="text">
                                      <xsl:value-of select="new_itlist" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_new_itlist_fk" value="{new_itlist}"/>
                                      <span class="showResponsiveTable ctxmenu"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="new_itlist/@visible = 'false'">
                                    <input type="hidden" name="p_new_itlist_fk" value="{new_itlist}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="order_itlist">
                                  <xsl:if test="not(order_itlist/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/order_itlist}" class="text">
                                      <xsl:value-of select="order_itlist" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_order_itlist_fk" value="{order_itlist}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="order_itlist/@visible = 'false'">
                                    <input type="hidden" name="p_order_itlist_fk" value="{order_itlist}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="descricao_itlist">
                                  <xsl:if test="not(descricao_itlist/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/descricao_itlist}" class="text">
                                      <xsl:value-of select="descricao_itlist" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_descricao_itlist_fk" value="{descricao_itlist}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="descricao_itlist/@visible = 'false'">
                                    <input type="hidden" name="p_descricao_itlist_fk" value="{descricao_itlist}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="accao_itlist">
                                  <xsl:if test="not(accao_itlist/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/accao_itlist}" class="select">
                                      <xsl:value-of select="accao_itlist" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_accao_itlist_fk" value="{accao_itlist}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="accao_itlist/@visible = 'false'">
                                    <input type="hidden" name="p_accao_itlist_fk" value="{accao_itlist}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="img_itlist">
                                  <xsl:if test="not(img_itlist/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/img_itlist}" class="text">
                                      <xsl:value-of select="img_itlist" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_img_itlist_fk" value="{img_itlist}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="img_itlist/@visible = 'false'">
                                    <input type="hidden" name="p_img_itlist_fk" value="{img_itlist}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="target_itlist">
                                  <xsl:if test="not(target_itlist/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/target_itlist}" class="select">
                                      <xsl:value-of select="target_itlist" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_target_itlist_fk" value="{target_itlist}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="target_itlist/@visible = 'false'">
                                    <input type="hidden" name="p_target_itlist_fk" value="{target_itlist}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="trans_itlist">
                                  <xsl:if test="not(trans_itlist/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/trans_itlist}" class="select">
                                      <xsl:value-of select="trans_itlist" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_trans_itlist_fk" value="{trans_itlist}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="trans_itlist/@visible = 'false'">
                                    <input type="hidden" name="p_trans_itlist_fk" value="{trans_itlist}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="eliminar_itlist">
                                  <xsl:if test="not(eliminar_itlist/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/eliminar_itlist}" class="text">
                                      <xsl:value-of select="eliminar_itlist" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_eliminar_itlist_fk" value="{eliminar_itlist}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="eliminar_itlist/@visible = 'false'">
                                    <input type="hidden" name="p_eliminar_itlist_fk" value="{eliminar_itlist}"/>
                                  </xsl:if>
                                </xsl:if>
                                <input type="hidden" name="p_toolbar_itemlista_id" value="{toolbar_itemlista_id}"/>
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
