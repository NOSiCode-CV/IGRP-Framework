<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- FORM CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/form/igrp.forms.css"/>
                <!-- TABLE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css"/>
                <!-- SELECT CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.min.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.style.css"/>
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
                                    <div class="row">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                                                <xsl:if test="rows/content/form_2">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_2">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_2/fields"/>
                                                                <xsl:if test="rows/content/form_2/fields/nip">
                                                                    <div class="form-group col-md-2   gen-fields-holder" item-name="nip" item-type="text">
                                                                        <label for="{rows/content/form_2/fields/nip/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_2/fields/nip/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_2/fields/nip/value}" class="form-control" id="{rows/content/form_2/fields/nip/@name}" name="{rows/content/form_2/fields/nip/@name}" readonly="readonly" maxlength="30"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_2/fields/codigo_proposta">
                                                                    <div class="form-group col-md-2   gen-fields-holder" item-name="codigo_proposta" item-type="text">
                                                                        <label for="{rows/content/form_2/fields/codigo_proposta/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_2/fields/codigo_proposta/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_2/fields/codigo_proposta/value}" class="form-control" id="{rows/content/form_2/fields/codigo_proposta/@name}" name="{rows/content/form_2/fields/codigo_proposta/@name}" readonly="readonly" maxlength="30"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_2/fields/cidadezona">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="cidadezona" item-type="text">
                                                                        <label for="{rows/content/form_2/fields/cidadezona/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_2/fields/cidadezona/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_2/fields/cidadezona/value}" class="form-control" id="{rows/content/form_2/fields/cidadezona/@name}" name="{rows/content/form_2/fields/cidadezona/@name}" readonly="readonly" maxlength="100"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_2/fields/bairolugar">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="bairolugar" item-type="text">
                                                                        <label for="{rows/content/form_2/fields/bairolugar/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_2/fields/bairolugar/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_2/fields/bairolugar/value}" class="form-control" id="{rows/content/form_2/fields/bairolugar/@name}" name="{rows/content/form_2/fields/bairolugar/@name}" readonly="readonly" maxlength="100"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_2/fields/titulares">
                                                                    <div class="form-group col-md-12   gen-fields-holder" item-name="titulares" item-type="text">
                                                                        <label for="{rows/content/form_2/fields/titulares/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_2/fields/titulares/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_2/fields/titulares/value}" class="form-control" id="{rows/content/form_2/fields/titulares/@name}" name="{rows/content/form_2/fields/titulares/@name}" readonly="readonly" maxlength="4000"></input>
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
                                    <div class="row">
                                        <div class="gen-column col-md-6">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/form_1">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/form_1/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                                                <xsl:if test="rows/content/form_1/fields/aplicacao_o">
                                                                    <div class="form-group col-md-4   gen-fields-holder" item-name="aplicacao_o" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/aplicacao_o/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/aplicacao_o/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/aplicacao_o/value}" class="form-control" id="{rows/content/form_1/fields/aplicacao_o/@name}" name="{rows/content/form_1/fields/aplicacao_o/@name}" readonly="readonly" maxlength="100"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/organica_o">
                                                                    <div class="form-group col-md-4   gen-fields-holder" item-name="organica_o" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/organica_o/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/organica_o/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/organica_o/value}" class="form-control" id="{rows/content/form_1/fields/organica_o/@name}" name="{rows/content/form_1/fields/organica_o/@name}" readonly="readonly" maxlength="100"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/perfil_o">
                                                                    <div class="form-group col-md-4   gen-fields-holder" item-name="perfil_o" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/perfil_o/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/perfil_o/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/perfil_o/value}" class="form-control" id="{rows/content/form_1/fields/perfil_o/@name}" name="{rows/content/form_1/fields/perfil_o/@name}" readonly="readonly" maxlength="100"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/utilizador_o">
                                                                    <div class="form-group col-md-12   gen-fields-holder" item-name="utilizador_o" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/utilizador_o/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/utilizador_o/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/utilizador_o/value}" class="form-control" id="{rows/content/form_1/fields/utilizador_o/@name}" name="{rows/content/form_1/fields/utilizador_o/@name}" readonly="readonly" maxlength="200"></input>
                                                                    </div>
                                                                </xsl:if>
                                                            </div>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                        <div class="gen-column col-md-6">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/form_4">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_4">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/form_4/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_4/fields"/>
                                                                <xsl:if test="rows/content/form_4/fields/aplicacao">
                                                                    <div class="form-group col-md-4   gen-fields-holder" item-name="aplicacao" item-type="text">
                                                                        <label for="{rows/content/form_4/fields/aplicacao/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_4/fields/aplicacao/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_4/fields/aplicacao/value}" class="form-control" id="{rows/content/form_4/fields/aplicacao/@name}" name="{rows/content/form_4/fields/aplicacao/@name}" readonly="readonly" maxlength="100"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_4/fields/organica">
                                                                    <div class="form-group col-md-4   gen-fields-holder" item-name="organica" item-type="text">
                                                                        <label for="{rows/content/form_4/fields/organica/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_4/fields/organica/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_4/fields/organica/value}" class="form-control" id="{rows/content/form_4/fields/organica/@name}" name="{rows/content/form_4/fields/organica/@name}" readonly="readonly" maxlength="100"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_4/fields/perfil">
                                                                    <div class="form-group col-md-4   gen-fields-holder" item-name="perfil" item-type="text">
                                                                        <label for="{rows/content/form_4/fields/perfil/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_4/fields/perfil/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_4/fields/perfil/value}" class="form-control" id="{rows/content/form_4/fields/perfil/@name}" name="{rows/content/form_4/fields/perfil/@name}" readonly="readonly" maxlength="100"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_4/fields/utilizador_destino">
                                                                    <div class="col-md-12 form-group  gen-fields-holder" item-name="utilizador_destino" item-type="select">
                                                                        <label for="{rows/content/form_4/fields/utilizador_destino/@name}">
                                                                            <xsl:value-of select="rows/content/form_4/fields/utilizador_destino/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_4_utilizador_destino" name="{rows/content/form_4/fields/utilizador_destino/@name}">
                                                                            <xsl:for-each select="rows/content/form_4/fields/utilizador_destino/list/option">
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
                                                            </div>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/form_4/tools-bar" mode="form-buttons"/>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/form_3">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_3">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/form_3/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_3/fields"/>
                                                                <xsl:if test="rows/content/form_3/fields/textarea">
                                                                    <div class="form-group col-md-12  gen-fields-holder" item-name="textarea" item-type="textarea">
                                                                        <label for="{rows/content/form_3/fields/textarea/@name}">
                                                                            <xsl:value-of select="rows/content/form_3/fields/textarea/label"/>
                                                                        </label>
                                                                        <textarea name="{rows/content/form_3/fields/textarea/@name}" class="textarea form-control" maxlength="4000">
                                                                            <xsl:value-of select="rows/content/form_3/fields/textarea/value"/>
                                                                        </textarea>
                                                                    </div>
                                                                </xsl:if>
                                                            </div>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/form_3/tools-bar" mode="form-buttons"/>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/table_1">
                                                    <div class="box box-table-contents gen-container-item " gen-class="" item-name="table_1">
                                                        <div class="box-body table-box">
                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/table_1/fields"/>
                                                            <table id="table_1" class="table table-striped gen-data-table ">
                                                                <thead>
                                                                    <tr>
                                                                        <xsl:if test="rows/content/table_1/fields/entidade_obs">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/entidade_obs/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/data_obs">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/data_obs/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/observacao_obs">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/observacao_obs/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/table_1/table/value/row">
                                                                        <tr>
                                                                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                                            <xsl:if test="entidade_obs">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/entidade_obs/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="entidade_obs"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="data_obs">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/data_obs/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="data_obs"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="observacao_obs">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/observacao_obs/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="observacao_obs"/>
                                                                                    </span>
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
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <xsl:call-template name="IGRP-bottom"/>
                </form>
                <!-- FORM JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js"/>
                <!-- TABLE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/table/jquery.dataTables.min.js"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/dataTables.bootstrap.min.js"/>
                <!-- SELECT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js"/>
                <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1487260004884"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1487260004884"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1487260004884"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1487260004884"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1487260004884"/>
    <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1487260004885"/>
</xsl:stylesheet>