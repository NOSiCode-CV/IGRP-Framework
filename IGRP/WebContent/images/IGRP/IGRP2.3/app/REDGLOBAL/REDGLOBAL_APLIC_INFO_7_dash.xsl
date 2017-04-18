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
                <xsl:if test="rows/content/form/label/id_info"/>
                <xsl:if test="rows/content/form/label/id_help"/>
                <xsl:if test="rows/content/form/label/env_fk">
                  <xsl:if test="rows/content/form/label/env_fk">
                    <div class="col-1-4 item" item-name="env_fk">
                      <div class="igrp_item selectchange">
                        <a id="idp_env_fk"/>
                        <label>
                          <xsl:value-of select="rows/content/form/label/env_fk" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/env_fk/@name}" chosen="select" data-placeholder="{rows/content/form/list/env_fk/option[position() = 1]}" class="selectchange IGRP_change">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/env_fk"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/env_fk/option[position() != 1]">
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
                </xsl:if><!-- INICIO SEPARADOR info_aplicacao--><xsl:if test="rows/content/form/label/info_aplicacao">
                  <div class="box-content resetPadding" sep-name="info_aplicacao">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/info_aplicacao"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/descricao_info">
                  <xsl:if test="rows/content/form/label/descricao_info">
                    <div class="col-1-4 item" item-name="descricao_info">
                      <div class="igrp_item textarea">
                        <label>
                          <xsl:value-of select="rows/content/form/label/descricao_info" disable-output-escaping="yes"/>
                        </label>
                        <textarea name="{rows/content/form/value/descricao_info/@name}" class="textarea" maxlength="4000">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/descricao_info"/>
                          </xsl:call-template>
                          <xsl:value-of select="rows/content/form/value/descricao_info" disable-output-escaping="yes"/>
                        </textarea>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/area_negocio">
                  <xsl:if test="rows/content/form/label/area_negocio">
                    <div class="col-1-4 item" item-name="area_negocio">
                      <div class="igrp_item select">
                        <label>
                          <xsl:value-of select="rows/content/form/label/area_negocio" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/area_negocio/@name}" chosen="select" data-placeholder="{rows/content/form/list/area_negocio/option[position() = 1]}" class="select">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/area_negocio"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/area_negocio/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/descricao_geral">
                  <div class="box-content resetPadding" sep-name="descricao_geral">
                    <xsl:call-template name="text-editor">
                      <xsl:with-param name="name" select="{rows/content/form/value/descricao_geral/@name}"/>
                      <xsl:with-param name="value" select="rows/content/form/value/descricao_geral"/>
                      <xsl:with-param name="maxlength" select="rows/content/form/label/descricao_geral/@maxlength"/>
                    </xsl:call-template>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/objectivos">
                  <div class="box-content resetPadding" sep-name="objectivos">
                    <xsl:call-template name="text-editor">
                      <xsl:with-param name="name" select="{rows/content/form/value/objectivos/@name}"/>
                      <xsl:with-param name="value" select="rows/content/form/value/objectivos"/>
                      <xsl:with-param name="maxlength" select="rows/content/form/label/objectivos/@maxlength"/>
                    </xsl:call-template>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/upload_video">
                  <xsl:if test="rows/content/form/label/upload_video">
                    <div class="col-1-4 item" item-name="upload_video">
                      <div class="igrp_item file">
                        <label>
                          <xsl:value-of select="rows/content/form/label/upload_video" disable-output-escaping="yes"/>
                        </label>
                        <div class="itemIcon">
                          <input class="notForm" placeholder="Choose File" disabled="disabled" file="id_{rows/content/form/value/upload_video/@name}"/>
                          <span class="upload">File</span>
                          <input type="file" name="{rows/content/form/value/upload_video/@name}" value="{rows/content/form/value/upload_video}" class="file uploadFile">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/form/label/upload_video"/>
                            </xsl:call-template>
                          </input>
                        </div>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if><!-- INICIO SEPARADOR settings--><xsl:if test="rows/content/form/label/settings">
                  <div class="box-content resetPadding" sep-name="settings">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/settings"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/descricao_settings">
                  <xsl:if test="rows/content/form/label/descricao_settings">
                    <div class="col-1-4 item" item-name="descricao_settings">
                      <div class="igrp_item textarea">
                        <label>
                          <xsl:value-of select="rows/content/form/label/descricao_settings" disable-output-escaping="yes"/>
                        </label>
                        <textarea name="{rows/content/form/value/descricao_settings/@name}" class="textarea" maxlength="200">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/descricao_settings"/>
                          </xsl:call-template>
                          <xsl:value-of select="rows/content/form/value/descricao_settings" disable-output-escaping="yes"/>
                        </textarea>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if><!-- INICIO SEPARADOR documentos_aplicacao--><xsl:if test="rows/content/form/label/documentos_aplicacao">
                  <div class="box-content resetPadding" sep-name="documentos_aplicacao">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/documentos_aplicacao"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="col" group-name="documentos_aplicacao">
                        <xsl:if test="rows/content/form/label/tipo">
                          <div class="col-1-4 item" item-name="tipo">
                            <div class="igrp_item select">
                              <label>
                                <xsl:value-of select="rows/content/form/label/tipo" disable-output-escaping="yes"/>
                              </label>
                              <select name="{rows/content/form/list/tipo/@name}" chosen="select" data-placeholder="{rows/content/form/list/tipo/option[position() = 1]}" class="select" rel="F_documentos_aplicacao">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/tipo"/>
                                </xsl:call-template>
                                <option value=""/>
                                <xsl:for-each select="rows/content/form/list/tipo/option[position() != 1]">
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
                        <xsl:if test="rows/content/form/label/nome">
                          <div class="col-1-4 item" item-name="nome">
                            <div class="igrp_item text">
                              <label>
                                <xsl:value-of select="rows/content/form/label/nome" disable-output-escaping="yes"/>
                              </label>
                              <input type="text" name="{rows/content/form/value/nome/@name}" value="{rows/content/form/value/nome}" class="text" maxlength="15" rel="F_documentos_aplicacao">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/nome"/>
                                </xsl:call-template>
                              </input>
                              <div class="_clear"/>
                            </div>
                            <div class="_clear"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/descricao_documento">
                          <div class="col-1-4 item" item-name="descricao_documento">
                            <div class="igrp_item text">
                              <label>
                                <xsl:value-of select="rows/content/form/label/descricao_documento" disable-output-escaping="yes"/>
                              </label>
                              <input type="text" name="{rows/content/form/value/descricao_documento/@name}" value="{rows/content/form/value/descricao_documento}" class="text" maxlength="1000" rel="F_documentos_aplicacao">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/descricao_documento"/>
                                </xsl:call-template>
                              </input>
                              <div class="_clear"/>
                            </div>
                            <div class="_clear"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/upload">
                          <div class="col-1-4 item" item-name="upload">
                            <div class="igrp_item file">
                              <label>
                                <xsl:value-of select="rows/content/form/label/upload" disable-output-escaping="yes"/>
                              </label>
                              <div class="itemIcon">
                                <input class="notForm" placeholder="Choose File" disabled="disabled" file="id_{rows/content/form/value/upload/@name}"/>
                                <span class="upload">File</span>
                                <input type="file" name="{rows/content/form/value/upload/@name}" value="{rows/content/form/value/upload}" class="file uploadFile" rel="F_documentos_aplicacao">
                                  <xsl:call-template name="FIELD_validator">
                                    <xsl:with-param name="field" select="rows/content/form/label/upload"/>
                                  </xsl:call-template>
                                </input>
                              </div>
                              <div class="_clear"/>
                            </div>
                            <div class="_clear"/>
                          </div>
                        </xsl:if>
                        <div class="_clear"/>
                      </div>
                      <xsl:call-template name="tools-bar-form-group">
                        <xsl:with-param name="class" select="'IGRP_addRow'"/>
                        <xsl:with-param name="rel" select="'documentos_aplicacao'"/>
                      </xsl:call-template>
                      <div class="col" list-name="documentos_aplicacao"><!-- START TABELA LIST--><div class="box-table table-responsive">
                          <ul class="contextMenu ctxSepListDialog" id="data-documentos_aplicacao">
                            <li rel="documentos_aplicacao" class="IGRP_editRow operationTable" name="edit_documentos_aplicacao">
                              <img src="{$path_tmpl}/img/icon/tools-bar/edit.png"/>
                              <span>
                                <xsl:value-of select="$lngPath/separatorlist_dialog/edit" disable-output-escaping="yes"/>
                              </span>
                            </li>
                            <li rel="documentos_aplicacao" class="IGRP_delRow operationTable" name="del_documentos_aplicacao">
                              <img src="{$path_tmpl}/img/icon/tools-bar/delete.png"/>
                              <span>
                                <xsl:value-of select="$lngPath/separatorlist_dialog/delete" disable-output-escaping="yes"/>
                              </span>
                            </li>
                          </ul>
                          <table rel="T_documentos_aplicacao" data-control="data-documentos_aplicacao">
                            <thead>
                              <tr>
                                <xsl:if test="rows/content/form/table/documentos_aplicacao/label/tipo">
                                  <xsl:if test="not(rows/content/form/table/documentos_aplicacao/label/tipo/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/documentos_aplicacao/label/tipo" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/documentos_aplicacao/label/nome">
                                  <xsl:if test="not(rows/content/form/table/documentos_aplicacao/label/nome/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/documentos_aplicacao/label/nome" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/documentos_aplicacao/label/descricao_documento">
                                  <xsl:if test="not(rows/content/form/table/documentos_aplicacao/label/descricao_documento/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/documentos_aplicacao/label/descricao_documento" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/documentos_aplicacao/label/upload">
                                  <xsl:if test="not(rows/content/form/table/documentos_aplicacao/label/upload/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/documentos_aplicacao/label/upload" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <th class="bEdDel"/>
                              </tr>
                            </thead>
                            <tbody>
                              <xsl:for-each select="rows/content/form/table/documentos_aplicacao/value/row[not(@total='yes')]">
                                <tr row="{position()}">
                                  <xsl:if test="tipo">
                                    <xsl:if test="not(tipo/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/tipo}" class="select">
                                        <xsl:value-of select="tipo_desc" disable-output-escaping="yes"/>
                                        <input type="hidden" name="p_tipo_fk" value="{tipo}"/>
                                        <input type="hidden" name="p_tipo_fk_desc" value="{tipo_desc}"/>
                                        <span class="showResponsiveTable ctxmenu"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="tipo/@visible = 'false'">
                                      <input type="hidden" name="p_tipo_fk" value="{tipo}"/>
                                      <input type="hidden" name="p_tipo_fk_desc" value="{tipo_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="nome">
                                    <xsl:if test="not(nome/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/nome}" class="text">
                                        <xsl:value-of select="nome_desc" disable-output-escaping="yes"/>
                                        <input type="hidden" name="p_nome_fk" value="{nome}"/>
                                        <input type="hidden" name="p_nome_fk_desc" value="{nome_desc}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="nome/@visible = 'false'">
                                      <input type="hidden" name="p_nome_fk" value="{nome}"/>
                                      <input type="hidden" name="p_nome_fk_desc" value="{nome_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="descricao_documento">
                                    <xsl:if test="not(descricao_documento/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/descricao_documento}" class="text">
                                        <xsl:value-of select="descricao_documento_desc" disable-output-escaping="yes"/>
                                        <input type="hidden" name="p_descricao_documento_fk" value="{descricao_documento}"/>
                                        <input type="hidden" name="p_descricao_documento_fk_desc" value="{descricao_documento_desc}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="descricao_documento/@visible = 'false'">
                                      <input type="hidden" name="p_descricao_documento_fk" value="{descricao_documento}"/>
                                      <input type="hidden" name="p_descricao_documento_fk_desc" value="{descricao_documento_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="upload">
                                    <xsl:if test="not(upload/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/upload}" class="file">
                                        <xsl:choose>
                                          <xsl:when test="upload != ''">
                                            <a href="{upload}" class="link bClick" target="_blank" name="upload">
                                              <xsl:value-of select="upload_desc" disable-output-escaping="yes"/>
                                            </a>
                                          </xsl:when>
                                          <xsl:otherwise>
                                            <xsl:value-of select="upload_desc" disable-output-escaping="yes"/>
                                          </xsl:otherwise>
                                        </xsl:choose>
                                        <input type="hidden" name="p_upload_fk" value="{upload}"/>
                                        <input type="hidden" name="p_upload_fk_desc" value="{upload_desc}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="upload/@visible = 'false'">
                                      <input type="hidden" name="p_upload_fk" value="{upload}"/>
                                      <input type="hidden" name="p_upload_fk_desc" value="{upload_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <td class="bEdDel" data-row="{position()}" data-title="{$lngPath/separatorlist_dialog/edit}/{$lngPath/separatorlist_dialog/delete}">
                                    <xsl:if test="not(@noupdate)">
                                      <img title="{$lngPath/separatorlist_dialog/edit}" src="{$path_tmpl}/img/icon/tools-bar/edit.png" name="edit_documentos_aplicacao" rel="documentos_aplicacao" class="IGRP_editRow"/>
                                    </xsl:if>
                                    <xsl:if test="not(@nodelete)">
                                      <img title="{$lngPath/separatorlist_dialog/delete}" src="{$path_tmpl}/img/icon/tools-bar/delete.png" name="del_documentos_aplicacao" rel="documentos_aplicacao" class="IGRP_delRow"/>
                                    </xsl:if>
                                  </td>
                                  <input type="hidden" name="p_documentos_aplicacao_id" value="{documentos_aplicacao_id}"/>
                                </tr>
                              </xsl:for-each>
                            </tbody>
                          </table>
                        </div><!-- END TABELA LIST--></div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if><!-- INICIO SEPARADOR videos_tutorials--><xsl:if test="rows/content/form/label/videos_tutorials">
                  <div class="box-content resetPadding" sep-name="videos_tutorials">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/videos_tutorials"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="col" group-name="videos_tutorials">
                        <xsl:if test="rows/content/form/label/nome_tutorial">
                          <div class="col-1-4 item" item-name="nome_tutorial">
                            <div class="igrp_item text">
                              <label>
                                <xsl:value-of select="rows/content/form/label/nome_tutorial" disable-output-escaping="yes"/>
                              </label>
                              <input type="text" name="{rows/content/form/value/nome_tutorial/@name}" value="{rows/content/form/value/nome_tutorial}" class="text" maxlength="30" rel="F_videos_tutorials">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/nome_tutorial"/>
                                </xsl:call-template>
                              </input>
                              <div class="_clear"/>
                            </div>
                            <div class="_clear"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/descricao_tutorials">
                          <div class="col-1-4 item" item-name="descricao_tutorials">
                            <div class="igrp_item text">
                              <label>
                                <xsl:value-of select="rows/content/form/label/descricao_tutorials" disable-output-escaping="yes"/>
                              </label>
                              <input type="text" name="{rows/content/form/value/descricao_tutorials/@name}" value="{rows/content/form/value/descricao_tutorials}" class="text" maxlength="1000" rel="F_videos_tutorials">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/descricao_tutorials"/>
                                </xsl:call-template>
                              </input>
                              <div class="_clear"/>
                            </div>
                            <div class="_clear"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/video_tutorial">
                          <div class="col-1-4 item" item-name="video_tutorial">
                            <div class="igrp_item file">
                              <label>
                                <xsl:value-of select="rows/content/form/label/video_tutorial" disable-output-escaping="yes"/>
                              </label>
                              <div class="itemIcon">
                                <input class="notForm" placeholder="Choose File" disabled="disabled" file="id_{rows/content/form/value/video_tutorial/@name}"/>
                                <span class="upload">File</span>
                                <input type="file" name="{rows/content/form/value/video_tutorial/@name}" value="{rows/content/form/value/video_tutorial}" class="file uploadFile" rel="F_videos_tutorials">
                                  <xsl:call-template name="FIELD_validator">
                                    <xsl:with-param name="field" select="rows/content/form/label/video_tutorial"/>
                                  </xsl:call-template>
                                </input>
                              </div>
                              <div class="_clear"/>
                            </div>
                            <div class="_clear"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/upload_icon">
                          <div class="col-1-4 item" item-name="upload_icon">
                            <div class="igrp_item file">
                              <label>
                                <xsl:value-of select="rows/content/form/label/upload_icon" disable-output-escaping="yes"/>
                              </label>
                              <div class="itemIcon">
                                <input class="notForm" placeholder="Choose File" disabled="disabled" file="id_{rows/content/form/value/upload_icon/@name}"/>
                                <span class="upload">File</span>
                                <input type="file" name="{rows/content/form/value/upload_icon/@name}" value="{rows/content/form/value/upload_icon}" class="file uploadFile" rel="F_videos_tutorials">
                                  <xsl:call-template name="FIELD_validator">
                                    <xsl:with-param name="field" select="rows/content/form/label/upload_icon"/>
                                  </xsl:call-template>
                                </input>
                              </div>
                              <div class="_clear"/>
                            </div>
                            <div class="_clear"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/link_video">
                          <div class="col-1-4 item" item-name="link_video">
                            <div class="igrp_item text">
                              <label>
                                <xsl:value-of select="rows/content/form/label/link_video" disable-output-escaping="yes"/>
                              </label>
                              <input type="text" name="{rows/content/form/value/link_video/@name}" value="{rows/content/form/value/link_video}" class="text" maxlength="200" rel="F_videos_tutorials">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/link_video"/>
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
                        <xsl:with-param name="rel" select="'videos_tutorials'"/>
                      </xsl:call-template>
                      <div class="col" list-name="videos_tutorials"><!-- START TABELA LIST--><div class="box-table table-responsive">
                          <ul class="contextMenu ctxSepListDialog" id="data-videos_tutorials">
                            <li rel="videos_tutorials" class="IGRP_editRow operationTable" name="edit_videos_tutorials">
                              <img src="{$path_tmpl}/img/icon/tools-bar/edit.png"/>
                              <span>
                                <xsl:value-of select="$lngPath/separatorlist_dialog/edit" disable-output-escaping="yes"/>
                              </span>
                            </li>
                            <li rel="videos_tutorials" class="IGRP_delRow operationTable" name="del_videos_tutorials">
                              <img src="{$path_tmpl}/img/icon/tools-bar/delete.png"/>
                              <span>
                                <xsl:value-of select="$lngPath/separatorlist_dialog/delete" disable-output-escaping="yes"/>
                              </span>
                            </li>
                          </ul>
                          <table rel="T_videos_tutorials" data-control="data-videos_tutorials">
                            <thead>
                              <tr>
                                <xsl:if test="rows/content/form/table/videos_tutorials/label/nome_tutorial">
                                  <xsl:if test="not(rows/content/form/table/videos_tutorials/label/nome_tutorial/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/videos_tutorials/label/nome_tutorial" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/videos_tutorials/label/descricao_tutorials">
                                  <xsl:if test="not(rows/content/form/table/videos_tutorials/label/descricao_tutorials/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/videos_tutorials/label/descricao_tutorials" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/videos_tutorials/label/video_tutorial">
                                  <xsl:if test="not(rows/content/form/table/videos_tutorials/label/video_tutorial/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/videos_tutorials/label/video_tutorial" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/videos_tutorials/label/upload_icon">
                                  <xsl:if test="not(rows/content/form/table/videos_tutorials/label/upload_icon/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/videos_tutorials/label/upload_icon" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/videos_tutorials/label/link_video">
                                  <xsl:if test="not(rows/content/form/table/videos_tutorials/label/link_video/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/videos_tutorials/label/link_video" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <th class="bEdDel"/>
                              </tr>
                            </thead>
                            <tbody>
                              <xsl:for-each select="rows/content/form/table/videos_tutorials/value/row[not(@total='yes')]">
                                <tr row="{position()}">
                                  <xsl:if test="nome_tutorial">
                                    <xsl:if test="not(nome_tutorial/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/nome_tutorial}" class="text">
                                        <xsl:value-of select="nome_tutorial_desc" disable-output-escaping="yes"/>
                                        <input type="hidden" name="p_nome_tutorial_fk" value="{nome_tutorial}"/>
                                        <input type="hidden" name="p_nome_tutorial_fk_desc" value="{nome_tutorial_desc}"/>
                                        <span class="showResponsiveTable ctxmenu"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="nome_tutorial/@visible = 'false'">
                                      <input type="hidden" name="p_nome_tutorial_fk" value="{nome_tutorial}"/>
                                      <input type="hidden" name="p_nome_tutorial_fk_desc" value="{nome_tutorial_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="descricao_tutorials">
                                    <xsl:if test="not(descricao_tutorials/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/descricao_tutorials}" class="text">
                                        <xsl:value-of select="descricao_tutorials_desc" disable-output-escaping="yes"/>
                                        <input type="hidden" name="p_descricao_tutorials_fk" value="{descricao_tutorials}"/>
                                        <input type="hidden" name="p_descricao_tutorials_fk_desc" value="{descricao_tutorials_desc}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="descricao_tutorials/@visible = 'false'">
                                      <input type="hidden" name="p_descricao_tutorials_fk" value="{descricao_tutorials}"/>
                                      <input type="hidden" name="p_descricao_tutorials_fk_desc" value="{descricao_tutorials_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="video_tutorial">
                                    <xsl:if test="not(video_tutorial/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/video_tutorial}" class="file">
                                        <xsl:choose>
                                          <xsl:when test="video_tutorial != ''">
                                            <a href="{video_tutorial}" class="link bClick" target="_blank" name="video_tutorial">
                                              <xsl:value-of select="video_tutorial_desc" disable-output-escaping="yes"/>
                                            </a>
                                          </xsl:when>
                                          <xsl:otherwise>
                                            <xsl:value-of select="video_tutorial_desc" disable-output-escaping="yes"/>
                                          </xsl:otherwise>
                                        </xsl:choose>
                                        <input type="hidden" name="p_video_tutorial_fk" value="{video_tutorial}"/>
                                        <input type="hidden" name="p_video_tutorial_fk_desc" value="{video_tutorial_desc}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="video_tutorial/@visible = 'false'">
                                      <input type="hidden" name="p_video_tutorial_fk" value="{video_tutorial}"/>
                                      <input type="hidden" name="p_video_tutorial_fk_desc" value="{video_tutorial_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="upload_icon">
                                    <xsl:if test="not(upload_icon/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/upload_icon}" class="file">
                                        <xsl:choose>
                                          <xsl:when test="upload_icon != ''">
                                            <a href="{upload_icon}" class="link bClick" target="_blank" name="upload_icon">
                                              <xsl:value-of select="upload_icon_desc" disable-output-escaping="yes"/>
                                            </a>
                                          </xsl:when>
                                          <xsl:otherwise>
                                            <xsl:value-of select="upload_icon_desc" disable-output-escaping="yes"/>
                                          </xsl:otherwise>
                                        </xsl:choose>
                                        <input type="hidden" name="p_upload_icon_fk" value="{upload_icon}"/>
                                        <input type="hidden" name="p_upload_icon_fk_desc" value="{upload_icon_desc}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="upload_icon/@visible = 'false'">
                                      <input type="hidden" name="p_upload_icon_fk" value="{upload_icon}"/>
                                      <input type="hidden" name="p_upload_icon_fk_desc" value="{upload_icon_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="link_video">
                                    <xsl:if test="not(link_video/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/link_video}" class="text">
                                        <xsl:value-of select="link_video_desc" disable-output-escaping="yes"/>
                                        <input type="hidden" name="p_link_video_fk" value="{link_video}"/>
                                        <input type="hidden" name="p_link_video_fk_desc" value="{link_video_desc}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="link_video/@visible = 'false'">
                                      <input type="hidden" name="p_link_video_fk" value="{link_video}"/>
                                      <input type="hidden" name="p_link_video_fk_desc" value="{link_video_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <td class="bEdDel" data-row="{position()}" data-title="{$lngPath/separatorlist_dialog/edit}/{$lngPath/separatorlist_dialog/delete}">
                                    <xsl:if test="not(@noupdate)">
                                      <img title="{$lngPath/separatorlist_dialog/edit}" src="{$path_tmpl}/img/icon/tools-bar/edit.png" name="edit_videos_tutorials" rel="videos_tutorials" class="IGRP_editRow"/>
                                    </xsl:if>
                                    <xsl:if test="not(@nodelete)">
                                      <img title="{$lngPath/separatorlist_dialog/delete}" src="{$path_tmpl}/img/icon/tools-bar/delete.png" name="del_videos_tutorials" rel="videos_tutorials" class="IGRP_delRow"/>
                                    </xsl:if>
                                  </td>
                                  <input type="hidden" name="p_videos_tutorials_id" value="{videos_tutorials_id}"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-form-text-editor.tmpl.xsl?v=20150309"/>
</xsl:stylesheet>
