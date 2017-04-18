<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html><!--XSL Generator (RED/DIM 2015)--><head><!--HOME-HEADER--><xsl:call-template name="home-header"/>
      </head>
      <body class="bodyColor">
        <div class="IGRP_overlay"/><!--HOME TOP--><xsl:call-template name="home-top-main"/><!--HOME--><div id="igrp-bodyPage"><!--HOME LEFT--><xsl:if test="not(rows/target) or rows/target!='_blank'"><!--MENU--><div class="bodyPageLeft">
              <xsl:apply-templates mode="slide-menu" select="document(rows/slide-menu/@file)"/>
            </div>
          </xsl:if><!--HOME RIGTH--><div class="bodyPageRigth"><!-- START YOUR CODE HERE --><!-- SHOW TABLET AND MOBILE TITLE --><div class="box-head showTabMobile">
              <xsl:value-of select="rows/content/title"/>
            </div><!-- SHOW NOTIFICATION MESSAGES--><xsl:apply-templates mode="notif_messages" select="rows/content/messages"/><div class="colCenter"><class="box-content resetPadding"><form action="#" method="post" id="formular_default" name="formular_default" class="default_filter"><!-- SHOW HIDDEN--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FILTER--><div class="box-content resetPadding">
                <div class="col">
                  <xsl:if test="rows/content/filter/label/nome">
                    <div class="col-1-4 item" item-name="nome">
                      <div class="igrp_item text">
                        <label>
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
                  <xsl:if test="rows/content/filter/label/morada">
                    <div class="col-1-4 item" item-name="morada">
                      <div class="igrp_item LOOKUP_GEOG">
                        <label>
                          <xsl:value-of select="rows/content/filter/label/morada" disable-output-escaping="yes"/>
                        </label>
                        <div class="itemIcon">
                          <input type="LOOKUP_GEOG" name="{rows/content/filter/value/morada/@name}" value="{rows/content/filter/value/morada}" class="LOOKUP_GEOG">
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
                        </div>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/filter/label/n_socio">
                    <div class="col-1-4 item" item-name="n_socio">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/filter/label/n_socio" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/filter/value/n_socio/@name}" value="{rows/content/filter/value/n_socio}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/n_socio"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/filter/label/bi">
                    <div class="col-1-4 item" item-name="bi">
                      <div class="igrp_item LOOKUP_BI">
                        <label>
                          <xsl:value-of select="rows/content/filter/label/bi" disable-output-escaping="yes"/>
                        </label>
                        <div class="itemIcon">
                          <input type="LOOKUP_BI" name="{rows/content/filter/value/bi/@name}" value="{rows/content/filter/value/bi}" class="LOOKUP_BI">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/filter/label/bi"/>
                            </xsl:call-template>
                          </input>
                          <xsl:call-template name="lookup-tool">
                            <xsl:with-param name="page" select="'LOOKUP'"/>
                            <xsl:with-param name="action" select="'LOOKUP_BI'"/>
                            <xsl:with-param name="name" select="rows/content/filter/value/bi/@name"/>
                            <xsl:with-param name="js_lookup" select="rows/content/filter/lookup/bi"/>
                          </xsl:call-template>
                        </div>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/filter/label/estado">
                    <div class="col-1-4 item" item-name="estado">
                      <div class="igrp_item select">
                        <label>
                          <xsl:value-of select="rows/content/filter/label/estado" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/filter/list/estado/@name}" chosen="select" data-placeholder="{rows/content/filter/list/estado/option[position() = 1]}" class="select">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/estado"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/filter/list/estado/option[position() != 1]">
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
                  <div class="_clear"/>
                </div><!--START TOOL BAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar"/><!--END TOOL BAR FILTER--></div><!-- END FILTER--><!-- START TABELA--><div class="box-content resetPadding">
                <div class="box-table table-responsive">
                  <div class="table-container">
                    <table class="IGRP_table default-table" data-control="table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/nome">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/nome"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/apelido">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/apelido"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/morada">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/morada"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/foto">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/foto"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/seleccionar">
                            <th class="checkbox sorttable_nosort" align="center">
                              <input type="checkbox" name="p_seleccionar_all" class="IGRP_checkall"/>
                              <xsl:value-of select="rows/content/table/label/seleccionar"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <tr row="{position()}" class="">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="nome">
                              <td align="" data-row="{position()}" data-title="{../../label/nome}">
                                <xsl:value-of select="nome"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="apelido">
                              <td align="" data-row="{position()}" data-title="{../../label/apelido}">
                                <xsl:value-of select="apelido"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="morada">
                              <td align="" data-row="{position()}" data-title="{../../label/morada}">
                                <xsl:value-of select="morada"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="foto">
                              <td align="" data-row="{position()}" data-title="{../../label/foto}">
                                <xsl:choose>
                                  <xsl:when test="foto != ''">
                                    <a href="{foto}" class="link bClick" target="_blank" name="foto">
                                      <xsl:value-of select="foto_desc" disable-output-escaping="yes"/>
                                    </a>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <xsl:value-of select="foto_desc" disable-output-escaping="yes"/>
                                  </xsl:otherwise>
                                </xsl:choose>
                              </td>
                            </xsl:if>
                            <xsl:if test="seleccionar">
                              <td align="" data-row="{position()}" data-title="{../../label/seleccionar}">
                                <xsl:if test="seleccionar != '-0'">
                                  <input type="checkbox" name="p_seleccionar" value="{seleccionar}">
                                    <xsl:if test="seleccionar_check=seleccionar">
                                      <xsl:attribute name="checked">checked</xsl:attribute>
                                    </xsl:if>
                                  </input>
                                </xsl:if>
                                <xsl:value-of select="seleccionar_desc"/>
                              </td>
                            </xsl:if>
                          </tr>
                        </xsl:for-each>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div><!-- END TABELA--></form>
            <div class="box-content resetPadding">
              <div class="_clear"/>
            </div><div class="_clear"/></div></div><div class="colLR">
              <div class="box-content resetPadding">
                <div class="box-content resetPadding">
                  <xsl:if test="rows/content/moradas"><!-- START CHARTS--><div class="col" graph-name="moradas">
                      <xsl:call-template name="igrp-graph">
                        <xsl:with-param name="table" select="rows/content/moradas"/>
                        <xsl:with-param name="chart_type" select="rows/content/moradas/chart_type"/>
                        <xsl:with-param name="height" select="150"/>
                        <xsl:with-param name="title" select="rows/content/moradas/caption"/>
                      </xsl:call-template>
                    </div><!-- END CHARTS--></xsl:if>
                  <xsl:if test="rows/content/socios"><!-- START CHARTS--><div class="col" graph-name="socios">
                      <xsl:call-template name="igrp-graph">
                        <xsl:with-param name="table" select="rows/content/socios"/>
                        <xsl:with-param name="chart_type" select="rows/content/socios/chart_type"/>
                        <xsl:with-param name="height" select="150"/>
                        <xsl:with-param name="title" select="rows/content/socios/caption"/>
                      </xsl:call-template>
                    </div><!-- END CHARTS--></xsl:if>
                  <div class="_clear"/>
                </div>
                <div class="_clear"/>
              </div>
            </div><!-- END YOUR CODE HERE --><div class="_clear"/>
          </div>
          <xsl:call-template name="link-opener"/>
          <div class="_clear"/>
        </div><!--FOOTER PAGE--><div id="igrp-footerPage">
          <xsl:call-template name="footer"/>
        </div>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150306"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150306"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150306"/>
  <xsl:include href="../../xsl/tmpl/IGRP-graph.tmpl.xsl?v=20150306"/>
</xsl:stylesheet>
