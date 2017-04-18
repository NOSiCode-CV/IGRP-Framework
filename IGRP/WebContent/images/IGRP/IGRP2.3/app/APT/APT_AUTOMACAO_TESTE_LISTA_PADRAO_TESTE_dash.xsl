<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html><!--XSL Generator (RED/DIM 2015)--><head><!--HOME-HEADER--><xsl:call-template name="home-header"/>
      </head>
      <body class="bodyColor">
        <div class="IGRP_overlay"/><!--HOME TOP--><xsl:call-template name="home-top-main"/><!--HOME--><div id="igrp-bodyPage"><!--HOME LEFT--><xsl:call-template name="home-slide-menu"/><!--HOME RIGTH--><div class="bodyPageRigth"><!-- START YOUR CODE HERE --><!-- SHOW TABLET AND MOBILE TITLE --><div class="box-head showTabMobile">
              <xsl:value-of select="rows/content/title"/>
            </div><!-- SHOW NOTIFICATION MESSAGES--><xsl:apply-templates mode="notif_messages" select="rows/content/messages"/><!-- START SIMPLE-MENU --><xsl:apply-templates mode="simple-menu" select="rows/content/menu"/><!-- END SIMPLE-MENU --><form action="#" method="post" id="formular_default" name="formular_default" class="default_filter"><!-- SHOW HIDDEN--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FILTER--><div class="box-content resetPadding">
                <div class="col">
                  <xsl:if test="rows/content/filter/label/aplicacao">
                    <div class="col-1-4 item" item-name="aplicacao">
                      <div class="igrp_item select">
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/aplicacao) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/aplicacao" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/aplicacao" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/filter/list/aplicacao/@name}" chosen="select" data-placeholder="{rows/content/filter/list/aplicacao/option[position() = 1]}" class="select">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/aplicacao"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/filter/list/aplicacao/option[position() != 1]">
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
                  <xsl:if test="rows/content/filter/label/nome">
                    <div class="col-1-4 item" item-name="nome">
                      <div class="igrp_item text">
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/nome) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/nome" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/nome" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/filter/value/nome/@name}" value="{rows/content/filter/value/nome}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/nome"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/filter/label/vista">
                    <div class="col-1-4 item" item-name="vista">
                      <div class="igrp_item text">
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/vista) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/vista" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/vista" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/filter/value/vista/@name}" value="{rows/content/filter/value/vista}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/vista"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <div class="_clear"/>
                </div><!--START TOOL BAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar"/><!--END TOOL BAR FILTER--></div><!-- END FILTER--><!-- START TABELA--><div class="col addBorderLeftRight borderColor"><!--START TOOL BAR TABLE--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar">
                  <xsl:with-param name="isTable" select="'true'"/>
                  <xsl:with-param name="rel" select="'table'"/>
                </xsl:apply-templates><!--END TOOL BAR TABLE--><div class="box-table table-responsive">
                  <xsl:call-template name="filter-az">
                    <xsl:with-param name="name" select="rows/content/filter/value/filtro/@name"/>
                    <xsl:with-param name="value" select="rows/content/filter/value/filtro"/>
                    <xsl:with-param name="type" select="'filter_az'"/>
                  </xsl:call-template>
                  <div class="table-container"><!--  CONTEXT-MENU  --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu">
                      <xsl:with-param name="contextId" select="'table'"/>
                    </xsl:apply-templates>
                    <table class="IGRP_table default-table" data-control="table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/aplicacao">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/aplicacao"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/nome">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/nome"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/vista">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/vista"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/select_coluna">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/select_coluna"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/where_coluna">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/where_coluna"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/campo">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/campo"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <tr row="{position()}" class="IGRP_contextMenu">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="aplicacao">
                              <td align="" data-row="{position()}" data-title="{../../label/aplicacao}" class="text">
                                <xsl:value-of select="aplicacao"/>
                                <xsl:apply-templates mode="cxtmenu-resp" select="//rows/content/table/context-menu">
                                  <xsl:with-param name="ctx" select="context-menu"/>
                                </xsl:apply-templates>
                              </td>
                            </xsl:if>
                            <xsl:if test="nome">
                              <td align="" data-row="{position()}" data-title="{../../label/nome}" class="text">
                                <xsl:value-of select="nome"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="vista">
                              <td align="" data-row="{position()}" data-title="{../../label/vista}" class="text">
                                <xsl:value-of select="vista"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="select_coluna">
                              <td align="" data-row="{position()}" data-title="{../../label/select_coluna}" class="text">
                                <xsl:value-of select="select_coluna"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="where_coluna">
                              <td align="" data-row="{position()}" data-title="{../../label/where_coluna}" class="text">
                                <xsl:value-of select="where_coluna"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="campo">
                              <td align="" data-row="{position()}" data-title="{../../label/campo}" class="text">
                                <xsl:value-of select="campo"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150320"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150320"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150320"/>
  <xsl:include href="../../xsl/tmpl/IGRP-menu.tmpl.xsl?v=20150320"/>
  <xsl:include href="../../xsl/tmpl/IGRP-context.tmpl.xsl?v=20150320"/>
</xsl:stylesheet>
