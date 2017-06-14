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
                  <xsl:if test="rows/content/filter/label/env_fk">
                    <div class="col-1-4 item" item-name="env_fk">
                      <div class="igrp_item selectchange">
                        <a id="idp_env_fk"/>
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/env_fk) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/env_fk" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/env_fk" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/filter/list/env_fk/@name}" chosen="select" data-placeholder="{rows/content/filter/list/env_fk/option[position() = 1]}" class="selectchange IGRP_change">
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
                    <xsl:if test="rows/content/filter/label/action">
                    <div class="col-1-4 item" item-name="action">
                      <div class="igrp_item text">
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/action) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/action" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/action" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/filter/value/action/@name}" value="{rows/content/filter/value/action}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/action"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/filter/label/page">
                    <div class="col-1-4 item" item-name="page">
                      <div class="igrp_item text">
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/page) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/page" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/page" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/filter/value/page/@name}" value="{rows/content/filter/value/page}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/page"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
				   <xsl:if test="rows/content/filter/label/page_descr">
                    <div class="col-1-4 item" item-name="page_descr">
                      <div class="igrp_item text">
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/page_descr) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/page_descr" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/page_descr" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/filter/value/page_descr/@name}" value="{rows/content/filter/value/page_descr}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/page_descr"/>
                          </xsl:call-template>
                        </input>
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
                  <xsl:call-template name="filter-az">
                    <xsl:with-param name="name" select="rows/content/filter/value/name/@name"/>
                    <xsl:with-param name="value" select="rows/content/filter/value/name"/>
                    <xsl:with-param name="type" select="'filter_az'"/>
                  </xsl:call-template>
                  <div class="table-container"><!--  CONTEXT-MENU  --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu">
                      <xsl:with-param name="contextId" select="'table'"/>
                    </xsl:apply-templates>
                    <table class="IGRP_table default-table" data-control="table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/page">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/page"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/page_descr">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/page_descr"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/action_descr">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/action_descr"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/version">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/version"/>
                            </th>
                          </xsl:if>
						   <xsl:if test="rows/content/table/label/status">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/status"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <tr row="{position()}" class="IGRP_contextMenu">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="id">
                              <td align="left" data-row="{position()}" data-title="{../../label/id}" class="text">
                                <xsl:value-of select="id"/>
                                <xsl:apply-templates mode="cxtmenu-resp" select="//rows/content/table/context-menu">
                                  <xsl:with-param name="ctx" select="context-menu"/>
                                </xsl:apply-templates>
                              </td>
                            </xsl:if>
                            <xsl:if test="env">
                              <td align="left" data-row="{position()}" data-title="{../../label/env}" class="text">
                                <xsl:value-of select="env"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="page">
                              <td align="left" data-row="{position()}" data-title="{../../label/page}" class="text">
                                <xsl:value-of select="page"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="version">
                              <td align="left" data-row="{position()}" data-title="{../../label/version}" class="text">
                                <xsl:value-of select="version"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150318"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150318"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150318"/>
  <xsl:include href="../../xsl/tmpl/IGRP-context.tmpl.xsl?v=20150318"/>
</xsl:stylesheet>
