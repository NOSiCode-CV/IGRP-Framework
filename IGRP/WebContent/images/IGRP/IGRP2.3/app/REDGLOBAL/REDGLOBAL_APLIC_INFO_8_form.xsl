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
                <xsl:if test="rows/content/form/label/env_fk"/><!-- INICIO SEPARADOR suport_item--><xsl:if test="rows/content/form/label/suport_item">
                  <div class="box-content resetPadding" sep-name="suport_item">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/suport_item"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="col" group-name="suport_item">
                        <xsl:if test="rows/content/form/label/title">
                          <div class="col-1-4 item" item-name="title">
                            <div class="igrp_item text">
                              <label>
                                <xsl:value-of select="rows/content/form/label/title" disable-output-escaping="yes"/>
                              </label>
                              <input type="text" name="{rows/content/form/value/title/@name}" value="{rows/content/form/value/title}" class="text" maxlength="50" rel="F_suport_item">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/title"/>
                                </xsl:call-template>
                              </input>
                              <div class="_clear"/>
                            </div>
                            <div class="_clear"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/description">
                          <div class="col-1-4 item" item-name="description">
                            <div class="igrp_item textarea">
                              <label>
                                <xsl:value-of select="rows/content/form/label/description" disable-output-escaping="yes"/>
                              </label>
                              <textarea name="{rows/content/form/value/description/@name}" class="textarea" maxlength="4000" rel="F_suport_item">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/description"/>
                                </xsl:call-template>
                                <xsl:value-of select="rows/content/form/value/description" disable-output-escaping="yes"/>
                              </textarea>
                              <div class="_clear"/>
                            </div>
                            <div class="_clear"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/img_bt">
                          <div class="col-1-4 item" item-name="img_bt">
                            <div class="igrp_item text">
                              <label>
                                <xsl:value-of select="rows/content/form/label/img_bt" disable-output-escaping="yes"/>
                              </label>
                              <input type="text" name="{rows/content/form/value/img_bt/@name}" value="{rows/content/form/value/img_bt}" class="text" maxlength="100" rel="F_suport_item">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/img_bt"/>
                                </xsl:call-template>
                              </input>
                              <div class="_clear"/>
                            </div>
                            <div class="_clear"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/page">
                          <div class="col-1-4 item" item-name="page">
                            <div class="igrp_item text">
                              <label>
                                <xsl:value-of select="rows/content/form/label/page" disable-output-escaping="yes"/>
                              </label>
                              <input type="text" name="{rows/content/form/value/page/@name}" value="{rows/content/form/value/page}" class="text" maxlength="30" rel="F_suport_item">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/page"/>
                                </xsl:call-template>
                              </input>
                              <div class="_clear"/>
                            </div>
                            <div class="_clear"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/action">
                          <div class="col-1-4 item" item-name="action">
                            <div class="igrp_item text">
                              <label>
                                <xsl:value-of select="rows/content/form/label/action" disable-output-escaping="yes"/>
                              </label>
                              <input type="text" name="{rows/content/form/value/action/@name}" value="{rows/content/form/value/action}" class="text" maxlength="30" rel="F_suport_item">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/action"/>
                                </xsl:call-template>
                              </input>
                              <div class="_clear"/>
                            </div>
                            <div class="_clear"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/status">
                          <div class="col-1-4 item" item-name="status">
                            <div class="igrp_item select">
                              <label>
                                <xsl:value-of select="rows/content/form/label/status" disable-output-escaping="yes"/>
                              </label>
                              <select name="{rows/content/form/list/status/@name}" chosen="select" data-placeholder="{rows/content/form/list/status/option[position() = 1]}" class="select" rel="F_suport_item">
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
                        <xsl:with-param name="rel" select="'suport_item'"/>
                      </xsl:call-template>
                      <div class="col" list-name="suport_item"><!-- START TABELA LIST--><div class="box-table table-responsive">
                          <ul class="contextMenu ctxSepListDialog" id="data-suport_item">
                            <li rel="suport_item" class="IGRP_editRow operationTable" name="edit_suport_item">
                              <img src="{$path_tmpl}/img/icon/tools-bar/edit.png"/>
                              <span>
                                <xsl:value-of select="$lngPath/separatorlist_dialog/edit" disable-output-escaping="yes"/>
                              </span>
                            </li>
                            <li rel="suport_item" class="IGRP_delRow operationTable" name="del_suport_item">
                              <img src="{$path_tmpl}/img/icon/tools-bar/delete.png"/>
                              <span>
                                <xsl:value-of select="$lngPath/separatorlist_dialog/delete" disable-output-escaping="yes"/>
                              </span>
                            </li>
                          </ul>
                          <table rel="T_suport_item" data-control="data-suport_item">
                            <thead>
                              <tr>
                                <xsl:if test="rows/content/form/table/suport_item/label/title">
                                  <xsl:if test="not(rows/content/form/table/suport_item/label/title/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/suport_item/label/title" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/suport_item/label/description">
                                  <xsl:if test="not(rows/content/form/table/suport_item/label/description/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/suport_item/label/description" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/suport_item/label/img_bt">
                                  <xsl:if test="not(rows/content/form/table/suport_item/label/img_bt/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/suport_item/label/img_bt" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/suport_item/label/page">
                                  <xsl:if test="not(rows/content/form/table/suport_item/label/page/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/suport_item/label/page" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/suport_item/label/action">
                                  <xsl:if test="not(rows/content/form/table/suport_item/label/action/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/suport_item/label/action" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/suport_item/label/status">
                                  <xsl:if test="not(rows/content/form/table/suport_item/label/status/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/suport_item/label/status" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <th class="bEdDel"/>
                              </tr>
                            </thead>
                            <tbody>
                              <xsl:for-each select="rows/content/form/table/suport_item/value/row[not(@total='yes')]">
                                <tr row="{position()}">
                                  <xsl:if test="title">
                                    <xsl:if test="not(title/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/title}" class="text">
                                        <xsl:value-of select="title_desc" disable-output-escaping="yes"/>
                                        <input type="hidden" name="p_title_fk" value="{title}"/>
                                        <input type="hidden" name="p_title_fk_desc" value="{title_desc}"/>
                                        <span class="showResponsiveTable ctxmenu"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="title/@visible = 'false'">
                                      <input type="hidden" name="p_title_fk" value="{title}"/>
                                      <input type="hidden" name="p_title_fk_desc" value="{title_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="description">
                                    <xsl:if test="not(description/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/description}" class="textarea">
                                        <xsl:value-of select="description_desc" disable-output-escaping="yes"/>
                                        <input type="hidden" name="p_description_fk" value="{description}"/>
                                        <input type="hidden" name="p_description_fk_desc" value="{description_desc}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="description/@visible = 'false'">
                                      <input type="hidden" name="p_description_fk" value="{description}"/>
                                      <input type="hidden" name="p_description_fk_desc" value="{description_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="img_bt">
                                    <xsl:if test="not(img_bt/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/img_bt}" class="text">
                                        <xsl:value-of select="img_bt_desc" disable-output-escaping="yes"/>
                                        <input type="hidden" name="p_img_bt_fk" value="{img_bt}"/>
                                        <input type="hidden" name="p_img_bt_fk_desc" value="{img_bt_desc}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="img_bt/@visible = 'false'">
                                      <input type="hidden" name="p_img_bt_fk" value="{img_bt}"/>
                                      <input type="hidden" name="p_img_bt_fk_desc" value="{img_bt_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="page">
                                    <xsl:if test="not(page/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/page}" class="text">
                                        <xsl:value-of select="page_desc" disable-output-escaping="yes"/>
                                        <input type="hidden" name="p_page_fk" value="{page}"/>
                                        <input type="hidden" name="p_page_fk_desc" value="{page_desc}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="page/@visible = 'false'">
                                      <input type="hidden" name="p_page_fk" value="{page}"/>
                                      <input type="hidden" name="p_page_fk_desc" value="{page_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="action">
                                    <xsl:if test="not(action/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/action}" class="text">
                                        <xsl:value-of select="action_desc" disable-output-escaping="yes"/>
                                        <input type="hidden" name="p_action_fk" value="{action}"/>
                                        <input type="hidden" name="p_action_fk_desc" value="{action_desc}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="action/@visible = 'false'">
                                      <input type="hidden" name="p_action_fk" value="{action}"/>
                                      <input type="hidden" name="p_action_fk_desc" value="{action_desc}"/>
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
                                      <img title="{$lngPath/separatorlist_dialog/edit}" src="{$path_tmpl}/img/icon/tools-bar/edit.png" name="edit_suport_item" rel="suport_item" class="IGRP_editRow"/>
                                    </xsl:if>
                                    <xsl:if test="not(@nodelete)">
                                      <img title="{$lngPath/separatorlist_dialog/delete}" src="{$path_tmpl}/img/icon/tools-bar/delete.png" name="del_suport_item" rel="suport_item" class="IGRP_delRow"/>
                                    </xsl:if>
                                  </td>
                                  <input type="hidden" name="p_suport_item_id" value="{suport_item_id}"/>
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
