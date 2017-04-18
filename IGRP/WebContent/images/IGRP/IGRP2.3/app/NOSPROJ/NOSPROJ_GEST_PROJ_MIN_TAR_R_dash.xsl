<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html><!--XSL Generator (RED/DIM 2015)--><head><!--HOME-HEADER--><xsl:call-template name="home-header"/>
      </head>
      <body class="bodyColor">
        <div class="IGRP_overlay"/><!--HOME TOP--><xsl:call-template name="home-top-main"/><!--HOME--><div id="igrp-bodyPage"><!--HOME LEFT--><xsl:call-template name="home-slide-menu"/><!--HOME RIGTH--><div class="bodyPageRigth"><!-- START YOUR CODE HERE --><!-- SHOW TABLET AND MOBILE TITLE --><div class="box-head showTabMobile">
              <xsl:value-of select="rows/content/title"/>
            </div><!-- SHOW NOTIFICATION MESSAGES--><xsl:apply-templates mode="notif_messages" select="rows/content/messages"/><div class="colCenter"><!-- START VIEW --><xsl:apply-templates mode="IGRP-view" select="rows/content/view"/><!-- END VIEW --><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!-- SHOW HIDDEN--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FORM--><div class="col addMarginTop addPaddingBottom10" sep-name="form">
                <xsl:if test="rows/content/form/label/pesquisa">
                  <div class="col-1-4 item" item-name="pesquisa">
                    <div class="igrp_item LOOKUP">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/pesquisa) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/pesquisa" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/pesquisa" disable-output-escaping="yes"/>
                      </label>
                      <div class="itemIcon">
                        <input type="LOOKUP" name="{rows/content/form/value/pesquisa/@name}" value="{rows/content/form/value/pesquisa}" class="LOOKUP">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/pesquisa"/>
                          </xsl:call-template>
                        </input>
                        <xsl:call-template name="lookup-tool">
                          <xsl:with-param name="page" select="rows/page"/>
                          <xsl:with-param name="ad_hoc" select="'1'"/>
                          <xsl:with-param name="action" select="'LOOKUP'"/>
                          <xsl:with-param name="name" select="rows/content/form/value/pesquisa/@name"/>
                          <xsl:with-param name="js_lookup" select="rows/content/form/lookup/pesquisa"/>
                        </xsl:call-template>
                      </div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if><!-- INICIO SEPARADOR project_status_overview--><xsl:if test="rows/content/form/label/project_status_overview">
                  <div class="box-content resetPadding" sep-name="project_status_overview">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/project_status_overview"/>
                    </xsl:call-template>
                    <div class="box-collapser"><!-- START TABELA LIST--><div class="box-table table-responsive">
                        <table rel="T_project_status_overview" data-control="data-project_status_overview">
                          <thead>
                            <tr/>
                          </thead>
                          <tbody>
                            <xsl:for-each select="rows/content/form/table/project_status_overview/value/row[not(@total='yes')]">
                              <tr row="{position()}">
                                <input type="hidden" name="p_project_status_overview_id" value="{project_status_overview_id}"/>
                              </tr>
                            </xsl:for-each>
                          </tbody>
                        </table>
                      </div><!-- END TABELA LIST--><div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if><!-- INICIO SEPARADOR novidades--><xsl:if test="rows/content/form/label/novidades">
                  <div class="box-content resetPadding" sep-name="novidades">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/novidades"/>
                    </xsl:call-template>
                    <div class="box-collapser"><!-- START TABELA LIST--><div class="box-table table-responsive">
                        <table rel="T_novidades" data-control="data-novidades">
                          <thead>
                            <tr>
                              <xsl:if test="rows/content/form/table/novidades/label/tipo">
                                <xsl:if test="not(rows/content/form/table/novidades/label/tipo/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/novidades/label/tipo" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/novidades/label/qtd">
                                <xsl:if test="not(rows/content/form/table/novidades/label/qtd/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/novidades/label/qtd" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                            </tr>
                          </thead>
                          <tbody>
                            <xsl:for-each select="rows/content/form/table/novidades/value/row[not(@total='yes')]">
                              <tr row="{position()}">
                                <xsl:if test="tipo">
                                  <xsl:if test="not(tipo/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/tipo}" class="text">
                                      <xsl:value-of select="tipo" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_tipo_fk" value="{tipo}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="tipo/@visible = 'false'">
                                    <input type="hidden" name="p_tipo_fk" value="{tipo}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="qtd">
                                  <xsl:if test="not(qtd/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/qtd}" class="text">
                                      <xsl:value-of select="qtd" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_qtd_fk" value="{qtd}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="qtd/@visible = 'false'">
                                    <input type="hidden" name="p_qtd_fk" value="{qtd}"/>
                                  </xsl:if>
                                </xsl:if>
                                <input type="hidden" name="p_novidades_id" value="{novidades_id}"/>
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
                  <div class="_clear"/>
                </div>
              </div><!-- END FILTER--><!-- START TABELA--><div class="col addBorderLeftRight borderColor">
                <div class="box-table table-responsive">
                  <xsl:call-template name="filter-az">
                    <xsl:with-param name="name" select="rows/content/filter/value/filtro/@name"/>
                    <xsl:with-param name="value" select="rows/content/filter/value/filtro"/>
                    <xsl:with-param name="type" select="'filter_num'"/>
                  </xsl:call-template>
                  <div class="table-container">
                    <table class="IGRP_table default-table" data-control="table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/projetos">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/projetos"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/status">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/status"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <tr row="{position()}" class="">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="projetos">
                              <td align="" data-row="{position()}" data-title="{../../label/projetos}" class="text">
                                <xsl:value-of select="projetos"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="status">
                              <td align="" data-row="{position()}" data-title="{../../label/status}" class="text">
                                <xsl:value-of select="status"/>
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
              <xsl:if test="rows/content/projet_health"><!-- START CHARTS--><div class="col-1-273" sep-name="projet_health">
                  <xsl:call-template name="igrp-graph">
                    <xsl:with-param name="table" select="rows/content/projet_health"/>
                    <xsl:with-param name="chart_type" select="rows/content/projet_health/chart_type"/>
                    <xsl:with-param name="height" select="150"/>
                    <xsl:with-param name="title" select="rows/content/projet_health/caption"/>
                  </xsl:call-template>
                </div><!-- END CHARTS--></xsl:if>
              <xsl:if test="rows/content/estado_tarefas"><!-- START CHARTS--><div class="col-1-273" sep-name="estado_tarefas">
                  <xsl:call-template name="igrp-graph">
                    <xsl:with-param name="table" select="rows/content/estado_tarefas"/>
                    <xsl:with-param name="chart_type" select="rows/content/estado_tarefas/chart_type"/>
                    <xsl:with-param name="height" select="150"/>
                    <xsl:with-param name="title" select="rows/content/estado_tarefas/caption"/>
                  </xsl:call-template>
                </div><!-- END CHARTS--></xsl:if>
              <xsl:if test="rows/content/termino_semanal"><!-- START CHARTS--><div class="col-1-273" sep-name="termino_semanal">
                  <xsl:call-template name="igrp-graph">
                    <xsl:with-param name="table" select="rows/content/termino_semanal"/>
                    <xsl:with-param name="chart_type" select="rows/content/termino_semanal/chart_type"/>
                    <xsl:with-param name="height" select="150"/>
                    <xsl:with-param name="title" select="rows/content/termino_semanal/caption"/>
                  </xsl:call-template>
                </div><!-- END CHARTS--></xsl:if>
              <xsl:if test="rows/content/inicio_semanal"><!-- START CHARTS--><div class="col-1-273" sep-name="inicio_semanal">
                  <xsl:call-template name="igrp-graph">
                    <xsl:with-param name="table" select="rows/content/inicio_semanal"/>
                    <xsl:with-param name="chart_type" select="rows/content/inicio_semanal/chart_type"/>
                    <xsl:with-param name="height" select="150"/>
                    <xsl:with-param name="title" select="rows/content/inicio_semanal/caption"/>
                  </xsl:call-template>
                </div><!-- END CHARTS--></xsl:if>
              <xsl:if test="rows/content/tarefas_por_recurso"><!-- START CHARTS--><div class="col-1-273" sep-name="tarefas_por_recurso">
                  <xsl:call-template name="igrp-graph">
                    <xsl:with-param name="table" select="rows/content/tarefas_por_recurso"/>
                    <xsl:with-param name="chart_type" select="rows/content/tarefas_por_recurso/chart_type"/>
                    <xsl:with-param name="height" select="150"/>
                    <xsl:with-param name="title" select="rows/content/tarefas_por_recurso/caption"/>
                  </xsl:call-template>
                </div><!-- END CHARTS--></xsl:if>
              <div class="_clear"/>
            </div></div><div class="colLR">
              <div class="box-content resetPadding">
                <div class="col">
                  <xsl:if test="rows/content/top_5_recursos"><!-- START CHARTS--><div class="col" sep-name="top_5_recursos">
                      <xsl:call-template name="igrp-graph">
                        <xsl:with-param name="table" select="rows/content/top_5_recursos"/>
                        <xsl:with-param name="chart_type" select="rows/content/top_5_recursos/chart_type"/>
                        <xsl:with-param name="height" select="150"/>
                        <xsl:with-param name="title" select="rows/content/top_5_recursos/caption"/>
                      </xsl:call-template>
                    </div><!-- END CHARTS--></xsl:if>
                  <xsl:if test="rows/content/alocacao_recursos"><!-- START CHARTS--><div class="col" sep-name="alocacao_recursos">
                      <xsl:call-template name="igrp-graph">
                        <xsl:with-param name="table" select="rows/content/alocacao_recursos"/>
                        <xsl:with-param name="chart_type" select="rows/content/alocacao_recursos/chart_type"/>
                        <xsl:with-param name="height" select="150"/>
                        <xsl:with-param name="title" select="rows/content/alocacao_recursos/caption"/>
                      </xsl:call-template>
                    </div><!-- END CHARTS--></xsl:if>
                  <xsl:if test="rows/content/bugs_por_tipo"><!-- START CHARTS--><div class="col" sep-name="bugs_por_tipo">
                      <xsl:call-template name="igrp-graph">
                        <xsl:with-param name="table" select="rows/content/bugs_por_tipo"/>
                        <xsl:with-param name="chart_type" select="rows/content/bugs_por_tipo/chart_type"/>
                        <xsl:with-param name="height" select="150"/>
                        <xsl:with-param name="title" select="rows/content/bugs_por_tipo/caption"/>
                      </xsl:call-template>
                    </div><!-- END CHARTS--></xsl:if>
                  <xsl:if test="rows/content/bugs_por_severidade"><!-- START CHARTS--><div class="col" sep-name="bugs_por_severidade">
                      <xsl:call-template name="igrp-graph">
                        <xsl:with-param name="table" select="rows/content/bugs_por_severidade"/>
                        <xsl:with-param name="chart_type" select="rows/content/bugs_por_severidade/chart_type"/>
                        <xsl:with-param name="height" select="150"/>
                        <xsl:with-param name="title" select="rows/content/bugs_por_severidade/caption"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150825"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150825"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150825"/>
  <xsl:include href="../../xsl/tmpl/IGRP-view.tmpl.xsl?v=20150825"/>
  <xsl:include href="../../xsl/tmpl/IGRP-graph.tmpl.xsl?v=20150825"/>
</xsl:stylesheet>
