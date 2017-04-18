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
                  <xsl:if test="rows/content/filter/label/dt_inicio">
                    <div class="col-1-4 item" item-name="dt_inicio">
                      <div class="igrp_item date">
                        <label>
                          <xsl:value-of select="rows/content/filter/label/dt_inicio" disable-output-escaping="yes"/>
                        </label>
                        <div class="itemIcon">
                          <input type="text" name="{rows/content/filter/value/dt_inicio/@name}" value="{rows/content/filter/value/dt_inicio}" class="date" trel="IGRP_datePicker">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/filter/label/dt_inicio"/>
                            </xsl:call-template>
                          </input>
                          <div class="calendar"/>
                        </div>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/filter/label/dt_fim">
                    <div class="col-1-4 item" item-name="dt_fim">
                      <div class="igrp_item date">
                        <label>
                          <xsl:value-of select="rows/content/filter/label/dt_fim" disable-output-escaping="yes"/>
                        </label>
                        <div class="itemIcon">
                          <input type="text" name="{rows/content/filter/value/dt_fim/@name}" value="{rows/content/filter/value/dt_fim}" class="date" trel="IGRP_datePicker">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/filter/label/dt_fim"/>
                            </xsl:call-template>
                          </input>
                          <div class="calendar"/>
                        </div>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/filter/label/estado">
                    <div class="col-1-4 item" item-name="estado">
                      <div class="igrp_item select">
                        <label>
                          <xsl:value-of select="rows/content/filter/label/estado" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/filter/list/estado/@name}" chosen="select" data-placeholder="{rows/content/filter/list/estado/option[position() = 1]}" class="select">
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
                  <xsl:if test="rows/content/filter/label/categoria">
                    <div class="col-1-4 item" item-name="categoria">
                      <div class="igrp_item select">
                        <label>
                          <xsl:value-of select="rows/content/filter/label/categoria" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/filter/list/categoria/@name}" chosen="select" data-placeholder="{rows/content/filter/list/categoria/option[position() = 1]}" class="select">
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
                          <xsl:if test="rows/content/table/label/ticket">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/ticket"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/titulo">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/titulo"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/data">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/data"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/categoria">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/categoria"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/estado">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/estado"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <tr row="{position()}" class="IGRP_contextMenu">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="ticket">
                              <td align="" data-row="{position()}" data-title="{../../label/ticket}" class="text">
                                <xsl:value-of select="ticket"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="titulo">
                              <td align="" data-row="{position()}" data-title="{../../label/titulo}" class="text">
                                <xsl:value-of select="titulo"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="data">
                              <td align="" data-row="{position()}" data-title="{../../label/data}" class="date">
                                <xsl:value-of select="data"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="categoria">
                              <td align="" data-row="{position()}" data-title="{../../label/categoria}" class="text">
                                <xsl:value-of select="categoria"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="estado">
                              <td align="" data-row="{position()}" data-title="{../../label/estado}" class="text">
                                <xsl:value-of select="estado"/>
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
