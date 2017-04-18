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
            </div><!-- SHOW NOTIFICATION MESSAGES--><xsl:apply-templates mode="notif_messages" select="rows/content/messages"/><!-- START VIEW --><xsl:apply-templates mode="IGRP-view" select="rows/content/view"/><!-- END VIEW --><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!-- SHOW HIDDEN--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FORM--><div class="col addMarginTop" sep-name="form"><!-- INICIO SEPARADOR adicionar--><xsl:if test="rows/content/form/label/adicionar">
                  <div class="box-content resetPadding" sep-name="adicionar">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/adicionar"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="col" group-name="adicionar">
                        <xsl:if test="rows/content/form/label/adjudicacao">
                          <div class="col-1-4 item" item-name="adjudicacao">
                            <div class="igrp_item selectchange">
                              <a id="idp_adjudicacao"/>
                              <label>
                                <xsl:value-of select="rows/content/form/label/adjudicacao" disable-output-escaping="yes"/>
                              </label>
                              <select name="{rows/content/form/list/adjudicacao/@name}" chosen="select" data-placeholder="{rows/content/form/list/adjudicacao/option[position() = 1]}" class="selectchange IGRP_change" rel="F_adicionar">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/adjudicacao"/>
                                </xsl:call-template>
                                <option value=""/>
                                <xsl:for-each select="rows/content/form/list/adjudicacao/option[position() != 1]">
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
                        <xsl:if test="rows/content/form/label/descricao">
                          <div class="col-1-4 item" item-name="descricao">
                            <div class="igrp_item text">
                              <label>
                                <xsl:value-of select="rows/content/form/label/descricao" disable-output-escaping="yes"/>
                              </label>
                              <input type="text" name="{rows/content/form/value/descricao/@name}" value="{rows/content/form/value/descricao}" class="text" maxlength="100" rel="F_adicionar">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/descricao"/>
                                </xsl:call-template>
                              </input>
                              <div class="_clear"/>
                            </div>
                            <div class="_clear"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/valor">
                          <div class="col-1-4 item" item-name="valor">
                            <div class="igrp_item number">
                              <label>
                                <xsl:value-of select="rows/content/form/label/valor" disable-output-escaping="yes"/>
                              </label>
                              <input type="number" name="{rows/content/form/value/valor/@name}" value="{rows/content/form/value/valor}" class="number" maxlength="30" rel="F_adicionar">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/valor"/>
                                </xsl:call-template>
                              </input>
                              <div class="_clear"/>
                            </div>
                            <div class="_clear"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/nivel">
                          <div class="col-1-4 item" item-name="nivel">
                            <div class="igrp_item selectchange">
                              <a id="idp_nivel"/>
                              <label>
                                <xsl:value-of select="rows/content/form/label/nivel" disable-output-escaping="yes"/>
                              </label>
                              <select name="{rows/content/form/list/nivel/@name}" chosen="select" data-placeholder="{rows/content/form/list/nivel/option[position() = 1]}" class="selectchange IGRP_change" rel="F_adicionar">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/nivel"/>
                                </xsl:call-template>
                                <option value=""/>
                                <xsl:for-each select="rows/content/form/list/nivel/option[position() != 1]">
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
                        <xsl:with-param name="rel" select="'adicionar'"/>
                      </xsl:call-template>
                      <div class="col" list-name="adicionar"><!-- START TABELA LIST--><div class="box-table table-responsive">
                          <ul class="contextMenu ctxSepListDialog" id="data-adicionar">
                            <li rel="adicionar" class="IGRP_editRow operationTable" name="edit_adicionar">
                              <img src="{$path_tmpl}/img/icon/tools-bar/edit.png"/>
                              <span>
                                <xsl:value-of select="$lngPath/separatorlist_dialog/edit" disable-output-escaping="yes"/>
                              </span>
                            </li>
                            <li rel="adicionar" class="IGRP_delRow operationTable" name="del_adicionar">
                              <img src="{$path_tmpl}/img/icon/tools-bar/delete.png"/>
                              <span>
                                <xsl:value-of select="$lngPath/separatorlist_dialog/delete" disable-output-escaping="yes"/>
                              </span>
                            </li>
                          </ul>
                          <table rel="T_adicionar" data-control="data-adicionar">
                            <thead>
                              <tr>
                                <xsl:if test="rows/content/form/table/adicionar/label/adjudicacao">
                                  <xsl:if test="not(rows/content/form/table/adicionar/label/adjudicacao/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/adicionar/label/adjudicacao" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/adicionar/label/descricao">
                                  <xsl:if test="not(rows/content/form/table/adicionar/label/descricao/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/adicionar/label/descricao" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/adicionar/label/valor">
                                  <xsl:if test="not(rows/content/form/table/adicionar/label/valor/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/adicionar/label/valor" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/adicionar/label/nivel">
                                  <xsl:if test="not(rows/content/form/table/adicionar/label/nivel/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/adicionar/label/nivel" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <th class="bEdDel"/>
                              </tr>
                            </thead>
                            <tbody>
                              <xsl:for-each select="rows/content/form/table/adicionar/value/row[not(@total='yes')]">
                                <tr row="{position()}">
                                  <xsl:if test="adjudicacao">
                                    <xsl:if test="not(adjudicacao/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/adjudicacao}">
                                        <xsl:value-of select="adjudicacao_desc" disable-output-escaping="yes"/>
                                        <input type="hidden" name="p_adjudicacao_fk" value="{adjudicacao}"/>
                                        <input type="hidden" name="p_adjudicacao_fk_desc" value="{adjudicacao_desc}"/>
                                        <span class="showResponsiveTable ctxmenu"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="adjudicacao/@visible = 'false'">
                                      <input type="hidden" name="p_adjudicacao_fk" value="{adjudicacao}"/>
                                      <input type="hidden" name="p_adjudicacao_fk_desc" value="{adjudicacao_desc}"/>
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
                                  <xsl:if test="valor">
                                    <xsl:if test="not(valor/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/valor}">
                                        <xsl:value-of select="valor_desc" disable-output-escaping="yes"/>
                                        <input type="hidden" name="p_valor_fk" value="{valor}"/>
                                        <input type="hidden" name="p_valor_fk_desc" value="{valor_desc}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="valor/@visible = 'false'">
                                      <input type="hidden" name="p_valor_fk" value="{valor}"/>
                                      <input type="hidden" name="p_valor_fk_desc" value="{valor_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="nivel">
                                    <xsl:if test="not(nivel/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/nivel}">
                                        <xsl:value-of select="nivel_desc" disable-output-escaping="yes"/>
                                        <input type="hidden" name="p_nivel_fk" value="{nivel}"/>
                                        <input type="hidden" name="p_nivel_fk_desc" value="{nivel_desc}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="nivel/@visible = 'false'">
                                      <input type="hidden" name="p_nivel_fk" value="{nivel}"/>
                                      <input type="hidden" name="p_nivel_fk_desc" value="{nivel_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <td class="bEdDel" data-row="{position()}" data-title="{$lngPath/separatorlist_dialog/edit}/{$lngPath/separatorlist_dialog/delete}">
                                    <xsl:if test="not(@noupdate)">
                                      <img title="{$lngPath/separatorlist_dialog/edit}" src="{$path_tmpl}/img/icon/tools-bar/edit.png" name="edit_adicionar" rel="adicionar" class="IGRP_editRow"/>
                                    </xsl:if>
                                    <xsl:if test="not(@nodelete)">
                                      <img title="{$lngPath/separatorlist_dialog/delete}" src="{$path_tmpl}/img/icon/tools-bar/delete.png" name="del_adicionar" rel="adicionar" class="IGRP_delRow"/>
                                    </xsl:if>
                                  </td>
                                  <input type="hidden" name="p_adicionar_id" value="{adicionar_id}"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150306"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150306"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150306"/>
  <xsl:include href="../../xsl/tmpl/IGRP-view.tmpl.xsl?v=20150306"/>
</xsl:stylesheet>
