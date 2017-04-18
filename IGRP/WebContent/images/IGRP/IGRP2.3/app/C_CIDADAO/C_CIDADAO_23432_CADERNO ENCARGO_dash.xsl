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
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FORM--><div class="col addMarginTop" sep-name="form"><!-- INICIO SEPARADOR caderno_encargos--><xsl:if test="rows/content/form/label/caderno_encargos">
                  <div class="box-content resetPadding" sep-name="caderno_encargos">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/caderno_encargos"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/tipo_procedimento">
                  <xsl:if test="rows/content/form/label/tipo_procedimento">
                    <div class="col-1-4 item" item-name="tipo_procedimento">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/tipo_procedimento" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/tipo_procedimento/@name}" value="{rows/content/form/value/tipo_procedimento}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/tipo_procedimento"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if><!-- INICIO SEPARADOR objecto--><xsl:if test="rows/content/form/label/objecto">
                  <div class="box-content resetPadding" sep-name="objecto">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/objecto"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="col" group-name="objecto">
                        <xsl:if test="rows/content/form/label/codigo_taxionomia">
                          <div class="col-1-4 item" item-name="codigo_taxionomia">
                            <div class="igrp_item text">
                              <label>
                                <xsl:value-of select="rows/content/form/label/codigo_taxionomia" disable-output-escaping="yes"/>
                              </label>
                              <input type="text" name="{rows/content/form/value/codigo_taxionomia/@name}" value="{rows/content/form/value/codigo_taxionomia}" class="text" maxlength="30" rel="F_objecto">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/codigo_taxionomia"/>
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
                                <xsl:value-of select="rows/content/form/label/descricao" disable-output-escaping="yes"/>
                              </label>
                              <input type="text" name="{rows/content/form/value/descricao/@name}" value="{rows/content/form/value/descricao}" class="text" maxlength="30" rel="F_objecto">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/descricao"/>
                                </xsl:call-template>
                              </input>
                              <div class="_clear"/>
                            </div>
                            <div class="_clear"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/quantidade">
                          <div class="col-1-4 item" item-name="quantidade">
                            <div class="igrp_item text">
                              <label>
                                <xsl:value-of select="rows/content/form/label/quantidade" disable-output-escaping="yes"/>
                              </label>
                              <input type="text" name="{rows/content/form/value/quantidade/@name}" value="{rows/content/form/value/quantidade}" class="text" maxlength="30" rel="F_objecto">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/quantidade"/>
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
                        <xsl:with-param name="rel" select="'objecto'"/>
                      </xsl:call-template>
                      <div class="col" list-name="objecto"><!-- START TABELA LIST--><div class="box-table table-responsive">
                          <ul class="contextMenu ctxSepListDialog" id="data-objecto">
                            <li rel="objecto" class="IGRP_editRow operationTable" name="edit_objecto">
                              <img src="{$path_tmpl}/img/icon/tools-bar/edit.png"/>
                              <span>
                                <xsl:value-of select="$lngPath/separatorlist_dialog/edit" disable-output-escaping="yes"/>
                              </span>
                            </li>
                            <li rel="objecto" class="IGRP_delRow operationTable" name="del_objecto">
                              <img src="{$path_tmpl}/img/icon/tools-bar/delete.png"/>
                              <span>
                                <xsl:value-of select="$lngPath/separatorlist_dialog/delete" disable-output-escaping="yes"/>
                              </span>
                            </li>
                          </ul>
                          <table rel="T_objecto" data-control="data-objecto">
                            <thead>
                              <tr>
                                <xsl:if test="rows/content/form/table/objecto/label/codigo_taxionomia">
                                  <xsl:if test="not(rows/content/form/table/objecto/label/codigo_taxionomia/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/objecto/label/codigo_taxionomia" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/objecto/label/descricao">
                                  <xsl:if test="not(rows/content/form/table/objecto/label/descricao/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/objecto/label/descricao" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/objecto/label/quantidade">
                                  <xsl:if test="not(rows/content/form/table/objecto/label/quantidade/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/objecto/label/quantidade" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <th class="bEdDel"/>
                              </tr>
                            </thead>
                            <tbody>
                              <xsl:for-each select="rows/content/form/table/objecto/value/row[not(@total='yes')]">
                                <tr row="{position()}">
                                  <xsl:if test="codigo_taxionomia">
                                    <xsl:if test="not(codigo_taxionomia/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/codigo_taxionomia}">
                                        <xsl:value-of select="codigo_taxionomia_desc" disable-output-escaping="yes"/>
                                        <input type="hidden" name="p_codigo_taxionomia_fk" value="{codigo_taxionomia}"/>
                                        <input type="hidden" name="p_codigo_taxionomia_fk_desc" value="{codigo_taxionomia_desc}"/>
                                        <span class="showResponsiveTable ctxmenu"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="codigo_taxionomia/@visible = 'false'">
                                      <input type="hidden" name="p_codigo_taxionomia_fk" value="{codigo_taxionomia}"/>
                                      <input type="hidden" name="p_codigo_taxionomia_fk_desc" value="{codigo_taxionomia_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="descricao">
                                    <xsl:if test="not(descricao/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/descricao}">
                                        <xsl:value-of select="descricao_desc" disable-output-escaping="yes"/>
                                        <input type="hidden" name="p_descricao_fk" value="{descricao}"/>
                                        <input type="hidden" name="p_descricao_fk_desc" value="{descricao_desc}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="descricao/@visible = 'false'">
                                      <input type="hidden" name="p_descricao_fk" value="{descricao}"/>
                                      <input type="hidden" name="p_descricao_fk_desc" value="{descricao_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="quantidade">
                                    <xsl:if test="not(quantidade/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/quantidade}">
                                        <xsl:value-of select="quantidade_desc" disable-output-escaping="yes"/>
                                        <input type="hidden" name="p_quantidade_fk" value="{quantidade}"/>
                                        <input type="hidden" name="p_quantidade_fk_desc" value="{quantidade_desc}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="quantidade/@visible = 'false'">
                                      <input type="hidden" name="p_quantidade_fk" value="{quantidade}"/>
                                      <input type="hidden" name="p_quantidade_fk_desc" value="{quantidade_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <td class="bEdDel" data-row="{position()}" data-title="{$lngPath/separatorlist_dialog/edit}/{$lngPath/separatorlist_dialog/delete}">
                                    <xsl:if test="not(@noupdate)">
                                      <img title="{$lngPath/separatorlist_dialog/edit}" src="{$path_tmpl}/img/icon/tools-bar/edit.png" name="edit_objecto" rel="objecto" class="IGRP_editRow"/>
                                    </xsl:if>
                                    <xsl:if test="not(@nodelete)">
                                      <img title="{$lngPath/separatorlist_dialog/delete}" src="{$path_tmpl}/img/icon/tools-bar/delete.png" name="del_objecto" rel="objecto" class="IGRP_delRow"/>
                                    </xsl:if>
                                  </td>
                                  <input type="hidden" name="p_objecto_id" value="{objecto_id}"/>
                                </tr>
                              </xsl:for-each>
                            </tbody>
                          </table>
                        </div><!-- END TABELA LIST--></div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if><!-- INICIO SEPARADOR local--><xsl:if test="rows/content/form/label/local">
                  <div class="box-content resetPadding" sep-name="local">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/local"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/local_de">
                  <xsl:if test="rows/content/form/label/local_de">
                    <div class="col-1-4 item" item-name="local_de">
                      <div class="igrp_item select">
                        <label>
                          <xsl:value-of select="rows/content/form/label/local_de" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/local_de/@name}" chosen="select" data-placeholder="{rows/content/form/list/local_de/option[position() = 1]}" class="select">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/local_de"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/local_de/option[position() != 1]">
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
                </xsl:if><!-- INICIO SEPARADOR prazo--><xsl:if test="rows/content/form/label/prazo">
                  <div class="box-content resetPadding" sep-name="prazo">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/prazo"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/prazo_de">
                  <xsl:if test="rows/content/form/label/prazo_de">
                    <div class="col-1-4 item" item-name="prazo_de">
                      <div class="igrp_item date">
                        <label>
                          <xsl:value-of select="rows/content/form/label/prazo_de" disable-output-escaping="yes"/>
                        </label>
                        <div class="itemIcon">
                          <input type="text" name="{rows/content/form/value/prazo_de/@name}" value="{rows/content/form/value/prazo_de}" class="date" trel="IGRP_datePicker">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/form/label/prazo_de"/>
                            </xsl:call-template>
                          </input>
                          <div class="calendar"/>
                        </div>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if><!-- INICIO SEPARADOR documentacao--><xsl:if test="rows/content/form/label/documentacao">
                  <div class="box-content resetPadding" sep-name="documentacao">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/documentacao"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="col" group-name="documentacao">
                        <xsl:if test="rows/content/form/label/documento">
                          <div class="col-1-4 item" item-name="documento">
                            <div class="igrp_item file">
                              <label>
                                <xsl:value-of select="rows/content/form/label/documento" disable-output-escaping="yes"/>
                              </label>
                              <div class="itemIcon">
                                <input class="notForm" placeholder="Choose File" disabled="disabled" file="id_{rows/content/form/value/documento/@name}"/>
                                <span class="upload">File</span>
                                <input type="file" name="{rows/content/form/value/documento/@name}" value="{rows/content/form/value/documento}" class="file uploadFile" rel="F_documentacao">
                                  <xsl:call-template name="FIELD_validator">
                                    <xsl:with-param name="field" select="rows/content/form/label/documento"/>
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
                        <xsl:with-param name="rel" select="'documentacao'"/>
                      </xsl:call-template>
                      <div class="col" list-name="documentacao"><!-- START TABELA LIST--><div class="box-table table-responsive">
                          <ul class="contextMenu ctxSepListDialog" id="data-documentacao">
                            <li rel="documentacao" class="IGRP_editRow operationTable" name="edit_documentacao">
                              <img src="{$path_tmpl}/img/icon/tools-bar/edit.png"/>
                              <span>
                                <xsl:value-of select="$lngPath/separatorlist_dialog/edit" disable-output-escaping="yes"/>
                              </span>
                            </li>
                            <li rel="documentacao" class="IGRP_delRow operationTable" name="del_documentacao">
                              <img src="{$path_tmpl}/img/icon/tools-bar/delete.png"/>
                              <span>
                                <xsl:value-of select="$lngPath/separatorlist_dialog/delete" disable-output-escaping="yes"/>
                              </span>
                            </li>
                          </ul>
                          <table rel="T_documentacao" data-control="data-documentacao">
                            <thead>
                              <tr>
                                <xsl:if test="rows/content/form/table/documentacao/label/documento">
                                  <xsl:if test="not(rows/content/form/table/documentacao/label/documento/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/documentacao/label/documento" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <th class="bEdDel"/>
                              </tr>
                            </thead>
                            <tbody>
                              <xsl:for-each select="rows/content/form/table/documentacao/value/row[not(@total='yes')]">
                                <tr row="{position()}">
                                  <xsl:if test="documento">
                                    <xsl:if test="not(documento/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/documento}">
                                        <xsl:choose>
                                          <xsl:when test="documento != ''">
                                            <a href="{documento}" class="link bClick" target="_blank" name="documento">
                                              <xsl:value-of select="documento_desc" disable-output-escaping="yes"/>
                                            </a>
                                          </xsl:when>
                                          <xsl:otherwise>
                                            <xsl:value-of select="documento_desc" disable-output-escaping="yes"/>
                                          </xsl:otherwise>
                                        </xsl:choose>
                                        <input type="hidden" name="p_documento_fk" value="{documento}"/>
                                        <input type="hidden" name="p_documento_fk_desc" value="{documento_desc}"/>
                                        <span class="showResponsiveTable ctxmenu"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="documento/@visible = 'false'">
                                      <input type="hidden" name="p_documento_fk" value="{documento}"/>
                                      <input type="hidden" name="p_documento_fk_desc" value="{documento_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <td class="bEdDel" data-row="{position()}" data-title="{$lngPath/separatorlist_dialog/edit}/{$lngPath/separatorlist_dialog/delete}">
                                    <xsl:if test="not(@noupdate)">
                                      <img title="{$lngPath/separatorlist_dialog/edit}" src="{$path_tmpl}/img/icon/tools-bar/edit.png" name="edit_documentacao" rel="documentacao" class="IGRP_editRow"/>
                                    </xsl:if>
                                    <xsl:if test="not(@nodelete)">
                                      <img title="{$lngPath/separatorlist_dialog/delete}" src="{$path_tmpl}/img/icon/tools-bar/delete.png" name="del_documentacao" rel="documentacao" class="IGRP_delRow"/>
                                    </xsl:if>
                                  </td>
                                  <input type="hidden" name="p_documentacao_id" value="{documentacao_id}"/>
                                </tr>
                              </xsl:for-each>
                            </tbody>
                          </table>
                        </div><!-- END TABELA LIST--></div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if><!-- INICIO SEPARADOR sigilo--><xsl:if test="rows/content/form/label/sigilo">
                  <div class="box-content resetPadding" sep-name="sigilo">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/sigilo"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if><!-- INICIO SEPARADOR penalidade--><xsl:if test="rows/content/form/label/penalidade">
                  <div class="box-content resetPadding" sep-name="penalidade">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/penalidade"/>
                    </xsl:call-template>
                    <div class="box-collapser">
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150306"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150306"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150306"/>
</xsl:stylesheet>
