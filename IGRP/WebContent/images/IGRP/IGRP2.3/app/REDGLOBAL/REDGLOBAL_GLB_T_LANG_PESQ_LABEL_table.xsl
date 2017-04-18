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
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FILTER--><div class="box-content resetPadding">
                <div class="col">
                  <xsl:if test="rows/content/form/label/code">
                    <div class="col-1-4 item" item-name="code">
                      <div class="igrp_item text">
                        <label>
                          <xsl:if test="string-length(rows/content/form/label/code) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/form/label/code" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/form/label/code" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/code/@name}" value="{rows/content/form/value/code}" class="text" maxlength="50">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/code"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/form/label/label">
                    <div class="col-1-4 item" item-name="label">
                      <div class="igrp_item text">
                        <label>
                          <xsl:if test="string-length(rows/content/form/label/label) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/form/label/label" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/form/label/label" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/label/@name}" value="{rows/content/form/value/label}" class="text" maxlength="20">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/label"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <div class="_clear"/>
                </div><!--START TOOL BAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/form/tools-bar"/><!--END TOOL BAR FILTER--></div><!-- END FILTER--><!-- START TABELA--><div class="col addBorderLeftRight borderColor">
                <div class="box-table table-responsive">
                  <div class="table-container">
                    <table class="IGRP_table default-table" data-control="table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/code">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/code"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/label">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/label"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <tr row="{position()}" class="">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="code">
                              <td align="" data-row="{position()}" data-title="{../../label/code}" class="js_passa_valor">
                                <a class="link bClick" title="Passa Valor" target="lookup">
                                  <xsl:value-of select="code" disable-output-escaping="yes"/>
                                </a>
                              </td>
                            </xsl:if>
                            <xsl:if test="label">
                              <td align="" data-row="{position()}" data-title="{../../label/label}" class="js_passa_valor">
                                <a class="link bClick" title="Passa Valor" target="lookup">
                                  <xsl:value-of select="label" disable-output-escaping="yes"/>
                                </a>
                              </td>
                            </xsl:if>
                          </tr>
                        </xsl:for-each>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div><!-- END TABELA--></form><!-- END YOUR CODE HERE --><div class="_clear"/>
          </div>
          <div class="_clear"/>
        </div><!--FOOTER PAGE--><div id="igrp-footerPage">
          <xsl:call-template name="footer"/>
        </div>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150608"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150608"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150608"/>
  <xsl:include href="../../xsl/tmpl/IGRP-context.tmpl.xsl?v=20150608"/>
</xsl:stylesheet>
