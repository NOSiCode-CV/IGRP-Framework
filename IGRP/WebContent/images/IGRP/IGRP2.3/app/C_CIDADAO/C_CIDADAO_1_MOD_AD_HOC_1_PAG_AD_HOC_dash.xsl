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
                <xsl:if test="rows/content/form/label/nome_mae"/>
                <xsl:if test="rows/content/form/label/rv_domain">
                  <xsl:if test="rows/content/form/label/rv_domain">
                    <div class="col-1-4 item" item-name="rv_domain">
                      <div class="igrp_item select">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/rv_domain" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/rv_domain/@name}" chosen="select" data-placeholder="{rows/content/form/list/rv_domain/option[position() = 1]}" class="select required">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/rv_domain"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/rv_domain/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/rv_low_value">
                  <xsl:if test="rows/content/form/label/rv_low_value">
                    <div class="col-1-4 item" item-name="rv_low_value">
                      <div class="igrp_item selectlist">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/rv_low_value" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/rv_low_value/@name}" chosen="select" data-placeholder="{rows/content/form/list/rv_low_value/option[position() = 1]}" multiple="multiple" class="selectlist required">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/rv_low_value"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/rv_low_value/option[position() != 1]">
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
                </xsl:if><!-- INICIO SEPARADOR separador--><xsl:if test="rows/content/form/label/separador">
                  <div class="box-content resetPadding" sep-name="separador">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/separador"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/rv_high_value">
                  <div class="box-content resetPadding" sep-name="rv_high_value">
                    <xsl:call-template name="text-editor">
                      <xsl:with-param name="name" select="{rows/content/form/value/rv_high_value/@name}"/>
                      <xsl:with-param name="value" select="rows/content/form/value/rv_high_value"/>
                      <xsl:with-param name="maxlength" select="rows/content/form/label/rv_high_value/@maxlength"/>
                    </xsl:call-template>
                  </div>
                </xsl:if><!-- INICIO SEPARADOR separador1--><xsl:if test="rows/content/form/label/separador1">
                  <div class="box-content resetPadding" sep-name="separador1">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/separador1"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/rv_pesquisa">
                  <xsl:if test="rows/content/form/label/rv_pesquisa">
                    <div class="col-1-4 item" item-name="rv_pesquisa">
                      <div class="igrp_item LOOKUP_BI">
                        <label>
                          <xsl:value-of select="rows/content/form/label/rv_pesquisa" disable-output-escaping="yes"/>
                        </label>
                        <div class="itemIcon">
                          <input type="LOOKUP_BI" name="{rows/content/form/value/rv_pesquisa/@name}" value="{rows/content/form/value/rv_pesquisa}" class="LOOKUP_BI">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/form/label/rv_pesquisa"/>
                            </xsl:call-template>
                          </input>
                          <xsl:call-template name="lookup-tool">
                            <xsl:with-param name="page" select="'LOOKUP'"/>
                            <xsl:with-param name="action" select="'LOOKUP_BI'"/>
                            <xsl:with-param name="name" select="rows/content/form/value/rv_pesquisa/@name"/>
                            <xsl:with-param name="js_lookup" select="rows/content/form/lookup/rv_pesquisa"/>
                          </xsl:call-template>
                        </div>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/lista_check">
                  <xsl:if test="rows/content/form/label/lista_check">
                    <div class="col-1-4 item" item-name="lista_check">
                      <div class="igrp_item checkboxlist">
                        <label>
                          <xsl:value-of select="rows/content/form/label/lista_check" disable-output-escaping="yes"/>
                        </label>
                        <xsl:for-each select="rows/content/form/list/lista_check/option">
                          <div class="col-1-1">
                            <input type="checkbox" name="{../@name}" value="{value}" class="checkboxlist">
                              <xsl:call-template name="FIELD_validator">
                                <xsl:with-param name="field" select="rows/content/form/label/lista_check"/>
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
                <xsl:if test="rows/content/form/label/lista_radio">
                  <xsl:if test="rows/content/form/label/lista_radio">
                    <div class="col-1-4 item" item-name="lista_radio">
                      <div class="igrp_item radiolist">
                        <label>
                          <xsl:value-of select="rows/content/form/label/lista_radio" disable-output-escaping="yes"/>
                        </label>
                        <xsl:for-each select="rows/content/form/list/lista_radio/option">
                          <div class="col-1-1">
                            <input type="radio" name="{../@name}" value="{value}" class="radiolist">
                              <xsl:call-template name="FIELD_validator">
                                <xsl:with-param name="field" select="../../../label/lista_radio"/>
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
                </xsl:if><!-- INICIO SEPARADOR inicio_separador--><xsl:if test="rows/content/form/label/inicio_separador">
                  <div class="box-content resetPadding" sep-name="inicio_separador">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/inicio_separador"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="col" group-name="inicio_separador">
                        <xsl:if test="rows/content/form/label/nome">
                          <div class="col-1-4 item" item-name="nome">
                            <div class="igrp_item LOOKUP_NASC">
                              <label>
                                <xsl:value-of select="rows/content/form/label/nome" disable-output-escaping="yes"/>
                              </label>
                              <div class="itemIcon">
                                <input type="LOOKUP_NASC" name="{rows/content/form/value/nome/@name}" value="{rows/content/form/value/nome}" class="LOOKUP_NASC" rel="F_inicio_separador">
                                  <xsl:call-template name="FIELD_validator">
                                    <xsl:with-param name="field" select="rows/content/form/label/nome"/>
                                  </xsl:call-template>
                                </input>
                                <xsl:call-template name="lookup-tool">
                                  <xsl:with-param name="page" select="'LOOKUP'"/>
                                  <xsl:with-param name="action" select="'LOOKUP_NASC'"/>
                                  <xsl:with-param name="name" select="rows/content/form/value/nome/@name"/>
                                  <xsl:with-param name="js_lookup" select="rows/content/form/lookup/nome"/>
                                </xsl:call-template>
                              </div>
                              <div class="_clear"/>
                            </div>
                            <div class="_clear"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/idade">
                          <div class="col-1-4 item" item-name="idade">
                            <div class="igrp_item number">
                              <label>
                                <xsl:value-of select="rows/content/form/label/idade" disable-output-escaping="yes"/>
                              </label>
                              <input type="number" name="{rows/content/form/value/idade/@name}" value="{rows/content/form/value/idade}" class="number" maxlength="30" rel="F_inicio_separador">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/idade"/>
                                </xsl:call-template>
                              </input>
                              <div class="_clear"/>
                            </div>
                            <div class="_clear"/>
                          </div>
                        </xsl:if>
                        <div class="_clear"/>
                      </div>
                      <xsl:call-template name="tools-bar-form-group">
                        <xsl:with-param name="class" select="'IGRP_addRow'"/>
                        <xsl:with-param name="rel" select="'inicio_separador'"/>
                      </xsl:call-template>
                      <div class="col" list-name="inicio_separador"><!-- START TABELA LIST--><div class="box-table table-responsive">
                          <ul class="contextMenu ctxSepListDialog" id="data-inicio_separador">
                            <li rel="inicio_separador" class="IGRP_editRow operationTable" name="edit_inicio_separador">
                              <img src="{$path_tmpl}/img/icon/tools-bar/edit.png"/>
                              <span>
                                <xsl:value-of select="$lngPath/separatorlist_dialog/edit" disable-output-escaping="yes"/>
                              </span>
                            </li>
                            <li rel="inicio_separador" class="IGRP_delRow operationTable" name="del_inicio_separador">
                              <img src="{$path_tmpl}/img/icon/tools-bar/delete.png"/>
                              <span>
                                <xsl:value-of select="$lngPath/separatorlist_dialog/delete" disable-output-escaping="yes"/>
                              </span>
                            </li>
                          </ul>
                          <table rel="T_inicio_separador" data-control="data-inicio_separador">
                            <thead>
                              <tr>
                                <xsl:if test="rows/content/form/table/inicio_separador/label/nome">
                                  <xsl:if test="not(rows/content/form/table/inicio_separador/label/nome/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/inicio_separador/label/nome" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/inicio_separador/label/idade">
                                  <xsl:if test="not(rows/content/form/table/inicio_separador/label/idade/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/inicio_separador/label/idade" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <th class="bEdDel"/>
                              </tr>
                            </thead>
                            <tbody>
                              <xsl:for-each select="rows/content/form/table/inicio_separador/value/row[not(@total='yes')]">
                                <tr row="{position()}">
                                  <xsl:if test="nome">
                                    <xsl:if test="not(nome/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/nome}">
                                        <xsl:value-of select="nome_desc" disable-output-escaping="yes"/>
                                        <input type="hidden" name="p_nome_fk" value="{nome}"/>
                                        <input type="hidden" name="p_nome_fk_desc" value="{nome_desc}"/>
                                        <span class="showResponsiveTable ctxmenu"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="nome/@visible = 'false'">
                                      <input type="hidden" name="p_nome_fk" value="{nome}"/>
                                      <input type="hidden" name="p_nome_fk_desc" value="{nome_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="idade">
                                    <xsl:if test="not(idade/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/idade}">
                                        <xsl:value-of select="idade_desc" disable-output-escaping="yes"/>
                                        <input type="hidden" name="p_idade_fk" value="{idade}"/>
                                        <input type="hidden" name="p_idade_fk_desc" value="{idade_desc}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="idade/@visible = 'false'">
                                      <input type="hidden" name="p_idade_fk" value="{idade}"/>
                                      <input type="hidden" name="p_idade_fk_desc" value="{idade_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <td class="bEdDel" data-row="{position()}" data-title="{$lngPath/separatorlist_dialog/edit}/{$lngPath/separatorlist_dialog/delete}">
                                    <xsl:if test="not(@noupdate)">
                                      <img title="{$lngPath/separatorlist_dialog/edit}" src="{$path_tmpl}/img/icon/tools-bar/edit.png" name="edit_inicio_separador" rel="inicio_separador" class="IGRP_editRow"/>
                                    </xsl:if>
                                    <xsl:if test="not(@nodelete)">
                                      <img title="{$lngPath/separatorlist_dialog/delete}" src="{$path_tmpl}/img/icon/tools-bar/delete.png" name="del_inicio_separador" rel="inicio_separador" class="IGRP_delRow"/>
                                    </xsl:if>
                                  </td>
                                  <input type="hidden" name="p_inicio_separador_id" value="{inicio_separador_id}"/>
                                  <input type="hidden" name="p_id_registo_fk" value="{id_registo}"/>
                                  <input type="hidden" name="p_id_registo_fk_desc" value="{id_registo_desc}"/>
                                </tr>
                              </xsl:for-each>
                            </tbody>
                          </table>
                        </div><!-- END TABELA LIST--></div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if><!-- INICIO SEPARADOR fim_sep_lista--><xsl:if test="rows/content/form/label/fim_sep_lista">
                  <div class="box-content resetPadding" sep-name="fim_sep_lista">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/fim_sep_lista"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/separador3">
                  <div class="box-content resetPadding" sep-name="separador3">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/separador3"/>
                    </xsl:call-template>
                    <div class="box-collapser"><!-- START FORM LIST--><xsl:if test="not(rows/content/form/table/separador3/value/row[position() = 1]/@noupdate)">
                        <div class="col showResponsiveTable" name="add_separador3">
                          <div class="addRowFormlist addRow">
                            <a rel="separador3" class="IGRP_addRowForm">
                              <img title="{$lngPath/separatorlist_dialog/add}" src="{$path_tmpl}/img/icon/tools-bar/sepAdd.png"/>
                              <span>
                                <xsl:value-of select="$lngPath/separatorlist_dialog/delete" disable-output-escaping="yes"/>
                              </span>
                            </a>
                          </div>
                        </div>
                      </xsl:if>
                      <div class="box-table table-responsive">
                        <table class="IGRP_formlist" rel="T_separador3" data-control="data-separador3">
                          <thead>
                            <tr>
                              <xsl:if test="rows/content/form/table/separador3/label/preco">
                                <xsl:if test="not(rows/content/form/table/separador3/label/preco/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/separador3/label/preco" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/separador3/label/descricao">
                                <xsl:if test="not(rows/content/form/table/separador3/label/descricao/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/separador3/label/descricao" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/separador3/label/data">
                                <xsl:if test="not(rows/content/form/table/separador3/label/data/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/separador3/label/data" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="not(rows/content/form/table/separador3/value/row[position() = 1]/@noupdate) or not(rows/content/form/table/separador3/value/row[position() = 1]/@nodelete)">
                                <th class="fBtn">
                                  <xsl:if test="not(rows/content/form/table/separador3/value/row[position() = 1]/@noupdate)">
                                    <img title="" src="{$path_tmpl}/img/icon/tools-bar/add.png" name="add_separador3" rel="separador3" class="IGRP_addRowForm"/>
                                  </xsl:if>
                                </th>
                              </xsl:if>
                            </tr>
                          </thead>
                          <tbody>
                            <xsl:for-each select="rows/content/form/table/separador3/value/row[not(@total='yes')]">
                              <tr row="{position()}">
                                <xsl:if test="preco">
                                  <xsl:if test="not(preco/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/preco}">
                                      <input type="hidden" name="p_preco_fk_desc" value="{preco_desc}"/>
                                      <input type="number" name="{../../label/preco/@name}_fk" value="{preco}" class="number" maxlength="30" rel="F_separador3">
                                        <xsl:call-template name="FIELD_validator">
                                          <xsl:with-param name="field" select="../../label/preco"/>
                                        </xsl:call-template>
                                      </input>
                                      <xsl:if test="not(@nodelete)">
                                        <span class="showResponsiveTable respDelRow">
                                          <img title="{$lngPath/separatorlist_dialog/delete}" src="{$path_tmpl}/img/icon/tools-bar/delete.png" name="del_separador3" rel="separador3" class="IGRP_delRow"/>
                                        </span>
                                      </xsl:if>
                                    </td>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="descricao">
                                  <xsl:if test="not(descricao/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/descricao}">
                                      <input type="hidden" name="p_descricao_fk_desc" value="{descricao_desc}"/>
                                      <xsl:value-of select="descricao_desc" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_descricao_fk" value="{descricao}"/>
                                    </td>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="data">
                                  <xsl:if test="not(data/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/data}">
                                      <input type="hidden" name="p_data_fk_desc" value="{data_desc}"/>
                                      <div class="itemIcon">
                                        <input type="text" name="{../../label/data/@name}_fk" value="{data}" class="date" trel="IGRP_datePicker" rel="F_separador3">
                                          <xsl:call-template name="FIELD_validator">
                                            <xsl:with-param name="field" select="../../label/data"/>
                                          </xsl:call-template>
                                        </input>
                                        <div class="calendar"/>
                                      </div>
                                    </td>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="not(@nodelete) or not(@noupdate)">
                                  <td class="fBtn" data-row="{position()}" data-title="{$lngPath/separatorlist_dialog/delete}">
                                    <xsl:if test="not(@nodelete)">
                                      <img title="{$lngPath/separatorlist_dialog/delete}" src="{$path_tmpl}/img/icon/tools-bar/delete.png" name="del_separador3" class="IGRP_delRow" rel="separador3"/>
                                    </xsl:if>
                                  </td>
                                </xsl:if>
                                <input type="hidden" name="p_separador3_id" value="{separador3_id}"/>
                              </tr>
                            </xsl:for-each>
                          </tbody>
                        </table>
                      </div><!-- END FORM LIST--><div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if><!-- INICIO SEPARADOR inico_lista_inser--><xsl:if test="rows/content/form/label/inico_lista_inser">
                  <div class="box-content addPaddingBottom10" list-name="inico_lista_inser">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/inico_lista_inser"/>
                    </xsl:call-template>
                    <div class="box-collapser"><!-- START TABELA LIST--><div class="box-table table-responsive">
                        <table rel="T_inico_lista_inser" data-control="data-inico_lista_inser">
                          <thead>
                            <tr>
                              <xsl:if test="rows/content/form/table/inico_lista_inser/label/coluna_um">
                                <xsl:if test="not(rows/content/form/table/inico_lista_inser/label/coluna_um/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/inico_lista_inser/label/coluna_um" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/inico_lista_inser/label/coluna_2">
                                <xsl:if test="not(rows/content/form/table/inico_lista_inser/label/coluna_2/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/inico_lista_inser/label/coluna_2" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                            </tr>
                          </thead>
                          <tbody>
                            <xsl:for-each select="rows/content/form/table/inico_lista_inser/value/row[not(@total='yes')]">
                              <tr row="{position()}">
                                <xsl:if test="coluna_um">
                                  <xsl:if test="not(coluna_um/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/coluna_um}">
                                      <xsl:value-of select="coluna_um" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_coluna_um_fk" value="{coluna_um}"/>
                                      <span class="showResponsiveTable ctxmenu"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="coluna_um/@visible = 'false'">
                                    <input type="hidden" name="p_coluna_um_fk" value="{coluna_um}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="coluna_2">
                                  <xsl:if test="not(coluna_2/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/coluna_2}">
                                      <xsl:value-of select="coluna_2" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_coluna_2_fk" value="{coluna_2}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="coluna_2/@visible = 'false'">
                                    <input type="hidden" name="p_coluna_2_fk" value="{coluna_2}"/>
                                  </xsl:if>
                                </xsl:if>
                                <input type="hidden" name="p_inico_lista_inser_id" value="{inico_lista_inser_id}"/>
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
              </div><!-- START FILTER--><div class="box-content resetPadding">
                <div class="col">
                  <xsl:if test="rows/content/filter/label/rv_domain">
                    <div class="col-1-4 item" item-name="rv_domain">
                      <div class="igrp_item text">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/filter/label/rv_domain" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/filter/value/rv_domain/@name}" value="{rows/content/filter/value/rv_domain}" class="text required" maxlength="100">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/rv_domain"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/filter/label/rv_low_value">
                    <div class="col-1-4 item" item-name="rv_low_value">
                      <div class="igrp_item text">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/filter/label/rv_low_value" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/filter/value/rv_low_value/@name}" value="{rows/content/filter/value/rv_low_value}" class="text required" maxlength="240">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/rv_low_value"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/filter/label/rv_high_value">
                    <div class="col-1-4 item" item-name="rv_high_value">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/filter/label/rv_high_value" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/filter/value/rv_high_value/@name}" value="{rows/content/filter/value/rv_high_value}" class="text" maxlength="240">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/rv_high_value"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/filter/label/rv_abbreviation">
                    <div class="col-1-4 item" item-name="rv_abbreviation">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/filter/label/rv_abbreviation" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/filter/value/rv_abbreviation/@name}" value="{rows/content/filter/value/rv_abbreviation}" class="text" maxlength="240">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/rv_abbreviation"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/filter/label/rv_meaning">
                    <div class="col-1-4 item" item-name="rv_meaning">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/filter/label/rv_meaning" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/filter/value/rv_meaning/@name}" value="{rows/content/filter/value/rv_meaning}" class="text" maxlength="240">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/rv_meaning"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <div class="_clear"/>
                </div><!--START TOOL BAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar"/><!--END TOOL BAR FILTER--></div><!-- END FILTER--><!-- START TABELA--><div class="box-content resetPadding"><!--START TOOL BAR TABLE--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar">
                  <xsl:with-param name="isTable" select="'true'"/>
                  <xsl:with-param name="rel" select="table"/>
                </xsl:apply-templates><!--END TOOL BAR TABLE--><div class="box-table table-responsive">
                  <div class="table-container"><!--  CONTEXT-MENU  --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu">
                      <xsl:with-param name="contextId" select="'table'"/>
                    </xsl:apply-templates>
                    <table class="IGRP_table default-table" data-control="table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/rv_domain">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/rv_domain"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/rv_low_value">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/rv_low_value"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/rv_high_value">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/rv_high_value"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/rv_abbreviation">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/rv_abbreviation"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/rv_meaning">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/rv_meaning"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <tr row="{position()}" class="IGRP_contextMenu">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="rv_domain">
                              <td align="left" data-row="{position()}" data-title="{../../label/rv_domain}">
                                <xsl:value-of select="rv_domain"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="rv_low_value">
                              <td align="left" data-row="{position()}" data-title="{../../label/rv_low_value}">
                                <xsl:value-of select="rv_low_value"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="rv_high_value">
                              <td align="left" data-row="{position()}" data-title="{../../label/rv_high_value}">
                                <xsl:value-of select="rv_high_value"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="rv_abbreviation">
                              <td align="left" data-row="{position()}" data-title="{../../label/rv_abbreviation}">
                                <xsl:value-of select="rv_abbreviation"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="rv_meaning">
                              <td align="left" data-row="{position()}" data-title="{../../label/rv_meaning}">
                                <xsl:value-of select="rv_meaning"/>
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
          <xsl:call-template name="link-opener"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-form-text-editor.tmpl.xsl?v=20150306"/>
  <xsl:include href="../../xsl/tmpl/IGRP-context.tmpl.xsl?v=20150306"/>
</xsl:stylesheet>
