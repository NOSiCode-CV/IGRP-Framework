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
                </xsl:apply-templates><!-- END NOTIFICATION MESSAGES--><form action="#" method="post" id="formular_default" name="formular_default" class="default_filter"><!-- START HIDDEN FILTER--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/><!-- END HIDDEN FILTER--><!-- START HIDDEN FORM--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- END HIDDEN FORM--><!-- START FILTER--><div class="box-content">
                    <xsl:if test="rows/content/filter/label/env_fk">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/filter/label/env_fk"/>
                        </span>
                        <select name="{rows/content/filter/list/env_fk/@name}" class="select" maxlength="22">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/env_fk"/>
                          </xsl:call-template>
                          <xsl:for-each select="rows/content/filter/list/env_fk/option">
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
                    <xsl:if test="rows/content/filter/label/object_type">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/filter/label/object_type"/>
                        </span>
                        <select name="{rows/content/filter/list/object_type/@name}" class="select" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/object_type"/>
                          </xsl:call-template>
                          <xsl:for-each select="rows/content/filter/list/object_type/option">
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
                    <xsl:if test="rows/content/filter/label/owner">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/filter/label/owner"/>
                        </span>
                        <input type="text" name="{rows/content/filter/value/owner/@name}" value="{rows/content/filter/value/owner}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/owner"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if><!--START TOOL BAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar"/><!--END TOOL BAR FILTER--></div><!-- END FILTER--><!--START TOOL BAR TABLE--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar"/><!--END TOOL BAR TABLE--><!-- START TABELA--><!--  CONTEXT-MENU  --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu"/>
                  <div class="table table-responsive">
                    <table class="sortable IGRP_table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/owner">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/owner"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/object_name">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/object_name"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/object_type">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/object_type"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/remarks">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/remarks"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/ver_doc">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/ver_doc"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <xsl:variable name="pos" select="(position()+1) mod 2"/>
                          <tr class="IGRP_contextMenu">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="owner">
                              <td align="left" class="table_row{$pos}" data-title="{../../label/owner}">
                                <xsl:value-of select="owner"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="object_name">
                              <td align="left" class="table_row{$pos}" data-title="{../../label/object_name}">
                                <xsl:value-of select="object_name"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="object_type">
                              <td align="left" class="table_row{$pos}" data-title="{../../label/object_type}">
                                <xsl:value-of select="object_type"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="remarks">
                              <td align="left" class="table_row{$pos}" data-title="{../../label/remarks}">
                                <xsl:value-of select="remarks"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="ver_doc">
                              <td align="left" class="table_row{$pos}" data-title="{../../label/ver_doc}">
                                <xsl:choose>
                                  <xsl:when test="ver_doc != ''">
                                    <a href="{ver_doc}" class="_blank">
                                      <xsl:value-of select="ver_doc_desc"/>
                                    </a>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <xsl:value-of select="ver_doc_desc"/>
                                  </xsl:otherwise>
                                </xsl:choose>
                              </td>
                            </xsl:if>
                          </tr>
                        </xsl:for-each>
                      </tbody>
                    </table>
                  </div><!-- END TABELA--></form><!-- END YOUR CODE HERE --></div>
            </div><!-- START HOME BOTTOM --><xsl:call-template name="home-side"/>
          </div>
        </div><!--HOME-FOOTER--></body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150211"/>
  <xsl:include href="../../xsl/tmpl/IGRP-JSvalidation.tmpl.xsl?v=20150211"/>
  <xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=20150211"/>
  <xsl:include href="../../xsl/tmpl/IGRP-others.tmpl.xsl?v=20150211"/>
</xsl:stylesheet>
