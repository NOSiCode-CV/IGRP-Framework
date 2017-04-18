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
                <xsl:if test="rows/content/form/label/activity_type">
                  <div class="col-1-4 item" item-name="activity_type">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/activity_type) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/activity_type" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/activity_type" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/activity_type/@name}" value="{rows/content/form/value/activity_type}" class="text" maxlength="250">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/activity_type"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/activity_date_created">
                  <div class="col-1-4 item" item-name="activity_date_created">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/activity_date_created) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/activity_date_created" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/activity_date_created" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/activity_date_created/@name}" value="{rows/content/form/value/activity_date_created}" class="text" maxlength="10">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/activity_date_created"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/activity_date_started">
                  <div class="col-1-4 item" item-name="activity_date_started">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/activity_date_started) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/activity_date_started" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/activity_date_started" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/activity_date_started/@name}" value="{rows/content/form/value/activity_date_started}" class="text" maxlength="10">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/activity_date_started"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/activity_date_ended">
                  <div class="col-1-4 item" item-name="activity_date_ended">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/activity_date_ended) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/activity_date_ended" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/activity_date_ended" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/activity_date_ended/@name}" value="{rows/content/form/value/activity_date_ended}" class="text" maxlength="10">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/activity_date_ended"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/activity_priority">
                  <div class="col-1-4 item" item-name="activity_priority">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/activity_priority) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/activity_priority" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/activity_priority" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/activity_priority/@name}" value="{rows/content/form/value/activity_priority}" class="text" maxlength="1">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/activity_priority"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/activity_assign_by">
                  <div class="col-1-4 item" item-name="activity_assign_by">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/activity_assign_by) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/activity_assign_by" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/activity_assign_by" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/activity_assign_by/@name}" value="{rows/content/form/value/activity_assign_by}" class="text" maxlength="250">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/activity_assign_by"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/activity_assign_to">
                  <div class="col-1-4 item" item-name="activity_assign_to">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/activity_assign_to) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/activity_assign_to" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/activity_assign_to" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/activity_assign_to/@name}" value="{rows/content/form/value/activity_assign_to}" class="text" maxlength="250">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/activity_assign_to"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/process_number">
                  <div class="col-1-4 item" item-name="process_number">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/process_number) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/process_number" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/process_number" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/process_number/@name}" value="{rows/content/form/value/process_number}" class="text" maxlength="250">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/process_number"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/process_type">
                  <div class="col-1-4 item" item-name="process_type">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/process_type) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/process_type" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/process_type" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/process_type/@name}" value="{rows/content/form/value/process_type}" class="text" maxlength="100">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/process_type"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/process_date_created">
                  <div class="col-1-4 item" item-name="process_date_created">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/process_date_created) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/process_date_created" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/process_date_created" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/process_date_created/@name}" value="{rows/content/form/value/process_date_created}" class="text" maxlength="10">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/process_date_created"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/process_date_started">
                  <div class="col-1-4 item" item-name="process_date_started">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/process_date_started) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/process_date_started" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/process_date_started" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/process_date_started/@name}" value="{rows/content/form/value/process_date_started}" class="text" maxlength="10">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/process_date_started"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/process_date_ended">
                  <div class="col-1-4 item" item-name="process_date_ended">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/process_date_ended) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/process_date_ended" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/process_date_ended" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/process_date_ended/@name}" value="{rows/content/form/value/process_date_ended}" class="text" maxlength="10">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/process_date_ended"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/activity_remarks">
                  <div class="col-1-4 item" item-name="activity_remarks">
                    <div class="igrp_item textarea">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/activity_remarks) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/activity_remarks" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/activity_remarks" disable-output-escaping="yes"/>
                      </label>
                      <textarea name="{rows/content/form/value/activity_remarks/@name}" class="textarea" maxlength="4000">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/activity_remarks"/>
                        </xsl:call-template>
                        <xsl:value-of select="rows/content/form/value/activity_remarks" disable-output-escaping="yes"/>
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
