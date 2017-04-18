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
                    <xsl:if test="rows/content/form/label/assunto_notificacao">
                      <label>
                        <span>(*)<xsl:value-of select="rows/content/form/label/assunto_notificacao"/>
                        </span>
                        <select name="{rows/content/form/list/assunto_notificacao/@name}" class="select required" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/assunto_notificacao"/>
                          </xsl:call-template>
                          <xsl:for-each select="rows/content/form/list/assunto_notificacao/option">
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
                    <xsl:if test="rows/content/form/label/nome_medicamento">
                      <label>
                        <span>(*)<xsl:value-of select="rows/content/form/label/nome_medicamento"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/nome_medicamento/@name}" value="{rows/content/form/value/nome_medicamento}" class="text required" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/nome_medicamento"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/data_notificacao">
                      <label>
                        <span>(*)<xsl:value-of select="rows/content/form/label/data_notificacao"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/data_notificacao/@name}" value="{rows/content/form/value/data_notificacao}" class="text required" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/data_notificacao"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if><!-- INICIO SEPARADOR consultar__formulario--><xsl:if test="rows/content/form/label/consultar__formulario">
                      <div name="sep_consultar__formulario">
                        <xsl:call-template name="page-title">
                          <xsl:with-param name="title" select="rows/content/form/label/consultar__formulario"/>
                          <xsl:with-param name="class" select="'subtitle'"/>
                        </xsl:call-template>
                      </div>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/formulario">
                      <label>
                        <span>(*)<a href="{rows/content/form/value/formulario}" class="_blank form_link" name="p_formulario">
                            <xsl:value-of select="rows/content/form/label/formulario"/>
                          </a>
                        </span>
                      </label>
                    </xsl:if><!-- INICIO SEPARADOR analise_notificacao--><xsl:if test="rows/content/form/label/analise_notificacao">
                      <div name="sep_analise_notificacao">
                        <xsl:call-template name="page-title">
                          <xsl:with-param name="title" select="rows/content/form/label/analise_notificacao"/>
                          <xsl:with-param name="class" select="'subtitle'"/>
                        </xsl:call-template>
                      </div>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/parecer">
                      <label>
                        <span>(*)<xsl:value-of select="rows/content/form/label/parecer"/>
                        </span>
                        <textarea name="{rows/content/form/value/parecer/@name}" class="textarea required" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/parecer"/>
                          </xsl:call-template>
                          <xsl:value-of select="rows/content/form/value/parecer"/>
                        </textarea>
                      </label>
                    </xsl:if>
                  </div><!-- END FORM--><!-- START TABELA--><!--  CONTEXT-MENU  --><div class="table table-responsive">
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20141113"/>
  <xsl:include href="../../xsl/tmpl/IGRP-JSvalidation.tmpl.xsl?v=20141113"/>
  <xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=20141113"/>
  <xsl:include href="../../xsl/tmpl/IGRP-others.tmpl.xsl?v=20141113"/>
</xsl:stylesheet>
