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
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FORM--><div class="col addMarginTop" sep-name="form"><!-- INICIO SEPARADOR video_tutorial--><xsl:if test="rows/content/form/label/video_tutorial">
                  <div class="box-content resetPadding" list-name="video_tutorial">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/video_tutorial"/>
                    </xsl:call-template>
                    <div class="box-collapser"><!-- START TABELA LIST--><div class="box-table table-responsive">
                        <table rel="T_video_tutorial" data-control="data-video_tutorial">
                          <thead>
                            <tr>
                              <xsl:if test="rows/content/form/table/video_tutorial/label/nome">
                                <xsl:if test="not(rows/content/form/table/video_tutorial/label/nome/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/video_tutorial/label/nome" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/video_tutorial/label/ficheiro">
                                <xsl:if test="not(rows/content/form/table/video_tutorial/label/ficheiro/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/video_tutorial/label/ficheiro" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                            </tr>
                          </thead>
                          <tbody>
                            <xsl:for-each select="rows/content/form/table/video_tutorial/value/row[not(@total='yes')]">
                              <tr row="{position()}">
                                <xsl:if test="nome">
                                  <xsl:if test="not(nome/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/nome}" class="text">
                                      <xsl:value-of select="nome" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_nome_fk" value="{nome}"/>
                                      <span class="showResponsiveTable ctxmenu"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="nome/@visible = 'false'">
                                    <input type="hidden" name="p_nome_fk" value="{nome}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="ficheiro">
                                  <xsl:if test="not(ficheiro/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/ficheiro}" class="link">
                                      <xsl:choose>
                                        <xsl:when test="ficheiro != ''">
                                          <a href="{ficheiro}" class="link bClick" target="_blank" name="ficheiro">
                                            <xsl:value-of select="ficheiro_desc" disable-output-escaping="yes"/>
                                          </a>
                                        </xsl:when>
                                        <xsl:otherwise>
                                          <xsl:value-of select="ficheiro_desc" disable-output-escaping="yes"/>
                                        </xsl:otherwise>
                                      </xsl:choose>
                                      <input type="hidden" name="p_ficheiro_fk" value="{ficheiro}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="ficheiro/@visible = 'false'">
                                    <input type="hidden" name="p_ficheiro_fk" value="{ficheiro}"/>
                                  </xsl:if>
                                </xsl:if>
                                <input type="hidden" name="p_video_tutorial_id" value="{video_tutorial_id}"/>
                              </tr>
                            </xsl:for-each>
                          </tbody>
                        </table>
                      </div><!-- END TABELA LIST--><div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
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
