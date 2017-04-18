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
                    <xsl:if test="rows/content/filter/label/data_de_pesq">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/filter/label/data_de_pesq"/>
                        </span>
                        <input type="text" name="{rows/content/filter/value/data_de_pesq/@name}" value="{rows/content/filter/value/data_de_pesq}" class="date IGRP_datepicker" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/data_de_pesq"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/filter/label/data_ate_pesq">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/filter/label/data_ate_pesq"/>
                        </span>
                        <input type="text" name="{rows/content/filter/value/data_ate_pesq/@name}" value="{rows/content/filter/value/data_ate_pesq}" class="date IGRP_datepicker" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/data_ate_pesq"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/filter/label/entidade_pesq">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/filter/label/entidade_pesq"/>
                        </span>
                        <input type="text" name="{rows/content/filter/value/entidade_pesq/@name}" value="{rows/content/filter/value/entidade_pesq}" class="text" maxlength="20">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/entidade_pesq"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/filter/label/referencia_pesq">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/filter/label/referencia_pesq"/>
                        </span>
                        <input type="text" name="{rows/content/filter/value/referencia_pesq/@name}" value="{rows/content/filter/value/referencia_pesq}" class="text" maxlength="20">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/referencia_pesq"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/filter/label/valor_pesq">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/filter/label/valor_pesq"/>
                        </span>
                        <input type="text" name="{rows/content/filter/value/valor_pesq/@name}" value="{rows/content/filter/value/valor_pesq}" class="text" maxlength="20">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/valor_pesq"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/filter/label/estado_sisp_pesq">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/filter/label/estado_sisp_pesq"/>
                        </span>
                        <select name="{rows/content/filter/list/estado_sisp_pesq/@name}" class="select" maxlength="20">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/estado_sisp_pesq"/>
                          </xsl:call-template>
                          <xsl:for-each select="rows/content/filter/list/estado_sisp_pesq/option">
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
                    <xsl:if test="rows/content/filter/label/cliente_dev_pesq">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/filter/label/cliente_dev_pesq"/>
                        </span>
                        <select name="{rows/content/filter/list/cliente_dev_pesq/@name}" class="select" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/cliente_dev_pesq"/>
                          </xsl:call-template>
                          <xsl:for-each select="rows/content/filter/list/cliente_dev_pesq/option">
                            <option value="{value}">
                              <xsl:if test="@selected='true'">
                                <xsl:attribute name="selected">selected</xsl:attribute>
                              </xsl:if>
                              <xsl:value-of select="text"/>
                            </option>
                          </xsl:for-each>
                        </select>
                      </label>
                    </xsl:if><!--START TOOL BAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar"/><!--END TOOL BAR FILTER--></div><!-- END FILTER--><!--START TOOL BAR TABLE--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar"/><!--END TOOL BAR TABLE--><!-- START TABELA--><!--  CONTEXT-MENU  --><div class="table table-responsive">
                    <table class="sortable IGRP_table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/id">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/id"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/data_hora">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/data_hora"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/entidade">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/entidade"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/referencia">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/referencia"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/valor">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/valor"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/estado_sisp">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/estado_sisp"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/msg">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/msg"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/origem_pgto">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/origem_pgto"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/cliente_dono">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/cliente_dono"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/cliente_devedor">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/cliente_devedor"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <xsl:variable name="pos" select="(position()+1) mod 2"/>
                          <tr class="">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="id">
                              <td align="" class="table_row{$pos}" data-title="{../../label/id}">
                                <xsl:value-of select="id"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="data_hora">
                              <td align="" class="table_row{$pos}" data-title="{../../label/data_hora}">
                                <xsl:value-of select="data_hora"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="entidade">
                              <td align="" class="table_row{$pos}" data-title="{../../label/entidade}">
                                <xsl:value-of select="entidade"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="referencia">
                              <td align="" class="table_row{$pos}" data-title="{../../label/referencia}">
                                <xsl:value-of select="referencia"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="valor">
                              <td align="" class="table_row{$pos}" data-title="{../../label/valor}">
                                <xsl:value-of select="valor"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="estado_sisp">
                              <td align="" class="table_row{$pos}" data-title="{../../label/estado_sisp}">
                                <xsl:value-of select="estado_sisp"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="msg">
                              <td align="" class="table_row{$pos}" data-title="{../../label/msg}">
                                <xsl:value-of select="msg"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="origem_pgto">
                              <td align="" class="table_row{$pos}" data-title="{../../label/origem_pgto}">
                                <xsl:value-of select="origem_pgto"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="cliente_dono">
                              <td align="" class="table_row{$pos}" data-title="{../../label/cliente_dono}">
                                <xsl:value-of select="cliente_dono"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="cliente_devedor">
                              <td align="" class="table_row{$pos}" data-title="{../../label/cliente_devedor}">
                                <xsl:value-of select="cliente_devedor"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20141120"/>
  <xsl:include href="../../xsl/tmpl/IGRP-JSvalidation.tmpl.xsl?v=20141120"/>
  <xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=20141120"/>
  <xsl:include href="../../xsl/tmpl/IGRP-others.tmpl.xsl?v=20141120"/>
</xsl:stylesheet>
