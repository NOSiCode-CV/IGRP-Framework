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
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FORM--><!--START TOOLS BAR FROM--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar"/><!--END TOOLS BAR FORM--><div class="col addMarginTop" sep-name="form"><!-- INICIO SEPARADOR anexar_doc--><xsl:if test="rows/content/form/label/anexar_doc">
                  <div class="box-content resetPadding" sep-name="anexar_doc">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/anexar_doc"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="col" group-name="anexar_doc">
                        <xsl:if test="rows/content/form/label/doc_type">
                          <div class="col-1-4 item" item-name="doc_type">
                            <div class="igrp_item select">
                              <label>
                                <xsl:if test="string-length(rows/content/form/label/doc_type) > 45">
                                  <xsl:attribute name="title">
                                    <xsl:value-of select="rows/content/form/label/doc_type" disable-output-escaping="yes"/>
                                  </xsl:attribute>
                                </xsl:if>
                                <span class="riquired">*</span>
                                <xsl:value-of select="rows/content/form/label/doc_type" disable-output-escaping="yes"/>
                              </label>
                              <select name="{rows/content/form/list/doc_type/@name}" chosen="select" data-placeholder="{rows/content/form/list/doc_type/option[position() = 1]}" class="select important" rel="F_anexar_doc">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/doc_type"/>
                                </xsl:call-template>
                                <option value=""/>
                                <xsl:for-each select="rows/content/form/list/doc_type/option[position() != 1]">
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
                        <xsl:if test="rows/content/form/label/doc">
                          <div class="col-1-4 item" item-name="doc">
                            <div class="igrp_item file">
                              <label>
                                <xsl:if test="string-length(rows/content/form/label/doc) > 45">
                                  <xsl:attribute name="title">
                                    <xsl:value-of select="rows/content/form/label/doc" disable-output-escaping="yes"/>
                                  </xsl:attribute>
                                </xsl:if>
                                <span class="riquired">*</span>
                                <xsl:value-of select="rows/content/form/label/doc" disable-output-escaping="yes"/>
                              </label>
                              <div class="itemIcon">
                                <input class="notForm" placeholder="Choose File" disabled="disabled" file="id_{rows/content/form/value/doc/@name}"/>
                                <span class="upload">File</span>
                                <input type="file" name="{rows/content/form/value/doc/@name}" value="{rows/content/form/value/doc}" class="file important uploadFile" rel="F_anexar_doc">
                                  <xsl:call-template name="FIELD_validator">
                                    <xsl:with-param name="field" select="rows/content/form/label/doc"/>
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
                        <xsl:with-param name="rel" select="'anexar_doc'"/>
                      </xsl:call-template>
                      <div class="col" list-name="anexar_doc"><!-- START TABELA LIST--><div class="box-table table-responsive">
                          <ul class="contextMenu ctxSepListDialog" id="data-anexar_doc">
                            <li rel="anexar_doc" class="IGRP_editRow operationTable" name="edit_anexar_doc">
                              <img src="{$path_tmpl}/img/icon/tools-bar/edit.png"/>
                              <span>
                                <xsl:value-of select="$lngPath/separatorlist_dialog/edit" disable-output-escaping="yes"/>
                              </span>
                            </li>
                            <li rel="anexar_doc" class="IGRP_delRow operationTable" name="del_anexar_doc">
                              <img src="{$path_tmpl}/img/icon/tools-bar/delete.png"/>
                              <span>
                                <xsl:value-of select="$lngPath/separatorlist_dialog/delete" disable-output-escaping="yes"/>
                              </span>
                            </li>
                          </ul>
                          <table rel="T_anexar_doc" data-control="data-anexar_doc">
                            <thead>
                              <tr>
                                <xsl:if test="rows/content/form/table/anexar_doc/label/doc_type">
                                  <xsl:if test="not(rows/content/form/table/anexar_doc/label/doc_type/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/anexar_doc/label/doc_type" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/anexar_doc/label/doc">
                                  <xsl:if test="not(rows/content/form/table/anexar_doc/label/doc/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/anexar_doc/label/doc" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <th class="bEdDel"/>
                              </tr>
                            </thead>
                            <tbody>
                              <xsl:for-each select="rows/content/form/table/anexar_doc/value/row[not(@total='yes')]">
                                <tr row="{position()}">
                                  <xsl:if test="doc_type">
                                    <xsl:if test="not(doc_type/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/doc_type}" class="select">
                                        <xsl:value-of select="doc_type_desc" disable-output-escaping="yes"/>
                                        <input type="hidden" name="p_doc_type_fk" value="{doc_type}"/>
                                        <input type="hidden" name="p_doc_type_fk_desc" value="{doc_type_desc}"/>
                                        <span class="showResponsiveTable ctxmenu"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="doc_type/@visible = 'false'">
                                      <input type="hidden" name="p_doc_type_fk" value="{doc_type}"/>
                                      <input type="hidden" name="p_doc_type_fk_desc" value="{doc_type_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="doc">
                                    <xsl:if test="not(doc/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/doc}" class="file">
                                        <xsl:choose>
                                          <xsl:when test="doc != ''">
                                            <a href="{doc}" class="link bClick" target="_blank" name="doc">
                                              <xsl:value-of select="doc_desc" disable-output-escaping="yes"/>
                                            </a>
                                          </xsl:when>
                                          <xsl:otherwise>
                                            <xsl:value-of select="doc_desc" disable-output-escaping="yes"/>
                                          </xsl:otherwise>
                                        </xsl:choose>
                                        <input type="hidden" name="p_doc_fk" value="{doc}"/>
                                        <input type="hidden" name="p_doc_fk_desc" value="{doc_desc}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="doc/@visible = 'false'">
                                      <input type="hidden" name="p_doc_fk" value="{doc}"/>
                                      <input type="hidden" name="p_doc_fk_desc" value="{doc_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <td class="bEdDel" data-row="{position()}" data-title="{$lngPath/separatorlist_dialog/edit}/{$lngPath/separatorlist_dialog/delete}">
                                    <xsl:if test="not(@noupdate)">
                                      <img title="{$lngPath/separatorlist_dialog/edit}" src="{$path_tmpl}/img/icon/tools-bar/edit.png" name="edit_anexar_doc" rel="anexar_doc" class="IGRP_editRow"/>
                                    </xsl:if>
                                    <xsl:if test="not(@nodelete)">
                                      <img title="{$lngPath/separatorlist_dialog/delete}" src="{$path_tmpl}/img/icon/tools-bar/delete.png" name="del_anexar_doc" rel="anexar_doc" class="IGRP_delRow"/>
                                    </xsl:if>
                                  </td>
                                  <input type="hidden" name="p_anexar_doc_id" value="{anexar_doc_id}"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150311"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150311"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150311"/>
</xsl:stylesheet>
