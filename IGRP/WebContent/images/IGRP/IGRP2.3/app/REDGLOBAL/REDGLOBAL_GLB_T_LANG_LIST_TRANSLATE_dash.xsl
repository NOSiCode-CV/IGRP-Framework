<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html><!--XSL Generator (RED/DIM 2015)--><head><!--HOME-HEADER--><xsl:call-template name="home-header"/>
      </head>
      <body class="bodyColor">
        <div class="IGRP_overlay"/><!--HOME TOP--><xsl:call-template name="home-top-main"/><!--HOME--><div id="igrp-bodyPage"><!--HOME LEFT--><xsl:call-template name="home-slide-menu"/><!--HOME RIGTH--><div class="bodyPageRigth"><!-- START YOUR CODE HERE --><!-- SHOW TABLET AND MOBILE TITLE --><div class="box-head showTabMobile">
              <xsl:value-of select="rows/content/title"/>
            </div><!-- SHOW NOTIFICATION MESSAGES--><xsl:apply-templates mode="notif_messages" select="rows/content/messages"/>
            <form action="#" method="post" id="formular_default" name="formular_default" class="default_filter"><!-- SHOW HIDDEN--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FILTER--><div class="box-content resetPadding">
                <div class="col">
                  <xsl:if test="rows/content/filter/label/env_fk">
                    <div class="col-1-4 item" item-name="env_fk">
                      <div class="igrp_item select">
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/env_fk) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/env_fk" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/env_fk" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/filter/list/env_fk/@name}" chosen="select" id="{rows/content/filter/list/env_fk/@name}" data-placeholder="{rows/content/filter/list/env_fk/option[position() = 1]}" class="select">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/env_fk"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/filter/list/env_fk/option[position() != 1]">
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
                  <xsl:if test="rows/content/filter/label/pesquisa_por">
                    <div class="col-1-4 item" item-name="pesquisa_por">
                      <div class="igrp_item select">
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/pesquisa_por) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/pesquisa_por" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/pesquisa_por" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/filter/list/pesquisa_por/@name}" chosen="select" id="{rows/content/filter/list/pesquisa_por/@name}" data-placeholder="{rows/content/filter/list/pesquisa_por/option[position() = 1]}" class="select">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/pesquisa_por"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/filter/list/pesquisa_por/option[position() != 1]">
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
                  <xsl:if test="rows/content/filter/label/pesquisa">
                    <div class="col-1-4 item" item-name="pesquisa">
                      <div class="igrp_item text">
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/pesquisa) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/pesquisa" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/pesquisa" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/filter/value/pesquisa/@name}" value="{rows/content/filter/value/pesquisa}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/pesquisa"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <div class="_clear"/>
                </div><!--START TOOL BAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar"/><!--END TOOL BAR FILTER--></div><!-- END FILTER--><!-- START TABELA--><div class="col addBorderLeftRight borderColor">
                <div class="box-table table-responsive">
                  <xsl:call-template name="filter-az">
                    <xsl:with-param name="name" select="rows/content/filter/value/filtro/@name"/>
                    <xsl:with-param name="value" select="rows/content/filter/value/filtro"/>
                    <xsl:with-param name="type" select="'filter_aznum'"/>
                  </xsl:call-template>
                  <div class="table-container"><!--  CONTEXT-MENU  --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu">
                      <xsl:with-param name="contextId" select="'table'"/>
                    </xsl:apply-templates>
                    <table class="IGRP_table default-table" data-control="table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/col1">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/col1"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/col2">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/col2"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/col3">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/col3"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/col4">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/col4"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/col5">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/col5"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/col6">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/col6"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/col7">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/col7"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/col8">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/col8"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/col9">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/col9"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/col10">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/col10"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/col11">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/col11"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/col12">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/col12"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/col13">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/col13"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/col14">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/col14"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/col15">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/col15"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <tr row="{position()}" class="IGRP_contextMenu">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="col1">
                              <td align="" data-row="{position()}" data-title="{../../label/col1}" class="text">
                                <xsl:value-of select="col1"/>
                                <xsl:apply-templates mode="cxtmenu-resp" select="//rows/content/table/context-menu">
                                  <xsl:with-param name="ctx" select="context-menu"/>
                                </xsl:apply-templates>
                              </td>
                            </xsl:if>
                            <xsl:if test="col2">
                              <td align="" data-row="{position()}" data-title="{../../label/col2}" class="text">
                                <xsl:value-of select="col2"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="col3">
                              <td align="" data-row="{position()}" data-title="{../../label/col3}" class="text">
                                <xsl:value-of select="col3"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="col4">
                              <td align="" data-row="{position()}" data-title="{../../label/col4}" class="text">
                                <xsl:value-of select="col4"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="col5">
                              <td align="" data-row="{position()}" data-title="{../../label/col5}" class="text">
                                <xsl:value-of select="col5"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="col6">
                              <td align="" data-row="{position()}" data-title="{../../label/col6}" class="text">
                                <xsl:value-of select="col6"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="col7">
                              <td align="" data-row="{position()}" data-title="{../../label/col7}" class="text">
                                <xsl:value-of select="col7"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="col8">
                              <td align="" data-row="{position()}" data-title="{../../label/col8}" class="text">
                                <xsl:value-of select="col8"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="col9">
                              <td align="" data-row="{position()}" data-title="{../../label/col9}" class="text">
                                <xsl:value-of select="col9"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="col10">
                              <td align="" data-row="{position()}" data-title="{../../label/col10}" class="text">
                                <xsl:value-of select="col10"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="col11">
                              <td align="" data-row="{position()}" data-title="{../../label/col11}" class="text">
                                <xsl:value-of select="col11"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="col12">
                              <td align="" data-row="{position()}" data-title="{../../label/col12}" class="text">
                                <xsl:value-of select="col12"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="col13">
                              <td align="" data-row="{position()}" data-title="{../../label/col13}" class="text">
                                <xsl:value-of select="col13"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="col14">
                              <td align="" data-row="{position()}" data-title="{../../label/col14}" class="text">
                                <xsl:value-of select="col14"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="col15">
                              <td align="" data-row="{position()}" data-title="{../../label/col15}" class="text">
                                <xsl:value-of select="col15"/>
                              </td>
                            </xsl:if>
                          </tr>
                        </xsl:for-each>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div><!-- END TABELA--></form><!-- END YOUR CODE HERE --><div class="_clear"/>
          </div>
          <div class="_clear"/>
        </div><!--FOOTER PAGE--><div id="igrp-footerPage">
          <xsl:call-template name="footer"/>
        </div>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150609"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150609"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150609"/>
  <xsl:include href="../../xsl/tmpl/IGRP-context.tmpl.xsl?v=20150609"/>
</xsl:stylesheet>
