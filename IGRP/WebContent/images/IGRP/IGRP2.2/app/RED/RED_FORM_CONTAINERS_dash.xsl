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
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FORM--><div class="col addMarginTop addPaddingBottom10" sep-name="form"><!-- INICIO SEPARADOR containers--><xsl:if test="rows/content/form/label/containers">
                  <div class="box-content resetPadding" sep-name="containers">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/containers"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="col" sep-name="group-containers">
                        <xsl:if test="rows/content/form/label/name">
                          <div class="col-1-4 item" item-name="name">
                            <div class="igrp_item text">
                              <label>
                                <xsl:if test="string-length(rows/content/form/label/name) > 45">
                                  <xsl:attribute name="title">
                                    <xsl:value-of select="rows/content/form/label/name" disable-output-escaping="yes"/>
                                  </xsl:attribute>
                                </xsl:if>
                                <span class="riquired">*</span>
                                <xsl:value-of select="rows/content/form/label/name" disable-output-escaping="yes"/>
                              </label>
                              <input type="text" name="{rows/content/form/value/name/@name}" value="{rows/content/form/value/name}" class="text important" maxlength="50" rel="F_containers">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/name"/>
                                </xsl:call-template>
                              </input>
                              <div class="_clear"/>
                            </div>
                            <div class="_clear"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/label">
                          <div class="col-1-4 item" item-name="label">
                            <div class="igrp_item text">
                              <label>
                                <xsl:if test="string-length(rows/content/form/label/label) > 45">
                                  <xsl:attribute name="title">
                                    <xsl:value-of select="rows/content/form/label/label" disable-output-escaping="yes"/>
                                  </xsl:attribute>
                                </xsl:if>
                                <span class="riquired">*</span>
                                <xsl:value-of select="rows/content/form/label/label" disable-output-escaping="yes"/>
                              </label>
                              <input type="text" name="{rows/content/form/value/label/@name}" value="{rows/content/form/value/label}" class="text important" maxlength="80" rel="F_containers">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/label"/>
                                </xsl:call-template>
                              </input>
                              <div class="_clear"/>
                            </div>
                            <div class="_clear"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/accept">
                          <div class="col-1-4 item" item-name="accept">
                            <div class="igrp_item selectlist">
                              <label>
                                <xsl:if test="string-length(rows/content/form/label/accept) > 45">
                                  <xsl:attribute name="title">
                                    <xsl:value-of select="rows/content/form/label/accept" disable-output-escaping="yes"/>
                                  </xsl:attribute>
                                </xsl:if>
                                <xsl:value-of select="rows/content/form/label/accept" disable-output-escaping="yes"/>
                              </label>
                              <select name="{rows/content/form/list/accept/@name}" chosen="select" id="{rows/content/form/list/accept/@name}" data-placeholder="{rows/content/form/list/accept/option[position() = 1]}" multiple="multiple" class="selectlist" rel="F_containers">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/accept"/>
                                </xsl:call-template>
                                <option value=""/>
                                <xsl:for-each select="rows/content/form/list/accept/option[position() != 1]">
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
                        <xsl:if test="rows/content/form/label/xsd_link">
                          <div class="col-1-4 item" item-name="xsd_link">
                            <div class="igrp_item link">
                              <input type="link" desc="{rows/content/form/label/xsd_link}" name="p_xsd_link" rel="F_containers" value="{rows/content/form/value/xsd_link}" style="display:none;"/>
                              <a href="{rows/content/form/value/xsd_link}" class="link bClick" name="p_xsd_link" target="_blank">
                                <xsl:value-of select="rows/content/form/label/xsd_link" disable-output-escaping="yes"/>
                              </a>
                              <div class="_clear"/>
                            </div>
                            <div class="_clear"/>
                          </div>
                        </xsl:if>
                        <div class="_clear"/>
                      </div>
                      <xsl:call-template name="tools-bar-form-group">
                        <xsl:with-param name="class" select="'IGRP_addRow'"/>
                        <xsl:with-param name="rel" select="'containers'"/>
                      </xsl:call-template>
                      <div class="col" sep-name="list-containers"><!-- START TABELA LIST--><div class="box-table table-responsive">
                          <ul class="contextMenu ctxSepListDialog" id="data-containers" sep-name="btn-containers">
                            <li rel="containers" class="IGRP_editRow operationTable" item-name="edit-containers">
                              <img src="{$path_tmpl}/img/icon/tools-bar/edit.png"/>
                              <span>
                                <xsl:value-of select="$lngPath/separatorlist_dialog/edit" disable-output-escaping="yes"/>
                              </span>
                            </li>
                            <li rel="containers" class="IGRP_delRow operationTable" item-name="del-containers">
                              <img src="{$path_tmpl}/img/icon/tools-bar/delete.png"/>
                              <span>
                                <xsl:value-of select="$lngPath/separatorlist_dialog/delete" disable-output-escaping="yes"/>
                              </span>
                            </li>
                          </ul>
                          <table rel="T_containers" data-control="data-containers">
                            <thead>
                              <tr>
                                <xsl:if test="rows/content/form/table/containers/label/name">
                                  <xsl:if test="not(rows/content/form/table/containers/label/name/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/containers/label/name" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/containers/label/label">
                                  <xsl:if test="not(rows/content/form/table/containers/label/label/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/containers/label/label" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/containers/label/accept">
                                  <xsl:if test="not(rows/content/form/table/containers/label/accept/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/containers/label/accept" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/containers/label/xsd_link">
                                  <xsl:if test="not(rows/content/form/table/containers/label/xsd_link/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/containers/label/xsd_link" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <th class="bEdDel"/>
                              </tr>
                            </thead>
                            <tbody>
                              <xsl:for-each select="rows/content/form/table/containers/value/row[not(@total='yes')]">
                                <tr row="{position()}">
                                  <xsl:if test="name">
                                    <xsl:if test="not(name/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/name}" class="text">
                                        <xsl:value-of select="name_desc" disable-output-escaping="yes"/>
                                        <input type="hidden" name="p_name_fk" value="{name}"/>
                                        <input type="hidden" name="p_name_fk_desc" value="{name_desc}"/>
                                        <span class="showResponsiveTable ctxmenu"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="name/@visible = 'false'">
                                      <input type="hidden" name="p_name_fk" value="{name}"/>
                                      <input type="hidden" name="p_name_fk_desc" value="{name_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="label">
                                    <xsl:if test="not(label/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/label}" class="text">
                                        <xsl:value-of select="label_desc" disable-output-escaping="yes"/>
                                        <input type="hidden" name="p_label_fk" value="{label}"/>
                                        <input type="hidden" name="p_label_fk_desc" value="{label_desc}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="label/@visible = 'false'">
                                      <input type="hidden" name="p_label_fk" value="{label}"/>
                                      <input type="hidden" name="p_label_fk_desc" value="{label_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="accept">
                                    <xsl:if test="not(accept/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/accept}" class="selectlist">
                                        <xsl:value-of select="accept_desc" disable-output-escaping="yes"/>
                                        <input type="hidden" name="p_accept_fk" value="{accept}"/>
                                        <input type="hidden" name="p_accept_fk_desc" value="{accept_desc}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="accept/@visible = 'false'">
                                      <input type="hidden" name="p_accept_fk" value="{accept}"/>
                                      <input type="hidden" name="p_accept_fk_desc" value="{accept_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="xsd_link">
                                    <xsl:if test="not(xsd_link/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/xsd_link}" class="link">
                                        <xsl:choose>
                                          <xsl:when test="xsd_link != ''">
                                            <a href="{xsd_link}" class="link bClick" target="_blank" name="xsd_link">
                                              <xsl:value-of select="xsd_link_desc" disable-output-escaping="yes"/>
                                            </a>
                                          </xsl:when>
                                          <xsl:otherwise>
                                            <xsl:value-of select="xsd_link_desc" disable-output-escaping="yes"/>
                                          </xsl:otherwise>
                                        </xsl:choose>
                                        <input type="hidden" name="p_xsd_link_fk" value="{xsd_link}"/>
                                        <input type="hidden" name="p_xsd_link_fk_desc" value="{xsd_link_desc}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="xsd_link/@visible = 'false'">
                                      <input type="hidden" name="p_xsd_link_fk" value="{xsd_link}"/>
                                      <input type="hidden" name="p_xsd_link_fk_desc" value="{xsd_link_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <td class="bEdDel" data-row="{position()}" data-title="{$lngPath/separatorlist_dialog/edit}/{$lngPath/separatorlist_dialog/delete}">
                                    <xsl:if test="not(@noupdate)">
                                      <img title="{$lngPath/separatorlist_dialog/edit}" src="{$path_tmpl}/img/icon/tools-bar/edit.png" item-name="edit-containers" rel="containers" class="IGRP_editRow"/>
                                    </xsl:if>
                                    <xsl:if test="not(@nodelete)">
                                      <img title="{$lngPath/separatorlist_dialog/delete}" src="{$path_tmpl}/img/icon/tools-bar/delete.png" item-name="del-containers" rel="containers" class="IGRP_delRow"/>
                                    </xsl:if>
                                  </td>
                                  <input type="hidden" name="p_containers_id" value="{containers_id}"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150624"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150624"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150624"/>
</xsl:stylesheet>
