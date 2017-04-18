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
                </xsl:apply-templates><!-- END NOTIFICATION MESSAGES--><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!-- START HIDDEN FILTER--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/><!-- END HIDDEN FILTER--><!-- START HIDDEN FORM--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- END HIDDEN FORM--><!-- START FILTER--><div class="box-content">
                    <xsl:if test="rows/content/form/label/tipo_consumo">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/tipo_consumo"/>
                        </span>
                        <select name="{rows/content/form/list/tipo_consumo/@name}" class="select" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/tipo_consumo"/>
                          </xsl:call-template>
                          <xsl:for-each select="rows/content/form/list/tipo_consumo/option">
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
                    <xsl:if test="rows/content/form/label/cliente">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/cliente"/>
                        </span>
                        <input type="LOOKUP" name="{rows/content/form/value/cliente/@name}" value="{rows/content/form/value/cliente}" class="LOOKUP" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/cliente"/>
                          </xsl:call-template>
                        </input>
                        <xsl:call-template name="lookup-tool">
                          <xsl:with-param name="page" select="rows/page"/>
                          <xsl:with-param name="ad_hoc" select="'1'"/>
                          <xsl:with-param name="action" select="'LOOKUP'"/>
                          <xsl:with-param name="name" select="rows/content/form/value/cliente/@name"/>
                          <xsl:with-param name="js_lookup" select="rows/content/form/lookup/cliente"/>
                        </xsl:call-template>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/id_cliente"/>
                    <xsl:if test="rows/content/form/label/de">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/de"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/de/@name}" value="{rows/content/form/value/de}" class="date IGRP_datepicker" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/de"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/ate">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/ate"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/ate/@name}" value="{rows/content/form/value/ate}" class="date IGRP_datepicker" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/ate"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/servico">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/servico"/>
                        </span>
                        <input type="LOOKUP" name="{rows/content/form/value/servico/@name}" value="{rows/content/form/value/servico}" class="LOOKUP" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/servico"/>
                          </xsl:call-template>
                        </input>
                        <xsl:call-template name="lookup-tool">
                          <xsl:with-param name="page" select="rows/page"/>
                          <xsl:with-param name="ad_hoc" select="'1'"/>
                          <xsl:with-param name="action" select="'LOOKUP'"/>
                          <xsl:with-param name="name" select="rows/content/form/value/servico/@name"/>
                          <xsl:with-param name="js_lookup" select="rows/content/form/lookup/servico"/>
                        </xsl:call-template>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/id_contracto"/>
                    <xsl:if test="rows/content/form/label/id_servico"/>
                    <xsl:if test="rows/content/form/label/codigo_contrato">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/codigo_contrato"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/codigo_contrato/@name}" value="{rows/content/form/value/codigo_contrato}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/codigo_contrato"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if><!--START TOOL BAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/form/tools-bar"/><!--END TOOL BAR FILTER--></div><!-- END FILTER--><!-- START TABELA--><!--  CONTEXT-MENU  --><div class="table">
                    <table class="sortable IGRP_table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/data">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/data"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/tipo_consumo">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/tipo_consumo"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/cliente">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/cliente"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/servico">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/servico"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/codigo_contrato">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/codigo_contrato"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <xsl:variable name="pos" select="(position()+1) mod 2"/>
                          <tr class="">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="data">
                              <td align="" class="table_row{$pos}">
                                <xsl:value-of select="data"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="tipo_consumo">
                              <td align="" class="table_row{$pos}">
                                <xsl:value-of select="tipo_consumo"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="cliente">
                              <td align="" class="table_row{$pos}">
                                <xsl:value-of select="cliente"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="servico">
                              <td align="" class="table_row{$pos}">
                                <xsl:value-of select="servico"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="codigo_contrato">
                              <td align="" class="table_row{$pos}">
                                <xsl:value-of select="codigo_contrato"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20140311"/>
  <xsl:include href="../../xsl/tmpl/IGRP-JSvalidation.tmpl.xsl?v=20140311"/>
  <xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=20140311"/>
  <xsl:include href="../../xsl/tmpl/IGRP-others.tmpl.xsl?v=20140311"/>
</xsl:stylesheet>
