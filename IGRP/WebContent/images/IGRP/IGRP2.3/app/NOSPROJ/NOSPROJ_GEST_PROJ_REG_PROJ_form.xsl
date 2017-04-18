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
                <xsl:if test="rows/content/form/label/codigo">
                  <div class="col-1-4 item" item-name="codigo">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/codigo) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/codigo" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/codigo" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/codigo/@name}" value="{rows/content/form/value/codigo}" class="text required" maxlength="20">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/codigo"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/sigla">
                  <div class="col-1-4 item" item-name="sigla">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/sigla) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/sigla" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/sigla" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/sigla/@name}" value="{rows/content/form/value/sigla}" class="text" maxlength="6">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/sigla"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/nome">
                  <div class="col-1-4 item" item-name="nome">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/nome) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/nome" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/nome" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/nome/@name}" value="{rows/content/form/value/nome}" class="text required" maxlength="200">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/nome"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/cliente">
                  <div class="col-1-4 item" item-name="cliente">
                    <div class="igrp_item LOOKUP">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/cliente) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/cliente" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/cliente" disable-output-escaping="yes"/>
                      </label>
                      <div class="itemIcon">
                        <input type="LOOKUP" name="{rows/content/form/value/cliente/@name}" value="{rows/content/form/value/cliente}" class="LOOKUP required">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/cliente"/>
                          </xsl:call-template>
                        </input>
                        <xsl:call-template name="lookup-tool">
                          <xsl:with-param name="page" select="rows/page"/>
                          <xsl:with-param name="ad_hoc" select="'1'"/>
                          <xsl:with-param name="action" select="'LOOKUP'"/>
                          <xsl:with-param name="name" select="rows/content/form/value/cliente/@name"/>
                          <xsl:with-param name="js_lookup" select="rows/content/form/lookup/cliente"/>
                        </xsl:call-template>
                      </div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/id_area_neg">
                  <div class="col-1-4 item" item-name="id_area_neg">
                    <div class="igrp_item select">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/id_area_neg) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/id_area_neg" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/id_area_neg" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/id_area_neg/@name}" chosen="select" id="{rows/content/form/list/id_area_neg/@name}" data-placeholder="{rows/content/form/list/id_area_neg/option[position() = 1]}" class="select required">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/id_area_neg"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/id_area_neg/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/gestor_proj">
                  <div class="col-1-4 item" item-name="gestor_proj">
                    <div class="igrp_item LOOKUP">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/gestor_proj) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/gestor_proj" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/gestor_proj" disable-output-escaping="yes"/>
                      </label>
                      <div class="itemIcon">
                        <input type="LOOKUP" name="{rows/content/form/value/gestor_proj/@name}" value="{rows/content/form/value/gestor_proj}" class="LOOKUP">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/gestor_proj"/>
                          </xsl:call-template>
                        </input>
                        <xsl:call-template name="lookup-tool">
                          <xsl:with-param name="page" select="rows/page"/>
                          <xsl:with-param name="ad_hoc" select="'1'"/>
                          <xsl:with-param name="action" select="'LOOKUP'"/>
                          <xsl:with-param name="name" select="rows/content/form/value/gestor_proj/@name"/>
                          <xsl:with-param name="js_lookup" select="rows/content/form/lookup/gestor_proj"/>
                        </xsl:call-template>
                      </div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/dt_inicio_prev">
                  <div class="col-1-4 item" item-name="dt_inicio_prev">
                    <div class="igrp_item date">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/dt_inicio_prev) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/dt_inicio_prev" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/dt_inicio_prev" disable-output-escaping="yes"/>
                      </label>
                      <div class="itemIcon">
                        <input type="text" name="{rows/content/form/value/dt_inicio_prev/@name}" value="{rows/content/form/value/dt_inicio_prev}" class="date required" trel="IGRP_datePicker">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/dt_inicio_prev"/>
                          </xsl:call-template>
                        </input>
                        <div class="calendar"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/dt_fim_prev">
                  <div class="col-1-4 item" item-name="dt_fim_prev">
                    <div class="igrp_item date">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/dt_fim_prev) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/dt_fim_prev" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/dt_fim_prev" disable-output-escaping="yes"/>
                      </label>
                      <div class="itemIcon">
                        <input type="text" name="{rows/content/form/value/dt_fim_prev/@name}" value="{rows/content/form/value/dt_fim_prev}" class="date required" trel="IGRP_datePicker">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/dt_fim_prev"/>
                          </xsl:call-template>
                        </input>
                        <div class="calendar"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/dt_inicio_real">
                  <div class="col-1-4 item" item-name="dt_inicio_real">
                    <div class="igrp_item date">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/dt_inicio_real) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/dt_inicio_real" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/dt_inicio_real" disable-output-escaping="yes"/>
                      </label>
                      <div class="itemIcon">
                        <input type="text" name="{rows/content/form/value/dt_inicio_real/@name}" value="{rows/content/form/value/dt_inicio_real}" class="date" trel="IGRP_datePicker">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/dt_inicio_real"/>
                          </xsl:call-template>
                        </input>
                        <div class="calendar"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/dt_fim_real">
                  <div class="col-1-4 item" item-name="dt_fim_real">
                    <div class="igrp_item date">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/dt_fim_real) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/dt_fim_real" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/dt_fim_real" disable-output-escaping="yes"/>
                      </label>
                      <div class="itemIcon">
                        <input type="text" name="{rows/content/form/value/dt_fim_real/@name}" value="{rows/content/form/value/dt_fim_real}" class="date" trel="IGRP_datePicker">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/dt_fim_real"/>
                          </xsl:call-template>
                        </input>
                        <div class="calendar"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/duracao">
                  <div class="col-1-4 item" item-name="duracao">
                    <div class="igrp_item number">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/duracao) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/duracao" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/duracao" disable-output-escaping="yes"/>
                      </label>
                      <input type="number" name="{rows/content/form/value/duracao/@name}" value="{rows/content/form/value/duracao}" class="number" maxlength="22">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/duracao"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/estado">
                  <div class="col-1-4 item" item-name="estado">
                    <div class="igrp_item select">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/estado) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/estado" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/estado" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/estado/@name}" chosen="select" id="{rows/content/form/list/estado/@name}" data-placeholder="{rows/content/form/list/estado/option[position() = 1]}" class="select required">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/estado"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/estado/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/percentagem">
                  <div class="col-1-4 item" item-name="percentagem">
                    <div class="igrp_item number">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/percentagem) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/percentagem" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/percentagem" disable-output-escaping="yes"/>
                      </label>
                      <input type="number" name="{rows/content/form/value/percentagem/@name}" value="{rows/content/form/value/percentagem}" class="number" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/percentagem"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/descricao">
                  <div class="col-1-4 item" item-name="descricao">
                    <div class="igrp_item textarea">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/descricao) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/descricao" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/descricao" disable-output-escaping="yes"/>
                      </label>
                      <textarea name="{rows/content/form/value/descricao/@name}" class="textarea" maxlength="4000">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/descricao"/>
                        </xsl:call-template>
                        <xsl:value-of select="rows/content/form/value/descricao" disable-output-escaping="yes"/>
                      </textarea>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if><!-- INICIO SEPARADOR aplicacoes--><xsl:if test="rows/content/form/label/aplicacoes">
                  <div class="box-content resetPadding" sep-name="aplicacoes">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/aplicacoes"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="col" sep-name="group-aplicacoes">
                        <xsl:if test="rows/content/form/label/red_id_aplic">
                          <div class="col-1-4 item" item-name="red_id_aplic">
                            <div class="igrp_item select">
                              <label>
                                <xsl:if test="string-length(rows/content/form/label/red_id_aplic) > 45">
                                  <xsl:attribute name="title">
                                    <xsl:value-of select="rows/content/form/label/red_id_aplic" disable-output-escaping="yes"/>
                                  </xsl:attribute>
                                </xsl:if>
                                <xsl:value-of select="rows/content/form/label/red_id_aplic" disable-output-escaping="yes"/>
                              </label>
                              <select name="{rows/content/form/list/red_id_aplic/@name}" chosen="select" id="{rows/content/form/list/red_id_aplic/@name}" data-placeholder="{rows/content/form/list/red_id_aplic/option[position() = 1]}" class="select" rel="F_aplicacoes">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/red_id_aplic"/>
                                </xsl:call-template>
                                <option value=""/>
                                <xsl:for-each select="rows/content/form/list/red_id_aplic/option[position() != 1]">
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
                        <xsl:with-param name="rel" select="'aplicacoes'"/>
                      </xsl:call-template>
                      <div class="col" sep-name="list-aplicacoes"><!-- START TABELA LIST--><div class="box-table table-responsive">
                          <ul class="contextMenu ctxSepListDialog" id="data-aplicacoes" sep-name="btn-aplicacoes">
                            <li rel="aplicacoes" class="IGRP_editRow operationTable" item-name="edit-aplicacoes">
                              <img src="{$path_tmpl}/img/icon/tools-bar/edit.png"/>
                              <span>
                                <xsl:value-of select="$lngPath/separatorlist_dialog/edit" disable-output-escaping="yes"/>
                              </span>
                            </li>
                            <li rel="aplicacoes" class="IGRP_delRow operationTable" item-name="del-aplicacoes">
                              <img src="{$path_tmpl}/img/icon/tools-bar/delete.png"/>
                              <span>
                                <xsl:value-of select="$lngPath/separatorlist_dialog/delete" disable-output-escaping="yes"/>
                              </span>
                            </li>
                          </ul>
                          <table rel="T_aplicacoes" data-control="data-aplicacoes">
                            <thead>
                              <tr>
                                <xsl:if test="rows/content/form/table/aplicacoes/label/red_id_aplic">
                                  <xsl:if test="not(rows/content/form/table/aplicacoes/label/red_id_aplic/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/aplicacoes/label/red_id_aplic" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <th class="bEdDel"/>
                              </tr>
                            </thead>
                            <tbody>
                              <xsl:for-each select="rows/content/form/table/aplicacoes/value/row[not(@total='yes')]">
                                <tr row="{position()}">
                                  <xsl:if test="red_id_aplic">
                                    <xsl:if test="not(red_id_aplic/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/red_id_aplic}" class="select">
                                        <xsl:value-of select="red_id_aplic_desc" disable-output-escaping="yes"/>
                                        <input type="hidden" name="p_red_id_aplic_fk" value="{red_id_aplic}"/>
                                        <input type="hidden" name="p_red_id_aplic_fk_desc" value="{red_id_aplic_desc}"/>
                                        <span class="showResponsiveTable ctxmenu"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="red_id_aplic/@visible = 'false'">
                                      <input type="hidden" name="p_red_id_aplic_fk" value="{red_id_aplic}"/>
                                      <input type="hidden" name="p_red_id_aplic_fk_desc" value="{red_id_aplic_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <td class="bEdDel" data-row="{position()}" data-title="{$lngPath/separatorlist_dialog/edit}/{$lngPath/separatorlist_dialog/delete}">
                                    <xsl:if test="not(@noupdate)">
                                      <img title="{$lngPath/separatorlist_dialog/edit}" src="{$path_tmpl}/img/icon/tools-bar/edit.png" item-name="edit-aplicacoes" rel="aplicacoes" class="IGRP_editRow"/>
                                    </xsl:if>
                                    <xsl:if test="not(@nodelete)">
                                      <img title="{$lngPath/separatorlist_dialog/delete}" src="{$path_tmpl}/img/icon/tools-bar/delete.png" item-name="del-aplicacoes" rel="aplicacoes" class="IGRP_delRow"/>
                                    </xsl:if>
                                  </td>
                                  <input type="hidden" name="p_aplicacoes_id" value="{aplicacoes_id}"/>
                                  <input type="hidden" name="p_codigoh_fk" value="{codigoh}"/>
                                  <input type="hidden" name="p_codigoh_fk_desc" value="{codigoh_desc}"/>
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
              </div>
            </form><!-- END YOUR CODE HERE --><div class="_clear"/>
          </div>
          <xsl:call-template name="link-opener"/>
          <div class="_clear"/>
        </div><!--FOOTER PAGE--><div id="igrp-footerPage">
          <xsl:call-template name="footer"/>
        </div>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150825"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150825"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150825"/>
</xsl:stylesheet>
