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
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FILTER--><div class="box-content resetPadding">
                <div class="col">
                  <xsl:if test="rows/content/form/label/work_item">
                    <div class="col-1-4 item" item-name="work_item">
                      <div class="igrp_item text">
                        <label>
                          <xsl:if test="string-length(rows/content/form/label/work_item) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/form/label/work_item" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/form/label/work_item" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/work_item/@name}" value="{rows/content/form/value/work_item}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/work_item"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/form/label/data_inicio">
                    <div class="col-1-4 item" item-name="data_inicio">
                      <div class="igrp_item date">
                        <label>
                          <xsl:if test="string-length(rows/content/form/label/data_inicio) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/form/label/data_inicio" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/form/label/data_inicio" disable-output-escaping="yes"/>
                        </label>
                        <div class="itemIcon">
                          <input type="text" name="{rows/content/form/value/data_inicio/@name}" value="{rows/content/form/value/data_inicio}" class="date" trel="IGRP_datePicker">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/form/label/data_inicio"/>
                            </xsl:call-template>
                          </input>
                          <div class="calendar"/>
                        </div>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/form/label/data_fim">
                    <div class="col-1-4 item" item-name="data_fim">
                      <div class="igrp_item date">
                        <label>
                          <xsl:if test="string-length(rows/content/form/label/data_fim) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/form/label/data_fim" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/form/label/data_fim" disable-output-escaping="yes"/>
                        </label>
                        <div class="itemIcon">
                          <input type="text" name="{rows/content/form/value/data_fim/@name}" value="{rows/content/form/value/data_fim}" class="date" trel="IGRP_datePicker">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/form/label/data_fim"/>
                            </xsl:call-template>
                          </input>
                          <div class="calendar"/>
                        </div>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <div class="_clear"/>
                </div><!--START TOOL BAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/form/tools-bar"/><!--END TOOL BAR FILTER--></div><!-- END FILTER--><!-- START TABELA--><div class="col addBorderLeftRight borderColor">
                <div class="box-table table-responsive">
                  <div class="table-container">
                    <table class="IGRP_table default-table" data-control="table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/work_item">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/work_item"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/data_inicio">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/data_inicio"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/data_fim">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/data_fim"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/tipo_tarefa">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/tipo_tarefa"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/fase">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/fase"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/estado">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/estado"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <tr row="{position()}" class="">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="work_item">
                              <td align="" data-row="{position()}" data-title="{../../label/work_item}" class="js_passa_valor">
                                <a class="link bClick" title="Passa Valor" target="lookup">
                                  <xsl:value-of select="work_item" disable-output-escaping="yes"/>
                                </a>
                              </td>
                            </xsl:if>
                            <xsl:if test="data_inicio">
                              <td align="" data-row="{position()}" data-title="{../../label/data_inicio}" class="date">
                                <xsl:value-of select="data_inicio"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="data_fim">
                              <td align="" data-row="{position()}" data-title="{../../label/data_fim}" class="date">
                                <xsl:value-of select="data_fim"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="tipo_tarefa">
                              <td align="" data-row="{position()}" data-title="{../../label/tipo_tarefa}" class="text">
                                <xsl:value-of select="tipo_tarefa"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="fase">
                              <td align="" data-row="{position()}" data-title="{../../label/fase}" class="text">
                                <xsl:value-of select="fase"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="estado">
                              <td align="" data-row="{position()}" data-title="{../../label/estado}" class="text">
                                <xsl:value-of select="estado"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150825"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150825"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150825"/>
  <xsl:include href="../../xsl/tmpl/IGRP-context.tmpl.xsl?v=20150825"/>
</xsl:stylesheet>
