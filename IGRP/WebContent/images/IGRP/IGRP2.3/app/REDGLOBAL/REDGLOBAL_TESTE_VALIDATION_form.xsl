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
                </xsl:apply-templates><!-- END NOTIFICATION MESSAGES--><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!-- START FORM--><!-- START HIDDEN FORM--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- END HIDDEN FORM--><!-- START SEPARADOR TAB--><!-- END SEPARADOR TAB--><!--START TOOL BAR FROM--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar"/><!--END TOOL BAR FORM--><div class="box-content">
                    <xsl:if test="rows/content/form/label/bi">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/bi"/>
                        </span>
                        <input type="number" name="{rows/content/form/value/bi/@name}" value="{rows/content/form/value/bi}" class="number" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/bi"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/nome">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/nome"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/nome/@name}" value="{rows/content/form/value/nome}" class="text" maxlength="100">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/nome"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/idade">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/idade"/>
                        </span>
                        <input type="number" name="{rows/content/form/value/idade/@name}" value="{rows/content/form/value/idade}" class="number" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/idade"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/lista_check">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/lista_check"/>
                        </span>
                        <xsl:for-each select="rows/content/form/list/lista_check/option">
                          <input type="checkbox" name="{../@name}" value="{value}" class="checkboxlist" maxlength="30">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/form/label/lista_check"/>
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
                    <xsl:if test="rows/content/form/label/hiperlink1">
                      <label>
                        <span>
                          <a href="{rows/content/form/value/hiperlink1}" class="_blank form_link" name="p_hiperlink1">
                            <xsl:value-of select="rows/content/form/label/hiperlink1"/>
                          </a>
                        </span>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/sep_lista">
                      <xsl:if test="rows/content/form/label/sep_lista">
                        <div rel="sep_lista">
                          <div id="sep_lista">
                            <xsl:call-template name="page-title">
                              <xsl:with-param name="title" select="rows/content/form/label/sep_lista"/>
                              <xsl:with-param name="class" select="'subtitle'"/>
                            </xsl:call-template>
                          </div><!-- START TABELA LIST--><div class="simple-table">
                            <table rel="T_sep_lista">
                              <thead>
                                <tr>
                                  <xsl:if test="rows/content/form/table/sep_lista/label/estado_civil">
                                    <xsl:if test="not(rows/content/form/table/sep_lista/label/estado_civil/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/sep_lista/label/estado_civil"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/table/sep_lista/label/regime_casamento">
                                    <xsl:if test="not(rows/content/form/table/sep_lista/label/regime_casamento/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/sep_lista/label/regime_casamento"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                </tr>
                              </thead>
                              <tbody>
                                <xsl:for-each select="rows/content/form/table/sep_lista/value/row[not(@total='yes')]">
                                  <xsl:variable name="pos" select="(position()+1) mod 2"/>
                                  <tr>
                                    <xsl:if test="estado_civil">
                                      <xsl:if test="not(estado_civil/@visible)">
                                        <td class="table_row{$pos}">
                                          <xsl:value-of select="estado_civil"/>
                                        </td>
                                      </xsl:if>
                                    </xsl:if>
                                    <xsl:if test="regime_casamento">
                                      <xsl:if test="not(regime_casamento/@visible)">
                                        <td class="table_row{$pos}">
                                          <xsl:value-of select="regime_casamento"/>
                                        </td>
                                      </xsl:if>
                                    </xsl:if>
                                    <input type="hidden" name="p_sep_lista_id" value="{sep_lista_id}"/>
                                  </tr>
                                </xsl:for-each>
                              </tbody>
                            </table>
                          </div><!-- END TABELA LIST--></div>
                      </xsl:if>
                    </xsl:if>
                  </div><!-- END FORM--></form><!-- END YOUR CODE HERE --></div>
            </div><!-- START HOME BOTTOM --><xsl:call-template name="home-side"/>
          </div>
        </div><!--HOME-FOOTER--></body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20140123"/>
  <xsl:include href="../../xsl/tmpl/IGRP-JSvalidation.tmpl.xsl?v=20140123"/>
  <xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=20140123"/>
  <xsl:include href="../../xsl/tmpl/IGRP-others.tmpl.xsl?v=20140123"/>
</xsl:stylesheet>
