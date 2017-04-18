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
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FORM--><div class="col addMarginTop addPaddingBottom10" sep-name="form">
                












              <xsl:if test="rows/content/form/value/estado != ''">
                <xsl:for-each select="rows/content/form">
                  <div class="app_bar_all">
                    <span><xsl:value-of select='label/estado'/>: <xsl:value-of select='value/estado'/>%</span>
                    <div class="app_bar_prog" style="width:{value/estado}%"></div>
                  </div>
                </xsl:for-each>
              </xsl:if>
                <!-- START TABELA-->
              <div class="col addBorderLeftRight borderColor">
                <div class="box-table table-responsive">
                  <!-- LEGENDA TABELA --><xsl:apply-templates mode="table-legend-ex" select="rows/content/table/legend_color"/>
                  
                </div>
              </div><!-- END TABELA-->
                <!-- <xsl:if test="rows/content/form/label/estado">
                  <div class="col-1-4 item" item-name="estado">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/estado) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/estado" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/estado" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/estado/@name}" value="{rows/content/form/value/estado}" class="text" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/estado"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if> -->
                <xsl:apply-templates mode="gantt-chart" select="rows/content" />















                <div class="_clear"/>
              </div>

            </form><!-- END YOUR CODE HERE --><div class="_clear"/>
          </div>
          <div class="_clear"/>
        </div><!--FOOTER PAGE--><div id="igrp-footerPage">
          <xsl:call-template name="footer"/>
        </div>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150609"/>
  <xsl:include href="../../xsl/tmpl/IGRP-others.tmpl.xsl?v=20150609"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150609"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150609"/>
  <xsl:include href="../../xsl/tmpl/IGRP-gantt-chart.tmpl.xsl?v=20150609"/>
</xsl:stylesheet>
