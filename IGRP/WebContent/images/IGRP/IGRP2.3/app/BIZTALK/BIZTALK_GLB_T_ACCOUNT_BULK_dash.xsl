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
                    <xsl:if test="rows/content/filter/label/entity">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/filter/label/entity"/>
                        </span>
                        <input type="number" name="{rows/content/filter/value/entity/@name}" value="{rows/content/filter/value/entity}" class="number" maxlength="10">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/entity"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/filter/label/reference">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/filter/label/reference"/>
                        </span>
                        <input type="number" name="{rows/content/filter/value/reference/@name}" value="{rows/content/filter/value/reference}" class="number" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/reference"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/filter/label/nif">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/filter/label/nif"/>
                        </span>
                        <input type="number" name="{rows/content/filter/value/nif/@name}" value="{rows/content/filter/value/nif}" class="number" maxlength="20">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/nif"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/filter/label/operation">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/filter/label/operation"/>
                        </span>
                        <select name="{rows/content/filter/list/operation/@name}" class="select" maxlength="50">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/operation"/>
                          </xsl:call-template>
                          <xsl:for-each select="rows/content/filter/list/operation/option">
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
                    <xsl:if test="rows/content/filter/label/dt_de">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/filter/label/dt_de"/>
                        </span>
                        <input type="text" name="{rows/content/filter/value/dt_de/@name}" value="{rows/content/filter/value/dt_de}" class="date IGRP_datepicker" maxlength="10">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/dt_de"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/filter/label/dt_ate">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/filter/label/dt_ate"/>
                        </span>
                        <input type="text" name="{rows/content/filter/value/dt_ate/@name}" value="{rows/content/filter/value/dt_ate}" class="date IGRP_datepicker" maxlength="10">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/dt_ate"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if><!--START TOOL BAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar"/><!--END TOOL BAR FILTER--></div><!-- END FILTER--><!-- START TABELA--><!--  CONTEXT-MENU  --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu"/>
                  <div class="table">
                    <table class="sortable IGRP_table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/env_fk">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/env_fk"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/entity">
                            <th align="center">
                              <xsl:value-of select="rows/content/table/label/entity"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/reference">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/reference"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/valor">
                            <th align="right">
                              <xsl:value-of select="rows/content/table/label/valor"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/nif">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/nif"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/description">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/description"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/dt_expired">
                            <th align="center">
                              <xsl:value-of select="rows/content/table/label/dt_expired"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/operation">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/operation"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/link_report">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/link_report"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <xsl:variable name="pos" select="(position()+1) mod 2"/>
                          <tr class="IGRP_contextMenu">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="env_fk">
                              <td align="left" class="table_row{$pos}">
                                <xsl:value-of select="env_fk"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="entity">
                              <td align="center" class="table_row{$pos}">
                                <xsl:value-of select="entity"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="reference">
                              <td align="left" class="table_row{$pos}">
                                <xsl:value-of select="reference"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="valor">
                              <td align="right" class="table_row{$pos}">
                                <xsl:value-of select="valor"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="nif">
                              <td align="left" class="table_row{$pos}">
                                <xsl:value-of select="nif"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="description">
                              <td align="left" class="table_row{$pos}">
                                <xsl:value-of select="description"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="dt_expired">
                              <td align="center" class="table_row{$pos}">
                                <xsl:value-of select="dt_expired"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="operation">
                              <td align="left" class="table_row{$pos}">
                                <xsl:value-of select="operation"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="link_report">
                              <td align="left" class="table_row{$pos}">
                                <xsl:choose>
                                  <xsl:when test="link_report != ''">
                                    <a href="{link_report}" class="_blank">
                                      <xsl:value-of select="link_report_desc"/>
                                    </a>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <xsl:value-of select="link_report_desc"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20140206"/>
  <xsl:include href="../../xsl/tmpl/IGRP-JSvalidation.tmpl.xsl?v=20140206"/>
  <xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=20140206"/>
  <xsl:include href="../../xsl/tmpl/IGRP-others.tmpl.xsl?v=20140206"/>
</xsl:stylesheet>
