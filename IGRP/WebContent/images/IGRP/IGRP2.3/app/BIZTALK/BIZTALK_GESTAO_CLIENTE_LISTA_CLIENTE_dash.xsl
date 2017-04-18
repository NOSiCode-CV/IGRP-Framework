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
                </xsl:apply-templates><!-- END NOTIFICATION MESSAGES--><!-- START SIMPLE-MENU --><xsl:apply-templates mode="menu-simple" select="rows/content/menu"/><!-- END SIMPLE-MENU --><form action="#" method="post" id="formular_default" name="formular_default" class="default_filter"><!-- START HIDDEN FILTER--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/><!-- END HIDDEN FILTER--><!-- START HIDDEN FORM--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- END HIDDEN FORM--><!-- START FILTER--><div class="box-content">
                    <xsl:if test="rows/content/filter/label/nome">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/filter/label/nome"/>
                        </span>
                        <input type="text" name="{rows/content/filter/value/nome/@name}" value="{rows/content/filter/value/nome}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/nome"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/filter/label/nif">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/filter/label/nif"/>
                        </span>
                        <input type="text" name="{rows/content/filter/value/nif/@name}" value="{rows/content/filter/value/nif}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/nif"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/filter/label/organica">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/filter/label/organica"/>
                        </span>
                        <input type="LOOKUP_ORG" name="{rows/content/filter/value/organica/@name}" value="{rows/content/filter/value/organica}" class="LOOKUP_ORG" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/organica"/>
                          </xsl:call-template>
                        </input>
                        <xsl:call-template name="lookup-tool">
                          <xsl:with-param name="page" select="'LOOKUP'"/>
                          <xsl:with-param name="action" select="'LOOKUP_ORG'"/>
                          <xsl:with-param name="name" select="rows/content/filter/value/organica/@name"/>
                          <xsl:with-param name="js_lookup" select="rows/content/filter/lookup/organica"/>
                        </xsl:call-template>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/filter/label/organica_id"/><!--START TOOL BAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar"/><!--END TOOL BAR FILTER--></div><!-- END FILTER--><!--START TOOL BAR TABLE--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar"/><!--END TOOL BAR TABLE--><!-- START TABELA--><!--  CONTEXT-MENU  --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu"/>
                  <div class="table">
                    <table class="sortable IGRP_table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/nome">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/nome"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/codigo">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/codigo"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/nif">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/nif"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/organica">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/organica"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/aplicacao">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/aplicacao"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/contracto">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/contracto"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/doc_contrato">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/doc_contrato"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <xsl:variable name="pos" select="(position()+1) mod 2"/>
                          <tr class="IGRP_contextMenu">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="nome">
                              <td align="" class="table_row{$pos}">
                                <xsl:value-of select="nome"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="codigo">
                              <td align="" class="table_row{$pos}">
                                <xsl:value-of select="codigo"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="nif">
                              <td align="" class="table_row{$pos}">
                                <xsl:value-of select="nif"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="organica">
                              <td align="" class="table_row{$pos}">
                                <xsl:value-of select="organica"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="aplicacao">
                              <td align="" class="table_row{$pos}">
                                <xsl:value-of select="aplicacao"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="contracto">
                              <td align="" class="table_row{$pos}">
                                <xsl:value-of select="contracto"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="doc_contrato">
                              <td align="" class="table_row{$pos}">
                                <xsl:choose>
                                  <xsl:when test="doc_contrato != ''">
                                    <a href="{doc_contrato}" class="_blank">
                                      <xsl:value-of select="doc_contrato_desc"/>
                                    </a>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <xsl:value-of select="doc_contrato_desc"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20140624"/>
  <xsl:include href="../../xsl/tmpl/IGRP-JSvalidation.tmpl.xsl?v=20140624"/>
  <xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=20140624"/>
  <xsl:include href="../../xsl/tmpl/IGRP-others.tmpl.xsl?v=20140624"/>
</xsl:stylesheet>
