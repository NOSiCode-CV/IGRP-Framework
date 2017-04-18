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
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FORM--><!--START TOOLS BAR FROM--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar"/><!--END TOOLS BAR FORM--><div class="col addMarginTop addPaddingBottom10" sep-name="form">
                <xsl:if test="rows/content/form/label/recurso">
                  <div class="col-1-4 item" item-name="recurso">
                    <div class="igrp_item LOOKUP">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/recurso) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/recurso" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/recurso" disable-output-escaping="yes"/>
                      </label>
                      <div class="itemIcon">
                        <input type="LOOKUP" name="{rows/content/form/value/recurso/@name}" value="{rows/content/form/value/recurso}" class="LOOKUP required">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/recurso"/>
                          </xsl:call-template>
                        </input>
                        <xsl:call-template name="lookup-tool">
                          <xsl:with-param name="page" select="rows/page"/>
                          <xsl:with-param name="ad_hoc" select="'1'"/>
                          <xsl:with-param name="action" select="'LOOKUP'"/>
                          <xsl:with-param name="name" select="rows/content/form/value/recurso/@name"/>
                          <xsl:with-param name="js_lookup" select="rows/content/form/lookup/recurso"/>
                        </xsl:call-template>
                      </div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/funcao">
                  <div class="col-1-4 item" item-name="funcao">
                    <div class="igrp_item select">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/funcao) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/funcao" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/funcao" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/funcao/@name}" chosen="select" id="{rows/content/form/list/funcao/@name}" data-placeholder="{rows/content/form/list/funcao/option[position() = 1]}" class="select required">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/funcao"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/funcao/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/tem_contrato">
                  <div class="col-1-4 item" item-name="tem_contrato">
                    <div class="igrp_item checkbox">
                      <div class="col-1-1">
                        <input type="checkbox" name="{rows/content/form/value/tem_contrato/@name}" value="1" class="checkbox">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/tem_contrato"/>
                          </xsl:call-template>
                          <xsl:if test="rows/content/form/value/tem_contrato='1'">
                            <xsl:attribute name="checked">checked</xsl:attribute>
                          </xsl:if>
                        </input>
                        <xsl:value-of select="rows/content/form/label/tem_contrato" disable-output-escaping="yes"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <div class="_clear"/>
              </div>
            </form><!-- END YOUR CODE HERE --><div class="_clear"/>
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
</xsl:stylesheet>
