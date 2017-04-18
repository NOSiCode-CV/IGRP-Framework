<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html><!--XSL Generator (RED/DIM 2015)--><head><!--HOME-HEADER--><xsl:call-template name="home-header"/>
      </head>
      <body class="bodyColor">
        <div class="IGRP_overlay"/><!--HOME TOP--><xsl:call-template name="home-top-main"/><!--HOME--><div id="igrp-bodyPage"><!--HOME LEFT--><xsl:call-template name="home-slide-menu"/><!--HOME RIGTH--><div class="bodyPageRigth"><!-- START YOUR CODE HERE --><!-- SHOW TABLET AND MOBILE TITLE --><div class="box-head showTabMobile">
              <xsl:value-of select="rows/content/title"/>
            </div><!-- SHOW NOTIFICATION MESSAGES--><xsl:apply-templates mode="notif_messages" select="rows/content/messages"/><!-- START VIEW --><xsl:apply-templates mode="IGRP-view" select="rows/content/view"/><!-- END VIEW --><!-- START TAB MENU  --><xsl:apply-templates mode="tab-menu" select="rows/content/menu"/><!-- END TAB MENU  --><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!-- SHOW HIDDEN--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FORM--><!--START TOOLS BAR FROM--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar"/><!--END TOOLS BAR FORM--><div class="col addMarginTop addPaddingBottom10" sep-name="form">
                <xsl:if test="rows/content/form/label/nome">
                  <div class="col-1-4 item" item-name="nome">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/nome) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/nome" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
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
                <xsl:if test="rows/content/form/label/numero">
                  <div class="col-1-4 item" item-name="numero">
                    <div class="igrp_item number">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/numero) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/numero" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/numero" disable-output-escaping="yes"/>
                      </label>
                      <input type="number" name="{rows/content/form/value/numero/@name}" value="{rows/content/form/value/numero}" class="number" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/numero"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/data">
                  <div class="col-1-4 item" item-name="data">
                    <div class="igrp_item date">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/data) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/data" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/data" disable-output-escaping="yes"/>
                      </label>
                      <div class="itemIcon">
                        <input type="text" name="{rows/content/form/value/data/@name}" value="{rows/content/form/value/data}" class="date" trel="IGRP_datePicker">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/data"/>
                          </xsl:call-template>
                        </input>
                        <div class="calendar"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/email">
                  <div class="col-1-4 item" item-name="email">
                    <div class="igrp_item email">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/email) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/email" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/email" disable-output-escaping="yes"/>
                      </label>
                      <input type="email" name="{rows/content/form/value/email/@name}" value="{rows/content/form/value/email}" class="email">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/email"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/combobox">
                  <div class="col-1-4 item" item-name="combobox">
                    <div class="igrp_item select">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/combobox) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/combobox" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/combobox" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/combobox/@name}" chosen="select" id="{rows/content/form/list/combobox/@name}" data-placeholder="{rows/content/form/list/combobox/option[position() = 1]}" class="select">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/combobox"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/combobox/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/checkbox">
                  <div class="col-1-4 item" item-name="checkbox">
                    <div class="igrp_item checkbox">
                      <div class="col-1-1">
                        <input type="checkbox" name="{rows/content/form/value/checkbox/@name}" value="1" class="checkbox">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/checkbox"/>
                          </xsl:call-template>
                          <xsl:if test="rows/content/form/value/checkbox='1'">
                            <xsl:attribute name="checked">checked</xsl:attribute>
                          </xsl:if>
                        </input>
                        <xsl:value-of select="rows/content/form/label/checkbox" disable-output-escaping="yes"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/checkboxlista">
                  <div class="col-1-4 item" item-name="checkboxlista">
                    <div class="igrp_item checkboxlist">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/checkboxlista) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/checkboxlista" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/checkboxlista" disable-output-escaping="yes"/>
                      </label>
                      <xsl:for-each select="rows/content/form/list/checkboxlista/option">
                        <div class="col-1-1">
                          <input type="checkbox" name="{../@name}" value="{value}" class="checkboxlist">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="../../../label/checkboxlista"/>
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
                <xsl:if test="rows/content/form/label/pesquisa">
                  <div class="col-1-4 item" item-name="pesquisa">
                    <div class="igrp_item LOOKUP">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/pesquisa) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/pesquisa" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/pesquisa" disable-output-escaping="yes"/>
                      </label>
                      <div class="itemIcon">
                        <input type="LOOKUP" name="{rows/content/form/value/pesquisa/@name}" value="{rows/content/form/value/pesquisa}" class="LOOKUP">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/pesquisa"/>
                          </xsl:call-template>
                        </input>
                        <xsl:call-template name="lookup-tool">
                          <xsl:with-param name="page" select="rows/page"/>
                          <xsl:with-param name="ad_hoc" select="'1'"/>
                          <xsl:with-param name="action" select="'LOOKUP'"/>
                          <xsl:with-param name="name" select="rows/content/form/value/pesquisa/@name"/>
                          <xsl:with-param name="js_lookup" select="rows/content/form/lookup/pesquisa"/>
                        </xsl:call-template>
                      </div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/pesquisa_bi">
                  <div class="col-1-4 item" item-name="pesquisa_bi">
                    <div class="igrp_item LOOKUP_BI">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/pesquisa_bi) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/pesquisa_bi" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/pesquisa_bi" disable-output-escaping="yes"/>
                      </label>
                      <div class="itemIcon">
                        <input type="LOOKUP_BI" name="{rows/content/form/value/pesquisa_bi/@name}" value="{rows/content/form/value/pesquisa_bi}" class="LOOKUP_BI">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/pesquisa_bi"/>
                          </xsl:call-template>
                        </input>
                        <xsl:call-template name="lookup-tool">
                          <xsl:with-param name="page" select="'LOOKUP'"/>
                          <xsl:with-param name="action" select="'LOOKUP_BI'"/>
                          <xsl:with-param name="name" select="rows/content/form/value/pesquisa_bi/@name"/>
                          <xsl:with-param name="js_lookup" select="rows/content/form/lookup/pesquisa_bi"/>
                        </xsl:call-template>
                      </div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/pesquisa_geog">
                  <div class="col-1-4 item" item-name="pesquisa_geog">
                    <div class="igrp_item LOOKUP_GEOG">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/pesquisa_geog) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/pesquisa_geog" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/pesquisa_geog" disable-output-escaping="yes"/>
                      </label>
                      <div class="itemIcon">
                        <input type="LOOKUP_GEOG" name="{rows/content/form/value/pesquisa_geog/@name}" value="{rows/content/form/value/pesquisa_geog}" class="LOOKUP_GEOG">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/pesquisa_geog"/>
                          </xsl:call-template>
                        </input>
                        <xsl:call-template name="lookup-tool">
                          <xsl:with-param name="page" select="'LOOKUP'"/>
                          <xsl:with-param name="action" select="'LOOKUP_GEOG'"/>
                          <xsl:with-param name="name" select="rows/content/form/value/pesquisa_geog/@name"/>
                          <xsl:with-param name="js_lookup" select="rows/content/form/lookup/pesquisa_geog"/>
                        </xsl:call-template>
                      </div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if><!-- INICIO SEPARADOR separador_lista--><xsl:if test="rows/content/form/label/separador_lista">
                  <div class="box-content resetPadding" sep-name="separador_lista">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/separador_lista"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="col" sep-name="group-separador_lista">
                        <xsl:if test="rows/content/form/label/texto1">
                          <div class="col-1-4 item" item-name="texto1">
                            <div class="igrp_item text">
                              <label>
                                <xsl:if test="string-length(rows/content/form/label/texto1) > 45">
                                  <xsl:attribute name="title">
                                    <xsl:value-of select="rows/content/form/label/texto1" disable-output-escaping="yes"/>
                                  </xsl:attribute>
                                </xsl:if>
                                <xsl:value-of select="rows/content/form/label/texto1" disable-output-escaping="yes"/>
                              </label>
                              <input type="text" name="{rows/content/form/value/texto1/@name}" value="{rows/content/form/value/texto1}" class="text" maxlength="30" rel="F_separador_lista">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/texto1"/>
                                </xsl:call-template>
                              </input>
                              <div class="_clear"/>
                            </div>
                            <div class="_clear"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/combox1">
                          <div class="col-1-4 item" item-name="combox1">
                            <div class="igrp_item select">
                              <label>
                                <xsl:if test="string-length(rows/content/form/label/combox1) > 45">
                                  <xsl:attribute name="title">
                                    <xsl:value-of select="rows/content/form/label/combox1" disable-output-escaping="yes"/>
                                  </xsl:attribute>
                                </xsl:if>
                                <xsl:value-of select="rows/content/form/label/combox1" disable-output-escaping="yes"/>
                              </label>
                              <select name="{rows/content/form/list/combox1/@name}" chosen="select" id="{rows/content/form/list/combox1/@name}" data-placeholder="{rows/content/form/list/combox1/option[position() = 1]}" class="select" rel="F_separador_lista">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/combox1"/>
                                </xsl:call-template>
                                <option value=""/>
                                <xsl:for-each select="rows/content/form/list/combox1/option[position() != 1]">
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
                        <div class="_clear"/>
                      </div>
                      <xsl:call-template name="tools-bar-form-group">
                        <xsl:with-param name="class" select="'IGRP_addRow'"/>
                        <xsl:with-param name="rel" select="'separador_lista'"/>
                      </xsl:call-template>
                      <div class="col" sep-name="list-separador_lista"><!-- START TABELA LIST--><div class="box-table table-responsive">
                          <ul class="contextMenu ctxSepListDialog" id="data-separador_lista" sep-name="btn-separador_lista">
                            <li rel="separador_lista" class="IGRP_editRow operationTable" item-name="edit-separador_lista">
                              <img src="{$path_tmpl}/img/icon/tools-bar/edit.png"/>
                              <span>
                                <xsl:value-of select="$lngPath/separatorlist_dialog/edit" disable-output-escaping="yes"/>
                              </span>
                            </li>
                            <li rel="separador_lista" class="IGRP_delRow operationTable" item-name="del-separador_lista">
                              <img src="{$path_tmpl}/img/icon/tools-bar/delete.png"/>
                              <span>
                                <xsl:value-of select="$lngPath/separatorlist_dialog/delete" disable-output-escaping="yes"/>
                              </span>
                            </li>
                          </ul>
                          <table rel="T_separador_lista" data-control="data-separador_lista">
                            <thead>
                              <tr>
                                <xsl:if test="rows/content/form/table/separador_lista/label/texto1">
                                  <xsl:if test="not(rows/content/form/table/separador_lista/label/texto1/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/separador_lista/label/texto1" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/separador_lista/label/combox1">
                                  <xsl:if test="not(rows/content/form/table/separador_lista/label/combox1/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/separador_lista/label/combox1" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <th class="bEdDel"/>
                              </tr>
                            </thead>
                            <tbody>
                              <xsl:for-each select="rows/content/form/table/separador_lista/value/row[not(@total='yes')]">
                                <tr row="{position()}">
                                  <xsl:if test="texto1">
                                    <xsl:if test="not(texto1/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/texto1}" class="text">
                                        <xsl:value-of select="texto1_desc" disable-output-escaping="yes"/>
                                        <input type="hidden" name="p_texto1_fk" value="{texto1}"/>
                                        <input type="hidden" name="p_texto1_fk_desc" value="{texto1_desc}"/>
                                        <span class="showResponsiveTable ctxmenu"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="texto1/@visible = 'false'">
                                      <input type="hidden" name="p_texto1_fk" value="{texto1}"/>
                                      <input type="hidden" name="p_texto1_fk_desc" value="{texto1_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="combox1">
                                    <xsl:if test="not(combox1/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/combox1}" class="select">
                                        <xsl:value-of select="combox1_desc" disable-output-escaping="yes"/>
                                        <input type="hidden" name="p_combox1_fk" value="{combox1}"/>
                                        <input type="hidden" name="p_combox1_fk_desc" value="{combox1_desc}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="combox1/@visible = 'false'">
                                      <input type="hidden" name="p_combox1_fk" value="{combox1}"/>
                                      <input type="hidden" name="p_combox1_fk_desc" value="{combox1_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <td class="bEdDel" data-row="{position()}" data-title="{$lngPath/separatorlist_dialog/edit}/{$lngPath/separatorlist_dialog/delete}">
                                    <xsl:if test="not(@noupdate)">
                                      <img title="{$lngPath/separatorlist_dialog/edit}" src="{$path_tmpl}/img/icon/tools-bar/edit.png" item-name="edit-separador_lista" rel="separador_lista" class="IGRP_editRow"/>
                                    </xsl:if>
                                    <xsl:if test="not(@nodelete)">
                                      <img title="{$lngPath/separatorlist_dialog/delete}" src="{$path_tmpl}/img/icon/tools-bar/delete.png" item-name="del-separador_lista" rel="separador_lista" class="IGRP_delRow"/>
                                    </xsl:if>
                                  </td>
                                  <input type="hidden" name="p_separador_lista_id" value="{separador_lista_id}"/>
                                </tr>
                              </xsl:for-each>
                            </tbody>
                          </table>
                        </div><!-- END TABELA LIST--></div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <div class="_clear"/>
              </div><!-- START FILTER--><div class="box-content resetPadding">
                <div class="col">
                  <xsl:if test="rows/content/filter/label/nome">
                    <div class="col-1-4 item" item-name="nome">
                      <div class="igrp_item text">
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/nome) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/nome" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/nome" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/filter/value/nome/@name}" value="{rows/content/filter/value/nome}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/nome"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <div class="_clear"/>
                </div><!--START TOOL BAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar"/><!--END TOOL BAR FILTER--></div><!-- END FILTER--><!-- START TABELA--><div class="col addBorderLeftRight borderColor"><!--START TOOL BAR TABLE--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar">
                  <xsl:with-param name="isTable" select="'true'"/>
                  <xsl:with-param name="rel" select="'table'"/>
                </xsl:apply-templates><!--END TOOL BAR TABLE--><div class="box-table table-responsive">
                  <xsl:call-template name="filter-az">
                    <xsl:with-param name="name" select="rows/content/filter/value/fitlrp/@name"/>
                    <xsl:with-param name="value" select="rows/content/filter/value/fitlrp"/>
                    <xsl:with-param name="type" select="'filter_aznum'"/>
                  </xsl:call-template>
                  <div class="table-container"><!--  CONTEXT-MENU  --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu">
                      <xsl:with-param name="contextId" select="'table'"/>
                    </xsl:apply-templates>
                    <table class="IGRP_table default-table" data-control="table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/nome">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/nome"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/morada">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/morada"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/checkall">
                            <th class="checkbox sorttable_nosort" align="center">
                              <input type="checkbox" name="p_checkall_all" class="IGRP_checkall"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <tr row="{position()}" class="IGRP_contextMenu">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="nome">
                              <td align="" data-row="{position()}" data-title="{../../label/nome}" class="text">
                                <xsl:value-of select="nome"/>
                                <xsl:apply-templates mode="cxtmenu-resp" select="//rows/content/table/context-menu">
                                  <xsl:with-param name="ctx" select="context-menu"/>
                                </xsl:apply-templates>
                              </td>
                            </xsl:if>
                            <xsl:if test="morada">
                              <td align="" data-row="{position()}" data-title="{../../label/morada}" class="text">
                                <xsl:value-of select="morada"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="checkall">
                              <td align="" data-row="{position()}" data-title="{../../label/checkall}" class="checkbox">
                                <xsl:if test="checkall != '-0'">
                                  <input type="checkbox" name="p_checkall" value="{checkall}">
                                    <xsl:if test="checkall_check=checkall">
                                      <xsl:attribute name="checked">checked</xsl:attribute>
                                    </xsl:if>
                                  </input>
                                </xsl:if>
                                <xsl:value-of select="checkall_desc"/>
                              </td>
                            </xsl:if>
                          </tr>
                        </xsl:for-each>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div><!-- END TABELA--></form>
            <div class="col">
              <xsl:if test="rows/content/grafico_1"><!-- START CHARTS--><div class="col-1-273" sep-name="grafico_1">
                  <xsl:call-template name="igrp-graph">
                    <xsl:with-param name="table" select="rows/content/grafico_1"/>
                    <xsl:with-param name="chart_type" select="rows/content/grafico_1/chart_type"/>
                    <xsl:with-param name="height" select="150"/>
                    <xsl:with-param name="title" select="rows/content/grafico_1/caption"/>
                  </xsl:call-template>
                </div><!-- END CHARTS--></xsl:if>
              <xsl:if test="rows/content/grafico_2"><!-- START CHARTS--><div class="col-1-273" sep-name="grafico_2">
                  <xsl:call-template name="igrp-graph">
                    <xsl:with-param name="table" select="rows/content/grafico_2"/>
                    <xsl:with-param name="chart_type" select="rows/content/grafico_2/chart_type"/>
                    <xsl:with-param name="height" select="150"/>
                    <xsl:with-param name="title" select="rows/content/grafico_2/caption"/>
                  </xsl:call-template>
                </div><!-- END CHARTS--></xsl:if>
              <div class="_clear"/>
            </div><!-- END YOUR CODE HERE --><div class="_clear"/>
          </div>
          <xsl:call-template name="link-opener"/>
          <div class="_clear"/>
        </div><!--FOOTER PAGE--><div id="igrp-footerPage">
          <xsl:call-template name="footer"/>
        </div>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150709"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150709"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150709"/>
  <xsl:include href="../../xsl/tmpl/IGRP-view.tmpl.xsl?v=20150709"/>
  <xsl:include href="../../xsl/tmpl/IGRP-tab-menu.tmpl.xsl?v=20150709"/>
  <xsl:include href="../../xsl/tmpl/IGRP-graph.tmpl.xsl?v=20150709"/>
  <xsl:include href="../../xsl/tmpl/IGRP-context.tmpl.xsl?v=20150709"/>
</xsl:stylesheet>
