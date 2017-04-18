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
            </div><!-- SHOW NOTIFICATION MESSAGES--><xsl:apply-templates mode="notif_messages" select="rows/content/messages"/>
            <form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!-- SHOW HIDDEN--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FORM--><!--START TOOLS BAR FROM--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar"/><!--END TOOLS BAR FORM--><div class="col addMarginTop" sep-name="form">
                <xsl:if test="rows/content/form/label/nome">
                  <xsl:if test="rows/content/form/label/nome">
                    <div class="col-1-4 item" item-name="nome">
                      <div class="igrp_item text">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/nome" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/nome/@name}" value="{rows/content/form/value/nome}" class="text required" maxlength="100">
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
                <xsl:if test="rows/content/form/label/descricao">
                  <xsl:if test="rows/content/form/label/descricao">
                    <div class="col-1-4 item" item-name="descricao">
                      <div class="igrp_item textarea">
                        <label>
                          <xsl:value-of select="rows/content/form/label/descricao" disable-output-escaping="yes"/>
                        </label>
                        <textarea name="{rows/content/form/value/descricao/@name}" class="textarea" maxlength="250">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/descricao"/>
                          </xsl:call-template>
                          <xsl:value-of select="rows/content/form/value/descricao" disable-output-escaping="yes"/>
                        </textarea>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/geograf_coords">
                  <xsl:if test="rows/content/form/label/geograf_coords">
                    <div class="col-1-4 item" item-name="geograf_coords">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/geograf_coords" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/geograf_coords/@name}" value="{rows/content/form/value/geograf_coords}" class="text" maxlength="50">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/geograf_coords"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/ver_no_mapa">
                  <xsl:if test="rows/content/form/label/ver_no_mapa">
                    <div class="col-1-4 item" item-name="ver_no_mapa">
                      <div class="igrp_item link">
                        <a href="{rows/content/form/value/ver_no_mapa}" class="link bClick" name="p_ver_no_mapa" target="_blank">
                          <xsl:value-of select="rows/content/form/label/ver_no_mapa" disable-output-escaping="yes"/>
                        </a>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/imagem">
                  <xsl:if test="rows/content/form/label/imagem">
                    <div class="col-1-4 item" item-name="imagem">
                      <div class="igrp_item file">
                        <label>
                          <xsl:value-of select="rows/content/form/label/imagem" disable-output-escaping="yes"/>
                        </label>
                        <div class="itemIcon">
                          <input class="notForm" placeholder="Choose File" disabled="disabled" file="id_{rows/content/form/value/imagem/@name}"/>
                          <span class="upload">File</span>
                          <input type="file" name="{rows/content/form/value/imagem/@name}" value="{rows/content/form/value/imagem}" class="file uploadFile">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/form/label/imagem"/>
                            </xsl:call-template>
                          </input>
                        </div>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/id"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150306"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150306"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150306"/>
</xsl:stylesheet>
