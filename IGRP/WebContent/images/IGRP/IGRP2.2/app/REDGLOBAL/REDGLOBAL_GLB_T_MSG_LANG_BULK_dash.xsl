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
                  </div><!-- END FORM--><!-- START FILTER--><!-- START HIDDEN FILTER--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/><!-- END HIDDEN FILTER--><div class="box-content">
                    <xsl:if test="rows/content/filter/label/id"/>
                    <xsl:if test="rows/content/filter/label/code">
                      <label>
                        <span>(*)<xsl:value-of select="rows/content/filter/label/code"/>
                        </span>
                        <input type="text" name="{rows/content/filter/value/code/@name}" value="{rows/content/filter/value/code}" class="text required" maxlength="20">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/code"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/filter/label/code_lang">
                      <label>
                        <span>(*)<xsl:value-of select="rows/content/filter/label/code_lang"/>
                        </span>
                        <select name="{rows/content/filter/list/code_lang/@name}" class="select required" maxlength="22">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/code_lang"/>
                          </xsl:call-template>
                          <xsl:for-each select="rows/content/filter/list/code_lang/option">
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
                    <xsl:if test="rows/content/filter/label/description">
                      <label>
                        <span>(*)<xsl:value-of select="rows/content/filter/label/description"/>
                        </span>
                        <input type="text" name="{rows/content/filter/value/description/@name}" value="{rows/content/filter/value/description}" class="text required" maxlength="4000">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/description"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/filter/label/user_fk"/>
                    <xsl:if test="rows/content/filter/label/dt_reg"/>
                    <xsl:if test="rows/content/filter/label/msg_type">
                      <label>
                        <span>(*)<xsl:value-of select="rows/content/filter/label/msg_type"/>
                        </span>
                        <select name="{rows/content/filter/list/msg_type/@name}" class="select required" maxlength="20">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/msg_type"/>
                          </xsl:call-template>
                          <xsl:for-each select="rows/content/filter/list/msg_type/option">
                            <option value="{value}">
                              <xsl:if test="@selected='true'">
                                <xsl:attribute name="selected">selected</xsl:attribute>
                              </xsl:if>
                              <xsl:value-of select="text"/>
                            </option>
                          </xsl:for-each>
                        </select>
                      </label>
                    </xsl:if><!--START TOOL BAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar"/><!--END TOOL BAR FILTER--></div><!-- END FILTER--><!--START TOOL BAR TABLE--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar"/><!--END TOOL BAR TABLE--><!-- START TABELA--><!--  CONTEXT-MENU  --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu"/>
                  <div class="table">
                    <table class="sortable IGRP_table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/id">
                            <th align="center">
                              <xsl:value-of select="rows/content/table/label/id"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/code">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/code"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/code_lang">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/code_lang"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/description">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/description"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/user_fk">
                            <th align="center">
                              <xsl:value-of select="rows/content/table/label/user_fk"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/dt_reg">
                            <th align="center">
                              <xsl:value-of select="rows/content/table/label/dt_reg"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/msg_type">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/msg_type"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <xsl:variable name="pos" select="(position()+1) mod 2"/>
                          <tr class="IGRP_contextMenu">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="id">
                              <td align="center" class="table_row{$pos}">
                                <xsl:value-of select="id"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="code">
                              <td align="left" class="table_row{$pos}">
                                <xsl:value-of select="code"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="code_lang">
                              <td align="left" class="table_row{$pos}">
                                <xsl:value-of select="code_lang"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="description">
                              <td align="left" class="table_row{$pos}">
                                <xsl:value-of select="description"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="user_fk">
                              <td align="center" class="table_row{$pos}">
                                <xsl:value-of select="user_fk"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="dt_reg">
                              <td align="center" class="table_row{$pos}">
                                <xsl:value-of select="dt_reg"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="msg_type">
                              <td align="left" class="table_row{$pos}">
                                <xsl:value-of select="msg_type"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20140122"/>
  <xsl:include href="../../xsl/tmpl/IGRP-JSvalidation.tmpl.xsl?v=20140122"/>
  <xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=20140122"/>
  <xsl:include href="../../xsl/tmpl/IGRP-others.tmpl.xsl?v=20140122"/>
</xsl:stylesheet>
