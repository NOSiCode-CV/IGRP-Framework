<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html><!--XSL Generator (RED/DIM 2015)--><head><!--HOME-HEADER--><xsl:call-template name="home-header"/>
      </head>
      <body class="bodyColor">
        <div class="IGRP_overlay"/><!--HOME TOP--><xsl:call-template name="home-top-main"/><!--HOME--><div id="igrp-bodyPage"><!--HOME LEFT--><xsl:call-template name="home-slide-menu"/><!--HOME RIGTH--><div class="bodyPageRigth"><!-- START YOUR CODE HERE --><!-- SHOW TABLET AND MOBILE TITLE --><div class="box-head showTabMobile">
              <xsl:value-of select="rows/content/title"/>
            </div><!-- SHOW NOTIFICATION MESSAGES--><xsl:apply-templates mode="notif_messages" select="rows/content/messages"/>
            <div class="colLR divLeft">
              <div class="box-content resetPadding"><!-- START LATERAL MENU  --><xsl:apply-templates mode="lateral-menu" select="rows/content/menu"/><!-- END LATERAL MENU  --><div class="col">
                  <div class="_clear"/>
                </div>
                <div class="_clear"/>
              </div>
            </div><div class="colCenter"><!-- START TAB MENU  --><xsl:apply-templates mode="tab-menu" select="rows/content/menu"/><!-- END TAB MENU  --><form action="#" method="post" id="formular_default" name="formular_default" class="default_filter"><!-- SHOW HIDDEN--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FILTER--><div class="box-content resetPadding">
                <div class="col">
                  <xsl:if test="rows/content/filter/label/data_inicio">
                    <div class="col-1-4 item" item-name="data_inicio">
                      <div class="igrp_item date">
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/data_inicio) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/data_inicio" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/data_inicio" disable-output-escaping="yes"/>
                        </label>
                        <div class="itemIcon">
                          <input type="text" name="{rows/content/filter/value/data_inicio/@name}" value="{rows/content/filter/value/data_inicio}" class="date" trel="IGRP_datePicker">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/filter/label/data_inicio"/>
                            </xsl:call-template>
                          </input>
                          <div class="calendar"/>
                        </div>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/filter/label/data_fim">
                    <div class="col-1-4 item" item-name="data_fim">
                      <div class="igrp_item date">
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/data_fim) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/data_fim" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/data_fim" disable-output-escaping="yes"/>
                        </label>
                        <div class="itemIcon">
                          <input type="text" name="{rows/content/filter/value/data_fim/@name}" value="{rows/content/filter/value/data_fim}" class="date" trel="IGRP_datePicker">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/filter/label/data_fim"/>
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
                </div><!--START TOOL BAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar"/><!--END TOOL BAR FILTER--></div><!-- END FILTER--><!-- START TABELA--><div class="col addBorderLeftRight borderColor">
                <div class="box-table table-responsive">
                  <div class="table-container">
                    <table class="IGRP_table default-table" data-control="table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/stage">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/stage"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/nr">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/nr"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/recurso">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/recurso"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/stat">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/stat"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <tr row="{position()}" class="">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="stage">
                              <td align="" data-row="{position()}" data-title="{../../label/stage}" class="link">
                                <xsl:choose>
                                  <xsl:when test="stage != ''">
                                    <a href="{stage}" class="link bClick" target="_blank" name="stage">
                                      <xsl:value-of select="stage_desc" disable-output-escaping="yes"/>
                                    </a>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <xsl:value-of select="stage_desc" disable-output-escaping="yes"/>
                                  </xsl:otherwise>
                                </xsl:choose>
                              </td>
                            </xsl:if>
                            <xsl:if test="nr">
                              <td align="" data-row="{position()}" data-title="{../../label/nr}" class="number">
                                <xsl:value-of select="nr"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="recurso">
                              <td align="" data-row="{position()}" data-title="{../../label/recurso}" class="number">
                                <xsl:value-of select="recurso"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="stat">
                              <td align="" data-row="{position()}" data-title="{../../label/stat}" class="text">
                                <xsl:value-of select="stat"/>
                              </td>
                            </xsl:if>
                          </tr>
                        </xsl:for-each>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div><!-- END TABELA--></form>
            <div class="col">
              <xsl:if test="rows/content/total_proj"><!-- START CHARTS--><div class="col-1-400" sep-name="total_proj">
                  <xsl:call-template name="igrp-graph">
                    <xsl:with-param name="table" select="rows/content/total_proj"/>
                    <xsl:with-param name="chart_type" select="rows/content/total_proj/chart_type"/>
                    <xsl:with-param name="height" select="300"/>
                    <xsl:with-param name="title" select="rows/content/total_proj/caption"/>
                  </xsl:call-template>
                </div><!-- END CHARTS--></xsl:if>
              <xsl:if test="rows/content/total_proj_fase"><!-- START CHARTS--><div class="col-1-400" sep-name="total_proj_fase">
                  <xsl:call-template name="igrp-graph">
                    <xsl:with-param name="table" select="rows/content/total_proj_fase"/>
                    <xsl:with-param name="chart_type" select="rows/content/total_proj_fase/chart_type"/>
                    <xsl:with-param name="height" select="300"/>
                    <xsl:with-param name="title" select="rows/content/total_proj_fase/caption"/>
                  </xsl:call-template>
                </div><!-- END CHARTS--></xsl:if>
              <div class="_clear"/>
            </div></div><!-- END YOUR CODE HERE --><div class="_clear"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-menu.tmpl.xsl?v=20150825"/>
  <xsl:include href="../../xsl/tmpl/IGRP-tab-menu.tmpl.xsl?v=20150825"/>
  <xsl:include href="../../xsl/tmpl/IGRP-graph.tmpl.xsl?v=20150825"/>
</xsl:stylesheet>
