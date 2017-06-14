<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html><!--XSL Generator (RED / DIM)--><!--HOME-HEADER--><xsl:call-template name="home-header"/>
      <xsl:apply-templates mode="js_validation" select="rows/content/js_validation"/>
      <body><!--HOME TOP--><xsl:call-template name="home-top-main"/><!--CENTER PANE--><div class="general">
          <div id="content">
            <div class="ui-layout-center">
              <xsl:call-template name="dialog-modal"/><!-- START YOUR CODE HERE --><div class="box-content"><!--PAGE TITLE--><xsl:call-template name="page-title">
                  <xsl:with-param name="title" select="rows/content/title"/>
                </xsl:call-template><!--END PAGE TITLE--><!-- START NOTIFICATION MESSAGES--><xsl:apply-templates mode="notif_messages" select="rows/content/messages">
                  <xsl:with-param name="class" select="'notification'"/>
                </xsl:apply-templates><!-- END NOTIFICATION MESSAGES--><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!-- START FORM--><!-- START HIDDEN FORM--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- END HIDDEN FORM--><!-- START SEPARADOR TAB--><!-- END SEPARADOR TAB--><!--START TOOL BAR FROM--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar"/><!--END TOOL BAR FORM--><div class="box-content">
                    <xsl:if test="rows/content/form/label/id"/>
                    <xsl:if test="rows/content/form/label/code">
                      <label>
                        <span>(*)<xsl:value-of select="rows/content/form/label/code"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/code/@name}" value="{rows/content/form/value/code}" class="text required" maxlength="20">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/code"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/code_lang">
                      <label>
                        <span>(*)<xsl:value-of select="rows/content/form/label/code_lang"/>
                        </span>
                        <select name="{rows/content/form/list/code_lang/@name}" class="select required" maxlength="22">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/code_lang"/>
                          </xsl:call-template>
                          <xsl:for-each select="rows/content/form/list/code_lang/option">
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
                    <xsl:if test="rows/content/form/label/description">
                      <label>
                        <span>(*)<xsl:value-of select="rows/content/form/label/description"/>
                        </span>
                        <textarea name="{rows/content/form/value/description/@name}" class="textarea required" maxlength="4000">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/description"/>
                          </xsl:call-template>
                          <xsl:value-of select="rows/content/form/value/description"/>
                        </textarea>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/user_fk"/>
                    <xsl:if test="rows/content/form/label/dt_reg"/>
                    <xsl:if test="rows/content/form/label/msg_type">
                      <label>
                        <span>(*)<xsl:value-of select="rows/content/form/label/msg_type"/>
                        </span>
                        <select name="{rows/content/form/list/msg_type/@name}" class="select required" maxlength="20">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/msg_type"/>
                          </xsl:call-template>
                          <xsl:for-each select="rows/content/form/list/msg_type/option">
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
                  </div><!-- END FORM--></form><!-- END YOUR CODE HERE --></div>
            </div><!-- START HOME BOTTOM --><xsl:call-template name="home-side"/>
          </div>
        </div><!--HOME-FOOTER--></body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20140122"/>
  <xsl:include href="../../xsl/tmpl/IGRP-JSvalidation.tmpl.xsl?v=20140122"/>
  <xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=20140122"/>
  <xsl:include href="../../xsl/tmpl/IGRP-others.tmpl.xsl?v=20140122"/>
</xsl:stylesheet>
