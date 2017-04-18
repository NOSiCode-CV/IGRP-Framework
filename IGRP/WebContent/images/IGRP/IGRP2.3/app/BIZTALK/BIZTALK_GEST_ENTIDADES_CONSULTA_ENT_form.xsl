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
                    <xsl:if test="rows/content/form/label/aplication_n">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/aplication_n"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/aplication_n/@name}" value="{rows/content/form/value/aplication_n}" class="text" readonly="readonly" Tread="readonly" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/aplication_n"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/code">
                      <label>
                        <span>(*)<xsl:value-of select="rows/content/form/label/code"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/code/@name}" value="{rows/content/form/value/code}" class="text required" readonly="readonly" Tread="readonly" maxlength="10">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/code"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/type_n">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/type_n"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/type_n/@name}" value="{rows/content/form/value/type_n}" class="text" readonly="readonly" Tread="readonly" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/type_n"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/function">
                      <label>
                        <span>(*)<xsl:value-of select="rows/content/form/label/function"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/function/@name}" value="{rows/content/form/value/function}" class="text required" readonly="readonly" Tread="readonly" maxlength="250">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/function"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/db_link">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/db_link"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/db_link/@name}" value="{rows/content/form/value/db_link}" class="text" readonly="readonly" Tread="readonly" maxlength="100">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/db_link"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/wsdl">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/wsdl"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/wsdl/@name}" value="{rows/content/form/value/wsdl}" class="text" readonly="readonly" Tread="readonly" maxlength="250">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/wsdl"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/url">
                      <label>
                        <span>(*)<xsl:value-of select="rows/content/form/label/url"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/url/@name}" value="{rows/content/form/value/url}" class="text required" readonly="readonly" Tread="readonly" maxlength="250">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/url"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/namespace">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/namespace"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/namespace/@name}" value="{rows/content/form/value/namespace}" class="text" readonly="readonly" Tread="readonly" maxlength="250">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/namespace"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/method">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/method"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/method/@name}" value="{rows/content/form/value/method}" class="text" readonly="readonly" Tread="readonly" maxlength="150">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/method"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/wallet">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/wallet"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/wallet/@name}" value="{rows/content/form/value/wallet}" class="text" readonly="readonly" Tread="readonly" maxlength="250">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/wallet"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/link_report">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/link_report"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/link_report/@name}" value="{rows/content/form/value/link_report}" class="text" readonly="readonly" Tread="readonly" maxlength="150">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/link_report"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/estado_n">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/estado_n"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/estado_n/@name}" value="{rows/content/form/value/estado_n}" class="text" readonly="readonly" Tread="readonly" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/estado_n"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/cliente">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/cliente"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/cliente/@name}" value="{rows/content/form/value/cliente}" class="text" readonly="readonly" Tread="readonly" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/cliente"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/produto">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/produto"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/produto/@name}" value="{rows/content/form/value/produto}" class="text" readonly="readonly" Tread="readonly" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/produto"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/percentagem">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/percentagem"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/percentagem/@name}" value="{rows/content/form/value/percentagem}" class="text" readonly="readonly" Tread="readonly" maxlength="6">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/percentagem"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/valor">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/valor"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/valor/@name}" value="{rows/content/form/value/valor}" class="text" readonly="readonly" Tread="readonly" maxlength="9">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/valor"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                  </div><!-- END FORM--></form><!-- END YOUR CODE HERE --></div>
            </div><!-- START HOME BOTTOM --><xsl:call-template name="home-side"/>
          </div>
        </div><!--HOME-FOOTER--></body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20140924"/>
  <xsl:include href="../../xsl/tmpl/IGRP-JSvalidation.tmpl.xsl?v=20140924"/>
  <xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=20140924"/>
  <xsl:include href="../../xsl/tmpl/IGRP-others.tmpl.xsl?v=20140924"/>
</xsl:stylesheet>
