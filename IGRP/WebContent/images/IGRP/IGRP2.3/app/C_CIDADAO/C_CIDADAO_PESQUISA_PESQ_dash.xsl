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
                </xsl:apply-templates><!-- END NOTIFICATION MESSAGES--><form action="#" method="post" id="formular_default" name="formular_default" class="default_filter"><!-- START HIDDEN FILTER--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/><!-- END HIDDEN FILTER--><!-- START HIDDEN FORM--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- END HIDDEN FORM--><!-- START FILTER--><div class="box-content">
                    <xsl:if test="rows/content/filter/label/nom_proprietario">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/filter/label/nom_proprietario"/>
                        </span>
                        <input type="text" name="{rows/content/filter/value/nom_proprietario/@name}" value="{rows/content/filter/value/nom_proprietario}" class="text" maxlength="100">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/nom_proprietario"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/filter/label/matric">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/filter/label/matric"/>
                        </span>
                        <input type="text" name="{rows/content/filter/value/matric/@name}" value="{rows/content/filter/value/matric}" class="text" maxlength="8">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/matric"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if><!--START TOOL BAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar"/><!--END TOOL BAR FILTER--></div><!-- END FILTER--><!-- START TABELA--><!--  CONTEXT-MENU  --><div class="table">
                    <table class="sortable IGRP_table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/n_prop">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/n_prop"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/matr_vtra">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/matr_vtra"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/mac_vtra">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/mac_vtra"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/mdl_vtra">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/mdl_vtra"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <xsl:variable name="pos" select="(position()+1) mod 2"/>
                          <tr class="">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="n_prop">
                              <td align="" class="table_row{$pos}">
                                <xsl:value-of select="n_prop"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="matr_vtra">
                              <td align="" class="table_row{$pos}">
                                <xsl:value-of select="matr_vtra"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="mac_vtra">
                              <td align="" class="table_row{$pos}">
                                <xsl:value-of select="mac_vtra"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="mdl_vtra">
                              <td align="" class="table_row{$pos}">
                                <xsl:value-of select="mdl_vtra"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20140424"/>
  <xsl:include href="../../xsl/tmpl/IGRP-JSvalidation.tmpl.xsl?v=20140424"/>
  <xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=20140424"/>
  <xsl:include href="../../xsl/tmpl/IGRP-others.tmpl.xsl?v=20140424"/>
</xsl:stylesheet>
