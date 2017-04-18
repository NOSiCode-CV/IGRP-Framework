<?xml version="1.0" encoding="utf-8"?>
<!-- DWXMLSource="xml/REDGLOBAL_CONF_PROCESSO_REGRAS_form.xml" -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <xsl:call-template name="home-top-inc"/>
    
    
    <!-- CONF_PROCESSO CONFIGURACAO PROCESSO REGRAS REGRAS ETAPA --> 
    
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
      
      <!--START FORM--> 
      <!--TOOL BAR-->
      <xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" />
      
      <div class="box-content">
        <form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data">
          <!--HIDDEN FIELDS-->
          <xsl:apply-templates mode="form-hidden" select="rows/content/form/value" />
          
          <xsl:call-template name="page-title">
            <xsl:with-param name="title" select="rows/content/form/label/validacoes_etapa" />
            
            <xsl:with-param name="class" select="'subtitle'" />
            
          </xsl:call-template>
          <xsl:call-template name="tools-bar-form-group">
            <xsl:with-param name="rel" select="'validacoes_etapa'" />
            
          </xsl:call-template>
          <label> <span>(*) <xsl:value-of select="rows/content/form/label/codigo"/></span>
            <input type="text" name="{rows/content/form/value/codigo/@name}" value="{rows/content/form/value/codigo}"  disabled="disabled"  rel="F_validacoes_etapa"  class="required" maxlength="30" />
          </label>
          <label> <span>(*) <xsl:value-of select="rows/content/form/label/nome"/></span>
            <input type="text" name="{rows/content/form/value/nome/@name}" value="{rows/content/form/value/nome}"  rel="F_validacoes_etapa"  class="required" maxlength="150" />
          </label>
          <label> <span><xsl:value-of select="rows/content/form/label/package_procedure"/></span>
            <input type="text" name="{rows/content/form/value/package_procedure/@name}" value="{rows/content/form/value/package_procedure}"  rel="F_validacoes_etapa"  class="" maxlength="100" />
          </label>
          <label style=" display:block; width:755px; height:215px;"> <span>(*) <xsl:value-of select="rows/content/form/label/desc_val"/></span>
            <textarea style=" width:624px; height:205px;" name="{rows/content/form/value/desc_val/@name}"  rel="F_validacoes_etapa"  class="required"><xsl:value-of select="rows/content/form/value/desc_val"/></textarea>
          </label>
          
          <!--INICIO DA TABELA-->
          <div class="simple-table">
            <table rel="T_validacoes_etapa">
              <!--CABECALHO DA TABELA-->
              <thead>
                <tr>
                  <th><xsl:value-of select="rows/content/form/table/validacoes_etapa/label/codigo"/></th>
                  <th><xsl:value-of select="rows/content/form/table/validacoes_etapa/label/nome"/></th>
                  <th><xsl:value-of select="rows/content/form/table/validacoes_etapa/label/package_procedure"/></th>
                  <th><xsl:value-of select="rows/content/form/table/validacoes_etapa/label/desc_val"/></th>
                  <th align="center" width="10"></th>
                  <th align="center" width="10"></th>
                </tr>
              </thead>
              <!--CORPO DA TABELA-->
              <tbody>
                <xsl:for-each select="rows/content/form/table/validacoes_etapa/value/row">
                  <tr>
                    <td><xsl:value-of select="codigo_desc" />
                      <input type="hidden" name="p_validacoes_etapa_id" value="{validacoes_etapa_id}" />
                      <input type="hidden" name="p_codigo_fk" value="{codigo}" />
                      <input type="hidden" name="p_codigo_fk_desc" value="{codigo_desc}" /></td>
                    <td><xsl:value-of select="nome_desc" />
                      <input type="hidden" name="p_nome_fk" value="{nome}" />
                      <input type="hidden" name="p_nome_fk_desc" value="{nome_desc}" /></td>
                    <td><xsl:value-of select="package_procedure_desc" />
                      <input type="hidden" name="p_package_procedure_fk" value="{package_procedure}" />
                      <input type="hidden" name="p_package_procedure_fk_desc" value="{package_procedure_desc}" /></td>
                    <td><xsl:value-of select="desc_val_desc" />
                      <input type="hidden" name="p_desc_val_fk" value="{desc_val}" />
                      <input type="hidden" name="p_desc_val_fk_desc" value="{desc_val_desc}" /></td>
                    <td align="center" width="10"><img alt="apagar" src="{$path}/img/icon/ctx-delete.png" class="IGRP_delRow" rel="validacoes_etapa"/></td>
                    <td align="center" width="10"><img alt="editar" src="{$path}/img/icon/edit.png" class="IGRP_editRow" rel="validacoes_etapa"/></td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
          </div>
          <!--FIM DA TABELA-->
          
          <xsl:call-template name="page-title">
            <xsl:with-param name="title" select="rows/content/form/label/mapeamento_gravacao" />
            
            <xsl:with-param name="class" select="'subtitle'" />
            
          </xsl:call-template>
          <xsl:call-template name="tools-bar-form-group">
            <xsl:with-param name="rel" select="'mapeamento_gravacao'" />
            
          </xsl:call-template>
          <label> <span><xsl:value-of select="rows/content/form/label/componente"/></span>
            <select name="{rows/content/form/list/componente/@name}" rel="F_mapeamento_gravacao"  class=" IGRP_change">
              <xsl:for-each select="rows/content/form/list/componente/option">
                <option value="{value}">
                <xsl:if test="@selected='true'">
                  <xsl:attribute name="selected">selected</xsl:attribute>
                </xsl:if>
                <xsl:value-of select="text"/> </option>
              </xsl:for-each>
            </select>
          </label>
          <label> <span><xsl:value-of select="rows/content/form/label/tag_name"/></span>
            <select name="{rows/content/form/list/tag_name/@name}" rel="F_mapeamento_gravacao"  class="">
              <xsl:for-each select="rows/content/form/list/tag_name/option">
                <option value="{value}">
                <xsl:if test="@selected='true'">
                  <xsl:attribute name="selected">selected</xsl:attribute>
                </xsl:if>
                <xsl:value-of select="text"/> </option>
              </xsl:for-each>
            </select>
          </label>
          <label> <span>(*) <xsl:value-of select="rows/content/form/label/table_name"/></span>
            <input type="text" name="{rows/content/form/value/table_name/@name}" value="{rows/content/form/value/table_name}"  rel="F_mapeamento_gravacao"  class="required" maxlength="100" />
          </label>
          <label> <span>(*) <xsl:value-of select="rows/content/form/label/table_colum"/></span>
            <input type="text" name="{rows/content/form/value/table_colum/@name}" value="{rows/content/form/value/table_colum}"  rel="F_mapeamento_gravacao"  class="required" maxlength="50" />
          </label>
          <label> <span><xsl:value-of select="rows/content/form/label/desc_map"/></span>
            <textarea name="{rows/content/form/value/desc_map/@name}"  rel="F_mapeamento_gravacao"  class=""><xsl:value-of select="rows/content/form/value/desc_map"/></textarea>
          </label>
          
          <!--INICIO DA TABELA-->
          <div class="simple-table">
            <table rel="T_mapeamento_gravacao">
              <!--CABECALHO DA TABELA-->
              <thead>
                <tr>
                  <th><xsl:value-of select="rows/content/form/table/mapeamento_gravacao/label/componente"/></th>
                  <th><xsl:value-of select="rows/content/form/table/mapeamento_gravacao/label/tag_name"/></th>
                  <th><xsl:value-of select="rows/content/form/table/mapeamento_gravacao/label/table_name"/></th>
                  <th><xsl:value-of select="rows/content/form/table/mapeamento_gravacao/label/table_colum"/></th>
                  <th><xsl:value-of select="rows/content/form/table/mapeamento_gravacao/label/desc_map"/></th>
                  <th align="center" width="10"></th>
                  <th align="center" width="10"></th>
                </tr>
              </thead>
              <!--CORPO DA TABELA-->
              <tbody>
                <xsl:for-each select="rows/content/form/table/mapeamento_gravacao/value/row">
                  <tr>
                    <td><xsl:value-of select="componente_desc" />
                      <input type="hidden" name="p_mapeamento_gravacao_id" value="{mapeamento_gravacao_id}" />
                      <input type="hidden" name="p_componente_fk" value="{componente}" />
                      <input type="hidden" name="p_componente_fk_desc" value="{componente_desc}" /></td>
                    <td><xsl:value-of select="tag_name_desc" />
                      <input type="hidden" name="p_tag_name_fk" value="{tag_name}" />
                      <input type="hidden" name="p_tag_name_fk_desc" value="{tag_name_desc}" /></td>
                    <td><xsl:value-of select="table_name_desc" />
                      <input type="hidden" name="p_table_name_fk" value="{table_name}" />
                      <input type="hidden" name="p_table_name_fk_desc" value="{table_name_desc}" /></td>
                    <td><xsl:value-of select="table_colum_desc" />
                      <input type="hidden" name="p_table_colum_fk" value="{table_colum}" />
                      <input type="hidden" name="p_table_colum_fk_desc" value="{table_colum_desc}" /></td>
                    <td><xsl:value-of select="desc_map_desc" />
                      <input type="hidden" name="p_desc_map_fk" value="{desc_map}" />
                      <input type="hidden" name="p_desc_map_fk_desc" value="{desc_map_desc}" /></td>
                    <td align="center" width="10"><img alt="apagar" src="{$path}/img/icon/ctx-delete.png" class="IGRP_delRow" rel="mapeamento_gravacao"/></td>
                    <td align="center" width="10"><img alt="editar" src="{$path}/img/icon/edit.png" class="IGRP_editRow" rel="mapeamento_gravacao"/></td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
          </div>
          <!--FIM DA TABELA-->
        </form>
      </div>
      <!--END FORM--> 
      
    </div>
    
    <!-- END YOUR CODE HERE -->
    
    <xsl:call-template name="home-bottom-inc"/>
    
  </xsl:template>
  <!--TEMPLATE FOR HEAD-->
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20111213"/>
</xsl:stylesheet>