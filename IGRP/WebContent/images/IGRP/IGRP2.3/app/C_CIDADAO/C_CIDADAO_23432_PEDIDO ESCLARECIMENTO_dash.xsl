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
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FORM--><!--START TOOLS BAR FROM--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar"/><!--END TOOLS BAR FORM--><div class="col addMarginTop" sep-name="form"><!-- INICIO SEPARADOR enviar_email--><xsl:if test="rows/content/form/label/enviar_email">
                  <div class="box-content resetPadding" sep-name="enviar_email">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/enviar_email"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/nome">
                  <xsl:if test="rows/content/form/label/nome">
                    <div class="col-1-4 item" item-name="nome">
                      <div class="igrp_item text">
                        <label>
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
                </xsl:if>
                <xsl:if test="rows/content/form/label/email">
                  <xsl:if test="rows/content/form/label/email">
                    <div class="col-1-4 item" item-name="email">
                      <div class="igrp_item email">
                        <label>
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
                </xsl:if>
                <xsl:if test="rows/content/form/label/telefone">
                  <xsl:if test="rows/content/form/label/telefone">
                    <div class="col-1-4 item" item-name="telefone">
                      <div class="igrp_item number">
                        <label>
                          <xsl:value-of select="rows/content/form/label/telefone" disable-output-escaping="yes"/>
                        </label>
                        <input type="number" name="{rows/content/form/value/telefone/@name}" value="{rows/content/form/value/telefone}" class="number" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/telefone"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/assunto">
                  <xsl:if test="rows/content/form/label/assunto">
                    <div class="col-1-4 item" item-name="assunto">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/assunto" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/assunto/@name}" value="{rows/content/form/value/assunto}" class="text" maxlength="100">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/assunto"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/mensagem">
                  <xsl:if test="rows/content/form/label/mensagem">
                    <div class="col-1-4 item" item-name="mensagem">
                      <div class="igrp_item textarea">
                        <label>
                          <xsl:value-of select="rows/content/form/label/mensagem" disable-output-escaping="yes"/>
                        </label>
                        <textarea name="{rows/content/form/value/mensagem/@name}" class="textarea" maxlength="200">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/mensagem"/>
                          </xsl:call-template>
                          <xsl:value-of select="rows/content/form/value/mensagem" disable-output-escaping="yes"/>
                        </textarea>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if><!-- INICIO SEPARADOR anexo--><xsl:if test="rows/content/form/label/anexo">
                  <div class="box-content resetPadding" sep-name="anexo">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/anexo"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="col" group-name="anexo">
                        <xsl:if test="rows/content/form/label/upload">
                          <div class="col-1-4 item" item-name="upload">
                            <div class="igrp_item file">
                              <label>
                                <xsl:value-of select="rows/content/form/label/upload" disable-output-escaping="yes"/>
                              </label>
                              <div class="itemIcon">
                                <input class="notForm" placeholder="Choose File" disabled="disabled" file="id_{rows/content/form/value/upload/@name}"/>
                                <span class="upload">File</span>
                                <input type="file" name="{rows/content/form/value/upload/@name}" value="{rows/content/form/value/upload}" class="file uploadFile" rel="F_anexo">
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
                        <xsl:with-param name="rel" select="'anexo'"/>
                      </xsl:call-template>
                      <div class="col" list-name="anexo"><!-- START TABELA LIST--><div class="box-table table-responsive">
                          <ul class="contextMenu ctxSepListDialog" id="data-anexo">
                            <li rel="anexo" class="IGRP_editRow operationTable" name="edit_anexo">
                              <img src="{$path_tmpl}/img/icon/tools-bar/edit.png"/>
                              <span>
                                <xsl:value-of select="$lngPath/separatorlist_dialog/edit" disable-output-escaping="yes"/>
                              </span>
                            </li>
                            <li rel="anexo" class="IGRP_delRow operationTable" name="del_anexo">
                              <img src="{$path_tmpl}/img/icon/tools-bar/delete.png"/>
                              <span>
                                <xsl:value-of select="$lngPath/separatorlist_dialog/delete" disable-output-escaping="yes"/>
                              </span>
                            </li>
                          </ul>
                          <table rel="T_anexo" data-control="data-anexo">
                            <thead>
                              <tr>
                                <xsl:if test="rows/content/form/table/anexo/label/upload">
                                  <xsl:if test="not(rows/content/form/table/anexo/label/upload/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/anexo/label/upload" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <th class="bEdDel"/>
                              </tr>
                            </thead>
                            <tbody>
                              <xsl:for-each select="rows/content/form/table/anexo/value/row[not(@total='yes')]">
                                <tr row="{position()}">
                                  <xsl:if test="upload">
                                    <xsl:if test="not(upload/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/upload}">
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
                                        <span class="showResponsiveTable ctxmenu"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="upload/@visible = 'false'">
                                      <input type="hidden" name="p_upload_fk" value="{upload}"/>
                                      <input type="hidden" name="p_upload_fk_desc" value="{upload_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <td class="bEdDel" data-row="{position()}" data-title="{$lngPath/separatorlist_dialog/edit}/{$lngPath/separatorlist_dialog/delete}">
                                    <xsl:if test="not(@noupdate)">
                                      <img title="{$lngPath/separatorlist_dialog/edit}" src="{$path_tmpl}/img/icon/tools-bar/edit.png" name="edit_anexo" rel="anexo" class="IGRP_editRow"/>
                                    </xsl:if>
                                    <xsl:if test="not(@nodelete)">
                                      <img title="{$lngPath/separatorlist_dialog/delete}" src="{$path_tmpl}/img/icon/tools-bar/delete.png" name="del_anexo" rel="anexo" class="IGRP_delRow"/>
                                    </xsl:if>
                                  </td>
                                  <input type="hidden" name="p_anexo_id" value="{anexo_id}"/>
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
