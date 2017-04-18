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
                <xsl:if test="rows/content/form/label/titulo">
                  <xsl:if test="rows/content/form/label/titulo">
                    <div class="col-1-4 item" item-name="titulo">
                      <div class="igrp_item text">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/titulo" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/titulo/@name}" value="{rows/content/form/value/titulo}" class="text required" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/titulo"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/descricao">
                  <xsl:if test="rows/content/form/label/descricao">
                    <div class="col-1-4 item" item-name="descricao">
                      <div class="igrp_item textarea">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/descricao" disable-output-escaping="yes"/>
                        </label>
                        <textarea name="{rows/content/form/value/descricao/@name}" class="textarea required" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/descricao"/>
                          </xsl:call-template>
                          <xsl:value-of select="rows/content/form/value/descricao" disable-output-escaping="yes"/>
                        </textarea>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/processo">
                  <xsl:if test="rows/content/form/label/processo">
                    <div class="col-1-4 item" item-name="processo">
                      <div class="igrp_item selectchange">
                        <a id="idp_processo"/>
                        <label>
                          <xsl:value-of select="rows/content/form/label/processo" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/processo/@name}" chosen="select" data-placeholder="{rows/content/form/list/processo/option[position() = 1]}" class="selectchange IGRP_change">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/processo"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/processo/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/etapa">
                  <xsl:if test="rows/content/form/label/etapa">
                    <div class="col-1-4 item" item-name="etapa">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/etapa" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/etapa/@name}" value="{rows/content/form/value/etapa}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/etapa"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/modulo">
                  <xsl:if test="rows/content/form/label/modulo">
                    <div class="col-1-4 item" item-name="modulo">
                      <div class="igrp_item selectchange">
                        <a id="idp_modulo"/>
                        <label>
                          <xsl:value-of select="rows/content/form/label/modulo" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/modulo/@name}" chosen="select" data-placeholder="{rows/content/form/list/modulo/option[position() = 1]}" class="selectchange IGRP_change">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/modulo"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/modulo/option[position() != 1]">
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
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/pagina" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/pagina/@name}" value="{rows/content/form/value/pagina}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/pagina"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if><!-- INICIO SEPARADOR anexos--><xsl:if test="rows/content/form/label/anexos">
                  <div class="box-content resetPadding" sep-name="anexos">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/anexos"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="col" group-name="anexos">
                        <xsl:if test="rows/content/form/label/printscreen">
                          <div class="col-1-4 item" item-name="printscreen">
                            <div class="igrp_item file">
                              <label>
                                <xsl:value-of select="rows/content/form/label/printscreen" disable-output-escaping="yes"/>
                              </label>
                              <div class="itemIcon">
                                <input class="notForm" placeholder="Choose File" disabled="disabled" file="id_{rows/content/form/value/printscreen/@name}"/>
                                <span class="upload">File</span>
                                <input type="file" name="{rows/content/form/value/printscreen/@name}" value="{rows/content/form/value/printscreen}" class="file uploadFile" rel="F_anexos">
                                  <xsl:call-template name="FIELD_validator">
                                    <xsl:with-param name="field" select="rows/content/form/label/printscreen"/>
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
                        <xsl:with-param name="rel" select="'anexos'"/>
                      </xsl:call-template>
                      <div class="col" list-name="anexos"><!-- START TABELA LIST--><div class="box-table table-responsive">
                          <ul class="contextMenu ctxSepListDialog" id="data-anexos">
                            <li rel="anexos" class="IGRP_editRow operationTable" name="edit_anexos">
                              <img src="{$path_tmpl}/img/icon/tools-bar/edit.png"/>
                              <span>
                                <xsl:value-of select="$lngPath/separatorlist_dialog/edit" disable-output-escaping="yes"/>
                              </span>
                            </li>
                            <li rel="anexos" class="IGRP_delRow operationTable" name="del_anexos">
                              <img src="{$path_tmpl}/img/icon/tools-bar/delete.png"/>
                              <span>
                                <xsl:value-of select="$lngPath/separatorlist_dialog/delete" disable-output-escaping="yes"/>
                              </span>
                            </li>
                          </ul>
                          <table rel="T_anexos" data-control="data-anexos">
                            <thead>
                              <tr>
                                <xsl:if test="rows/content/form/table/anexos/label/printscreen">
                                  <xsl:if test="not(rows/content/form/table/anexos/label/printscreen/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/anexos/label/printscreen" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <th class="bEdDel"/>
                              </tr>
                            </thead>
                            <tbody>
                              <xsl:for-each select="rows/content/form/table/anexos/value/row[not(@total='yes')]">
                                <tr row="{position()}">
                                  <xsl:if test="printscreen">
                                    <xsl:if test="not(printscreen/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/printscreen}" class="file">
                                        <xsl:choose>
                                          <xsl:when test="printscreen != ''">
                                            <a href="{printscreen}" class="link bClick" target="_blank" name="printscreen">
                                              <xsl:value-of select="printscreen_desc" disable-output-escaping="yes"/>
                                            </a>
                                          </xsl:when>
                                          <xsl:otherwise>
                                            <xsl:value-of select="printscreen_desc" disable-output-escaping="yes"/>
                                          </xsl:otherwise>
                                        </xsl:choose>
                                        <input type="hidden" name="p_printscreen_fk" value="{printscreen}"/>
                                        <input type="hidden" name="p_printscreen_fk_desc" value="{printscreen_desc}"/>
                                        <span class="showResponsiveTable ctxmenu"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="printscreen/@visible = 'false'">
                                      <input type="hidden" name="p_printscreen_fk" value="{printscreen}"/>
                                      <input type="hidden" name="p_printscreen_fk_desc" value="{printscreen_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <td class="bEdDel" data-row="{position()}" data-title="{$lngPath/separatorlist_dialog/edit}/{$lngPath/separatorlist_dialog/delete}">
                                    <xsl:if test="not(@noupdate)">
                                      <img title="{$lngPath/separatorlist_dialog/edit}" src="{$path_tmpl}/img/icon/tools-bar/edit.png" name="edit_anexos" rel="anexos" class="IGRP_editRow"/>
                                    </xsl:if>
                                    <xsl:if test="not(@nodelete)">
                                      <img title="{$lngPath/separatorlist_dialog/delete}" src="{$path_tmpl}/img/icon/tools-bar/delete.png" name="del_anexos" rel="anexos" class="IGRP_delRow"/>
                                    </xsl:if>
                                  </td>
                                  <input type="hidden" name="p_anexos_id" value="{anexos_id}"/>
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
</xsl:stylesheet>
