<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <style/>
            </head>
            <body class="{$bodyClass} sidebar-off">
                <xsl:call-template name="IGRP-topmenu"/>
                <form method="POST" class="IGRP-form" name="formular_default" enctype="multipart/form-data">
                    <div class="container-fluid">
                        <div class="row">
                            <xsl:call-template name="IGRP-sidebar"/>
                            <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
                                <div class="content">
                                    <div class="row row-msg">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row " id="row-97108755">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/sectionheader_1">
                                                    <section class="content-header gen-container-item " gen-class="" item-name="sectionheader_1">
                                                        <h2>
                                                            <xsl:value-of select="rows/content/sectionheader_1/fields/sectionheader_1_text/value"/>
                                                        </h2>
                                                    </section>
                                                </xsl:if>
                                                <xsl:if test="rows/content/form_1">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                                                <xsl:if test="rows/content/form_1/fields/tipo_da_tarefa">
                                                                    <div class="form-group col-sm-3   gen-fields-holder" item-name="tipo_da_tarefa" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/tipo_da_tarefa/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/tipo_da_tarefa/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/tipo_da_tarefa/value}" class="form-control " id="{rows/content/form_1/fields/tipo_da_tarefa/@name}" name="{rows/content/form_1/fields/tipo_da_tarefa/@name}" readonly="readonly" disabled="disabled" maxlength="30" placeholder="">
                                                                            <xsl:call-template name="setAttributes">
                                                                                <xsl:with-param name="field" select="rows/content/form_1/fields/tipo_da_tarefa"/>
                                                                            </xsl:call-template>
                                                                        </input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/data_criacao_da_tarefa">
                                                                    <div class="form-group col-sm-3   gen-fields-holder" item-name="data_criacao_da_tarefa" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/data_criacao_da_tarefa/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/data_criacao_da_tarefa/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/data_criacao_da_tarefa/value}" class="form-control " id="{rows/content/form_1/fields/data_criacao_da_tarefa/@name}" name="{rows/content/form_1/fields/data_criacao_da_tarefa/@name}" readonly="readonly" disabled="disabled" maxlength="30" placeholder="">
                                                                            <xsl:call-template name="setAttributes">
                                                                                <xsl:with-param name="field" select="rows/content/form_1/fields/data_criacao_da_tarefa"/>
                                                                            </xsl:call-template>
                                                                        </input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/data_inicio_da_tarefa">
                                                                    <div class="form-group col-sm-3   gen-fields-holder" item-name="data_inicio_da_tarefa" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/data_inicio_da_tarefa/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/data_inicio_da_tarefa/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/data_inicio_da_tarefa/value}" class="form-control " id="{rows/content/form_1/fields/data_inicio_da_tarefa/@name}" name="{rows/content/form_1/fields/data_inicio_da_tarefa/@name}" readonly="readonly" disabled="disabled" maxlength="30" placeholder="">
                                                                            <xsl:call-template name="setAttributes">
                                                                                <xsl:with-param name="field" select="rows/content/form_1/fields/data_inicio_da_tarefa"/>
                                                                            </xsl:call-template>
                                                                        </input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/data_fim_da_tarefa">
                                                                    <div class="form-group col-sm-3   gen-fields-holder" item-name="data_fim_da_tarefa" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/data_fim_da_tarefa/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/data_fim_da_tarefa/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/data_fim_da_tarefa/value}" class="form-control " id="{rows/content/form_1/fields/data_fim_da_tarefa/@name}" name="{rows/content/form_1/fields/data_fim_da_tarefa/@name}" readonly="readonly" disabled="disabled" maxlength="30" placeholder="">
                                                                            <xsl:call-template name="setAttributes">
                                                                                <xsl:with-param name="field" select="rows/content/form_1/fields/data_fim_da_tarefa"/>
                                                                            </xsl:call-template>
                                                                        </input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/prioridade_da_tarefa">
                                                                    <div class="form-group col-sm-3   gen-fields-holder" item-name="prioridade_da_tarefa" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/prioridade_da_tarefa/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/prioridade_da_tarefa/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/prioridade_da_tarefa/value}" class="form-control " id="{rows/content/form_1/fields/prioridade_da_tarefa/@name}" name="{rows/content/form_1/fields/prioridade_da_tarefa/@name}" readonly="readonly" disabled="disabled" maxlength="30" placeholder="">
                                                                            <xsl:call-template name="setAttributes">
                                                                                <xsl:with-param name="field" select="rows/content/form_1/fields/prioridade_da_tarefa"/>
                                                                            </xsl:call-template>
                                                                        </input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/tarefa_atribuida_por">
                                                                    <div class="form-group col-sm-3   gen-fields-holder" item-name="tarefa_atribuida_por" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/tarefa_atribuida_por/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/tarefa_atribuida_por/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/tarefa_atribuida_por/value}" class="form-control " id="{rows/content/form_1/fields/tarefa_atribuida_por/@name}" name="{rows/content/form_1/fields/tarefa_atribuida_por/@name}" readonly="readonly" disabled="disabled" maxlength="30" placeholder="">
                                                                            <xsl:call-template name="setAttributes">
                                                                                <xsl:with-param name="field" select="rows/content/form_1/fields/tarefa_atribuida_por"/>
                                                                            </xsl:call-template>
                                                                        </input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/tarefa_atribuida_a">
                                                                    <div class="form-group col-sm-3   gen-fields-holder" item-name="tarefa_atribuida_a" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/tarefa_atribuida_a/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/tarefa_atribuida_a/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/tarefa_atribuida_a/value}" class="form-control " id="{rows/content/form_1/fields/tarefa_atribuida_a/@name}" name="{rows/content/form_1/fields/tarefa_atribuida_a/@name}" readonly="readonly" disabled="disabled" maxlength="30" placeholder="">
                                                                            <xsl:call-template name="setAttributes">
                                                                                <xsl:with-param name="field" select="rows/content/form_1/fields/tarefa_atribuida_a"/>
                                                                            </xsl:call-template>
                                                                        </input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/tipo_de_processo">
                                                                    <div class="form-group col-sm-3   gen-fields-holder" item-name="tipo_de_processo" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/tipo_de_processo/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/tipo_de_processo/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/tipo_de_processo/value}" class="form-control " id="{rows/content/form_1/fields/tipo_de_processo/@name}" name="{rows/content/form_1/fields/tipo_de_processo/@name}" readonly="readonly" disabled="disabled" maxlength="30" placeholder="">
                                                                            <xsl:call-template name="setAttributes">
                                                                                <xsl:with-param name="field" select="rows/content/form_1/fields/tipo_de_processo"/>
                                                                            </xsl:call-template>
                                                                        </input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/numero_de_processo">
                                                                    <div class="form-group col-sm-3   gen-fields-holder" item-name="numero_de_processo" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/numero_de_processo/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/numero_de_processo/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/numero_de_processo/value}" class="form-control " id="{rows/content/form_1/fields/numero_de_processo/@name}" name="{rows/content/form_1/fields/numero_de_processo/@name}" readonly="readonly" disabled="disabled" maxlength="30" placeholder="">
                                                                            <xsl:call-template name="setAttributes">
                                                                                <xsl:with-param name="field" select="rows/content/form_1/fields/numero_de_processo"/>
                                                                            </xsl:call-template>
                                                                        </input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/data_criacao_de_processo">
                                                                    <div class="form-group col-sm-3   gen-fields-holder" item-name="data_criacao_de_processo" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/data_criacao_de_processo/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/data_criacao_de_processo/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/data_criacao_de_processo/value}" class="form-control " id="{rows/content/form_1/fields/data_criacao_de_processo/@name}" name="{rows/content/form_1/fields/data_criacao_de_processo/@name}" readonly="readonly" disabled="disabled" maxlength="30" placeholder="">
                                                                            <xsl:call-template name="setAttributes">
                                                                                <xsl:with-param name="field" select="rows/content/form_1/fields/data_criacao_de_processo"/>
                                                                            </xsl:call-template>
                                                                        </input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/data_inicio_de_processo">
                                                                    <div class="form-group col-sm-3   gen-fields-holder" item-name="data_inicio_de_processo" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/data_inicio_de_processo/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/data_inicio_de_processo/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/data_inicio_de_processo/value}" class="form-control " id="{rows/content/form_1/fields/data_inicio_de_processo/@name}" name="{rows/content/form_1/fields/data_inicio_de_processo/@name}" readonly="readonly" disabled="disabled" maxlength="30" placeholder="">
                                                                            <xsl:call-template name="setAttributes">
                                                                                <xsl:with-param name="field" select="rows/content/form_1/fields/data_inicio_de_processo"/>
                                                                            </xsl:call-template>
                                                                        </input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/data_fim_processo">
                                                                    <div class="form-group col-sm-3   gen-fields-holder" item-name="data_fim_processo" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/data_fim_processo/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/data_fim_processo/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/data_fim_processo/value}" class="form-control " id="{rows/content/form_1/fields/data_fim_processo/@name}" name="{rows/content/form_1/fields/data_fim_processo/@name}" readonly="readonly" disabled="disabled" maxlength="30" placeholder="">
                                                                            <xsl:call-template name="setAttributes">
                                                                                <xsl:with-param name="field" select="rows/content/form_1/fields/data_fim_processo"/>
                                                                            </xsl:call-template>
                                                                        </input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/descricao_da_tarefa">
                                                                    <div class="form-group col-sm-3  gen-fields-holder" item-name="descricao_da_tarefa" item-type="textarea">
                                                                        <label for="{rows/content/form_1/fields/descricao_da_tarefa/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/descricao_da_tarefa/label"/>
                                                                        </label>
                                                                        <textarea name="{rows/content/form_1/fields/descricao_da_tarefa/@name}" class="textarea form-control " maxlength="30">
                                                                            <xsl:call-template name="setAttributes">
                                                                                <xsl:with-param name="field" select="rows/content/form_1/fields/descricao_da_tarefa"/>
                                                                            </xsl:call-template>
                                                                            <xsl:value-of select="rows/content/form_1/fields/descricao_da_tarefa/value"/>
                                                                        </textarea>
                                                                    </div>
                                                                </xsl:if>
                                                            </div>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <xsl:call-template name="IGRP-bottom"/>
                </form>
                <!-- FORM JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js?v={$version}"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1515664208567"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1515664208567"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1515664208567"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1515664208567"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1515664208567"/>
</xsl:stylesheet>
