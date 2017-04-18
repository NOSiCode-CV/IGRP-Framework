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
                </xsl:apply-templates><!-- END NOTIFICATION MESSAGES--><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!-- START HIDDEN FILTER--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/><!-- END HIDDEN FILTER--><!-- START HIDDEN FORM--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- END HIDDEN FORM--><!-- START FORM--><!--START TOOL BAR FROM--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar"/><!--END TOOL BAR FORM--><div class="box-content">
                    <xsl:if test="rows/content/form/label/nome">
                      <label>
                        <span>(*)<xsl:value-of select="rows/content/form/label/nome"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/nome/@name}" value="{rows/content/form/value/nome}" class="text required" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/nome"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/codigo">
                      <label>
                        <span>(*)<xsl:value-of select="rows/content/form/label/codigo"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/codigo/@name}" value="{rows/content/form/value/codigo}" class="text required" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/codigo"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/nif">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/nif"/>
                        </span>
                        <input type="LOOKUP_NIF" name="{rows/content/form/value/nif/@name}" value="{rows/content/form/value/nif}" class="LOOKUP_NIF" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/nif"/>
                          </xsl:call-template>
                        </input>
                        <xsl:call-template name="lookup-tool">
                          <xsl:with-param name="page" select="'LOOKUP'"/>
                          <xsl:with-param name="action" select="'LOOKUP_NIF'"/>
                          <xsl:with-param name="name" select="rows/content/form/value/nif/@name"/>
                          <xsl:with-param name="js_lookup" select="rows/content/form/lookup/nif"/>
                        </xsl:call-template>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/organica">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/organica"/>
                        </span>
                        <input type="LOOKUP_ORG" name="{rows/content/form/value/organica/@name}" value="{rows/content/form/value/organica}" class="LOOKUP_ORG" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/organica"/>
                          </xsl:call-template>
                        </input>
                        <xsl:call-template name="lookup-tool">
                          <xsl:with-param name="page" select="'LOOKUP'"/>
                          <xsl:with-param name="action" select="'LOOKUP_ORG'"/>
                          <xsl:with-param name="name" select="rows/content/form/value/organica/@name"/>
                          <xsl:with-param name="js_lookup" select="rows/content/form/lookup/organica"/>
                        </xsl:call-template>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/aplicacao">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/aplicacao"/>
                        </span>
                        <select name="{rows/content/form/list/aplicacao/@name}" class="select" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/aplicacao"/>
                          </xsl:call-template>
                          <xsl:for-each select="rows/content/form/list/aplicacao/option">
                            <option value="{value}">
                              <xsl:if test="@selected='true'">
                                <xsl:attribute name="selected">selected</xsl:attribute>
                              </xsl:if>
                              <xsl:value-of select="text"/>
                            </option>
                          </xsl:for-each>
                        </select>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/id"/>
                    <xsl:if test="rows/content/form/label/id_organica"/>
                    <xsl:if test="rows/content/form/label/id_aplicacao"/>
                  </div><!-- END FORM--></form><!-- END YOUR CODE HERE --></div>
            </div><!-- START HOME BOTTOM --><xsl:call-template name="home-side"/>
          </div>
        </div><!--HOME-FOOTER--></body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20140131"/>
  <xsl:include href="../../xsl/tmpl/IGRP-JSvalidation.tmpl.xsl?v=20140131"/>
  <xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=20140131"/>
  <xsl:include href="../../xsl/tmpl/IGRP-others.tmpl.xsl?v=20140131"/>
</xsl:stylesheet>
