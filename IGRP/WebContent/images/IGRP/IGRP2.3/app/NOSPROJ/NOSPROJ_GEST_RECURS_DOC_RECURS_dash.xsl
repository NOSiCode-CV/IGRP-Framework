<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html><!--XSL Generator (RED/DIM 2015)--><head><!--HOME-HEADER--><xsl:call-template name="home-header"/>
      </head>
      <body class="bodyColor">
        <div class="IGRP_overlay"/><!--HOME TOP--><xsl:call-template name="home-top-main"/><!--HOME--><div id="igrp-bodyPage"><!--HOME LEFT--><xsl:call-template name="home-slide-menu"/><!--HOME RIGTH--><div class="bodyPageRigth"><!-- START YOUR CODE HERE --><!-- SHOW TABLET AND MOBILE TITLE --><div class="box-head showTabMobile">
              <xsl:value-of select="rows/content/title"/>
            </div><!-- SHOW NOTIFICATION MESSAGES--><xsl:apply-templates mode="notif_messages" select="rows/content/messages"/><!-- START SIMPLE-MENU --><xsl:apply-templates mode="simple-menu" select="rows/content/menu"/><!-- END SIMPLE-MENU --><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!-- SHOW HIDDEN--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FORM--><!--START TOOLS BAR FROM--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar"/><!--END TOOLS BAR FORM--><div class="col addMarginTop addPaddingBottom10" sep-name="form"><!-- INICIO SEPARADOR documentos--><xsl:if test="rows/content/form/label/documentos">
                  <div class="box-content resetPadding" sep-name="documentos">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/documentos"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="col" sep-name="group-documentos">
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
                              <input type="text" name="{rows/content/form/value/nome/@name}" value="{rows/content/form/value/nome}" class="text important" maxlength="30" rel="F_documentos">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/nome"/>
                                </xsl:call-template>
                              </input>
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
                                <input type="file" name="{rows/content/form/value/ficheiro/@name}" value="{rows/content/form/value/ficheiro}" id="id_{rows/content/form/value/ficheiro/@name}" class="file important uploadFile" rel="F_documentos">
                                  <xsl:call-template name="FIELD_validator">
                                    <xsl:with-param name="field" select="rows/content/form/label/ficheiro"/>
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
                        <xsl:with-param name="rel" select="'documentos'"/>
                      </xsl:call-template>
                      <div class="col" sep-name="list-documentos"><!-- START TABELA LIST--><div class="box-table table-responsive">
                          <ul class="contextMenu ctxSepListDialog" id="data-documentos" sep-name="btn-documentos">
                            <li rel="documentos" class="IGRP_editRow operationTable" item-name="edit-documentos">
                              <img src="{$path_tmpl}/img/icon/tools-bar/edit.png"/>
                              <span>
                                <xsl:value-of select="$lngPath/separatorlist_dialog/edit" disable-output-escaping="yes"/>
                              </span>
                            </li>
                            <li rel="documentos" class="IGRP_delRow operationTable" item-name="del-documentos">
                              <img src="{$path_tmpl}/img/icon/tools-bar/delete.png"/>
                              <span>
                                <xsl:value-of select="$lngPath/separatorlist_dialog/delete" disable-output-escaping="yes"/>
                              </span>
                            </li>
                          </ul>
                          <table rel="T_documentos" data-control="data-documentos">
                            <thead>
                              <tr>
                                <xsl:if test="rows/content/form/table/documentos/label/nome">
                                  <xsl:if test="not(rows/content/form/table/documentos/label/nome/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/documentos/label/nome" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/documentos/label/ficheiro">
                                  <xsl:if test="not(rows/content/form/table/documentos/label/ficheiro/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/documentos/label/ficheiro" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <th class="bEdDel"/>
                              </tr>
                            </thead>
                            <tbody>
                              <xsl:for-each select="rows/content/form/table/documentos/value/row[not(@total='yes')]">
                                <tr row="{position()}">
                                  <xsl:if test="nome">
                                    <xsl:if test="not(nome/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/nome}" class="text">
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
                                  <xsl:if test="ficheiro">
                                    <xsl:if test="not(ficheiro/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/ficheiro}" class="file">
                                        <xsl:choose>
                                          <xsl:when test="ficheiro != ''">
                                            <a href="{ficheiro}" class="link bClick" target="_blank" name="ficheiro">
                                              <xsl:value-of select="ficheiro_desc" disable-output-escaping="yes"/>
                                            </a>
                                          </xsl:when>
                                          <xsl:otherwise>
                                            <xsl:value-of select="ficheiro_desc" disable-output-escaping="yes"/>
                                          </xsl:otherwise>
                                        </xsl:choose>
                                        <input type="hidden" name="p_ficheiro_fk" value="{ficheiro}"/>
                                        <input type="hidden" name="p_ficheiro_fk_desc" value="{ficheiro_desc}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="ficheiro/@visible = 'false'">
                                      <input type="hidden" name="p_ficheiro_fk" value="{ficheiro}"/>
                                      <input type="hidden" name="p_ficheiro_fk_desc" value="{ficheiro_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <td class="bEdDel" data-row="{position()}" data-title="{$lngPath/separatorlist_dialog/edit}/{$lngPath/separatorlist_dialog/delete}">
                                    <xsl:if test="not(@noupdate)">
                                      <img title="{$lngPath/separatorlist_dialog/edit}" src="{$path_tmpl}/img/icon/tools-bar/edit.png" item-name="edit-documentos" rel="documentos" class="IGRP_editRow"/>
                                    </xsl:if>
                                    <xsl:if test="not(@nodelete)">
                                      <img title="{$lngPath/separatorlist_dialog/delete}" src="{$path_tmpl}/img/icon/tools-bar/delete.png" item-name="del-documentos" rel="documentos" class="IGRP_delRow"/>
                                    </xsl:if>
                                  </td>
                                  <input type="hidden" name="p_documentos_id" value="{documentos_id}"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-menu.tmpl.xsl?v=20150825"/>
</xsl:stylesheet>
