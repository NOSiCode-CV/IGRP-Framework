<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/C_CIDADAO_HMM-TESTE_TEST_FORM_LIST_dash.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/><xsl:template match="/"><!-- START HOME TOP -->
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
        <!-- END HOME TOP --><!-- HMM-TESTE HMM_MINHAS DISCIPLINAS TEST_FORM_LIST TESTE FORM LIST -->

        <!-- START YOUR CODE HERE --><!--PAGE TITLE-->
     <div class="box-content">

   <xsl:call-template name="page-title">
          <xsl:with-param name="title" select="rows/content/title" />
        </xsl:call-template>

        <!--NOTIFICATION MESSAGES-->
        <xsl:apply-templates mode="notif_messages" select="rows/content/messages" >
          <xsl:with-param name="class" select="'notification'"/>
        </xsl:apply-templates>


        <!--START PAGE--><form action="#" method="post" id="formular_default" name="formular_default" class="default_form"  enctype="multipart/form-data"><!--FORMULARIO --><!--START FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" /><div class="box-content"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><!--Devo abrir uma div aqui --><div id="startPage"><xsl:if test="rows/content/form/label/conhecimentos"><xsl:call-template name="page-title"><xsl:with-param name="title" select="rows/content/form/label/conhecimentos" /><xsl:with-param name="class" select="'subtitle'" /></xsl:call-template></xsl:if><xsl:if test="rows/content/form/label/conhecimentos"><!--INICIO DA TABELA--><div class="simple-table"><table class="editable-table" rel="T_conhecimentos"><!--CABECALHO DA TABELA--><thead><tr><xsl:if test="rows/content/form/table/conhecimentos/label/id_utilizador"><th><xsl:value-of select="rows/content/form/table/conhecimentos/label/id_utilizador"/></th></xsl:if><xsl:if test="rows/content/form/table/conhecimentos/label/utilizador"><th><xsl:value-of select="rows/content/form/table/conhecimentos/label/utilizador"/></th></xsl:if><xsl:if test="rows/content/form/table/conhecimentos/label/igrp_framework"><th><xsl:value-of select="rows/content/form/table/conhecimentos/label/igrp_framework"/></th></xsl:if><xsl:if test="rows/content/form/table/conhecimentos/label/igrp_code_generator"><th><xsl:value-of select="rows/content/form/table/conhecimentos/label/igrp_code_generator"/></th></xsl:if><xsl:if test="rows/content/form/table/conhecimentos/label/igrp_web"><th><xsl:value-of select="rows/content/form/table/conhecimentos/label/igrp_web"/></th></xsl:if><xsl:if test="rows/content/form/table/conhecimentos/label/pesquisa"><th><xsl:value-of select="rows/content/form/table/conhecimentos/label/pesquisa"/></th></xsl:if><th align="center" width="10"><img alt="adicionar" src="{$path_tmpl}/img/icon/tools-bar/add.png" rel="conhecimentos" class="IGRP_addRow_form"/></th></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/form/table/conhecimentos/value/row"><tr><xsl:if test="id_utilizador"><td><input type="number" name="{../../label/id_utilizador/@name}_fk" value="{id_utilizador}"  rel="F_conhecimentos"   maxlength="30"  class="number"></input><input type="hidden" name="p_id_utilizador_fk_desc" value="{id_utilizador_desc}" /></td></xsl:if><xsl:if test="utilizador"><td><xsl:value-of select="utilizador_desc" /><input type="hidden" name="p_utilizador_fk" value="{utilizador}" /><input type="hidden" name="p_utilizador_fk_desc" value="{utilizador_desc}" /></td></xsl:if><xsl:if test="igrp_framework"><td><input type="checkbox" name="{../../label/igrp_framework/@name}_fk" value="{igrp_framework}"  rel="F_conhecimentos"  class=""><xsl:if test="igrp_framework_check=igrp_framework"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if></input><input type="hidden" name="p_igrp_framework_fk_desc" value="{igrp_framework_desc}" /></td></xsl:if><xsl:if test="igrp_code_generator"><td><input type="checkbox" name="{../../label/igrp_code_generator/@name}_fk" value="{igrp_code_generator}"  rel="F_conhecimentos"  class=""><xsl:if test="igrp_code_generator_check=igrp_code_generator"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if></input><input type="hidden" name="p_igrp_code_generator_fk_desc" value="{igrp_code_generator_desc}" /></td></xsl:if><xsl:if test="igrp_web"><td><input type="checkbox" name="{../../label/igrp_web/@name}_fk" value="{igrp_web}"  rel="F_conhecimentos"  class=""><xsl:if test="igrp_web_check=igrp_web"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if></input><input type="hidden" name="p_igrp_web_fk_desc" value="{igrp_web_desc}" /></td></xsl:if><xsl:if test="pesquisa"><td><input type="text" name="{../../label/pesquisa/@name}_fk" value="{pesquisa}"  rel="F_conhecimentos"   maxlength="30"  class=""></input><xsl:call-template name="lookup-tool"><xsl:with-param name="page" select="'LOOKUP'" /><xsl:with-param name="action" select="'LOOKUP_BI'" /><xsl:with-param name="name" select="../../label/pesquisa/@name" /><xsl:with-param name="js_lookup" select="../../../../lookup/pesquisa" /></xsl:call-template><input type="hidden" name="p_pesquisa_fk_desc" value="{pesquisa_desc}" /></td></xsl:if><td align="center" width="10"><input type="hidden" name="p_conhecimentos_id" value="{conhecimentos_id}" /><img alt="apagar" src="{$path}/img/icon/ctx-delete.png" class="IGRP_delRow_form" rel="conhecimentos"/></td></tr></xsl:for-each></tbody></table></div><!--FIM DA TABELA--></xsl:if></div><!--devo fachar div aqui--></div><!--END FORM--></form><!--END PAGE-->


     </div>


        <!-- END YOUR CODE HERE --><!-- START HOME BOTTOM -->

      </div>
      <xsl:call-template name="home-side"/>
      </div></div>

        </body>

        </html>

        <!-- END HOME BOTTOM --></xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=201306072"/>

<xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=201306072"/>

</xsl:stylesheet>