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
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FORM--><!--START TOOLS BAR FROM--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar"/><!--END TOOLS BAR FORM--><div class="col addMarginTop" sep-name="form">
                <xsl:if test="rows/content/form/label/user_desc">
                  <div class="col-1-4 item" item-name="user_desc">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/user_desc) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/user_desc" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/user_desc" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/user_desc/@name}" value="{rows/content/form/value/user_desc}" class="text" maxlength="150">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/user_desc"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/date_action">
                  <div class="col-1-4 item" item-name="date_action">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/date_action) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/date_action" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/date_action" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/date_action/@name}" value="{rows/content/form/value/date_action}" class="text" maxlength="10">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/date_action"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/table_name">
                  <div class="col-1-4 item" item-name="table_name">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/table_name) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/table_name" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/table_name" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/table_name/@name}" value="{rows/content/form/value/table_name}" class="text" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/table_name"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/action">
                  <div class="col-1-4 item" item-name="action">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/action) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/action" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/action" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/action/@name}" value="{rows/content/form/value/action}" class="text" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/action"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/user_ip">
                  <div class="col-1-4 item" item-name="user_ip">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/user_ip) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/user_ip" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/user_ip" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/user_ip/@name}" value="{rows/content/form/value/user_ip}" class="text" maxlength="16">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/user_ip"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/user_context">
                  <div class="col-1-4 item" item-name="user_context">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/user_context) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/user_context" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/user_context" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/user_context/@name}" value="{rows/content/form/value/user_context}" class="text" maxlength="50">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/user_context"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if><!-- INICIO SEPARADOR value_changed--><xsl:if test="rows/content/form/label/value_changed">
                  <div class="box-content resetPadding" list-name="value_changed">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/value_changed"/>
                    </xsl:call-template>
                    <div class="box-collapser"><!-- START TABELA LIST--><div class="box-table table-responsive">
                        <table rel="T_value_changed" data-control="data-value_changed">
                          <thead>
                            <tr>
                              <xsl:if test="rows/content/form/table/value_changed/label/column">
                                <xsl:if test="not(rows/content/form/table/value_changed/label/column/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/value_changed/label/column" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/value_changed/label/before">
                                <xsl:if test="not(rows/content/form/table/value_changed/label/before/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/value_changed/label/before" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/value_changed/label/after">
                                <xsl:if test="not(rows/content/form/table/value_changed/label/after/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/value_changed/label/after" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                            </tr>
                          </thead>
                          <tbody>
                            <xsl:for-each select="rows/content/form/table/value_changed/value/row[not(@total='yes')]">
                              <tr row="{position()}">
                                <xsl:if test="column">
                                  <xsl:if test="not(column/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/column}" class="text">
                                      <xsl:value-of select="column" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_column_fk" value="{column}"/>
                                      <span class="showResponsiveTable ctxmenu"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="column/@visible = 'false'">
                                    <input type="hidden" name="p_column_fk" value="{column}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="before">
                                  <xsl:if test="not(before/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/before}" class="text">
                                      <xsl:value-of select="before" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_before_fk" value="{before}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="before/@visible = 'false'">
                                    <input type="hidden" name="p_before_fk" value="{before}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="after">
                                  <xsl:if test="not(after/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/after}" class="text">
                                      <xsl:value-of select="after" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_after_fk" value="{after}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="after/@visible = 'false'">
                                    <input type="hidden" name="p_after_fk" value="{after}"/>
                                  </xsl:if>
                                </xsl:if>
                                <input type="hidden" name="p_value_changed_id" value="{value_changed_id}"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150311"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150311"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150311"/>
</xsl:stylesheet>
