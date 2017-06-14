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
                <xsl:if test="rows/content/form/label/area_fk"/>
                <xsl:if test="rows/content/form/label/area">
                  <xsl:if test="rows/content/form/label/area">
                    <div class="col-1-4 item" item-name="area">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/area" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/area/@name}" value="{rows/content/form/value/area}" class="text" maxlength="150">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/area"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/sub_area">
                  <xsl:if test="rows/content/form/label/sub_area">
                    <div class="col-1-4 item" item-name="sub_area">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/sub_area" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/sub_area/@name}" value="{rows/content/form/value/sub_area}" class="text" maxlength="150">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/sub_area"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if><!-- INICIO SEPARADOR ficheiro_xpdl--><xsl:if test="rows/content/form/label/ficheiro_xpdl">
                  <div class="box-content resetPadding" sep-name="ficheiro_xpdl">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/ficheiro_xpdl"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/xpdl_file">
                  <xsl:if test="rows/content/form/label/xpdl_file">
                    <div class="col-1-4 item" item-name="xpdl_file">
                      <div class="igrp_item file">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/xpdl_file" disable-output-escaping="yes"/>
                        </label>
                        <div class="itemIcon">
                          <input class="notForm" placeholder="Choose File" disabled="disabled" file="id_{rows/content/form/value/xpdl_file/@name}"/>
                          <span class="upload">File</span>
                          <input type="file" name="{rows/content/form/value/xpdl_file/@name}" value="{rows/content/form/value/xpdl_file}" class="file required uploadFile">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/form/label/xpdl_file"/>
                            </xsl:call-template>
                          </input>
                        </div>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150309"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150309"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150309"/>
</xsl:stylesheet>
