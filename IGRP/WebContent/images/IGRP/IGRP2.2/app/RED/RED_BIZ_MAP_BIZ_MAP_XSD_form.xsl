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
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FORM--><!--START TOOLS BAR FROM--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar"/><!--END TOOLS BAR FORM--><div class="col" sep-name="form">
                <xsl:if test="rows/content/form/label/xsd_request">
                  <div class="col-1-4 item" item-name="xsd_request">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/xsd_request) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/xsd_request" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/xsd_request" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/xsd_request/@name}" value="{rows/content/form/value/xsd_request}" class="text" maxlength="2000">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/xsd_request"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/xsd_response">
                  <div class="col-1-4 item" item-name="xsd_response">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/xsd_response) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/xsd_response" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/xsd_response" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/xsd_response/@name}" value="{rows/content/form/value/xsd_response}" class="text" maxlength="2000">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/xsd_response"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/source">
                  <div class="col-1-4 item" item-name="source">
                    <div class="igrp_item selectchange">
                      <a id="idp_source"/>
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/source) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/source" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/source" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/source/@name}" chosen="select" id="{rows/content/form/list/source/@name}" data-placeholder="{rows/content/form/list/source/option[position() = 1]}" class="selectchange IGRP_change">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/source"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/source/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/destination">
                  <div class="col-1-4 item" item-name="destination">
                    <div class="igrp_item selectchange">
                      <a id="idp_destination"/>
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/destination) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/destination" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/destination" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/destination/@name}" chosen="select" id="{rows/content/form/list/destination/@name}" data-placeholder="{rows/content/form/list/destination/option[position() = 1]}" class="selectchange IGRP_change">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/destination"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/destination/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/maping">
                  <div class="box-content resetPadding" sep-name="maping">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/maping"/>
                    </xsl:call-template>
                    <div class="box-collapser"><!-- START FORM LIST--><xsl:if test="not(rows/content/form/table/maping/value/row[position() = 1]/@noupdate)">
                        <div class="col showResponsiveTable" item-name="add-maping">
                          <div class="addRowFormlist addRow">
                            <a rel="maping" class="IGRP_addRowForm">
                              <img title="{$lngPath/separatorlist_dialog/add}" src="{$path_tmpl}/img/icon/tools-bar/sepAdd.png"/>
                              <span>
                                <xsl:value-of select="$lngPath/separatorlist_dialog/delete" disable-output-escaping="yes"/>
                              </span>
                            </a>
                          </div>
                        </div>
                      </xsl:if>
                      <div class="box-table table-responsive">
                        <table class="IGRP_formlist" rel="T_maping" data-control="data-maping">
                          <thead>
                            <tr>
                              <xsl:if test="rows/content/form/table/maping/label/field_origin">
                                <xsl:if test="not(rows/content/form/table/maping/label/field_origin/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/maping/label/field_origin" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/maping/label/field_destin">
                                <xsl:if test="not(rows/content/form/table/maping/label/field_destin/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/maping/label/field_destin" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/maping/label/transform">
                                <xsl:if test="not(rows/content/form/table/maping/label/transform/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/maping/label/transform" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="not(rows/content/form/table/maping/value/row[position() = 1]/@noupdate) or not(rows/content/form/table/maping/value/row[position() = 1]/@nodelete)">
                                <th class="fBtn">
                                  <xsl:if test="not(rows/content/form/table/maping/value/row[position() = 1]/@noupdate)">
                                    <img title="" src="{$path_tmpl}/img/icon/tools-bar/add.png" item-name="add-maping" rel="maping" class="IGRP_addRowForm"/>
                                  </xsl:if>
                                </th>
                              </xsl:if>
                            </tr>
                          </thead>
                          <tbody>
                            <xsl:for-each select="rows/content/form/table/maping/value/row[not(@total='yes')]">
                              <tr row="{position()}">
                                <xsl:if test="field_origin">
                                  <xsl:if test="not(field_origin/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/field_origin}" class="select">
                                      <input type="hidden" name="p_field_origin_fk_desc" value="{field_origin_desc}"/>
                                      <select name="{../../../../list/field_origin/@name}_fk" chosen="select" id="{../../../../list/field_origin/@name}_fk" data-placeholder="{../../../../list/field_origin/option[position() = 1]}" class="select" rel="F_maping">
                                        <xsl:call-template name="FIELD_validator">
                                          <xsl:with-param name="field" select="../../label/field_origin"/>
                                        </xsl:call-template>
                                        <option value=""/>
                                        <xsl:variable name="v_field_origin" select="field_origin"/>
                                        <xsl:for-each select="../../../../list/field_origin/option[position() != 1]">
                                          <option value="{value}">
                                            <xsl:if test="$v_field_origin = value">
                                              <xsl:attribute name="selected">selected</xsl:attribute>
                                            </xsl:if>
                                            <xsl:value-of select="text"/>
                                          </option>
                                        </xsl:for-each>
                                      </select>
                                      <xsl:if test="not(@nodelete)">
                                        <span class="showResponsiveTable respDelRow" item-name="del-maping">
                                          <img title="{$lngPath/separatorlist_dialog/delete}" src="{$path_tmpl}/img/icon/tools-bar/delete.png" rel="maping" class="IGRP_delRow"/>
                                        </span>
                                      </xsl:if>
                                    </td>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="field_destin">
                                  <xsl:if test="not(field_destin/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/field_destin}" class="select">
                                      <input type="hidden" name="p_field_destin_fk_desc" value="{field_destin_desc}"/>
                                      <select name="{../../../../list/field_destin/@name}_fk" chosen="select" id="{../../../../list/field_destin/@name}_fk" data-placeholder="{../../../../list/field_destin/option[position() = 1]}" class="select" rel="F_maping">
                                        <xsl:call-template name="FIELD_validator">
                                          <xsl:with-param name="field" select="../../label/field_destin"/>
                                        </xsl:call-template>
                                        <option value=""/>
                                        <xsl:variable name="v_field_destin" select="field_destin"/>
                                        <xsl:for-each select="../../../../list/field_destin/option[position() != 1]">
                                          <option value="{value}">
                                            <xsl:if test="$v_field_destin = value">
                                              <xsl:attribute name="selected">selected</xsl:attribute>
                                            </xsl:if>
                                            <xsl:value-of select="text"/>
                                          </option>
                                        </xsl:for-each>
                                      </select>
                                    </td>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="transform">
                                  <xsl:if test="not(transform/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/transform}" class="texteditor">
                                      <input type="hidden" name="p_transform_fk_desc" value="{transform_desc}"/>
                                      <input type="texteditor" name="{../../label/transform/@name}_fk" value="{transform}" class="texteditor" maxlength="2000" rel="F_maping">
                                        <xsl:call-template name="FIELD_validator">
                                          <xsl:with-param name="field" select="../../label/transform"/>
                                        </xsl:call-template>
                                      </input>
                                    </td>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="not(@nodelete) or not(@noupdate)">
                                  <td class="fBtn" data-row="{position()}" data-title="{$lngPath/separatorlist_dialog/delete}">
                                    <xsl:if test="not(@nodelete)">
                                      <img title="{$lngPath/separatorlist_dialog/delete}" src="{$path_tmpl}/img/icon/tools-bar/delete.png" item-name="del-maping" class="IGRP_delRowForm" rel="maping"/>
                                    </xsl:if>
                                  </td>
                                </xsl:if>
                                <input type="hidden" name="p_maping_id" value="{maping_id}"/>
                              </tr>
                            </xsl:for-each>
                          </tbody>
                        </table>
                      </div><!-- END FORM LIST--><div class="_clear"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20160108"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20160108"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20160108"/>
  <xsl:include href="../../xsl/tmpl/IGRP-form-text-editor.tmpl.xsl?v=20160108"/>
</xsl:stylesheet>
