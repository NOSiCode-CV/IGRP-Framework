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
                    <xsl:if test="rows/content/form/label/id"/>
                    <xsl:if test="rows/content/form/label/env_fk">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/env_fk"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/env_fk/@name}" value="{rows/content/form/value/env_fk}" class="text" disabled="disabled" maxlength="100">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/env_fk"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/entity">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/entity"/>
                        </span>
                        <input type="number" name="{rows/content/form/value/entity/@name}" value="{rows/content/form/value/entity}" class="number" disabled="disabled" maxlength="10">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/entity"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/reference">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/reference"/>
                        </span>
                        <input type="number" name="{rows/content/form/value/reference/@name}" value="{rows/content/form/value/reference}" class="number" disabled="disabled" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/reference"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/valor">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/valor"/>
                        </span>
                        <input type="number" name="{rows/content/form/value/valor/@name}" value="{rows/content/form/value/valor}" class="number" disabled="disabled" maxlength="22">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/valor"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/nif">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/nif"/>
                        </span>
                        <input type="number" name="{rows/content/form/value/nif/@name}" value="{rows/content/form/value/nif}" class="number" disabled="disabled" maxlength="20">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/nif"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/operation">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/operation"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/operation/@name}" value="{rows/content/form/value/operation}" class="text" disabled="disabled" maxlength="50">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/operation"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/dt_created">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/dt_created"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/dt_created/@name}" value="{rows/content/form/value/dt_created}" class="text" disabled="disabled" maxlength="10">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/dt_created"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/dt_expired">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/dt_expired"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/dt_expired/@name}" value="{rows/content/form/value/dt_expired}" class="text" disabled="disabled" maxlength="10">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/dt_expired"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/description">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/description"/>
                        </span>
                        <textarea name="{rows/content/form/value/description/@name}" class="textarea" disabled="disabled" maxlength="250">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/description"/>
                          </xsl:call-template>
                          <xsl:value-of select="rows/content/form/value/description"/>
                        </textarea>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/link_report">
                      <label>
                        <span>
                          <a href="{rows/content/form/value/link_report}" class="_blank form_link" name="p_link_report">
                            <xsl:value-of select="rows/content/form/label/link_report"/>
                          </a>
                        </span>
                      </label>
                    </xsl:if>
                  </div><!-- END FORM--></form><!-- END YOUR CODE HERE --></div>
            </div><!-- START HOME BOTTOM --><xsl:call-template name="home-side"/>
          </div>
        </div><!--HOME-FOOTER--></body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20140206"/>
  <xsl:include href="../../xsl/tmpl/IGRP-JSvalidation.tmpl.xsl?v=20140206"/>
  <xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=20140206"/>
  <xsl:include href="../../xsl/tmpl/IGRP-others.tmpl.xsl?v=20140206"/>
</xsl:stylesheet>
