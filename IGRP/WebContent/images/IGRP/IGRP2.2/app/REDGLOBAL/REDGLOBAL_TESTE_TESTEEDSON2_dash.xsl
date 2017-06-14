<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html><!--XSL Generator (RED/DIM 2015)--><head><!--HOME-HEADER--><xsl:call-template name="home-header"/>
      </head>
      <body class="bodyColor">
        <div class="IGRP_overlay"/><!--HOME TOP--><xsl:call-template name="home-top-main"/><!--HOME--><div id="igrp-bodyPage"><!--HOME LEFT--><xsl:call-template name="home-slide-menu"/><!--HOME RIGTH--><div class="bodyPageRigth"><!-- START YOUR CODE HERE --><!-- SHOW TABLET AND MOBILE TITLE --><div class="box-head showTabMobile">
              <xsl:value-of select="rows/content/title"/>
            </div><!-- SHOW NOTIFICATION MESSAGES--><xsl:apply-templates mode="notif_messages" select="rows/content/messages"/>
            <div class="colLR divLeft">
              <div class="box-content resetPadding"><!-- START LATERAL MENU  --><xsl:apply-templates mode="lateral-menu" select="rows/content/menu"/><!-- END LATERAL MENU  --><div class="_clear"/>
              </div>
            </div><div class="colCenter"><!-- START TAB MENU  --><xsl:apply-templates mode="tab-menu" select="rows/content/menu"/><!-- END TAB MENU  --><form action="#" method="post" id="formular_default" name="formular_default" class="default_filter"><!-- SHOW HIDDEN--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START TABELA--><div class="box-content resetPadding">
                <xsl:call-template name="titlecollapser">
                  <xsl:with-param name="title" select="rows/content/table/title"/>
                </xsl:call-template>
                <xsl:call-template name="table-view">
                  <xsl:with-param name="rel" select="'table'"/>
                </xsl:call-template>
                <div class="box-collapser addPaddingBottom10"><!--START TOOL BAR TABLE--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar">
                    <xsl:with-param name="isTable" select="'true'"/>
                    <xsl:with-param name="rel" select="'table'"/>
                  </xsl:apply-templates><!--END TOOL BAR TABLE--><div class="box-table table-responsive">
                    <div class="table-container"><!--  CONTEXT-MENU  --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu">
                        <xsl:with-param name="contextId" select="'table'"/>
                      </xsl:apply-templates>
                      <table class="IGRP_table default-table" data-control="table">
                        <thead>
                          <tr>
                            <xsl:if test="rows/content/table/label/data">
                              <th align="">
                                <xsl:value-of select="rows/content/table/label/data"/>
                              </th>
                            </xsl:if>
                            <xsl:if test="rows/content/table/label/nome">
                              <th align="">
                                <xsl:value-of select="rows/content/table/label/nome"/>
                              </th>
                            </xsl:if>
                            <xsl:if test="rows/content/table/label/numero">
                              <th align="">
                                <xsl:value-of select="rows/content/table/label/numero"/>
                              </th>
                            </xsl:if>
                          </tr>
                        </thead>
                        <tbody>
                          <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                            <tr row="{position()}" class="IGRP_contextMenu">
                              <xsl:apply-templates mode="context-param" select="context-menu"/>
                              <xsl:if test="data">
                                <td align="" data-row="{position()}" data-title="{../../label/data}" class="date">
                                  <xsl:value-of select="data"/>
                                  <xsl:apply-templates mode="cxtmenu-resp" select="//rows/content/table/context-menu">
                                    <xsl:with-param name="ctx" select="context-menu"/>
                                  </xsl:apply-templates>
                                </td>
                              </xsl:if>
                              <xsl:if test="nome">
                                <td align="" data-row="{position()}" data-title="{../../label/nome}" class="text">
                                  <xsl:value-of select="nome"/>
                                </td>
                              </xsl:if>
                              <xsl:if test="numero">
                                <td align="" data-row="{position()}" data-title="{../../label/numero}" class="text">
                                  <xsl:value-of select="numero"/>
                                </td>
                              </xsl:if>
                            </tr>
                          </xsl:for-each>
                        </tbody>
                      </table>
                    </div>
                  </div>
                  <div class="_clear"/>
                </div>
              </div><!-- END TABELA--></form></div><!-- END YOUR CODE HERE --><div class="_clear"/>
          </div>
          <div class="_clear"/>
        </div><!--FOOTER PAGE--><div id="igrp-footerPage">
          <xsl:call-template name="footer"/>
        </div>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20160218"/>
  <xsl:include href="../../xsl/tmpl/IGRP-others.tmpl.xsl?v=20160218"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20160218"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20160218"/>
  <xsl:include href="../../xsl/tmpl/IGRP-menu.tmpl.xsl?v=20160218"/>
  <xsl:include href="../../xsl/tmpl/IGRP-tab-menu.tmpl.xsl?v=20160218"/>
  <xsl:include href="../../xsl/tmpl/IGRP-context.tmpl.xsl?v=20160218"/>
</xsl:stylesheet>
