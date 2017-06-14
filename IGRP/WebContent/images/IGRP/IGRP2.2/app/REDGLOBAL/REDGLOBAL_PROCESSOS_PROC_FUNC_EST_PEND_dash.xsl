<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html><!--XSL Generator (RED/DIM 2015)--><head><!--HOME-HEADER--><xsl:call-template name="home-header"/>
      </head>
      <body class="bodyColor">
        <div class="IGRP_overlay"/><!--HOME TOP--><xsl:call-template name="home-top-main"/><!--HOME--><div id="igrp-bodyPage"><!--HOME LEFT--><xsl:call-template name="home-slide-menu"/><!--HOME RIGTH--><div class="bodyPageRigth"><!-- START YOUR CODE HERE --><!-- SHOW TABLET AND MOBILE TITLE --><div class="box-head showTabMobile">
              <xsl:value-of select="rows/content/title"/>
            </div><!-- SHOW NOTIFICATION MESSAGES--><xsl:apply-templates mode="notif_messages" select="rows/content/messages"/><div class="colCenter"><form action="#" method="post" id="formular_default" name="formular_default" class="default_filter"><!-- SHOW HIDDEN--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/>
            </form>
            <div class="col">
              <div class="_clear"/>
            </div></div><div class="colLR">
              <div class="box-content resetPadding">
                <div class="col">
                  <xsl:if test="rows/content/execucao_tarefas"><!-- START CHARTS--><div class="col" graph-name="execucao_tarefas">
                      <xsl:call-template name="igrp-graph">
                        <xsl:with-param name="table" select="rows/content/execucao_tarefas"/>
                        <xsl:with-param name="chart_type" select="rows/content/execucao_tarefas/chart_type"/>
                        <xsl:with-param name="height" select="150"/>
                        <xsl:with-param name="title" select="rows/content/execucao_tarefas/caption"/>
                      </xsl:call-template>
                    </div><!-- END CHARTS--></xsl:if>
                  <xsl:if test="rows/content/evolucao_desempenho"><!-- START CHARTS--><div class="col" graph-name="evolucao_desempenho">
                      <xsl:call-template name="igrp-graph">
                        <xsl:with-param name="table" select="rows/content/evolucao_desempenho"/>
                        <xsl:with-param name="chart_type" select="rows/content/evolucao_desempenho/chart_type"/>
                        <xsl:with-param name="height" select="150"/>
                        <xsl:with-param name="title" select="rows/content/evolucao_desempenho/caption"/>
                      </xsl:call-template>
                    </div><!-- END CHARTS--></xsl:if>
                  <xsl:if test="rows/content/desvio"><!-- START CHARTS--><div class="col" graph-name="desvio">
                      <xsl:call-template name="igrp-graph">
                        <xsl:with-param name="table" select="rows/content/desvio"/>
                        <xsl:with-param name="chart_type" select="rows/content/desvio/chart_type"/>
                        <xsl:with-param name="height" select="150"/>
                        <xsl:with-param name="title" select="rows/content/desvio/caption"/>
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
