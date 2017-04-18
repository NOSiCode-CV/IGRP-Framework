<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html><!--XSL Generator (RED/DIM 2015)--><head><!--HOME-HEADER--><xsl:call-template name="home-header"/>
      </head>
      <body class="bodyColor">
        <div class="IGRP_overlay"/><!--HOME TOP--><xsl:call-template name="home-top-main"/><!--HOME--><div id="igrp-bodyPage"><!--HOME LEFT--><xsl:call-template name="home-slide-menu"/><!--HOME RIGTH--><div class="bodyPageRigth"><!-- START YOUR CODE HERE --><!-- SHOW TABLET AND MOBILE TITLE --><div class="box-head showTabMobile">
              <xsl:value-of select="rows/content/title"/>
            </div><!-- SHOW NOTIFICATION MESSAGES--><xsl:apply-templates mode="notif_messages" select="rows/content/messages"/>
            <form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!-- SHOW HIDDEN--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FORM--><!--START TOOLS BAR FROM--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar"/><!--END TOOLS BAR FORM--><div class="col addMarginTop" sep-name="form">
                <xsl:if test="rows/content/form/label/xsd">
                  <div class="col-1-4 item" item-name="xsd">
                    <div class="igrp_item textarea">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/xsd) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/xsd" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/xsd" disable-output-escaping="yes"/>
                      </label>
                      <textarea name="{rows/content/form/value/xsd/@name}" class="textarea" maxlength="4000">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/xsd"/>
                        </xsl:call-template>
                        <xsl:value-of select="rows/content/form/value/xsd" disable-output-escaping="yes"/>
                      </textarea>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/xml">
                  <div class="col-1-4 item" item-name="xml">
                    <div class="igrp_item textarea">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/xml) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/xml" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/xml" disable-output-escaping="yes"/>
                      </label>
                      <textarea name="{rows/content/form/value/xml/@name}" class="textarea" maxlength="4000">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/xml"/>
                        </xsl:call-template>
                        <xsl:value-of select="rows/content/form/value/xml" disable-output-escaping="yes"/>
                      </textarea>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/tempo_esperado">
                  <div class="col-1-4 item" item-name="tempo_esperado">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/tempo_esperado) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/tempo_esperado" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/tempo_esperado" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/tempo_esperado/@name}" value="{rows/content/form/value/tempo_esperado}" class="text" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/tempo_esperado"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/tempo_demorado">
                  <div class="col-1-4 item" item-name="tempo_demorado">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/tempo_demorado) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/tempo_demorado" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/tempo_demorado" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/tempo_demorado/@name}" value="{rows/content/form/value/tempo_demorado}" class="text" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/tempo_demorado"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/resultado">
                  <div class="col-1-4 item" item-name="resultado">
                    <div class="igrp_item textarea">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/resultado) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/resultado" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/resultado" disable-output-escaping="yes"/>
                      </label>
                      <textarea name="{rows/content/form/value/resultado/@name}" class="textarea" maxlength="4000">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/resultado"/>
                        </xsl:call-template>
                        <xsl:value-of select="rows/content/form/value/resultado" disable-output-escaping="yes"/>
                      </textarea>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/xml_resultado">
                  <div class="col-1-4 item" item-name="xml_resultado">
                    <div class="igrp_item textarea">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/xml_resultado) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/xml_resultado" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/xml_resultado" disable-output-escaping="yes"/>
                      </label>
                      <textarea name="{rows/content/form/value/xml_resultado/@name}" class="textarea" maxlength="4000">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/xml_resultado"/>
                        </xsl:call-template>
                        <xsl:value-of select="rows/content/form/value/xml_resultado" disable-output-escaping="yes"/>
                      </textarea>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/tempo_total_esperado">
                  <div class="col-1-4 item" item-name="tempo_total_esperado">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/tempo_total_esperado) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/tempo_total_esperado" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/tempo_total_esperado" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/tempo_total_esperado/@name}" value="{rows/content/form/value/tempo_total_esperado}" class="text" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/tempo_total_esperado"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <div class="_clear"/>
              </div><!-- START TABELA--><div class="col addBorderLeftRight borderColor">
                <div class="box-table table-responsive">
                  <div class="table-container"><!--  CONTEXT-MENU  --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu">
                      <xsl:with-param name="contextId" select="'table'"/>
                    </xsl:apply-templates>
                    <table class="IGRP_table default-table" data-control="table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/id">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/id"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/iteracao_list">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/iteracao_list"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/tipo_teste_list">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/tipo_teste_list"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/tempo_esperado_list">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/tempo_esperado_list"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/tempo_demorado_list">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/tempo_demorado_list"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <tr row="{position()}" class="IGRP_contextMenu">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="id">
                              <td align="" data-row="{position()}" data-title="{../../label/id}" class="total">
                                <xsl:value-of select="id"/>
                                <xsl:apply-templates mode="cxtmenu-resp" select="//rows/content/table/context-menu">
                                  <xsl:with-param name="ctx" select="context-menu"/>
                                </xsl:apply-templates>
                              </td>
                            </xsl:if>
                            <xsl:if test="iteracao_list">
                              <td align="" data-row="{position()}" data-title="{../../label/iteracao_list}" class="text">
                                <xsl:value-of select="iteracao_list"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="tipo_teste_list">
                              <td align="" data-row="{position()}" data-title="{../../label/tipo_teste_list}" class="text">
                                <xsl:value-of select="tipo_teste_list"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="tempo_esperado_list">
                              <td align="" data-row="{position()}" data-title="{../../label/tempo_esperado_list}" class="text">
                                <xsl:value-of select="tempo_esperado_list"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="tempo_demorado_list">
                              <td align="" data-row="{position()}" data-title="{../../label/tempo_demorado_list}" class="text">
                                <xsl:value-of select="tempo_demorado_list"/>
                              </td>
                            </xsl:if>
                          </tr>
                        </xsl:for-each>
                      </tbody>
                      <tfoot>
                        <tr>
                          <xsl:if test="rows/content/table/label/id">
                            <td align="">
                              <xsl:value-of select="rows/content/table/value/row[@total='yes']/id"/>
                            </td>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/iteracao_list">
                            <td align="">
                              <xsl:value-of select="rows/content/table/value/row[@total='yes']/iteracao_list"/>
                            </td>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/tipo_teste_list">
                            <td align="">
                              <xsl:value-of select="rows/content/table/value/row[@total='yes']/tipo_teste_list"/>
                            </td>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/tempo_esperado_list">
                            <td align="">
                              <xsl:value-of select="rows/content/table/value/row[@total='yes']/tempo_esperado_list"/>
                            </td>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/tempo_demorado_list">
                            <td align="">
                              <xsl:value-of select="rows/content/table/value/row[@total='yes']/tempo_demorado_list"/>
                            </td>
                          </xsl:if>
                        </tr>
                      </tfoot>
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
  <xsl:include href="../../xsl/tmpl/IGRP-context.tmpl.xsl?v=20150320"/>
</xsl:stylesheet>
