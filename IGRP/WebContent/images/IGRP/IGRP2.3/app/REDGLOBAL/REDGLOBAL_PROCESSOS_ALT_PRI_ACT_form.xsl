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
                <xsl:if test="rows/content/form/label/actitp_name">
                  <div class="col-1-4 item" item-name="actitp_name">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/actitp_name) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/actitp_name" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/actitp_name" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/actitp_name/@name}" value="{rows/content/form/value/actitp_name}" class="text required" maxlength="100">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/actitp_name"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/date_created">
                  <div class="col-1-4 item" item-name="date_created">
                    <div class="igrp_item date">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/date_created) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/date_created" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/date_created" disable-output-escaping="yes"/>
                      </label>
                      <div class="itemIcon">
                        <input type="text" name="{rows/content/form/value/date_created/@name}" value="{rows/content/form/value/date_created}" class="date required" trel="IGRP_datePicker">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/date_created"/>
                          </xsl:call-template>
                        </input>
                        <div class="calendar"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/date_started">
                  <div class="col-1-4 item" item-name="date_started">
                    <div class="igrp_item date">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/date_started) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/date_started" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/date_started" disable-output-escaping="yes"/>
                      </label>
                      <div class="itemIcon">
                        <input type="text" name="{rows/content/form/value/date_started/@name}" value="{rows/content/form/value/date_started}" class="date" trel="IGRP_datePicker">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/date_started"/>
                          </xsl:call-template>
                        </input>
                        <div class="calendar"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/date_ended">
                  <div class="col-1-4 item" item-name="date_ended">
                    <div class="igrp_item date">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/date_ended) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/date_ended" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/date_ended" disable-output-escaping="yes"/>
                      </label>
                      <div class="itemIcon">
                        <input type="text" name="{rows/content/form/value/date_ended/@name}" value="{rows/content/form/value/date_ended}" class="date" trel="IGRP_datePicker">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/date_ended"/>
                          </xsl:call-template>
                        </input>
                        <div class="calendar"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/priority">
                  <div class="col-1-4 item" item-name="priority">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/priority) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/priority" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/priority" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/priority/@name}" value="{rows/content/form/value/priority}" class="text" maxlength="1">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/priority"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/user_assign_name">
                  <div class="col-1-4 item" item-name="user_assign_name">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/user_assign_name) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/user_assign_name" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/user_assign_name" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/user_assign_name/@name}" value="{rows/content/form/value/user_assign_name}" class="text" maxlength="100">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/user_assign_name"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
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
                      <input type="text" name="{rows/content/form/value/user_name/@name}" value="{rows/content/form/value/user_name}" class="text" maxlength="100">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/user_name"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/proc_num">
                  <div class="col-1-4 item" item-name="proc_num">
                    <div class="igrp_item number">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/proc_num) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/proc_num" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/proc_num" disable-output-escaping="yes"/>
                      </label>
                      <input type="number" name="{rows/content/form/value/proc_num/@name}" value="{rows/content/form/value/proc_num}" class="number" maxlength="22">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/proc_num"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/proctp_name">
                  <div class="col-1-4 item" item-name="proctp_name">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/proctp_name) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/proctp_name" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/proctp_name" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/proctp_name/@name}" value="{rows/content/form/value/proctp_name}" class="text required" maxlength="100">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/proctp_name"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/proc_date_created">
                  <div class="col-1-4 item" item-name="proc_date_created">
                    <div class="igrp_item date">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/proc_date_created) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/proc_date_created" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/proc_date_created" disable-output-escaping="yes"/>
                      </label>
                      <div class="itemIcon">
                        <input type="text" name="{rows/content/form/value/proc_date_created/@name}" value="{rows/content/form/value/proc_date_created}" class="date required" trel="IGRP_datePicker">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/proc_date_created"/>
                          </xsl:call-template>
                        </input>
                        <div class="calendar"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/proc_date_started">
                  <div class="col-1-4 item" item-name="proc_date_started">
                    <div class="igrp_item date">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/proc_date_started) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/proc_date_started" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/proc_date_started" disable-output-escaping="yes"/>
                      </label>
                      <div class="itemIcon">
                        <input type="text" name="{rows/content/form/value/proc_date_started/@name}" value="{rows/content/form/value/proc_date_started}" class="date" trel="IGRP_datePicker">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/proc_date_started"/>
                          </xsl:call-template>
                        </input>
                        <div class="calendar"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/proc_date_ended">
                  <div class="col-1-4 item" item-name="proc_date_ended">
                    <div class="igrp_item date">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/proc_date_ended) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/proc_date_ended" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/proc_date_ended" disable-output-escaping="yes"/>
                      </label>
                      <div class="itemIcon">
                        <input type="text" name="{rows/content/form/value/proc_date_ended/@name}" value="{rows/content/form/value/proc_date_ended}" class="date" trel="IGRP_datePicker">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/proc_date_ended"/>
                          </xsl:call-template>
                        </input>
                        <div class="calendar"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/new_priority">
                  <div class="col-1-4 item" item-name="new_priority">
                    <div class="igrp_item select">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/new_priority) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/new_priority" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/new_priority" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/new_priority/@name}" chosen="select" data-placeholder="{rows/content/form/list/new_priority/option[position() = 1]}" class="select">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/new_priority"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/new_priority/option[position() != 1]">
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150311"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150311"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150311"/>
</xsl:stylesheet>
