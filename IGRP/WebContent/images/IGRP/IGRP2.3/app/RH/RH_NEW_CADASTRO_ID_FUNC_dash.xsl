<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- VIEW CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/view/igrp.view.css"/>
                <!-- FORM CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/form/igrp.forms.css"/>
                <!-- TABLE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>
                <!-- DATE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/datetimepicker/css/datetimepicker.css"/>
                <style>.box-head.subtitle{  color:#4496C1}</style>
            </head>
            <body class="{$bodyClass} sidebar-off">
                <xsl:call-template name="IGRP-topmenu"/>
                <form method="POST" class="IGRP-form" name="formular_default" enctype="multipart/form-data">
                    <div class="container-fluid">
                        <div class="row">
                            <xsl:call-template name="IGRP-sidebar"/>
                            <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
                                <div class="content">
                                    <div class="row">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="gen-column col-md-6">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/page_title">
                                                    <section class="content-header gen-container-item " gen-class="" item-name="page_title">
                                                        <h2>
                                                            <xsl:value-of select="rows/content/page_title/fields/page_title_text/value"/>
                                                        </h2>
                                                    </section>
                                                </xsl:if>
                                                <xsl:if test="rows/content/view_1">
                                                    <div class="box clearfix view-block gen-container-item " has-img="true" gen-class="" item-name="view_1">
                                                        <div class="box-body">
                                                            <xsl:if test="rows/content/view_1/fields/view_img">
                                                                <img src="{rows/content/view_1/fields/view_img}"/>
                                                            </xsl:if>
                                                            <div class="view-body clearfix ">
                                                                <xsl:if test="rows/content/view_1/fields/nome_completo">
                                                                    <div class="view-item gen-fields-holder">
                                                                        <span class="view-label">
                                                                            <xsl:value-of select="rows/content/view_1/fields/nome_completo/label"/>
                                                                        </span>
                                                                        <span class="view-value">
                                                                            <xsl:value-of select="rows/content/view_1/fields/nome_completo/value"/>
                                                                        </span>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/view_1/fields/nascido_em">
                                                                    <div class="view-item gen-fields-holder">
                                                                        <span class="view-label">
                                                                            <xsl:value-of select="rows/content/view_1/fields/nascido_em/label"/>
                                                                        </span>
                                                                        <span class="view-value">
                                                                            <xsl:value-of select="rows/content/view_1/fields/nascido_em/value"/>
                                                                        </span>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/view_1/fields/estado_civil">
                                                                    <div class="view-item gen-fields-holder">
                                                                        <span class="view-label">
                                                                            <xsl:value-of select="rows/content/view_1/fields/estado_civil/label"/>
                                                                        </span>
                                                                        <span class="view-value">
                                                                            <xsl:value-of select="rows/content/view_1/fields/estado_civil/value"/>
                                                                        </span>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/view_1/fields/sexo">
                                                                    <div class="view-item gen-fields-holder">
                                                                        <span class="view-label">
                                                                            <xsl:value-of select="rows/content/view_1/fields/sexo/label"/>
                                                                        </span>
                                                                        <span class="view-value">
                                                                            <xsl:value-of select="rows/content/view_1/fields/sexo/value"/>
                                                                        </span>
                                                                    </div>
                                                                </xsl:if>
                                                            </div>
                                                            <!-- <div class="view-buttons clearfix"  gen-id="drop-zone" gen-only-type="button" gen-field-template="button"></div> -->
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/form_1">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                                                <xsl:if test="rows/content/form_1/fields/mae">
                                                                    <div class="form-group col-md-6   gen-fields-holder" item-name="mae" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/mae/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/mae/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/mae/value}" class="form-control " id="{rows/content/form_1/fields/mae/@name}" name="{rows/content/form_1/fields/mae/@name}" readonly="readonly" maxlength="30" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/pai">
                                                                    <div class="form-group col-md-6   gen-fields-holder" item-name="pai" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/pai/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/pai/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/pai/value}" class="form-control " id="{rows/content/form_1/fields/pai/@name}" name="{rows/content/form_1/fields/pai/@name}" readonly="readonly" maxlength="100" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/nacionalidade">
                                                                    <div class="form-group col-md-6   gen-fields-holder" item-name="nacionalidade" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/nacionalidade/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/nacionalidade/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/nacionalidade/value}" class="form-control " id="{rows/content/form_1/fields/nacionalidade/@name}" name="{rows/content/form_1/fields/nacionalidade/@name}" readonly="readonly" maxlength="30" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/naturalidade">
                                                                    <div class="form-group col-md-6   gen-fields-holder" item-name="naturalidade" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/naturalidade/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/naturalidade/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/naturalidade/value}" class="form-control " id="{rows/content/form_1/fields/naturalidade/@name}" name="{rows/content/form_1/fields/naturalidade/@name}" readonly="readonly" maxlength="30" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/situacao_atual">
                                                                    <div class="form-group col-md-6   gen-fields-holder" item-name="situacao_atual" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/situacao_atual/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/situacao_atual/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/situacao_atual/value}" class="form-control " id="{rows/content/form_1/fields/situacao_atual/@name}" name="{rows/content/form_1/fields/situacao_atual/@name}" readonly="readonly" maxlength="30" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/contactos">
                                                                    <div class="box-head subtitle gen-fields-holder">
                                                                        <xsl:value-of select="rows/content/form_1/fields/contactos/label"/>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/email">
                                                                    <div class="form-group col-md-6   gen-fields-holder" item-name="email" item-type="email">
                                                                        <label for="{rows/content/form_1/fields/email/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/email/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="email" value="{rows/content/form_1/fields/email/value}" class="form-control " id="{rows/content/form_1/fields/email/@name}" name="{rows/content/form_1/fields/email/@name}" maxlength="30" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/telefone">
                                                                    <div class="form-group col-md-6   gen-fields-holder" item-name="telefone" item-type="number">
                                                                        <label for="{rows/content/form_1/fields/telefone/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/telefone/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="number" value="{rows/content/form_1/fields/telefone/value}" class="form-control " id="{rows/content/form_1/fields/telefone/@name}" name="{rows/content/form_1/fields/telefone/@name}" maxlength="30" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/morada">
                                                                    <div class="form-group col-md-6   gen-fields-holder" item-name="morada" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/morada/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/morada/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/morada/value}" class="form-control " id="{rows/content/form_1/fields/morada/@name}" name="{rows/content/form_1/fields/morada/@name}" maxlength="30" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/telemovel">
                                                                    <div class="form-group col-md-6   gen-fields-holder" item-name="telemovel" item-type="number">
                                                                        <label for="{rows/content/form_1/fields/telemovel/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/telemovel/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="number" value="{rows/content/form_1/fields/telemovel/value}" class="form-control " id="{rows/content/form_1/fields/telemovel/@name}" name="{rows/content/form_1/fields/telemovel/@name}" maxlength="30" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                            </div>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/gen_table">
                                                    <div class="box box-table-contents gen-container-item " gen-class="" item-name="gen_table">
                                                        <div class="box-body table-box">
                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/gen_table/fields"/>
                                                            <table id="gen_table" class="table table-striped gen-data-table " exports="null">
                                                                <thead>
                                                                    <tr></tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/gen_table/table/value/row">
                                                                        <tr>
                                                                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                                        </tr>
                                                                    </xsl:for-each>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                        <div class="gen-column col-md-6">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/form_2">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_2">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_2/fields"/>
                                                                <xsl:if test="rows/content/form_2/fields/dados_bancarios">
                                                                    <div class="box-head subtitle gen-fields-holder">
                                                                        <xsl:value-of select="rows/content/form_2/fields/dados_bancarios/label"/>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_2/fields/nib">
                                                                    <div class="form-group col-md-6   gen-fields-holder" item-name="nib" item-type="number">
                                                                        <label for="{rows/content/form_2/fields/nib/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_2/fields/nib/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="number" value="{rows/content/form_2/fields/nib/value}" class="form-control " id="{rows/content/form_2/fields/nib/@name}" name="{rows/content/form_2/fields/nib/@name}" readonly="readonly" maxlength="21" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_2/fields/numero_de_conta">
                                                                    <div class="form-group col-md-6   gen-fields-holder" item-name="numero_de_conta" item-type="number">
                                                                        <label for="{rows/content/form_2/fields/numero_de_conta/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_2/fields/numero_de_conta/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="number" value="{rows/content/form_2/fields/numero_de_conta/value}" class="form-control " id="{rows/content/form_2/fields/numero_de_conta/@name}" name="{rows/content/form_2/fields/numero_de_conta/@name}" readonly="readonly" maxlength="15" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_2/fields/dados_bi">
                                                                    <div class="box-head subtitle gen-fields-holder">
                                                                        <xsl:value-of select="rows/content/form_2/fields/dados_bi/label"/>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_2/fields/bilhete_de_identidade">
                                                                    <div class="form-group col-md-6   gen-fields-holder" item-name="bilhete_de_identidade" item-type="number">
                                                                        <label for="{rows/content/form_2/fields/bilhete_de_identidade/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_2/fields/bilhete_de_identidade/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="number" value="{rows/content/form_2/fields/bilhete_de_identidade/value}" class="form-control " id="{rows/content/form_2/fields/bilhete_de_identidade/@name}" name="{rows/content/form_2/fields/bilhete_de_identidade/@name}" readonly="readonly" maxlength="30" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_2/fields/local_de_emissao_do_bi">
                                                                    <div class="form-group col-md-6   gen-fields-holder" item-name="local_de_emissao_do_bi" item-type="text">
                                                                        <label for="{rows/content/form_2/fields/local_de_emissao_do_bi/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_2/fields/local_de_emissao_do_bi/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_2/fields/local_de_emissao_do_bi/value}" class="form-control " id="{rows/content/form_2/fields/local_de_emissao_do_bi/@name}" name="{rows/content/form_2/fields/local_de_emissao_do_bi/@name}" maxlength="30" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_2/fields/emitido_em_bi">
                                                                    <div class="form-group col-md-6  gen-fields-holder" item-name="emitido_em_bi" item-type="date">
                                                                        <label for="{rows/content/form_2/fields/emitido_em_bi/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_2/fields/emitido_em_bi/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_2/fields/emitido_em_bi/value}" class="form-control gen-date " id="form_2-emitido_em_bi" name="{rows/content/form_2/fields/emitido_em_bi/@name}" format="IGRP_datePicker" maxlength="30"/>
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-default">
                                                                                    <i class="fa fa-calendar"/>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_2/fields/valido_ate_bi">
                                                                    <div class="form-group col-md-6  gen-fields-holder" item-name="valido_ate_bi" item-type="date">
                                                                        <label for="{rows/content/form_2/fields/valido_ate_bi/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_2/fields/valido_ate_bi/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_2/fields/valido_ate_bi/value}" class="form-control gen-date " id="form_2-valido_ate_bi" name="{rows/content/form_2/fields/valido_ate_bi/@name}" format="IGRP_datePicker" maxlength="30"/>
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-default">
                                                                                    <i class="fa fa-calendar"/>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_2/fields/dados_passaporte">
                                                                    <div class="box-head subtitle gen-fields-holder">
                                                                        <xsl:value-of select="rows/content/form_2/fields/dados_passaporte/label"/>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_2/fields/passaporte">
                                                                    <div class="form-group col-md-6   gen-fields-holder" item-name="passaporte" item-type="text">
                                                                        <label for="{rows/content/form_2/fields/passaporte/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_2/fields/passaporte/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_2/fields/passaporte/value}" class="form-control " id="{rows/content/form_2/fields/passaporte/@name}" name="{rows/content/form_2/fields/passaporte/@name}" maxlength="30" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_2/fields/pais_de_emissao">
                                                                    <div class="form-group col-md-6   gen-fields-holder" item-name="pais_de_emissao" item-type="text">
                                                                        <label for="{rows/content/form_2/fields/pais_de_emissao/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_2/fields/pais_de_emissao/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_2/fields/pais_de_emissao/value}" class="form-control " id="{rows/content/form_2/fields/pais_de_emissao/@name}" name="{rows/content/form_2/fields/pais_de_emissao/@name}" maxlength="30" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_2/fields/emitido_em">
                                                                    <div class="form-group col-md-6  gen-fields-holder" item-name="emitido_em" item-type="date">
                                                                        <label for="{rows/content/form_2/fields/emitido_em/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_2/fields/emitido_em/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_2/fields/emitido_em/value}" class="form-control gen-date " id="form_2-emitido_em" name="{rows/content/form_2/fields/emitido_em/@name}" format="IGRP_datePicker" maxlength="30"/>
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-default">
                                                                                    <i class="fa fa-calendar"/>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_2/fields/valido_ate">
                                                                    <div class="form-group col-md-6  gen-fields-holder" item-name="valido_ate" item-type="date">
                                                                        <label for="{rows/content/form_2/fields/valido_ate/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_2/fields/valido_ate/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_2/fields/valido_ate/value}" class="form-control gen-date " id="form_2-valido_ate" name="{rows/content/form_2/fields/valido_ate/@name}" format="IGRP_datePicker" maxlength="30"/>
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-default">
                                                                                    <i class="fa fa-calendar"/>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_2/fields/outros_dados">
                                                                    <div class="box-head subtitle gen-fields-holder">
                                                                        <xsl:value-of select="rows/content/form_2/fields/outros_dados/label"/>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_2/fields/nif">
                                                                    <div class="form-group col-md-6   gen-fields-holder" item-name="nif" item-type="number">
                                                                        <label for="{rows/content/form_2/fields/nif/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_2/fields/nif/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="number" value="{rows/content/form_2/fields/nif/value}" class="form-control " id="{rows/content/form_2/fields/nif/@name}" name="{rows/content/form_2/fields/nif/@name}" maxlength="30" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_2/fields/inps">
                                                                    <div class="form-group col-md-6   gen-fields-holder" item-name="inps" item-type="number">
                                                                        <label for="{rows/content/form_2/fields/inps/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_2/fields/inps/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="number" value="{rows/content/form_2/fields/inps/value}" class="form-control " id="{rows/content/form_2/fields/inps/@name}" name="{rows/content/form_2/fields/inps/@name}" maxlength="30" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                            </div>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/form_2/tools-bar" mode="form-buttons"/>
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
                <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js"/>
                <!-- DATE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/datetimepicker.js"/>
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/dtp.init.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1491561858065"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1491561858065"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1491561858065"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1491561858065"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1491561858066"/>
    <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1491561858066"/>
</xsl:stylesheet>