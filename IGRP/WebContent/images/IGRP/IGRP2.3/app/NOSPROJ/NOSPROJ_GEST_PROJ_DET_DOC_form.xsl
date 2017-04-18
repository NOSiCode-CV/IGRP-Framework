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
                <xsl:if test="rows/content/form/label/categoria">
                  <div class="col-1-4 item" item-name="categoria">
                    <div class="igrp_item select">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/categoria) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/categoria" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/categoria" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/categoria/@name}" chosen="select" id="{rows/content/form/list/categoria/@name}" data-placeholder="{rows/content/form/list/categoria/option[position() = 1]}" class="select required">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/categoria"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/categoria/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/titulo">
                  <div class="col-1-4 item" item-name="titulo">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/titulo) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/titulo" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/titulo" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/titulo/@name}" value="{rows/content/form/value/titulo}" class="text required" maxlength="100">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/titulo"/>
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
                      <textarea name="{rows/content/form/value/descricao/@name}" class="textarea" maxlength="400">
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
                <xsl:if test="rows/content/form/label/ficheiro">
                  <div class="col-1-4 item" item-name="ficheiro">
                    <div class="igrp_item file">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/ficheiro) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/ficheiro" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/ficheiro" disable-output-escaping="yes"/>
                      </label>
                      <div class="itemIcon">
                        <input class="notForm" placeholder="Choose File" disabled="disabled" file="id_{rows/content/form/value/ficheiro/@name}"/>
                        <span class="upload"/>
                        <input type="file" name="{rows/content/form/value/ficheiro/@name}" value="{rows/content/form/value/ficheiro}" id="id_{rows/content/form/value/ficheiro/@name}" class="file required uploadFile">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/ficheiro"/>
                          </xsl:call-template>
                        </input>
                      </div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if><!-- INICIO SEPARADOR restringir_acessos--><xsl:if test="rows/content/form/label/restringir_acessos">
                  <div class="box-content resetPadding" sep-name="restringir_acessos">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/restringir_acessos"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="col" sep-name="group-restringir_acessos">
                        <xsl:if test="rows/content/form/label/utilizador">
                          <div class="col-1-4 item" item-name="utilizador">
                            <div class="igrp_item select">
                              <label>
                                <xsl:if test="string-length(rows/content/form/label/utilizador) > 45">
                                  <xsl:attribute name="title">
                                    <xsl:value-of select="rows/content/form/label/utilizador" disable-output-escaping="yes"/>
                                  </xsl:attribute>
                                </xsl:if>
                                <span class="riquired">*</span>
                                <xsl:value-of select="rows/content/form/label/utilizador" disable-output-escaping="yes"/>
                              </label>
                              <select name="{rows/content/form/list/utilizador/@name}" chosen="select" id="{rows/content/form/list/utilizador/@name}" data-placeholder="{rows/content/form/list/utilizador/option[position() = 1]}" class="select important" rel="F_restringir_acessos">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/utilizador"/>
                                </xsl:call-template>
                                <option value=""/>
                                <xsl:for-each select="rows/content/form/list/utilizador/option[position() != 1]">
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
                        <xsl:with-param name="rel" select="'restringir_acessos'"/>
                      </xsl:call-template>
                      <div class="col" sep-name="list-restringir_acessos"><!-- START TABELA LIST--><div class="box-table table-responsive">
                          <ul class="contextMenu ctxSepListDialog" id="data-restringir_acessos" sep-name="btn-restringir_acessos">
                            <li rel="restringir_acessos" class="IGRP_editRow operationTable" item-name="edit-restringir_acessos">
                              <img src="{$path_tmpl}/img/icon/tools-bar/edit.png"/>
                              <span>
                                <xsl:value-of select="$lngPath/separatorlist_dialog/edit" disable-output-escaping="yes"/>
                              </span>
                            </li>
                            <li rel="restringir_acessos" class="IGRP_delRow operationTable" item-name="del-restringir_acessos">
                              <img src="{$path_tmpl}/img/icon/tools-bar/delete.png"/>
                              <span>
                                <xsl:value-of select="$lngPath/separatorlist_dialog/delete" disable-output-escaping="yes"/>
                              </span>
                            </li>
                          </ul>
                          <table rel="T_restringir_acessos" data-control="data-restringir_acessos">
                            <thead>
                              <tr>
                                <xsl:if test="rows/content/form/table/restringir_acessos/label/utilizador">
                                  <xsl:if test="not(rows/content/form/table/restringir_acessos/label/utilizador/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/restringir_acessos/label/utilizador" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <th class="bEdDel"/>
                              </tr>
                            </thead>
                            <tbody>
                              <xsl:for-each select="rows/content/form/table/restringir_acessos/value/row[not(@total='yes')]">
                                <tr row="{position()}">
                                  <xsl:if test="utilizador">
                                    <xsl:if test="not(utilizador/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/utilizador}" class="select">
                                        <xsl:value-of select="utilizador_desc" disable-output-escaping="yes"/>
                                        <input type="hidden" name="p_utilizador_fk" value="{utilizador}"/>
                                        <input type="hidden" name="p_utilizador_fk_desc" value="{utilizador_desc}"/>
                                        <span class="showResponsiveTable ctxmenu"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="utilizador/@visible = 'false'">
                                      <input type="hidden" name="p_utilizador_fk" value="{utilizador}"/>
                                      <input type="hidden" name="p_utilizador_fk_desc" value="{utilizador_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <td class="bEdDel" data-row="{position()}" data-title="{$lngPath/separatorlist_dialog/edit}/{$lngPath/separatorlist_dialog/delete}">
                                    <xsl:if test="not(@noupdate)">
                                      <img title="{$lngPath/separatorlist_dialog/edit}" src="{$path_tmpl}/img/icon/tools-bar/edit.png" item-name="edit-restringir_acessos" rel="restringir_acessos" class="IGRP_editRow"/>
                                    </xsl:if>
                                    <xsl:if test="not(@nodelete)">
                                      <img title="{$lngPath/separatorlist_dialog/delete}" src="{$path_tmpl}/img/icon/tools-bar/delete.png" item-name="del-restringir_acessos" rel="restringir_acessos" class="IGRP_delRow"/>
                                    </xsl:if>
                                  </td>
                                  <input type="hidden" name="p_restringir_acessos_id" value="{restringir_acessos_id}"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150825"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150825"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150825"/>
</xsl:stylesheet>
