<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html><!--XSL Generator (RED / DIM )--><!--HOME-HEADER--><xsl:call-template name="home-header"/>
      <xsl:apply-templates mode="js_validation" select="rows/content/js_validation"/>
      <body><!--HOME TOP--><xsl:call-template name="home-top-main"/><!--CENTER PANE--><div class="general">
          <div id="content">
            <div class="ui-layout-center">
              <xsl:call-template name="dialog-modal"/><!-- START YOUR CODE HERE --><div class="box-content"><!--PAGE TITLE--><xsl:call-template name="page-title">
                  <xsl:with-param name="title" select="rows/content/title"/>
                </xsl:call-template><!--END PAGE TITLE--><!-- START NOTIFICATION MESSAGES--><xsl:apply-templates mode="notif_messages" select="rows/content/messages">
                  <xsl:with-param name="class" select="'notification'"/>
                </xsl:apply-templates><!-- END NOTIFICATION MESSAGES--><div class="center-1"><!-- START FORM VIEW --><div class="box-content">
                  <div class="box-entity">
                    <xsl:if test="rows/content/view/label/view_foto">
                      <div class="foto-box">
                        <img class="foto" src="{rows/content/view/value/view_foto}"/>
                      </div>
                    </xsl:if>
                    <div class="info-box">
                      <ul>
                        <xsl:if test="rows/content/view/label/nome">
                          <li>
                            <span class="label">
                              <xsl:value-of select="rows/content/view/label/nome"/>:</span>
                            <xsl:value-of select="rows/content/view/value/nome"/>
                          </li>
                        </xsl:if>
                        <xsl:if test="rows/content/view/label/idade">
                          <li>
                            <span class="label">
                              <xsl:value-of select="rows/content/view/label/idade"/>:</span>
                            <xsl:value-of select="rows/content/view/value/idade"/>
                          </li>
                        </xsl:if>
                        <xsl:if test="rows/content/view/label/morada">
                          <li>
                            <span class="label">
                              <xsl:value-of select="rows/content/view/label/morada"/>:</span>
                            <xsl:value-of select="rows/content/view/value/morada"/>
                          </li>
                        </xsl:if>
                      </ul>
                    </div>
                  </div>
                </div><!-- END FORM VIEW --><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!-- START HIDDEN FILTER--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/><!-- END HIDDEN FILTER--><!-- START HIDDEN FORM--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- END HIDDEN FORM--><!-- START FORM--><!-- START SEPARADOR TAB--><xsl:apply-templates mode="workFlow_tab" select="rows/content/form/label"/><!-- END SEPARADOR TAB--><!--START TOOL BAR FROM--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar"/><!--END TOOL BAR FORM--><div class="box-content workFlow_tab"><div class="form_tab"><xsl:if test="rows/content/form/label/texto">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/texto"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/texto/@name}" value="{rows/content/form/value/texto}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/texto"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/textarea">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/textarea"/>
                        </span>
                        <textarea name="{rows/content/form/value/textarea/@name}" class="textarea" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/textarea"/>
                          </xsl:call-template>
                          <xsl:value-of select="rows/content/form/value/textarea"/>
                        </textarea>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/plaintext">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/plaintext"/>
                        </span>
                        <xsl:apply-templates mode="plaintext" select="rows/content/form/value/plaintext"/>
                      </label>
                    </xsl:if>
           </div><div id="iframe" class="workFlow_content">
        <xsl:if test="rows/content/form/label/iframe">
                      <xsl:if test="rows/content/form/label/iframe">
                        <xsl:call-template name="page-title">
                          <xsl:with-param name="title" select="rows/content/form/label/iframe"/>
                          <xsl:with-param name="class" select="'subtitle'"/>
                        </xsl:call-template>
                      </xsl:if>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/separador1">
                      <xsl:call-template name="simple_images">
                        <xsl:with-param name="img" select="rows/content/form/value/separador1"/>
                      </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/combomulti">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/combomulti"/>
                        </span>
                        <select name="{rows/content/form/list/combomulti/@name}" multiple="multiple" size="5" class="selectlist" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/combomulti"/>
                          </xsl:call-template>
                          <xsl:for-each select="rows/content/form/list/combomulti/option">
                            <option value="{value}">
                              <xsl:if test="@selected='true'">
                                <xsl:attribute name="selected">selected</xsl:attribute>
                              </xsl:if>
                              <xsl:value-of select="text"/>
                            </option>
                          </xsl:for-each>
                        </select>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/upload">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/upload"/>
                        </span>
                        <input type="file" name="{rows/content/form/value/upload/@name}" value="{rows/content/form/value/upload}" class="file" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/upload"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/texteditor">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/texteditor"/>
                        </span>
                        <xsl:call-template name="text-editor">
                          <xsl:with-param name="name" select="rows/content/form/value/texteditor/@name"/>
                          <xsl:with-param name="value" select="rows/content/form/value/texteditor"/>
                        </xsl:call-template>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/biometrico">
                      <xsl:if test="rows/content/form/label/biometrico">
                        <div rel="biometrico">
                          <xsl:call-template name="page-title">
                            <xsl:with-param name="title" select="rows/content/form/label/biometrico"/>
                            <xsl:with-param name="class" select="'subtitle'"/>
                          </xsl:call-template>
                          <xsl:apply-templates mode="fingerprint" select="rows/content/fingerprint">
                            <xsl:with-param name="view_only" select="'false'"/>
                          </xsl:apply-templates>
                        </div>
                      </xsl:if>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/biometrico_view">
                      <xsl:if test="rows/content/form/label/biometrico_view">
                        <div rel="biometrico_view">
                          <xsl:call-template name="page-title">
                            <xsl:with-param name="title" select="rows/content/form/label/biometrico_view"/>
                            <xsl:with-param name="class" select="'subtitle'"/>
                          </xsl:call-template>
                          <xsl:apply-templates mode="fingerprint" select="rows/content/fingerprint">
                            <xsl:with-param name="view_only" select="'true'"/>
                          </xsl:apply-templates>
                        </div>
                      </xsl:if>
                    </xsl:if>
           </div><div id="separador2" class="workFlow_content">
        <xsl:if test="rows/content/form/label/separador2">
                      <xsl:if test="rows/content/form/label/separador2">
                        <xsl:call-template name="page-title">
                          <xsl:with-param name="title" select="rows/content/form/label/separador2"/>
                          <xsl:with-param name="class" select="'subtitle'"/>
                        </xsl:call-template>
                      </xsl:if>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/teclado_az09">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/teclado_az09"/>
                        </span>
                        <xsl:call-template name="VirtualKeyBoard">
                          <xsl:with-param name="type" select="'vkb_aznum'"/>
                          <xsl:with-param name="rel" select="concat('teclado_az09_',position())"/>
                          <xsl:with-param name="input_type" select="'password'"/>
                          <xsl:with-param name="input_name" select="rows/content/form/value/teclado_az09/@name"/>
                        </xsl:call-template>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/teclado_09">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/teclado_09"/>
                        </span>
                        <xsl:call-template name="VirtualKeyBoard">
                          <xsl:with-param name="type" select="'vkb_num'"/>
                          <xsl:with-param name="rel" select="concat('teclado_09_',position())"/>
                          <xsl:with-param name="input_type" select="'password'"/>
                          <xsl:with-param name="input_name" select="rows/content/form/value/teclado_09/@name"/>
                        </xsl:call-template>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/separadorlista">
                      <xsl:if test="rows/content/form/label/separadorlista">
                        <div rel="separadorlista">
                          <div id="separadorlista">
                            <xsl:call-template name="page-title">
                              <xsl:with-param name="title" select="rows/content/form/label/separadorlista"/>
                              <xsl:with-param name="class" select="'subtitle'"/>
                            </xsl:call-template>
                          </div>
                          <xsl:call-template name="tools-bar-form-group">
                            <xsl:with-param name="rel" select="'separadorlista'"/>
                            <xsl:with-param name="class" select="'IGRP_addRow'"/>
                          </xsl:call-template>
                          <xsl:if test="rows/content/form/label/textolista1">
                            <label>
                              <span>(*)<xsl:value-of select="rows/content/form/label/textolista1"/>
                              </span>
                              <input type="text" name="{rows/content/form/value/textolista1/@name}" value="{rows/content/form/value/textolista1}" class="text required" maxlength="30" rel="F_separadorlista">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/textolista1"/>
                                </xsl:call-template>
                              </input>
                            </label>
                          </xsl:if>
                          <xsl:if test="rows/content/form/label/combolista1">
                            <label>
                              <span>
                                <xsl:value-of select="rows/content/form/label/combolista1"/>
                              </span>
                              <select name="{rows/content/form/list/combolista1/@name}" multiple="multiple" size="5" class="selectlist" maxlength="30" rel="F_separadorlista">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/combolista1"/>
                                </xsl:call-template>
                                <xsl:for-each select="rows/content/form/list/combolista1/option">
                                  <option value="{value}">
                                    <xsl:if test="@selected='true'">
                                      <xsl:attribute name="selected">selected</xsl:attribute>
                                    </xsl:if>
                                    <xsl:value-of select="text"/>
                                  </option>
                                </xsl:for-each>
                              </select>
                            </label>
                          </xsl:if>
                          <xsl:if test="rows/content/form/label/grupolista1">
                            <xsl:if test="rows/content/form/label/grupolista1">
                              <xsl:call-template name="page-title">
                                <xsl:with-param name="title" select="rows/content/form/label/grupolista1"/>
                                <xsl:with-param name="class" select="'subtitle'"/>
                              </xsl:call-template>
                            </xsl:if>
                          </xsl:if>
                          <xsl:if test="rows/content/form/label/checkboxlista1">
                            <label>
                              <span>
                                <xsl:value-of select="rows/content/form/label/checkboxlista1"/>
                              </span>
                              <input type="checkbox" name="{rows/content/form/value/checkboxlista1/@name}" value="1" class="checkbox" maxlength="30" rel="F_separadorlista">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/checkboxlista1"/>
                                </xsl:call-template>
                                <xsl:if test="rows/content/form/value/checkboxlista1='1'">
                                  <xsl:attribute name="checked">checked</xsl:attribute>
                                </xsl:if>
                              </input>
                            </label>
                          </xsl:if>
                          <xsl:if test="rows/content/form/label/linklista1">
                            <label>
                              <span>
                                <input type="text" name="p_linklista1" rel="F_separadorlista" style="display:none;"/>
                                <a href="{rows/content/form/value/linklista1}" class="_blank form_link" name="p_linklista1">
                                  <xsl:value-of select="rows/content/form/label/linklista1"/>
                                </a>
                              </span>
                            </label>
                          </xsl:if><!-- START TABELA LIST--><div class="simple-table" rel="DIV_separadorlista">
                            <table rel="T_separadorlista">
                              <thead>
                                <tr>
                                  <xsl:if test="rows/content/form/table/separadorlista/label/textolista1">
                                    <xsl:if test="not(rows/content/form/table/separadorlista/label/textolista1/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/separadorlista/label/textolista1"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/table/separadorlista/label/combolista1">
                                    <xsl:if test="not(rows/content/form/table/separadorlista/label/combolista1/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/separadorlista/label/combolista1"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/table/separadorlista/label/checkboxlista1">
                                    <xsl:if test="not(rows/content/form/table/separadorlista/label/checkboxlista1/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/separadorlista/label/checkboxlista1"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/table/separadorlista/label/linklista1">
                                    <xsl:if test="not(rows/content/form/table/separadorlista/label/linklista1/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/separadorlista/label/linklista1"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                  <th align="center" width="10"/>
                                  <th align="center" width="10"/>
                                </tr>
                              </thead>
                              <tbody>
                                <xsl:for-each select="rows/content/form/table/separadorlista/value/row[not(@total='yes')]">
                                  <xsl:variable name="pos" select="(position()+1) mod 2"/>
                                  <tr>
                                    <xsl:if test="textolista1">
                                      <xsl:if test="not(textolista1/@visible)">
                                        <td class="table_row{$pos}">
                                          <xsl:value-of select="textolista1_desc"/>
                                          <input type="hidden" name="p_textolista1_fk" value="{textolista1}"/>
                                          <input type="hidden" name="p_textolista1_fk_desc" value="{textolista1_desc}"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if test="textolista1/@visible = 'false'">
                                        <input type="hidden" name="p_textolista1_fk" value="{textolista1}"/>
                                        <input type="hidden" name="p_textolista1_fk_desc" value="{textolista1_desc}"/>
                                      </xsl:if>
                                    </xsl:if>
                                    <xsl:if test="combolista1">
                                      <xsl:if test="not(combolista1/@visible)">
                                        <td class="table_row{$pos}">
                                          <xsl:value-of select="combolista1_desc"/>
                                          <input type="hidden" name="p_combolista1_fk" value="{combolista1}"/>
                                          <input type="hidden" name="p_combolista1_fk_desc" value="{combolista1_desc}"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if test="combolista1/@visible = 'false'">
                                        <input type="hidden" name="p_combolista1_fk" value="{combolista1}"/>
                                        <input type="hidden" name="p_combolista1_fk_desc" value="{combolista1_desc}"/>
                                      </xsl:if>
                                    </xsl:if>
                                    <xsl:if test="checkboxlista1">
                                      <xsl:if test="not(checkboxlista1/@visible)">
                                        <td class="table_row{$pos}">
                                          <xsl:value-of select="checkboxlista1_desc"/>
                                          <input type="hidden" name="p_checkboxlista1_fk" value="{checkboxlista1}"/>
                                          <input type="hidden" name="p_checkboxlista1_fk_desc" value="{checkboxlista1_desc}"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if test="checkboxlista1/@visible = 'false'">
                                        <input type="hidden" name="p_checkboxlista1_fk" value="{checkboxlista1}"/>
                                        <input type="hidden" name="p_checkboxlista1_fk_desc" value="{checkboxlista1_desc}"/>
                                      </xsl:if>
                                    </xsl:if>
                                    <xsl:if test="linklista1">
                                      <xsl:if test="not(linklista1/@visible)">
                                        <td class="table_row{$pos}">
                                          <xsl:choose>
                                            <xsl:when test="linklista1 != ''">
                                              <a href="{linklista1}" class="_blank2" name="linklista1">
                                                <xsl:value-of select="linklista1_desc"/>
                                              </a>
                                            </xsl:when>
                                            <xsl:otherwise>
                                              <xsl:value-of select="linklista1_desc"/>
                                            </xsl:otherwise>
                                          </xsl:choose>
                                          <input type="hidden" name="p_linklista1_fk" value="{linklista1}"/>
                                          <input type="hidden" name="p_linklista1_fk_desc" value="{linklista1_desc}"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if test="linklista1/@visible = 'false'">
                                        <input type="hidden" name="p_linklista1_fk" value="{linklista1}"/>
                                        <input type="hidden" name="p_linklista1_fk_desc" value="{linklista1_desc}"/>
                                      </xsl:if>
                                    </xsl:if>
                                    <td align="center" width="10">
                                      <xsl:if test="not(@nodelete)">
                                        <img alt="apagar" src="{$path_tmpl}/img/icon/ctx-delete.png" rel="separadorlista" class="IGRP_delRow"/>
                                      </xsl:if>
                                    </td>
                                    <td align="center" width="10">
                                      <xsl:if test="not(@noupdate)">
                                        <img alt="editar" src="{$path_tmpl}/img/icon/edit.png" rel="separadorlista" class="IGRP_editRow"/>
                                      </xsl:if>
                                    </td>
                                    <input type="hidden" name="p_separadorlista_id" value="{separadorlista_id}"/>
                                  </tr>
                                </xsl:for-each>
                              </tbody>
                            </table>
                          </div><!-- END TABELA LIST--></div>
                      </xsl:if>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/lista">
                      <xsl:if test="rows/content/form/label/lista">
                        <div rel="lista">
                          <div id="lista">
                            <xsl:call-template name="page-title">
                              <xsl:with-param name="title" select="rows/content/form/label/lista"/>
                              <xsl:with-param name="class" select="'subtitle'"/>
                            </xsl:call-template>
                          </div><!-- START TABELA LIST--><div class="simple-table" rel="DIV_lista">
                            <table rel="T_lista">
                              <thead>
                                <tr>
                                  <xsl:if test="rows/content/form/table/lista/label/texto1">
                                    <xsl:if test="not(rows/content/form/table/lista/label/texto1/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/lista/label/texto1"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/table/lista/label/checkbox1">
                                    <xsl:if test="not(rows/content/form/table/lista/label/checkbox1/@visible)">
                                      <th class="checkbox">
                                        <input type="checkbox" name="p_checkbox1_all" class="IGRP_checkall"/>
                                        <xsl:value-of select="rows/content/form/table/lista/label/checkbox1"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/table/lista/label/radio1">
                                    <xsl:if test="not(rows/content/form/table/lista/label/radio1/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/lista/label/radio1"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                </tr>
                              </thead>
                              <tbody>
                                <xsl:for-each select="rows/content/form/table/lista/value/row[not(@total='yes')]">
                                  <xsl:variable name="pos" select="(position()+1) mod 2"/>
                                  <tr>
                                    <xsl:if test="texto1">
                                      <xsl:if test="not(texto1/@visible)">
                                        <td class="table_row{$pos}">
                                          <xsl:value-of select="texto1"/>
                                        </td>
                                      </xsl:if>
                                    </xsl:if>
                                    <xsl:if test="checkbox1">
                                      <xsl:if test="not(checkbox1/@visible)">
                                        <td class="table_row{$pos}">
                                          <xsl:if test="checkbox1 != '-0'">
                                            <input type="checkbox" name="p_checkbox1" value="{checkbox1}">
                                              <xsl:if test="checkbox1_check=checkbox1">
                                                <xsl:attribute name="checked">checked</xsl:attribute>
                                              </xsl:if>
                                            </input>
                                          </xsl:if>
                                          <xsl:value-of select="checkbox1_desc"/>
                                        </td>
                                      </xsl:if>
                                    </xsl:if>
                                    <xsl:if test="radio1">
                                      <xsl:if test="not(radio1/@visible)">
                                        <td class="table_row{$pos}">
                                          <xsl:if test="radio1 != '-0'">
                                            <input type="radio" name="p_radio1" value="{radio1}">
                                              <xsl:if test="radio1_check=radio1">
                                                <xsl:attribute name="checked">checked</xsl:attribute>
                                              </xsl:if>
                                            </input>
                                          </xsl:if>
                                          <xsl:value-of select="radio1_desc"/>
                                        </td>
                                      </xsl:if>
                                    </xsl:if>
                                    <input type="hidden" name="p_lista_id" value="{lista_id}"/>
                                  </tr>
                                </xsl:for-each>
                              </tbody>
                            </table>
                          </div><!-- END TABELA LIST--></div>
                      </xsl:if>
                    </xsl:if>
           </div><div id="separador3" class="workFlow_content">
        <xsl:if test="rows/content/form/label/separador3">
                      <xsl:if test="rows/content/form/label/separador3">
                        <xsl:call-template name="page-title">
                          <xsl:with-param name="title" select="rows/content/form/label/separador3"/>
                          <xsl:with-param name="class" select="'subtitle'"/>
                        </xsl:call-template>
                      </xsl:if>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/file1">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/file1"/>
                        </span>
                        <input type="file" name="{rows/content/form/value/file1/@name}" value="{rows/content/form/value/file1}" class="file" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/file1"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/separadordialog">
                      <xsl:if test="rows/content/form/label/separadordialog">
                        <div rel="separadordialog">
                          <div id="separadordialog">
                            <xsl:call-template name="page-title">
                              <xsl:with-param name="title" select="rows/content/form/label/separadordialog"/>
                              <xsl:with-param name="class" select="'subtitle'"/>
                            </xsl:call-template>
                          </div>
                          <xsl:call-template name="tools-bar-form-group">
                            <xsl:with-param name="rel" select="'separadordialog'"/>
                            <xsl:with-param name="class" select="'IGRP_addRow_diag'"/>
                          </xsl:call-template>
                          <div class="IGRP_overlay"/>
                          <div class="D_separadordialog IGRP_dialogbox">
                            <div class="IGRP_dialogboxTop">
                              <div class="close">
                                <img src="{$path_tmpl}/img/close-dialog.png" class="IGRP_btn_close" rel="separadordialog"/>
                              </div>
                              <xsl:call-template name="page-title">
                                <xsl:with-param name="title" select="rows/content/form/label/separadordialog"/>
                              </xsl:call-template>
                            </div>
                            <div class="IGRP_dialogboxCenter">
                              <xsl:if test="rows/content/form/label/texto2">
                                <label>
                                  <span>
                                    <xsl:value-of select="rows/content/form/label/texto2"/>
                                  </span>
                                  <input type="text" name="{rows/content/form/value/texto2/@name}" value="{rows/content/form/value/texto2}" class="text" maxlength="30" rel="F_separadordialog">
                                    <xsl:call-template name="FIELD_validator">
                                      <xsl:with-param name="field" select="rows/content/form/label/texto2"/>
                                    </xsl:call-template>
                                  </input>
                                </label>
                              </xsl:if>
                              <xsl:if test="rows/content/form/label/link2">
                                <label>
                                  <span>
                                    <input type="text" name="p_link2" rel="F_separadordialog" style="display:none;"/>
                                    <a href="{rows/content/form/value/link2}" class="_blank form_link" name="p_link2">
                                      <xsl:value-of select="rows/content/form/label/link2"/>
                                    </a>
                                  </span>
                                </label>
                              </xsl:if>
                              <xsl:if test="rows/content/form/label/combobox2">
                                <label>
                                  <span>
                                    <xsl:value-of select="rows/content/form/label/combobox2"/>
                                  </span>
                                  <select name="{rows/content/form/list/combobox2/@name}" class="select" maxlength="30" rel="F_separadordialog">
                                    <xsl:call-template name="FIELD_validator">
                                      <xsl:with-param name="field" select="rows/content/form/label/combobox2"/>
                                    </xsl:call-template>
                                    <xsl:for-each select="rows/content/form/list/combobox2/option">
                                      <option value="{value}">
                                        <xsl:if test="@selected='true'">
                                          <xsl:attribute name="selected">selected</xsl:attribute>
                                        </xsl:if>
                                        <xsl:value-of select="text"/>
                                      </option>
                                    </xsl:for-each>
                                  </select>
                                </label>
                              </xsl:if>
                            </div>
                            <div class="dialog_btnContainer">
                              <input type="button" class="IGRP_row_confirm" value="Confirmar" rel="separadordialog"/>
                              <input type="button" class="IGRP_row_confirmClose" value="Confirmar e Fechar" rel="separadordialog"/>
                            </div>
                          </div><!-- START TABELA LIST--><div class="simple-table" rel="DIV_separadordialog">
                            <table rel="T_separadordialog">
                              <thead>
                                <tr>
                                  <xsl:if test="rows/content/form/table/separadordialog/label/texto2">
                                    <xsl:if test="not(rows/content/form/table/separadordialog/label/texto2/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/separadordialog/label/texto2"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/table/separadordialog/label/link2">
                                    <xsl:if test="not(rows/content/form/table/separadordialog/label/link2/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/separadordialog/label/link2"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/table/separadordialog/label/combobox2">
                                    <xsl:if test="not(rows/content/form/table/separadordialog/label/combobox2/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/separadordialog/label/combobox2"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                  <th align="center" width="10"/>
                                  <th align="center" width="10"/>
                                </tr>
                              </thead>
                              <tbody>
                                <xsl:for-each select="rows/content/form/table/separadordialog/value/row[not(@total='yes')]">
                                  <xsl:variable name="pos" select="(position()+1) mod 2"/>
                                  <tr>
                                    <xsl:if test="texto2">
                                      <xsl:if test="not(texto2/@visible)">
                                        <td class="table_row{$pos}">
                                          <xsl:value-of select="texto2_desc"/>
                                          <input type="hidden" name="p_texto2_fk" value="{texto2}"/>
                                          <input type="hidden" name="p_texto2_fk_desc" value="{texto2_desc}"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if test="texto2/@visible = 'false'">
                                        <input type="hidden" name="p_texto2_fk" value="{texto2}"/>
                                        <input type="hidden" name="p_texto2_fk_desc" value="{texto2_desc}"/>
                                      </xsl:if>
                                    </xsl:if>
                                    <xsl:if test="link2">
                                      <xsl:if test="not(link2/@visible)">
                                        <td class="table_row{$pos}">
                                          <xsl:choose>
                                            <xsl:when test="link2 != ''">
                                              <a href="{link2}" class="_blank2" name="link2">
                                                <xsl:value-of select="link2_desc"/>
                                              </a>
                                            </xsl:when>
                                            <xsl:otherwise>
                                              <xsl:value-of select="link2_desc"/>
                                            </xsl:otherwise>
                                          </xsl:choose>
                                          <input type="hidden" name="p_link2_fk" value="{link2}"/>
                                          <input type="hidden" name="p_link2_fk_desc" value="{link2_desc}"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if test="link2/@visible = 'false'">
                                        <input type="hidden" name="p_link2_fk" value="{link2}"/>
                                        <input type="hidden" name="p_link2_fk_desc" value="{link2_desc}"/>
                                      </xsl:if>
                                    </xsl:if>
                                    <xsl:if test="combobox2">
                                      <xsl:if test="not(combobox2/@visible)">
                                        <td class="table_row{$pos}">
                                          <xsl:value-of select="combobox2_desc"/>
                                          <input type="hidden" name="p_combobox2_fk" value="{combobox2}"/>
                                          <input type="hidden" name="p_combobox2_fk_desc" value="{combobox2_desc}"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if test="combobox2/@visible = 'false'">
                                        <input type="hidden" name="p_combobox2_fk" value="{combobox2}"/>
                                        <input type="hidden" name="p_combobox2_fk_desc" value="{combobox2_desc}"/>
                                      </xsl:if>
                                    </xsl:if>
                                    <td align="center" width="10">
                                      <xsl:if test="not(@nodelete)">
                                        <img alt="apagar" src="{$path_tmpl}/img/icon/ctx-delete.png" rel="separadordialog" class="IGRP_delRow_diag"/>
                                      </xsl:if>
                                    </td>
                                    <td align="center" width="10">
                                      <xsl:if test="not(@noupdate)">
                                        <img alt="editar" src="{$path_tmpl}/img/icon/edit.png" rel="separadordialog" class="IGRP_editRow_diag"/>
                                      </xsl:if>
                                    </td>
                                    <input type="hidden" name="p_separadordialog_id" value="{separadordialog_id}"/>
                                  </tr>
                                </xsl:for-each>
                              </tbody>
                            </table>
                          </div><!-- END TABELA LIST--></div>
                      </xsl:if>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/formlista">
                      <div rel="formlista">
                        <div id="formlista">
                          <xsl:call-template name="page-title">
                            <xsl:with-param name="title" select="rows/content/form/label/formlista"/>
                            <xsl:with-param name="class" select="'subtitle'"/>
                          </xsl:call-template>
                        </div><!-- START FORM LIST--><div class="simple-table" rel="DIV_formlista">
                          <table class="editable-table" rel="T_formlista">
                            <thead>
                              <tr>
                                <xsl:if test="rows/content/form/table/formlista/label/textoform1">
                                  <xsl:if test="not(rows/content/form/table/formlista/label/textoform1/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/formlista/label/textoform1"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/formlista/label/texteditorform1">
                                  <xsl:if test="not(rows/content/form/table/formlista/label/texteditorform1/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/formlista/label/texteditorform1"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/formlista/label/textareaform1">
                                  <xsl:if test="not(rows/content/form/table/formlista/label/textareaform1/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/formlista/label/textareaform1"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/formlista/label/comboboxform1">
                                  <xsl:if test="not(rows/content/form/table/formlista/label/comboboxform1/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/formlista/label/comboboxform1"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/formlista/label/uploadform1">
                                  <xsl:if test="not(rows/content/form/table/formlista/label/uploadform1/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/formlista/label/uploadform1"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/formlista/label/dataform1">
                                  <xsl:if test="not(rows/content/form/table/formlista/label/dataform1/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/formlista/label/dataform1"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/formlista/label/pesquisaform1">
                                  <xsl:if test="not(rows/content/form/table/formlista/label/pesquisaform1/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/formlista/label/pesquisaform1"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/formlista/label/listaradioform1">
                                  <xsl:if test="not(rows/content/form/table/formlista/label/listaradioform1/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/formlista/label/listaradioform1"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/formlista/label/listacheckboxform1">
                                  <xsl:if test="not(rows/content/form/table/formlista/label/listacheckboxform1/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/formlista/label/listacheckboxform1"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/formlista/label/checboxform1">
                                  <xsl:if test="not(rows/content/form/table/formlista/label/checboxform1/@visible)">
                                    <th class="checkbox">
                                      <input type="checkbox" name="p_checboxform1_all" class="IGRP_checkall"/>
                                      <xsl:value-of select="rows/content/form/table/formlista/label/checboxform1"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/formlista/label/pesquisabiform1">
                                  <xsl:if test="not(rows/content/form/table/formlista/label/pesquisabiform1/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/formlista/label/pesquisabiform1"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/formlista/label/tecladoform1">
                                  <xsl:if test="not(rows/content/form/table/formlista/label/tecladoform1/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/formlista/label/tecladoform1"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="not(@nodelete)">
                                  <th align="center" width="10">
                                    <img alt="adicionar" src="{$path_tmpl}/img/icon/tools-bar/add.png" rel="formlista" class="IGRP_addRow_form"/>
                                  </th>
                                </xsl:if>
                              </tr>
                            </thead>
                            <tbody>
                              <xsl:for-each select="rows/content/form/table/formlista/value/row[not(@total='yes')]">
                                <xsl:variable name="pos" select="(position()+1) mod 2"/>
                                <tr>
                                  <xsl:if test="textoform1">
                                    <xsl:if test="not(textoform1/@visible)">
                                      <td class="table_row{$pos}">
                                        <input type="hidden" name="p_textoform1_fk_desc" value="{textoform1_desc}"/>
                                        <xsl:value-of select="textoform1_desc"/>
                                        <input type="hidden" name="p_textoform1_fk" value="{textoform1}"/>
                                      </td>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="texteditorform1">
                                    <xsl:if test="not(texteditorform1/@visible)">
                                      <td class="table_row{$pos}">
                                        <input type="hidden" name="p_texteditorform1_fk_desc" value="{texteditorform1_desc}"/>
                                        <input type="texteditor" name="{../../label/texteditorform1/@name}_fk" value="{texteditorform1}" class="texteditor" maxlength="30" rel="F_formlista">
                                          <xsl:call-template name="FIELD_validator">
                                            <xsl:with-param name="field" select="../../label/texteditorform1"/>
                                          </xsl:call-template>
                                        </input>
                                      </td>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="textareaform1">
                                    <xsl:if test="not(textareaform1/@visible)">
                                      <td class="table_row{$pos}">
                                        <input type="hidden" name="p_textareaform1_fk_desc" value="{textareaform1_desc}"/>
                                        <textarea name="{../../label/textareaform1/@name}_fk" class="textarea" maxlength="30" rel="F_formlista">
                                          <xsl:call-template name="FIELD_validator">
                                            <xsl:with-param name="field" select="../../label/textareaform1"/>
                                          </xsl:call-template>
                                          <xsl:value-of select="textareaform1"/>
                                        </textarea>
                                      </td>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="comboboxform1">
                                    <xsl:if test="not(comboboxform1/@visible)">
                                      <td class="table_row{$pos}">
                                        <input type="hidden" name="p_comboboxform1_fk_desc" value="{comboboxform1_desc}"/>
                                        <select name="{../../../../list/comboboxform1/@name}_fk" class="select" maxlength="30" rel="F_formlista">
                                          <xsl:call-template name="FIELD_validator">
                                            <xsl:with-param name="field" select="../../label/comboboxform1"/>
                                          </xsl:call-template>
                                          <xsl:variable name="v_comboboxform1" select="comboboxform1"/>
                                          <xsl:for-each select="../../../../list/comboboxform1/option">
                                            <option value="{value}">
                                              <xsl:if test="$v_comboboxform1 = value">
                                                <xsl:attribute name="selected">selected</xsl:attribute>
                                              </xsl:if>
                                              <xsl:value-of select="text"/>
                                            </option>
                                          </xsl:for-each>
                                        </select>
                                      </td>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="uploadform1">
                                    <xsl:if test="not(uploadform1/@visible)">
                                      <td class="table_row{$pos}">
                                        <input type="hidden" name="p_uploadform1_fk_desc" value="{uploadform1_desc}"/>
                                        <input type="file" name="{../../label/uploadform1/@name}_fk" value="{uploadform1}" class="file" maxlength="30" rel="F_formlista">
                                          <xsl:call-template name="FIELD_validator">
                                            <xsl:with-param name="field" select="../../label/uploadform1"/>
                                          </xsl:call-template>
                                        </input>
                                      </td>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="dataform1">
                                    <xsl:if test="not(dataform1/@visible)">
                                      <td class="table_row{$pos}">
                                        <input type="hidden" name="p_dataform1_fk_desc" value="{dataform1_desc}"/>
                                        <input type="text" name="{../../label/dataform1/@name}_fk" value="{dataform1}" class="date IGRP_datepicker" maxlength="30" rel="F_formlista">
                                          <xsl:call-template name="FIELD_validator">
                                            <xsl:with-param name="field" select="../../label/dataform1"/>
                                          </xsl:call-template>
                                        </input>
                                      </td>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="pesquisaform1">
                                    <xsl:if test="not(pesquisaform1/@visible)">
                                      <td class="table_row{$pos}">
                                        <input type="hidden" name="p_pesquisaform1_fk_desc" value="{pesquisaform1_desc}"/>
                                        <input type="LOOKUP" name="{../../label/pesquisaform1/@name}_fk" value="{pesquisaform1}" class="LOOKUP" maxlength="30" rel="F_formlista">
                                          <xsl:call-template name="FIELD_validator">
                                            <xsl:with-param name="field" select="../../label/pesquisaform1"/>
                                          </xsl:call-template>
                                        </input>
                                        <xsl:call-template name="lookup-tool">
                                          <xsl:with-param name="page" select="rows/page"/>
                                          <xsl:with-param name="ad_hoc" select="'1'"/>
                                          <xsl:with-param name="action" select="'LOOKUP'"/>
                                          <xsl:with-param name="name" select="concat(../../label/pesquisaform1/@name,'_fk')"/>
                                          <xsl:with-param name="js_lookup" select="../../../../lookup/pesquisaform1"/>
                                        </xsl:call-template>
                                      </td>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="listaradioform1">
                                    <xsl:if test="not(listaradioform1/@visible)">
                                      <td class="table_row{$pos}">
                                        <input type="hidden" name="p_listaradioform1_fk_desc" value="{listaradioform1_desc}"/>
                                        <select name="{../../../../list/listaradioform1/@name}_fk" class="radiolist" maxlength="30" rel="F_formlista">
                                          <xsl:call-template name="FIELD_validator">
                                            <xsl:with-param name="field" select="../../../label/listaradioform1"/>
                                          </xsl:call-template>
                                          <xsl:variable name="v_listaradioform1" select="listaradioform1"/>
                                          <xsl:for-each select="../../../../list/listaradioform1/option">
                                            <option value="{value}">
                                              <xsl:if test="$v_listaradioform1 = value">
                                                <xsl:attribute name="selected">selected</xsl:attribute>
                                              </xsl:if>
                                              <xsl:value-of select="text"/>
                                            </option>
                                          </xsl:for-each>
                                        </select>
                                      </td>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="listacheckboxform1">
                                    <xsl:if test="not(listacheckboxform1/@visible)">
                                      <td class="table_row{$pos}">
                                        <input type="hidden" name="p_listacheckboxform1_fk_desc" value="{listacheckboxform1_desc}"/>
                                        <select name="{../../../../list/listacheckboxform1/@name}_fk" class="checkboxlist" maxlength="30" rel="F_formlista">
                                          <xsl:call-template name="FIELD_validator">
                                            <xsl:with-param name="field" select="../../label/listacheckboxform1"/>
                                          </xsl:call-template>
                                          <xsl:variable name="v_listacheckboxform1" select="listacheckboxform1"/>
                                          <xsl:for-each select="../../../../list/listacheckboxform1/option">
                                            <option value="{value}">
                                              <xsl:if test="$v_listacheckboxform1 = value">
                                                <xsl:attribute name="selected">selected</xsl:attribute>
                                              </xsl:if>
                                              <xsl:value-of select="text"/>
                                            </option>
                                          </xsl:for-each>
                                        </select>
                                      </td>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="checboxform1">
                                    <xsl:if test="not(checboxform1/@visible)">
                                      <td class="table_row{$pos}">
                                        <input type="hidden" name="p_checboxform1_fk_desc" value="{checboxform1_desc}"/>
                                        <xsl:if test="checboxform1 != '-0'">
                                          <input type="checkbox" name="{../../label/checboxform1/@name}_fk" value="{checboxform1}" class="checkbox" maxlength="30" rel="F_formlista">
                                            <xsl:call-template name="FIELD_validator">
                                              <xsl:with-param name="field" select="../../label/checboxform1"/>
                                            </xsl:call-template>
                                            <xsl:if test="checboxform1_check= checboxform1">
                                              <xsl:attribute name="checked">checked</xsl:attribute>
                                            </xsl:if>
                                          </input>
                                        </xsl:if>
                                      </td>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="pesquisabiform1">
                                    <xsl:if test="not(pesquisabiform1/@visible)">
                                      <td class="table_row{$pos}">
                                        <input type="hidden" name="p_pesquisabiform1_fk_desc" value="{pesquisabiform1_desc}"/>
                                        <input type="LOOKUP_BI" name="{../../label/pesquisabiform1/@name}_fk" value="{pesquisabiform1}" class="LOOKUP_BI" maxlength="30" rel="F_formlista">
                                          <xsl:call-template name="FIELD_validator">
                                            <xsl:with-param name="field" select="../../label/pesquisabiform1"/>
                                          </xsl:call-template>
                                        </input>
                                        <xsl:call-template name="lookup-tool">
                                          <xsl:with-param name="page" select="'LOOKUP'"/>
                                          <xsl:with-param name="action" select="'LOOKUP_BI'"/>
                                          <xsl:with-param name="name" select="concat(../../label/pesquisabiform1/@name,'_fk')"/>
                                          <xsl:with-param name="js_lookup" select="../../../../lookup/pesquisabiform1"/>
                                        </xsl:call-template>
                                      </td>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="tecladoform1">
                                    <xsl:if test="not(tecladoform1/@visible)">
                                      <td class="table_row{$pos}">
                                        <input type="hidden" name="p_tecladoform1_fk_desc" value="{tecladoform1_desc}"/>
                                        <xsl:call-template name="VirtualKeyBoard">
                                          <xsl:with-param name="type" select="'vkb_num'"/>
                                          <xsl:with-param name="rel" select="concat('tecladoform1_',position())"/>
                                          <xsl:with-param name="input_type" select="'password'"/>
                                          <xsl:with-param name="input_name" select="concat(../../label/tecladoform1/@name,'_fk')"/>
                                        </xsl:call-template>
                                      </td>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="not(@nodelete)">
                                    <td align="center" width="10">
                                      <img alt="apagar" src="{$path_tmpl}/img/icon/ctx-delete.png" class="IGRP_delRow_form" rel="formlista"/>
                                    </td>
                                  </xsl:if>
                                  <input type="hidden" name="p_formlista_id" value="{formlista_id}"/>
                                </tr>
                              </xsl:for-each>
                            </tbody>
                          </table>
                        </div><!-- END FORM LIST--></div>
                    </xsl:if>
           </div><div id="linkform1" class="workFlow_content">
        <xsl:if test="rows/content/form/label/linkform1">
                      <xsl:if test="rows/content/form/label/linkform1">
                        <xsl:call-template name="page-title">
                          <xsl:with-param name="title" select="rows/content/form/label/linkform1"/>
                          <xsl:with-param name="class" select="'subtitle'"/>
                        </xsl:call-template>
                      </xsl:if>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/zeguimoko123">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/zeguimoko123"/>
                        </span>
                        <xsl:for-each select="rows/content/form/list/zeguimoko123/option">
                          <input type="checkbox" name="{../@name}" value="{value}" class="checkboxlist" maxlength="30">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/form/label/zeguimoko123"/>
                            </xsl:call-template>
                            <xsl:if test="@selected='true'">
                              <xsl:attribute name="checked">checked</xsl:attribute>
                            </xsl:if>
                          </input>
                          <xsl:value-of select="text"/>
                          <br/>
                        </xsl:for-each>
                      </label>
                    </xsl:if></div></div><!-- END FORM--><!-- START FILTER--><div class="box-content">
                    <xsl:if test="rows/content/filter/label/texto">
                      <label>
                        <span>(*)<xsl:value-of select="rows/content/filter/label/texto"/>
                        </span>
                        <input type="text" name="{rows/content/filter/value/texto/@name}" value="{rows/content/filter/value/texto}" class="text required IGRP_change" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/texto"/>
                          </xsl:call-template>
                        </input>
                        <a id="idp_texto"/>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/filter/label/pesquisa_bi">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/filter/label/pesquisa_bi"/>
                        </span>
                        <input type="LOOKUP_NIF" name="{rows/content/filter/value/pesquisa_bi/@name}" value="{rows/content/filter/value/pesquisa_bi}" class="LOOKUP_NIF" readonly="readonly" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/pesquisa_bi"/>
                          </xsl:call-template>
                        </input>
                        <xsl:call-template name="lookup-tool">
                          <xsl:with-param name="page" select="'LOOKUP'"/>
                          <xsl:with-param name="action" select="'LOOKUP_NIF'"/>
                          <xsl:with-param name="name" select="rows/content/filter/value/pesquisa_bi/@name"/>
                          <xsl:with-param name="js_lookup" select="rows/content/filter/lookup/pesquisa_bi"/>
                        </xsl:call-template>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/filter/label/pesquisa">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/filter/label/pesquisa"/>
                        </span>
                        <input type="LOOKUP" name="{rows/content/filter/value/pesquisa/@name}" value="{rows/content/filter/value/pesquisa}" class="LOOKUP" disabled="disabled" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/pesquisa"/>
                          </xsl:call-template>
                        </input>
                        <xsl:call-template name="lookup-tool">
                          <xsl:with-param name="page" select="rows/page"/>
                          <xsl:with-param name="ad_hoc" select="'1'"/>
                          <xsl:with-param name="action" select="'LOOKUP'"/>
                          <xsl:with-param name="name" select="rows/content/filter/value/pesquisa/@name"/>
                          <xsl:with-param name="js_lookup" select="rows/content/filter/lookup/pesquisa"/>
                        </xsl:call-template>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/filter/label/combobox">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/filter/label/combobox"/>
                        </span>
                        <select name="{rows/content/filter/list/combobox/@name}" class="select" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/combobox"/>
                          </xsl:call-template>
                          <xsl:for-each select="rows/content/filter/list/combobox/option">
                            <option value="{value}">
                              <xsl:if test="@selected='true'">
                                <xsl:attribute name="selected">selected</xsl:attribute>
                              </xsl:if>
                              <xsl:value-of select="text"/>
                            </option>
                          </xsl:for-each>
                        </select>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/filter/label/comboboxchange">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/filter/label/comboboxchange"/>
                        </span>
                        <select name="{rows/content/filter/list/comboboxchange/@name}" class="selectchange IGRP_change" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/comboboxchange"/>
                          </xsl:call-template>
                          <xsl:for-each select="rows/content/filter/list/comboboxchange/option">
                            <option value="{value}">
                              <xsl:if test="@selected='true'">
                                <xsl:attribute name="selected">selected</xsl:attribute>
                              </xsl:if>
                              <xsl:value-of select="text"/>
                            </option>
                          </xsl:for-each>
                        </select>
                        <a id="idp_comboboxchange"/>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/filter/label/data">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/filter/label/data"/>
                        </span>
                        <input type="text" name="{rows/content/filter/value/data/@name}" value="{rows/content/filter/value/data}" class="date IGRP_datepicker" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/data"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/filter/label/email">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/filter/label/email"/>
                        </span>
                        <input type="email" name="{rows/content/filter/value/email/@name}" value="{rows/content/filter/value/email}" class="email" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/email"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/filter/label/link">
                      <label>
                        <span>
                          <a href="{rows/content/filter/value/link}" class="_blank form_link" name="p_link">
                            <xsl:value-of select="rows/content/filter/label/link"/>
                          </a>
                        </span>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/filter/label/listaradio">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/filter/label/listaradio"/>
                        </span>
                        <xsl:for-each select="rows/content/filter/list/listaradio/option">
                          <input type="radio" name="{../@name}" value="{value}" class="radiolist" maxlength="30">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="../../../label/listaradio"/>
                            </xsl:call-template>
                            <xsl:if test="@selected='true'">
                              <xsl:attribute name="checked">checked</xsl:attribute>
                            </xsl:if>
                          </input>
                          <xsl:value-of select="text"/>
                          <br/>
                        </xsl:for-each>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/filter/label/numero">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/filter/label/numero"/>
                        </span>
                        <input type="number" name="{rows/content/filter/value/numero/@name}" value="{rows/content/filter/value/numero}" class="number" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/numero"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
           </div><div id="separador" class="workFlow_content">
        <xsl:if test="rows/content/filter/label/separador">
                      <xsl:if test="rows/content/filter/label/separador">
                        <xsl:call-template name="page-title">
                          <xsl:with-param name="title" select="rows/content/filter/label/separador"/>
                          <xsl:with-param name="class" select="'subtitle'"/>
                        </xsl:call-template>
                      </xsl:if>
                    </xsl:if>
                    <xsl:if test="rows/content/filter/label/checkbox">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/filter/label/checkbox"/>
                        </span>
                        <input type="checkbox" name="{rows/content/filter/value/checkbox/@name}" value="1" class="checkbox" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/checkbox"/>
                          </xsl:call-template>
                          <xsl:if test="rows/content/filter/value/checkbox='1'">
                            <xsl:attribute name="checked">checked</xsl:attribute>
                          </xsl:if>
                        </input>
                      </label>
                    </xsl:if><!--START TOOL BAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar"/><!--END TOOL BAR FILTER--></div><!-- END FILTER--><!--START TOOL BAR TABLE--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar"/><!--END TOOL BAR TABLE--><xsl:call-template name="filter-az">
                    <xsl:with-param name="name" select="rows/content/filter/value/filteraz/@name"/>
                    <xsl:with-param name="value" select="rows/content/filter/value/filteraz"/>
                    <xsl:with-param name="type" select="'filter_az'"/>
                  </xsl:call-template>
                  <xsl:call-template name="filter-az">
                    <xsl:with-param name="name" select="rows/content/filter/value/filter09/@name"/>
                    <xsl:with-param name="value" select="rows/content/filter/value/filter09"/>
                    <xsl:with-param name="type" select="'filter_num'"/>
                  </xsl:call-template>
                  <xsl:call-template name="filter-az">
                    <xsl:with-param name="name" select="rows/content/filter/value/filteraz09/@name"/>
                    <xsl:with-param name="value" select="rows/content/filter/value/filteraz09"/>
                    <xsl:with-param name="type" select="'filter_aznum'"/>
                  </xsl:call-template><!-- START TABELA--><!--  CONTEXT-MENU  --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu"/>
                  <div class="table">
                    <table class="sortable IGRP_table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/texto">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/texto"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/link">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/link"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/pesquisa">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/pesquisa"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/total">
                            <th align="right">
                              <xsl:value-of select="rows/content/table/label/total"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/cor">
                            <th align="center">
                              <xsl:value-of select="rows/content/table/label/cor"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/checkbox">
                            <th class="checkbox sorttable_nosort" align="center">
                              <input type="checkbox" name="p_checkbox_all" class="IGRP_checkall"/>
                              <xsl:value-of select="rows/content/table/label/checkbox"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/radio">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/radio"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/checbox1">
                            <th class="checkbox sorttable_nosort" align="center">
                              <input type="checkbox" name="p_checbox1_all" class="IGRP_checkall"/>
                              <xsl:value-of select="rows/content/table/label/checbox1"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <xsl:variable name="pos" select="(position()+1) mod 2"/>
                          <tr class="IGRP_contextMenu">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="texto">
                              <td align="left" class="table_row{$pos}">
                                <xsl:value-of select="texto"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="link">
                              <td align="left" class="table_row{$pos}">
                                <xsl:choose>
                                  <xsl:when test="link != ''">
                                    <a href="{link}" class="_blank">
                                      <xsl:value-of select="link_desc"/>
                                    </a>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <xsl:value-of select="link_desc"/>
                                  </xsl:otherwise>
                                </xsl:choose>
                              </td>
                            </xsl:if>
                            <xsl:if test="pesquisa">
                              <td align="left" class="table_row{$pos}">
                                <u class="IGRP_lookup" title="Passa Valor">
                                  <xsl:value-of select="pesquisa"/>
                                </u>
                              </td>
                            </xsl:if>
                            <xsl:if test="total">
                              <td align="right" class="table_row{$pos}">
                                <xsl:value-of select="total"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="cor">
                              <td align="center" class="table_row{$pos}">
                                <xsl:call-template name="color_td">
                                  <xsl:with-param name="color" select="cor"/>
                                </xsl:call-template>
                              </td>
                            </xsl:if>
                            <xsl:if test="checkbox">
                              <td align="" class="table_row{$pos}">
                                <xsl:if test="checkbox != '-0'">
                                  <input type="checkbox" name="p_checkbox" value="{checkbox}">
                                    <xsl:if test="checkbox_check=checkbox">
                                      <xsl:attribute name="checked">checked</xsl:attribute>
                                    </xsl:if>
                                  </input>
                                </xsl:if>
                                <xsl:value-of select="checkbox_desc"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="radio">
                              <td align="" class="table_row{$pos}">
                                <xsl:if test="radio != '-0'">
                                  <input type="radio" name="p_radio" value="{radio}">
                                    <xsl:if test="radio_check=radio">
                                      <xsl:attribute name="checked">checked</xsl:attribute>
                                    </xsl:if>
                                  </input>
                                </xsl:if>
                                <xsl:value-of select="radio_desc"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="checbox1">
                              <td align="" class="table_row{$pos}">
                                <xsl:if test="checbox1 != '-0'">
                                  <input type="checkbox" name="p_checbox1" value="{checbox1}">
                                    <xsl:if test="checbox1_check=checbox1">
                                      <xsl:attribute name="checked">checked</xsl:attribute>
                                    </xsl:if>
                                  </input>
                                </xsl:if>
                                <xsl:value-of select="checbox1_desc"/>
                              </td>
                            </xsl:if>
                          </tr>
                        </xsl:for-each>
                      </tbody>
                      <tfoot>
                        <tr>
                          <xsl:if test="rows/content/table/label/texto">
                            <td align="left">
                              <xsl:value-of select="rows/content/table/value/row[@total='yes']/texto"/>
                            </td>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/link">
                            <td align="left">
                              <xsl:value-of select="rows/content/table/value/row[@total='yes']/link"/>
                            </td>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/pesquisa">
                            <td align="left">
                              <xsl:value-of select="rows/content/table/value/row[@total='yes']/pesquisa"/>
                            </td>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/total">
                            <td align="right">
                              <xsl:value-of select="rows/content/table/value/row[@total='yes']/total"/>
                            </td>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/cor">
                            <td align="center">
                              <xsl:value-of select="rows/content/table/value/row[@total='yes']/cor"/>
                            </td>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/checkbox">
                            <td align="">
                              <xsl:value-of select="rows/content/table/value/row[@total='yes']/checkbox"/>
                            </td>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/radio">
                            <td align="">
                              <xsl:value-of select="rows/content/table/value/row[@total='yes']/radio"/>
                            </td>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/checbox1">
                            <td align="">
                              <xsl:value-of select="rows/content/table/value/row[@total='yes']/checbox1"/>
                            </td>
                          </xsl:if>
                        </tr>
                      </tfoot>
                    </table><!-- LEGENDA TABELA  --><xsl:apply-templates mode="legend_color" select="rows/content/table/legend_color"/>
                  </div><!-- END TABELA--></form>
                <xsl:if test="rows/content/grafico_2"><!-- START CHARTS--><div class="graph-box">
                    <xsl:call-template name="page-title">
                      <xsl:with-param name="title" select="rows/content/grafico_2/caption"/>
                      <xsl:with-param name="class" select="'subtitle'"/>
                    </xsl:call-template>
                    <xsl:call-template name="igrp-graph">
                      <xsl:with-param name="table" select="rows/content/grafico_2"/>
                      <xsl:with-param name="chart_type" select="rows/content/grafico_2/chart_type"/>
                      <xsl:with-param name="width" select="273"/>
                      <xsl:with-param name="height" select="150"/>
                    </xsl:call-template>
                  </div><!-- END CHARTS--></xsl:if>
                <xsl:if test="rows/content/grafico_3"><!-- START CHARTS--><div class="graph-box">
                    <xsl:call-template name="page-title">
                      <xsl:with-param name="title" select="rows/content/grafico_3/caption"/>
                      <xsl:with-param name="class" select="'subtitle'"/>
                    </xsl:call-template>
                    <xsl:call-template name="igrp-graph">
                      <xsl:with-param name="table" select="rows/content/grafico_3"/>
                      <xsl:with-param name="chart_type" select="rows/content/grafico_3/chart_type"/>
                      <xsl:with-param name="width" select="273"/>
                      <xsl:with-param name="height" select="150"/>
                    </xsl:call-template>
                  </div><!-- END CHARTS--></xsl:if></div><div class="right-1"><!-- START LATERAL MENU  --><xsl:apply-templates mode="lateral-menu" select="rows/content/menu"/><!-- END LATERAL MENU  --><xsl:if test="rows/content/grafico_1"><!-- START CHARTS--><div class="graph-box">
                      <xsl:call-template name="page-title">
                        <xsl:with-param name="title" select="rows/content/grafico_1/caption"/>
                        <xsl:with-param name="class" select="'subtitle'"/>
                      </xsl:call-template>
                      <xsl:call-template name="igrp-graph">
                        <xsl:with-param name="table" select="rows/content/grafico_1"/>
                        <xsl:with-param name="chart_type" select="rows/content/grafico_1/chart_type"/>
                        <xsl:with-param name="width" select="273"/>
                        <xsl:with-param name="height" select="150"/>
                      </xsl:call-template>
                    </div><!-- END CHARTS--></xsl:if>
                </div><!-- END YOUR CODE HERE --></div>
            </div><!-- START HOME BOTTOM --><xsl:call-template name="home-side"/>
          </div>
        </div><!--HOME-FOOTER--></body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20140130"/>
  <xsl:include href="../../xsl/tmpl/IGRP-lateral-menu.tmpl.xsl?v=20140130"/>
  <xsl:include href="../../xsl/tmpl/IGRP-JSvalidation.tmpl.xsl?v=20140130"/>
  <xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=20140130"/>
  <xsl:include href="../../xsl/tmpl/IGRP-others.tmpl.xsl?v=20140130"/>
  <xsl:include href="../../xsl/tmpl/IGRP-form-text-editor.tmpl.xsl?v=20140130"/>
  <xsl:include href="../../xsl/tmpl/IGRP-workFlow.tmpl.xsl?v=20140130"/>
  <xsl:include href="../../xsl/tmpl/IGRP-virtualkeyboard.tmpl.xsl?v=20140130"/>
  <xsl:include href="../../xsl/tmpl/IGRP-dados_biometricos.tmpl.xsl?v=20140130"/>
</xsl:stylesheet>
