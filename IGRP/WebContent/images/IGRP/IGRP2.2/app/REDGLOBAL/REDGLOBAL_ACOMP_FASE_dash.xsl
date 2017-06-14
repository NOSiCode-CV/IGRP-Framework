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
            <form action="#" method="post" id="formular_default" name="formular_default" class="default_filter"><!-- SHOW HIDDEN--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FILTER--><div class="box-content resetPadding">
                <div class="col">
                  <xsl:if test="rows/content/filter/label/env_fk">
                    <div class="col-1-4 item" item-name="env_fk">
                      <div class="igrp_item select">
                        <a id="idp_env_fk"/>
                        <label>
                          <xsl:value-of select="rows/content/filter/label/env_fk" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/filter/list/env_fk/@name}" chosen="select" data-placeholder="{rows/content/filter/list/env_fk/option[position() = 1]}" class="select IGRP_change">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/env_fk"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/filter/list/env_fk/option[position() != 1]">
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
                  <xsl:if test="rows/content/filter/label/code">
                    <div class="col-1-4 item" item-name="code">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/filter/label/code" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/filter/value/code/@name}" value="{rows/content/filter/value/code}" class="text" maxlength="22">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/code"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/filter/label/description">
                    <div class="col-1-4 item" item-name="description">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/filter/label/description" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/filter/value/description/@name}" value="{rows/content/filter/value/description}" class="text" maxlength="150">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/description"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/filter/label/flag_notification">
                    <div class="col-1-4 item" item-name="flag_notification">
                      <div class="igrp_item select">
                        <label>
                          <xsl:value-of select="rows/content/filter/label/flag_notification" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/filter/list/flag_notification/@name}" chosen="select" data-placeholder="{rows/content/filter/list/flag_notification/option[position() = 1]}" class="select">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/flag_notification"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/filter/list/flag_notification/option[position() != 1]">
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
                  <xsl:if test="rows/content/filter/label/flag_confirm">
                    <div class="col-1-4 item" item-name="flag_confirm">
                      <div class="igrp_item select">
                        <label>
                          <xsl:value-of select="rows/content/filter/label/flag_confirm" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/filter/list/flag_confirm/@name}" chosen="select" data-placeholder="{rows/content/filter/list/flag_confirm/option[position() = 1]}" class="select">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/flag_confirm"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/filter/list/flag_confirm/option[position() != 1]">
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
                </div><!--START TOOL BAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar"/><!--END TOOL BAR FILTER--></div><!-- END FILTER--><!-- START TABELA--><div class="col addBorderLeftRight borderColor"><!--START TOOL BAR TABLE--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar">
                  <xsl:with-param name="isTable" select="'true'"/>
                  <xsl:with-param name="rel" select="'table'"/>
                </xsl:apply-templates><!--END TOOL BAR TABLE--><div class="box-table table-responsive">
                  <div class="table-container"><!--  CONTEXT-MENU  --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu">
                      <xsl:with-param name="contextId" select="'table'"/>
                    </xsl:apply-templates>
                    <table class="IGRP_table default-table" data-control="table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/code">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/code"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/description">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/description"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/flag_notification">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/flag_notification"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/flag_confirm">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/flag_confirm"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <tr row="{position()}" class="IGRP_contextMenu">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="code">
                              <td align="left" data-row="{position()}" data-title="{../../label/code}" class="text">
                                <xsl:value-of select="code"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="description">
                              <td align="left" data-row="{position()}" data-title="{../../label/description}" class="text">
                                <xsl:value-of select="description"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="flag_notification">
                              <td align="left" data-row="{position()}" data-title="{../../label/flag_notification}" class="text">
                                <xsl:value-of select="flag_notification"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="flag_confirm">
                              <td align="left" data-row="{position()}" data-title="{../../label/flag_confirm}" class="text">
                                <xsl:value-of select="flag_confirm"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150309"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150309"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150309"/>
  <xsl:include href="../../xsl/tmpl/IGRP-context.tmpl.xsl?v=20150309"/>
</xsl:stylesheet>
