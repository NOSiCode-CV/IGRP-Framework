<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/REDGLOBAL_GL_CALENDAR_GL_TESTE_form.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/">
<xsl:call-template name="home-top-inc"/>

		  <!-- GL_CALENDAR CALENDARIO GL_TESTE TESTE CALENDARIO -->

		  <!-- START YOUR CODE HERE -->

			<!--PAGE TITLE-->
	  <div class="box-content">

		  <xsl:call-template name="page-title">
			 <xsl:with-param name="title" select="rows/content/title" />
		  </xsl:call-template>

		  <!--NOTIFICATION MESSAGES-->
		  <xsl:apply-templates mode="notif_messages" select="rows/content/messages" >
			 <xsl:with-param name="class" select="'notification'"/>
		  </xsl:apply-templates>


		  <!--START FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" /><div class="box-content"><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><label><span>(*) <xsl:value-of select="rows/content/form/label/subject"/></span><input type="text" name="{rows/content/form/value/subject/@name}" value="{rows/content/form/value/subject}"  class="required" maxlength="30" /></label><label><span><xsl:value-of select="rows/content/form/label/description"/></span><textarea name="{rows/content/form/value/description/@name}"  class=""><xsl:value-of select="rows/content/form/value/description"/></textarea></label><label><span><xsl:value-of select="rows/content/form/label/location"/></span><input type="text" name="{rows/content/form/value/location/@name}" value="{rows/content/form/value/location}"  class="" maxlength="30" /></label><label><span>(*) <xsl:value-of select="rows/content/form/label/start_time"/></span><input type="date" name="{rows/content/form/value/start_time/@name}" value="{rows/content/form/value/start_time}" class="IGRP_datepicker required date" /></label><label><span>(*) <xsl:value-of select="rows/content/form/label/end_time"/></span><input type="date" name="{rows/content/form/value/end_time/@name}" value="{rows/content/form/value/end_time}" class="IGRP_datepicker required date" /></label><xsl:call-template name="page-title"><xsl:with-param name="title" select="rows/content/form/label/utilizadores" /><xsl:with-param name="class" select="'subtitle'" /></xsl:call-template><xsl:call-template name="tools-bar-form-group"><xsl:with-param name="rel" select="'utilizadores'" /></xsl:call-template><label><span>(*) <xsl:value-of select="rows/content/form/label/user_fk"/></span><select name="{rows/content/form/list/user_fk/@name}" rel="F_utilizadores"  class="required"><xsl:for-each select="rows/content/form/list/user_fk/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label><!--INICIO DA TABELA--><div class="simple-table"><table rel="T_utilizadores"><!--CABECALHO DA TABELA--><thead><tr><th><xsl:value-of select="rows/content/form/table/utilizadores/label/user_fk"/></th><th align="center" width="10"></th><th align="center" width="10"></th></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/form/table/utilizadores/value/row"><tr><td><xsl:value-of select="user_fk_desc" /><input type="hidden" name="p_utilizadores_id" value="{utilizadores_id}" /><input type="hidden" name="p_user_fk_fk" value="{user_fk}" /><input type="hidden" name="p_user_fk_fk_desc" value="{user_fk_desc}" /></td><td align="center" width="10"><img alt="apagar" src="{$path}/img/icon/ctx-delete.png" class="IGRP_delRow" rel="utilizadores"/></td><td align="center" width="10"><img alt="editar" src="{$path}/img/icon/edit.png" class="IGRP_editRow" rel="utilizadores"/></td></tr></xsl:for-each></tbody></table></div><!--FIM DA TABELA--></form></div><!--END FORM-->


	  </div>


		  <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=6"/>



</xsl:stylesheet>