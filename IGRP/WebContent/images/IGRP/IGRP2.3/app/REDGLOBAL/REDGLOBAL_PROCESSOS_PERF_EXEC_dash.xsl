<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html><!--XSL Generator (RED/DIM 2015)--><head><!--HOME-HEADER--><xsl:call-template name="home-header"/>
      </head>
      <body class="bodyColor">
        <div class="IGRP_overlay"/><!--HOME TOP--><xsl:call-template name="home-top-main"/><!--HOME--><div id="igrp-bodyPage"><!--HOME LEFT--><xsl:call-template name="home-slide-menu"/><!--HOME RIGTH--><div class="bodyPageRigth"><!-- START YOUR CODE HERE --><!-- SHOW TABLET AND MOBILE TITLE --><div class="box-head showTabMobile">
              <xsl:value-of select="rows/content/title"/>
            </div><!-- SHOW NOTIFICATION MESSAGES--><xsl:apply-templates mode="notif_messages" select="rows/content/messages"/><div class="colCenter"><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!-- SHOW HIDDEN--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FORM--><!--START TOOLS BAR FROM--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar"/><!--END TOOLS BAR FORM--><div class="col addMarginTop" sep-name="form"><!-- INICIO SEPARADOR tempos_execucao--><xsl:if test="rows/content/form/label/tempos_execucao">
                  <div class="box-content resetPadding" list-name="tempos_execucao">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/tempos_execucao"/>
                    </xsl:call-template>
                    <div class="box-collapser"><!-- START TABELA LIST--><div class="box-table table-responsive">
                        <table rel="T_tempos_execucao" data-control="data-tempos_execucao">
                          <thead>
                            <tr>
                              <xsl:if test="rows/content/form/table/tempos_execucao/label/tempos">
                                <xsl:if test="not(rows/content/form/table/tempos_execucao/label/tempos/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/tempos_execucao/label/tempos" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/tempos_execucao/label/dia_hora">
                                <xsl:if test="not(rows/content/form/table/tempos_execucao/label/dia_hora/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/tempos_execucao/label/dia_hora" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                            </tr>
                          </thead>
                          <tbody>
                            <xsl:for-each select="rows/content/form/table/tempos_execucao/value/row[not(@total='yes')]">
                              <tr row="{position()}">
                                <xsl:if test="tempos">
                                  <xsl:if test="not(tempos/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/tempos}" class="text">
                                      <xsl:value-of select="tempos" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_tempos_fk" value="{tempos}"/>
                                      <span class="showResponsiveTable ctxmenu"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="tempos/@visible = 'false'">
                                    <input type="hidden" name="p_tempos_fk" value="{tempos}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="dia_hora">
                                  <xsl:if test="not(dia_hora/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/dia_hora}" class="text">
                                      <xsl:value-of select="dia_hora" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_dia_hora_fk" value="{dia_hora}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="dia_hora/@visible = 'false'">
                                    <input type="hidden" name="p_dia_hora_fk" value="{dia_hora}"/>
                                  </xsl:if>
                                </xsl:if>
                                <input type="hidden" name="p_tempos_execucao_id" value="{tempos_execucao_id}"/>
                              </tr>
                            </xsl:for-each>
                          </tbody>
                        </table>
                      </div><!-- END TABELA LIST--><div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <div class="_clear"/>
              </div><!-- START FILTER--><div class="box-content resetPadding">
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
                </div><!--START TOOL BAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar"/><!--END TOOL BAR FILTER--></div><!-- END FILTER--></form>
            <div class="col">
              <xsl:if test="rows/content/perf_execut"><!-- START CHARTS--><div class="col-1-600" graph-name="perf_execut">
                  <xsl:call-template name="igrp-graph">
                    <xsl:with-param name="table" select="rows/content/perf_execut"/>
                    <xsl:with-param name="chart_type" select="rows/content/perf_execut/chart_type"/>
                    <xsl:with-param name="height" select="300"/>
                    <xsl:with-param name="title" select="rows/content/perf_execut/caption"/>
                  </xsl:call-template>
                </div><!-- END CHARTS--></xsl:if>
              <div class="_clear"/>
            </div></div><div class="colLR">
              <div class="box-content resetPadding">
                <div class="col">
                  <xsl:if test="rows/content/rank_util"><!-- START CHARTS--><div class="col" graph-name="rank_util">
                      <xsl:call-template name="igrp-graph">
                        <xsl:with-param name="table" select="rows/content/rank_util"/>
                        <xsl:with-param name="chart_type" select="rows/content/rank_util/chart_type"/>
                        <xsl:with-param name="height" select="150"/>
                        <xsl:with-param name="title" select="rows/content/rank_util/caption"/>
                      </xsl:call-template>
                    </div><!-- END CHARTS--></xsl:if>
                  <xsl:if test="rows/content/eficiencia"><!-- START CHARTS--><div class="col" graph-name="eficiencia">
                      <xsl:call-template name="igrp-graph">
                        <xsl:with-param name="table" select="rows/content/eficiencia"/>
                        <xsl:with-param name="chart_type" select="rows/content/eficiencia/chart_type"/>
                        <xsl:with-param name="height" select="150"/>
                        <xsl:with-param name="title" select="rows/content/eficiencia/caption"/>
                      </xsl:call-template>
                    </div><!-- END CHARTS--></xsl:if>
                  <div class="_clear"/>
                </div>
                <div class="_clear"/>
              </div>
            </div><!-- END YOUR CODE HERE --><div class="_clear"/>
          </div>
          <div class="_clear"/>
        </div><!--FOOTER PAGE--><div id="igrp-footerPage">
          <xsl:call-template name="footer"/>
        </div>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150311"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150311"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150311"/>
  <xsl:include href="../../xsl/tmpl/IGRP-graph.tmpl.xsl?v=20150311"/>
</xsl:stylesheet>
