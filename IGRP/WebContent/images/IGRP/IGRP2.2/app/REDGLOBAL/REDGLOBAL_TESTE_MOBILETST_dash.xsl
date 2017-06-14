<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html>
      <!--XSL Generator (RED/DIM 2015)-->
      <head>
        <!--HOME-HEADER-->
        <xsl:call-template name="home-header"/>
      </head>
      <body class="bodyColor">
        <div class="IGRP_overlay"/>
        <!--HOME TOP-->
        <xsl:call-template name="home-top-main"/>
        <!--HOME-->
        <div id="igrp-bodyPage">
          <!--HOME LEFT-->
          <xsl:call-template name="home-slide-menu"/>
          <!--HOME RIGTH-->
          <div class="bodyPageRigth">
            <!--START YOUR CODE HERE-->
            <!--SHOW TABLET AND MOBILE TITLE-->
            <div class="box-head showTabMobile">
              <xsl:value-of select="rows/content/title"/>
            </div>
            <!--SHOW NOTIFICATION MESSAGES-->
            <xsl:apply-templates mode="notif_messages" select="rows/content/messages"/>
            <form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data">
              <!--SHOW HIDDEN-->
              <xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/>
              <!--START FORM-->
              <div class="col addMarginTop addPaddingBottom10" sep-name="form">
                <!--INICIO SEPARADOR separador_lista-->
                <xsl:if test="rows/content/form/label/separador_lista">
                  <div class="box-content resetPadding" sep-name="separador_lista">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/separador_lista"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="col" sep-name="group-separador_lista">
                        <xsl:if test="rows/content/form/label/nome">
                          <div class="col-1-4 item" item-name="nome">
                            <div class="igrp_item text">
                              <label>
                                <xsl:if test="string-length(rows/content/form/label/nome) >45">
                                  <xsl:attribute name="title">
                                    <xsl:value-of select="rows/content/form/label/nome" disable-output-escaping="yes"/>
                                  </xsl:attribute>
                                </xsl:if>
                                <xsl:value-of select="rows/content/form/label/nome" disable-output-escaping="yes"/>
                              </label>
                              <input type="text" name="{rows/content/form/value/nome/@name}" value="{rows/content/form/value/nome}" class="text" maxlength="30" rel="F_separador_lista">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/nome"/>
                                </xsl:call-template>
                              </input>
                              <div class="_clear"/>
                            </div>
                            <div class="_clear"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/contacto">
                          <div class="col-1-4 item" item-name="contacto">
                            <div class="igrp_item LOOKUP">
                              <label>
                                <xsl:if test="string-length(rows/content/form/label/contacto) >45">
                                  <xsl:attribute name="title">
                                    <xsl:value-of select="rows/content/form/label/contacto" disable-output-escaping="yes"/>
                                  </xsl:attribute>
                                </xsl:if>
                                <xsl:value-of select="rows/content/form/label/contacto" disable-output-escaping="yes"/>
                              </label>
                              <div class="itemIcon">
                                <input type="LOOKUP" name="{rows/content/form/value/contacto/@name}" value="{rows/content/form/value/contacto}" class="LOOKUP" rel="F_separador_lista">
                                  <xsl:call-template name="FIELD_validator">
                                    <xsl:with-param name="field" select="rows/content/form/label/contacto"/>
                                  </xsl:call-template>
                                </input>
                                <xsl:call-template name="lookup-tool">
                                  <xsl:with-param name="page" select="rows/page"/>
                                  <xsl:with-param name="ad_hoc" select="'1'"/>
                                  <xsl:with-param name="action" select="'LOOKUP'"/>
                                  <xsl:with-param name="name" select="rows/content/form/value/contacto/@name"/>
                                  <xsl:with-param name="js_lookup" select="rows/content/form/lookup/contacto"/>
                                </xsl:call-template>
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
                        <xsl:with-param name="rel" select="'separador_lista'"/>
                      </xsl:call-template>
                      <div class="col" sep-name="list-separador_lista">
                        <!--START TABELA LIST-->
                        <div class="box-table table-responsive">
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
                                <xsl:if test="rows/content/form/table/separador_lista/label/nome">
                                  <xsl:if test="not(rows/content/form/table/separador_lista/label/nome/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/separador_lista/label/nome" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/separador_lista/label/contacto">
                                  <xsl:if test="not(rows/content/form/table/separador_lista/label/contacto/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/separador_lista/label/contacto" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <th class="bEdDel"/>
                              </tr>
                            </thead>
                            <tbody>
                              <xsl:for-each select="rows/content/form/table/separador_lista/value/row[not(@total='yes')]">
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
                                  <xsl:if test="contacto">
                                    <xsl:if test="not(contacto/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/contacto}" class="LOOKUP">
                                        <xsl:value-of select="contacto_desc" disable-output-escaping="yes"/>
                                        <input type="hidden" name="p_contacto_fk" value="{contacto}"/>
                                        <input type="hidden" name="p_contacto_fk_desc" value="{contacto_desc}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="contacto/@visible = 'false'">
                                      <input type="hidden" name="p_contacto_fk" value="{contacto}"/>
                                      <input type="hidden" name="p_contacto_fk_desc" value="{contacto_desc}"/>
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
                                  <input type="hidden" name="p_id_fk" value="{id}"/>
                                  <input type="hidden" name="p_id_fk_desc" value="{id_desc}"/>
                                </tr>
                              </xsl:for-each>
                            </tbody>
                          </table>
                        </div>
                        <!--END TABELA LIST--></div>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <div class="_clear"/>
                </div>
              </form>
              <!--END YOUR CODE HERE-->
              <div class="_clear"/>
            </div>
            <xsl:call-template name="link-opener"/>
            <div class="_clear"/>
          </div>
          <!--FOOTER PAGE-->
          <div id="igrp-footerPage">
            <xsl:call-template name="footer"/>
          </div>
        </body>
      </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150929"/>
    <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150929"/>
    <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150929"/>
  </xsl:stylesheet>
