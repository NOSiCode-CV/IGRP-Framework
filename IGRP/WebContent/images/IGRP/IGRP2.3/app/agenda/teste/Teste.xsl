<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- SEPARATORLIST CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/separatorlist/igrp.separatorlist.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css"/>
                <!-- FORMLIST CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/formlist/igrp.formlist.css"/>
                <!-- TOOLSBAR CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css"/>
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
                                    <div class="row" id="row-0fe5756c">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                                                <xsl:if test="rows/content/toolsbar_1">
                                                    <div class="toolsbar-holder boxed gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="toolsbar_1">
                                                        <div class="btns-holder  pull-right" role="group">
                                                            <xsl:apply-templates select="rows/content/toolsbar_1" mode="gen-buttons">
                                                                <xsl:with-param name="vertical" select="'true'"/>
                                                                <xsl:with-param name="outline" select="'false'"/>
                                                            </xsl:apply-templates>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/separatorlist_1">
                                                    <div class="box gen-container-item " gen-class="" item-name="separatorlist_1">
                                                        <div class="box-body IGRP-separatorlist" tag="separatorlist_1" dialog="false">
                                                            <div class="splist-form-holder">
                                                                <div class="splist-form" role="form">
                                                                    <xsl:apply-templates mode="form-hidden-fields" select="rows/content/separatorlist_1/fields"/>
                                                                    <xsl:if test="rows/content/separatorlist_1/fields/text_1">
                                                                        <div class="form-group col-sm-3   gen-fields-holder" item-name="text_1" item-type="text">
                                                                            <label for="{rows/content/separatorlist_1/fields/text_1/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/separatorlist_1/fields/text_1/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <input type="text" value="{rows/content/separatorlist_1/fields/text_1/value}" class="form-control " id="{rows/content/separatorlist_1/fields/text_1/@name}" name="{rows/content/separatorlist_1/fields/text_1/@name}" maxlength="30" placeholder=""></input>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/separatorlist_1/fields/number_1">
                                                                        <div class="form-group col-sm-3   gen-fields-holder" item-name="number_1" item-type="number">
                                                                            <label for="{rows/content/separatorlist_1/fields/number_1/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/separatorlist_1/fields/number_1/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <input type="number" value="{rows/content/separatorlist_1/fields/number_1/value}" class="form-control " id="{rows/content/separatorlist_1/fields/number_1/@name}" name="{rows/content/separatorlist_1/fields/number_1/@name}" min="" max="" maxlength="30" placeholder=""></input>
                                                                        </div>
                                                                    </xsl:if>
                                                                </div>
                                                            </div>
                                                            <div class="table-box box-body box-table-contents splist-table">
                                                                <table rel="T_separatorlist_1" id="separatorlist_1" class="table table-striped gen-data-table">
                                                                    <thead>
                                                                        <tr>
                                                                            <xsl:if test="rows/content/separatorlist_1/fields/text_1">
                                                                                <xsl:if test="not(text_1/@visible)">
                                                                                    <th align="" item-name="text_1">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/text_1/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/separatorlist_1/fields/number_1">
                                                                                <xsl:if test="not(number_1/@visible)">
                                                                                    <th align="" item-name="number_1">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/number_1/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <th class="table-btn">
                                                                                <a class="table-row-add btn-xs btn btn-primary" title="Adicionar" data-toggle="tooltip" data-placement="left">
                                                                                    <i class="fa fa-plus"/>
                                                                                </a>
                                                                            </th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <xsl:for-each select="rows/content/separatorlist_1/table/value/row">
                                                                            <tr>
                                                                                <input type="hidden" class="sl-row-id" name="p_separatorlist_1_id" value="{separatorlist_1_id}"/>
                                                                                <xsl:if test="text_1">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(text_1/@visible)">
                                                                                            <td field="text_1" data-row="{position()}" data-title="{../../../fields/text_1/label}" class="text" item-name="text_1">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="text_1_desc"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_text_1_fk" value="{text_1}"/>
                                                                                                <input type="hidden" name="p_text_1_fk_desc" value="{text_1_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_text_1_fk" value="{text_1}"/>
                                                                                            <input type="hidden" name="p_text_1_fk_desc" value="{text_1_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="number_1">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(number_1/@visible)">
                                                                                            <td field="number_1" data-row="{position()}" data-title="{../../../fields/number_1/label}" class="number" item-name="number_1">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="number_1_desc"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_number_1_fk" value="{number_1}"/>
                                                                                                <input type="hidden" name="p_number_1_fk_desc" value="{number_1_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_number_1_fk" value="{number_1}"/>
                                                                                            <input type="hidden" name="p_number_1_fk_desc" value="{number_1_desc}"/>
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
                                                <xsl:if test="rows/content/formlist_1">
                                                    <div class="box box-table-contents gen-container-item " gen-class="" item-name="formlist_1">
                                                        <div class="box-body table-box">
                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/formlist_1/fields"/>
                                                            <table id="formlist_1" class="table table-striped gen-data-table IGRP_formlist  " rel="T_formlist_1" data-control="data-formlist_1">
                                                                <thead>
                                                                    <tr>
                                                                        <xsl:if test="rows/content/formlist_1/fields/text_1">
                                                                            <th align="" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/formlist_1/fields/text_1/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/formlist_1/fields/number_1">
                                                                            <th align="" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/formlist_1/fields/number_1/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="not(rows/content/formlist_1/table/value/row[position() = 1]/@noupdate) or not(rows/content/formlist_1/table/value/row[position() = 1]/@nodelete)">
                                                                            <th class="table-btn add">
                                                                                <xsl:if test="not(rows/content/formlist_1/table/value/row[position() = 1]/@noupdate)">
                                                                                    <a class="formlist-row-add" rel="formlist_1">
                                                                                        <i class="fa fa-plus"/>
                                                                                    </a>
                                                                                </xsl:if>
                                                                            </th>
                                                                        </xsl:if>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/formlist_1/table/value/row">
                                                                        <tr row="{position()}">
                                                                            <input type="hidden" name="p_formlist_1_id" value="{formlist_1_id}"/>
                                                                            <xsl:if test="text_1">
                                                                                <xsl:if test="not(text_1/@visible)">
                                                                                    <td align="" data-row="{position()}" data-title="{../../fields/text_1/label}" class="text" item-name="text_1">
                                                                                        <input type="hidden" name="{../../../fields/text_1/@name}_fk_desc" value="{text_1_desc}"/>
                                                                                        <div class="form-group" item-name="text_1" item-type="text">
                                                                                            <input type="text" name="{../../../fields/text_1/@name}_fk" value="{text_1}" class="text form-control" rel="F_formlist_1"/>
                                                                                        </div>
                                                                                    </td>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="number_1">
                                                                                <xsl:if test="not(number_1/@visible)">
                                                                                    <td align="" data-row="{position()}" data-title="{../../fields/number_1/label}" class="number" item-name="number_1">
                                                                                        <input type="hidden" name="{../../../fields/number_1/@name}_fk_desc" value="{number_1_desc}"/>
                                                                                        <div class="form-group" item-name="number_1" item-type="number">
                                                                                            <input type="number" min="" max="" name="{../../../fields/number_1/@name}_fk" value="{number_1}" class="number form-control" rel="F_formlist_1"/>
                                                                                        </div>
                                                                                    </td>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="not(@nodelete) or not(@noupdate)">
                                                                                <td class="table-btn delete" data-row="{position()}">
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
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <xsl:call-template name="IGRP-bottom"/>
                </form>
                <!-- SEPARATORLIST JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/separatorlist/igrp.separatorlist.js"/>
                <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js"/>
                <!-- FORMLIST JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/table/igrp.table.js"/>
                <script type="text/javascript" src="{$path}/plugins/formlist/igrp.formlist.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1504096721526"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1504096721526"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1504096721526"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1504096721526"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1504096721526"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1504096721526"/>
</xsl:stylesheet>
