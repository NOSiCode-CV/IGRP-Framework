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
            </div><!-- SHOW NOTIFICATION MESSAGES--><xsl:apply-templates mode="notif_messages" select="rows/content/messages"/>
            <form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!-- SHOW HIDDEN--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FILTER--><div class="box-content resetPadding">
                <div class="col">
                  <xsl:if test="rows/content/form/label/nome">
                    <div class="col-1-4 item" item-name="nome">
                      <div class="igrp_item text">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/nome" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/nome/@name}" value="{rows/content/form/value/nome}" class="text required" maxlength="50">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/nome"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/form/label/apelido">
                    <div class="col-1-4 item" item-name="apelido">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/apelido" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/apelido/@name}" value="{rows/content/form/value/apelido}" class="text" maxlength="50">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/apelido"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/form/label/id_morada">
                    <div class="col-1-4 item" item-name="id_morada">
                      <div class="igrp_item number">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/id_morada" disable-output-escaping="yes"/>
                        </label>
                        <input type="number" name="{rows/content/form/value/id_morada/@name}" value="{rows/content/form/value/id_morada}" class="number required" maxlength="22">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/id_morada"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/form/label/morada">
                    <div class="col-1-4 item" item-name="morada">
                      <div class="igrp_item text">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/morada" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/morada/@name}" value="{rows/content/form/value/morada}" class="text required" maxlength="250">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/morada"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/form/label/foto_id">
                    <div class="col-1-4 item" item-name="foto_id">
                      <div class="igrp_item number">
                        <label>
                          <xsl:value-of select="rows/content/form/label/foto_id" disable-output-escaping="yes"/>
                        </label>
                        <input type="number" name="{rows/content/form/value/foto_id/@name}" value="{rows/content/form/value/foto_id}" class="number" maxlength="22">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/foto_id"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/form/label/nu_socio">
                    <div class="col-1-4 item" item-name="nu_socio">
                      <div class="igrp_item number">
                        <label>
                          <xsl:value-of select="rows/content/form/label/nu_socio" disable-output-escaping="yes"/>
                        </label>
                        <input type="number" name="{rows/content/form/value/nu_socio/@name}" value="{rows/content/form/value/nu_socio}" class="number" maxlength="22">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/nu_socio"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/form/label/estado">
                    <div class="col-1-4 item" item-name="estado">
                      <div class="igrp_item select">
                        <label>
                          <xsl:value-of select="rows/content/form/label/estado" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/estado/@name}" chosen="select" data-placeholder="{rows/content/form/list/estado/option[position() = 1]}" class="select">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/estado"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/estado/option[position() != 1]">
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
                  <xsl:if test="rows/content/form/label/nu_bi">
                    <div class="col-1-4 item" item-name="nu_bi">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/nu_bi" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/nu_bi/@name}" value="{rows/content/form/value/nu_bi}" class="text" maxlength="20">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/nu_bi"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/form/label/nif">
                    <div class="col-1-4 item" item-name="nif">
                      <div class="igrp_item number">
                        <label>
                          <xsl:value-of select="rows/content/form/label/nif" disable-output-escaping="yes"/>
                        </label>
                        <input type="number" name="{rows/content/form/value/nif/@name}" value="{rows/content/form/value/nif}" class="number" maxlength="22">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/nif"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/form/label/telefone">
                    <div class="col-1-4 item" item-name="telefone">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/telefone" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/telefone/@name}" value="{rows/content/form/value/telefone}" class="text" maxlength="50">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/telefone"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/form/label/telemovel">
                    <div class="col-1-4 item" item-name="telemovel">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/telemovel" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/telemovel/@name}" value="{rows/content/form/value/telemovel}" class="text" maxlength="50">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/telemovel"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <div class="_clear"/>
                </div><!--START TOOL BAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/form/tools-bar"/><!--END TOOL BAR FILTER--></div><!-- END FILTER--><!-- START TABELA--><div class="box-content resetPadding"><!--START TOOL BAR TABLE--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar">
                  <xsl:with-param name="isTable" select="'true'"/>
                  <xsl:with-param name="rel" select="table"/>
                </xsl:apply-templates><!--END TOOL BAR TABLE--><div class="box-table table-responsive">
                  <div class="table-container"><!--  CONTEXT-MENU  --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu">
                      <xsl:with-param name="contextId" select="'table'"/>
                    </xsl:apply-templates>
                    <table class="IGRP_table default-table" data-control="table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/id">
                            <th class="checkbox sorttable_nosort" align="center">
                              <input type="checkbox" name="p_id_all" class="IGRP_checkall"/>
                              <xsl:value-of select="rows/content/table/label/id"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/nome">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/nome"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/apelido">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/apelido"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/id_morada">
                            <th align="center">
                              <xsl:value-of select="rows/content/table/label/id_morada"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/morada">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/morada"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/foto_id">
                            <th align="center">
                              <xsl:value-of select="rows/content/table/label/foto_id"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/nu_socio">
                            <th align="center">
                              <xsl:value-of select="rows/content/table/label/nu_socio"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/estado">
                            <th align="center">
                              <xsl:value-of select="rows/content/table/label/estado"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/nu_bi">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/nu_bi"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/nif">
                            <th align="center">
                              <xsl:value-of select="rows/content/table/label/nif"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/telefone">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/telefone"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/telemovel">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/telemovel"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <tr row="{position()}" class="IGRP_contextMenu">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="id">
                              <td align="center" data-row="{position()}" data-title="{../../label/id}">
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
                            <xsl:if test="nome">
                              <td align="left" data-row="{position()}" data-title="{../../label/nome}">
                                <xsl:value-of select="nome"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="apelido">
                              <td align="left" data-row="{position()}" data-title="{../../label/apelido}">
                                <xsl:value-of select="apelido"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="id_morada">
                              <td align="center" data-row="{position()}" data-title="{../../label/id_morada}">
                                <xsl:value-of select="id_morada"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="morada">
                              <td align="left" data-row="{position()}" data-title="{../../label/morada}">
                                <xsl:value-of select="morada"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="foto_id">
                              <td align="center" data-row="{position()}" data-title="{../../label/foto_id}">
                                <xsl:choose>
                                  <xsl:when test="foto_id != ''">
                                    <a href="{foto_id}" class="link bClick" target="_blank" name="foto_id">
                                      <xsl:value-of select="foto_id_desc" disable-output-escaping="yes"/>
                                    </a>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <xsl:value-of select="foto_id_desc" disable-output-escaping="yes"/>
                                  </xsl:otherwise>
                                </xsl:choose>
                              </td>
                            </xsl:if>
                            <xsl:if test="nu_socio">
                              <td align="center" data-row="{position()}" data-title="{../../label/nu_socio}">
                                <xsl:value-of select="nu_socio"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="estado">
                              <td align="center" data-row="{position()}" data-title="{../../label/estado}">
                                <xsl:value-of select="estado"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="nu_bi">
                              <td align="left" data-row="{position()}" data-title="{../../label/nu_bi}">
                                <xsl:value-of select="nu_bi"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="nif">
                              <td align="center" data-row="{position()}" data-title="{../../label/nif}">
                                <xsl:value-of select="nif"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="telefone">
                              <td align="left" data-row="{position()}" data-title="{../../label/telefone}">
                                <xsl:value-of select="telefone"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="telemovel">
                              <td align="left" data-row="{position()}" data-title="{../../label/telemovel}">
                                <xsl:value-of select="telemovel"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150306"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150306"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150306"/>
  <xsl:include href="../../xsl/tmpl/IGRP-context.tmpl.xsl?v=20150306"/>
</xsl:stylesheet>
