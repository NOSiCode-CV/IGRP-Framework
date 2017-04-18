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
                <xsl:if test="rows/content/form/label/aplicacao_form">
                  <xsl:if test="rows/content/form/label/aplicacao_form">
                    <div class="col-1-4 item" item-name="aplicacao_form">
                      <div class="igrp_item selectchange">
                        <a id="idp_aplicacao_form"/>
                        <label>
                          <xsl:value-of select="rows/content/form/label/aplicacao_form" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/aplicacao_form/@name}" chosen="select" data-placeholder="{rows/content/form/list/aplicacao_form/option[position() = 1]}" class="selectchange IGRP_change">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/aplicacao_form"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/aplicacao_form/option[position() != 1]">
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
                </xsl:if><!-- INICIO SEPARADOR lista_form--><xsl:if test="rows/content/form/label/lista_form">
                  <div class="box-content resetPadding" list-name="lista_form">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/lista_form"/>
                    </xsl:call-template>
                    <div class="box-collapser"><!-- START TABELA LIST--><div class="box-table table-responsive">
                        <table rel="T_lista_form" data-control="data-lista_form">
                          <thead>
                            <tr>
                              <xsl:if test="rows/content/form/table/lista_form/label/new_form">
                                <xsl:if test="not(rows/content/form/table/lista_form/label/new_form/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista_form/label/new_form" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista_form/label/order_form">
                                <xsl:if test="not(rows/content/form/table/lista_form/label/order_form/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista_form/label/order_form" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista_form/label/tag_form">
                                <xsl:if test="not(rows/content/form/table/lista_form/label/tag_form/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista_form/label/tag_form" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista_form/label/label_form">
                                <xsl:if test="not(rows/content/form/table/lista_form/label/label_form/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista_form/label/label_form" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista_form/label/tipo_form">
                                <xsl:if test="not(rows/content/form/table/lista_form/label/tipo_form/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista_form/label/tipo_form" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista_form/label/max__form">
                                <xsl:if test="not(rows/content/form/table/lista_form/label/max__form/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista_form/label/max__form" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista_form/label/select_valor_form">
                                <xsl:if test="not(rows/content/form/table/lista_form/label/select_valor_form/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista_form/label/select_valor_form" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista_form/label/select_opcao_form">
                                <xsl:if test="not(rows/content/form/table/lista_form/label/select_opcao_form/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista_form/label/select_opcao_form" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista_form/label/select_tabela_form">
                                <xsl:if test="not(rows/content/form/table/lista_form/label/select_tabela_form/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista_form/label/select_tabela_form" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista_form/label/obrig_form">
                                <xsl:if test="not(rows/content/form/table/lista_form/label/obrig_form/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista_form/label/obrig_form" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista_form/label/atrib_form">
                                <xsl:if test="not(rows/content/form/table/lista_form/label/atrib_form/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista_form/label/atrib_form" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista_form/label/eliminar_form">
                                <xsl:if test="not(rows/content/form/table/lista_form/label/eliminar_form/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista_form/label/eliminar_form" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                            </tr>
                          </thead>
                          <tbody>
                            <xsl:for-each select="rows/content/form/table/lista_form/value/row[not(@total='yes')]">
                              <tr row="{position()}">
                                <xsl:if test="new_form">
                                  <xsl:if test="not(new_form/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/new_form}" class="text">
                                      <xsl:value-of select="new_form" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_new_form_fk" value="{new_form}"/>
                                      <span class="showResponsiveTable ctxmenu"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="new_form/@visible = 'false'">
                                    <input type="hidden" name="p_new_form_fk" value="{new_form}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="order_form">
                                  <xsl:if test="not(order_form/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/order_form}" class="text">
                                      <xsl:value-of select="order_form" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_order_form_fk" value="{order_form}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="order_form/@visible = 'false'">
                                    <input type="hidden" name="p_order_form_fk" value="{order_form}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="tag_form">
                                  <xsl:if test="not(tag_form/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/tag_form}" class="text">
                                      <xsl:value-of select="tag_form" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_tag_form_fk" value="{tag_form}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="tag_form/@visible = 'false'">
                                    <input type="hidden" name="p_tag_form_fk" value="{tag_form}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="label_form">
                                  <xsl:if test="not(label_form/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/label_form}" class="text">
                                      <xsl:value-of select="label_form" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_label_form_fk" value="{label_form}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="label_form/@visible = 'false'">
                                    <input type="hidden" name="p_label_form_fk" value="{label_form}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="tipo_form">
                                  <xsl:if test="not(tipo_form/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/tipo_form}" class="select">
                                      <xsl:value-of select="tipo_form" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_tipo_form_fk" value="{tipo_form}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="tipo_form/@visible = 'false'">
                                    <input type="hidden" name="p_tipo_form_fk" value="{tipo_form}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="max__form">
                                  <xsl:if test="not(max__form/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/max__form}" class="number">
                                      <xsl:value-of select="max__form" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_max__form_fk" value="{max__form}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="max__form/@visible = 'false'">
                                    <input type="hidden" name="p_max__form_fk" value="{max__form}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="select_valor_form">
                                  <xsl:if test="not(select_valor_form/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/select_valor_form}" class="text">
                                      <xsl:value-of select="select_valor_form" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_select_valor_form_fk" value="{select_valor_form}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="select_valor_form/@visible = 'false'">
                                    <input type="hidden" name="p_select_valor_form_fk" value="{select_valor_form}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="select_opcao_form">
                                  <xsl:if test="not(select_opcao_form/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/select_opcao_form}" class="text">
                                      <xsl:value-of select="select_opcao_form" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_select_opcao_form_fk" value="{select_opcao_form}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="select_opcao_form/@visible = 'false'">
                                    <input type="hidden" name="p_select_opcao_form_fk" value="{select_opcao_form}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="select_tabela_form">
                                  <xsl:if test="not(select_tabela_form/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/select_tabela_form}" class="text">
                                      <xsl:value-of select="select_tabela_form" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_select_tabela_form_fk" value="{select_tabela_form}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="select_tabela_form/@visible = 'false'">
                                    <input type="hidden" name="p_select_tabela_form_fk" value="{select_tabela_form}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="obrig_form">
                                  <xsl:if test="not(obrig_form/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/obrig_form}" class="select">
                                      <xsl:value-of select="obrig_form" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_obrig_form_fk" value="{obrig_form}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="obrig_form/@visible = 'false'">
                                    <input type="hidden" name="p_obrig_form_fk" value="{obrig_form}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="atrib_form">
                                  <xsl:if test="not(atrib_form/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/atrib_form}" class="select">
                                      <xsl:value-of select="atrib_form" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_atrib_form_fk" value="{atrib_form}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="atrib_form/@visible = 'false'">
                                    <input type="hidden" name="p_atrib_form_fk" value="{atrib_form}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="eliminar_form">
                                  <xsl:if test="not(eliminar_form/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/eliminar_form}" class="select">
                                      <xsl:value-of select="eliminar_form" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_eliminar_form_fk" value="{eliminar_form}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="eliminar_form/@visible = 'false'">
                                    <input type="hidden" name="p_eliminar_form_fk" value="{eliminar_form}"/>
                                  </xsl:if>
                                </xsl:if>
                                <input type="hidden" name="p_lista_form_id" value="{lista_form_id}"/>
                              </tr>
                            </xsl:for-each>
                          </tbody>
                        </table>
                      </div><!-- END TABELA LIST--><div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if><!-- INICIO SEPARADOR list_toolbar_tform--><xsl:if test="rows/content/form/label/list_toolbar_tform">
                  <div class="box-content resetPadding" sep-name="list_toolbar_tform">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/list_toolbar_tform"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/aplicacao_tform">
                  <xsl:if test="rows/content/form/label/aplicacao_tform">
                    <div class="col-1-4 item" item-name="aplicacao_tform">
                      <div class="igrp_item selectchange">
                        <a id="idp_aplicacao_tform"/>
                        <label>
                          <xsl:value-of select="rows/content/form/label/aplicacao_tform" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/aplicacao_tform/@name}" chosen="select" data-placeholder="{rows/content/form/list/aplicacao_tform/option[position() = 1]}" class="selectchange IGRP_change">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/aplicacao_tform"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/aplicacao_tform/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/pagina_tform">
                  <xsl:if test="rows/content/form/label/pagina_tform">
                    <div class="col-1-4 item" item-name="pagina_tform">
                      <div class="igrp_item select">
                        <label>
                          <xsl:value-of select="rows/content/form/label/pagina_tform" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/pagina_tform/@name}" chosen="select" data-placeholder="{rows/content/form/list/pagina_tform/option[position() = 1]}" class="select">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/pagina_tform"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/pagina_tform/option[position() != 1]">
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
                </xsl:if><!-- INICIO SEPARADOR toolbar_tform--><xsl:if test="rows/content/form/label/toolbar_tform">
                  <div class="box-content resetPadding" list-name="toolbar_tform">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/toolbar_tform"/>
                    </xsl:call-template>
                    <div class="box-collapser"><!-- START TABELA LIST--><div class="box-table table-responsive">
                        <table rel="T_toolbar_tform" data-control="data-toolbar_tform">
                          <thead>
                            <tr>
                              <xsl:if test="rows/content/form/table/toolbar_tform/label/new_tform">
                                <xsl:if test="not(rows/content/form/table/toolbar_tform/label/new_tform/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/toolbar_tform/label/new_tform" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/toolbar_tform/label/order_tform">
                                <xsl:if test="not(rows/content/form/table/toolbar_tform/label/order_tform/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/toolbar_tform/label/order_tform" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/toolbar_tform/label/desc_tform">
                                <xsl:if test="not(rows/content/form/table/toolbar_tform/label/desc_tform/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/toolbar_tform/label/desc_tform" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/toolbar_tform/label/accao_tform">
                                <xsl:if test="not(rows/content/form/table/toolbar_tform/label/accao_tform/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/toolbar_tform/label/accao_tform" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/toolbar_tform/label/img_tform">
                                <xsl:if test="not(rows/content/form/table/toolbar_tform/label/img_tform/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/toolbar_tform/label/img_tform" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/toolbar_tform/label/target_tform">
                                <xsl:if test="not(rows/content/form/table/toolbar_tform/label/target_tform/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/toolbar_tform/label/target_tform" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/toolbar_tform/label/transaccao">
                                <xsl:if test="not(rows/content/form/table/toolbar_tform/label/transaccao/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/toolbar_tform/label/transaccao" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/toolbar_tform/label/eliminar_tform">
                                <xsl:if test="not(rows/content/form/table/toolbar_tform/label/eliminar_tform/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/toolbar_tform/label/eliminar_tform" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                            </tr>
                          </thead>
                          <tbody>
                            <xsl:for-each select="rows/content/form/table/toolbar_tform/value/row[not(@total='yes')]">
                              <tr row="{position()}">
                                <xsl:if test="new_tform">
                                  <xsl:if test="not(new_tform/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/new_tform}" class="text">
                                      <xsl:value-of select="new_tform" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_new_tform_fk" value="{new_tform}"/>
                                      <span class="showResponsiveTable ctxmenu"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="new_tform/@visible = 'false'">
                                    <input type="hidden" name="p_new_tform_fk" value="{new_tform}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="order_tform">
                                  <xsl:if test="not(order_tform/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/order_tform}" class="text">
                                      <xsl:value-of select="order_tform" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_order_tform_fk" value="{order_tform}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="order_tform/@visible = 'false'">
                                    <input type="hidden" name="p_order_tform_fk" value="{order_tform}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="desc_tform">
                                  <xsl:if test="not(desc_tform/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/desc_tform}" class="text">
                                      <xsl:value-of select="desc_tform" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_desc_tform_fk" value="{desc_tform}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="desc_tform/@visible = 'false'">
                                    <input type="hidden" name="p_desc_tform_fk" value="{desc_tform}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="accao_tform">
                                  <xsl:if test="not(accao_tform/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/accao_tform}" class="select">
                                      <xsl:value-of select="accao_tform" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_accao_tform_fk" value="{accao_tform}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="accao_tform/@visible = 'false'">
                                    <input type="hidden" name="p_accao_tform_fk" value="{accao_tform}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="img_tform">
                                  <xsl:if test="not(img_tform/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/img_tform}" class="text">
                                      <xsl:value-of select="img_tform" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_img_tform_fk" value="{img_tform}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="img_tform/@visible = 'false'">
                                    <input type="hidden" name="p_img_tform_fk" value="{img_tform}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="target_tform">
                                  <xsl:if test="not(target_tform/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/target_tform}" class="select">
                                      <xsl:value-of select="target_tform" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_target_tform_fk" value="{target_tform}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="target_tform/@visible = 'false'">
                                    <input type="hidden" name="p_target_tform_fk" value="{target_tform}"/>
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
                                <xsl:if test="eliminar_tform">
                                  <xsl:if test="not(eliminar_tform/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/eliminar_tform}" class="text">
                                      <xsl:value-of select="eliminar_tform" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_eliminar_tform_fk" value="{eliminar_tform}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="eliminar_tform/@visible = 'false'">
                                    <input type="hidden" name="p_eliminar_tform_fk" value="{eliminar_tform}"/>
                                  </xsl:if>
                                </xsl:if>
                                <input type="hidden" name="p_toolbar_tform_id" value="{toolbar_tform_id}"/>
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
