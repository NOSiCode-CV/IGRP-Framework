<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html><!--XSL Generator (RED/DIM 2015)--><head><!--HOME-HEADER--><xsl:call-template name="home-header"/>
      </head>
      <body class="bodyColor">
        <div class="IGRP_overlay"/><!--HOME TOP--><xsl:call-template name="home-top-main"/><!--HOME--><div id="igrp-bodyPage"><!--HOME LEFT--><xsl:call-template name="home-slide-menu"/><!--HOME RIGTH--><div class="bodyPageRigth"><!-- START YOUR CODE HERE --><!-- SHOW TABLET AND MOBILE TITLE --><div class="box-head showTabMobile">
              <xsl:value-of select="rows/content/title"/>
            </div><!-- SHOW NOTIFICATION MESSAGES--><xsl:apply-templates mode="notif_messages" select="rows/content/messages"/>
            <form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!-- SHOW HIDDEN--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FORM--><!--START TOOLS BAR FROM--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar"/><!--END TOOLS BAR FORM--><div class="col addMarginTop" sep-name="form">
                <xsl:if test="rows/content/form/label/user_name">
                  <div class="col-1-4 item" item-name="user_name">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/user_name) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/user_name" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/user_name" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/user_name/@name}" value="{rows/content/form/value/user_name}" class="text" maxlength="50">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/user_name"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/name">
                  <div class="col-1-4 item" item-name="name">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/name) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/name" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/name" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/name/@name}" value="{rows/content/form/value/name}" class="text required" maxlength="100">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/name"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/email">
                  <div class="col-1-4 item" item-name="email">
                    <div class="igrp_item email">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/email) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/email" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/email" disable-output-escaping="yes"/>
                      </label>
                      <input type="email" name="{rows/content/form/value/email/@name}" value="{rows/content/form/value/email}" class="email required">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/email"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/phone">
                  <div class="col-1-4 item" item-name="phone">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/phone) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/phone" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/phone" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/phone/@name}" value="{rows/content/form/value/phone}" class="text" maxlength="20">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/phone"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/mobile">
                  <div class="col-1-4 item" item-name="mobile">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/mobile) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/mobile" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/mobile" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/mobile/@name}" value="{rows/content/form/value/mobile}" class="text" maxlength="20">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/mobile"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/valid_until">
                  <div class="col-1-4 item" item-name="valid_until">
                    <div class="igrp_item date">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/valid_until) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/valid_until" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/valid_until" disable-output-escaping="yes"/>
                      </label>
                      <div class="itemIcon">
                        <input type="text" name="{rows/content/form/value/valid_until/@name}" value="{rows/content/form/value/valid_until}" class="date required" trel="IGRP_datePicker">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/valid_until"/>
                          </xsl:call-template>
                        </input>
                        <div class="calendar"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/status">
                  <div class="col-1-4 item" item-name="status">
                    <div class="igrp_item select">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/status) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/status" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/status" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/status/@name}" chosen="select" data-placeholder="{rows/content/form/list/status/option[position() = 1]}" class="select required">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/status"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/status/option[position() != 1]">
                          <option value="{value}">
                            <xsl:if test="@selected='true'">
                              <xsl:attribute name="selected">selected</xsl:attribute>
                            </xsl:if>
                            <xsl:value-of select="text"/>
                          </option>
                        </xsl:for-each>
                      </select>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/photo_link">
                  <div class="col-1-4 item" item-name="photo_link">
                    <div class="igrp_item file">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/photo_link) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/photo_link" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/photo_link" disable-output-escaping="yes"/>
                      </label>
                      <div class="itemIcon">
                        <input class="notForm" placeholder="Choose File" disabled="disabled" file="id_{rows/content/form/value/photo_link/@name}"/>
                        <span class="upload"/>
                        <input type="file" name="{rows/content/form/value/photo_link/@name}" value="{rows/content/form/value/photo_link}" id="id_{rows/content/form/value/photo_link/@name}" class="file uploadFile">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/photo_link"/>
                          </xsl:call-template>
                        </input>
                      </div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/signature_link">
                  <div class="col-1-4 item" item-name="signature_link">
                    <div class="igrp_item file">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/signature_link) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/signature_link" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/signature_link" disable-output-escaping="yes"/>
                      </label>
                      <div class="itemIcon">
                        <input class="notForm" placeholder="Choose File" disabled="disabled" file="id_{rows/content/form/value/signature_link/@name}"/>
                        <span class="upload"/>
                        <input type="file" name="{rows/content/form/value/signature_link/@name}" value="{rows/content/form/value/signature_link}" id="id_{rows/content/form/value/signature_link/@name}" class="file uploadFile">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/signature_link"/>
                          </xsl:call-template>
                        </input>
                      </div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/remarks">
                  <div class="col-1-4 item" item-name="remarks">
                    <div class="igrp_item textarea">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/remarks) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/remarks" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/remarks" disable-output-escaping="yes"/>
                      </label>
                      <textarea name="{rows/content/form/value/remarks/@name}" class="textarea" maxlength="4000">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/remarks"/>
                        </xsl:call-template>
                        <xsl:value-of select="rows/content/form/value/remarks" disable-output-escaping="yes"/>
                      </textarea>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if><!-- INICIO SEPARADOR app_lista--><xsl:if test="rows/content/form/label/app_lista">
                  <div class="box-content resetPadding" list-name="app_lista">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/app_lista"/>
                    </xsl:call-template>
                    <div class="box-collapser"><!-- START TABELA LIST--><div class="box-table table-responsive">
                        <table rel="T_app_lista" data-control="data-app_lista">
                          <thead>
                            <tr>
                              <xsl:if test="rows/content/form/table/app_lista/label/cp_env_fk">
                                <xsl:if test="not(rows/content/form/table/app_lista/label/cp_env_fk/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/app_lista/label/cp_env_fk" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/app_lista/label/cp_org_fk">
                                <xsl:if test="not(rows/content/form/table/app_lista/label/cp_org_fk/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/app_lista/label/cp_org_fk" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/app_lista/label/cp_prof_type_fk">
                                <xsl:if test="not(rows/content/form/table/app_lista/label/cp_prof_type_fk/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/app_lista/label/cp_prof_type_fk" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                            </tr>
                          </thead>
                          <tbody>
                            <xsl:for-each select="rows/content/form/table/app_lista/value/row[not(@total='yes')]">
                              <tr row="{position()}">
                                <xsl:if test="cp_env_fk">
                                  <xsl:if test="not(cp_env_fk/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/cp_env_fk}" class="select">
                                      <xsl:value-of select="cp_env_fk" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_cp_env_fk_fk" value="{cp_env_fk}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="cp_env_fk/@visible = 'false'">
                                    <input type="hidden" name="p_cp_env_fk_fk" value="{cp_env_fk}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="cp_org_fk">
                                  <xsl:if test="not(cp_org_fk/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/cp_org_fk}" class="select">
                                      <xsl:value-of select="cp_org_fk" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_cp_org_fk_fk" value="{cp_org_fk}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="cp_org_fk/@visible = 'false'">
                                    <input type="hidden" name="p_cp_org_fk_fk" value="{cp_org_fk}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="cp_prof_type_fk">
                                  <xsl:if test="not(cp_prof_type_fk/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/cp_prof_type_fk}" class="select">
                                      <xsl:value-of select="cp_prof_type_fk" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_cp_prof_type_fk_fk" value="{cp_prof_type_fk}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="cp_prof_type_fk/@visible = 'false'">
                                    <input type="hidden" name="p_cp_prof_type_fk_fk" value="{cp_prof_type_fk}"/>
                                  </xsl:if>
                                </xsl:if>
                                <input type="hidden" name="p_app_lista_id" value="{app_lista_id}"/>
                              </tr>
                            </xsl:for-each>
                          </tbody>
                        </table>
                      </div><!-- END TABELA LIST--><div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <div class="_clear"/>
              </div>
            </form><!-- END YOUR CODE HERE --><div class="_clear"/>
          </div>
          <div class="_clear"/>
        </div><!--FOOTER PAGE--><div id="igrp-footerPage">
          <xsl:call-template name="footer"/>
        </div>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150318"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150318"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150318"/>
</xsl:stylesheet>
