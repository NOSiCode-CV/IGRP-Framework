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
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FORM--><!--START TOOLS BAR FROM--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar"/><!--END TOOLS BAR FORM--><div class="col addMarginTop" sep-name="form">
                <xsl:if test="rows/content/form/label/aplicacao">
                  <div class="col-1-4 item" item-name="aplicacao">
                    <div class="igrp_item selectchange">
                      <a id="idp_aplicacao"/>
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/aplicacao) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/aplicacao" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/aplicacao" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/aplicacao/@name}" chosen="select" data-placeholder="{rows/content/form/list/aplicacao/option[position() = 1]}" class="selectchange required IGRP_change">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/aplicacao"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/aplicacao/option[position() != 1]">
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
                </xsl:if><!-- INICIO SEPARADOR notificados--><xsl:if test="rows/content/form/label/notificados">
                  <div class="box-content resetPadding" sep-name="notificados">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/notificados"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="col" sep-name="group-notificados">
                        <xsl:if test="rows/content/form/label/email">
                          <div class="col-1-4 item" item-name="email">
                            <div class="igrp_item email">
                              <label>
                                <xsl:if test="string-length(rows/content/form/label/email) > 45">
                                  <xsl:attribute name="title">
                                    <xsl:value-of select="rows/content/form/label/email" disable-output-escaping="yes"/>
                                  </xsl:attribute>
                                </xsl:if>
                                <span class="riquired">*</span>
                                <xsl:value-of select="rows/content/form/label/email" disable-output-escaping="yes"/>
                              </label>
                              <input type="email" name="{rows/content/form/value/email/@name}" value="{rows/content/form/value/email}" class="email important" rel="F_notificados">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/email"/>
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
                        <xsl:with-param name="rel" select="'notificados'"/>
                      </xsl:call-template>
                      <div class="col" sep-name="list-notificados"><!-- START TABELA LIST--><div class="box-table table-responsive">
                          <ul class="contextMenu ctxSepListDialog" id="data-notificados" sep-name="btn-notificados">
                            <li rel="notificados" class="IGRP_editRow operationTable" item-name="edit-notificados">
                              <img src="{$path_tmpl}/img/icon/tools-bar/edit.png"/>
                              <span>
                                <xsl:value-of select="$lngPath/separatorlist_dialog/edit" disable-output-escaping="yes"/>
                              </span>
                            </li>
                            <li rel="notificados" class="IGRP_delRow operationTable" item-name="del-notificados">
                              <img src="{$path_tmpl}/img/icon/tools-bar/delete.png"/>
                              <span>
                                <xsl:value-of select="$lngPath/separatorlist_dialog/delete" disable-output-escaping="yes"/>
                              </span>
                            </li>
                          </ul>
                          <table rel="T_notificados" data-control="data-notificados">
                            <thead>
                              <tr>
                                <xsl:if test="rows/content/form/table/notificados/label/email">
                                  <xsl:if test="not(rows/content/form/table/notificados/label/email/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/notificados/label/email" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <th class="bEdDel"/>
                              </tr>
                            </thead>
                            <tbody>
                              <xsl:for-each select="rows/content/form/table/notificados/value/row[not(@total='yes')]">
                                <tr row="{position()}">
                                  <xsl:if test="email">
                                    <xsl:if test="not(email/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/email}" class="email">
                                        <xsl:value-of select="email_desc" disable-output-escaping="yes"/>
                                        <input type="hidden" name="p_email_fk" value="{email}"/>
                                        <input type="hidden" name="p_email_fk_desc" value="{email_desc}"/>
                                        <span class="showResponsiveTable ctxmenu"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="email/@visible = 'false'">
                                      <input type="hidden" name="p_email_fk" value="{email}"/>
                                      <input type="hidden" name="p_email_fk_desc" value="{email_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <td class="bEdDel" data-row="{position()}" data-title="{$lngPath/separatorlist_dialog/edit}/{$lngPath/separatorlist_dialog/delete}">
                                    <xsl:if test="not(@noupdate)">
                                      <img title="{$lngPath/separatorlist_dialog/edit}" src="{$path_tmpl}/img/icon/tools-bar/edit.png" item-name="edit-notificados" rel="notificados" class="IGRP_editRow"/>
                                    </xsl:if>
                                    <xsl:if test="not(@nodelete)">
                                      <img title="{$lngPath/separatorlist_dialog/delete}" src="{$path_tmpl}/img/icon/tools-bar/delete.png" item-name="del-notificados" rel="notificados" class="IGRP_delRow"/>
                                    </xsl:if>
                                  </td>
                                  <input type="hidden" name="p_notificados_id" value="{notificados_id}"/>
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
              </div><!-- START TABELA--><div class="col addBorderLeftRight borderColor">
                <div class="box-table table-responsive">
                  <div class="table-container"><!--  CONTEXT-MENU  --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu">
                      <xsl:with-param name="contextId" select="'table'"/>
                    </xsl:apply-templates>
                    <table class="IGRP_table default-table" data-control="table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/email">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/email"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <tr row="{position()}" class="IGRP_contextMenu">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="email">
                              <td align="left" data-row="{position()}" data-title="{../../label/email}" class="text">
                                <xsl:value-of select="email"/>
                                <xsl:apply-templates mode="cxtmenu-resp" select="//rows/content/table/context-menu">
                                  <xsl:with-param name="ctx" select="context-menu"/>
                                </xsl:apply-templates>
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
          <div class="_clear"/>
        </div><!--FOOTER PAGE--><div id="igrp-footerPage">
          <xsl:call-template name="footer"/>
        </div>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150320"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150320"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150320"/>
  <xsl:include href="../../xsl/tmpl/IGRP-context.tmpl.xsl?v=20150320"/>
</xsl:stylesheet>
