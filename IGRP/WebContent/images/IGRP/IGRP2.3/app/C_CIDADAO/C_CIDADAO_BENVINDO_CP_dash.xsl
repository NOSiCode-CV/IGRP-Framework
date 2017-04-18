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
            </div><!-- SHOW NOTIFICATION MESSAGES--><xsl:apply-templates mode="notif_messages" select="rows/content/messages"/><div class="colCenter"><class="box-content resetPadding"><!-- START SIMPLE-MENU --><xsl:apply-templates mode="menu-simple" select="rows/content/menu"/><!-- END SIMPLE-MENU --><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!-- SHOW HIDDEN--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FORM--><div class="col addMarginTop" sep-name="form">
                <xsl:if test="rows/content/form/label/nome">
                  <xsl:if test="rows/content/form/label/nome">
                    <div class="col-1-4 item" item-name="nome">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/nome" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/nome/@name}" value="{rows/content/form/value/nome}" class="text" maxlength="150">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/nome"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/idade">
                  <xsl:if test="rows/content/form/label/idade">
                    <div class="col-1-4 item" item-name="idade">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/idade" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/idade/@name}" value="{rows/content/form/value/idade}" class="text" maxlength="20">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/idade"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/sexo">
                  <xsl:if test="rows/content/form/label/sexo">
                    <div class="col-1-4 item" item-name="sexo">
                      <div class="igrp_item select">
                        <label>
                          <xsl:value-of select="rows/content/form/label/sexo" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/sexo/@name}" chosen="select" data-placeholder="{rows/content/form/list/sexo/option[position() = 1]}" class="select">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/sexo"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/sexo/option[position() != 1]">
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
                </xsl:if>
                <div class="_clear"/>
              </div>
            </form>
            <div class="box-content resetPadding">
              <div class="_clear"/>
            </div><div class="_clear"/></div></div><div class="colLR">
              <div class="box-content resetPadding"><!-- START SIMPLE-MENU --><xsl:apply-templates mode="menu-simple" select="rows/content/menu"/><!-- END SIMPLE-MENU --><div class="box-content resetPadding">
                  <xsl:if test="rows/content/grafico"><!-- START CHARTS--><div class="col" graph-name="grafico">
                      <xsl:call-template name="igrp-graph">
                        <xsl:with-param name="table" select="rows/content/grafico"/>
                        <xsl:with-param name="chart_type" select="rows/content/grafico/chart_type"/>
                        <xsl:with-param name="height" select="150"/>
                        <xsl:with-param name="title" select="rows/content/grafico/caption"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150306"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150306"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150306"/>
  <xsl:include href="../../xsl/tmpl/IGRP-menu.tmpl.xsl?v=20150306"/>
  <xsl:include href="../../xsl/tmpl/IGRP-graph.tmpl.xsl?v=20150306"/>
</xsl:stylesheet>
