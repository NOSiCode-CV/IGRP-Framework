<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/REDGLOBAL_GEST_PAGAMENTOS_DET_form.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/><xsl:template match="/"><!-- START HOME TOP -->
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
        <!-- END HOME TOP --><!-- GEST_PAGAMENTOS GESTAO PAGAMENTOS DET DETALHES PAGAMENTO -->

        <!-- START YOUR CODE HERE --><!--PAGE TITLE-->
     <div class="box-content">

   <xsl:call-template name="page-title">
          <xsl:with-param name="title" select="rows/content/title" />
        </xsl:call-template>

        <!--NOTIFICATION MESSAGES-->
        <xsl:apply-templates mode="notif_messages" select="rows/content/messages" >
          <xsl:with-param name="class" select="'notification'"/>
        </xsl:apply-templates>


        <!--START FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" /><div class="box-content"><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><!--Devo abrir uma div aqui --><div id="startPage"><xsl:if test="rows/content/form/label/entidade"><label><span><xsl:value-of select="rows/content/form/label/entidade"/></span><input type="text" name="{rows/content/form/value/entidade/@name}" value="{rows/content/form/value/entidade}"  readonly="readonly"   maxlength="20"  class=""><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/entidade" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/referencia"><label><span><xsl:value-of select="rows/content/form/label/referencia"/></span><input type="text" name="{rows/content/form/value/referencia/@name}" value="{rows/content/form/value/referencia}"  readonly="readonly"   maxlength="30"  class=""><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/referencia" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/valor"><label><span><xsl:value-of select="rows/content/form/label/valor"/></span><input type="number" name="{rows/content/form/value/valor/@name}" value="{rows/content/form/value/valor}"  readonly="readonly"   maxlength="22"  class="number"><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/valor" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/dt_validade"><label><span><xsl:value-of select="rows/content/form/label/dt_validade"/></span><input type="text" name="{rows/content/form/value/dt_validade/@name}" value="{rows/content/form/value/dt_validade}"  readonly="readonly"  class="IGRP_datepicker date"><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/dt_validade" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/proc_name"><label><span><xsl:value-of select="rows/content/form/label/proc_name"/></span><textarea name="{rows/content/form/value/proc_name/@name}"  readonly="readonly"  maxlength="1000"  class=""><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/proc_name" /></xsl:call-template><xsl:value-of select="rows/content/form/value/proc_name"/></textarea></label></xsl:if><xsl:if test="rows/content/form/label/env_fk"><label><span><xsl:value-of select="rows/content/form/label/env_fk"/></span><input type="text" name="{rows/content/form/value/env_fk/@name}" value="{rows/content/form/value/env_fk}"  readonly="readonly"   maxlength="22"  class=""><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/env_fk" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/org_fk"><label><span><xsl:value-of select="rows/content/form/label/org_fk"/></span><input type="text" name="{rows/content/form/value/org_fk/@name}" value="{rows/content/form/value/org_fk}"  readonly="readonly"   maxlength="22"  class=""><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/org_fk" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/user_fk"><label><span><xsl:value-of select="rows/content/form/label/user_fk"/></span><input type="text" name="{rows/content/form/value/user_fk/@name}" value="{rows/content/form/value/user_fk}"  readonly="readonly"   maxlength="22"  class=""><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/user_fk" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/dt_registo"><label><span><xsl:value-of select="rows/content/form/label/dt_registo"/></span><input type="text" name="{rows/content/form/value/dt_registo/@name}" value="{rows/content/form/value/dt_registo}"  readonly="readonly"  class="IGRP_datepicker date"><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/dt_registo" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/dt_resposta"><label><span><xsl:value-of select="rows/content/form/label/dt_resposta"/></span><input type="text" name="{rows/content/form/value/dt_resposta/@name}" value="{rows/content/form/value/dt_resposta}"  readonly="readonly"  class="IGRP_datepicker date"><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/dt_resposta" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/estado"><label><span><xsl:value-of select="rows/content/form/label/estado"/></span><input type="text" name="{rows/content/form/value/estado/@name}" value="{rows/content/form/value/estado}"  readonly="readonly"   maxlength="20"  class=""><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/estado" /></xsl:call-template></input></label></xsl:if></div><!--devo fachar DIV_SEPARATOR aqui--></form></div><!--END FORM-->


     </div>


        <!-- END YOUR CODE HERE --><!-- START HOME BOTTOM -->

      </div>
      <xsl:call-template name="home-side"/>
      </div></div>

        </body>

        </html>

        <!-- END HOME BOTTOM --></xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=201306252"/>

<xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=201306252"/>

</xsl:stylesheet>