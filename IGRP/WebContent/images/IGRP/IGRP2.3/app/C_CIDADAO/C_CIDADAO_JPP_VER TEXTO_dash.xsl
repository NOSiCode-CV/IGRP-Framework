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
                </xsl:apply-templates><!-- END NOTIFICATION MESSAGES--><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!-- START HIDDEN FILTER--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/><!-- END HIDDEN FILTER--><!-- START HIDDEN FORM--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- END HIDDEN FORM--><!-- START FORM--><div class="box-content">
                    <xsl:if test="rows/content/form/label/formato">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/formato"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/formato/@name}" value="{rows/content/form/value/formato}" class="text" readonly="readonly" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/formato"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/nome">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/nome"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/nome/@name}" value="{rows/content/form/value/nome}" class="text" readonly="readonly" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/nome"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/texto">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/texto"/>
                        </span>
                        <xsl:call-template name="text-editor">
                          <xsl:with-param name="name" select="rows/content/form/value/texto/@name"/>
                          <xsl:with-param name="value" select="rows/content/form/value/texto"/>
                        </xsl:call-template>
                      </label>
                    </xsl:if>
                  </div><!-- END FORM--><!-- START TABELA--><!--  CONTEXT-MENU  --><div class="table">
                    <table class="sortable IGRP_table">
                      <thead>
                        <tr/>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <xsl:variable name="pos" select="(position()+1) mod 2"/>
                          <tr class="">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20140702"/>
  <xsl:include href="../../xsl/tmpl/IGRP-JSvalidation.tmpl.xsl?v=20140702"/>
  <xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=20140702"/>
  <xsl:include href="../../xsl/tmpl/IGRP-others.tmpl.xsl?v=20140702"/>
  <xsl:include href="../../xsl/tmpl/IGRP-form-text-editor.tmpl.xsl?v=20140702"/>
</xsl:stylesheet>
