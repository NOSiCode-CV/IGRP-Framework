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
                </xsl:apply-templates><!-- END NOTIFICATION MESSAGES--><!-- START TAB MENU  --><xsl:apply-templates mode="tab-menu" select="rows/content/menu"/><!-- END TAB MENU  --><form action="#" method="post" id="formular_default" name="formular_default" class="default_filter"><!-- START HIDDEN FILTER--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/><!-- END HIDDEN FILTER--><!-- START HIDDEN FORM--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- END HIDDEN FORM--><!-- START FILTER--><div class="box-content">
                    <xsl:if test="rows/content/filter/label/nome">
                      <label>
                        <span>(*)<xsl:value-of select="rows/content/filter/label/nome"/>
                        </span>
                        <input type="LOOKUP_NASC" name="{rows/content/filter/value/nome/@name}" value="{rows/content/filter/value/nome}" class="LOOKUP_NASC required" maxlength="50">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/nome"/>
                          </xsl:call-template>
                        </input>
                        <xsl:call-template name="lookup-tool">
                          <xsl:with-param name="page" select="'LOOKUP'"/>
                          <xsl:with-param name="action" select="'LOOKUP_NASC'"/>
                          <xsl:with-param name="name" select="rows/content/filter/value/nome/@name"/>
                          <xsl:with-param name="js_lookup" select="rows/content/filter/lookup/nome"/>
                        </xsl:call-template>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/filter/label/sexo">
                      <label>
                        <span>(*)<xsl:value-of select="rows/content/filter/label/sexo"/>
                        </span>
                        <xsl:for-each select="rows/content/filter/list/sexo/option">
                          <input type="radio" name="{../@name}" value="{value}" class="radiolist required" maxlength="1">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="../../../label/sexo"/>
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
                    <xsl:if test="rows/content/filter/label/nr_bi">
                      <label>
                        <span>(*)<xsl:value-of select="rows/content/filter/label/nr_bi"/>
                        </span>
                        <input type="LOOKUP_BI" name="{rows/content/filter/value/nr_bi/@name}" value="{rows/content/filter/value/nr_bi}" class="LOOKUP_BI required" maxlength="10">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/nr_bi"/>
                          </xsl:call-template>
                        </input>
                        <xsl:call-template name="lookup-tool">
                          <xsl:with-param name="page" select="'LOOKUP'"/>
                          <xsl:with-param name="action" select="'LOOKUP_BI'"/>
                          <xsl:with-param name="name" select="rows/content/filter/value/nr_bi/@name"/>
                          <xsl:with-param name="js_lookup" select="rows/content/filter/lookup/nr_bi"/>
                        </xsl:call-template>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/filter/label/nr_nif">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/filter/label/nr_nif"/>
                        </span>
                        <input type="LOOKUP_NIF" name="{rows/content/filter/value/nr_nif/@name}" value="{rows/content/filter/value/nr_nif}" class="LOOKUP_NIF" maxlength="9">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/nr_nif"/>
                          </xsl:call-template>
                        </input>
                        <xsl:call-template name="lookup-tool">
                          <xsl:with-param name="page" select="'LOOKUP'"/>
                          <xsl:with-param name="action" select="'LOOKUP_NIF'"/>
                          <xsl:with-param name="name" select="rows/content/filter/value/nr_nif/@name"/>
                          <xsl:with-param name="js_lookup" select="rows/content/filter/lookup/nr_nif"/>
                        </xsl:call-template>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/filter/label/data_nasc">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/filter/label/data_nasc"/>
                        </span>
                        <input type="LOOKUP_NASC" name="{rows/content/filter/value/data_nasc/@name}" value="{rows/content/filter/value/data_nasc}" class="LOOKUP_NASC" maxlength="10">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/data_nasc"/>
                          </xsl:call-template>
                        </input>
                        <xsl:call-template name="lookup-tool">
                          <xsl:with-param name="page" select="'LOOKUP'"/>
                          <xsl:with-param name="action" select="'LOOKUP_NASC'"/>
                          <xsl:with-param name="name" select="rows/content/filter/value/data_nasc/@name"/>
                          <xsl:with-param name="js_lookup" select="rows/content/filter/lookup/data_nasc"/>
                        </xsl:call-template>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/filter/label/email">
                      <label>
                        <span>(*)<xsl:value-of select="rows/content/filter/label/email"/>
                        </span>
                        <input type="email" name="{rows/content/filter/value/email/@name}" value="{rows/content/filter/value/email}" class="email required" maxlength="50">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/email"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/filter/label/morada">
                      <label>
                        <span>(*)<xsl:value-of select="rows/content/filter/label/morada"/>
                        </span>
                        <input type="LOOKUP_GEOG" name="{rows/content/filter/value/morada/@name}" value="{rows/content/filter/value/morada}" class="LOOKUP_GEOG required" maxlength="50">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/morada"/>
                          </xsl:call-template>
                        </input>
                        <xsl:call-template name="lookup-tool">
                          <xsl:with-param name="page" select="'LOOKUP'"/>
                          <xsl:with-param name="action" select="'LOOKUP_GEOG'"/>
                          <xsl:with-param name="name" select="rows/content/filter/value/morada/@name"/>
                          <xsl:with-param name="js_lookup" select="rows/content/filter/lookup/morada"/>
                        </xsl:call-template>
                      </label>
                    </xsl:if><!--START TOOL BAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar"/><!--END TOOL BAR FILTER--></div><!-- END FILTER--><!--START TOOL BAR TABLE--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar"/><!--END TOOL BAR TABLE--><!-- START TABELA--><!--  CONTEXT-MENU  --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu"/>
                  <div class="table">
                    <table class="sortable IGRP_table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/nome">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/nome"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/nome_mae">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/nome_mae"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/nome_pai">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/nome_pai"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/sexo">
                            <th class="checkbox sorttable_nosort" align="center">
                              <input type="checkbox" name="p_sexo_all" class="IGRP_checkall"/>
                              <xsl:value-of select="rows/content/table/label/sexo"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/nr_bi">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/nr_bi"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/data_nasc">
                            <th align="center">
                              <xsl:value-of select="rows/content/table/label/data_nasc"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/nr_nif">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/nr_nif"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/email">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/email"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/morada">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/morada"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/id">
                            <th class="checkbox sorttable_nosort" align="center">
                              <input type="checkbox" name="p_id_all" class="IGRP_checkall"/>
                              <xsl:value-of select="rows/content/table/label/id"/>
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
                              <td align="left" class="table_row{$pos}">
                                <xsl:value-of select="nome"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="nome_mae">
                              <td align="left" class="table_row{$pos}">
                                <xsl:value-of select="nome_mae"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="nome_pai">
                              <td align="left" class="table_row{$pos}">
                                <xsl:value-of select="nome_pai"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="sexo">
                              <td align="left" class="table_row{$pos}">
                                <xsl:if test="sexo != '-0'">
                                  <input type="checkbox" name="p_sexo" value="{sexo}">
                                    <xsl:if test="sexo_check=sexo">
                                      <xsl:attribute name="checked">checked</xsl:attribute>
                                    </xsl:if>
                                  </input>
                                </xsl:if>
                                <xsl:value-of select="sexo_desc"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="nr_bi">
                              <td align="left" class="table_row{$pos}">
                                <xsl:value-of select="nr_bi"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="data_nasc">
                              <td align="center" class="table_row{$pos}">
                                <xsl:value-of select="data_nasc"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="nr_nif">
                              <td align="left" class="table_row{$pos}">
                                <xsl:value-of select="nr_nif"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="email">
                              <td align="left" class="table_row{$pos}">
                                <xsl:value-of select="email"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="morada">
                              <td align="left" class="table_row{$pos}">
                                <xsl:value-of select="morada"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="id">
                              <td align="center" class="table_row{$pos}">
                                <xsl:if test="id != '-0'">
                                  <input type="checkbox" name="p_id" value="{id}">
                                    <xsl:if test="id_check=id">
                                      <xsl:attribute name="checked">checked</xsl:attribute>
                                    </xsl:if>
                                  </input>
                                </xsl:if>
                                <xsl:value-of select="id_desc"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20140428"/>
  <xsl:include href="../../xsl/tmpl/IGRP-JSvalidation.tmpl.xsl?v=20140428"/>
  <xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=20140428"/>
  <xsl:include href="../../xsl/tmpl/IGRP-others.tmpl.xsl?v=20140428"/>
</xsl:stylesheet>
