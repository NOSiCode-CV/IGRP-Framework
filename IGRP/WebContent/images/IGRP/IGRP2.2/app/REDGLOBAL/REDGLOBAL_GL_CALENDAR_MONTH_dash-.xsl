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
                  <xsl:if test="rows/content/filter/label/categoria">
                    <div class="col-1-4 item" item-name="categoria">
                      <div class="igrp_item select">
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/categoria) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/categoria" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/categoria" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/filter/list/categoria/@name}" chosen="select" id="{rows/content/filter/list/categoria/@name}" data-placeholder="{rows/content/filter/list/categoria/option[position() = 1]}" class="select">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/categoria"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/filter/list/categoria/option[position() != 1]">
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
                    <div class="table-container"><!--  CONTEXT-MENU  --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu">
                        <xsl:with-param name="contextId" select="'table'"/>
                      </xsl:apply-templates>
                      <table class="IGRP_table default-table" data-control="table">
                        <thead>
                          <tr>
                            <xsl:if test="rows/content/table/label/id">
                              <th align="">
                                <xsl:value-of select="rows/content/table/label/id"/>
                              </th>
                            </xsl:if>
                            <xsl:if test="rows/content/table/label/title">
                              <th align="">
                                <xsl:value-of select="rows/content/table/label/title"/>
                              </th>
                            </xsl:if>
                            <xsl:if test="rows/content/table/label/description">
                              <th align="">
                                <xsl:value-of select="rows/content/table/label/description"/>
                              </th>
                            </xsl:if>
                            <xsl:if test="rows/content/table/label/starts">
                              <th align="">
                                <xsl:value-of select="rows/content/table/label/starts"/>
                              </th>
                            </xsl:if>
                            <xsl:if test="rows/content/table/label/ends">
                              <th align="">
                                <xsl:value-of select="rows/content/table/label/ends"/>
                              </th>
                            </xsl:if>
                            <xsl:if test="rows/content/table/label/bgcolor">
                              <th align="">
                                <xsl:value-of select="rows/content/table/label/bgcolor"/>
                              </th>
                            </xsl:if>
                            <xsl:if test="rows/content/table/label/allday">
                              <th align="">
                                <xsl:value-of select="rows/content/table/label/allday"/>
                              </th>
                            </xsl:if>
                            <xsl:if test="rows/content/table/label/backgroundcolor">
                              <th align="">
                                <xsl:value-of select="rows/content/table/label/backgroundcolor"/>
                              </th>
                            </xsl:if>
                          </tr>
                        </thead>
                        <tbody>
                          <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                            <tr row="{position()}" class="IGRP_contextMenu">
                              <xsl:apply-templates mode="context-param" select="context-menu"/>
                              <xsl:if test="id">
                                <td align="" data-row="{position()}" data-title="{../../label/id}" class="number">
                                  <xsl:value-of select="id"/>
                                  <xsl:apply-templates mode="cxtmenu-resp" select="//rows/content/table/context-menu">
                                    <xsl:with-param name="ctx" select="context-menu"/>
                                  </xsl:apply-templates>
                                </td>
                              </xsl:if>
                              <xsl:if test="title">
                                <td align="" data-row="{position()}" data-title="{../../label/title}" class="text">
                                  <xsl:value-of select="title"/>
                                </td>
                              </xsl:if>
                              <xsl:if test="description">
                                <td align="" data-row="{position()}" data-title="{../../label/description}" class="text">
                                  <xsl:value-of select="description"/>
                                </td>
                              </xsl:if>
                              <xsl:if test="starts">
                                <td align="" data-row="{position()}" data-title="{../../label/starts}" class="text">
                                  <xsl:value-of select="starts"/>
                                </td>
                              </xsl:if>
                              <xsl:if test="ends">
                                <td align="" data-row="{position()}" data-title="{../../label/ends}" class="text">
                                  <xsl:value-of select="ends"/>
                                </td>
                              </xsl:if>
                              <xsl:if test="bgcolor">
                                <td align="" data-row="{position()}" data-title="{../../label/bgcolor}" class="text">
                                  <xsl:value-of select="bgcolor"/>
                                </td>
                              </xsl:if>
                              <xsl:if test="allday">
                                <td align="" data-row="{position()}" data-title="{../../label/allday}" class="text">
                                  <xsl:value-of select="allday"/>
                                </td>
                              </xsl:if>
                              <xsl:if test="backgroundcolor">
                                <td align="" data-row="{position()}" data-title="{../../label/backgroundcolor}" class="text">
                                  <xsl:value-of select="backgroundcolor"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20160122"/>
  <xsl:include href="../../xsl/tmpl/IGRP-others.tmpl.xsl?v=20160122"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20160122"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20160122"/>
  <xsl:include href="../../xsl/tmpl/IGRP-context.tmpl.xsl?v=20160122"/>
</xsl:stylesheet>
