<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- FORM CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/form/igrp.forms.css"/>
                <!-- SEPARATORLIST CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/separatorlist/igrp.separatorlist.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css"/>
                <!-- TABLE CSS INCLUDES -->
                <!-- SELECT CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.min.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.style.css"/>
                <!-- DATE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/datetimepicker/css/datetimepicker.css"/>
                <style/>
            </head>
            <body class="{$bodyClass}">
                <xsl:call-template name="IGRP-topmenu"/>
                <form method="POST" class="IGRP-form" name="formular_default">
                    <div class="container-fluid">
                        <div class="row">
                            <xsl:call-template name="IGRP-sidebar"/>
                            <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
                                <div class="content">
                                    <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                                    <div class="row">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/page_title">
                                                    <section class="content-header gen-container-item " item-name="page_title">
                                                        <h1>
                                                            <xsl:value-of select="rows/content/page_title/fields/page_title_text/value"/>
                                                        </h1>
                                                    </section>
                                                </xsl:if>
                                                <xsl:if test="rows/content/gen_table">
                                                    <div class="box box-table-contents gen-container-item " item-name="gen_table">
                                                        <div class="box-body table-box">
                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/gen_table/fields"/>
                                                            <table id="gen_table" class="table table-striped gen-data-table ">
                                                                <thead>
                                                                    <tr/>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/gen_table/table/value/row">
                                                                        <tr></tr>
                                                                    </xsl:for-each>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/form_1">
                                                    <div class="box igrp-forms gen-container-item " item-name="form_1">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/form_1/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                                                <xsl:if test="rows/content/form_1/fields/predio">
                                                                    <div class="box-head subtitle gen-fields-holder">
                                                                        <xsl:value-of select="rows/content/form_1/fields/predio/label"/>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/ident_predio">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="ident_predio" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/ident_predio/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/ident_predio/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_ident_predio" name="{rows/content/form_1/fields/ident_predio/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/ident_predio/list/option">
                                                                                <option value="{value}" label="{text}">
                                                                                    <xsl:if test="@selected='true'">
                                                                                        <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                    </xsl:if>
                                                                                    <span>
                                                                                        <xsl:value-of select="text"/>
                                                                                    </span>
                                                                                </option>
                                                                            </xsl:for-each>
                                                                        </select>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/designacao_predio">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="designacao_predio" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/designacao_predio/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/designacao_predio/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/designacao_predio/value}" class="form-control" id="{rows/content/form_1/fields/designacao_predio/@name}" name="{rows/content/form_1/fields/designacao_predio/@name}" maxlength="255"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/natureza_pred">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="natureza_pred" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/natureza_pred/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/natureza_pred/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_natureza_pred" name="{rows/content/form_1/fields/natureza_pred/@name}" required="required">
                                                                            <xsl:for-each select="rows/content/form_1/fields/natureza_pred/list/option">
                                                                                <option value="{value}" label="{text}">
                                                                                    <xsl:if test="@selected='true'">
                                                                                        <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                    </xsl:if>
                                                                                    <span>
                                                                                        <xsl:value-of select="text"/>
                                                                                    </span>
                                                                                </option>
                                                                            </xsl:for-each>
                                                                        </select>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/finalidade">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="finalidade" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/finalidade/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/finalidade/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_finalidade" name="{rows/content/form_1/fields/finalidade/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/finalidade/list/option">
                                                                                <option value="{value}" label="{text}">
                                                                                    <xsl:if test="@selected='true'">
                                                                                        <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                    </xsl:if>
                                                                                    <span>
                                                                                        <xsl:value-of select="text"/>
                                                                                    </span>
                                                                                </option>
                                                                            </xsl:for-each>
                                                                        </select>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/valor_matricial">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="valor_matricial" item-type="number">
                                                                        <label for="{rows/content/form_1/fields/valor_matricial/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/valor_matricial/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="number" value="{rows/content/form_1/fields/valor_matricial/value}" class="form-control" id="{rows/content/form_1/fields/valor_matricial/@name}" name="{rows/content/form_1/fields/valor_matricial/@name}" maxlength="30"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/lugar_pred">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="lugar_pred" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/lugar_pred/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/lugar_pred/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_lugar_pred" name="{rows/content/form_1/fields/lugar_pred/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/lugar_pred/list/option">
                                                                                <option value="{value}" label="{text}">
                                                                                    <xsl:if test="@selected='true'">
                                                                                        <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                    </xsl:if>
                                                                                    <span>
                                                                                        <xsl:value-of select="text"/>
                                                                                    </span>
                                                                                </option>
                                                                            </xsl:for-each>
                                                                        </select>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/morada_pred">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="morada_pred" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/morada_pred/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/morada_pred/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/morada_pred/value}" class="form-control" id="{rows/content/form_1/fields/morada_pred/@name}" name="{rows/content/form_1/fields/morada_pred/@name}" maxlength="255"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/uni_medida">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="uni_medida" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/uni_medida/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/uni_medida/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_uni_medida" name="{rows/content/form_1/fields/uni_medida/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/uni_medida/list/option">
                                                                                <option value="{value}" label="{text}">
                                                                                    <xsl:if test="@selected='true'">
                                                                                        <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                    </xsl:if>
                                                                                    <span>
                                                                                        <xsl:value-of select="text"/>
                                                                                    </span>
                                                                                </option>
                                                                            </xsl:for-each>
                                                                        </select>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/area">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="area" item-type="number">
                                                                        <label for="{rows/content/form_1/fields/area/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/area/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="number" value="{rows/content/form_1/fields/area/value}" class="form-control" id="{rows/content/form_1/fields/area/@name}" name="{rows/content/form_1/fields/area/@name}" maxlength="30"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/nr_fracao">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="nr_fracao" item-type="number">
                                                                        <label for="{rows/content/form_1/fields/nr_fracao/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/nr_fracao/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="number" value="{rows/content/form_1/fields/nr_fracao/value}" class="form-control" id="{rows/content/form_1/fields/nr_fracao/@name}" name="{rows/content/form_1/fields/nr_fracao/@name}" maxlength="5"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/nr_piso">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="nr_piso" item-type="number">
                                                                        <label for="{rows/content/form_1/fields/nr_piso/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/nr_piso/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="number" value="{rows/content/form_1/fields/nr_piso/value}" class="form-control" id="{rows/content/form_1/fields/nr_piso/@name}" name="{rows/content/form_1/fields/nr_piso/@name}" maxlength="5"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/descricao_pred">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="descricao_pred" item-type="textarea">
                                                                        <label for="{rows/content/form_1/fields/descricao_pred/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/descricao_pred/label"/>
                                                                        </label>
                                                                        <textarea name="{rows/content/form_1/fields/descricao_pred/@name}" class="textarea form-control" maxlength="555">
                                                                            <xsl:value-of select="rows/content/form_1/fields/descricao_pred/value"/>
                                                                        </textarea>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/pesq_poligono">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="pesq_poligono" item-type="link">
                                                                        <a href="{rows/content/form_1/fields/pesq_poligono/value}" class="link  form-link" target="_self">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/pesq_poligono/label"/>
                                                                            </span>
                                                                        </a>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/coordenadas">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="coordenadas" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/coordenadas/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/coordenadas/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/coordenadas/value}" class="form-control" id="{rows/content/form_1/fields/coordenadas/@name}" name="{rows/content/form_1/fields/coordenadas/@name}" maxlength="30"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/estado">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="estado" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/estado/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/estado/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_estado" name="{rows/content/form_1/fields/estado/@name}" required="required">
                                                                            <xsl:for-each select="rows/content/form_1/fields/estado/list/option">
                                                                                <option value="{value}" label="{text}">
                                                                                    <xsl:if test="@selected='true'">
                                                                                        <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                    </xsl:if>
                                                                                    <span>
                                                                                        <xsl:value-of select="text"/>
                                                                                    </span>
                                                                                </option>
                                                                            </xsl:for-each>
                                                                        </select>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/fase">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="fase" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/fase/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/fase/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_fase" name="{rows/content/form_1/fields/fase/@name}" required="required">
                                                                            <xsl:for-each select="rows/content/form_1/fields/fase/list/option">
                                                                                <option value="{value}" label="{text}">
                                                                                    <xsl:if test="@selected='true'">
                                                                                        <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                    </xsl:if>
                                                                                    <span>
                                                                                        <xsl:value-of select="text"/>
                                                                                    </span>
                                                                                </option>
                                                                            </xsl:for-each>
                                                                        </select>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/confrontacoes">
                                                                    <div class="box-head subtitle gen-fields-holder">
                                                                        <xsl:value-of select="rows/content/form_1/fields/confrontacoes/label"/>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/confrontacao_n">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="confrontacao_n" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/confrontacao_n/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/confrontacao_n/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/confrontacao_n/value}" class="form-control" id="{rows/content/form_1/fields/confrontacao_n/@name}" name="{rows/content/form_1/fields/confrontacao_n/@name}" maxlength="250"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/confrontacao_s">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="confrontacao_s" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/confrontacao_s/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/confrontacao_s/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/confrontacao_s/value}" class="form-control" id="{rows/content/form_1/fields/confrontacao_s/@name}" name="{rows/content/form_1/fields/confrontacao_s/@name}" maxlength="250"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/confrontacao_e">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="confrontacao_e" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/confrontacao_e/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/confrontacao_e/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/confrontacao_e/value}" class="form-control" id="{rows/content/form_1/fields/confrontacao_e/@name}" name="{rows/content/form_1/fields/confrontacao_e/@name}" maxlength="250"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/confrontacao_o">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="confrontacao_o" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/confrontacao_o/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/confrontacao_o/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/confrontacao_o/value}" class="form-control" id="{rows/content/form_1/fields/confrontacao_o/@name}" name="{rows/content/form_1/fields/confrontacao_o/@name}" maxlength="250"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/confrontacao_ne">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="confrontacao_ne" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/confrontacao_ne/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/confrontacao_ne/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/confrontacao_ne/value}" class="form-control" id="{rows/content/form_1/fields/confrontacao_ne/@name}" name="{rows/content/form_1/fields/confrontacao_ne/@name}" maxlength="250"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/confrontacao_se">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="confrontacao_se" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/confrontacao_se/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/confrontacao_se/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/confrontacao_se/value}" class="form-control" id="{rows/content/form_1/fields/confrontacao_se/@name}" name="{rows/content/form_1/fields/confrontacao_se/@name}" maxlength="250"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/confrontacao_no">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="confrontacao_no" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/confrontacao_no/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/confrontacao_no/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/confrontacao_no/value}" class="form-control" id="{rows/content/form_1/fields/confrontacao_no/@name}" name="{rows/content/form_1/fields/confrontacao_no/@name}" maxlength="250"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/confrontacao_so">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="confrontacao_so" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/confrontacao_so/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/confrontacao_so/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/confrontacao_so/value}" class="form-control" id="{rows/content/form_1/fields/confrontacao_so/@name}" name="{rows/content/form_1/fields/confrontacao_so/@name}" maxlength="250"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/sep_fracao">
                                                                    <div class="box-head subtitle gen-fields-holder">
                                                                        <xsl:value-of select="rows/content/form_1/fields/sep_fracao/label"/>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/codigo_fracao0">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="codigo_fracao0" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/codigo_fracao0/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/codigo_fracao0/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/codigo_fracao0/value}" class="form-control" id="{rows/content/form_1/fields/codigo_fracao0/@name}" name="{rows/content/form_1/fields/codigo_fracao0/@name}" readonly="readonly" maxlength="20"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/fraccao">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="fraccao" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/fraccao/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/fraccao/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_fraccao" name="{rows/content/form_1/fields/fraccao/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/fraccao/list/option">
                                                                                <option value="{value}" label="{text}">
                                                                                    <xsl:if test="@selected='true'">
                                                                                        <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                    </xsl:if>
                                                                                    <span>
                                                                                        <xsl:value-of select="text"/>
                                                                                    </span>
                                                                                </option>
                                                                            </xsl:for-each>
                                                                        </select>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/permilpercent">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="permilpercent" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/permilpercent/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/permilpercent/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_permilpercent" name="{rows/content/form_1/fields/permilpercent/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/permilpercent/list/option">
                                                                                <option value="{value}" label="{text}">
                                                                                    <xsl:if test="@selected='true'">
                                                                                        <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                    </xsl:if>
                                                                                    <span>
                                                                                        <xsl:value-of select="text"/>
                                                                                    </span>
                                                                                </option>
                                                                            </xsl:for-each>
                                                                        </select>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/permilagem">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="permilagem" item-type="number">
                                                                        <label for="{rows/content/form_1/fields/permilagem/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/permilagem/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="number" value="{rows/content/form_1/fields/permilagem/value}" class="form-control" id="{rows/content/form_1/fields/permilagem/@name}" name="{rows/content/form_1/fields/permilagem/@name}" maxlength="30"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/local_no_piso">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="local_no_piso" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/local_no_piso/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/local_no_piso/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_local_no_piso" name="{rows/content/form_1/fields/local_no_piso/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/local_no_piso/list/option">
                                                                                <option value="{value}" label="{text}">
                                                                                    <xsl:if test="@selected='true'">
                                                                                        <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                    </xsl:if>
                                                                                    <span>
                                                                                        <xsl:value-of select="text"/>
                                                                                    </span>
                                                                                </option>
                                                                            </xsl:for-each>
                                                                        </select>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/bloco">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="bloco" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/bloco/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/bloco/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/bloco/value}" class="form-control" id="{rows/content/form_1/fields/bloco/@name}" name="{rows/content/form_1/fields/bloco/@name}" maxlength="15"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/sep_titular_cadastral">
                                                                    <div class="box-head subtitle gen-fields-holder">
                                                                        <xsl:value-of select="rows/content/form_1/fields/sep_titular_cadastral/label"/>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/titular_unico">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="titular_unico" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/titular_unico/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/titular_unico/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_titular_unico" name="{rows/content/form_1/fields/titular_unico/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/titular_unico/list/option">
                                                                                <option value="{value}" label="{text}">
                                                                                    <xsl:if test="@selected='true'">
                                                                                        <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                    </xsl:if>
                                                                                    <span>
                                                                                        <xsl:value-of select="text"/>
                                                                                    </span>
                                                                                </option>
                                                                            </xsl:for-each>
                                                                        </select>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/observacao">
                                                                    <div class="box-head subtitle gen-fields-holder">
                                                                        <xsl:value-of select="rows/content/form_1/fields/observacao/label"/>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/notas">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="notas" item-type="textarea">
                                                                        <label for="{rows/content/form_1/fields/notas/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/notas/label"/>
                                                                        </label>
                                                                        <textarea name="{rows/content/form_1/fields/notas/@name}" class="textarea form-control" maxlength="2000">
                                                                            <xsl:value-of select="rows/content/form_1/fields/notas/value"/>
                                                                        </textarea>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/sep_assinatura">
                                                                    <div class="box-head subtitle gen-fields-holder">
                                                                        <xsl:value-of select="rows/content/form_1/fields/sep_assinatura/label"/>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/assinar">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="assinar" item-type="link">
                                                                        <a href="{rows/content/form_1/fields/assinar/value}" class="link  form-link" target="_self">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/assinar/label"/>
                                                                            </span>
                                                                        </a>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/addnif">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="addnif" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/addnif/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/addnif/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/addnif/value}" class="form-control" id="{rows/content/form_1/fields/addnif/@name}" name="{rows/content/form_1/fields/addnif/@name}" maxlength="30"></input>
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
                                    <div class="row">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/sep_titular">
                                                    <div class="box gen-container-item " item-name="sep_titular">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/sep_titular/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body IGRP-separatorlist" tag="sep_titular" dialog="false">
                                                            <div class="splist-form-holder">
                                                                <div class="splist-form" role="form">
                                                                    <xsl:apply-templates mode="form-hidden-fields" select="rows/content/sep_titular/fields"/>
                                                                    <xsl:if test="rows/content/sep_titular/fields/nome">
                                                                        <div class="form-group col-md-3   gen-fields-holder" item-name="nome" item-type="text">
                                                                            <label for="{rows/content/sep_titular/fields/nome/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/sep_titular/fields/nome/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <input type="text" value="{rows/content/sep_titular/fields/nome/value}" class="form-control" id="{rows/content/sep_titular/fields/nome/@name}" name="{rows/content/sep_titular/fields/nome/@name}" required="required" maxlength="250"></input>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_titular/fields/nif">
                                                                        <div class="form-group col-md-3  gen-fields-holder" item-name="nif" item-type="lookup">
                                                                            <label for="{rows/content/sep_titular/fields/nif/@name}">
                                                                                <xsl:value-of select="rows/content/sep_titular/fields/nif/label"/>
                                                                            </label>
                                                                            <div class="input-group">
                                                                                <input type="text" value="{rows/content/sep_titular/fields/nif/value}" class="form-control gen-lookup" id="sep_titular_nif" name="{rows/content/sep_titular/fields/nif/@name}"/>
                                                                                <xsl:call-template name="lookup-tool">
                                                                                    <xsl:with-param name="page" select="rows/page"/>
                                                                                    <xsl:with-param name="ad_hoc" select="'1'"/>
                                                                                    <xsl:with-param name="action" select="'LOOKUP'"/>
                                                                                    <xsl:with-param name="name" select="rows/content/sep_titular/fields/nif/@name"/>
                                                                                    <xsl:with-param name="js_lookup" select="rows/content/sep_titular/fields/nif/lookup"/>
                                                                                    <xsl:with-param name="input-id" select="'sep_titular_nif'"/>
                                                                                    <xsl:with-param name="btnClass" select="'default'"/>
                                                                                </xsl:call-template>
                                                                            </div>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_titular/fields/pesq_info_titular">
                                                                        <div class="form-group col-md-3  gen-fields-holder" item-name="pesq_info_titular" item-type="lookup">
                                                                            <label for="{rows/content/sep_titular/fields/pesq_info_titular/@name}">
                                                                                <xsl:value-of select="rows/content/sep_titular/fields/pesq_info_titular/label"/>
                                                                            </label>
                                                                            <div class="input-group">
                                                                                <input type="text" value="{rows/content/sep_titular/fields/pesq_info_titular/value}" class="form-control gen-lookup" id="sep_titular_pesq_info_titular" name="{rows/content/sep_titular/fields/pesq_info_titular/@name}"/>
                                                                                <xsl:call-template name="lookup-tool">
                                                                                    <xsl:with-param name="page" select="rows/page"/>
                                                                                    <xsl:with-param name="ad_hoc" select="'1'"/>
                                                                                    <xsl:with-param name="action" select="'LOOKUP'"/>
                                                                                    <xsl:with-param name="name" select="rows/content/sep_titular/fields/pesq_info_titular/@name"/>
                                                                                    <xsl:with-param name="js_lookup" select="rows/content/sep_titular/fields/pesq_info_titular/lookup"/>
                                                                                    <xsl:with-param name="input-id" select="'sep_titular_pesq_info_titular'"/>
                                                                                    <xsl:with-param name="btnClass" select="'default'"/>
                                                                                </xsl:call-template>
                                                                            </div>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_titular/fields/tipologia_titular">
                                                                        <div class="col-md-3 form-group  gen-fields-holder" item-name="tipologia_titular" item-type="select">
                                                                            <label for="{rows/content/sep_titular/fields/tipologia_titular/@name}">
                                                                                <xsl:value-of select="rows/content/sep_titular/fields/tipologia_titular/label"/>
                                                                            </label>
                                                                            <select class="form-control select2 " id="sep_titular_tipologia_titular" name="{rows/content/sep_titular/fields/tipologia_titular/@name}">
                                                                                <xsl:for-each select="rows/content/sep_titular/fields/tipologia_titular/list/option">
                                                                                    <option value="{value}" label="{text}">
                                                                                        <xsl:if test="@selected='true'">
                                                                                            <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                        </xsl:if>
                                                                                        <span>
                                                                                            <xsl:value-of select="text"/>
                                                                                        </span>
                                                                                    </option>
                                                                                </xsl:for-each>
                                                                            </select>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_titular/fields/tp_doc_titular">
                                                                        <div class="col-md-3 form-group  gen-fields-holder" item-name="tp_doc_titular" item-type="select">
                                                                            <label for="{rows/content/sep_titular/fields/tp_doc_titular/@name}">
                                                                                <xsl:value-of select="rows/content/sep_titular/fields/tp_doc_titular/label"/>
                                                                            </label>
                                                                            <select class="form-control select2 " id="sep_titular_tp_doc_titular" name="{rows/content/sep_titular/fields/tp_doc_titular/@name}">
                                                                                <xsl:for-each select="rows/content/sep_titular/fields/tp_doc_titular/list/option">
                                                                                    <option value="{value}" label="{text}">
                                                                                        <xsl:if test="@selected='true'">
                                                                                            <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                        </xsl:if>
                                                                                        <span>
                                                                                            <xsl:value-of select="text"/>
                                                                                        </span>
                                                                                    </option>
                                                                                </xsl:for-each>
                                                                            </select>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_titular/fields/nr_doc_titular">
                                                                        <div class="form-group col-md-3   gen-fields-holder" item-name="nr_doc_titular" item-type="text">
                                                                            <label for="{rows/content/sep_titular/fields/nr_doc_titular/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/sep_titular/fields/nr_doc_titular/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <input type="text" value="{rows/content/sep_titular/fields/nr_doc_titular/value}" class="form-control" id="{rows/content/sep_titular/fields/nr_doc_titular/@name}" name="{rows/content/sep_titular/fields/nr_doc_titular/@name}" maxlength="30"></input>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_titular/fields/dt_nasc_titular">
                                                                        <div class="form-group col-md-3  gen-fields-holder" item-name="dt_nasc_titular" item-type="date">
                                                                            <label for="{rows/content/sep_titular/fields/dt_nasc_titular/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/sep_titular/fields/dt_nasc_titular/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <div class="input-group">
                                                                                <input type="text" value="{rows/content/sep_titular/fields/dt_nasc_titular/value}" class="form-control gen-date" id="sep_titular-dt_nasc_titular" name="{rows/content/sep_titular/fields/dt_nasc_titular/@name}" format="IGRP_datePicker" maxlength="30"/>
                                                                                <span class="input-group-btn gen-date-icon">
                                                                                    <span class="btn btn-default">
                                                                                        <i class="fa fa-calendar"/>
                                                                                    </span>
                                                                                </span>
                                                                            </div>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_titular/fields/genero_titular">
                                                                        <div class="col-md-3 form-group  gen-fields-holder" item-name="genero_titular" item-type="select">
                                                                            <label for="{rows/content/sep_titular/fields/genero_titular/@name}">
                                                                                <xsl:value-of select="rows/content/sep_titular/fields/genero_titular/label"/>
                                                                            </label>
                                                                            <select class="form-control select2 " id="sep_titular_genero_titular" name="{rows/content/sep_titular/fields/genero_titular/@name}">
                                                                                <xsl:for-each select="rows/content/sep_titular/fields/genero_titular/list/option">
                                                                                    <option value="{value}" label="{text}">
                                                                                        <xsl:if test="@selected='true'">
                                                                                            <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                        </xsl:if>
                                                                                        <span>
                                                                                            <xsl:value-of select="text"/>
                                                                                        </span>
                                                                                    </option>
                                                                                </xsl:for-each>
                                                                            </select>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_titular/fields/domicilio_sede">
                                                                        <div class="form-group col-md-3  gen-fields-holder" item-name="domicilio_sede" item-type="lookup">
                                                                            <label for="{rows/content/sep_titular/fields/domicilio_sede/@name}">
                                                                                <xsl:value-of select="rows/content/sep_titular/fields/domicilio_sede/label"/>
                                                                            </label>
                                                                            <div class="input-group">
                                                                                <input type="text" value="{rows/content/sep_titular/fields/domicilio_sede/value}" class="form-control gen-lookup" id="sep_titular_domicilio_sede" name="{rows/content/sep_titular/fields/domicilio_sede/@name}"/>
                                                                                <xsl:call-template name="lookup-tool">
                                                                                    <xsl:with-param name="page" select="rows/page"/>
                                                                                    <xsl:with-param name="ad_hoc" select="'1'"/>
                                                                                    <xsl:with-param name="action" select="'LOOKUP'"/>
                                                                                    <xsl:with-param name="name" select="rows/content/sep_titular/fields/domicilio_sede/@name"/>
                                                                                    <xsl:with-param name="js_lookup" select="rows/content/sep_titular/fields/domicilio_sede/lookup"/>
                                                                                    <xsl:with-param name="input-id" select="'sep_titular_domicilio_sede'"/>
                                                                                    <xsl:with-param name="btnClass" select="'default'"/>
                                                                                </xsl:call-template>
                                                                            </div>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_titular/fields/localidade">
                                                                        <div class="form-group col-md-3  gen-fields-holder" item-name="localidade" item-type="lookup">
                                                                            <label for="{rows/content/sep_titular/fields/localidade/@name}">
                                                                                <xsl:value-of select="rows/content/sep_titular/fields/localidade/label"/>
                                                                            </label>
                                                                            <div class="input-group">
                                                                                <input type="text" value="{rows/content/sep_titular/fields/localidade/value}" class="form-control gen-lookup" id="sep_titular_localidade" name="{rows/content/sep_titular/fields/localidade/@name}"/>
                                                                                <xsl:call-template name="lookup-tool">
                                                                                    <xsl:with-param name="page" select="rows/page"/>
                                                                                    <xsl:with-param name="ad_hoc" select="'1'"/>
                                                                                    <xsl:with-param name="action" select="'LOOKUP'"/>
                                                                                    <xsl:with-param name="name" select="rows/content/sep_titular/fields/localidade/@name"/>
                                                                                    <xsl:with-param name="js_lookup" select="rows/content/sep_titular/fields/localidade/lookup"/>
                                                                                    <xsl:with-param name="input-id" select="'sep_titular_localidade'"/>
                                                                                    <xsl:with-param name="btnClass" select="'default'"/>
                                                                                </xsl:call-template>
                                                                            </div>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_titular/fields/lugar">
                                                                        <div class="form-group col-md-3   gen-fields-holder" item-name="lugar" item-type="text">
                                                                            <label for="{rows/content/sep_titular/fields/lugar/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/sep_titular/fields/lugar/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <input type="text" value="{rows/content/sep_titular/fields/lugar/value}" class="form-control" id="{rows/content/sep_titular/fields/lugar/@name}" name="{rows/content/sep_titular/fields/lugar/@name}" maxlength="100"></input>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_titular/fields/rua_titular">
                                                                        <div class="form-group col-md-3   gen-fields-holder" item-name="rua_titular" item-type="text">
                                                                            <label for="{rows/content/sep_titular/fields/rua_titular/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/sep_titular/fields/rua_titular/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <input type="text" value="{rows/content/sep_titular/fields/rua_titular/value}" class="form-control" id="{rows/content/sep_titular/fields/rua_titular/@name}" name="{rows/content/sep_titular/fields/rua_titular/@name}" maxlength="250"></input>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_titular/fields/andar">
                                                                        <div class="form-group col-md-3   gen-fields-holder" item-name="andar" item-type="text">
                                                                            <label for="{rows/content/sep_titular/fields/andar/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/sep_titular/fields/andar/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <input type="text" value="{rows/content/sep_titular/fields/andar/value}" class="form-control" id="{rows/content/sep_titular/fields/andar/@name}" name="{rows/content/sep_titular/fields/andar/@name}" maxlength="15"></input>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_titular/fields/pais">
                                                                        <div class="form-group col-md-3   gen-fields-holder" item-name="pais" item-type="text">
                                                                            <label for="{rows/content/sep_titular/fields/pais/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/sep_titular/fields/pais/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <input type="text" value="{rows/content/sep_titular/fields/pais/value}" class="form-control" id="{rows/content/sep_titular/fields/pais/@name}" name="{rows/content/sep_titular/fields/pais/@name}" readonly="readonly" maxlength="100"></input>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_titular/fields/estado_civil">
                                                                        <div class="col-md-3 form-group  gen-fields-holder" item-name="estado_civil" item-type="select">
                                                                            <label for="{rows/content/sep_titular/fields/estado_civil/@name}">
                                                                                <xsl:value-of select="rows/content/sep_titular/fields/estado_civil/label"/>
                                                                            </label>
                                                                            <select class="form-control select2 " id="sep_titular_estado_civil" name="{rows/content/sep_titular/fields/estado_civil/@name}">
                                                                                <xsl:for-each select="rows/content/sep_titular/fields/estado_civil/list/option">
                                                                                    <option value="{value}" label="{text}">
                                                                                        <xsl:if test="@selected='true'">
                                                                                            <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                        </xsl:if>
                                                                                        <span>
                                                                                            <xsl:value-of select="text"/>
                                                                                        </span>
                                                                                    </option>
                                                                                </xsl:for-each>
                                                                            </select>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_titular/fields/meeiro">
                                                                        <div class="col-md-3 form-group  gen-fields-holder" item-name="meeiro" item-type="select">
                                                                            <label for="{rows/content/sep_titular/fields/meeiro/@name}">
                                                                                <xsl:value-of select="rows/content/sep_titular/fields/meeiro/label"/>
                                                                            </label>
                                                                            <select class="form-control select2 " id="sep_titular_meeiro" name="{rows/content/sep_titular/fields/meeiro/@name}">
                                                                                <xsl:for-each select="rows/content/sep_titular/fields/meeiro/list/option">
                                                                                    <option value="{value}" label="{text}">
                                                                                        <xsl:if test="@selected='true'">
                                                                                            <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                        </xsl:if>
                                                                                        <span>
                                                                                            <xsl:value-of select="text"/>
                                                                                        </span>
                                                                                    </option>
                                                                                </xsl:for-each>
                                                                            </select>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_titular/fields/conjugue">
                                                                        <div class="form-group col-md-3   gen-fields-holder" item-name="conjugue" item-type="text">
                                                                            <label for="{rows/content/sep_titular/fields/conjugue/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/sep_titular/fields/conjugue/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <input type="text" value="{rows/content/sep_titular/fields/conjugue/value}" class="form-control" id="{rows/content/sep_titular/fields/conjugue/@name}" name="{rows/content/sep_titular/fields/conjugue/@name}" maxlength="250"></input>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_titular/fields/regime_bens">
                                                                        <div class="col-md-3 form-group  gen-fields-holder" item-name="regime_bens" item-type="select">
                                                                            <label for="{rows/content/sep_titular/fields/regime_bens/@name}">
                                                                                <xsl:value-of select="rows/content/sep_titular/fields/regime_bens/label"/>
                                                                            </label>
                                                                            <select class="form-control select2 " id="sep_titular_regime_bens" name="{rows/content/sep_titular/fields/regime_bens/@name}">
                                                                                <xsl:for-each select="rows/content/sep_titular/fields/regime_bens/list/option">
                                                                                    <option value="{value}" label="{text}">
                                                                                        <xsl:if test="@selected='true'">
                                                                                            <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                        </xsl:if>
                                                                                        <span>
                                                                                            <xsl:value-of select="text"/>
                                                                                        </span>
                                                                                    </option>
                                                                                </xsl:for-each>
                                                                            </select>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_titular/fields/tip_doc_conj">
                                                                        <div class="col-md-3 form-group  gen-fields-holder" item-name="tip_doc_conj" item-type="select">
                                                                            <label for="{rows/content/sep_titular/fields/tip_doc_conj/@name}">
                                                                                <xsl:value-of select="rows/content/sep_titular/fields/tip_doc_conj/label"/>
                                                                            </label>
                                                                            <select class="form-control select2 " id="sep_titular_tip_doc_conj" name="{rows/content/sep_titular/fields/tip_doc_conj/@name}">
                                                                                <xsl:for-each select="rows/content/sep_titular/fields/tip_doc_conj/list/option">
                                                                                    <option value="{value}" label="{text}">
                                                                                        <xsl:if test="@selected='true'">
                                                                                            <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                        </xsl:if>
                                                                                        <span>
                                                                                            <xsl:value-of select="text"/>
                                                                                        </span>
                                                                                    </option>
                                                                                </xsl:for-each>
                                                                            </select>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_titular/fields/numero_documento">
                                                                        <div class="form-group col-md-3   gen-fields-holder" item-name="numero_documento" item-type="text">
                                                                            <label for="{rows/content/sep_titular/fields/numero_documento/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/sep_titular/fields/numero_documento/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <input type="text" value="{rows/content/sep_titular/fields/numero_documento/value}" class="form-control" id="{rows/content/sep_titular/fields/numero_documento/@name}" name="{rows/content/sep_titular/fields/numero_documento/@name}" maxlength="15"></input>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_titular/fields/contacto">
                                                                        <div class="box-head subtitle gen-fields-holder">
                                                                            <xsl:value-of select="rows/content/sep_titular/fields/contacto/label"/>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_titular/fields/telemovel">
                                                                        <div class="form-group col-md-3   gen-fields-holder" item-name="telemovel" item-type="text">
                                                                            <label for="{rows/content/sep_titular/fields/telemovel/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/sep_titular/fields/telemovel/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <input type="text" value="{rows/content/sep_titular/fields/telemovel/value}" class="form-control" id="{rows/content/sep_titular/fields/telemovel/@name}" name="{rows/content/sep_titular/fields/telemovel/@name}" maxlength="15"></input>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_titular/fields/telefone">
                                                                        <div class="form-group col-md-3   gen-fields-holder" item-name="telefone" item-type="text">
                                                                            <label for="{rows/content/sep_titular/fields/telefone/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/sep_titular/fields/telefone/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <input type="text" value="{rows/content/sep_titular/fields/telefone/value}" class="form-control" id="{rows/content/sep_titular/fields/telefone/@name}" name="{rows/content/sep_titular/fields/telefone/@name}" maxlength="15"></input>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_titular/fields/email">
                                                                        <div class="form-group col-md-3   gen-fields-holder" item-name="email" item-type="email">
                                                                            <label for="{rows/content/sep_titular/fields/email/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/sep_titular/fields/email/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <input type="email" value="{rows/content/sep_titular/fields/email/value}" class="form-control" id="{rows/content/sep_titular/fields/email/@name}" name="{rows/content/sep_titular/fields/email/@name}" maxlength="250"></input>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_titular/fields/sep_rel_titular">
                                                                        <div class="box-head subtitle gen-fields-holder">
                                                                            <xsl:value-of select="rows/content/sep_titular/fields/sep_rel_titular/label"/>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_titular/fields/tipo_direito">
                                                                        <div class="col-md-3 form-group  gen-fields-holder" item-name="tipo_direito" item-type="select">
                                                                            <label for="{rows/content/sep_titular/fields/tipo_direito/@name}">
                                                                                <xsl:value-of select="rows/content/sep_titular/fields/tipo_direito/label"/>
                                                                            </label>
                                                                            <select class="form-control select2 " id="sep_titular_tipo_direito" name="{rows/content/sep_titular/fields/tipo_direito/@name}" required="required">
                                                                                <xsl:for-each select="rows/content/sep_titular/fields/tipo_direito/list/option">
                                                                                    <option value="{value}" label="{text}">
                                                                                        <xsl:if test="@selected='true'">
                                                                                            <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                        </xsl:if>
                                                                                        <span>
                                                                                            <xsl:value-of select="text"/>
                                                                                        </span>
                                                                                    </option>
                                                                                </xsl:for-each>
                                                                            </select>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_titular/fields/numerador">
                                                                        <div class="form-group col-md-3   gen-fields-holder" item-name="numerador" item-type="number">
                                                                            <label for="{rows/content/sep_titular/fields/numerador/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/sep_titular/fields/numerador/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <input type="number" value="{rows/content/sep_titular/fields/numerador/value}" class="form-control" id="{rows/content/sep_titular/fields/numerador/@name}" name="{rows/content/sep_titular/fields/numerador/@name}" required="required" maxlength="30"></input>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_titular/fields/denominador">
                                                                        <div class="form-group col-md-3   gen-fields-holder" item-name="denominador" item-type="number">
                                                                            <label for="{rows/content/sep_titular/fields/denominador/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/sep_titular/fields/denominador/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <input type="number" value="{rows/content/sep_titular/fields/denominador/value}" class="form-control" id="{rows/content/sep_titular/fields/denominador/@name}" name="{rows/content/sep_titular/fields/denominador/@name}" required="required" maxlength="30"></input>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_titular/fields/causas_aquisicao">
                                                                        <div class="form-group col-md-3  gen-fields-holder" item-name="causas_aquisicao" item-type="lookup">
                                                                            <label for="{rows/content/sep_titular/fields/causas_aquisicao/@name}">
                                                                                <xsl:value-of select="rows/content/sep_titular/fields/causas_aquisicao/label"/>
                                                                            </label>
                                                                            <div class="input-group">
                                                                                <input type="text" value="{rows/content/sep_titular/fields/causas_aquisicao/value}" class="form-control gen-lookup" id="sep_titular_causas_aquisicao" name="{rows/content/sep_titular/fields/causas_aquisicao/@name}"/>
                                                                                <xsl:call-template name="lookup-tool">
                                                                                    <xsl:with-param name="page" select="rows/page"/>
                                                                                    <xsl:with-param name="ad_hoc" select="'1'"/>
                                                                                    <xsl:with-param name="action" select="'LOOKUP'"/>
                                                                                    <xsl:with-param name="name" select="rows/content/sep_titular/fields/causas_aquisicao/@name"/>
                                                                                    <xsl:with-param name="js_lookup" select="rows/content/sep_titular/fields/causas_aquisicao/lookup"/>
                                                                                    <xsl:with-param name="input-id" select="'sep_titular_causas_aquisicao'"/>
                                                                                    <xsl:with-param name="btnClass" select="'default'"/>
                                                                                </xsl:call-template>
                                                                            </div>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_titular/fields/dt_causa">
                                                                        <div class="form-group col-md-3  gen-fields-holder" item-name="dt_causa" item-type="date">
                                                                            <label for="{rows/content/sep_titular/fields/dt_causa/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/sep_titular/fields/dt_causa/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <div class="input-group">
                                                                                <input type="text" value="{rows/content/sep_titular/fields/dt_causa/value}" class="form-control gen-date" id="sep_titular-dt_causa" name="{rows/content/sep_titular/fields/dt_causa/@name}" format="IGRP_datePicker" maxlength="30"/>
                                                                                <span class="input-group-btn gen-date-icon">
                                                                                    <span class="btn btn-default">
                                                                                        <i class="fa fa-calendar"/>
                                                                                    </span>
                                                                                </span>
                                                                            </div>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_titular/fields/duracao_facto">
                                                                        <div class="form-group col-md-3   gen-fields-holder" item-name="duracao_facto" item-type="number">
                                                                            <label for="{rows/content/sep_titular/fields/duracao_facto/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/sep_titular/fields/duracao_facto/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <input type="number" value="{rows/content/sep_titular/fields/duracao_facto/value}" class="form-control" id="{rows/content/sep_titular/fields/duracao_facto/@name}" name="{rows/content/sep_titular/fields/duracao_facto/@name}" maxlength="30"></input>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_titular/fields/medida_duracao">
                                                                        <div class="col-md-3 form-group  gen-fields-holder" item-name="medida_duracao" item-type="select">
                                                                            <label for="{rows/content/sep_titular/fields/medida_duracao/@name}">
                                                                                <xsl:value-of select="rows/content/sep_titular/fields/medida_duracao/label"/>
                                                                            </label>
                                                                            <select class="form-control select2 " id="sep_titular_medida_duracao" name="{rows/content/sep_titular/fields/medida_duracao/@name}">
                                                                                <xsl:for-each select="rows/content/sep_titular/fields/medida_duracao/list/option">
                                                                                    <option value="{value}" label="{text}">
                                                                                        <xsl:if test="@selected='true'">
                                                                                            <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                        </xsl:if>
                                                                                        <span>
                                                                                            <xsl:value-of select="text"/>
                                                                                        </span>
                                                                                    </option>
                                                                                </xsl:for-each>
                                                                            </select>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_titular/fields/com_representacao">
                                                                        <div class="col-md-3 form-group  gen-fields-holder" item-name="com_representacao" item-type="select">
                                                                            <label for="{rows/content/sep_titular/fields/com_representacao/@name}">
                                                                                <xsl:value-of select="rows/content/sep_titular/fields/com_representacao/label"/>
                                                                            </label>
                                                                            <select class="form-control select2 " id="sep_titular_com_representacao" name="{rows/content/sep_titular/fields/com_representacao/@name}" required="required">
                                                                                <xsl:for-each select="rows/content/sep_titular/fields/com_representacao/list/option">
                                                                                    <option value="{value}" label="{text}">
                                                                                        <xsl:if test="@selected='true'">
                                                                                            <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                        </xsl:if>
                                                                                        <span>
                                                                                            <xsl:value-of select="text"/>
                                                                                        </span>
                                                                                    </option>
                                                                                </xsl:for-each>
                                                                            </select>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_titular/fields/representante">
                                                                        <div class="box-head subtitle gen-fields-holder">
                                                                            <xsl:value-of select="rows/content/sep_titular/fields/representante/label"/>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_titular/fields/nome_rep">
                                                                        <div class="form-group col-md-3   gen-fields-holder" item-name="nome_rep" item-type="text">
                                                                            <label for="{rows/content/sep_titular/fields/nome_rep/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/sep_titular/fields/nome_rep/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <input type="text" value="{rows/content/sep_titular/fields/nome_rep/value}" class="form-control" id="{rows/content/sep_titular/fields/nome_rep/@name}" name="{rows/content/sep_titular/fields/nome_rep/@name}" maxlength="250"></input>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_titular/fields/nif_rep">
                                                                        <div class="form-group col-md-3  gen-fields-holder" item-name="nif_rep" item-type="lookup">
                                                                            <label for="{rows/content/sep_titular/fields/nif_rep/@name}">
                                                                                <xsl:value-of select="rows/content/sep_titular/fields/nif_rep/label"/>
                                                                            </label>
                                                                            <div class="input-group">
                                                                                <input type="text" value="{rows/content/sep_titular/fields/nif_rep/value}" class="form-control gen-lookup" id="sep_titular_nif_rep" name="{rows/content/sep_titular/fields/nif_rep/@name}"/>
                                                                                <xsl:call-template name="lookup-tool">
                                                                                    <xsl:with-param name="page" select="rows/page"/>
                                                                                    <xsl:with-param name="ad_hoc" select="'1'"/>
                                                                                    <xsl:with-param name="action" select="'LOOKUP'"/>
                                                                                    <xsl:with-param name="name" select="rows/content/sep_titular/fields/nif_rep/@name"/>
                                                                                    <xsl:with-param name="js_lookup" select="rows/content/sep_titular/fields/nif_rep/lookup"/>
                                                                                    <xsl:with-param name="input-id" select="'sep_titular_nif_rep'"/>
                                                                                    <xsl:with-param name="btnClass" select="'default'"/>
                                                                                </xsl:call-template>
                                                                            </div>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_titular/fields/tp_doc_rep">
                                                                        <div class="col-md-3 form-group  gen-fields-holder" item-name="tp_doc_rep" item-type="select">
                                                                            <label for="{rows/content/sep_titular/fields/tp_doc_rep/@name}">
                                                                                <xsl:value-of select="rows/content/sep_titular/fields/tp_doc_rep/label"/>
                                                                            </label>
                                                                            <select class="form-control select2 " id="sep_titular_tp_doc_rep" name="{rows/content/sep_titular/fields/tp_doc_rep/@name}">
                                                                                <xsl:for-each select="rows/content/sep_titular/fields/tp_doc_rep/list/option">
                                                                                    <option value="{value}" label="{text}">
                                                                                        <xsl:if test="@selected='true'">
                                                                                            <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                        </xsl:if>
                                                                                        <span>
                                                                                            <xsl:value-of select="text"/>
                                                                                        </span>
                                                                                    </option>
                                                                                </xsl:for-each>
                                                                            </select>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_titular/fields/nr_doc_rep">
                                                                        <div class="form-group col-md-3   gen-fields-holder" item-name="nr_doc_rep" item-type="text">
                                                                            <label for="{rows/content/sep_titular/fields/nr_doc_rep/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/sep_titular/fields/nr_doc_rep/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <input type="text" value="{rows/content/sep_titular/fields/nr_doc_rep/value}" class="form-control" id="{rows/content/sep_titular/fields/nr_doc_rep/@name}" name="{rows/content/sep_titular/fields/nr_doc_rep/@name}" maxlength="30"></input>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_titular/fields/domicilio_sede_rep">
                                                                        <div class="form-group col-md-3  gen-fields-holder" item-name="domicilio_sede_rep" item-type="lookup">
                                                                            <label for="{rows/content/sep_titular/fields/domicilio_sede_rep/@name}">
                                                                                <xsl:value-of select="rows/content/sep_titular/fields/domicilio_sede_rep/label"/>
                                                                            </label>
                                                                            <div class="input-group">
                                                                                <input type="text" value="{rows/content/sep_titular/fields/domicilio_sede_rep/value}" class="form-control gen-lookup" id="sep_titular_domicilio_sede_rep" name="{rows/content/sep_titular/fields/domicilio_sede_rep/@name}"/>
                                                                                <xsl:call-template name="lookup-tool">
                                                                                    <xsl:with-param name="page" select="rows/page"/>
                                                                                    <xsl:with-param name="ad_hoc" select="'1'"/>
                                                                                    <xsl:with-param name="action" select="'LOOKUP'"/>
                                                                                    <xsl:with-param name="name" select="rows/content/sep_titular/fields/domicilio_sede_rep/@name"/>
                                                                                    <xsl:with-param name="js_lookup" select="rows/content/sep_titular/fields/domicilio_sede_rep/lookup"/>
                                                                                    <xsl:with-param name="input-id" select="'sep_titular_domicilio_sede_rep'"/>
                                                                                    <xsl:with-param name="btnClass" select="'default'"/>
                                                                                </xsl:call-template>
                                                                            </div>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_titular/fields/localidade_rep">
                                                                        <div class="form-group col-md-3  gen-fields-holder" item-name="localidade_rep" item-type="lookup">
                                                                            <label for="{rows/content/sep_titular/fields/localidade_rep/@name}">
                                                                                <xsl:value-of select="rows/content/sep_titular/fields/localidade_rep/label"/>
                                                                            </label>
                                                                            <div class="input-group">
                                                                                <input type="text" value="{rows/content/sep_titular/fields/localidade_rep/value}" class="form-control gen-lookup" id="sep_titular_localidade_rep" name="{rows/content/sep_titular/fields/localidade_rep/@name}" required="required"/>
                                                                                <xsl:call-template name="lookup-tool">
                                                                                    <xsl:with-param name="page" select="rows/page"/>
                                                                                    <xsl:with-param name="ad_hoc" select="'1'"/>
                                                                                    <xsl:with-param name="action" select="'LOOKUP'"/>
                                                                                    <xsl:with-param name="name" select="rows/content/sep_titular/fields/localidade_rep/@name"/>
                                                                                    <xsl:with-param name="js_lookup" select="rows/content/sep_titular/fields/localidade_rep/lookup"/>
                                                                                    <xsl:with-param name="input-id" select="'sep_titular_localidade_rep'"/>
                                                                                    <xsl:with-param name="btnClass" select="'default'"/>
                                                                                </xsl:call-template>
                                                                            </div>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_titular/fields/lugar_rep">
                                                                        <div class="form-group col-md-3   gen-fields-holder" item-name="lugar_rep" item-type="text">
                                                                            <label for="{rows/content/sep_titular/fields/lugar_rep/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/sep_titular/fields/lugar_rep/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <input type="text" value="{rows/content/sep_titular/fields/lugar_rep/value}" class="form-control" id="{rows/content/sep_titular/fields/lugar_rep/@name}" name="{rows/content/sep_titular/fields/lugar_rep/@name}" maxlength="100"></input>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_titular/fields/rua_rep">
                                                                        <div class="form-group col-md-3   gen-fields-holder" item-name="rua_rep" item-type="text">
                                                                            <label for="{rows/content/sep_titular/fields/rua_rep/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/sep_titular/fields/rua_rep/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <input type="text" value="{rows/content/sep_titular/fields/rua_rep/value}" class="form-control" id="{rows/content/sep_titular/fields/rua_rep/@name}" name="{rows/content/sep_titular/fields/rua_rep/@name}" maxlength="250"></input>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_titular/fields/piso_rep">
                                                                        <div class="form-group col-md-3   gen-fields-holder" item-name="piso_rep" item-type="text">
                                                                            <label for="{rows/content/sep_titular/fields/piso_rep/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/sep_titular/fields/piso_rep/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <input type="text" value="{rows/content/sep_titular/fields/piso_rep/value}" class="form-control" id="{rows/content/sep_titular/fields/piso_rep/@name}" name="{rows/content/sep_titular/fields/piso_rep/@name}" maxlength="15"></input>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_titular/fields/pais_rep">
                                                                        <div class="form-group col-md-3   gen-fields-holder" item-name="pais_rep" item-type="text">
                                                                            <label for="{rows/content/sep_titular/fields/pais_rep/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/sep_titular/fields/pais_rep/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <input type="text" value="{rows/content/sep_titular/fields/pais_rep/value}" class="form-control" id="{rows/content/sep_titular/fields/pais_rep/@name}" name="{rows/content/sep_titular/fields/pais_rep/@name}" readonly="readonly" maxlength="100"></input>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_titular/fields/contacto_rep">
                                                                        <div class="box-head subtitle gen-fields-holder">
                                                                            <xsl:value-of select="rows/content/sep_titular/fields/contacto_rep/label"/>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_titular/fields/telemovel_rep">
                                                                        <div class="form-group col-md-3   gen-fields-holder" item-name="telemovel_rep" item-type="text">
                                                                            <label for="{rows/content/sep_titular/fields/telemovel_rep/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/sep_titular/fields/telemovel_rep/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <input type="text" value="{rows/content/sep_titular/fields/telemovel_rep/value}" class="form-control" id="{rows/content/sep_titular/fields/telemovel_rep/@name}" name="{rows/content/sep_titular/fields/telemovel_rep/@name}" maxlength="15"></input>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_titular/fields/telefone_rep">
                                                                        <div class="form-group col-md-3   gen-fields-holder" item-name="telefone_rep" item-type="text">
                                                                            <label for="{rows/content/sep_titular/fields/telefone_rep/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/sep_titular/fields/telefone_rep/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <input type="text" value="{rows/content/sep_titular/fields/telefone_rep/value}" class="form-control" id="{rows/content/sep_titular/fields/telefone_rep/@name}" name="{rows/content/sep_titular/fields/telefone_rep/@name}" maxlength="15"></input>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_titular/fields/email_rep">
                                                                        <div class="form-group col-md-3   gen-fields-holder" item-name="email_rep" item-type="email">
                                                                            <label for="{rows/content/sep_titular/fields/email_rep/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/sep_titular/fields/email_rep/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <input type="email" value="{rows/content/sep_titular/fields/email_rep/value}" class="form-control" id="{rows/content/sep_titular/fields/email_rep/@name}" name="{rows/content/sep_titular/fields/email_rep/@name}" maxlength="250"></input>
                                                                        </div>
                                                                    </xsl:if>
                                                                </div>
                                                            </div>
                                                            <div class="table-box box-body box-table-contents splist-table">
                                                                <table rel="T_sep_titular" id="sep_titular" class="table table-striped gen-data-table">
                                                                    <thead>
                                                                        <tr>
                                                                            <xsl:if test="rows/content/sep_titular/fields/nome">
                                                                                <xsl:if test="//rows/content/sep_titular/fields/nome/@table='true'">
                                                                                    <th align="" item-name="nome">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_titular/fields/nome/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_titular/fields/nif">
                                                                                <xsl:if test="//rows/content/sep_titular/fields/nif/@table='true'">
                                                                                    <th align="" item-name="nif">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_titular/fields/nif/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_titular/fields/pesq_info_titular">
                                                                                <xsl:if test="//rows/content/sep_titular/fields/pesq_info_titular/@table='true'">
                                                                                    <th align="" item-name="pesq_info_titular">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_titular/fields/pesq_info_titular/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_titular/fields/tipologia_titular">
                                                                                <xsl:if test="//rows/content/sep_titular/fields/tipologia_titular/@table='true'">
                                                                                    <th align="" item-name="tipologia_titular">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_titular/fields/tipologia_titular/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_titular/fields/tp_doc_titular">
                                                                                <xsl:if test="//rows/content/sep_titular/fields/tp_doc_titular/@table='true'">
                                                                                    <th align="" item-name="tp_doc_titular">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_titular/fields/tp_doc_titular/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_titular/fields/nr_doc_titular">
                                                                                <xsl:if test="//rows/content/sep_titular/fields/nr_doc_titular/@table='true'">
                                                                                    <th align="" item-name="nr_doc_titular">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_titular/fields/nr_doc_titular/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_titular/fields/dt_nasc_titular">
                                                                                <xsl:if test="//rows/content/sep_titular/fields/dt_nasc_titular/@table='true'">
                                                                                    <th align="" item-name="dt_nasc_titular">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_titular/fields/dt_nasc_titular/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_titular/fields/genero_titular">
                                                                                <xsl:if test="//rows/content/sep_titular/fields/genero_titular/@table='true'">
                                                                                    <th align="" item-name="genero_titular">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_titular/fields/genero_titular/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_titular/fields/domicilio_sede">
                                                                                <xsl:if test="//rows/content/sep_titular/fields/domicilio_sede/@table='true'">
                                                                                    <th align="" item-name="domicilio_sede">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_titular/fields/domicilio_sede/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_titular/fields/localidade">
                                                                                <xsl:if test="//rows/content/sep_titular/fields/localidade/@table='true'">
                                                                                    <th align="" item-name="localidade">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_titular/fields/localidade/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_titular/fields/lugar">
                                                                                <xsl:if test="//rows/content/sep_titular/fields/lugar/@table='true'">
                                                                                    <th align="" item-name="lugar">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_titular/fields/lugar/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_titular/fields/rua_titular">
                                                                                <xsl:if test="//rows/content/sep_titular/fields/rua_titular/@table='true'">
                                                                                    <th align="" item-name="rua_titular">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_titular/fields/rua_titular/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_titular/fields/andar">
                                                                                <xsl:if test="//rows/content/sep_titular/fields/andar/@table='true'">
                                                                                    <th align="" item-name="andar">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_titular/fields/andar/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_titular/fields/pais">
                                                                                <xsl:if test="//rows/content/sep_titular/fields/pais/@table='true'">
                                                                                    <th align="" item-name="pais">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_titular/fields/pais/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_titular/fields/estado_civil">
                                                                                <xsl:if test="//rows/content/sep_titular/fields/estado_civil/@table='true'">
                                                                                    <th align="" item-name="estado_civil">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_titular/fields/estado_civil/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_titular/fields/meeiro">
                                                                                <xsl:if test="//rows/content/sep_titular/fields/meeiro/@table='true'">
                                                                                    <th align="" item-name="meeiro">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_titular/fields/meeiro/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_titular/fields/conjugue">
                                                                                <xsl:if test="//rows/content/sep_titular/fields/conjugue/@table='true'">
                                                                                    <th align="" item-name="conjugue">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_titular/fields/conjugue/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_titular/fields/regime_bens">
                                                                                <xsl:if test="//rows/content/sep_titular/fields/regime_bens/@table='true'">
                                                                                    <th align="" item-name="regime_bens">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_titular/fields/regime_bens/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_titular/fields/tip_doc_conj">
                                                                                <xsl:if test="//rows/content/sep_titular/fields/tip_doc_conj/@table='true'">
                                                                                    <th align="" item-name="tip_doc_conj">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_titular/fields/tip_doc_conj/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_titular/fields/numero_documento">
                                                                                <xsl:if test="//rows/content/sep_titular/fields/numero_documento/@table='true'">
                                                                                    <th align="" item-name="numero_documento">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_titular/fields/numero_documento/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_titular/fields/telemovel">
                                                                                <xsl:if test="//rows/content/sep_titular/fields/telemovel/@table='true'">
                                                                                    <th align="" item-name="telemovel">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_titular/fields/telemovel/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_titular/fields/telefone">
                                                                                <xsl:if test="//rows/content/sep_titular/fields/telefone/@table='true'">
                                                                                    <th align="" item-name="telefone">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_titular/fields/telefone/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_titular/fields/email">
                                                                                <xsl:if test="//rows/content/sep_titular/fields/email/@table='true'">
                                                                                    <th align="" item-name="email">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_titular/fields/email/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_titular/fields/tipo_direito">
                                                                                <xsl:if test="//rows/content/sep_titular/fields/tipo_direito/@table='true'">
                                                                                    <th align="" item-name="tipo_direito">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_titular/fields/tipo_direito/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_titular/fields/numerador">
                                                                                <xsl:if test="//rows/content/sep_titular/fields/numerador/@table='true'">
                                                                                    <th align="" item-name="numerador">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_titular/fields/numerador/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_titular/fields/denominador">
                                                                                <xsl:if test="//rows/content/sep_titular/fields/denominador/@table='true'">
                                                                                    <th align="" item-name="denominador">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_titular/fields/denominador/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_titular/fields/causas_aquisicao">
                                                                                <xsl:if test="//rows/content/sep_titular/fields/causas_aquisicao/@table='true'">
                                                                                    <th align="" item-name="causas_aquisicao">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_titular/fields/causas_aquisicao/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_titular/fields/dt_causa">
                                                                                <xsl:if test="//rows/content/sep_titular/fields/dt_causa/@table='true'">
                                                                                    <th align="" item-name="dt_causa">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_titular/fields/dt_causa/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_titular/fields/duracao_facto">
                                                                                <xsl:if test="//rows/content/sep_titular/fields/duracao_facto/@table='true'">
                                                                                    <th align="" item-name="duracao_facto">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_titular/fields/duracao_facto/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_titular/fields/medida_duracao">
                                                                                <xsl:if test="//rows/content/sep_titular/fields/medida_duracao/@table='true'">
                                                                                    <th align="" item-name="medida_duracao">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_titular/fields/medida_duracao/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_titular/fields/com_representacao">
                                                                                <xsl:if test="//rows/content/sep_titular/fields/com_representacao/@table='true'">
                                                                                    <th align="" item-name="com_representacao">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_titular/fields/com_representacao/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_titular/fields/nome_rep">
                                                                                <xsl:if test="//rows/content/sep_titular/fields/nome_rep/@table='true'">
                                                                                    <th align="" item-name="nome_rep">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_titular/fields/nome_rep/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_titular/fields/nif_rep">
                                                                                <xsl:if test="//rows/content/sep_titular/fields/nif_rep/@table='true'">
                                                                                    <th align="" item-name="nif_rep">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_titular/fields/nif_rep/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_titular/fields/tp_doc_rep">
                                                                                <xsl:if test="//rows/content/sep_titular/fields/tp_doc_rep/@table='true'">
                                                                                    <th align="" item-name="tp_doc_rep">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_titular/fields/tp_doc_rep/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_titular/fields/nr_doc_rep">
                                                                                <xsl:if test="//rows/content/sep_titular/fields/nr_doc_rep/@table='true'">
                                                                                    <th align="" item-name="nr_doc_rep">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_titular/fields/nr_doc_rep/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_titular/fields/domicilio_sede_rep">
                                                                                <xsl:if test="//rows/content/sep_titular/fields/domicilio_sede_rep/@table='true'">
                                                                                    <th align="" item-name="domicilio_sede_rep">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_titular/fields/domicilio_sede_rep/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_titular/fields/localidade_rep">
                                                                                <xsl:if test="//rows/content/sep_titular/fields/localidade_rep/@table='true'">
                                                                                    <th align="" item-name="localidade_rep">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_titular/fields/localidade_rep/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_titular/fields/lugar_rep">
                                                                                <xsl:if test="//rows/content/sep_titular/fields/lugar_rep/@table='true'">
                                                                                    <th align="" item-name="lugar_rep">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_titular/fields/lugar_rep/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_titular/fields/rua_rep">
                                                                                <xsl:if test="//rows/content/sep_titular/fields/rua_rep/@table='true'">
                                                                                    <th align="" item-name="rua_rep">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_titular/fields/rua_rep/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_titular/fields/piso_rep">
                                                                                <xsl:if test="//rows/content/sep_titular/fields/piso_rep/@table='true'">
                                                                                    <th align="" item-name="piso_rep">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_titular/fields/piso_rep/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_titular/fields/pais_rep">
                                                                                <xsl:if test="//rows/content/sep_titular/fields/pais_rep/@table='true'">
                                                                                    <th align="" item-name="pais_rep">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_titular/fields/pais_rep/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_titular/fields/telemovel_rep">
                                                                                <xsl:if test="//rows/content/sep_titular/fields/telemovel_rep/@table='true'">
                                                                                    <th align="" item-name="telemovel_rep">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_titular/fields/telemovel_rep/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_titular/fields/telefone_rep">
                                                                                <xsl:if test="//rows/content/sep_titular/fields/telefone_rep/@table='true'">
                                                                                    <th align="" item-name="telefone_rep">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_titular/fields/telefone_rep/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_titular/fields/email_rep">
                                                                                <xsl:if test="//rows/content/sep_titular/fields/email_rep/@table='true'">
                                                                                    <th align="" item-name="email_rep">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_titular/fields/email_rep/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <th class="table-btn">
                                                                                <a class="table-row-add btn btn-link">
                                                                                    <i class="fa fa-plus"/>
                                                                                </a>
                                                                            </th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <xsl:for-each select="rows/content/sep_titular/table/value/row">
                                                                            <tr>
                                                                                <input type="hidden" class="sl-row-id" name="p_sep_titular_id" value="{sep_titular_id}"/>
                                                                                <input type="hidden" name="p_localidade_id_fk" value="{localidade_id}"/>
                                                                                <input type="hidden" name="p_localidade_id_fk_desc" value="{localidade_id_desc}"/>
                                                                                <input type="hidden" name="p_percentagem_fk" value="{percentagem}"/>
                                                                                <input type="hidden" name="p_percentagem_fk_desc" value="{percentagem_desc}"/>
                                                                                <input type="hidden" name="p_localidade_id_rep_fk" value="{localidade_id_rep}"/>
                                                                                <input type="hidden" name="p_localidade_id_rep_fk_desc" value="{localidade_id_rep_desc}"/>
                                                                                <xsl:if test="nome">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="//rows/content/sep_titular/fields/nome/@table='true'">
                                                                                            <td field="nome" data-row="{position()}" data-title="{../../../fields/nome/label}" class="text">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="nome_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_nome_fk" value="{nome}"/>
                                                                                                <input type="hidden" name="p_nome_fk_desc" value="{nome_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_nome_fk" value="{nome}"/>
                                                                                            <input type="hidden" name="p_nome_fk_desc" value="{nome_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="nif">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="//rows/content/sep_titular/fields/nif/@table='true'">
                                                                                            <td field="nif" data-row="{position()}" data-title="{../../../fields/nif/label}" class="lookup">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="nif_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_nif_fk" value="{nif}"/>
                                                                                                <input type="hidden" name="p_nif_fk_desc" value="{nif_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_nif_fk" value="{nif}"/>
                                                                                            <input type="hidden" name="p_nif_fk_desc" value="{nif_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="pesq_info_titular">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="//rows/content/sep_titular/fields/pesq_info_titular/@table='true'">
                                                                                            <td field="pesq_info_titular" data-row="{position()}" data-title="{../../../fields/pesq_info_titular/label}" class="lookup">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="pesq_info_titular_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_pesq_info_titular_fk" value="{pesq_info_titular}"/>
                                                                                                <input type="hidden" name="p_pesq_info_titular_fk_desc" value="{pesq_info_titular_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_pesq_info_titular_fk" value="{pesq_info_titular}"/>
                                                                                            <input type="hidden" name="p_pesq_info_titular_fk_desc" value="{pesq_info_titular_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="tipologia_titular">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="//rows/content/sep_titular/fields/tipologia_titular/@table='true'">
                                                                                            <td field="tipologia_titular" data-row="{position()}" data-title="{../../../fields/tipologia_titular/label}" class="select">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="tipologia_titular_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_tipologia_titular_fk" value="{tipologia_titular}"/>
                                                                                                <input type="hidden" name="p_tipologia_titular_fk_desc" value="{tipologia_titular_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_tipologia_titular_fk" value="{tipologia_titular}"/>
                                                                                            <input type="hidden" name="p_tipologia_titular_fk_desc" value="{tipologia_titular_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="tp_doc_titular">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="//rows/content/sep_titular/fields/tp_doc_titular/@table='true'">
                                                                                            <td field="tp_doc_titular" data-row="{position()}" data-title="{../../../fields/tp_doc_titular/label}" class="select">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="tp_doc_titular_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_tp_doc_titular_fk" value="{tp_doc_titular}"/>
                                                                                                <input type="hidden" name="p_tp_doc_titular_fk_desc" value="{tp_doc_titular_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_tp_doc_titular_fk" value="{tp_doc_titular}"/>
                                                                                            <input type="hidden" name="p_tp_doc_titular_fk_desc" value="{tp_doc_titular_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="nr_doc_titular">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="//rows/content/sep_titular/fields/nr_doc_titular/@table='true'">
                                                                                            <td field="nr_doc_titular" data-row="{position()}" data-title="{../../../fields/nr_doc_titular/label}" class="text">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="nr_doc_titular_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_nr_doc_titular_fk" value="{nr_doc_titular}"/>
                                                                                                <input type="hidden" name="p_nr_doc_titular_fk_desc" value="{nr_doc_titular_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_nr_doc_titular_fk" value="{nr_doc_titular}"/>
                                                                                            <input type="hidden" name="p_nr_doc_titular_fk_desc" value="{nr_doc_titular_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="dt_nasc_titular">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="//rows/content/sep_titular/fields/dt_nasc_titular/@table='true'">
                                                                                            <td field="dt_nasc_titular" data-row="{position()}" data-title="{../../../fields/dt_nasc_titular/label}" class="date">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="dt_nasc_titular_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_dt_nasc_titular_fk" value="{dt_nasc_titular}"/>
                                                                                                <input type="hidden" name="p_dt_nasc_titular_fk_desc" value="{dt_nasc_titular_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_dt_nasc_titular_fk" value="{dt_nasc_titular}"/>
                                                                                            <input type="hidden" name="p_dt_nasc_titular_fk_desc" value="{dt_nasc_titular_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="genero_titular">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="//rows/content/sep_titular/fields/genero_titular/@table='true'">
                                                                                            <td field="genero_titular" data-row="{position()}" data-title="{../../../fields/genero_titular/label}" class="select">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="genero_titular_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_genero_titular_fk" value="{genero_titular}"/>
                                                                                                <input type="hidden" name="p_genero_titular_fk_desc" value="{genero_titular_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_genero_titular_fk" value="{genero_titular}"/>
                                                                                            <input type="hidden" name="p_genero_titular_fk_desc" value="{genero_titular_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="domicilio_sede">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="//rows/content/sep_titular/fields/domicilio_sede/@table='true'">
                                                                                            <td field="domicilio_sede" data-row="{position()}" data-title="{../../../fields/domicilio_sede/label}" class="lookup">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="domicilio_sede_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_domicilio_sede_fk" value="{domicilio_sede}"/>
                                                                                                <input type="hidden" name="p_domicilio_sede_fk_desc" value="{domicilio_sede_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_domicilio_sede_fk" value="{domicilio_sede}"/>
                                                                                            <input type="hidden" name="p_domicilio_sede_fk_desc" value="{domicilio_sede_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="localidade">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="//rows/content/sep_titular/fields/localidade/@table='true'">
                                                                                            <td field="localidade" data-row="{position()}" data-title="{../../../fields/localidade/label}" class="lookup">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="localidade_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_localidade_fk" value="{localidade}"/>
                                                                                                <input type="hidden" name="p_localidade_fk_desc" value="{localidade_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_localidade_fk" value="{localidade}"/>
                                                                                            <input type="hidden" name="p_localidade_fk_desc" value="{localidade_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="lugar">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="//rows/content/sep_titular/fields/lugar/@table='true'">
                                                                                            <td field="lugar" data-row="{position()}" data-title="{../../../fields/lugar/label}" class="text">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="lugar_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_lugar_fk" value="{lugar}"/>
                                                                                                <input type="hidden" name="p_lugar_fk_desc" value="{lugar_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_lugar_fk" value="{lugar}"/>
                                                                                            <input type="hidden" name="p_lugar_fk_desc" value="{lugar_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="rua_titular">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="//rows/content/sep_titular/fields/rua_titular/@table='true'">
                                                                                            <td field="rua_titular" data-row="{position()}" data-title="{../../../fields/rua_titular/label}" class="text">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="rua_titular_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_rua_titular_fk" value="{rua_titular}"/>
                                                                                                <input type="hidden" name="p_rua_titular_fk_desc" value="{rua_titular_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_rua_titular_fk" value="{rua_titular}"/>
                                                                                            <input type="hidden" name="p_rua_titular_fk_desc" value="{rua_titular_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="andar">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="//rows/content/sep_titular/fields/andar/@table='true'">
                                                                                            <td field="andar" data-row="{position()}" data-title="{../../../fields/andar/label}" class="text">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="andar_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_andar_fk" value="{andar}"/>
                                                                                                <input type="hidden" name="p_andar_fk_desc" value="{andar_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_andar_fk" value="{andar}"/>
                                                                                            <input type="hidden" name="p_andar_fk_desc" value="{andar_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="pais">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="//rows/content/sep_titular/fields/pais/@table='true'">
                                                                                            <td field="pais" data-row="{position()}" data-title="{../../../fields/pais/label}" class="text">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="pais_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_pais_fk" value="{pais}"/>
                                                                                                <input type="hidden" name="p_pais_fk_desc" value="{pais_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_pais_fk" value="{pais}"/>
                                                                                            <input type="hidden" name="p_pais_fk_desc" value="{pais_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="estado_civil">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="//rows/content/sep_titular/fields/estado_civil/@table='true'">
                                                                                            <td field="estado_civil" data-row="{position()}" data-title="{../../../fields/estado_civil/label}" class="select">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="estado_civil_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_estado_civil_fk" value="{estado_civil}"/>
                                                                                                <input type="hidden" name="p_estado_civil_fk_desc" value="{estado_civil_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_estado_civil_fk" value="{estado_civil}"/>
                                                                                            <input type="hidden" name="p_estado_civil_fk_desc" value="{estado_civil_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="meeiro">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="//rows/content/sep_titular/fields/meeiro/@table='true'">
                                                                                            <td field="meeiro" data-row="{position()}" data-title="{../../../fields/meeiro/label}" class="select">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="meeiro_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_meeiro_fk" value="{meeiro}"/>
                                                                                                <input type="hidden" name="p_meeiro_fk_desc" value="{meeiro_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_meeiro_fk" value="{meeiro}"/>
                                                                                            <input type="hidden" name="p_meeiro_fk_desc" value="{meeiro_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="conjugue">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="//rows/content/sep_titular/fields/conjugue/@table='true'">
                                                                                            <td field="conjugue" data-row="{position()}" data-title="{../../../fields/conjugue/label}" class="text">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="conjugue_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_conjugue_fk" value="{conjugue}"/>
                                                                                                <input type="hidden" name="p_conjugue_fk_desc" value="{conjugue_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_conjugue_fk" value="{conjugue}"/>
                                                                                            <input type="hidden" name="p_conjugue_fk_desc" value="{conjugue_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="regime_bens">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="//rows/content/sep_titular/fields/regime_bens/@table='true'">
                                                                                            <td field="regime_bens" data-row="{position()}" data-title="{../../../fields/regime_bens/label}" class="select">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="regime_bens_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_regime_bens_fk" value="{regime_bens}"/>
                                                                                                <input type="hidden" name="p_regime_bens_fk_desc" value="{regime_bens_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_regime_bens_fk" value="{regime_bens}"/>
                                                                                            <input type="hidden" name="p_regime_bens_fk_desc" value="{regime_bens_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="tip_doc_conj">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="//rows/content/sep_titular/fields/tip_doc_conj/@table='true'">
                                                                                            <td field="tip_doc_conj" data-row="{position()}" data-title="{../../../fields/tip_doc_conj/label}" class="select">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="tip_doc_conj_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_tip_doc_conj_fk" value="{tip_doc_conj}"/>
                                                                                                <input type="hidden" name="p_tip_doc_conj_fk_desc" value="{tip_doc_conj_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_tip_doc_conj_fk" value="{tip_doc_conj}"/>
                                                                                            <input type="hidden" name="p_tip_doc_conj_fk_desc" value="{tip_doc_conj_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="numero_documento">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="//rows/content/sep_titular/fields/numero_documento/@table='true'">
                                                                                            <td field="numero_documento" data-row="{position()}" data-title="{../../../fields/numero_documento/label}" class="text">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="numero_documento_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_numero_documento_fk" value="{numero_documento}"/>
                                                                                                <input type="hidden" name="p_numero_documento_fk_desc" value="{numero_documento_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_numero_documento_fk" value="{numero_documento}"/>
                                                                                            <input type="hidden" name="p_numero_documento_fk_desc" value="{numero_documento_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="telemovel">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="//rows/content/sep_titular/fields/telemovel/@table='true'">
                                                                                            <td field="telemovel" data-row="{position()}" data-title="{../../../fields/telemovel/label}" class="text">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="telemovel_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_telemovel_fk" value="{telemovel}"/>
                                                                                                <input type="hidden" name="p_telemovel_fk_desc" value="{telemovel_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_telemovel_fk" value="{telemovel}"/>
                                                                                            <input type="hidden" name="p_telemovel_fk_desc" value="{telemovel_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="telefone">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="//rows/content/sep_titular/fields/telefone/@table='true'">
                                                                                            <td field="telefone" data-row="{position()}" data-title="{../../../fields/telefone/label}" class="text">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="telefone_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_telefone_fk" value="{telefone}"/>
                                                                                                <input type="hidden" name="p_telefone_fk_desc" value="{telefone_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_telefone_fk" value="{telefone}"/>
                                                                                            <input type="hidden" name="p_telefone_fk_desc" value="{telefone_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="email">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="//rows/content/sep_titular/fields/email/@table='true'">
                                                                                            <td field="email" data-row="{position()}" data-title="{../../../fields/email/label}" class="email">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="email_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_email_fk" value="{email}"/>
                                                                                                <input type="hidden" name="p_email_fk_desc" value="{email_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_email_fk" value="{email}"/>
                                                                                            <input type="hidden" name="p_email_fk_desc" value="{email_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="tipo_direito">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="//rows/content/sep_titular/fields/tipo_direito/@table='true'">
                                                                                            <td field="tipo_direito" data-row="{position()}" data-title="{../../../fields/tipo_direito/label}" class="select">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="tipo_direito_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_tipo_direito_fk" value="{tipo_direito}"/>
                                                                                                <input type="hidden" name="p_tipo_direito_fk_desc" value="{tipo_direito_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_tipo_direito_fk" value="{tipo_direito}"/>
                                                                                            <input type="hidden" name="p_tipo_direito_fk_desc" value="{tipo_direito_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="numerador">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="//rows/content/sep_titular/fields/numerador/@table='true'">
                                                                                            <td field="numerador" data-row="{position()}" data-title="{../../../fields/numerador/label}" class="number">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="numerador_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_numerador_fk" value="{numerador}"/>
                                                                                                <input type="hidden" name="p_numerador_fk_desc" value="{numerador_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_numerador_fk" value="{numerador}"/>
                                                                                            <input type="hidden" name="p_numerador_fk_desc" value="{numerador_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="denominador">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="//rows/content/sep_titular/fields/denominador/@table='true'">
                                                                                            <td field="denominador" data-row="{position()}" data-title="{../../../fields/denominador/label}" class="number">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="denominador_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_denominador_fk" value="{denominador}"/>
                                                                                                <input type="hidden" name="p_denominador_fk_desc" value="{denominador_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_denominador_fk" value="{denominador}"/>
                                                                                            <input type="hidden" name="p_denominador_fk_desc" value="{denominador_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="causas_aquisicao">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="//rows/content/sep_titular/fields/causas_aquisicao/@table='true'">
                                                                                            <td field="causas_aquisicao" data-row="{position()}" data-title="{../../../fields/causas_aquisicao/label}" class="lookup">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="causas_aquisicao_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_causas_aquisicao_fk" value="{causas_aquisicao}"/>
                                                                                                <input type="hidden" name="p_causas_aquisicao_fk_desc" value="{causas_aquisicao_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_causas_aquisicao_fk" value="{causas_aquisicao}"/>
                                                                                            <input type="hidden" name="p_causas_aquisicao_fk_desc" value="{causas_aquisicao_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="dt_causa">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="//rows/content/sep_titular/fields/dt_causa/@table='true'">
                                                                                            <td field="dt_causa" data-row="{position()}" data-title="{../../../fields/dt_causa/label}" class="date">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="dt_causa_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_dt_causa_fk" value="{dt_causa}"/>
                                                                                                <input type="hidden" name="p_dt_causa_fk_desc" value="{dt_causa_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_dt_causa_fk" value="{dt_causa}"/>
                                                                                            <input type="hidden" name="p_dt_causa_fk_desc" value="{dt_causa_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="duracao_facto">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="//rows/content/sep_titular/fields/duracao_facto/@table='true'">
                                                                                            <td field="duracao_facto" data-row="{position()}" data-title="{../../../fields/duracao_facto/label}" class="number">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="duracao_facto_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_duracao_facto_fk" value="{duracao_facto}"/>
                                                                                                <input type="hidden" name="p_duracao_facto_fk_desc" value="{duracao_facto_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_duracao_facto_fk" value="{duracao_facto}"/>
                                                                                            <input type="hidden" name="p_duracao_facto_fk_desc" value="{duracao_facto_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="medida_duracao">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="//rows/content/sep_titular/fields/medida_duracao/@table='true'">
                                                                                            <td field="medida_duracao" data-row="{position()}" data-title="{../../../fields/medida_duracao/label}" class="select">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="medida_duracao_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_medida_duracao_fk" value="{medida_duracao}"/>
                                                                                                <input type="hidden" name="p_medida_duracao_fk_desc" value="{medida_duracao_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_medida_duracao_fk" value="{medida_duracao}"/>
                                                                                            <input type="hidden" name="p_medida_duracao_fk_desc" value="{medida_duracao_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="com_representacao">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="//rows/content/sep_titular/fields/com_representacao/@table='true'">
                                                                                            <td field="com_representacao" data-row="{position()}" data-title="{../../../fields/com_representacao/label}" class="select">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="com_representacao_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_com_representacao_fk" value="{com_representacao}"/>
                                                                                                <input type="hidden" name="p_com_representacao_fk_desc" value="{com_representacao_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_com_representacao_fk" value="{com_representacao}"/>
                                                                                            <input type="hidden" name="p_com_representacao_fk_desc" value="{com_representacao_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="nome_rep">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="//rows/content/sep_titular/fields/nome_rep/@table='true'">
                                                                                            <td field="nome_rep" data-row="{position()}" data-title="{../../../fields/nome_rep/label}" class="text">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="nome_rep_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_nome_rep_fk" value="{nome_rep}"/>
                                                                                                <input type="hidden" name="p_nome_rep_fk_desc" value="{nome_rep_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_nome_rep_fk" value="{nome_rep}"/>
                                                                                            <input type="hidden" name="p_nome_rep_fk_desc" value="{nome_rep_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="nif_rep">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="//rows/content/sep_titular/fields/nif_rep/@table='true'">
                                                                                            <td field="nif_rep" data-row="{position()}" data-title="{../../../fields/nif_rep/label}" class="lookup">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="nif_rep_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_nif_rep_fk" value="{nif_rep}"/>
                                                                                                <input type="hidden" name="p_nif_rep_fk_desc" value="{nif_rep_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_nif_rep_fk" value="{nif_rep}"/>
                                                                                            <input type="hidden" name="p_nif_rep_fk_desc" value="{nif_rep_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="tp_doc_rep">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="//rows/content/sep_titular/fields/tp_doc_rep/@table='true'">
                                                                                            <td field="tp_doc_rep" data-row="{position()}" data-title="{../../../fields/tp_doc_rep/label}" class="select">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="tp_doc_rep_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_tp_doc_rep_fk" value="{tp_doc_rep}"/>
                                                                                                <input type="hidden" name="p_tp_doc_rep_fk_desc" value="{tp_doc_rep_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_tp_doc_rep_fk" value="{tp_doc_rep}"/>
                                                                                            <input type="hidden" name="p_tp_doc_rep_fk_desc" value="{tp_doc_rep_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="nr_doc_rep">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="//rows/content/sep_titular/fields/nr_doc_rep/@table='true'">
                                                                                            <td field="nr_doc_rep" data-row="{position()}" data-title="{../../../fields/nr_doc_rep/label}" class="text">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="nr_doc_rep_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_nr_doc_rep_fk" value="{nr_doc_rep}"/>
                                                                                                <input type="hidden" name="p_nr_doc_rep_fk_desc" value="{nr_doc_rep_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_nr_doc_rep_fk" value="{nr_doc_rep}"/>
                                                                                            <input type="hidden" name="p_nr_doc_rep_fk_desc" value="{nr_doc_rep_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="domicilio_sede_rep">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="//rows/content/sep_titular/fields/domicilio_sede_rep/@table='true'">
                                                                                            <td field="domicilio_sede_rep" data-row="{position()}" data-title="{../../../fields/domicilio_sede_rep/label}" class="lookup">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="domicilio_sede_rep_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_domicilio_sede_rep_fk" value="{domicilio_sede_rep}"/>
                                                                                                <input type="hidden" name="p_domicilio_sede_rep_fk_desc" value="{domicilio_sede_rep_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_domicilio_sede_rep_fk" value="{domicilio_sede_rep}"/>
                                                                                            <input type="hidden" name="p_domicilio_sede_rep_fk_desc" value="{domicilio_sede_rep_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="localidade_rep">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="//rows/content/sep_titular/fields/localidade_rep/@table='true'">
                                                                                            <td field="localidade_rep" data-row="{position()}" data-title="{../../../fields/localidade_rep/label}" class="lookup">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="localidade_rep_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_localidade_rep_fk" value="{localidade_rep}"/>
                                                                                                <input type="hidden" name="p_localidade_rep_fk_desc" value="{localidade_rep_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_localidade_rep_fk" value="{localidade_rep}"/>
                                                                                            <input type="hidden" name="p_localidade_rep_fk_desc" value="{localidade_rep_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="lugar_rep">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="//rows/content/sep_titular/fields/lugar_rep/@table='true'">
                                                                                            <td field="lugar_rep" data-row="{position()}" data-title="{../../../fields/lugar_rep/label}" class="text">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="lugar_rep_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_lugar_rep_fk" value="{lugar_rep}"/>
                                                                                                <input type="hidden" name="p_lugar_rep_fk_desc" value="{lugar_rep_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_lugar_rep_fk" value="{lugar_rep}"/>
                                                                                            <input type="hidden" name="p_lugar_rep_fk_desc" value="{lugar_rep_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="rua_rep">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="//rows/content/sep_titular/fields/rua_rep/@table='true'">
                                                                                            <td field="rua_rep" data-row="{position()}" data-title="{../../../fields/rua_rep/label}" class="text">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="rua_rep_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_rua_rep_fk" value="{rua_rep}"/>
                                                                                                <input type="hidden" name="p_rua_rep_fk_desc" value="{rua_rep_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_rua_rep_fk" value="{rua_rep}"/>
                                                                                            <input type="hidden" name="p_rua_rep_fk_desc" value="{rua_rep_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="piso_rep">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="//rows/content/sep_titular/fields/piso_rep/@table='true'">
                                                                                            <td field="piso_rep" data-row="{position()}" data-title="{../../../fields/piso_rep/label}" class="text">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="piso_rep_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_piso_rep_fk" value="{piso_rep}"/>
                                                                                                <input type="hidden" name="p_piso_rep_fk_desc" value="{piso_rep_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_piso_rep_fk" value="{piso_rep}"/>
                                                                                            <input type="hidden" name="p_piso_rep_fk_desc" value="{piso_rep_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="pais_rep">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="//rows/content/sep_titular/fields/pais_rep/@table='true'">
                                                                                            <td field="pais_rep" data-row="{position()}" data-title="{../../../fields/pais_rep/label}" class="text">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="pais_rep_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_pais_rep_fk" value="{pais_rep}"/>
                                                                                                <input type="hidden" name="p_pais_rep_fk_desc" value="{pais_rep_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_pais_rep_fk" value="{pais_rep}"/>
                                                                                            <input type="hidden" name="p_pais_rep_fk_desc" value="{pais_rep_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="telemovel_rep">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="//rows/content/sep_titular/fields/telemovel_rep/@table='true'">
                                                                                            <td field="telemovel_rep" data-row="{position()}" data-title="{../../../fields/telemovel_rep/label}" class="text">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="telemovel_rep_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_telemovel_rep_fk" value="{telemovel_rep}"/>
                                                                                                <input type="hidden" name="p_telemovel_rep_fk_desc" value="{telemovel_rep_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_telemovel_rep_fk" value="{telemovel_rep}"/>
                                                                                            <input type="hidden" name="p_telemovel_rep_fk_desc" value="{telemovel_rep_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="telefone_rep">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="//rows/content/sep_titular/fields/telefone_rep/@table='true'">
                                                                                            <td field="telefone_rep" data-row="{position()}" data-title="{../../../fields/telefone_rep/label}" class="text">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="telefone_rep_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_telefone_rep_fk" value="{telefone_rep}"/>
                                                                                                <input type="hidden" name="p_telefone_rep_fk_desc" value="{telefone_rep_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_telefone_rep_fk" value="{telefone_rep}"/>
                                                                                            <input type="hidden" name="p_telefone_rep_fk_desc" value="{telefone_rep_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="email_rep">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="//rows/content/sep_titular/fields/email_rep/@table='true'">
                                                                                            <td field="email_rep" data-row="{position()}" data-title="{../../../fields/email_rep/label}" class="email">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="email_rep_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_email_rep_fk" value="{email_rep}"/>
                                                                                                <input type="hidden" name="p_email_rep_fk_desc" value="{email_rep_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_email_rep_fk" value="{email_rep}"/>
                                                                                            <input type="hidden" name="p_email_rep_fk_desc" value="{email_rep_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <td data-row="{position()}" class="table-btn">
                                                                                    <xsl:if test="not(@noupdate)">
                                                                                        <span class="table-row-edit btn btn-default " rel="sep_titular">
                                                                                            <i class="fa fa-pencil"/>
                                                                                        </span>
                                                                                    </xsl:if>
                                                                                    <xsl:if test="not(@nodelete)">
                                                                                        <span class="table-row-remove btn btn-danger" rel="sep_titular">
                                                                                            <i class="fa fa-times"/>
                                                                                        </span>
                                                                                    </xsl:if>
                                                                                </td>
                                                                            </tr>
                                                                        </xsl:for-each>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="gen-column col-md-5">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/lista_associacao">
                                                    <div class="box box-table-contents gen-container-item " item-name="lista_associacao">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/lista_associacao/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body table-box">
                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/lista_associacao/fields"/>
                                                            <table id="lista_associacao" class="table table-striped gen-data-table ">
                                                                <thead>
                                                                    <tr>
                                                                        <xsl:if test="rows/content/lista_associacao/fields/matriz">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/lista_associacao/fields/matriz/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/lista_associacao/fields/n_registo_predial">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/lista_associacao/fields/n_registo_predial/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/lista_associacao/fields/acto_notarial">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/lista_associacao/fields/acto_notarial/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/lista_associacao/fields/n_ordem_alvara">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/lista_associacao/fields/n_ordem_alvara/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/lista_associacao/fields/ver_detalhes">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/lista_associacao/fields/ver_detalhes/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/lista_associacao/table/value/row">
                                                                        <tr>
                                                                            <input type="hidden" name="p_id_associacao_fk" value="{id_associacao}"/>
                                                                            <input type="hidden" name="p_id_associacao_fk_desc" value="{id_associacao_desc}"/>
                                                                            <input type="hidden" name="p_id_predial_fk" value="{id_predial}"/>
                                                                            <input type="hidden" name="p_id_predial_fk_desc" value="{id_predial_desc}"/>
                                                                            <input type="hidden" name="p_id_camara_fk" value="{id_camara}"/>
                                                                            <input type="hidden" name="p_id_camara_fk_desc" value="{id_camara_desc}"/>
                                                                            <input type="hidden" name="p_id_municipio_fk" value="{id_municipio}"/>
                                                                            <input type="hidden" name="p_id_municipio_fk_desc" value="{id_municipio_desc}"/>
                                                                            <input type="hidden" name="p_id_alvara_fk" value="{id_alvara}"/>
                                                                            <input type="hidden" name="p_id_alvara_fk_desc" value="{id_alvara_desc}"/>
                                                                            <input type="hidden" name="p_id_notario_fk" value="{id_notario}"/>
                                                                            <input type="hidden" name="p_id_notario_fk_desc" value="{id_notario_desc}"/>
                                                                            <xsl:if test="matriz">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/matriz/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="matriz"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="n_registo_predial">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/n_registo_predial/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="n_registo_predial"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="acto_notarial">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/acto_notarial/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="acto_notarial"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="n_ordem_alvara">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/n_ordem_alvara/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="n_ordem_alvara"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="ver_detalhes">
                                                                                <td align="left" data-row="{position()}" data-title="{../../label/ver_detalhes}" class="link">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="ver_detalhes != ''">
                                                                                            <a href="{ver_detalhes}" class="link bClick" target="_self" name="ver_detalhes">
                                                                                                <xsl:value-of select="ver_detalhes_desc" disable-output-escaping="yes"/>
                                                                                            </a>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <span>
                                                                                                <xsl:value-of select="ver_detalhes_desc" disable-output-escaping="yes"/>
                                                                                            </span>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </td>
                                                                            </xsl:if>
                                                                        </tr>
                                                                    </xsl:for-each>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                        <div class="gen-column col-md-7">
                                            <div class="gen-inner"/></div>
                                    </div>
                                    <div class="row">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/anexos">
                                                    <div class="box gen-container-item " item-name="anexos">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/anexos/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body IGRP-separatorlist" tag="anexos" dialog="false">
                                                            <div class="splist-form-holder">
                                                                <div class="splist-form" role="form">
                                                                    <xsl:apply-templates mode="form-hidden-fields" select="rows/content/anexos/fields"/>
                                                                    <xsl:if test="rows/content/anexos/fields/anexo">
                                                                        <div class="form-group col-md-3  gen-fields-holder" item-name="anexo" item-type="file">
                                                                            <label for="{rows/content/anexos/fields/anexo/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/anexos/fields/anexo/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <div class="input-group">
                                                                                <input type="text" class="form-control not-form" readonly=""/>
                                                                                <span class="input-group-btn">
                                                                                    <span class="btn btn-default file-btn-holder">
                                                                                        <i class="fa fa-upload"/>
                                                                                        <input id="{rows/content/anexos/fields/anexo/@name}" name="{rows/content/anexos/fields/anexo/@name}" value="{rows/content/anexos/fields/anexo/value}" class="transparent" type="file" multiple=""/>
                                                                                    </span>
                                                                                </span>
                                                                            </div>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/anexos/fields/tp_documento_anex">
                                                                        <div class="col-md-3 form-group  gen-fields-holder" item-name="tp_documento_anex" item-type="select">
                                                                            <label for="{rows/content/anexos/fields/tp_documento_anex/@name}">
                                                                                <xsl:value-of select="rows/content/anexos/fields/tp_documento_anex/label"/>
                                                                            </label>
                                                                            <select class="form-control select2 " id="anexos_tp_documento_anex" name="{rows/content/anexos/fields/tp_documento_anex/@name}">
                                                                                <xsl:for-each select="rows/content/anexos/fields/tp_documento_anex/list/option">
                                                                                    <option value="{value}" label="{text}">
                                                                                        <xsl:if test="@selected='true'">
                                                                                            <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                        </xsl:if>
                                                                                        <span>
                                                                                            <xsl:value-of select="text"/>
                                                                                        </span>
                                                                                    </option>
                                                                                </xsl:for-each>
                                                                            </select>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/anexos/fields/descricao">
                                                                        <div class="form-group col-md-3  gen-fields-holder" item-name="descricao" item-type="textarea">
                                                                            <label for="{rows/content/anexos/fields/descricao/@name}">
                                                                                <xsl:value-of select="rows/content/anexos/fields/descricao/label"/>
                                                                            </label>
                                                                            <textarea name="{rows/content/anexos/fields/descricao/@name}" class="textarea form-control" maxlength="250">
                                                                                <xsl:value-of select="rows/content/anexos/fields/descricao/value"/>
                                                                            </textarea>
                                                                        </div>
                                                                    </xsl:if>
                                                                </div>
                                                            </div>
                                                            <div class="table-box box-body box-table-contents splist-table">
                                                                <table rel="T_anexos" id="anexos" class="table table-striped gen-data-table">
                                                                    <thead>
                                                                        <tr>
                                                                            <xsl:if test="rows/content/anexos/fields/anexo">
                                                                                <xsl:if test="//rows/content/anexos/fields/anexo/@table='true'">
                                                                                    <th align="" item-name="anexo">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/anexos/fields/anexo/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/anexos/fields/tp_documento_anex">
                                                                                <xsl:if test="//rows/content/anexos/fields/tp_documento_anex/@table='true'">
                                                                                    <th align="" item-name="tp_documento_anex">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/anexos/fields/tp_documento_anex/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/anexos/fields/descricao">
                                                                                <xsl:if test="//rows/content/anexos/fields/descricao/@table='true'">
                                                                                    <th align="" item-name="descricao">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/anexos/fields/descricao/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <th class="table-btn">
                                                                                <a class="table-row-add btn btn-link">
                                                                                    <i class="fa fa-plus"/>
                                                                                </a>
                                                                            </th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <xsl:for-each select="rows/content/anexos/table/value/row">
                                                                            <tr>
                                                                                <input type="hidden" class="sl-row-id" name="p_anexos_id" value="{anexos_id}"/>
                                                                                <xsl:if test="anexo">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="//rows/content/anexos/fields/anexo/@table='true'">
                                                                                            <td field="anexo" data-row="{position()}" data-title="{../../../fields/anexo/label}" class="file">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="anexo_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_anexo_fk" value="{anexo}"/>
                                                                                                <input type="hidden" name="p_anexo_fk_desc" value="{anexo_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_anexo_fk" value="{anexo}"/>
                                                                                            <input type="hidden" name="p_anexo_fk_desc" value="{anexo_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="tp_documento_anex">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="//rows/content/anexos/fields/tp_documento_anex/@table='true'">
                                                                                            <td field="tp_documento_anex" data-row="{position()}" data-title="{../../../fields/tp_documento_anex/label}" class="select">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="tp_documento_anex_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_tp_documento_anex_fk" value="{tp_documento_anex}"/>
                                                                                                <input type="hidden" name="p_tp_documento_anex_fk_desc" value="{tp_documento_anex_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_tp_documento_anex_fk" value="{tp_documento_anex}"/>
                                                                                            <input type="hidden" name="p_tp_documento_anex_fk_desc" value="{tp_documento_anex_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="descricao">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="//rows/content/anexos/fields/descricao/@table='true'">
                                                                                            <td field="descricao" data-row="{position()}" data-title="{../../../fields/descricao/label}" class="textarea">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="descricao_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_descricao_fk" value="{descricao}"/>
                                                                                                <input type="hidden" name="p_descricao_fk_desc" value="{descricao_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_descricao_fk" value="{descricao}"/>
                                                                                            <input type="hidden" name="p_descricao_fk_desc" value="{descricao_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <td data-row="{position()}" class="table-btn">
                                                                                    <xsl:if test="not(@noupdate)">
                                                                                        <span class="table-row-edit btn btn-default " rel="anexos">
                                                                                            <i class="fa fa-pencil"/>
                                                                                        </span>
                                                                                    </xsl:if>
                                                                                    <xsl:if test="not(@nodelete)">
                                                                                        <span class="table-row-remove btn btn-danger" rel="anexos">
                                                                                            <i class="fa fa-times"/>
                                                                                        </span>
                                                                                    </xsl:if>
                                                                                </td>
                                                                            </tr>
                                                                        </xsl:for-each>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
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
                <!-- SEPARATORLIST JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/separatorlist/igrp.separatorlist.js"/>
                <!-- TABLE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/table/jquery.dataTables.min.js"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/dataTables.bootstrap.min.js"/>
                <!-- SELECT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js"/>
                <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js"/>
                <!-- LOOKUP JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/lookup/igrp.lookup.js"/>
                <!-- DATE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/datetimepicker.js"/>
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/dtp.init.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1483119250466"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1483119250466"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1483119250466"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1483119250466"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1483119250467"/>
    <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1483119250467"/>
</xsl:stylesheet>