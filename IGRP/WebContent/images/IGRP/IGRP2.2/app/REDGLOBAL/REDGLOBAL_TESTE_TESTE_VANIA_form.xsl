<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/REDGLOBAL_TESTE_TESTE_VANIA_form.xml" -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
<xsl:template match="/">
<!-- START HOME TOP -->
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
        <!-- END HOME TOP -->
<!-- TESTE TESTE AD-HOC TESTE_VANIA VANIA -->

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

<!--INICIO DO SEPARADOR "SEPARADOR_COLECTIVA"-->
<div id="{local-name(rows/content/form/label/separador_colectiva)}">
<xsl:if test="rows/content/form/label/separador_colectiva">
<xsl:call-template name="page-title">
<xsl:with-param name="title" select="rows/content/form/label/separador_colectiva" />
<xsl:with-param name="class" select="'subtitle'" />
</xsl:call-template>
</xsl:if>
<xsl:if test="rows/content/form/label/separador_colectiva">
<xsl:call-template name="tools-bar-form-group">
<xsl:with-param name="rel" select="'separador_colectiva'" />
<xsl:with-param name="class" select="'IGRP_addRow_diag'" />
</xsl:call-template>
</xsl:if>
<!--SEPARATORDIALOG separador_colectiva-->
<div class="IGRP_overlay"></div>
<div class="D_separador_colectiva IGRP_dialogbox">
<div class="IGRP_dialogboxTop">
<xsl:if test="rows/content/form/label/separador_colectiva">
<xsl:call-template name="page-title">
<xsl:with-param name="title" select="rows/content/form/label/separador_colectiva" />
</xsl:call-template>
</xsl:if>
</div>
<div class="IGRP_dialogboxCenter">
<xsl:if test="rows/content/form/label/quota_socie">
<label>
<span><xsl:value-of select="rows/content/form/label/quota_socie"/></span>
<input type="number" name="{rows/content/form/value/quota_socie/@name}" value="{rows/content/form/value/quota_socie}"  rel="F_separador_colectiva"   maxlength="10"  class="number">
<xsl:call-template name="FIELD_validator">
<xsl:with-param name="field" select="rows/content/form/label/quota_socie" />
</xsl:call-template>
</input>
</label>
</xsl:if>

<xsl:if test="rows/content/form/label/accao_socie">
<label>
<span><xsl:value-of select="rows/content/form/label/accao_socie"/></span>
<input type="number" name="{rows/content/form/value/accao_socie/@name}" value="{rows/content/form/value/accao_socie}"  rel="F_separador_colectiva"   maxlength="10"  class="number">
<xsl:call-template name="FIELD_validator">
<xsl:with-param name="field" select="rows/content/form/label/accao_socie" />
</xsl:call-template>
</input>
</label>
</xsl:if>

<xsl:if test="rows/content/form/label/admin_socie">
<label>
<span><xsl:value-of select="rows/content/form/label/admin_socie"/></span>
<select name="{rows/content/form/list/admin_socie/@name}" rel="F_separador_colectiva"  class="">
<xsl:call-template name="FIELD_validator">
<xsl:with-param name="field" select="rows/content/form/label/admin_socie" />
</xsl:call-template>
<xsl:for-each select="rows/content/form/list/admin_socie/option">
<option value="{value}">
<xsl:if test="@selected='true'">
<xsl:attribute name="selected">selected</xsl:attribute>
</xsl:if>
<xsl:value-of select="text"/>
</option>
</xsl:for-each>
</select>
</label>
</xsl:if>

<xsl:if test="rows/content/form/label/gerente__socie">
<label>
<span><xsl:value-of select="rows/content/form/label/gerente__socie"/></span>
<select name="{rows/content/form/list/gerente__socie/@name}" rel="F_separador_colectiva"  class="">
<xsl:call-template name="FIELD_validator">
<xsl:with-param name="field" select="rows/content/form/label/gerente__socie" />
</xsl:call-template>
<xsl:for-each select="rows/content/form/list/gerente__socie/option">
<option value="{value}">
<xsl:if test="@selected='true'">
<xsl:attribute name="selected">selected</xsl:attribute>
</xsl:if>
<xsl:value-of select="text"/>
</option>
</xsl:for-each>
</select>
</label>
</xsl:if>

<xsl:if test="rows/content/form/label/pesq_bi_socie">
<label>
<span><xsl:value-of select="rows/content/form/label/pesq_bi_socie"/></span>
<input type="text" name="{rows/content/form/value/pesq_bi_socie/@name}" value="{rows/content/form/value/pesq_bi_socie}"  rel="F_separador_colectiva"   maxlength="100"  class="">
<xsl:call-template name="FIELD_validator">
<xsl:with-param name="field" select="rows/content/form/label/pesq_bi_socie" />
</xsl:call-template>
</input>
<xsl:call-template name="lookup-tool">
<xsl:with-param name="page" select="'LOOKUP'" />
<xsl:with-param name="action" select="'LOOKUP_BI'" />
<xsl:with-param name="name" select="rows/content/form/value/pesq_bi_socie/@name" />
<xsl:with-param name="js_lookup" select="rows/content/form/lookup/pesq_bi_socie" />
</xsl:call-template>
</label>
</xsl:if>

<xsl:if test="rows/content/form/label/pesq_nif_socie">
<label>
<span><xsl:value-of select="rows/content/form/label/pesq_nif_socie"/></span>
<input type="text" name="{rows/content/form/value/pesq_nif_socie/@name}" value="{rows/content/form/value/pesq_nif_socie}"  rel="F_separador_colectiva"   maxlength="100"  class="">
<xsl:call-template name="FIELD_validator">
<xsl:with-param name="field" select="rows/content/form/label/pesq_nif_socie" />
</xsl:call-template>
</input>
<xsl:call-template name="lookup-tool">
<xsl:with-param name="page" select="'LOOKUP'" />
<xsl:with-param name="action" select="'LOOKUP_NIF'" />
<xsl:with-param name="name" select="rows/content/form/value/pesq_nif_socie/@name" />
<xsl:with-param name="js_lookup" select="rows/content/form/lookup/pesq_nif_socie" />
</xsl:call-template>
</label>
</xsl:if>

<xsl:if test="rows/content/form/label/nif_socio__socie">
<label>
<span>(*) <xsl:value-of select="rows/content/form/label/nif_socio__socie"/></span>
<input type="text" name="{rows/content/form/value/nif_socio__socie/@name}" value="{rows/content/form/value/nif_socio__socie}"  readonly="readonly"  rel="F_separador_colectiva"   maxlength="30"  class="required">
<xsl:call-template name="FIELD_validator">
<xsl:with-param name="field" select="rows/content/form/label/nif_socio__socie" />
</xsl:call-template>
</input>
</label>
</xsl:if>

<xsl:if test="rows/content/form/label/nome_socio__socie">
<label>
<span>(*) <xsl:value-of select="rows/content/form/label/nome_socio__socie"/></span>
<input type="text" name="{rows/content/form/value/nome_socio__socie/@name}" value="{rows/content/form/value/nome_socio__socie}"  readonly="readonly"  rel="F_separador_colectiva"   maxlength="250"  class="required">
<xsl:call-template name="FIELD_validator">
<xsl:with-param name="field" select="rows/content/form/label/nome_socio__socie" />
</xsl:call-template>
</input>
</label>
</xsl:if>

<xsl:if test="rows/content/form/label/nac_socio__socie">
<label>
<span>(*) <xsl:value-of select="rows/content/form/label/nac_socio__socie"/></span>
<input type="text" name="{rows/content/form/value/nac_socio__socie/@name}" value="{rows/content/form/value/nac_socio__socie}"  readonly="readonly"  rel="F_separador_colectiva"   maxlength="100"  class="required">
<xsl:call-template name="FIELD_validator">
<xsl:with-param name="field" select="rows/content/form/label/nac_socio__socie" />
</xsl:call-template>
</input>
<xsl:call-template name="lookup-tool">
<xsl:with-param name="page" select="'LOOKUP'" />
<xsl:with-param name="action" select="'LOOKUP_GEOG'" />
<xsl:with-param name="name" select="rows/content/form/value/nac_socio__socie/@name" />
<xsl:with-param name="js_lookup" select="rows/content/form/lookup/nac_socio__socie" />
</xsl:call-template>
</label>
</xsl:if>

<xsl:if test="rows/content/form/label/doc_socio__socie">
<label>
<span>(*) <xsl:value-of select="rows/content/form/label/doc_socio__socie"/></span>
<select name="{rows/content/form/list/doc_socio__socie/@name}" rel="F_separador_colectiva"  class="required">
<xsl:call-template name="FIELD_validator">
<xsl:with-param name="field" select="rows/content/form/label/doc_socio__socie" />
</xsl:call-template>
<xsl:for-each select="rows/content/form/list/doc_socio__socie/option">
<option value="{value}">
<xsl:if test="@selected='true'">
<xsl:attribute name="selected">selected</xsl:attribute>
</xsl:if>
<xsl:value-of select="text"/>
</option>
</xsl:for-each>
</select>
</label>
</xsl:if>

<xsl:if test="rows/content/form/label/n_doc_socio__socie">
<label>
<span>(*) <xsl:value-of select="rows/content/form/label/n_doc_socio__socie"/></span>
<input type="text" name="{rows/content/form/value/n_doc_socio__socie/@name}" value="{rows/content/form/value/n_doc_socio__socie}"  rel="F_separador_colectiva"   maxlength="15"  class="required">
<xsl:call-template name="FIELD_validator">
<xsl:with-param name="field" select="rows/content/form/label/n_doc_socio__socie" />
</xsl:call-template>
</input>
</label>
</xsl:if>

<xsl:if test="rows/content/form/label/data_nasc_socio">
<label>
<span>(*) <xsl:value-of select="rows/content/form/label/data_nasc_socio"/></span>
<input type="text" name="{rows/content/form/value/data_nasc_socio/@name}" value="{rows/content/form/value/data_nasc_socio}"  rel="F_separador_colectiva"  class="IGRP_datepicker required date">
<xsl:call-template name="FIELD_validator">
<xsl:with-param name="field" select="rows/content/form/label/data_nasc_socio" />
</xsl:call-template>
</input>
</label>
</xsl:if>

<xsl:if test="rows/content/form/label/emi_socio__socie">
<label>
<span>(*) <xsl:value-of select="rows/content/form/label/emi_socio__socie"/></span>
<input type="text" name="{rows/content/form/value/emi_socio__socie/@name}" value="{rows/content/form/value/emi_socio__socie}"  rel="F_separador_colectiva"   maxlength="100"  class="required">
<xsl:call-template name="FIELD_validator">
<xsl:with-param name="field" select="rows/content/form/label/emi_socio__socie" />
</xsl:call-template>
</input>
</label>
</xsl:if>

<xsl:if test="rows/content/form/label/dt_emi_socio_socie">
<label>
<span>(*) <xsl:value-of select="rows/content/form/label/dt_emi_socio_socie"/></span>
<input type="text" name="{rows/content/form/value/dt_emi_socio_socie/@name}" value="{rows/content/form/value/dt_emi_socio_socie}"  readonly="readonly"  rel="F_separador_colectiva"  class="IGRP_datepicker required date">
<xsl:call-template name="FIELD_validator">
<xsl:with-param name="field" select="rows/content/form/label/dt_emi_socio_socie" />
</xsl:call-template>
</input>
</label>
</xsl:if>

<xsl:if test="rows/content/form/label/dt_val_socie">
<label>
<span><xsl:value-of select="rows/content/form/label/dt_val_socie"/></span>
<input type="text" name="{rows/content/form/value/dt_val_socie/@name}" value="{rows/content/form/value/dt_val_socie}"  readonly="readonly"  rel="F_separador_colectiva"  class="IGRP_datepicker date">
<xsl:call-template name="FIELD_validator">
<xsl:with-param name="field" select="rows/content/form/label/dt_val_socie" />
</xsl:call-template>
</input>
</label>
</xsl:if>

<xsl:if test="rows/content/form/label/res_socio_socie">
<label>
<span>(*) <xsl:value-of select="rows/content/form/label/res_socio_socie"/></span>
<input type="text" name="{rows/content/form/value/res_socio_socie/@name}" value="{rows/content/form/value/res_socio_socie}"  rel="F_separador_colectiva"   maxlength="100"  class="required">
<xsl:call-template name="FIELD_validator">
<xsl:with-param name="field" select="rows/content/form/label/res_socio_socie" />
</xsl:call-template>
</input>
</label>
</xsl:if>

<xsl:if test="rows/content/form/label/est_civil_socio_socie">
<label>
<span>(*) <xsl:value-of select="rows/content/form/label/est_civil_socio_socie"/></span>
<select name="{rows/content/form/list/est_civil_socio_socie/@name}" rel="F_separador_colectiva"  class="required">
<xsl:call-template name="FIELD_validator">
<xsl:with-param name="field" select="rows/content/form/label/est_civil_socio_socie" />
</xsl:call-template>
<xsl:for-each select="rows/content/form/list/est_civil_socio_socie/option">
<option value="{value}">
<xsl:if test="@selected='true'">
<xsl:attribute name="selected">selected</xsl:attribute>
</xsl:if>
<xsl:value-of select="text"/>
</option>
</xsl:for-each>
</select>
</label>
</xsl:if>

<xsl:if test="rows/content/form/label/regime_bens_socie">
<label>
<span><xsl:value-of select="rows/content/form/label/regime_bens_socie"/></span>
<select name="{rows/content/form/list/regime_bens_socie/@name}" rel="F_separador_colectiva"  class="">
<xsl:call-template name="FIELD_validator">
<xsl:with-param name="field" select="rows/content/form/label/regime_bens_socie" />
</xsl:call-template>
<xsl:for-each select="rows/content/form/list/regime_bens_socie/option">
<option value="{value}">
<xsl:if test="@selected='true'">
<xsl:attribute name="selected">selected</xsl:attribute>
</xsl:if>
<xsl:value-of select="text"/>
</option>
</xsl:for-each>
</select>
</label>
</xsl:if>

<xsl:if test="rows/content/form/label/conjuge_socio_socie">
<label>
<span><xsl:value-of select="rows/content/form/label/conjuge_socio_socie"/></span>
<input type="text" name="{rows/content/form/value/conjuge_socio_socie/@name}" value="{rows/content/form/value/conjuge_socio_socie}"  rel="F_separador_colectiva"   maxlength="250"  class="">
<xsl:call-template name="FIELD_validator">
<xsl:with-param name="field" select="rows/content/form/label/conjuge_socio_socie" />
</xsl:call-template>
</input>
</label>
</xsl:if>

<xsl:if test="rows/content/form/label/email">
<label>
<span><xsl:value-of select="rows/content/form/label/email"/></span>
<input type="email" name="{rows/content/form/value/email/@name}" value="{rows/content/form/value/email}"  rel="F_separador_colectiva"   maxlength="250"  class="email">
<xsl:call-template name="FIELD_validator">
<xsl:with-param name="field" select="rows/content/form/label/email" />
</xsl:call-template>
</input>
</label>
</xsl:if>

<xsl:if test="rows/content/form/label/inscricao_ajec">
<label>
<span><xsl:value-of select="rows/content/form/label/inscricao_ajec"/></span>
<select name="{rows/content/form/list/inscricao_ajec/@name}" rel="F_separador_colectiva"  class="">
<xsl:call-template name="FIELD_validator">
<xsl:with-param name="field" select="rows/content/form/label/inscricao_ajec" />
</xsl:call-template>
<xsl:for-each select="rows/content/form/list/inscricao_ajec/option">
<option value="{value}">
<xsl:if test="@selected='true'">
<xsl:attribute name="selected">selected</xsl:attribute>
</xsl:if>
<xsl:value-of select="text"/>
</option>
</xsl:for-each>
</select>
</label>
</xsl:if>

<xsl:if test="rows/content/form/label/grupo_repr_singular">
<xsl:call-template name="page-title">
<xsl:with-param name="title" select="rows/content/form/label/grupo_repr_singular" />
<xsl:with-param name="class" select="'subtitle'" />
</xsl:call-template>
</xsl:if>

<xsl:if test="rows/content/form/label/pesq_rep_socie">
<label>
<span><xsl:value-of select="rows/content/form/label/pesq_rep_socie"/></span>
<input type="text" name="{rows/content/form/value/pesq_rep_socie/@name}" value="{rows/content/form/value/pesq_rep_socie}"  rel="F_separador_colectiva"   maxlength="30"  class="">
<xsl:call-template name="FIELD_validator">
<xsl:with-param name="field" select="rows/content/form/label/pesq_rep_socie" />
</xsl:call-template>
</input>
<xsl:call-template name="lookup-tool">
<xsl:with-param name="page" select="'LOOKUP'" />
<xsl:with-param name="action" select="'LOOKUP_BI'" />
<xsl:with-param name="name" select="rows/content/form/value/pesq_rep_socie/@name" />
<xsl:with-param name="js_lookup" select="rows/content/form/lookup/pesq_rep_socie" />
</xsl:call-template>
</label>
</xsl:if>

<xsl:if test="rows/content/form/label/nome_rep_socie">
<label>
<span><xsl:value-of select="rows/content/form/label/nome_rep_socie"/></span>
<input type="text" name="{rows/content/form/value/nome_rep_socie/@name}" value="{rows/content/form/value/nome_rep_socie}"  rel="F_separador_colectiva"   maxlength="250"  class="">
<xsl:call-template name="FIELD_validator">
<xsl:with-param name="field" select="rows/content/form/label/nome_rep_socie" />
</xsl:call-template>
</input>
</label>
</xsl:if>

<xsl:if test="rows/content/form/label/civil_rep_socie">
<label>
<span><xsl:value-of select="rows/content/form/label/civil_rep_socie"/></span>
<select name="{rows/content/form/list/civil_rep_socie/@name}" rel="F_separador_colectiva"  class="">
<xsl:call-template name="FIELD_validator">
<xsl:with-param name="field" select="rows/content/form/label/civil_rep_socie" />
</xsl:call-template>
<xsl:for-each select="rows/content/form/list/civil_rep_socie/option">
<option value="{value}">
<xsl:if test="@selected='true'">
<xsl:attribute name="selected">selected</xsl:attribute>
</xsl:if>
<xsl:value-of select="text"/>
</option>
</xsl:for-each>
</select>
</label>
</xsl:if>

<xsl:if test="rows/content/form/label/res_rep_socie">
<label>
<span><xsl:value-of select="rows/content/form/label/res_rep_socie"/></span>
<input type="text" name="{rows/content/form/value/res_rep_socie/@name}" value="{rows/content/form/value/res_rep_socie}"  rel="F_separador_colectiva"   maxlength="100"  class="">
<xsl:call-template name="FIELD_validator">
<xsl:with-param name="field" select="rows/content/form/label/res_rep_socie" />
</xsl:call-template>
</input>
</label>
</xsl:if>

<xsl:if test="rows/content/form/label/doc_rep_socie">
<label>
<span><xsl:value-of select="rows/content/form/label/doc_rep_socie"/></span>
<select name="{rows/content/form/list/doc_rep_socie/@name}" rel="F_separador_colectiva"  class="">
<xsl:call-template name="FIELD_validator">
<xsl:with-param name="field" select="rows/content/form/label/doc_rep_socie" />
</xsl:call-template>
<xsl:for-each select="rows/content/form/list/doc_rep_socie/option">
<option value="{value}">
<xsl:if test="@selected='true'">
<xsl:attribute name="selected">selected</xsl:attribute>
</xsl:if>
<xsl:value-of select="text"/>
</option>
</xsl:for-each>
</select>
</label>
</xsl:if>

<xsl:if test="rows/content/form/label/n_doc_rep_socie">
<label>
<span><xsl:value-of select="rows/content/form/label/n_doc_rep_socie"/></span>
<input type="text" name="{rows/content/form/value/n_doc_rep_socie/@name}" value="{rows/content/form/value/n_doc_rep_socie}"  rel="F_separador_colectiva"   maxlength="15"  class="">
<xsl:call-template name="FIELD_validator">
<xsl:with-param name="field" select="rows/content/form/label/n_doc_rep_socie" />
</xsl:call-template>
</input>
</label>
</xsl:if>

<xsl:if test="rows/content/form/label/data_emi_rep_socie">
<label>
<span><xsl:value-of select="rows/content/form/label/data_emi_rep_socie"/></span>
<input type="text" name="{rows/content/form/value/data_emi_rep_socie/@name}" value="{rows/content/form/value/data_emi_rep_socie}"  readonly="readonly"  rel="F_separador_colectiva"  class="IGRP_datepicker date">
<xsl:call-template name="FIELD_validator">
<xsl:with-param name="field" select="rows/content/form/label/data_emi_rep_socie" />
</xsl:call-template>
</input>
</label>
</xsl:if>

<xsl:if test="rows/content/form/label/data_val_rep_socie">
<label>
<span><xsl:value-of select="rows/content/form/label/data_val_rep_socie"/></span>
<input type="text" name="{rows/content/form/value/data_val_rep_socie/@name}" value="{rows/content/form/value/data_val_rep_socie}"  readonly="readonly"  rel="F_separador_colectiva"  class="IGRP_datepicker date">
<xsl:call-template name="FIELD_validator">
<xsl:with-param name="field" select="rows/content/form/label/data_val_rep_socie" />
</xsl:call-template>
</input>
</label>
</xsl:if>

<xsl:if test="rows/content/form/label/emissor_rep_socie">
<label>
<span><xsl:value-of select="rows/content/form/label/emissor_rep_socie"/></span>
<input type="text" name="{rows/content/form/value/emissor_rep_socie/@name}" value="{rows/content/form/value/emissor_rep_socie}"  rel="F_separador_colectiva"   maxlength="100"  class="">
<xsl:call-template name="FIELD_validator">
<xsl:with-param name="field" select="rows/content/form/label/emissor_rep_socie" />
</xsl:call-template>
</input>
</label>
</xsl:if>

<xsl:if test="rows/content/form/label/docu_rep_socie">
<label>
<span><xsl:value-of select="rows/content/form/label/docu_rep_socie"/></span>
<select name="{rows/content/form/list/docu_rep_socie/@name}" rel="F_separador_colectiva"  class="">
<xsl:call-template name="FIELD_validator">
<xsl:with-param name="field" select="rows/content/form/label/docu_rep_socie" />
</xsl:call-template>
<xsl:for-each select="rows/content/form/list/docu_rep_socie/option">
<option value="{value}">
<xsl:if test="@selected='true'">
<xsl:attribute name="selected">selected</xsl:attribute>
</xsl:if>
<xsl:value-of select="text"/>
</option>
</xsl:for-each>
</select>
</label>
</xsl:if>

<xsl:if test="rows/content/form/label/anexo_socie">
<label>
<span><xsl:value-of select="rows/content/form/label/anexo_socie"/></span>
<input type="file" name="{rows/content/form/value/anexo_socie/@name}" value="{rows/content/form/value/anexo_socie}"  rel="F_separador_colectiva"   maxlength="100"  class="">
<xsl:call-template name="FIELD_validator">
<xsl:with-param name="field" select="rows/content/form/label/anexo_socie" />
</xsl:call-template>
</input>
</label>
</xsl:if>

<xsl:if test="rows/content/form/label/emi_doc_socie">
<label>
<span><xsl:value-of select="rows/content/form/label/emi_doc_socie"/></span>
<input type="text" name="{rows/content/form/value/emi_doc_socie/@name}" value="{rows/content/form/value/emi_doc_socie}"  rel="F_separador_colectiva"   maxlength="100"  class="">
<xsl:call-template name="FIELD_validator">
<xsl:with-param name="field" select="rows/content/form/label/emi_doc_socie" />
</xsl:call-template>
</input>
</label>
</xsl:if>

<xsl:if test="rows/content/form/label/data_emi_doc_socie">
<label>
<span><xsl:value-of select="rows/content/form/label/data_emi_doc_socie"/></span>
<input type="text" name="{rows/content/form/value/data_emi_doc_socie/@name}" value="{rows/content/form/value/data_emi_doc_socie}"  readonly="readonly"  rel="F_separador_colectiva"  class="IGRP_datepicker date">
<xsl:call-template name="FIELD_validator">
<xsl:with-param name="field" select="rows/content/form/label/data_emi_doc_socie" />
</xsl:call-template>
</input>
</label>
</xsl:if>

<div class="dialog_btnContainer">
<input type="button" class="IGRP_row_confirm" value="Confirmar" rel="separador_colectiva"/>
<input type="button" class="IGRP_btn_close" value="Fechar" rel="separador_colectiva"/>
</div>
</div>
</div>
<!--devo fachar DIV_DIALOG aqui-->
<xsl:if test="rows/content/form/label/separador_colectiva">

<!--INICIO DA TABELA  rows/content/form/table/separador_colectiva/-->
<div class="simple-table">
<table rel="T_separador_colectiva">
<!--CABECALHO DA TABELA -->
<thead><tr>
<xsl:if test="rows/content/form/table/separador_colectiva/label/quota_socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/quota_socie/@visible)">
<th  ><xsl:value-of select="rows/content/form/table/separador_colectiva/label/quota_socie"/></th>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/accao_socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/accao_socie/@visible)">
<th  ><xsl:value-of select="rows/content/form/table/separador_colectiva/label/accao_socie"/></th>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/admin_socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/admin_socie/@visible)">
<th  ><xsl:value-of select="rows/content/form/table/separador_colectiva/label/admin_socie"/></th>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/gerente__socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/gerente__socie/@visible)">
<th  ><xsl:value-of select="rows/content/form/table/separador_colectiva/label/gerente__socie"/></th>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/pesq_bi_socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/pesq_bi_socie/@visible)">
<th  ><xsl:value-of select="rows/content/form/table/separador_colectiva/label/pesq_bi_socie"/></th>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/pesq_nif_socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/pesq_nif_socie/@visible)">
<th  ><xsl:value-of select="rows/content/form/table/separador_colectiva/label/pesq_nif_socie"/></th>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/nif_socio__socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/nif_socio__socie/@visible)">
<th  ><xsl:value-of select="rows/content/form/table/separador_colectiva/label/nif_socio__socie"/></th>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/nome_socio__socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/nome_socio__socie/@visible)">
<th  ><xsl:value-of select="rows/content/form/table/separador_colectiva/label/nome_socio__socie"/></th>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/nac_socio__socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/nac_socio__socie/@visible)">
<th  ><xsl:value-of select="rows/content/form/table/separador_colectiva/label/nac_socio__socie"/></th>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/doc_socio__socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/doc_socio__socie/@visible)">
<th  ><xsl:value-of select="rows/content/form/table/separador_colectiva/label/doc_socio__socie"/></th>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/n_doc_socio__socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/n_doc_socio__socie/@visible)">
<th  ><xsl:value-of select="rows/content/form/table/separador_colectiva/label/n_doc_socio__socie"/></th>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/data_nasc_socio">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/data_nasc_socio/@visible)">
<th  ><xsl:value-of select="rows/content/form/table/separador_colectiva/label/data_nasc_socio"/></th>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/emi_socio__socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/emi_socio__socie/@visible)">
<th  ><xsl:value-of select="rows/content/form/table/separador_colectiva/label/emi_socio__socie"/></th>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/dt_emi_socio_socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/dt_emi_socio_socie/@visible)">
<th  ><xsl:value-of select="rows/content/form/table/separador_colectiva/label/dt_emi_socio_socie"/></th>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/dt_val_socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/dt_val_socie/@visible)">
<th  ><xsl:value-of select="rows/content/form/table/separador_colectiva/label/dt_val_socie"/></th>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/res_socio_socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/res_socio_socie/@visible)">
<th  ><xsl:value-of select="rows/content/form/table/separador_colectiva/label/res_socio_socie"/></th>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/est_civil_socio_socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/est_civil_socio_socie/@visible)">
<th  ><xsl:value-of select="rows/content/form/table/separador_colectiva/label/est_civil_socio_socie"/></th>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/regime_bens_socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/regime_bens_socie/@visible)">
<th  ><xsl:value-of select="rows/content/form/table/separador_colectiva/label/regime_bens_socie"/></th>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/conjuge_socio_socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/conjuge_socio_socie/@visible)">
<th  ><xsl:value-of select="rows/content/form/table/separador_colectiva/label/conjuge_socio_socie"/></th>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/email">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/email/@visible)">
<th  ><xsl:value-of select="rows/content/form/table/separador_colectiva/label/email"/></th>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/inscricao_ajec">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/inscricao_ajec/@visible)">
<th  ><xsl:value-of select="rows/content/form/table/separador_colectiva/label/inscricao_ajec"/></th>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/pesq_rep_socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/pesq_rep_socie/@visible)">
<th  ><xsl:value-of select="rows/content/form/table/separador_colectiva/label/pesq_rep_socie"/></th>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/nome_rep_socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/nome_rep_socie/@visible)">
<th  ><xsl:value-of select="rows/content/form/table/separador_colectiva/label/nome_rep_socie"/></th>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/civil_rep_socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/civil_rep_socie/@visible)">
<th  ><xsl:value-of select="rows/content/form/table/separador_colectiva/label/civil_rep_socie"/></th>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/res_rep_socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/res_rep_socie/@visible)">
<th  ><xsl:value-of select="rows/content/form/table/separador_colectiva/label/res_rep_socie"/></th>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/doc_rep_socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/doc_rep_socie/@visible)">
<th  ><xsl:value-of select="rows/content/form/table/separador_colectiva/label/doc_rep_socie"/></th>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/n_doc_rep_socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/n_doc_rep_socie/@visible)">
<th  ><xsl:value-of select="rows/content/form/table/separador_colectiva/label/n_doc_rep_socie"/></th>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/data_emi_rep_socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/data_emi_rep_socie/@visible)">
<th  ><xsl:value-of select="rows/content/form/table/separador_colectiva/label/data_emi_rep_socie"/></th>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/data_val_rep_socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/data_val_rep_socie/@visible)">
<th  ><xsl:value-of select="rows/content/form/table/separador_colectiva/label/data_val_rep_socie"/></th>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/emissor_rep_socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/emissor_rep_socie/@visible)">
<th  ><xsl:value-of select="rows/content/form/table/separador_colectiva/label/emissor_rep_socie"/></th>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/docu_rep_socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/docu_rep_socie/@visible)">
<th  ><xsl:value-of select="rows/content/form/table/separador_colectiva/label/docu_rep_socie"/></th>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/anexo_socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/anexo_socie/@visible)">
<th  ><xsl:value-of select="rows/content/form/table/separador_colectiva/label/anexo_socie"/></th>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/emi_doc_socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/emi_doc_socie/@visible)">
<th  ><xsl:value-of select="rows/content/form/table/separador_colectiva/label/emi_doc_socie"/></th>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/data_emi_doc_socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/data_emi_doc_socie/@visible)">
<th  ><xsl:value-of select="rows/content/form/table/separador_colectiva/label/data_emi_doc_socie"/></th>
</xsl:if>
</xsl:if>
<th align="center" width="10"></th>
<th align="center" width="10"></th>
</tr></thead>
<!--CORPO DA TABELA-->
<tbody>
<xsl:for-each select="rows/content/form/table/separador_colectiva/value/row[not(@total='yes')]">
<tr>
<xsl:if test="quota_socie">
<xsl:if test="not(quota_socie/@visible)">
<td><xsl:value-of select="quota_socie_desc" /><input type="hidden" name="p_quota_socie_fk" value="{quota_socie}" /><input type="hidden" name="p_quota_socie_fk_desc" value="{quota_socie_desc}" /></td>
</xsl:if>
</xsl:if>
<xsl:if test="quota_socie/@visible='false'">
<input type="hidden" name="p_quota_socie_fk" value="{quota_socie}" /><input type="hidden" name="p_quota_socie_fk_desc" value="{quota_socie_desc}" />
</xsl:if>
<xsl:if test="accao_socie">
<xsl:if test="not(accao_socie/@visible)">
<td><xsl:value-of select="accao_socie_desc" /><input type="hidden" name="p_accao_socie_fk" value="{accao_socie}" /><input type="hidden" name="p_accao_socie_fk_desc" value="{accao_socie_desc}" /></td>
</xsl:if>
</xsl:if>
<xsl:if test="accao_socie/@visible='false'">
<input type="hidden" name="p_accao_socie_fk" value="{accao_socie}" /><input type="hidden" name="p_accao_socie_fk_desc" value="{accao_socie_desc}" />
</xsl:if>
<xsl:if test="admin_socie">
<xsl:if test="not(admin_socie/@visible)">
<td><xsl:value-of select="admin_socie_desc" /><input type="hidden" name="p_admin_socie_fk" value="{admin_socie}" /><input type="hidden" name="p_admin_socie_fk_desc" value="{admin_socie_desc}" /></td>
</xsl:if>
</xsl:if>
<xsl:if test="admin_socie/@visible='false'">
<input type="hidden" name="p_admin_socie_fk" value="{admin_socie}" /><input type="hidden" name="p_admin_socie_fk_desc" value="{admin_socie_desc}" />
</xsl:if>
<xsl:if test="gerente__socie">
<xsl:if test="not(gerente__socie/@visible)">
<td><xsl:value-of select="gerente__socie_desc" /><input type="hidden" name="p_gerente__socie_fk" value="{gerente__socie}" /><input type="hidden" name="p_gerente__socie_fk_desc" value="{gerente__socie_desc}" /></td>
</xsl:if>
</xsl:if>
<xsl:if test="gerente__socie/@visible='false'">
<input type="hidden" name="p_gerente__socie_fk" value="{gerente__socie}" /><input type="hidden" name="p_gerente__socie_fk_desc" value="{gerente__socie_desc}" />
</xsl:if>
<xsl:if test="pesq_bi_socie">
<xsl:if test="not(pesq_bi_socie/@visible)">
<td><xsl:value-of select="pesq_bi_socie_desc" /><input type="hidden" name="p_pesq_bi_socie_fk" value="{pesq_bi_socie}" /><input type="hidden" name="p_pesq_bi_socie_fk_desc" value="{pesq_bi_socie_desc}" /></td>
</xsl:if>
</xsl:if>
<xsl:if test="pesq_bi_socie/@visible='false'">
<input type="hidden" name="p_pesq_bi_socie_fk" value="{pesq_bi_socie}" /><input type="hidden" name="p_pesq_bi_socie_fk_desc" value="{pesq_bi_socie_desc}" />
</xsl:if>
<xsl:if test="pesq_nif_socie">
<xsl:if test="not(pesq_nif_socie/@visible)">
<td><xsl:value-of select="pesq_nif_socie_desc" /><input type="hidden" name="p_pesq_nif_socie_fk" value="{pesq_nif_socie}" /><input type="hidden" name="p_pesq_nif_socie_fk_desc" value="{pesq_nif_socie_desc}" /></td>
</xsl:if>
</xsl:if>
<xsl:if test="pesq_nif_socie/@visible='false'">
<input type="hidden" name="p_pesq_nif_socie_fk" value="{pesq_nif_socie}" /><input type="hidden" name="p_pesq_nif_socie_fk_desc" value="{pesq_nif_socie_desc}" />
</xsl:if>
<xsl:if test="nif_socio__socie">
<xsl:if test="not(nif_socio__socie/@visible)">
<td><xsl:value-of select="nif_socio__socie_desc" /><input type="hidden" name="p_nif_socio__socie_fk" value="{nif_socio__socie}" /><input type="hidden" name="p_nif_socio__socie_fk_desc" value="{nif_socio__socie_desc}" /></td>
</xsl:if>
</xsl:if>
<xsl:if test="nif_socio__socie/@visible='false'">
<input type="hidden" name="p_nif_socio__socie_fk" value="{nif_socio__socie}" /><input type="hidden" name="p_nif_socio__socie_fk_desc" value="{nif_socio__socie_desc}" />
</xsl:if>
<xsl:if test="nome_socio__socie">
<xsl:if test="not(nome_socio__socie/@visible)">
<td><xsl:value-of select="nome_socio__socie_desc" /><input type="hidden" name="p_nome_socio__socie_fk" value="{nome_socio__socie}" /><input type="hidden" name="p_nome_socio__socie_fk_desc" value="{nome_socio__socie_desc}" /></td>
</xsl:if>
</xsl:if>
<xsl:if test="nome_socio__socie/@visible='false'">
<input type="hidden" name="p_nome_socio__socie_fk" value="{nome_socio__socie}" /><input type="hidden" name="p_nome_socio__socie_fk_desc" value="{nome_socio__socie_desc}" />
</xsl:if>
<xsl:if test="nac_socio__socie">
<xsl:if test="not(nac_socio__socie/@visible)">
<td><xsl:value-of select="nac_socio__socie_desc" /><input type="hidden" name="p_nac_socio__socie_fk" value="{nac_socio__socie}" /><input type="hidden" name="p_nac_socio__socie_fk_desc" value="{nac_socio__socie_desc}" /></td>
</xsl:if>
</xsl:if>
<xsl:if test="nac_socio__socie/@visible='false'">
<input type="hidden" name="p_nac_socio__socie_fk" value="{nac_socio__socie}" /><input type="hidden" name="p_nac_socio__socie_fk_desc" value="{nac_socio__socie_desc}" />
</xsl:if>
<xsl:if test="doc_socio__socie">
<xsl:if test="not(doc_socio__socie/@visible)">
<td><xsl:value-of select="doc_socio__socie_desc" /><input type="hidden" name="p_doc_socio__socie_fk" value="{doc_socio__socie}" /><input type="hidden" name="p_doc_socio__socie_fk_desc" value="{doc_socio__socie_desc}" /></td>
</xsl:if>
</xsl:if>
<xsl:if test="doc_socio__socie/@visible='false'">
<input type="hidden" name="p_doc_socio__socie_fk" value="{doc_socio__socie}" /><input type="hidden" name="p_doc_socio__socie_fk_desc" value="{doc_socio__socie_desc}" />
</xsl:if>
<xsl:if test="n_doc_socio__socie">
<xsl:if test="not(n_doc_socio__socie/@visible)">
<td><xsl:value-of select="n_doc_socio__socie_desc" /><input type="hidden" name="p_n_doc_socio__socie_fk" value="{n_doc_socio__socie}" /><input type="hidden" name="p_n_doc_socio__socie_fk_desc" value="{n_doc_socio__socie_desc}" /></td>
</xsl:if>
</xsl:if>
<xsl:if test="n_doc_socio__socie/@visible='false'">
<input type="hidden" name="p_n_doc_socio__socie_fk" value="{n_doc_socio__socie}" /><input type="hidden" name="p_n_doc_socio__socie_fk_desc" value="{n_doc_socio__socie_desc}" />
</xsl:if>
<xsl:if test="data_nasc_socio">
<xsl:if test="not(data_nasc_socio/@visible)">
<td><xsl:value-of select="data_nasc_socio_desc" /><input type="hidden" name="p_data_nasc_socio_fk" value="{data_nasc_socio}" /><input type="hidden" name="p_data_nasc_socio_fk_desc" value="{data_nasc_socio_desc}" /></td>
</xsl:if>
</xsl:if>
<xsl:if test="data_nasc_socio/@visible='false'">
<input type="hidden" name="p_data_nasc_socio_fk" value="{data_nasc_socio}" /><input type="hidden" name="p_data_nasc_socio_fk_desc" value="{data_nasc_socio_desc}" />
</xsl:if>
<xsl:if test="emi_socio__socie">
<xsl:if test="not(emi_socio__socie/@visible)">
<td><xsl:value-of select="emi_socio__socie_desc" /><input type="hidden" name="p_emi_socio__socie_fk" value="{emi_socio__socie}" /><input type="hidden" name="p_emi_socio__socie_fk_desc" value="{emi_socio__socie_desc}" /></td>
</xsl:if>
</xsl:if>
<xsl:if test="emi_socio__socie/@visible='false'">
<input type="hidden" name="p_emi_socio__socie_fk" value="{emi_socio__socie}" /><input type="hidden" name="p_emi_socio__socie_fk_desc" value="{emi_socio__socie_desc}" />
</xsl:if>
<xsl:if test="dt_emi_socio_socie">
<xsl:if test="not(dt_emi_socio_socie/@visible)">
<td><xsl:value-of select="dt_emi_socio_socie_desc" /><input type="hidden" name="p_dt_emi_socio_socie_fk" value="{dt_emi_socio_socie}" /><input type="hidden" name="p_dt_emi_socio_socie_fk_desc" value="{dt_emi_socio_socie_desc}" /></td>
</xsl:if>
</xsl:if>
<xsl:if test="dt_emi_socio_socie/@visible='false'">
<input type="hidden" name="p_dt_emi_socio_socie_fk" value="{dt_emi_socio_socie}" /><input type="hidden" name="p_dt_emi_socio_socie_fk_desc" value="{dt_emi_socio_socie_desc}" />
</xsl:if>
<xsl:if test="dt_val_socie">
<xsl:if test="not(dt_val_socie/@visible)">
<td><xsl:value-of select="dt_val_socie_desc" /><input type="hidden" name="p_dt_val_socie_fk" value="{dt_val_socie}" /><input type="hidden" name="p_dt_val_socie_fk_desc" value="{dt_val_socie_desc}" /></td>
</xsl:if>
</xsl:if>
<xsl:if test="dt_val_socie/@visible='false'">
<input type="hidden" name="p_dt_val_socie_fk" value="{dt_val_socie}" /><input type="hidden" name="p_dt_val_socie_fk_desc" value="{dt_val_socie_desc}" />
</xsl:if>
<xsl:if test="res_socio_socie">
<xsl:if test="not(res_socio_socie/@visible)">
<td><xsl:value-of select="res_socio_socie_desc" /><input type="hidden" name="p_res_socio_socie_fk" value="{res_socio_socie}" /><input type="hidden" name="p_res_socio_socie_fk_desc" value="{res_socio_socie_desc}" /></td>
</xsl:if>
</xsl:if>
<xsl:if test="res_socio_socie/@visible='false'">
<input type="hidden" name="p_res_socio_socie_fk" value="{res_socio_socie}" /><input type="hidden" name="p_res_socio_socie_fk_desc" value="{res_socio_socie_desc}" />
</xsl:if>
<xsl:if test="est_civil_socio_socie">
<xsl:if test="not(est_civil_socio_socie/@visible)">
<td><xsl:value-of select="est_civil_socio_socie_desc" /><input type="hidden" name="p_est_civil_socio_socie_fk" value="{est_civil_socio_socie}" /><input type="hidden" name="p_est_civil_socio_socie_fk_desc" value="{est_civil_socio_socie_desc}" /></td>
</xsl:if>
</xsl:if>
<xsl:if test="est_civil_socio_socie/@visible='false'">
<input type="hidden" name="p_est_civil_socio_socie_fk" value="{est_civil_socio_socie}" /><input type="hidden" name="p_est_civil_socio_socie_fk_desc" value="{est_civil_socio_socie_desc}" />
</xsl:if>
<xsl:if test="regime_bens_socie">
<xsl:if test="not(regime_bens_socie/@visible)">
<td><xsl:value-of select="regime_bens_socie_desc" /><input type="hidden" name="p_regime_bens_socie_fk" value="{regime_bens_socie}" /><input type="hidden" name="p_regime_bens_socie_fk_desc" value="{regime_bens_socie_desc}" /></td>
</xsl:if>
</xsl:if>
<xsl:if test="regime_bens_socie/@visible='false'">
<input type="hidden" name="p_regime_bens_socie_fk" value="{regime_bens_socie}" /><input type="hidden" name="p_regime_bens_socie_fk_desc" value="{regime_bens_socie_desc}" />
</xsl:if>
<xsl:if test="conjuge_socio_socie">
<xsl:if test="not(conjuge_socio_socie/@visible)">
<td><xsl:value-of select="conjuge_socio_socie_desc" /><input type="hidden" name="p_conjuge_socio_socie_fk" value="{conjuge_socio_socie}" /><input type="hidden" name="p_conjuge_socio_socie_fk_desc" value="{conjuge_socio_socie_desc}" /></td>
</xsl:if>
</xsl:if>
<xsl:if test="conjuge_socio_socie/@visible='false'">
<input type="hidden" name="p_conjuge_socio_socie_fk" value="{conjuge_socio_socie}" /><input type="hidden" name="p_conjuge_socio_socie_fk_desc" value="{conjuge_socio_socie_desc}" />
</xsl:if>
<xsl:if test="email">
<xsl:if test="not(email/@visible)">
<td><xsl:value-of select="email_desc" /><input type="hidden" name="p_email_fk" value="{email}" /><input type="hidden" name="p_email_fk_desc" value="{email_desc}" /></td>
</xsl:if>
</xsl:if>
<xsl:if test="email/@visible='false'">
<input type="hidden" name="p_email_fk" value="{email}" /><input type="hidden" name="p_email_fk_desc" value="{email_desc}" />
</xsl:if>
<xsl:if test="inscricao_ajec">
<xsl:if test="not(inscricao_ajec/@visible)">
<td><xsl:value-of select="inscricao_ajec_desc" /><input type="hidden" name="p_inscricao_ajec_fk" value="{inscricao_ajec}" /><input type="hidden" name="p_inscricao_ajec_fk_desc" value="{inscricao_ajec_desc}" /></td>
</xsl:if>
</xsl:if>
<xsl:if test="inscricao_ajec/@visible='false'">
<input type="hidden" name="p_inscricao_ajec_fk" value="{inscricao_ajec}" /><input type="hidden" name="p_inscricao_ajec_fk_desc" value="{inscricao_ajec_desc}" />
</xsl:if>
<xsl:if test="pesq_rep_socie">
<xsl:if test="not(pesq_rep_socie/@visible)">
<td><xsl:value-of select="pesq_rep_socie_desc" /><input type="hidden" name="p_pesq_rep_socie_fk" value="{pesq_rep_socie}" /><input type="hidden" name="p_pesq_rep_socie_fk_desc" value="{pesq_rep_socie_desc}" /></td>
</xsl:if>
</xsl:if>
<xsl:if test="pesq_rep_socie/@visible='false'">
<input type="hidden" name="p_pesq_rep_socie_fk" value="{pesq_rep_socie}" /><input type="hidden" name="p_pesq_rep_socie_fk_desc" value="{pesq_rep_socie_desc}" />
</xsl:if>
<xsl:if test="nome_rep_socie">
<xsl:if test="not(nome_rep_socie/@visible)">
<td><xsl:value-of select="nome_rep_socie_desc" /><input type="hidden" name="p_nome_rep_socie_fk" value="{nome_rep_socie}" /><input type="hidden" name="p_nome_rep_socie_fk_desc" value="{nome_rep_socie_desc}" /></td>
</xsl:if>
</xsl:if>
<xsl:if test="nome_rep_socie/@visible='false'">
<input type="hidden" name="p_nome_rep_socie_fk" value="{nome_rep_socie}" /><input type="hidden" name="p_nome_rep_socie_fk_desc" value="{nome_rep_socie_desc}" />
</xsl:if>
<xsl:if test="civil_rep_socie">
<xsl:if test="not(civil_rep_socie/@visible)">
<td><xsl:value-of select="civil_rep_socie_desc" /><input type="hidden" name="p_civil_rep_socie_fk" value="{civil_rep_socie}" /><input type="hidden" name="p_civil_rep_socie_fk_desc" value="{civil_rep_socie_desc}" /></td>
</xsl:if>
</xsl:if>
<xsl:if test="civil_rep_socie/@visible='false'">
<input type="hidden" name="p_civil_rep_socie_fk" value="{civil_rep_socie}" /><input type="hidden" name="p_civil_rep_socie_fk_desc" value="{civil_rep_socie_desc}" />
</xsl:if>
<xsl:if test="res_rep_socie">
<xsl:if test="not(res_rep_socie/@visible)">
<td><xsl:value-of select="res_rep_socie_desc" /><input type="hidden" name="p_res_rep_socie_fk" value="{res_rep_socie}" /><input type="hidden" name="p_res_rep_socie_fk_desc" value="{res_rep_socie_desc}" /></td>
</xsl:if>
</xsl:if>
<xsl:if test="res_rep_socie/@visible='false'">
<input type="hidden" name="p_res_rep_socie_fk" value="{res_rep_socie}" /><input type="hidden" name="p_res_rep_socie_fk_desc" value="{res_rep_socie_desc}" />
</xsl:if>
<xsl:if test="doc_rep_socie">
<xsl:if test="not(doc_rep_socie/@visible)">
<td><xsl:value-of select="doc_rep_socie_desc" /><input type="hidden" name="p_doc_rep_socie_fk" value="{doc_rep_socie}" /><input type="hidden" name="p_doc_rep_socie_fk_desc" value="{doc_rep_socie_desc}" /></td>
</xsl:if>
</xsl:if>
<xsl:if test="doc_rep_socie/@visible='false'">
<input type="hidden" name="p_doc_rep_socie_fk" value="{doc_rep_socie}" /><input type="hidden" name="p_doc_rep_socie_fk_desc" value="{doc_rep_socie_desc}" />
</xsl:if>
<xsl:if test="n_doc_rep_socie">
<xsl:if test="not(n_doc_rep_socie/@visible)">
<td><xsl:value-of select="n_doc_rep_socie_desc" /><input type="hidden" name="p_n_doc_rep_socie_fk" value="{n_doc_rep_socie}" /><input type="hidden" name="p_n_doc_rep_socie_fk_desc" value="{n_doc_rep_socie_desc}" /></td>
</xsl:if>
</xsl:if>
<xsl:if test="n_doc_rep_socie/@visible='false'">
<input type="hidden" name="p_n_doc_rep_socie_fk" value="{n_doc_rep_socie}" /><input type="hidden" name="p_n_doc_rep_socie_fk_desc" value="{n_doc_rep_socie_desc}" />
</xsl:if>
<xsl:if test="data_emi_rep_socie">
<xsl:if test="not(data_emi_rep_socie/@visible)">
<td><xsl:value-of select="data_emi_rep_socie_desc" /><input type="hidden" name="p_data_emi_rep_socie_fk" value="{data_emi_rep_socie}" /><input type="hidden" name="p_data_emi_rep_socie_fk_desc" value="{data_emi_rep_socie_desc}" /></td>
</xsl:if>
</xsl:if>
<xsl:if test="data_emi_rep_socie/@visible='false'">
<input type="hidden" name="p_data_emi_rep_socie_fk" value="{data_emi_rep_socie}" /><input type="hidden" name="p_data_emi_rep_socie_fk_desc" value="{data_emi_rep_socie_desc}" />
</xsl:if>
<xsl:if test="data_val_rep_socie">
<xsl:if test="not(data_val_rep_socie/@visible)">
<td><xsl:value-of select="data_val_rep_socie_desc" /><input type="hidden" name="p_data_val_rep_socie_fk" value="{data_val_rep_socie}" /><input type="hidden" name="p_data_val_rep_socie_fk_desc" value="{data_val_rep_socie_desc}" /></td>
</xsl:if>
</xsl:if>
<xsl:if test="data_val_rep_socie/@visible='false'">
<input type="hidden" name="p_data_val_rep_socie_fk" value="{data_val_rep_socie}" /><input type="hidden" name="p_data_val_rep_socie_fk_desc" value="{data_val_rep_socie_desc}" />
</xsl:if>
<xsl:if test="emissor_rep_socie">
<xsl:if test="not(emissor_rep_socie/@visible)">
<td><xsl:value-of select="emissor_rep_socie_desc" /><input type="hidden" name="p_emissor_rep_socie_fk" value="{emissor_rep_socie}" /><input type="hidden" name="p_emissor_rep_socie_fk_desc" value="{emissor_rep_socie_desc}" /></td>
</xsl:if>
</xsl:if>
<xsl:if test="emissor_rep_socie/@visible='false'">
<input type="hidden" name="p_emissor_rep_socie_fk" value="{emissor_rep_socie}" /><input type="hidden" name="p_emissor_rep_socie_fk_desc" value="{emissor_rep_socie_desc}" />
</xsl:if>
<xsl:if test="docu_rep_socie">
<xsl:if test="not(docu_rep_socie/@visible)">
<td><xsl:value-of select="docu_rep_socie_desc" /><input type="hidden" name="p_docu_rep_socie_fk" value="{docu_rep_socie}" /><input type="hidden" name="p_docu_rep_socie_fk_desc" value="{docu_rep_socie_desc}" /></td>
</xsl:if>
</xsl:if>
<xsl:if test="docu_rep_socie/@visible='false'">
<input type="hidden" name="p_docu_rep_socie_fk" value="{docu_rep_socie}" /><input type="hidden" name="p_docu_rep_socie_fk_desc" value="{docu_rep_socie_desc}" />
</xsl:if>
<xsl:if test="anexo_socie">
<xsl:if test="not(anexo_socie/@visible)">
<td><xsl:choose><xsl:when test="anexo_socie != ''"><a href="{anexo_socie}" class="_blank"><xsl:value-of select="anexo_socie_desc" /></a></xsl:when><xsl:otherwise><xsl:value-of select="anexo_socie_desc" /></xsl:otherwise></xsl:choose><input type="hidden" name="p_anexo_socie_fk" value="{anexo_socie}" /><input type="hidden" name="p_anexo_socie_fk_desc" value="{anexo_socie_desc}" /></td>
</xsl:if>
</xsl:if>
<xsl:if test="anexo_socie/@visible='false'">
<input type="hidden" name="p_anexo_socie_fk" value="{anexo_socie}" /><input type="hidden" name="p_anexo_socie_fk_desc" value="{anexo_socie_desc}" />
</xsl:if>
<xsl:if test="emi_doc_socie">
<xsl:if test="not(emi_doc_socie/@visible)">
<td><xsl:value-of select="emi_doc_socie_desc" /><input type="hidden" name="p_emi_doc_socie_fk" value="{emi_doc_socie}" /><input type="hidden" name="p_emi_doc_socie_fk_desc" value="{emi_doc_socie_desc}" /></td>
</xsl:if>
</xsl:if>
<xsl:if test="emi_doc_socie/@visible='false'">
<input type="hidden" name="p_emi_doc_socie_fk" value="{emi_doc_socie}" /><input type="hidden" name="p_emi_doc_socie_fk_desc" value="{emi_doc_socie_desc}" />
</xsl:if>
<xsl:if test="data_emi_doc_socie">
<xsl:if test="not(data_emi_doc_socie/@visible)">
<td><xsl:value-of select="data_emi_doc_socie_desc" /><input type="hidden" name="p_data_emi_doc_socie_fk" value="{data_emi_doc_socie}" /><input type="hidden" name="p_data_emi_doc_socie_fk_desc" value="{data_emi_doc_socie_desc}" /></td>
</xsl:if>
</xsl:if>
<xsl:if test="data_emi_doc_socie/@visible='false'">
<input type="hidden" name="p_data_emi_doc_socie_fk" value="{data_emi_doc_socie}" /><input type="hidden" name="p_data_emi_doc_socie_fk_desc" value="{data_emi_doc_socie_desc}" />
</xsl:if>
<td align="center" width="10">
<input type="hidden" name="p_separador_colectiva_id" value="{separador_colectiva_id}" /><input type="hidden" name="p_nac_socio__socie_id_fk" value="{nac_socio__socie_id}" /><input type="hidden" name="p_nac_socio__socie_id_fk_desc" value="{nac_socio__socie_id_desc}" /><input type="hidden" name="p_cargo_socie_fk" value="{cargo_socie}" /><input type="hidden" name="p_cargo_socie_fk_desc" value="{cargo_socie_desc}" /><input type="hidden" name="p_obriga_socio_socie_fk" value="{obriga_socio_socie}" /><input type="hidden" name="p_obriga_socio_socie_fk_desc" value="{obriga_socio_socie_desc}" />
<xsl:if test="not(@nodelete)"><img alt="apagar" src="{$path}/img/icon/ctx-delete.png" class="IGRP_delRow" rel="separador_colectiva"/>
</xsl:if></td>
<td align="center" width="10">
<xsl:if test="not(@noupdate)"><img alt="editar" src="{$path}/img/icon/edit.png" class="IGRP_editRow" rel="separador_colectiva"/>
</xsl:if></td>
</tr>
</xsl:for-each>
</tbody>
<!--RODAPE DA TABELA -->
<tfoot><tr>
<xsl:if test="rows/content/form/table/separador_colectiva/label/quota_socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/quota_socie/@visible)">
<td></td>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/accao_socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/accao_socie/@visible)">
<td></td>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/admin_socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/admin_socie/@visible)">
<td></td>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/gerente__socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/gerente__socie/@visible)">
<td></td>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/pesq_bi_socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/pesq_bi_socie/@visible)">
<td></td>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/pesq_nif_socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/pesq_nif_socie/@visible)">
<td></td>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/nif_socio__socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/nif_socio__socie/@visible)">
<td></td>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/nome_socio__socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/nome_socio__socie/@visible)">
<td></td>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/nac_socio__socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/nac_socio__socie/@visible)">
<td></td>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/doc_socio__socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/doc_socio__socie/@visible)">
<td></td>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/n_doc_socio__socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/n_doc_socio__socie/@visible)">
<td></td>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/data_nasc_socio">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/data_nasc_socio/@visible)">
<td></td>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/emi_socio__socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/emi_socio__socie/@visible)">
<td></td>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/dt_emi_socio_socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/dt_emi_socio_socie/@visible)">
<td></td>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/dt_val_socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/dt_val_socie/@visible)">
<td></td>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/res_socio_socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/res_socio_socie/@visible)">
<td></td>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/est_civil_socio_socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/est_civil_socio_socie/@visible)">
<td></td>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/regime_bens_socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/regime_bens_socie/@visible)">
<td></td>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/conjuge_socio_socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/conjuge_socio_socie/@visible)">
<td></td>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/email">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/email/@visible)">
<td></td>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/inscricao_ajec">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/inscricao_ajec/@visible)">
<td></td>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/pesq_rep_socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/pesq_rep_socie/@visible)">
<td></td>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/nome_rep_socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/nome_rep_socie/@visible)">
<td></td>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/civil_rep_socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/civil_rep_socie/@visible)">
<td></td>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/res_rep_socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/res_rep_socie/@visible)">
<td></td>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/doc_rep_socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/doc_rep_socie/@visible)">
<td></td>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/n_doc_rep_socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/n_doc_rep_socie/@visible)">
<td></td>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/data_emi_rep_socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/data_emi_rep_socie/@visible)">
<td></td>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/data_val_rep_socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/data_val_rep_socie/@visible)">
<td></td>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/emissor_rep_socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/emissor_rep_socie/@visible)">
<td></td>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/docu_rep_socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/docu_rep_socie/@visible)">
<td></td>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/anexo_socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/anexo_socie/@visible)">
<td></td>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/emi_doc_socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/emi_doc_socie/@visible)">
<td></td>
</xsl:if>
</xsl:if>
<xsl:if test="rows/content/form/table/separador_colectiva/label/data_emi_doc_socie">
<xsl:if test="not(rows/content/form/table/separador_colectiva/label/data_emi_doc_socie/@visible)">
<td></td>
</xsl:if>
</xsl:if>
<td align="center" width="10"></td>
<td align="center" width="10"></td>
</tr></tfoot>
</table>
<!--LEGENDA FINAL DA TABELA -->
<xsl:apply-templates mode="legend_color" select="rows/content/form/table/separador_colectiva/legend_color"/>
</div>
<!--FIM DA TABELA-->
</xsl:if>
</div>
<!-- "FORM" devo fachar DIV_SEPARATOR aqui-->
</form>
</div>
<!--END FORM-->


     </div>


        <!-- END YOUR CODE HERE -->
<!-- START HOME BOTTOM -->

      </div>
      <xsl:call-template name="home-side"/>
      </div></div>

        </body>

        </html>

        <!-- END HOME BOTTOM -->
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=201308292"/>

<xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=201308292"/>

</xsl:stylesheet>