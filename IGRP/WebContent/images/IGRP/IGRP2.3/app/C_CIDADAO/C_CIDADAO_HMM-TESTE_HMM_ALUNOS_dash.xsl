<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/C_CIDADAO_HMM-TESTE_HMM_ALUNOS_dash.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/><xsl:template match="/"><!-- START HOME TOP -->
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
        <!-- END HOME TOP --><!-- HMM-TESTE HMM_MINHAS DISCIPLINAS HMM_ALUNOS ALUNOS -->

        <!-- START YOUR CODE HERE --><!--PAGE TITLE-->
     <div class="box-content">

   <xsl:call-template name="page-title">
          <xsl:with-param name="title" select="rows/content/title" />
        </xsl:call-template>

        <!--NOTIFICATION MESSAGES-->
        <xsl:apply-templates mode="notif_messages" select="rows/content/messages" >
          <xsl:with-param name="class" select="'notification'"/>
        </xsl:apply-templates>


        <!--START PAGE--><!--VIEW --><!--START FORM VIEW--><div class="box-content"><div class="box-entity"><div class="foto-box"><img class="foto" src="{rows/content/view/value/view_foto}" /></div><div class="info-box"><ul><li><span class="label"><xsl:value-of select="rows/content/view/label/nome_professor"/>:</span><xsl:value-of select="rows/content/view/value/nome_professor"/></li></ul></div></div></div><!--END FORM VIEW--><form action="#" method="post" id="formular_default" name="formular_default" class="default_form"  enctype="multipart/form-data"><!--FORMULARIO --><!--START FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" /><div class="box-content"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><!--Devo abrir uma div aqui --><div id="startPage"></div><!--FIM DO SEPARADOR--><!--INICIO DO SEPARADOR "ALUNOS"--><div id="{local-name(rows/content/form/label/alunos)}"><xsl:if test="rows/content/form/label/alunos"><xsl:call-template name="page-title"><xsl:with-param name="title" select="rows/content/form/label/alunos" /><xsl:with-param name="class" select="'subtitle'" /></xsl:call-template></xsl:if><xsl:if test="rows/content/form/label/alunos"><!--INICIO DA TABELA--><div class="simple-table"><table class="editable-table" rel="T_alunos"><!--CABECALHO DA TABELA--><thead><tr><xsl:if test="rows/content/form/table/alunos/label/nome"><th><xsl:value-of select="rows/content/form/table/alunos/label/nome"/></th></xsl:if><xsl:if test="rows/content/form/table/alunos/label/numero"><th><xsl:value-of select="rows/content/form/table/alunos/label/numero"/></th></xsl:if><xsl:if test="rows/content/form/table/alunos/label/nota"><th><xsl:value-of select="rows/content/form/table/alunos/label/nota"/></th></xsl:if><th align="center" width="10"><img alt="adicionar" src="{$path_tmpl}/img/icon/tools-bar/add.png" rel="alunos" class="IGRP_addRow_form"/></th></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/form/table/alunos/value/row"><tr><xsl:if test="nome"><td><xsl:value-of select="nome_desc" /><input type="hidden" name="p_nome_fk" value="{nome}" /><input type="hidden" name="p_nome_fk_desc" value="{nome_desc}" /></td></xsl:if><xsl:if test="numero"><td><xsl:value-of select="numero_desc" /><input type="hidden" name="p_numero_fk" value="{numero}" /><input type="hidden" name="p_numero_fk_desc" value="{numero_desc}" /></td></xsl:if><xsl:if test="nota"><td><input type="number" name="{../../label/nota/@name}_fk" value="{nota}"  rel="F_alunos"   maxlength="30"  class="number"></input><input type="hidden" name="p_nota_fk_desc" value="{nota_desc}" /></td></xsl:if><td align="center" width="10"><input type="hidden" name="p_alunos_id" value="{alunos_id}" /><img alt="apagar" src="{$path}/img/icon/ctx-delete.png" class="IGRP_delRow_form" rel="alunos"/></td></tr></xsl:for-each></tbody></table></div><!--FIM DA TABELA--></xsl:if></div><!--devo fachar div aqui--></div><!--END FORM--></form><!--END PAGE-->


     </div>


        <!-- END YOUR CODE HERE --><!-- START HOME BOTTOM -->

      </div>
      <xsl:call-template name="home-side"/>
      </div></div>

        </body>

        </html>

        <!-- END HOME BOTTOM --></xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=201305133"/>

<xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=201305133"/>

</xsl:stylesheet>