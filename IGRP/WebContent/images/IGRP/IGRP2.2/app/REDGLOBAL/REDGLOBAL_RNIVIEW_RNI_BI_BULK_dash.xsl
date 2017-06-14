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
                  <xsl:if test="rows/content/filter/label/fw_db">
                    <div class="col-1-4 item" item-name="fw_db">
                      <div class="igrp_item select">
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/fw_db) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/fw_db" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/fw_db" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/filter/list/fw_db/@name}" chosen="select" data-placeholder="{rows/content/filter/list/fw_db/option[position() = 1]}" class="select">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/fw_db"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/filter/list/fw_db/option[position() != 1]">
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
                        <input type="text" name="{rows/content/filter/value/nome/@name}" value="{rows/content/filter/value/nome}" class="text" maxlength="100">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/nome"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/filter/label/bi">
                    <div class="col-1-4 item" item-name="bi">
                      <div class="igrp_item number">
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/bi) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/bi" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/bi" disable-output-escaping="yes"/>
                        </label>
                        <input type="number" name="{rows/content/filter/value/bi/@name}" value="{rows/content/filter/value/bi}" class="number" maxlength="22">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/bi"/>
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
                  <div class="table-container">
                    <table class="IGRP_table default-table" data-control="table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/bi">
                            <th align="center">
                              <xsl:value-of select="rows/content/table/label/bi"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/nome">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/nome"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/dt_nasc">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/dt_nasc"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/sexo">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/sexo"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/nome_pai">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/nome_pai"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/nome_mae">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/nome_mae"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/name">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/name"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/numero">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/numero"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/nu_bi">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/nu_bi"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/nm_mae">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/nm_mae"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/nm_pai">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/nm_pai"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/estado_civil">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/estado_civil"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/sexo">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/sexo"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/morada">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/morada"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/nat_freguesia">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/nat_freguesia"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/dt_emissao">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/dt_emissao"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/dt_validade">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/dt_validade"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/emissor">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/emissor"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/nat_ilha">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/nat_ilha"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/res_ilha">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/res_ilha"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/nat_concelho">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/nat_concelho"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/res_concelho">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/res_concelho"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/res_freguesia">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/res_freguesia"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/doctype">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/doctype"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/estcivil_cad">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/estcivil_cad"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <tr row="{position()}" class="">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="bi">
                              <td align="center" data-row="{position()}" data-title="{../../label/bi}" class="js_passa_valor">
                                <a class="link bClick" title="Passa Valor" target="lookup">
                                  <xsl:value-of select="bi" disable-output-escaping="yes"/>
                                </a>
                              </td>
                            </xsl:if>
                            <xsl:if test="nome">
                              <td align="left" data-row="{position()}" data-title="{../../label/nome}" class="js_passa_valor">
                                <a class="link bClick" title="Passa Valor" target="lookup">
                                  <xsl:value-of select="nome" disable-output-escaping="yes"/>
                                </a>
                              </td>
                            </xsl:if>
                            <xsl:if test="dt_nasc">
                              <td align="left" data-row="{position()}" data-title="{../../label/dt_nasc}" class="text">
                                <xsl:value-of select="dt_nasc"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="sexo">
                              <td align="left" data-row="{position()}" data-title="{../../label/sexo}" class="text">
                                <xsl:value-of select="sexo"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="nome_pai">
                              <td align="left" data-row="{position()}" data-title="{../../label/nome_pai}" class="text">
                                <xsl:value-of select="nome_pai"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="nome_mae">
                              <td align="left" data-row="{position()}" data-title="{../../label/nome_mae}" class="text">
                                <xsl:value-of select="nome_mae"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="name">
                              <td align="left" data-row="{position()}" data-title="{../../label/name}" class="hidden">
                                <xsl:value-of select="name"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="numero">
                              <td align="left" data-row="{position()}" data-title="{../../label/numero}" class="hidden">
                                <xsl:value-of select="numero"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="nu_bi">
                              <td align="left" data-row="{position()}" data-title="{../../label/nu_bi}" class="hidden">
                                <xsl:value-of select="nu_bi"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="nm_mae">
                              <td align="left" data-row="{position()}" data-title="{../../label/nm_mae}" class="hidden">
                                <xsl:value-of select="nm_mae"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="nm_pai">
                              <td align="left" data-row="{position()}" data-title="{../../label/nm_pai}" class="hidden">
                                <xsl:value-of select="nm_pai"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="estado_civil">
                              <td align="left" data-row="{position()}" data-title="{../../label/estado_civil}" class="hidden">
                                <xsl:value-of select="estado_civil"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="sexo">
                              <td align="left" data-row="{position()}" data-title="{../../label/sexo}" class="hidden">
                                <xsl:value-of select="sexo"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="morada">
                              <td align="left" data-row="{position()}" data-title="{../../label/morada}" class="hidden">
                                <xsl:value-of select="morada"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="nat_freguesia">
                              <td align="left" data-row="{position()}" data-title="{../../label/nat_freguesia}" class="hidden">
                                <xsl:value-of select="nat_freguesia"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="dt_emissao">
                              <td align="left" data-row="{position()}" data-title="{../../label/dt_emissao}" class="hidden">
                                <xsl:value-of select="dt_emissao"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="dt_validade">
                              <td align="left" data-row="{position()}" data-title="{../../label/dt_validade}" class="hidden">
                                <xsl:value-of select="dt_validade"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="emissor">
                              <td align="left" data-row="{position()}" data-title="{../../label/emissor}" class="hidden">
                                <xsl:value-of select="emissor"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="nat_ilha">
                              <td align="left" data-row="{position()}" data-title="{../../label/nat_ilha}" class="hidden">
                                <xsl:value-of select="nat_ilha"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="res_ilha">
                              <td align="left" data-row="{position()}" data-title="{../../label/res_ilha}" class="hidden">
                                <xsl:value-of select="res_ilha"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="nat_concelho">
                              <td align="left" data-row="{position()}" data-title="{../../label/nat_concelho}" class="hidden">
                                <xsl:value-of select="nat_concelho"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="res_concelho">
                              <td align="left" data-row="{position()}" data-title="{../../label/res_concelho}" class="hidden">
                                <xsl:value-of select="res_concelho"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="res_freguesia">
                              <td align="left" data-row="{position()}" data-title="{../../label/res_freguesia}" class="hidden">
                                <xsl:value-of select="res_freguesia"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="doctype">
                              <td align="left" data-row="{position()}" data-title="{../../label/doctype}" class="hidden">
                                <xsl:value-of select="doctype"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="estcivil_cad">
                              <td align="left" data-row="{position()}" data-title="{../../label/estcivil_cad}" class="hidden">
                                <xsl:value-of select="estcivil_cad"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150312"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150312"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150312"/>
  <xsl:include href="../../xsl/tmpl/IGRP-context.tmpl.xsl?v=20150312"/>
</xsl:stylesheet>
