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
                      <div class="igrp_item selectchange">
                        <a id="idp_env_fk"/>
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/filter/label/env_fk" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/filter/list/env_fk/@name}" chosen="select" data-placeholder="{rows/content/filter/list/env_fk/option[position() = 1]}" class="selectchange required IGRP_change">
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
                  <xsl:if test="rows/content/filter/label/area_super_fk">
                    <div class="col-1-4 item" item-name="area_super_fk">
                      <div class="igrp_item selectchange">
                        <a id="idp_area_super_fk"/>
                        <label>
                          <xsl:value-of select="rows/content/filter/label/area_super_fk" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/filter/list/area_super_fk/@name}" chosen="select" data-placeholder="{rows/content/filter/list/area_super_fk/option[position() = 1]}" class="selectchange IGRP_change">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/area_super_fk"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/filter/list/area_super_fk/option[position() != 1]">
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
                  <xsl:if test="rows/content/filter/label/area_fk">
                    <div class="col-1-4 item" item-name="area_fk">
                      <div class="igrp_item selectchange">
                        <a id="idp_area_fk"/>
                        <label>
                          <xsl:value-of select="rows/content/filter/label/area_fk" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/filter/list/area_fk/@name}" chosen="select" data-placeholder="{rows/content/filter/list/area_fk/option[position() = 1]}" class="selectchange IGRP_change">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/area_fk"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/filter/list/area_fk/option[position() != 1]">
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
                  <xsl:if test="rows/content/filter/label/proc_tp_fk">
                    <div class="col-1-4 item" item-name="proc_tp_fk">
                      <div class="igrp_item select">
                        <label>
                          <xsl:value-of select="rows/content/filter/label/proc_tp_fk" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/filter/list/proc_tp_fk/@name}" chosen="select" data-placeholder="{rows/content/filter/list/proc_tp_fk/option[position() = 1]}" class="select">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/proc_tp_fk"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/filter/list/proc_tp_fk/option[position() != 1]">
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
                          <xsl:if test="rows/content/table/label/nome_area">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/nome_area"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/proctp_name">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/proctp_name"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/name">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/name"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/class_name">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/class_name"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/eventos">
                            <th align="center">
                              <xsl:value-of select="rows/content/table/label/eventos"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/componentes">
                            <th align="center">
                              <xsl:value-of select="rows/content/table/label/componentes"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/inputs">
                            <th align="center">
                              <xsl:value-of select="rows/content/table/label/inputs"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/outputs">
                            <th align="center">
                              <xsl:value-of select="rows/content/table/label/outputs"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/perfis">
                            <th align="center">
                              <xsl:value-of select="rows/content/table/label/perfis"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <tr row="{position()}" class="IGRP_contextMenu">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="nome_area">
                              <td align="left" data-row="{position()}" data-title="{../../label/nome_area}" class="text">
                                <xsl:value-of select="nome_area"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="proctp_name">
                              <td align="left" data-row="{position()}" data-title="{../../label/proctp_name}" class="text">
                                <xsl:value-of select="proctp_name"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="name">
                              <td align="left" data-row="{position()}" data-title="{../../label/name}" class="text">
                                <xsl:value-of select="name"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="class_name">
                              <td align="left" data-row="{position()}" data-title="{../../label/class_name}" class="text">
                                <xsl:value-of select="class_name"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="eventos">
                              <td align="center" data-row="{position()}" data-title="{../../label/eventos}" class="link">
                                <xsl:choose>
                                  <xsl:when test="eventos != ''">
                                    <a href="{eventos}" class="link bClick" target="_blank" name="eventos">
                                      <xsl:value-of select="eventos_desc" disable-output-escaping="yes"/>
                                    </a>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <xsl:value-of select="eventos_desc" disable-output-escaping="yes"/>
                                  </xsl:otherwise>
                                </xsl:choose>
                              </td>
                            </xsl:if>
                            <xsl:if test="componentes">
                              <td align="center" data-row="{position()}" data-title="{../../label/componentes}" class="link">
                                <xsl:choose>
                                  <xsl:when test="componentes != ''">
                                    <a href="{componentes}" class="link bClick" target="_blank" name="componentes">
                                      <xsl:value-of select="componentes_desc" disable-output-escaping="yes"/>
                                    </a>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <xsl:value-of select="componentes_desc" disable-output-escaping="yes"/>
                                  </xsl:otherwise>
                                </xsl:choose>
                              </td>
                            </xsl:if>
                            <xsl:if test="inputs">
                              <td align="center" data-row="{position()}" data-title="{../../label/inputs}" class="link">
                                <xsl:choose>
                                  <xsl:when test="inputs != ''">
                                    <a href="{inputs}" class="link bClick" target="_blank" name="inputs">
                                      <xsl:value-of select="inputs_desc" disable-output-escaping="yes"/>
                                    </a>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <xsl:value-of select="inputs_desc" disable-output-escaping="yes"/>
                                  </xsl:otherwise>
                                </xsl:choose>
                              </td>
                            </xsl:if>
                            <xsl:if test="outputs">
                              <td align="center" data-row="{position()}" data-title="{../../label/outputs}" class="link">
                                <xsl:choose>
                                  <xsl:when test="outputs != ''">
                                    <a href="{outputs}" class="link bClick" target="_blank" name="outputs">
                                      <xsl:value-of select="outputs_desc" disable-output-escaping="yes"/>
                                    </a>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <xsl:value-of select="outputs_desc" disable-output-escaping="yes"/>
                                  </xsl:otherwise>
                                </xsl:choose>
                              </td>
                            </xsl:if>
                            <xsl:if test="perfis">
                              <td align="center" data-row="{position()}" data-title="{../../label/perfis}" class="link">
                                <xsl:choose>
                                  <xsl:when test="perfis != ''">
                                    <a href="{perfis}" class="link bClick" target="_blank" name="perfis">
                                      <xsl:value-of select="perfis_desc" disable-output-escaping="yes"/>
                                    </a>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <xsl:value-of select="perfis_desc" disable-output-escaping="yes"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150309"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150309"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150309"/>
  <xsl:include href="../../xsl/tmpl/IGRP-context.tmpl.xsl?v=20150309"/>
</xsl:stylesheet>
