<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html><!--XSL Generator (RED/DIM 2015)--><head><!--HOME-HEADER--><xsl:call-template name="home-header"/>
      </head>
      <body class="bodyColor">
        <div class="IGRP_overlay"/><!--HOME TOP--><xsl:call-template name="home-top-main"/><!--HOME--><div id="igrp-bodyPage"><!--HOME LEFT--><xsl:call-template name="home-slide-menu"/><!--HOME RIGTH--><div class="bodyPageRigth"><!-- START YOUR CODE HERE --><!-- SHOW TABLET AND MOBILE TITLE --><div class="box-head showTabMobile">
              <xsl:value-of select="rows/content/title"/>
            </div><!-- SHOW NOTIFICATION MESSAGES--><xsl:apply-templates mode="notif_messages" select="rows/content/messages"/><!-- START SIMPLE-MENU --><xsl:apply-templates mode="simple-menu" select="rows/content/menu"/><!-- END SIMPLE-MENU --><form action="#" method="post" id="formular_default" name="formular_default" class="default_filter"><!-- SHOW HIDDEN--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FILTER--><div class="box-content resetPadding">
                <div class="col">
                  <xsl:if test="rows/content/filter/label/id_tarefa_pai">
                    <div class="col-1-4 item" item-name="id_tarefa_pai">
                      <div class="igrp_item select">
                        <a id="idp_id_tarefa_pai"/>
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/id_tarefa_pai) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/id_tarefa_pai" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/id_tarefa_pai" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/filter/list/id_tarefa_pai/@name}" chosen="select" id="{rows/content/filter/list/id_tarefa_pai/@name}" data-placeholder="{rows/content/filter/list/id_tarefa_pai/option[position() = 1]}" class="select IGRP_change">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/id_tarefa_pai"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/filter/list/id_tarefa_pai/option[position() != 1]">
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
                  <xsl:if test="rows/content/filter/label/tipo">
                    <div class="col-1-4 item" item-name="tipo">
                      <div class="igrp_item selectchange">
                        <a id="idp_tipo"/>
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/tipo) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/tipo" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/tipo" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/filter/list/tipo/@name}" chosen="select" id="{rows/content/filter/list/tipo/@name}" data-placeholder="{rows/content/filter/list/tipo/option[position() = 1]}" class="selectchange IGRP_change">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/tipo"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/filter/list/tipo/option[position() != 1]">
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
                  <xsl:if test="rows/content/filter/label/fase">
                    <div class="col-1-4 item" item-name="fase">
                      <div class="igrp_item selectchange">
                        <a id="idp_fase"/>
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/fase) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/fase" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/fase" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/filter/list/fase/@name}" chosen="select" id="{rows/content/filter/list/fase/@name}" data-placeholder="{rows/content/filter/list/fase/option[position() = 1]}" class="selectchange IGRP_change">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/fase"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/filter/list/fase/option[position() != 1]">
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
                  <xsl:if test="rows/content/filter/label/estado">
                    <div class="col-1-4 item" item-name="estado">
                      <div class="igrp_item select">
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/estado) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/estado" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/estado" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/filter/list/estado/@name}" chosen="select" id="{rows/content/filter/list/estado/@name}" data-placeholder="{rows/content/filter/list/estado/option[position() = 1]}" class="select">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/estado"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/filter/list/estado/option[position() != 1]">
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
                  <xsl:if test="rows/content/filter/label/data_inicio">
                    <div class="col-1-4 item" item-name="data_inicio">
                      <div class="igrp_item date">
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/data_inicio) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/data_inicio" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/data_inicio" disable-output-escaping="yes"/>
                        </label>
                        <div class="itemIcon">
                          <input type="text" name="{rows/content/filter/value/data_inicio/@name}" value="{rows/content/filter/value/data_inicio}" class="date" trel="IGRP_datePicker">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/filter/label/data_inicio"/>
                            </xsl:call-template>
                          </input>
                          <div class="calendar"/>
                        </div>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/filter/label/data_fim">
                    <div class="col-1-4 item" item-name="data_fim">
                      <div class="igrp_item date">
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/data_fim) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/data_fim" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/data_fim" disable-output-escaping="yes"/>
                        </label>
                        <div class="itemIcon">
                          <input type="text" name="{rows/content/filter/value/data_fim/@name}" value="{rows/content/filter/value/data_fim}" class="date" trel="IGRP_datePicker">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/filter/label/data_fim"/>
                            </xsl:call-template>
                          </input>
                          <div class="calendar"/>
                        </div>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/filter/label/uti_atribuido_id">
                    <div class="col-1-4 item" item-name="uti_atribuido_id">
                      <div class="igrp_item select">
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/uti_atribuido_id) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/uti_atribuido_id" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/uti_atribuido_id" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/filter/list/uti_atribuido_id/@name}" chosen="select" id="{rows/content/filter/list/uti_atribuido_id/@name}" data-placeholder="{rows/content/filter/list/uti_atribuido_id/option[position() = 1]}" class="select">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/uti_atribuido_id"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/filter/list/uti_atribuido_id/option[position() != 1]">
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
                  <xsl:if test="rows/content/filter/label/atrasado">
                    <div class="col-1-4 item" item-name="atrasado">
                      <div class="igrp_item checkbox">
                        <div class="col-1-1">
                          <input type="checkbox" name="{rows/content/filter/value/atrasado/@name}" value="1" class="checkbox">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/filter/label/atrasado"/>
                            </xsl:call-template>
                            <xsl:if test="rows/content/filter/value/atrasado='1'">
                              <xsl:attribute name="checked">checked</xsl:attribute>
                            </xsl:if>
                          </input>
                          <xsl:value-of select="rows/content/filter/label/atrasado" disable-output-escaping="yes"/>
                        </div>
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
                          <xsl:if test="rows/content/table/label/nome">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/nome"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/tipo">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/tipo"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/estado">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/estado"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/dt_inicio">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/dt_inicio"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/dt_fim">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/dt_fim"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/atribuido_a">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/atribuido_a"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/bug">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/bug"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/cor">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/cor"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <tr row="{position()}" class="IGRP_contextMenu">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="nome">
                              <td align="" data-row="{position()}" data-title="{../../label/nome}" class="link">
                                <xsl:choose>
                                  <xsl:when test="nome != ''">
                                    <a href="{nome}" class="link bClick" target="_blank" name="nome">
                                      <xsl:value-of select="nome_desc" disable-output-escaping="yes"/>
                                    </a>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <xsl:value-of select="nome_desc" disable-output-escaping="yes"/>
                                  </xsl:otherwise>
                                </xsl:choose>
                                <xsl:apply-templates mode="cxtmenu-resp" select="//rows/content/table/context-menu">
                                  <xsl:with-param name="ctx" select="context-menu"/>
                                </xsl:apply-templates>
                              </td>
                            </xsl:if>
                            <xsl:if test="tipo">
                              <td align="" data-row="{position()}" data-title="{../../label/tipo}" class="text">
                                <xsl:value-of select="tipo"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="estado">
                              <td align="" data-row="{position()}" data-title="{../../label/estado}" class="text">
                                <xsl:value-of select="estado"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="dt_inicio">
                              <td align="" data-row="{position()}" data-title="{../../label/dt_inicio}" class="date">
                                <xsl:value-of select="dt_inicio"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="dt_fim">
                              <td align="" data-row="{position()}" data-title="{../../label/dt_fim}" class="date">
                                <xsl:value-of select="dt_fim"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="atribuido_a">
                              <td align="" data-row="{position()}" data-title="{../../label/atribuido_a}" class="text">
                                <xsl:value-of select="atribuido_a"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="bug">
                              <td align="" data-row="{position()}" data-title="{../../label/bug}" class="link">
                                <xsl:choose>
                                  <xsl:when test="bug != ''">
                                    <a href="{bug}" class="link bClick" target="_blank" name="bug">
                                      <xsl:value-of select="bug_desc" disable-output-escaping="yes"/>
                                    </a>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <xsl:value-of select="bug_desc" disable-output-escaping="yes"/>
                                  </xsl:otherwise>
                                </xsl:choose>
                              </td>
                            </xsl:if>
                            <xsl:if test="cor">
                              <td align="" data-row="{position()}" data-title="{../../label/cor}" class="text">
                                <xsl:value-of select="cor"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150825"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150825"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150825"/>
  <xsl:include href="../../xsl/tmpl/IGRP-menu.tmpl.xsl?v=20150825"/>
  <xsl:include href="../../xsl/tmpl/IGRP-context.tmpl.xsl?v=20150825"/>
</xsl:stylesheet>
