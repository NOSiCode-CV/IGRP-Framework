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
                <xsl:if test="rows/content/form/label/scanner">
                  <div class="col-1-4 item" item-name="scanner">
                    <div class="igrp_item select">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/scanner) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/scanner" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/scanner" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/scanner/@name}" chosen="select" data-placeholder="{rows/content/form/list/scanner/option[position() = 1]}" class="select">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/scanner"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/scanner/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/serverlink">
                  <div class="col-1-4 item" item-name="serverlink">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/serverlink) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/serverlink" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/serverlink" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/serverlink/@name}" value="{rows/content/form/value/serverlink}" class="text" maxlength="2000">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/serverlink"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/viewlink">
                  <div class="col-1-4 item" item-name="viewlink">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/viewlink) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/viewlink" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/viewlink" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/viewlink/@name}" value="{rows/content/form/value/viewlink}" class="text" maxlength="2000">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/viewlink"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/docfile">
                  <div class="col-1-4 item" item-name="docfile">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/docfile) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/docfile" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/docfile" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/docfile/@name}" value="{rows/content/form/value/docfile}" class="text" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/docfile"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/docfileid">
                  <div class="col-1-4 item" item-name="docfileid">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/docfileid) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/docfileid" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/docfileid" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/docfileid/@name}" value="{rows/content/form/value/docfileid}" class="text" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/docfileid"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/doc">
                  <div class="col-1-4 item" item-name="doc">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/doc) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/doc" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/doc" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/doc/@name}" value="{rows/content/form/value/doc}" class="text" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/doc"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/doctype_fk">
                  <div class="col-1-4 item" item-name="doctype_fk">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/doctype_fk) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/doctype_fk" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/doctype_fk" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/doctype_fk/@name}" value="{rows/content/form/value/doctype_fk}" class="text" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/doctype_fk"/>
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
                          <xsl:if test="rows/content/table/label/id">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/id"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/descricao">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/descricao"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/content_fk">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/content_fk"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <tr row="{position()}" class="">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="id">
                              <td align="" data-row="{position()}" data-title="{../../label/id}" class="text">
                                <xsl:value-of select="id"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="descricao">
                              <td align="" data-row="{position()}" data-title="{../../label/descricao}" class="text">
                                <xsl:value-of select="descricao"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="content_fk">
                              <td align="" data-row="{position()}" data-title="{../../label/content_fk}" class="text">
                                <xsl:value-of select="content_fk"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150311"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150311"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150311"/>
</xsl:stylesheet>
