<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- FORM CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/form/igrp.forms.css"/>
                <!-- TOOLSBAR CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css"/>
                <!-- FORMLIST CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/formlist/igrp.formlist.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css"/>
                <!-- DATE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/datetimepicker/css/datetimepicker.css"/>
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
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="gen-column col-md-5">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/page_title">
                                                    <section class="content-header gen-container-item " gen-class="" item-name="page_title">
                                                        <h2>
                                                            <xsl:value-of select="rows/content/page_title/fields/page_title_text/value"/>
                                                        </h2>
                                                    </section>
                                                </xsl:if>
                                                <xsl:if test="rows/content/form_1">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                                                <xsl:if test="rows/content/form_1/fields/nome">
                                                                    <div class="form-group col-md-12   gen-fields-holder" item-name="nome" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/nome/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/nome/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/nome/value}" class="form-control " id="{rows/content/form_1/fields/nome/@name}" name="{rows/content/form_1/fields/nome/@name}" maxlength="100" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/data_relacao">
                                                                    <div class="form-group col-md-5  gen-fields-holder" item-name="data_relacao" item-type="date">
                                                                        <label for="{rows/content/form_1/fields/data_relacao/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/data_relacao/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_1/fields/data_relacao/value}" class="form-control gen-date " id="form_1-data_relacao" name="{rows/content/form_1/fields/data_relacao/@name}" format="IGRP_datePicker" maxlength="20"/>
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-default">
                                                                                    <i class="fa fa-calendar"/>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/abonosdescontos">
                                                                    <div class="col-md-6 form-group  gen-fields-holder" item-name="abonosdescontos" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/abonosdescontos/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/abonosdescontos/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_abonosdescontos" name="{rows/content/form_1/fields/abonosdescontos/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/abonosdescontos/list/option">
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
                                                <xsl:if test="rows/content/toolsbar_1">
                                                    <div class="toolsbar-holder boxed gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="toolsbar_1">
                                                        <div class="btns-holder  pull-right" role="group">
                                                            <xsl:apply-templates select="rows/content/toolsbar_1" mode="gen-buttons">
                                                                <xsl:with-param name="vertical" select="'true'"/>
                                                            </xsl:apply-templates>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/formlist_1">
                                                    <div class="box box-table-contents gen-container-item " gen-class="" item-name="formlist_1">
                                                        <div class="box-body table-box">
                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/formlist_1/fields"/>
                                                            <table id="formlist_1" class="table table-striped gen-data-table IGRP_formlist" rel="T_formlist_1" data-control="data-formlist_1">
                                                                <thead>
                                                                    <tr>
                                                                        <xsl:if test="rows/content/formlist_1/fields/nome">
                                                                            <th align="" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/formlist_1/fields/nome/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/formlist_1/fields/nif">
                                                                            <th align="" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/formlist_1/fields/nif/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/formlist_1/fields/data_rel">
                                                                            <th align="" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/formlist_1/fields/data_rel/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/formlist_1/fields/valor">
                                                                            <th align="" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/formlist_1/fields/valor/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/formlist_1/fields/confirmar_item">
                                                                            <th align="" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/formlist_1/fields/confirmar_item/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="not(rows/content/formlist_1/table/value/row[position() = 1]/@noupdate) or not(rows/content/formlist_1/table/value/row[position() = 1]/@nodelete)">
                                                                            <th class="table-btn">
                                                                                <xsl:if test="not(rows/content/formlist_1/table/value/row[position() = 1]/@noupdate)">
                                                                                    <xsl:if test="not(@nodelete)">
                                                                                        <a class="formlist-row-add" rel="formlist_1">
                                                                                            <i class="fa fa-plus"/>
                                                                                        </a>
                                                                                    </xsl:if>
                                                                                </xsl:if>
                                                                            </th>
                                                                        </xsl:if>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/formlist_1/table/value/row">
                                                                        <tr row="{position()}">
                                                                            <input type="hidden" name="p_formlist_1_id" value="{formlist_1_id}"/>
                                                                            <xsl:if test="nome">
                                                                                <xsl:if test="not(nome/@visible)">
                                                                                    <td align="" data-row="{position()}" data-title="{../../fields/nome/label}" class="link">
                                                                                        <input type="hidden" name="{../../../fields/nome/@name}_fk_desc" value="{nome_desc}"/>
                                                                                        <input type="hidden" name="{../../../fields/nome/@name}_fk" value="{nome}" rel="F_formlist_1"/>
                                                                                        <xsl:choose>
                                                                                            <xsl:when test="nome != ''">
                                                                                                <a href="{nome}" name="p_nome" class="link  form-link" target="changesrc">
                                                                                                    <xsl:value-of select="nome_desc"/>
                                                                                                </a>
                                                                                            </xsl:when>
                                                                                            <xsl:otherwise>
                                                                                                <xsl:value-of select="nome_desc"/>
                                                                                            </xsl:otherwise>
                                                                                        </xsl:choose>
                                                                                    </td>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="nif">
                                                                                <xsl:if test="not(nif/@visible)">
                                                                                    <td align="" data-row="{position()}" data-title="{../../fields/nif/label}" class="plaintext">
                                                                                        <input type="hidden" name="{../../../fields/nif/@name}_fk_desc" value="{nif_desc}"/>
                                                                                        <input type="hidden" name="{../../../fields/nif/@name}_fk" value="{nif}" class="plaintext form-control" rel="F_formlist_1"/>
                                                                                        <p item-name="nif" item-type="plaintext">
                                                                                            <xsl:value-of select="nif"/>
                                                                                        </p>
                                                                                    </td>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="data_rel">
                                                                                <xsl:if test="not(data_rel/@visible)">
                                                                                    <td align="" data-row="{position()}" data-title="{../../fields/data_rel/label}" class="plaintext">
                                                                                        <input type="hidden" name="{../../../fields/data_rel/@name}_fk_desc" value="{data_rel_desc}"/>
                                                                                        <input type="hidden" name="{../../../fields/data_rel/@name}_fk" value="{data_rel}" class="plaintext form-control" rel="F_formlist_1"/>
                                                                                        <p item-name="data_rel" item-type="plaintext">
                                                                                            <xsl:value-of select="data_rel"/>
                                                                                        </p>
                                                                                    </td>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="valor">
                                                                                <xsl:if test="not(valor/@visible)">
                                                                                    <td align="" data-row="{position()}" data-title="{../../fields/valor/label}" class="number">
                                                                                        <input type="hidden" name="{../../../fields/valor/@name}_fk_desc" value="{valor_desc}"/>
                                                                                        <div class="form-group" item-name="valor" item-type="number">
                                                                                            <input type="number" name="{../../../fields/valor/@name}_fk" value="{valor}" class="number form-control" rel="F_formlist_1"/>
                                                                                        </div>
                                                                                    </td>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="confirmar_item">
                                                                                <xsl:if test="not(confirmar_item/@visible)">
                                                                                    <td align="" data-row="{position()}" data-title="{../../fields/confirmar_item/label}" class="button">
                                                                                        <div class="form-group" item-name="confirmar_item" item-type="button">
                                                                                            <button class="btn btn-success" target="alert_submit" href="{confirmar_item}">
                                                                                                <i class="fa fa-check-square-o"/>
                                                                                                <span>
                                                                                                    <xsl:value-of select="../../../fields/confirmar_item/label"/>
                                                                                                </span>
                                                                                            </button>
                                                                                        </div>
                                                                                    </td>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="not(@nodelete) or not(@noupdate)">
                                                                                <td class="table-btn" data-row="{position()}">
                                                                                    <xsl:if test="not(@nodelete)">
                                                                                        <span class="formlist-row-remove btn btn-danger" rel="formlist_1">
                                                                                            <i class="fa fa-times"/>
                                                                                        </span>
                                                                                    </xsl:if>
                                                                                </td>
                                                                            </xsl:if>
                                                                        </tr>
                                                                    </xsl:for-each>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/toolsbar_2">
                                                    <div class="toolsbar-holder boxed gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="toolsbar_2">
                                                        <div class="btns-holder  pull-right" role="group">
                                                            <xsl:apply-templates select="rows/content/toolsbar_2" mode="gen-buttons">
                                                                <xsl:with-param name="vertical" select="'true'"/>
                                                            </xsl:apply-templates>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                        <div class="gen-column col-md-7">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/iframe_1">
                                                    <div class="box gen-container-item " gen-class="" item-name="iframe_1">
                                                        <div class="box-body">
                                                            <iframe style="min-height:750px" src="#"/>
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
                <!-- FORMLIST JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/formlist/igrp.formlist.js"/>
                <!-- DATE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/datetimepicker.js"/>
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/dtp.init.js"/>
                <!-- SELECT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js"/>
                <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1492087712865"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1492087712865"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1492087712865"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1492087712865"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1492087712866"/>
</xsl:stylesheet>