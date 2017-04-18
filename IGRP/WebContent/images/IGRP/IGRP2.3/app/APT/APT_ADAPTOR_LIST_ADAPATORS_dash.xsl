<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html><!--XSL Generator (RED/DIM 2015)--><head><!--HOME-HEADER--><xsl:call-template name="home-header"/>
      </head>
      <body class="bodyColor">
        <div class="IGRP_overlay"/><!--HOME TOP--><xsl:call-template name="home-top-main"/><!--HOME--><div id="igrp-bodyPage"><!--HOME LEFT--><xsl:call-template name="home-slide-menu"/><!--HOME RIGTH--><div class="bodyPageRigth"><!-- START YOUR CODE HERE --><!-- SHOW TABLET AND MOBILE TITLE --><div class="box-head showTabMobile">
              <xsl:value-of select="rows/content/title"/>
            </div><!-- SHOW NOTIFICATION MESSAGES--><xsl:apply-templates mode="notif_messages" select="rows/content/messages"/>
            <form action="#" method="post" id="formular_default" name="formular_default" class="default_filter"><!-- SHOW HIDDEN--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START TABELA--><div class="col addBorderLeftRight borderColor"><!--START TOOL BAR TABLE--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar">
                  <xsl:with-param name="isTable" select="'true'"/>
                  <xsl:with-param name="rel" select="'table'"/>
                </xsl:apply-templates><!--END TOOL BAR TABLE--><div class="box-table table-responsive">
                  <div class="table-container">
                    <table class="IGRP_table default-table" data-control="table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/database_type">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/database_type"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/host_name">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/host_name"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/user_name">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/user_name"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/database_name">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/database_name"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <tr row="{position()}" class="">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="database_type">
                              <td align="" data-row="{position()}" data-title="{../../label/database_type}" class="text">
                                <xsl:value-of select="database_type"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="host_name">
                              <td align="" data-row="{position()}" data-title="{../../label/host_name}" class="text">
                                <xsl:value-of select="host_name"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="user_name">
                              <td align="" data-row="{position()}" data-title="{../../label/user_name}" class="text">
                                <xsl:value-of select="user_name"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="database_name">
                              <td align="" data-row="{position()}" data-title="{../../label/database_name}" class="text">
                                <xsl:value-of select="database_name"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150629"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150629"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150629"/>
</xsl:stylesheet>
