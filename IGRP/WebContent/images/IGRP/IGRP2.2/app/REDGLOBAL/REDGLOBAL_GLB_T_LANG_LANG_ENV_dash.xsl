<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html><!--XSL Generator (RED/DIM 2015)--><head><!--HOME-HEADER--><xsl:call-template name="home-header"/>
      </head>
      <body class="bodyColor">
        <div class="IGRP_overlay"/><!--HOME TOP--><xsl:call-template name="home-top-main"/><!--HOME--><div id="igrp-bodyPage"><!--HOME LEFT--><xsl:call-template name="home-slide-menu"/><!--HOME RIGTH--><div class="bodyPageRigth"><!-- START YOUR CODE HERE --><!-- SHOW TABLET AND MOBILE TITLE --><div class="box-head showTabMobile">
              <xsl:value-of select="rows/content/title"/>
            </div><!-- SHOW NOTIFICATION MESSAGES--><xsl:apply-templates mode="notif_messages" select="rows/content/messages"/><!-- START SIMPLE-MENU --><xsl:apply-templates mode="simple-menu" select="rows/content/menu"/><!-- END SIMPLE-MENU --><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!-- SHOW HIDDEN--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FORM--><!--START TOOLS BAR FROM--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar"/><!--END TOOLS BAR FORM--><div class="col addMarginTop addPaddingBottom10" sep-name="form">
                <xsl:if test="rows/content/form/label/env_fk">
                  <div class="col-1-4 item" item-name="env_fk">
                    <div class="igrp_item select">
                      <a id="idp_env_fk"/>
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/env_fk) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/env_fk" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/env_fk" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/env_fk/@name}" chosen="select" id="{rows/content/form/list/env_fk/@name}" data-placeholder="{rows/content/form/list/env_fk/option[position() = 1]}" class="select required IGRP_change">
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
                </xsl:if><!-- INICIO SEPARADOR linguas--><xsl:if test="rows/content/form/label/linguas">
                  <div class="box-content resetPadding" sep-name="linguas">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/linguas"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="col" sep-name="group-linguas">
                        <xsl:if test="rows/content/form/label/code_lang">
                          <div class="col-1-4 item" item-name="code_lang">
                            <div class="igrp_item select">
                              <label>
                                <xsl:if test="string-length(rows/content/form/label/code_lang) > 45">
                                  <xsl:attribute name="title">
                                    <xsl:value-of select="rows/content/form/label/code_lang" disable-output-escaping="yes"/>
                                  </xsl:attribute>
                                </xsl:if>
                                <span class="riquired">*</span>
                                <xsl:value-of select="rows/content/form/label/code_lang" disable-output-escaping="yes"/>
                              </label>
                              <select name="{rows/content/form/list/code_lang/@name}" chosen="select" id="{rows/content/form/list/code_lang/@name}" data-placeholder="{rows/content/form/list/code_lang/option[position() = 1]}" class="select important" rel="F_linguas">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/code_lang"/>
                                </xsl:call-template>
                                <option value=""/>
                                <xsl:for-each select="rows/content/form/list/code_lang/option[position() != 1]">
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
                        <xsl:if test="rows/content/form/label/defeito">
                          <div class="col-1-4 item" item-name="defeito">
                            <div class="igrp_item select">
                              <label>
                                <xsl:if test="string-length(rows/content/form/label/defeito) > 45">
                                  <xsl:attribute name="title">
                                    <xsl:value-of select="rows/content/form/label/defeito" disable-output-escaping="yes"/>
                                  </xsl:attribute>
                                </xsl:if>
                                <span class="riquired">*</span>
                                <xsl:value-of select="rows/content/form/label/defeito" disable-output-escaping="yes"/>
                              </label>
                              <select name="{rows/content/form/list/defeito/@name}" chosen="select" id="{rows/content/form/list/defeito/@name}" data-placeholder="{rows/content/form/list/defeito/option[position() = 1]}" class="select important" rel="F_linguas">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/defeito"/>
                                </xsl:call-template>
                                <option value=""/>
                                <xsl:for-each select="rows/content/form/list/defeito/option[position() != 1]">
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
                        <xsl:if test="rows/content/form/label/status">
                          <div class="col-1-4 item" item-name="status">
                            <div class="igrp_item select">
                              <label>
                                <xsl:if test="string-length(rows/content/form/label/status) > 45">
                                  <xsl:attribute name="title">
                                    <xsl:value-of select="rows/content/form/label/status" disable-output-escaping="yes"/>
                                  </xsl:attribute>
                                </xsl:if>
                                <span class="riquired">*</span>
                                <xsl:value-of select="rows/content/form/label/status" disable-output-escaping="yes"/>
                              </label>
                              <select name="{rows/content/form/list/status/@name}" chosen="select" id="{rows/content/form/list/status/@name}" data-placeholder="{rows/content/form/list/status/option[position() = 1]}" class="select important" rel="F_linguas">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/status"/>
                                </xsl:call-template>
                                <option value=""/>
                                <xsl:for-each select="rows/content/form/list/status/option[position() != 1]">
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
                        <xsl:with-param name="rel" select="'linguas'"/>
                      </xsl:call-template>
                      <div class="col" sep-name="list-linguas"><!-- START TABELA LIST--><div class="box-table table-responsive">
                          <ul class="contextMenu ctxSepListDialog" id="data-linguas" sep-name="btn-linguas">
                            <li rel="linguas" class="IGRP_editRow operationTable" item-name="edit-linguas">
                              <img src="{$path_tmpl}/img/icon/tools-bar/edit.png"/>
                              <span>
                                <xsl:value-of select="$lngPath/separatorlist_dialog/edit" disable-output-escaping="yes"/>
                              </span>
                            </li>
                            <li rel="linguas" class="IGRP_delRow operationTable" item-name="del-linguas">
                              <img src="{$path_tmpl}/img/icon/tools-bar/delete.png"/>
                              <span>
                                <xsl:value-of select="$lngPath/separatorlist_dialog/delete" disable-output-escaping="yes"/>
                              </span>
                            </li>
                          </ul>
                          <table rel="T_linguas" data-control="data-linguas">
                            <thead>
                              <tr>
                                <xsl:if test="rows/content/form/table/linguas/label/code_lang">
                                  <xsl:if test="not(rows/content/form/table/linguas/label/code_lang/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/linguas/label/code_lang" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/linguas/label/defeito">
                                  <xsl:if test="not(rows/content/form/table/linguas/label/defeito/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/linguas/label/defeito" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/linguas/label/status">
                                  <xsl:if test="not(rows/content/form/table/linguas/label/status/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/linguas/label/status" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <th class="bEdDel"/>
                              </tr>
                            </thead>
                            <tbody>
                              <xsl:for-each select="rows/content/form/table/linguas/value/row[not(@total='yes')]">
                                <tr row="{position()}">
                                  <xsl:if test="code_lang">
                                    <xsl:if test="not(code_lang/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/code_lang}" class="select">
                                        <xsl:value-of select="code_lang_desc" disable-output-escaping="yes"/>
                                        <input type="hidden" name="p_code_lang_fk" value="{code_lang}"/>
                                        <input type="hidden" name="p_code_lang_fk_desc" value="{code_lang_desc}"/>
                                        <span class="showResponsiveTable ctxmenu"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="code_lang/@visible = 'false'">
                                      <input type="hidden" name="p_code_lang_fk" value="{code_lang}"/>
                                      <input type="hidden" name="p_code_lang_fk_desc" value="{code_lang_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="defeito">
                                    <xsl:if test="not(defeito/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/defeito}" class="select">
                                        <xsl:value-of select="defeito_desc" disable-output-escaping="yes"/>
                                        <input type="hidden" name="p_defeito_fk" value="{defeito}"/>
                                        <input type="hidden" name="p_defeito_fk_desc" value="{defeito_desc}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="defeito/@visible = 'false'">
                                      <input type="hidden" name="p_defeito_fk" value="{defeito}"/>
                                      <input type="hidden" name="p_defeito_fk_desc" value="{defeito_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="status">
                                    <xsl:if test="not(status/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/status}" class="select">
                                        <xsl:value-of select="status_desc" disable-output-escaping="yes"/>
                                        <input type="hidden" name="p_status_fk" value="{status}"/>
                                        <input type="hidden" name="p_status_fk_desc" value="{status_desc}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="status/@visible = 'false'">
                                      <input type="hidden" name="p_status_fk" value="{status}"/>
                                      <input type="hidden" name="p_status_fk_desc" value="{status_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <td class="bEdDel" data-row="{position()}" data-title="{$lngPath/separatorlist_dialog/edit}/{$lngPath/separatorlist_dialog/delete}">
                                    <xsl:if test="not(@noupdate)">
                                      <img title="{$lngPath/separatorlist_dialog/edit}" src="{$path_tmpl}/img/icon/tools-bar/edit.png" item-name="edit-linguas" rel="linguas" class="IGRP_editRow"/>
                                    </xsl:if>
                                    <xsl:if test="not(@nodelete)">
                                      <img title="{$lngPath/separatorlist_dialog/delete}" src="{$path_tmpl}/img/icon/tools-bar/delete.png" item-name="del-linguas" rel="linguas" class="IGRP_delRow"/>
                                    </xsl:if>
                                  </td>
                                  <input type="hidden" name="p_linguas_id" value="{linguas_id}"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150615"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150615"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150615"/>
  <xsl:include href="../../xsl/tmpl/IGRP-menu.tmpl.xsl?v=20150615"/>
</xsl:stylesheet>
