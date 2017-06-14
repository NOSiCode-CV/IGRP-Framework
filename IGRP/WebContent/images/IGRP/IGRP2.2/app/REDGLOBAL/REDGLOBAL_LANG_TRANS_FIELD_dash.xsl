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
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FORM--><div class="col addMarginTop addPaddingBottom10" sep-name="form">
                <xsl:if test="rows/content/form/label/campo_a">
                  <div class="col-1-4 item" item-name="campo_a">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/campo_a) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/campo_a" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/campo_a" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/campo_a/@name}" value="{rows/content/form/value/campo_a}" class="text" maxlength="300">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/campo_a"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/table">
                  <div class="col-1-4 item" item-name="table">
                    <div class="igrp_item text">
                      <a id="idp_table"/>
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/table) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/table" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/table" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/table/@name}" value="{rows/content/form/value/table}" class="text IGRP_change" maxlength="200">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/table"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if><!-- INICIO SEPARADOR escolher_campos_a_serem_trad--><xsl:if test="rows/content/form/label/escolher_campos_a_serem_trad">
                  <div class="box-content resetPadding" sep-name="escolher_campos_a_serem_trad">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/escolher_campos_a_serem_trad"/>
                    </xsl:call-template>
                    <div class="box-collapser"><!-- START TABELA LIST--><div class="box-table table-responsive">
                        <table rel="T_escolher_campos_a_serem_trad" data-control="data-escolher_campos_a_serem_trad">
                          <thead>
                            <tr>
                              <xsl:if test="rows/content/form/table/escolher_campos_a_serem_trad/label/campo">
                                <xsl:if test="not(rows/content/form/table/escolher_campos_a_serem_trad/label/campo/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/escolher_campos_a_serem_trad/label/campo" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/escolher_campos_a_serem_trad/label/traduzir">
                                <xsl:if test="not(rows/content/form/table/escolher_campos_a_serem_trad/label/traduzir/@visible)">
                                  <th class="checkbox">
                                    <input type="checkbox" name="p_traduzir_all" class="IGRP_checkall"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                            </tr>
                          </thead>
                          <tbody>
                            <xsl:for-each select="rows/content/form/table/escolher_campos_a_serem_trad/value/row[not(@total='yes')]">
                              <tr row="{position()}">
                                <xsl:if test="campo">
                                  <xsl:if test="not(campo/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/campo}" class="text">
                                      <xsl:value-of select="campo" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_campo_fk" value="{campo}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="campo/@visible = 'false'">
                                    <input type="hidden" name="p_campo_fk" value="{campo}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="traduzir">
                                  <xsl:if test="not(traduzir/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/traduzir}" class="checkbox">
                                      <xsl:if test="traduzir != '-0'">
                                        <input type="checkbox" name="p_traduzir_fk" value="{traduzir}">
                                          <xsl:if test="traduzir_check=traduzir">
                                            <xsl:attribute name="checked">checked</xsl:attribute>
                                          </xsl:if>
                                        </input>
                                      </xsl:if>
                                      <xsl:value-of select="traduzir_desc"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="traduzir/@visible = 'false'">
                                    <input type="hidden" name="p_traduzir_fk" value="{traduzir}"/>
                                  </xsl:if>
                                </xsl:if>
                                <input type="hidden" name="p_escolher_campos_a_serem_trad_id" value="{escolher_campos_a_serem_trad_id}"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150605"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150605"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150605"/>
</xsl:stylesheet>
