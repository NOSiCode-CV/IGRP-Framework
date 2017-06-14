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
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FORM--><!--START TOOLS BAR FROM--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar"/><!--END TOOLS BAR FORM--><div class="col addMarginTop addPaddingBottom10" sep-name="form">
                <xsl:if test="rows/content/form/label/sincronizar">
                  <div class="col-1-4 item" item-name="sincronizar">
                    <div class="igrp_item select">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/sincronizar) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/sincronizar" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/sincronizar" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/sincronizar/@name}" chosen="select" id="{rows/content/form/list/sincronizar/@name}" data-placeholder="{rows/content/form/list/sincronizar/option[position() = 1]}" class="select">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/sincronizar"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/sincronizar/option[position() != 1]">
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
                </xsl:if><!-- INICIO SEPARADOR branche--><xsl:if test="rows/content/form/label/branche">
                  <div class="box-content resetPadding" sep-name="branche">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/branche"/>
                    </xsl:call-template>
                    <div class="box-collapser"><!-- START TABELA LIST--><div class="box-table table-responsive">
                        <table rel="T_branche" data-control="data-branche">
                          <thead>
                            <tr>
                              <xsl:if test="rows/content/form/table/branche/label/branche">
                                <xsl:if test="not(rows/content/form/table/branche/label/branche/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/branche/label/branche" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/branche/label/_">
                                <xsl:if test="not(rows/content/form/table/branche/label/_/@visible)">
                                  <th class="checkbox">
                                    <input type="checkbox" name="p___all" class="IGRP_checkall"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                            </tr>
                          </thead>
                          <tbody>
                            <xsl:for-each select="rows/content/form/table/branche/value/row[not(@total='yes')]">
                              <tr row="{position()}">
                                <xsl:if test="branche">
                                  <xsl:if test="not(branche/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/branche}" class="text">
                                      <xsl:value-of select="branche" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_branche_fk" value="{branche}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="branche/@visible = 'false'">
                                    <input type="hidden" name="p_branche_fk" value="{branche}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="_">
                                  <xsl:if test="not(_/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/_}" class="checkbox">
                                      <xsl:if test="_ != '-0'">
                                        <input type="checkbox" name="p___fk" value="{_}">
                                          <xsl:if test="__check=_">
                                            <xsl:attribute name="checked">checked</xsl:attribute>
                                          </xsl:if>
                                        </input>
                                      </xsl:if>
                                      <xsl:value-of select="__desc"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="_/@visible = 'false'">
                                    <input type="hidden" name="p___fk" value="{_}"/>
                                  </xsl:if>
                                </xsl:if>
                                <input type="hidden" name="p_branche_id" value="{branche_id}"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150901"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150901"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150901"/>
</xsl:stylesheet>
