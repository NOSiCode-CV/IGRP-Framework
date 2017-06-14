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
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FILTER--><div class="box-content resetPadding">
                <div class="col">
                  <xsl:if test="rows/content/filter/label/log_nr">
                    <div class="col-1-4 item" item-name="log_nr">
                      <div class="igrp_item number">
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/log_nr) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/log_nr" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/log_nr" disable-output-escaping="yes"/>
                        </label>
                        <input type="number" name="{rows/content/filter/value/log_nr/@name}" value="{rows/content/filter/value/log_nr}" class="number" maxlength="22">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/log_nr"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <div class="_clear"/>
                </div><!--START TOOL BAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar"/><!--END TOOL BAR FILTER--></div><!-- END FILTER--><!-- START TABELA--><div class="box-content resetPadding">
                <xsl:call-template name="titlecollapser">
                  <xsl:with-param name="title" select="rows/content/table/title"/>
                </xsl:call-template>
                <xsl:call-template name="table-view">
                  <xsl:with-param name="rel" select="'table'"/>
                </xsl:call-template>
                <div class="box-collapser addPaddingBottom10">
                  <div class="box-table table-responsive">
                    <div class="table-container">
                      <table class="IGRP_table default-table" data-control="table">
                        <thead>
                          <tr>
                            <xsl:if test="rows/content/table/label/log_nr">
                              <th align="center">
                                <xsl:value-of select="rows/content/table/label/log_nr"/>
                              </th>
                            </xsl:if>
                            <xsl:if test="rows/content/table/label/log_date">
                              <th align="center">
                                <xsl:value-of select="rows/content/table/label/log_date"/>
                              </th>
                            </xsl:if>
                            <xsl:if test="rows/content/table/label/msg_type">
                              <th align="left">
                                <xsl:value-of select="rows/content/table/label/msg_type"/>
                              </th>
                            </xsl:if>
                            <xsl:if test="rows/content/table/label/msg">
                              <th align="left">
                                <xsl:value-of select="rows/content/table/label/msg"/>
                              </th>
                            </xsl:if>
                            <xsl:if test="rows/content/table/label/dad">
                              <th align="left">
                                <xsl:value-of select="rows/content/table/label/dad"/>
                              </th>
                            </xsl:if>
                          </tr>
                        </thead>
                        <tbody>
                          <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                            <tr row="{position()}" class="">
                              <xsl:apply-templates mode="context-param" select="context-menu"/>
                              <xsl:if test="log_nr">
                                <td align="center" data-row="{position()}" data-title="{../../label/log_nr}" class="number">
                                  <xsl:value-of select="log_nr"/>
                                </td>
                              </xsl:if>
                              <xsl:if test="log_date">
                                <td align="center" data-row="{position()}" data-title="{../../label/log_date}" class="date">
                                  <xsl:value-of select="log_date"/>
                                </td>
                              </xsl:if>
                              <xsl:if test="msg_type">
                                <td align="left" data-row="{position()}" data-title="{../../label/msg_type}" class="text">
                                  <xsl:value-of select="msg_type"/>
                                </td>
                              </xsl:if>
                              <xsl:if test="msg">
                                <td align="left" data-row="{position()}" data-title="{../../label/msg}" class="text">
                                  <xsl:value-of select="msg"/>
                                </td>
                              </xsl:if>
                              <xsl:if test="dad">
                                <td align="left" data-row="{position()}" data-title="{../../label/dad}" class="link">
                                  <xsl:choose>
                                    <xsl:when test="dad != ''">
                                      <a href="{dad}" class="link bClick" target="_blank" name="dad">
                                        <xsl:value-of select="dad_desc" disable-output-escaping="yes"/>
                                      </a>
                                    </xsl:when>
                                    <xsl:otherwise>
                                      <xsl:value-of select="dad_desc" disable-output-escaping="yes"/>
                                    </xsl:otherwise>
                                  </xsl:choose>
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
              </div><!-- END TABELA--></form><!-- END YOUR CODE HERE --><div class="_clear"/>
          </div>
          <div class="_clear"/>
        </div><!--FOOTER PAGE--><div id="igrp-footerPage">
          <xsl:call-template name="footer"/>
        </div>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20151208"/>
  <xsl:include href="../../xsl/tmpl/IGRP-others.tmpl.xsl?v=20151208"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20151208"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20151208"/>
</xsl:stylesheet>
