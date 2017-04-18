<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html><!--XSL Generator (RED/DIM 2015)--><head><!--HOME-HEADER--><xsl:call-template name="home-header"/>
      </head>
      <body class="bodyColor">
        <div class="IGRP_overlay"/><!--HOME TOP--><xsl:call-template name="home-top-main"/><!--HOME--><div id="igrp-bodyPage"><!--HOME LEFT--><xsl:call-template name="home-slide-menu"/><!--HOME RIGTH--><div class="bodyPageRigth"><!-- START YOUR CODE HERE --><!-- SHOW TABLET AND MOBILE TITLE --><div class="box-head showTabMobile">
              <xsl:value-of select="rows/content/title"/>
            </div><!-- SHOW NOTIFICATION MESSAGES--><xsl:apply-templates mode="notif_messages" select="rows/content/messages"/><div class="colCenter"><!-- START SIMPLE-MENU --><xsl:apply-templates mode="simple-menu" select="rows/content/menu"/><!-- END SIMPLE-MENU --><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!-- SHOW HIDDEN--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FORM--><div class="col addMarginTop addPaddingBottom10" sep-name="form">
                <xsl:if test="rows/content/form/label/codigo">
                  <div class="box-content resetPadding addMarging10" sep-name="codigo">
                    <xsl:call-template name="plaintext">
                      <xsl:with-param name="value" select="rows/content/form/value/codigo"/>
                      <xsl:with-param name="name" select="codigo"/>
                    </xsl:call-template>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/sigla">
                  <div class="box-content resetPadding addMarging10" sep-name="sigla">
                    <xsl:call-template name="plaintext">
                      <xsl:with-param name="value" select="rows/content/form/value/sigla"/>
                      <xsl:with-param name="name" select="sigla"/>
                    </xsl:call-template>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/nome">
                  <div class="box-content resetPadding addMarging10" sep-name="nome">
                    <xsl:call-template name="plaintext">
                      <xsl:with-param name="value" select="rows/content/form/value/nome"/>
                      <xsl:with-param name="name" select="nome"/>
                    </xsl:call-template>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/cliente">
                  <div class="box-content resetPadding addMarging10" sep-name="cliente">
                    <xsl:call-template name="plaintext">
                      <xsl:with-param name="value" select="rows/content/form/value/cliente"/>
                      <xsl:with-param name="name" select="cliente"/>
                    </xsl:call-template>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/area_neg">
                  <div class="box-content resetPadding addMarging10" sep-name="area_neg">
                    <xsl:call-template name="plaintext">
                      <xsl:with-param name="value" select="rows/content/form/value/area_neg"/>
                      <xsl:with-param name="name" select="area_neg"/>
                    </xsl:call-template>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/dt_inicio_prev">
                  <div class="box-content resetPadding addMarging10" sep-name="dt_inicio_prev">
                    <xsl:call-template name="plaintext">
                      <xsl:with-param name="value" select="rows/content/form/value/dt_inicio_prev"/>
                      <xsl:with-param name="name" select="dt_inicio_prev"/>
                    </xsl:call-template>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/dt_fim_prev">
                  <div class="box-content resetPadding addMarging10" sep-name="dt_fim_prev">
                    <xsl:call-template name="plaintext">
                      <xsl:with-param name="value" select="rows/content/form/value/dt_fim_prev"/>
                      <xsl:with-param name="name" select="dt_fim_prev"/>
                    </xsl:call-template>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/dt_inicio_real">
                  <div class="box-content resetPadding addMarging10" sep-name="dt_inicio_real">
                    <xsl:call-template name="plaintext">
                      <xsl:with-param name="value" select="rows/content/form/value/dt_inicio_real"/>
                      <xsl:with-param name="name" select="dt_inicio_real"/>
                    </xsl:call-template>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/dt_fim_real">
                  <div class="box-content resetPadding addMarging10" sep-name="dt_fim_real">
                    <xsl:call-template name="plaintext">
                      <xsl:with-param name="value" select="rows/content/form/value/dt_fim_real"/>
                      <xsl:with-param name="name" select="dt_fim_real"/>
                    </xsl:call-template>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/duracao">
                  <div class="box-content resetPadding addMarging10" sep-name="duracao">
                    <xsl:call-template name="plaintext">
                      <xsl:with-param name="value" select="rows/content/form/value/duracao"/>
                      <xsl:with-param name="name" select="duracao"/>
                    </xsl:call-template>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/estado">
                  <div class="box-content resetPadding addMarging10" sep-name="estado">
                    <xsl:call-template name="plaintext">
                      <xsl:with-param name="value" select="rows/content/form/value/estado"/>
                      <xsl:with-param name="name" select="estado"/>
                    </xsl:call-template>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/descricao">
                  <div class="box-content resetPadding addMarging10" sep-name="descricao">
                    <xsl:call-template name="plaintext">
                      <xsl:with-param name="value" select="rows/content/form/value/descricao"/>
                      <xsl:with-param name="name" select="descricao"/>
                    </xsl:call-template>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/percentagem">
                  <div class="box-content resetPadding addMarging10" sep-name="percentagem">
                    <xsl:call-template name="plaintext">
                      <xsl:with-param name="value" select="rows/content/form/value/percentagem"/>
                      <xsl:with-param name="name" select="percentagem"/>
                    </xsl:call-template>
                  </div>
                </xsl:if><!-- INICIO SEPARADOR aplicacoes--><xsl:if test="rows/content/form/label/aplicacoes">
                  <div class="box-content resetPadding" sep-name="aplicacoes">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/aplicacoes"/>
                    </xsl:call-template>
                    <div class="box-collapser"><!-- START TABELA LIST--><div class="box-table table-responsive">
                        <table rel="T_aplicacoes" data-control="data-aplicacoes">
                          <thead>
                            <tr>
                              <xsl:if test="rows/content/form/table/aplicacoes/label/dad_descr">
                                <xsl:if test="not(rows/content/form/table/aplicacoes/label/dad_descr/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/aplicacoes/label/dad_descr" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/aplicacoes/label/dad">
                                <xsl:if test="not(rows/content/form/table/aplicacoes/label/dad/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/aplicacoes/label/dad" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                            </tr>
                          </thead>
                          <tbody>
                            <xsl:for-each select="rows/content/form/table/aplicacoes/value/row[not(@total='yes')]">
                              <tr row="{position()}">
                                <xsl:if test="dad_descr">
                                  <xsl:if test="not(dad_descr/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/dad_descr}" class="text">
                                      <xsl:value-of select="dad_descr" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_dad_descr_fk" value="{dad_descr}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="dad_descr/@visible = 'false'">
                                    <input type="hidden" name="p_dad_descr_fk" value="{dad_descr}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="dad">
                                  <xsl:if test="not(dad/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/dad}" class="text">
                                      <xsl:value-of select="dad" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_dad_fk" value="{dad}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="dad/@visible = 'false'">
                                    <input type="hidden" name="p_dad_fk" value="{dad}"/>
                                  </xsl:if>
                                </xsl:if>
                                <input type="hidden" name="p_aplicacoes_id" value="{aplicacoes_id}"/>
                              </tr>
                            </xsl:for-each>
                          </tbody>
                        </table>
                      </div><!-- END TABELA LIST--><div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if><!-- INICIO SEPARADOR equipa--><xsl:if test="rows/content/form/label/equipa">
                  <div class="box-content resetPadding" sep-name="equipa">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/equipa"/>
                    </xsl:call-template>
                    <div class="box-collapser"><!-- START TABELA LIST--><div class="box-table table-responsive">
                        <table rel="T_equipa" data-control="data-equipa">
                          <thead>
                            <tr>
                              <xsl:if test="rows/content/form/table/equipa/label/funcao">
                                <xsl:if test="not(rows/content/form/table/equipa/label/funcao/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/equipa/label/funcao" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/equipa/label/nome_rec">
                                <xsl:if test="not(rows/content/form/table/equipa/label/nome_rec/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/equipa/label/nome_rec" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                            </tr>
                          </thead>
                          <tbody>
                            <xsl:for-each select="rows/content/form/table/equipa/value/row[not(@total='yes')]">
                              <tr row="{position()}">
                                <xsl:if test="funcao">
                                  <xsl:if test="not(funcao/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/funcao}" class="text">
                                      <xsl:value-of select="funcao" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_funcao_fk" value="{funcao}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="funcao/@visible = 'false'">
                                    <input type="hidden" name="p_funcao_fk" value="{funcao}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="nome_rec">
                                  <xsl:if test="not(nome_rec/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/nome_rec}" class="link">
                                      <xsl:choose>
                                        <xsl:when test="nome_rec != ''">
                                          <a href="{nome_rec}" class="link bClick" target="_blank" name="nome_rec">
                                            <xsl:value-of select="nome_rec_desc" disable-output-escaping="yes"/>
                                          </a>
                                        </xsl:when>
                                        <xsl:otherwise>
                                          <xsl:value-of select="nome_rec_desc" disable-output-escaping="yes"/>
                                        </xsl:otherwise>
                                      </xsl:choose>
                                      <input type="hidden" name="p_nome_rec_fk" value="{nome_rec}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="nome_rec/@visible = 'false'">
                                    <input type="hidden" name="p_nome_rec_fk" value="{nome_rec}"/>
                                  </xsl:if>
                                </xsl:if>
                                <input type="hidden" name="p_equipa_id" value="{equipa_id}"/>
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
              </div>
            </form>
            <div class="col">
              <div class="_clear"/>
            </div></div><div class="colLR">
              <div class="box-content resetPadding">
                <div class="col">
                  <xsl:if test="rows/content/grafico_execucao"><!-- START CHARTS--><div class="col" sep-name="grafico_execucao">
                      <xsl:call-template name="igrp-graph">
                        <xsl:with-param name="table" select="rows/content/grafico_execucao"/>
                        <xsl:with-param name="chart_type" select="rows/content/grafico_execucao/chart_type"/>
                        <xsl:with-param name="height" select="150"/>
                        <xsl:with-param name="title" select="rows/content/grafico_execucao/caption"/>
                      </xsl:call-template>
                    </div><!-- END CHARTS--></xsl:if>
                  <xsl:if test="rows/content/resume_tarefas"><!-- START CHARTS--><div class="col" sep-name="resume_tarefas">
                      <xsl:call-template name="igrp-graph">
                        <xsl:with-param name="table" select="rows/content/resume_tarefas"/>
                        <xsl:with-param name="chart_type" select="rows/content/resume_tarefas/chart_type"/>
                        <xsl:with-param name="height" select="150"/>
                        <xsl:with-param name="title" select="rows/content/resume_tarefas/caption"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150825"/>
  <xsl:include href="../../xsl/tmpl/IGRP-others.tmpl.xsl?v=20150825"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150825"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150825"/>
  <xsl:include href="../../xsl/tmpl/IGRP-menu.tmpl.xsl?v=20150825"/>
  <xsl:include href="../../xsl/tmpl/IGRP-graph.tmpl.xsl?v=20150825"/>
</xsl:stylesheet>
