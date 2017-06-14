<?xml version="1.0" encoding="utf-8"?>
<!-- DWXMLSource="xml/REDGLOBAL_APLIC_INFO_3_dash.xml" -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <xsl:call-template name="home-top-inc"/>
    
    
    <!-- APLIC_INFO INFORMACOES APLICACAO 3 SETTINGS APLICACAO --> 
    
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
      
      <!--START PAGE-->
      <div class="box-info">
        	<!--<div class="title_info">
                	<div class="icon_info"> 
                		<a href="#">
                        	<img src="{$path}/img/icon/{rows/content/application_info/form/value/img}"  align="absmiddle"/>
                        </a> 
                    </div>
                     <div class="desc_info">
                     	<div class="title-description">
                        	<xsl:value-of select="rows/content/application_info/form/value/title" /><br />
                            <p class="title-description-versao">
                            	<xsl:value-of select="rows/content/application_info/form/value/versao" />
                            </p>
                        </div>
              		</div>
               </div>-->
      <form action="#" method="post" id="formular_default" name="formular_default" class="default_form"  enctype="multipart/form-data">
        <!--FORMULARIO --><!--START FORM--> 
        <!--TOOL BAR-->
        <xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" />
        
        <div class="box-content"> 
          <!--HIDDEN FIELDS-->
          <xsl:apply-templates mode="form-hidden" select="rows/content/form/value" />
          
          <xsl:call-template name="page-title">
            <xsl:with-param name="title" select="rows/content/form/label/dados_utilizador" />
            
            <xsl:with-param name="class" select="'subtitle'" />
            
          </xsl:call-template>
          <div class="foto-box-info">
					<img class="foto-info" src="{rows/content/form/value/foto}" />
		</div>
        
        <div class="div-info">
          <label> <span><xsl:value-of select="rows/content/form/label/nome_utilizador"/></span>
            <input type="text" name="{rows/content/form/value/nome_utilizador/@name}" value="{rows/content/form/value/nome_utilizador}"  class="" maxlength="30" />
          </label>
          <label> <span><xsl:value-of select="rows/content/form/label/data_nascimento"/></span>
            <input type="date" name="{rows/content/form/value/data_nascimento/@name}" value="{rows/content/form/value/data_nascimento}" class="IGRP_datepicker date" />
          </label>
          
          <label> <span><xsl:value-of select="rows/content/form/label/email"/></span>
            <input type="email" name="{rows/content/form/value/email/@name}" value="{rows/content/form/value/email}"  class="email" maxlength="30" />
          </label></div>
          <div class="div-info">
          <label> <span><xsl:value-of select="rows/content/form/label/nova_senha"/></span>
            <input type="password" name="{rows/content/form/value/nova_senha/@name}" value="{rows/content/form/value/nova_senha}"  class="" maxlength="30" />
          </label>
          
          <label> <span><xsl:value-of select="rows/content/form/label/verificar_senha"/></span>
            <input type="password" name="{rows/content/form/value/verificar_senha/@name}" value="{rows/content/form/value/verificar_senha}"  class="" maxlength="30" />
          </label></div>
          <xsl:call-template name="page-title">
            <xsl:with-param name="title" select="rows/content/form/label/parametros" />
            <xsl:with-param name="class" select="'subtitle'" />
          </xsl:call-template>
          <div class="div-info">
            <label> <span><xsl:value-of select="rows/content/form/label/organica"/></span>
            <select name="{rows/content/form/list/organica/@name}" class=" IGRP_change">
              <xsl:for-each select="rows/content/form/list/organica/option">
                <option value="{value}">
                <xsl:if test="@selected='true'">
                  <xsl:attribute name="selected">selected</xsl:attribute>
                </xsl:if>
                <xsl:value-of select="text"/> </option>
              </xsl:for-each>
            </select>
          </label>
          <label> <span><xsl:value-of select="rows/content/form/label/perfil"/></span>
            <select name="{rows/content/form/list/perfil/@name}" class="">
              <xsl:for-each select="rows/content/form/list/perfil/option">
                <option value="{value}">
                <xsl:if test="@selected='true'">
                  <xsl:attribute name="selected">selected</xsl:attribute>
                </xsl:if>
                <xsl:value-of select="text"/> </option>
              </xsl:for-each>
            </select>
          </label>
          </div>
          <div class="div-info">
          <label> <span><xsl:value-of select="rows/content/form/label/janela_inicial"/></span>
            <select name="{rows/content/form/list/janela_inicial/@name}" class="">
              <xsl:for-each select="rows/content/form/list/janela_inicial/option">
                <option value="{value}">
                <xsl:if test="@selected='true'">
                  <xsl:attribute name="selected">selected</xsl:attribute>
                </xsl:if>
                <xsl:value-of select="text"/> </option>
              </xsl:for-each>
            </select>
          </label>
          <label> <span><xsl:value-of select="rows/content/form/label/idioma"/></span>
            <select name="{rows/content/form/list/idioma/@name}" class="">
              <xsl:for-each select="rows/content/form/list/idioma/option">
                <option value="{value}">
                <xsl:if test="@selected='true'">
                  <xsl:attribute name="selected">selected</xsl:attribute>
                </xsl:if>
                <xsl:value-of select="text"/> </option>
              </xsl:for-each>
            </select>
          </label>
          </div>
        </div>
        <!--END FORM--> 
        <!--TOOL BAR-->
        <xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar" />
        
        <!-- CONTEXT-MENU -->
        <xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu"/>
        
        <!--INICIO DA TABELA-->
        <div class="table">
          <table class="sortable">
            <!--CABECALHO DA TABELA-->
            <thead>
              <tr> </tr>
            </thead>
            <!--CORPO DA TABELA-->
            <tbody>
              <xsl:for-each select="rows/content/table/value/row">
                <xsl:variable name="pos" select="(position()+1) mod 2"/>
                <tr class="IGRP_contextMenu">
                  <xsl:apply-templates mode="context-param" select="context-menu" />
                  
                </tr>
              </xsl:for-each>
            </tbody>
          </table>
        </div>
        <!--FIM DA TABELA-->
      </form>
      <!--END PAGE--> 
      </div>
    </div>
    
    <!-- END YOUR CODE HERE -->
    
    <xsl:call-template name="home-bottom-inc"/>
    
  </xsl:template>
  <!--TEMPLATE FOR HEAD-->
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl"/>
</xsl:stylesheet>