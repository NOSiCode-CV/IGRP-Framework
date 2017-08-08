<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
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
                <!-- TOOLSBAR CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css"/>
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
                                                <div class="box igrp-box-holder gen-container-item " gen-class="" item-name="box_1">
                                                    <div class="box-body" gen-preserve-content="true">
                                                        <div>
                                                            <div class="row">
                                                                <div class="gen-column col-sm-6">
                                                                    <div class="gen-inner">
                                                                        <xsl:if test="rows/content/sectionheader_1">
                                                                            <section class="content-header gen-container-item " gen-class="" item-name="sectionheader_1">
                                                                                <h2>
                                                                                    <xsl:value-of select="rows/content/sectionheader_1/fields/sectionheader_1_text/value"/>
                                                                                </h2>
                                                                            </section>
                                                                        </xsl:if>
                                                                    </div>
                                                                </div>
                                                                <div class="gen-column col-sm-6">
                                                                    <div class="gen-inner">
                                                                        <xsl:if test="rows/content/toolsbar_1">
                                                                            <div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="toolsbar_1">
                                                                                <div class="btns-holder   pull-right" role="group">
                                                                                    <xsl:apply-templates select="rows/content/toolsbar_1" mode="gen-buttons">
                                                                                        <xsl:with-param name="vertical" select="'true'"/>
                                                                                    </xsl:apply-templates>
                                                                                </div>
                                                                            </div>
                                                                        </xsl:if>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <xsl:if test="rows/content/form_1">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                                                <xsl:if test="rows/content/form_1/fields/servico">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="servico" item-type="select" required="required">
                                                                        <label for="{rows/content/form_1/fields/servico/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/servico/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_servico" name="{rows/content/form_1/fields/servico/@name}" required="required">
                                                                            <xsl:for-each select="rows/content/form_1/fields/servico/list/option">
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
                                                <xsl:if test="rows/content/separatorlist_1">
                                                    <div class="box gen-container-item " gen-class="" item-name="separatorlist_1">
                                                        <div class="box-body IGRP-separatorlist" tag="separatorlist_1" dialog="false">
                                                            <div class="splist-form-holder">
                                                                <div class="splist-form" role="form">
                                                                    <xsl:apply-templates mode="form-hidden-fields" select="rows/content/separatorlist_1/fields"/>
                                                                    <xsl:if test="rows/content/separatorlist_1/fields/tipo_requisito">
                                                                        <div class="col-md-3 form-group  gen-fields-holder" item-name="tipo_requisito" item-type="select" required="required">
                                                                            <label for="{rows/content/separatorlist_1/fields/tipo_requisito/@name}">
                                                                                <xsl:value-of select="rows/content/separatorlist_1/fields/tipo_requisito/label"/>
                                                                            </label>
                                                                            <select class="form-control select2 " id="separatorlist_1_tipo_requisito" name="{rows/content/separatorlist_1/fields/tipo_requisito/@name}" required="required">
                                                                                <xsl:for-each select="rows/content/separatorlist_1/fields/tipo_requisito/list/option">
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
                                                                    <xsl:if test="rows/content/separatorlist_1/fields/upload">
                                                                        <div class="form-group col-md-3  gen-fields-holder" item-name="upload" item-type="file">
                                                                            <label for="{rows/content/separatorlist_1/fields/upload/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/separatorlist_1/fields/upload/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <div class="input-group">
                                                                                <input type="text" class="form-control not-form" readonly=""/>
                                                                                <span class="input-group-btn">
                                                                                    <span class="btn btn-primary file-btn-holder">
                                                                                        <i class="fa fa-upload"/>
                                                                                        <input id="{rows/content/separatorlist_1/fields/upload/@name}" name="{rows/content/separatorlist_1/fields/upload/@name}" value="{rows/content/separatorlist_1/fields/upload/value}" class="transparent" type="file" accept="file_extension"/>
                                                                                    </span>
                                                                                </span>
                                                                            </div>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/separatorlist_1/fields/descritivo">
                                                                        <div class="form-group col-md-3  gen-fields-holder" item-name="descritivo" item-type="textarea">
                                                                            <label for="{rows/content/separatorlist_1/fields/descritivo/@name}">
                                                                                <xsl:value-of select="rows/content/separatorlist_1/fields/descritivo/label"/>
                                                                            </label>
                                                                            <textarea name="{rows/content/separatorlist_1/fields/descritivo/@name}" class="textarea form-control " maxlength="30">
                                                                                <xsl:value-of select="rows/content/separatorlist_1/fields/descritivo/value"/>
                                                                            </textarea>
                                                                        </div>
                                                                    </xsl:if>
                                                                </div>
                                                            </div>
                                                            <div class="table-box box-body box-table-contents splist-table">
                                                                <table rel="T_separatorlist_1" id="separatorlist_1" class="table table-striped gen-data-table">
                                                                    <thead>
                                                                        <tr>
                                                                            <xsl:if test="rows/content/separatorlist_1/fields/tipo_requisito">
                                                                                <xsl:if test="not(tipo_requisito/@visible)">
                                                                                    <th align="" item-name="tipo_requisito">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/tipo_requisito/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/separatorlist_1/fields/upload">
                                                                                <xsl:if test="not(upload/@visible)">
                                                                                    <th align="" item-name="upload">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/upload/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/separatorlist_1/fields/descritivo">
                                                                                <xsl:if test="not(descritivo/@visible)">
                                                                                    <th align="" item-name="descritivo">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/descritivo/label"/>
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
                                                                        <xsl:for-each select="rows/content/separatorlist_1/table/value/row">
                                                                            <tr>
                                                                                <input type="hidden" class="sl-row-id" name="p_separatorlist_1_id" value="{separatorlist_1_id}"/>
                                                                                <xsl:if test="tipo_requisito">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(tipo_requisito/@visible)">
                                                                                            <td field="tipo_requisito" data-row="{position()}" data-title="{../../../fields/tipo_requisito/label}" class="select">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="tipo_requisito_desc"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_tipo_requisito_fk" value="{tipo_requisito}"/>
                                                                                                <input type="hidden" name="p_tipo_requisito_fk_desc" value="{tipo_requisito_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_tipo_requisito_fk" value="{tipo_requisito}"/>
                                                                                            <input type="hidden" name="p_tipo_requisito_fk_desc" value="{tipo_requisito_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="upload">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(upload/@visible)">
                                                                                            <td data-row="{position()}" data-title="{../../fields/upload/label}" class="file">
                                                                                                <xsl:choose>
                                                                                                    <xsl:when test="upload != ''">
                                                                                                        <a href="{upload}" class="link bClick" target="_blank" name="upload">
                                                                                                            <xsl:value-of select="upload_desc"/>
                                                                                                        </a>
                                                                                                    </xsl:when>
                                                                                                    <xsl:otherwise>
                                                                                                        <xsl:value-of select="upload_desc"/>
                                                                                                    </xsl:otherwise>
                                                                                                </xsl:choose>
                                                                                                <input type="hidden" name="p_upload_fk" value="{upload}"/>
                                                                                                <input type="hidden" name="p_upload_fk_desc" value="{upload_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_upload_fk" value="{upload}"/>
                                                                                            <input type="hidden" name="p_upload_fk_desc" value="{upload_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="descritivo">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(descritivo/@visible)">
                                                                                            <td field="descritivo" data-row="{position()}" data-title="{../../../fields/descritivo/label}" class="textarea">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="descritivo_desc"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_descritivo_fk" value="{descritivo}"/>
                                                                                                <input type="hidden" name="p_descritivo_fk_desc" value="{descritivo_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_descritivo_fk" value="{descritivo}"/>
                                                                                            <input type="hidden" name="p_descritivo_fk_desc" value="{descritivo_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <td data-row="{position()}" class="table-btn">
                                                                                    <xsl:if test="not(@noupdate)">
                                                                                        <span class="table-row-edit btn btn-default " rel="separatorlist_1">
                                                                                            <i class="fa fa-pencil"/>
                                                                                        </span>
                                                                                    </xsl:if>
                                                                                    <xsl:if test="not(@nodelete)">
                                                                                        <span class="table-row-remove btn btn-danger" rel="separatorlist_1">
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
                <!-- SELECT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js"/>
                <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1501680633467"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1501680633468"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1501680633468"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1501680633468"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1501680633468"/>
</xsl:stylesheet>
