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
                                                <xsl:if test="rows/content/form_1">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                                                <xsl:if test="rows/content/form_1/fields/codigo_proposta">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="codigo_proposta" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/codigo_proposta/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/codigo_proposta/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/codigo_proposta/value}" class="form-control" id="{rows/content/form_1/fields/codigo_proposta/@name}" name="{rows/content/form_1/fields/codigo_proposta/@name}" maxlength="30" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/nip">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="nip" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/nip/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/nip/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/nip/value}" class="form-control" id="{rows/content/form_1/fields/nip/@name}" name="{rows/content/form_1/fields/nip/@name}" maxlength="30" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/n_processo">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="n_processo" item-type="number">
                                                                        <label for="{rows/content/form_1/fields/n_processo/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/n_processo/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="number" value="{rows/content/form_1/fields/n_processo/value}" class="form-control" id="{rows/content/form_1/fields/n_processo/@name}" name="{rows/content/form_1/fields/n_processo/@name}" maxlength="30" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/titular">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="titular" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/titular/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/titular/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/titular/value}" class="form-control" id="{rows/content/form_1/fields/titular/@name}" name="{rows/content/form_1/fields/titular/@name}" maxlength="250" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/cidade_zona">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="cidade_zona" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/cidade_zona/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/cidade_zona/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 IGRP_change" id="form_1_cidade_zona" name="{rows/content/form_1/fields/cidade_zona/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/cidade_zona/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/bairro_lugar">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="bairro_lugar" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/bairro_lugar/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/bairro_lugar/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_bairro_lugar" name="{rows/content/form_1/fields/bairro_lugar/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/bairro_lugar/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/estado_civil">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="estado_civil" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/estado_civil/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/estado_civil/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_estado_civil" name="{rows/content/form_1/fields/estado_civil/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/estado_civil/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/com_associacoes">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="com_associacoes" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/com_associacoes/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/com_associacoes/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_com_associacoes" name="{rows/content/form_1/fields/com_associacoes/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/com_associacoes/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/com_assoc_predial">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="com_assoc_predial" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/com_assoc_predial/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/com_assoc_predial/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_com_assoc_predial" name="{rows/content/form_1/fields/com_assoc_predial/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/com_assoc_predial/list/option">
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
                                                        <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/table_1">
                                                    <div class="box box-table-contents gen-container-item " gen-class="" item-name="table_1">
                                                        <div class="box-body table-box">
                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/table_1/fields"/>
                                                            <table id="table_1" class="table table-striped gen-data-table IGRP_contextmenu" exports="">
                                                                <thead>
                                                                    <tr>
                                                                        <xsl:if test="rows/content/table_1/fields/codigo_ls">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/codigo_ls/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/nip_ls">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/nip_ls/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/n_processo_ls">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/n_processo_ls/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/cidade_zona_ls">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/cidade_zona_ls/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/bairro_lugar_ls">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/bairro_lugar_ls/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/titular_ls">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/titular_ls/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/escolher">
                                                                            <th class="bs-checkbox gen-fields-holder" align="center">
                                                                                <input type="checkbox" class="IGRP_checkall" check-rel="escolher"/>
                                                                            </th>
                                                                        </xsl:if>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/table_1/table/value/row">
                                                                        <tr>
                                                                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                                            <input type="hidden" name="p_ba_unit_id_fk" value="{ba_unit_id}"/>
                                                                            <input type="hidden" name="p_ba_unit_id_fk_desc" value="{ba_unit_id_desc}"/>
                                                                            <input type="hidden" name="p_claim_id_fk" value="{claim_id}"/>
                                                                            <input type="hidden" name="p_claim_id_fk_desc" value="{claim_id_desc}"/>
                                                                            <xsl:if test="codigo_ls">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/codigo_ls/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="codigo_ls"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="nip_ls">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/nip_ls/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="nip_ls"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="n_processo_ls">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/n_processo_ls/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="n_processo_ls"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="cidade_zona_ls">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/cidade_zona_ls/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="cidade_zona_ls"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="bairro_lugar_ls">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/bairro_lugar_ls/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="bairro_lugar_ls"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="titular_ls">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/titular_ls/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="titular_ls"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="escolher">
                                                                                <td align="" data-row="{position()}" data-title="{../../label/escolher}" class="bs-checkbox">
                                                                                    <xsl:if test="escolher != '-0'">
                                                                                        <input type="checkbox" name="p_escolher" value="{escolher}" check-rel="escolher">
                                                                                            <xsl:if test="escolher_check=escolher">
                                                                                                <xsl:attribute name="checked">checked</xsl:attribute>
                                                                                            </xsl:if>
                                                                                        </input>
                                                                                    </xsl:if>
                                                                                </td>
                                                                            </xsl:if>
                                                                        </tr>
                                                                    </xsl:for-each>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/table_1/table/context-menu" mode="table-context-menu"/>
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
                <script type="text/javascript" src="{$path}/core/igrp/table/bootstrap-contextmenu.js"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/table.contextmenu.js"/>
                <!-- SELECT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js"/>
                <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1488902658415"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1488902658415"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1488902658415"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1488902658415"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1488902658415"/>
    <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1488902658415"/>
</xsl:stylesheet>