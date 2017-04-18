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
                    <xsl:if test="rows/content/form/label/cliente">
                      <label>
                        <span>(*)<xsl:value-of select="rows/content/form/label/cliente"/>
                        </span>
                        <input type="LOOKUP" name="{rows/content/form/value/cliente/@name}" value="{rows/content/form/value/cliente}" class="LOOKUP required" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/cliente"/>
                          </xsl:call-template>
                        </input>
                        <xsl:call-template name="lookup-tool">
                          <xsl:with-param name="page" select="rows/page"/>
                          <xsl:with-param name="ad_hoc" select="'1'"/>
                          <xsl:with-param name="action" select="'LOOKUP'"/>
                          <xsl:with-param name="name" select="rows/content/form/value/cliente/@name"/>
                          <xsl:with-param name="js_lookup" select="rows/content/form/lookup/cliente"/>
                        </xsl:call-template>
                      </label>
                    </xsl:if>
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
                    <xsl:if test="rows/content/form/label/webservice">
                      <label>
                        <span>(*)<xsl:value-of select="rows/content/form/label/webservice"/>
                        </span>
                        <input type="LOOKUP" name="{rows/content/form/value/webservice/@name}" value="{rows/content/form/value/webservice}" class="LOOKUP required" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/webservice"/>
                          </xsl:call-template>
                        </input>
                        <xsl:call-template name="lookup-tool">
                          <xsl:with-param name="page" select="rows/page"/>
                          <xsl:with-param name="ad_hoc" select="'1'"/>
                          <xsl:with-param name="action" select="'LOOKUP'"/>
                          <xsl:with-param name="name" select="rows/content/form/value/webservice/@name"/>
                          <xsl:with-param name="js_lookup" select="rows/content/form/lookup/webservice"/>
                        </xsl:call-template>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/descricao">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/descricao"/>
                        </span>
                        <textarea name="{rows/content/form/value/descricao/@name}" class="textarea" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/descricao"/>
                          </xsl:call-template>
                          <xsl:value-of select="rows/content/form/value/descricao"/>
                        </textarea>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/estado">
                      <label>
                        <span>(*)<xsl:value-of select="rows/content/form/label/estado"/>
                        </span>
                        <select name="{rows/content/form/list/estado/@name}" class="select required" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/estado"/>
                          </xsl:call-template>
                          <xsl:for-each select="rows/content/form/list/estado/option">
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
                    <xsl:if test="rows/content/form/label/request">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/request"/>
                        </span>
                        <input type="checkbox" name="{rows/content/form/value/request/@name}" value="1" class="checkbox" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/request"/>
                          </xsl:call-template>
                          <xsl:if test="rows/content/form/value/request='1'">
                            <xsl:attribute name="checked">checked</xsl:attribute>
                          </xsl:if>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/response">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/response"/>
                        </span>
                        <input type="checkbox" name="{rows/content/form/value/response/@name}" value="1" class="checkbox" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/response"/>
                          </xsl:call-template>
                          <xsl:if test="rows/content/form/value/response='1'">
                            <xsl:attribute name="checked">checked</xsl:attribute>
                          </xsl:if>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/id"/>
                    <xsl:if test="rows/content/form/label/id_cliente"/>
                    <xsl:if test="rows/content/form/label/aplication"/>
                    <xsl:if test="rows/content/form/label/id_servico"/>
                    <xsl:if test="rows/content/form/label/p_code"/>
                    <xsl:if test="rows/content/form/label/host">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/host"/>
                        </span>
                        <select name="{rows/content/form/list/host/@name}" class="select" maxlength="60">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/host"/>
                          </xsl:call-template>
                          <xsl:for-each select="rows/content/form/list/host/option">
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
                    <xsl:if test="rows/content/form/label/p_service"/>
                    <xsl:if test="rows/content/form/label/anexo">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/anexo"/>
                        </span>
                        <input type="" name="{rows/content/form/value/anexo/@name}" value="{rows/content/form/value/anexo}" class="" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/anexo"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/tipo_documento">
                      <label>
                        <span>(*)<xsl:value-of select="rows/content/form/label/tipo_documento"/>
                        </span>
                        <select name="{rows/content/form/list/tipo_documento/@name}" class="select required" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/tipo_documento"/>
                          </xsl:call-template>
                          <xsl:for-each select="rows/content/form/list/tipo_documento/option">
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
                    <xsl:if test="rows/content/form/label/descricao_anexo">
                      <label>
                        <span>(*)<xsl:value-of select="rows/content/form/label/descricao_anexo"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/descricao_anexo/@name}" value="{rows/content/form/value/descricao_anexo}" class="text required" maxlength="50">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/descricao_anexo"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/ficheiro">
                      <label>
                        <span>(*)<xsl:value-of select="rows/content/form/label/ficheiro"/>
                        </span>
                        <input type="file" name="{rows/content/form/value/ficheiro/@name}" value="{rows/content/form/value/ficheiro}" class="file required" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/ficheiro"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/estado_anexo">
                      <label>
                        <span>(*)<xsl:value-of select="rows/content/form/label/estado_anexo"/>
                        </span>
                        <select name="{rows/content/form/list/estado_anexo/@name}" class="select required" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/estado_anexo"/>
                          </xsl:call-template>
                          <xsl:for-each select="rows/content/form/list/estado_anexo/option">
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20140417"/>
  <xsl:include href="../../xsl/tmpl/IGRP-JSvalidation.tmpl.xsl?v=20140417"/>
  <xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=20140417"/>
  <xsl:include href="../../xsl/tmpl/IGRP-others.tmpl.xsl?v=20140417"/>
</xsl:stylesheet>
