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
                </xsl:apply-templates><!-- END NOTIFICATION MESSAGES--><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!-- START HIDDEN FILTER--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/><!-- END HIDDEN FILTER--><!-- START HIDDEN FORM--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- END HIDDEN FORM--><!-- START FORM--><!--START TOOL BAR FROM--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar"/><!--END TOOL BAR FORM--><div class="box-content">
                    <xsl:if test="rows/content/form/label/xsd_request">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/xsd_request"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/xsd_request/@name}" value="{rows/content/form/value/xsd_request}" class="text" maxlength="2000">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/xsd_request"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/xsd_response">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/xsd_response"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/xsd_response/@name}" value="{rows/content/form/value/xsd_response}" class="text" maxlength="2000">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/xsd_response"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/area"/>
                    <xsl:if test="rows/content/form/label/direction"/>
                    <xsl:if test="rows/content/form/label/source"/>
                    <xsl:if test="rows/content/form/label/destination"/>
                    <xsl:if test="rows/content/form/label/maping">
                      <div rel="maping">
                        <div id="maping">
                          <xsl:call-template name="page-title">
                            <xsl:with-param name="title" select="rows/content/form/label/maping"/>
                            <xsl:with-param name="class" select="'subtitle'"/>
                          </xsl:call-template>
                        </div><!-- START FORM LIST--><div class="simple-table" rel="DIV_maping">
                          <table class="editable-table" rel="T_maping">
                            <thead>
                              <tr>
                                <xsl:if test="rows/content/form/table/maping/label/field_origin">
                                  <xsl:if test="not(rows/content/form/table/maping/label/field_origin/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/maping/label/field_origin"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/maping/label/field_destin">
                                  <xsl:if test="not(rows/content/form/table/maping/label/field_destin/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/maping/label/field_destin"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/maping/label/transform">
                                  <xsl:if test="not(rows/content/form/table/maping/label/transform/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/maping/label/transform"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="not(rows/content/form/table/maping/value/row[position() = 1]/@noupdate) or not(rows/content/form/table/maping/value/row[position() = 1]/@nodelete)">
                                  <th align="center" width="10">
                                    <xsl:if test="not(rows/content/form/table/maping/value/row[position() = 1]/@noupdate)">
                                      <img alt="adicionar" src="{$path_tmpl}/img/icon/tools-bar/add.png" rel="maping" class="IGRP_addRow_form"/>
                                    </xsl:if>
                                  </th>
                                </xsl:if>
                              </tr>
                            </thead>
                            <tbody>
                              <xsl:for-each select="rows/content/form/table/maping/value/row[not(@total='yes')]">
                                <xsl:variable name="pos" select="(position()+1) mod 2"/>
                                <tr>
                                  <xsl:if test="field_origin">
                                    <xsl:if test="not(field_origin/@visible)">
                                      <td class="table_row{$pos}">
                                        <input type="hidden" name="p_field_origin_fk_desc" value="{field_origin_desc}"/>
                                        <select name="{../../../../list/field_origin/@name}_fk" class="select" maxlength="30" rel="F_maping">
                                          <xsl:call-template name="FIELD_validator">
                                            <xsl:with-param name="field" select="../../label/field_origin"/>
                                          </xsl:call-template>
                                          <xsl:variable name="v_field_origin" select="field_origin"/>
                                          <xsl:for-each select="../../../../list/field_origin/option">
                                            <option value="{value}">
                                              <xsl:if test="$v_field_origin = value">
                                                <xsl:attribute name="selected">selected</xsl:attribute>
                                              </xsl:if>
                                              <xsl:value-of select="text"/>
                                            </option>
                                          </xsl:for-each>
                                        </select>
                                      </td>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="field_destin">
                                    <xsl:if test="not(field_destin/@visible)">
                                      <td class="table_row{$pos}">
                                        <input type="hidden" name="p_field_destin_fk_desc" value="{field_destin_desc}"/>
                                        <select name="{../../../../list/field_destin/@name}_fk" class="select" maxlength="30" rel="F_maping">
                                          <xsl:call-template name="FIELD_validator">
                                            <xsl:with-param name="field" select="../../label/field_destin"/>
                                          </xsl:call-template>
                                          <xsl:variable name="v_field_destin" select="field_destin"/>
                                          <xsl:for-each select="../../../../list/field_destin/option">
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
                                      <td class="table_row{$pos}">
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
                                    <td align="center" width="10">
                                      <xsl:if test="not(@nodelete)">
                                        <img alt="apagar" src="{$path_tmpl}/img/icon/ctx-delete.png" class="IGRP_delRow_form" rel="maping"/>
                                      </xsl:if>
                                    </td>
                                  </xsl:if>
                                  <input type="hidden" name="p_maping_id" value="{maping_id}"/>
                                </tr>
                              </xsl:for-each>
                            </tbody>
                          </table>
                        </div><!-- END FORM LIST--></div>
                    </xsl:if>
                  </div><!-- END FORM--></form><!-- END YOUR CODE HERE --></div>
            </div><!-- START HOME BOTTOM --><xsl:call-template name="home-side"/>
          </div>
        </div><!--HOME-FOOTER--></body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20140408"/>
  <xsl:include href="../../xsl/tmpl/IGRP-JSvalidation.tmpl.xsl?v=20140408"/>
  <xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=20140408"/>
  <xsl:include href="../../xsl/tmpl/IGRP-others.tmpl.xsl?v=20140408"/>
  <xsl:include href="../../xsl/tmpl/IGRP-form-text-editor.tmpl.xsl?v=20140408"/>
</xsl:stylesheet>
