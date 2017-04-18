<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/REDGLOBAL_GLB_T_ACTION_FORM_form.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/><xsl:template match="/"><!-- START HOME TOP -->
      <html>

        <!--HOME-HEADER-->
        <xsl:call-template name="home-header"/>

         <body>

          <!--HOME TOP-->
        <xsl:call-template name="home-top-main"/>

        <!--CENTER PANE-->
        <div class="general">
        <div id="content">


         <!--HOME SIDE
        <xsl:call-template name="home-side"/> -->

        <div class="ui-layout-center">

        <xsl:call-template name="dialog-modal"/>
        <!-- END HOME TOP --><!-- GLB_T_ACTION GESTAO ACCAO FORM FORM -->

        <!-- START YOUR CODE HERE --><!--PAGE TITLE-->
     <div class="box-content">

   <xsl:call-template name="page-title">
          <xsl:with-param name="title" select="rows/content/title" />
        </xsl:call-template>

        <!--NOTIFICATION MESSAGES-->
        <xsl:apply-templates mode="notif_messages" select="rows/content/messages" >
          <xsl:with-param name="class" select="'notification'"/>
        </xsl:apply-templates>


        <!--START FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" /><div class="box-content"><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><!--Devo abrir uma div aqui --><div id="startPage"><xsl:if test="rows/content/form/label/env_fk"><label><span>(*) <xsl:value-of select="rows/content/form/label/env_fk"/></span><select name="{rows/content/form/list/env_fk/@name}" class="required"><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/env_fk" /></xsl:call-template><xsl:for-each select="rows/content/form/list/env_fk/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label></xsl:if><xsl:if test="rows/content/form/label/page"><label><span>(*) <xsl:value-of select="rows/content/form/label/page"/></span><input type="text" name="{rows/content/form/value/page/@name}" value="{rows/content/form/value/page}"   maxlength="30"  class="required"><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/page" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/action"><label><span>(*) <xsl:value-of select="rows/content/form/label/action"/></span><input type="text" name="{rows/content/form/value/action/@name}" value="{rows/content/form/value/action}"   maxlength="30"  class="required"><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/action" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/page_descr"><label><span>(*) <xsl:value-of select="rows/content/form/label/page_descr"/></span><input type="text" name="{rows/content/form/value/page_descr/@name}" value="{rows/content/form/value/page_descr}"   maxlength="100"  class="required"><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/page_descr" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/action_descr"><label><span>(*) <xsl:value-of select="rows/content/form/label/action_descr"/></span><input type="text" name="{rows/content/form/value/action_descr/@name}" value="{rows/content/form/value/action_descr}"   maxlength="100"  class="required"><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/action_descr" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/page_type"><label><span>(*) <xsl:value-of select="rows/content/form/label/page_type"/></span><select name="{rows/content/form/list/page_type/@name}" class="required"><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/page_type" /></xsl:call-template><xsl:for-each select="rows/content/form/list/page_type/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label></xsl:if><xsl:if test="rows/content/form/label/proc_name"><label><span><xsl:value-of select="rows/content/form/label/proc_name"/></span><input type="text" name="{rows/content/form/value/proc_name/@name}" value="{rows/content/form/value/proc_name}"   maxlength="100"  class=""><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/proc_name" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/xsl_src"><label><span><xsl:value-of select="rows/content/form/label/xsl_src"/></span><input type="text" name="{rows/content/form/value/xsl_src/@name}" value="{rows/content/form/value/xsl_src}"   maxlength="100"  class=""><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/xsl_src" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/version"><label><span><xsl:value-of select="rows/content/form/label/version"/></span><input type="number" name="{rows/content/form/value/version/@name}" value="{rows/content/form/value/version}"   maxlength="22"  class="number"><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/version" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/flg_menu"><label><span><xsl:value-of select="rows/content/form/label/flg_menu"/></span><input type="checkbox" name="{rows/content/form/value/flg_menu/@name}" value="1"  class=""><xsl:if test="rows/content/form/value/flg_menu='1'"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/flg_menu" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/flg_transaction"><label><span><xsl:value-of select="rows/content/form/label/flg_transaction"/></span><input type="checkbox" name="{rows/content/form/value/flg_transaction/@name}" value="1"  class=""><xsl:if test="rows/content/form/value/flg_transaction='1'"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/flg_transaction" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/flg_table"><label><span><xsl:value-of select="rows/content/form/label/flg_table"/></span><input type="checkbox" name="{rows/content/form/value/flg_table/@name}" value="1"  class=""><xsl:if test="rows/content/form/value/flg_table='1'"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/flg_table" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/flg_offline"><label><span><xsl:value-of select="rows/content/form/label/flg_offline"/></span><input type="checkbox" name="{rows/content/form/value/flg_offline/@name}" value="1"  class=""><xsl:if test="rows/content/form/value/flg_offline='1'"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/flg_offline" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/status"><label><span><xsl:value-of select="rows/content/form/label/status"/></span><input type="checkbox" name="{rows/content/form/value/status/@name}" value="1"  class=""><xsl:if test="rows/content/form/value/status='1'"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/status" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/self_id"><label><span><xsl:value-of select="rows/content/form/label/self_id"/></span><select name="{rows/content/form/list/self_id/@name}" class=""><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/self_id" /></xsl:call-template><xsl:for-each select="rows/content/form/list/self_id/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label></xsl:if><xsl:if test="rows/content/form/label/self_fw_id"><label><span><xsl:value-of select="rows/content/form/label/self_fw_id"/></span><select name="{rows/content/form/list/self_fw_id/@name}" class=""><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/self_fw_id" /></xsl:call-template><xsl:for-each select="rows/content/form/list/self_fw_id/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label></xsl:if></div><!-- "FORM" devo fachar DIV_SEPARATOR aqui--></form></div><!--END FORM-->


     </div>


        <!-- END YOUR CODE HERE --><!-- START HOME BOTTOM -->

      </div>
      <xsl:call-template name="home-side"/>
      </div></div>

        </body>

        </html>

        <!-- END HOME BOTTOM --></xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=2013072913"/>

<xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=2013072913"/>

</xsl:stylesheet>