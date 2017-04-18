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
                    <xsl:if test="rows/content/filter/label/assunto_notificacao">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/filter/label/assunto_notificacao"/>
                        </span>
                        <select name="{rows/content/filter/list/assunto_notificacao/@name}" class="select" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/assunto_notificacao"/>
                          </xsl:call-template>
                          <xsl:for-each select="rows/content/filter/list/assunto_notificacao/option">
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
                    <xsl:if test="rows/content/filter/label/data_notificacao">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/filter/label/data_notificacao"/>
                        </span>
                        <input type="text" name="{rows/content/filter/value/data_notificacao/@name}" value="{rows/content/filter/value/data_notificacao}" class="date IGRP_datepicker" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/data_notificacao"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/filter/label/data_fim">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/filter/label/data_fim"/>
                        </span>
                        <input type="text" name="{rows/content/filter/value/data_fim/@name}" value="{rows/content/filter/value/data_fim}" class="date IGRP_datepicker" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/data_fim"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/filter/label/medicamento">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/filter/label/medicamento"/>
                        </span>
                        <input type="text" name="{rows/content/filter/value/medicamento/@name}" value="{rows/content/filter/value/medicamento}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/medicamento"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/filter/label/estado_notificacao">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/filter/label/estado_notificacao"/>
                        </span>
                        <select name="{rows/content/filter/list/estado_notificacao/@name}" class="selectchange IGRP_change" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/estado_notificacao"/>
                          </xsl:call-template>
                          <xsl:for-each select="rows/content/filter/list/estado_notificacao/option">
                            <option value="{value}">
                              <xsl:if test="@selected='true'">
                                <xsl:attribute name="selected">selected</xsl:attribute>
                              </xsl:if>
                              <xsl:value-of select="text"/>
                            </option>
                          </xsl:for-each>
                        </select>
                        <a id="idp_estado_notificacao"/>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/filter/label/codigo">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/filter/label/codigo"/>
                        </span>
                        <input type="text" name="{rows/content/filter/value/codigo/@name}" value="{rows/content/filter/value/codigo}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/codigo"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if><!--START TOOL BAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar"/><!--END TOOL BAR FILTER--></div><!-- END FILTER--><!-- START TABELA--><!--  CONTEXT-MENU  --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu"/>
                  <div class="table table-responsive">
                    <table class="sortable IGRP_table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/codigo">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/codigo"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/assunto_notificacao">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/assunto_notificacao"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/data_notificacao">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/data_notificacao"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/medicamento">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/medicamento"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/estado_notificacao">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/estado_notificacao"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/link">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/link"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <xsl:variable name="pos" select="(position()+1) mod 2"/>
                          <tr class="IGRP_contextMenu">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="codigo">
                              <td align="" class="table_row{$pos}" data-title="{../../label/codigo}">
                                <xsl:value-of select="codigo"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="assunto_notificacao">
                              <td align="" class="table_row{$pos}" data-title="{../../label/assunto_notificacao}">
                                <xsl:value-of select="assunto_notificacao"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="data_notificacao">
                              <td align="" class="table_row{$pos}" data-title="{../../label/data_notificacao}">
                                <xsl:value-of select="data_notificacao"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="medicamento">
                              <td align="" class="table_row{$pos}" data-title="{../../label/medicamento}">
                                <xsl:value-of select="medicamento"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="estado_notificacao">
                              <td align="" class="table_row{$pos}" data-title="{../../label/estado_notificacao}">
                                <xsl:value-of select="estado_notificacao"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="link">
                              <td align="" class="table_row{$pos}" data-title="{../../label/link}">
                                <xsl:value-of select="link"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20141113"/>
  <xsl:include href="../../xsl/tmpl/IGRP-JSvalidation.tmpl.xsl?v=20141113"/>
  <xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=20141113"/>
  <xsl:include href="../../xsl/tmpl/IGRP-others.tmpl.xsl?v=20141113"/>
</xsl:stylesheet>
