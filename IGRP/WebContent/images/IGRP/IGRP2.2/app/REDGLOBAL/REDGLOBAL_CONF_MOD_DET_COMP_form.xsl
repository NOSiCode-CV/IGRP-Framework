<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html><!--XSL Generator (RED/DIM 2015)--><head><!--HOME-HEADER--><xsl:call-template name="home-header"/>
      </head>
      <body class="bodyColor">
        <div class="IGRP_overlay"/><!--HOME TOP--><xsl:call-template name="home-top-main"/><!--HOME--><div id="igrp-bodyPage"><!--HOME LEFT--><xsl:call-template name="home-slide-menu"/><!--HOME RIGTH--><div class="bodyPageRigth"><!-- START YOUR CODE HERE --><!-- SHOW TABLET AND MOBILE TITLE --><div class="box-head showTabMobile">
              <xsl:value-of select="rows/content/title"/>
            </div><!-- SHOW NOTIFICATION MESSAGES--><xsl:apply-templates mode="notif_messages" select="rows/content/messages"/>
            <form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!-- SHOW HIDDEN--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FORM--><!--START TOOLS BAR FROM--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar"/><!--END TOOLS BAR FORM--><div class="col addMarginTop addPaddingBottom10" sep-name="form">
                <xsl:if test="rows/content/form/label/schema">
                  <div class="col-1-4 item" item-name="schema">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/schema) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/schema" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/schema" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/schema/@name}" value="{rows/content/form/value/schema}" class="text" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/schema"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/componentes">
                  <div class="col-1-4 item" item-name="componentes">
                    <div class="igrp_item selectchange">
                      <a id="idp_componentes"/>
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/componentes) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/componentes" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/componentes" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/componentes/@name}" chosen="select" id="{rows/content/form/list/componentes/@name}" data-placeholder="{rows/content/form/list/componentes/option[position() = 1]}" class="selectchange IGRP_change">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/componentes"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/componentes/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/codigo">
                  <div class="col-1-4 item" item-name="codigo">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/codigo) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/codigo" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/codigo" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/codigo/@name}" value="{rows/content/form/value/codigo}" class="text" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/codigo"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/descricao">
                  <div class="col-1-4 item" item-name="descricao">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/descricao) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/descricao" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/descricao" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/descricao/@name}" value="{rows/content/form/value/descricao}" class="text" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/descricao"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/tabel_view_name">
                  <div class="col-1-4 item" item-name="tabel_view_name">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/tabel_view_name) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/tabel_view_name" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/tabel_view_name" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/tabel_view_name/@name}" value="{rows/content/form/value/tabel_view_name}" class="text" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/tabel_view_name"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/nome_package_comp">
                  <div class="col-1-4 item" item-name="nome_package_comp">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/nome_package_comp) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/nome_package_comp" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/nome_package_comp" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/nome_package_comp/@name}" value="{rows/content/form/value/nome_package_comp}" class="text" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/nome_package_comp"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/aplicacao">
                  <div class="col-1-4 item" item-name="aplicacao">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/aplicacao) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/aplicacao" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/aplicacao" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/aplicacao/@name}" value="{rows/content/form/value/aplicacao}" class="text" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/aplicacao"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/pagina_comp">
                  <div class="col-1-4 item" item-name="pagina_comp">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/pagina_comp) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/pagina_comp" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/pagina_comp" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/pagina_comp/@name}" value="{rows/content/form/value/pagina_comp}" class="text" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/pagina_comp"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if><!-- INICIO SEPARADOR lista--><xsl:if test="rows/content/form/label/lista">
                  <div class="box-content resetPadding" sep-name="lista">
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
                              <xsl:if test="rows/content/form/table/lista/label/label">
                                <xsl:if test="not(rows/content/form/table/lista/label/label/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista/label/label" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista/label/tag">
                                <xsl:if test="not(rows/content/form/table/lista/label/tag/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista/label/tag" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista/label/tipo">
                                <xsl:if test="not(rows/content/form/table/lista/label/tipo/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista/label/tipo" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista/label/max_length">
                                <xsl:if test="not(rows/content/form/table/lista/label/max_length/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista/label/max_length" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista/label/select_valor">
                                <xsl:if test="not(rows/content/form/table/lista/label/select_valor/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista/label/select_valor" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista/label/select_opcao">
                                <xsl:if test="not(rows/content/form/table/lista/label/select_opcao/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista/label/select_opcao" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista/label/select_tabela">
                                <xsl:if test="not(rows/content/form/table/lista/label/select_tabela/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista/label/select_tabela" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista/label/obrigatorio">
                                <xsl:if test="not(rows/content/form/table/lista/label/obrigatorio/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista/label/obrigatorio" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista/label/atributo">
                                <xsl:if test="not(rows/content/form/table/lista/label/atributo/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista/label/atributo" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista/label/eliminar">
                                <xsl:if test="not(rows/content/form/table/lista/label/eliminar/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista/label/eliminar" disable-output-escaping="yes"/>
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
                                <xsl:if test="label">
                                  <xsl:if test="not(label/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/label}" class="text">
                                      <xsl:value-of select="label" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_label_fk" value="{label}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="label/@visible = 'false'">
                                    <input type="hidden" name="p_label_fk" value="{label}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="tag">
                                  <xsl:if test="not(tag/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/tag}" class="text">
                                      <xsl:value-of select="tag" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_tag_fk" value="{tag}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="tag/@visible = 'false'">
                                    <input type="hidden" name="p_tag_fk" value="{tag}"/>
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
                                <xsl:if test="max_length">
                                  <xsl:if test="not(max_length/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/max_length}" class="number">
                                      <xsl:value-of select="max_length" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_max_length_fk" value="{max_length}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="max_length/@visible = 'false'">
                                    <input type="hidden" name="p_max_length_fk" value="{max_length}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="select_valor">
                                  <xsl:if test="not(select_valor/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/select_valor}" class="text">
                                      <xsl:value-of select="select_valor" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_select_valor_fk" value="{select_valor}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="select_valor/@visible = 'false'">
                                    <input type="hidden" name="p_select_valor_fk" value="{select_valor}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="select_opcao">
                                  <xsl:if test="not(select_opcao/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/select_opcao}" class="text">
                                      <xsl:value-of select="select_opcao" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_select_opcao_fk" value="{select_opcao}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="select_opcao/@visible = 'false'">
                                    <input type="hidden" name="p_select_opcao_fk" value="{select_opcao}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="select_tabela">
                                  <xsl:if test="not(select_tabela/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/select_tabela}" class="text">
                                      <xsl:value-of select="select_tabela" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_select_tabela_fk" value="{select_tabela}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="select_tabela/@visible = 'false'">
                                    <input type="hidden" name="p_select_tabela_fk" value="{select_tabela}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="obrigatorio">
                                  <xsl:if test="not(obrigatorio/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/obrigatorio}" class="select">
                                      <xsl:value-of select="obrigatorio" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_obrigatorio_fk" value="{obrigatorio}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="obrigatorio/@visible = 'false'">
                                    <input type="hidden" name="p_obrigatorio_fk" value="{obrigatorio}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="atributo">
                                  <xsl:if test="not(atributo/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/atributo}" class="select">
                                      <xsl:value-of select="atributo" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_atributo_fk" value="{atributo}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="atributo/@visible = 'false'">
                                    <input type="hidden" name="p_atributo_fk" value="{atributo}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="eliminar">
                                  <xsl:if test="not(eliminar/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/eliminar}" class="text">
                                      <xsl:value-of select="eliminar" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_eliminar_fk" value="{eliminar}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="eliminar/@visible = 'false'">
                                    <input type="hidden" name="p_eliminar_fk" value="{eliminar}"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150826"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150826"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150826"/>
</xsl:stylesheet>
