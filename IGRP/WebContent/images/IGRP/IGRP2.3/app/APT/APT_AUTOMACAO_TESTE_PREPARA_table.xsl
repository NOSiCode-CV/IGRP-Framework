<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html>
      <!--XSL Generator (RED/DIM 2015)-->
      <head>
        <!--HOME-HEADER-->
        <xsl:call-template name="home-header"/>
      </head>
      <body class="bodyColor">
        <div class="IGRP_overlay"/>
        <!--HOME TOP-->
        <xsl:call-template name="home-top-main"/>
        <!--HOME-->
        <div id="igrp-bodyPage">
          <!--HOME LEFT-->
          <xsl:call-template name="home-slide-menu"/>
          <!--HOME RIGTH-->
          <div class="bodyPageRigth">
            <!--START YOUR CODE HERE-->
            <!--SHOW TABLET AND MOBILE TITLE-->
            <div class="box-head showTabMobile">
              <xsl:value-of select="rows/content/title"/>
            </div>
            <!--SHOW NOTIFICATION MESSAGES-->
            <xsl:apply-templates mode="notif_messages" select="rows/content/messages"/>
            <form action="#" method="post" id="formular_default" name="formular_default" class="default_filter">
              <!--SHOW HIDDEN-->
              <xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/>
              <!--START TABELA-->
              <div class="col addBorderLeftRight borderColor">
                <script type="text/javascript">
                  $(document).ready(function(e) {
                  <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                    <xsl:if test="url and url!= ''">
                      var pUrl = "<xsl:value-of select='url' />";
                      var pPos = "<xsl:value-of select='position()' />";
                      IGRP_h_popupCtx({
                        pUrl:pUrl,
                        pWin:'APT_'+pPos
                      });
                    </xsl:if>
                  </xsl:for-each>
                  //window.close(); 
                  });
                </script>
                <!-- <div class="box-table table-responsive">
                  <div class="table-container">
                    <table class="IGRP_table default-table" data-control="table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/url">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/url"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <tr row="{position()}" class="">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="url">
                              <td align="" data-row="{position()}" data-title="{../../label/url}" class="link">
                                <xsl:choose>
                                  <xsl:when test="url != ''">
                                    <a href="{url}" class="link bClick" target="_blank" name="url">
                                      <xsl:value-of select="url_desc" disable-output-escaping="yes"/>
                                    </a>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <xsl:value-of select="url_desc" disable-output-escaping="yes"/>
                                  </xsl:otherwise>
                                </xsl:choose>
                              </td>
                            </xsl:if>
                          </tr>
                        </xsl:for-each>
                      </tbody>
                    </table>
                  </div>
                </div> -->
              </div>
              <!--END TABELA--></form>
              <!--END YOUR CODE HERE-->
              <div class="_clear"/>
            </div>
            <div class="_clear"/>
          </div>
          <!--FOOTER PAGE-->
          <div id="igrp-footerPage">
            <xsl:call-template name="footer"/>
          </div>
        </body>
      </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150903"/>
    <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150903"/>
    <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150903"/>
  </xsl:stylesheet>
