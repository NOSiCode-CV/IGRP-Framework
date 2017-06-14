<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html><!--XSL Generator (RED/DIM 2015)--><head><!--HOME-HEADER--><xsl:call-template name="home-header"/>
      </head>
      <body class="bodyColor">
        <div class="IGRP_overlay"/><!--HOME TOP--><xsl:call-template name="home-top-main"/><!--HOME--><div id="igrp-bodyPage"><!--HOME LEFT--><xsl:call-template name="home-slide-menu"/><!--HOME RIGTH--><div class="bodyPageRigth"><!-- START YOUR CODE HERE --><!-- SHOW TABLET AND MOBILE TITLE --><div class="box-head showTabMobile">
              <xsl:value-of select="rows/content/title"/>
            </div><!-- SHOW NOTIFICATION MESSAGES--><xsl:apply-templates mode="notif_messages" select="rows/content/messages"/><!-- START SIMPLE-MENU --><xsl:apply-templates mode="simple-menu" select="rows/content/menu"/><!-- END SIMPLE-MENU --><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!-- SHOW HIDDEN--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FORM--><!--START TOOLS BAR FROM--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar"/><!--END TOOLS BAR FORM--><div class="col addMarginTop addPaddingBottom10" sep-name="form">
                <xsl:if test="rows/content/form/label/link_save">
                  <div class="col-1-4 item" item-name="link_save">
                    <div class="igrp_item link">
                      <a href="{rows/content/form/value/link_save}" class="link bClick" name="p_link_save" target="_blank">
                        <xsl:value-of select="rows/content/form/label/link_save" disable-output-escaping="yes"/>
                      </a>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/nodedata">
                  <div class="col-1-4 item" item-name="nodedata">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/nodedata) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/nodedata" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/nodedata" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/nodedata/@name}" value="{rows/content/form/value/nodedata}" class="text" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/nodedata"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/linkdata">
                  <div class="col-1-4 item" item-name="linkdata">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/linkdata) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/linkdata" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/linkdata" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/linkdata/@name}" value="{rows/content/form/value/linkdata}" class="text" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/linkdata"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/area_name">
                  <div class="col-1-4 item" item-name="area_name">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/area_name) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/area_name" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/area_name" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/area_name/@name}" value="{rows/content/form/value/area_name}" class="text required" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/area_name"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <div class="_clear"/>
              </div><!-- START TABELA--><div class="col addBorderLeftRight borderColor">
                <div class="box-table table-responsive">
                  <div class="table-container">
                    <table class="IGRP_table default-table" data-control="table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/title">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/title"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/id">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/id"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/id_pai">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/id_pai"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/link">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/link"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <tr row="{position()}" class="">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="title">
                              <td align="" data-row="{position()}" data-title="{../../label/title}" class="text">
                                <xsl:value-of select="title"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="id">
                              <td align="" data-row="{position()}" data-title="{../../label/id}" class="number">
                                <xsl:value-of select="id"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="id_pai">
                              <td align="" data-row="{position()}" data-title="{../../label/id_pai}" class="number">
                                <xsl:value-of select="id_pai"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="link">
                              <td align="" data-row="{position()}" data-title="{../../label/link}" class="link">
                                <xsl:choose>
                                  <xsl:when test="link != ''">
                                    <a href="{link}" class="link bClick" target="_blank" name="link">
                                      <xsl:value-of select="link_desc" disable-output-escaping="yes"/>
                                    </a>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <xsl:value-of select="link_desc" disable-output-escaping="yes"/>
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
              </div><!-- END TABELA--></form><!-- END YOUR CODE HERE --><div class="_clear"/>
          </div>
          <div class="_clear"/>
        </div><!--FOOTER PAGE--><div id="igrp-footerPage">
          <xsl:call-template name="footer"/>
        </div>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150605"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150605"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150605"/>
  <xsl:include href="../../xsl/tmpl/IGRP-menu.tmpl.xsl?v=20150605"/>
</xsl:stylesheet>
