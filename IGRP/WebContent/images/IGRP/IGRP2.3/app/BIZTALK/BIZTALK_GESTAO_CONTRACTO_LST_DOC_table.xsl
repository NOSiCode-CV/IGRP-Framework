<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html><!--XSL Generator (RED / DIM )--><!--HOME-HEADER--><xsl:call-template name="home-header"/>
      <xsl:apply-templates mode="js_validation" select="rows/content/js_validation"/>
      <body><!--HOME TOP--><xsl:call-template name="home-top-main"/><!--CENTER PANE--><div class="general">
          <div id="content">
            <div class="ui-layout-center">
              <xsl:call-template name="dialog-modal"/><!-- START YOUR CODE HERE --><div class="box-content"><!--PAGE TITLE--><xsl:call-template name="page-title">
                  <xsl:with-param name="title" select="rows/content/title"/>
                </xsl:call-template><!--END PAGE TITLE--><!-- START NOTIFICATION MESSAGES--><xsl:apply-templates mode="notif_messages" select="rows/content/messages">
                  <xsl:with-param name="class" select="'notification'"/>
                </xsl:apply-templates><!-- END NOTIFICATION MESSAGES--><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!-- START HIDDEN FILTER--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/><!-- END HIDDEN FILTER--><!-- START HIDDEN FORM--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- END HIDDEN FORM--><!-- START FILTER--><!-- END FILTER--><!--START TOOL BAR TABLE--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar"/><!--END TOOL BAR TABLE--><!-- START TABELA--><!--  CONTEXT-MENU  --><div class="table">
                    <table class="sortable IGRP_table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/anexo">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/anexo"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/tipo_documento">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/tipo_documento"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/ficheiro">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/ficheiro"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/upload_id">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/upload_id"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <xsl:variable name="pos" select="(position()+1) mod 2"/>
                          <tr class="">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="anexo">
                              <td align="" class="table_row{$pos}">
                                <xsl:value-of select="anexo"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="tipo_documento">
                              <td align="" class="table_row{$pos}">
                                <xsl:value-of select="tipo_documento"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="ficheiro">
                              <td align="" class="table_row{$pos}">
                                <xsl:choose>
                                  <xsl:when test="ficheiro != ''">
                                    <a href="{ficheiro}" class="_blank">
                                      <xsl:value-of select="ficheiro_desc"/>
                                    </a>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <xsl:value-of select="ficheiro_desc"/>
                                  </xsl:otherwise>
                                </xsl:choose>
                              </td>
                            </xsl:if>
                            <xsl:if test="upload_id">
                              <td align="" class="table_row{$pos}">
                                <xsl:value-of select="upload_id"/>
                              </td>
                            </xsl:if>
                          </tr>
                        </xsl:for-each>
                      </tbody>
                    </table>
                  </div><!-- END TABELA--></form><!-- END YOUR CODE HERE --></div>
            </div><!-- START HOME BOTTOM --><xsl:call-template name="home-side"/>
          </div>
        </div><!--HOME-FOOTER--></body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20140619"/>
  <xsl:include href="../../xsl/tmpl/IGRP-JSvalidation.tmpl.xsl?v=20140619"/>
  <xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=20140619"/>
  <xsl:include href="../../xsl/tmpl/IGRP-others.tmpl.xsl?v=20140619"/>
</xsl:stylesheet>
