<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" encoding="ISO-8859-1" omit-xml-declaration="yes" method="html" />
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="home-header" />
            </head>
            <body class="bodyColor">
                <div class="IGRP_overlay" />
                <xsl:call-template name="home-top-main" />
                <div id="igrp-bodyPage">
                    <xsl:call-template name="home-slide-menu" />
                    <div class="bodyPageRigth">
                        <xsl:apply-templates select="rows/content/messages" mode="notif_messages" />
                        <form class="default_form" name="formular_default" method="post" id="formular_default" enctype="multipart/form-data" action="#">
                            <div class="gen-row">
                                <div class="gen-column col-1-1">
                                    <div class="gen-inner">
                                        <xsl:if  test="rows/content/toolsbar_1">
                                            <div class="gen-container-item" gen-fields="ul li" gen-field-label="span" gen-structure="toolsbar">
                                                <xsl:apply-templates  select="rows/content/toolsbar_1" mode="tools-bar">
                                                    <xsl:with-param name="rel" select="''" />
                                                    <xsl:with-param name="isTable" select="''" />
                                                    <xsl:with-param name="align" select="'right'" />
                                                </xsl:apply-templates>
                                            </div>
                                        </xsl:if>
                                        <xsl:if  test="rows/content/separatorlist_1">
                                            <div class="box-content resetPadding gen-container-item" sep-name="separatorlist_1" gen-structure="label,value,table">
                                                <xsl:call-template  name="titlecollapser">
                                                    <xsl:with-param name="title" select="'tarefas Diarias'" />
                                                    <xsl:with-param name="collapsible" select="'true'" />
                                                </xsl:call-template>
                                                <div class="box-collapser">
                                                    <div class="col" gen-id="drop-zone" sep-name="group-separatorlist_1">
                                                        <xsl:if  test="rows/content/separatorlist_1/fields/data">
                                                            <div class="col-1-4 item gen-fields-holder" item-name="data">
                                                                <div class="igrp_item date">
                                                                    <label class="important">
                                                                        <xsl:if test="string-length(rows/content/separatorlist_1/fields/data/label) &gt;45">
                                                                            <xsl:attribute name="title">
                                                                                <xsl:value-of select="rows/content/separatorlist_1/fields/data/label" />
                                                                            </xsl:attribute>
                                                                        </xsl:if>
                                                                        <span gen-lbl-setter="">
                                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/data/label" />
                                                                        </span>
                                                                    </label>
                                                                    <div class="itemIcon">
                                                                        <input class="date  important" type="text" rel="F_separatorlist_1" name="{rows/content/separatorlist_1/fields/data/@name}" value="{rows/content/separatorlist_1/fields/data/value}" trel="IGRP_datePicker">
                                                                            <xsl:call-template name="FIELD_validator">
                                                                                <xsl:with-param name="field" select="rows/content/separatorlist_1/fields/data" />
                                                                            </xsl:call-template>
                                                                        </input>
                                                                        <div class="calendar" /></div>
                                                                    <div class="_clear" /></div>
                                                                <div class="_clear" /></div>
                                                        </xsl:if>
                                                        <xsl:if  test="rows/content/separatorlist_1/fields/periodo">
                                                            <div class="col-1-4 item gen-fields-holder" item-name="select">
                                                                <div class="igrp_item select">
                                                                    <label class="important">
                                                                        <xsl:if test="string-length(rows/content/separatorlist_1/fields/periodo/label) &gt;45">
                                                                            <xsl:attribute name="title">
                                                                                <xsl:value-of select="rows/content/separatorlist_1/fields/periodo/label" />
                                                                            </xsl:attribute>
                                                                        </xsl:if>
                                                                        <span>
                                                                            <span gen-lbl-setter="">
                                                                                <xsl:value-of select="rows/content/separatorlist_1/fields/periodo/label" />
                                                                            </span>
                                                                        </span>
                                                                    </label>
                                                                    <select class="select IGRP_change important" rel="F_separatorlist_1" name="{rows/content/separatorlist_1/fields/periodo/@name}" data-placeholder="{rows/content/separatorlist_1/fields/periodo/list/option[position() = 1]/text}" chosen="select" id="{rows/content/separatorlist_1/fields/periodo/@name}">
                                                                        <xsl:call-template name="FIELD_validator">
                                                                            <xsl:with-param name="field" select="rows/content/separatorlist_1/fields/periodo" />
                                                                        </xsl:call-template>
                                                                        <xsl:for-each select="rows/content/separatorlist_1/fields/periodo/list/option[position() != 1]">
                                                                            <option value="{value}">
                                                                                <xsl:if test="@selected='true'">
                                                                                    <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                </xsl:if>
                                                                                <span>
                                                                                    <xsl:value-of select="text" />
                                                                                </span>
                                                                            </option>
                                                                        </xsl:for-each>
                                                                    </select>
                                                                    <div class="_clear" /></div>
                                                                <div class="_clear" /></div>
                                                        </xsl:if>
                                                        <xsl:if  test="rows/content/separatorlist_1/fields/colaborador">
                                                            <div class="col-1-4 item gen-fields-holder" item-name="colaborador">
                                                                <div class="igrp_item text">
                                                                    <label class="">
                                                                        <xsl:if test="string-length(rows/content/separatorlist_1/fields/colaborador/label) &gt;45">
                                                                            <xsl:attribute name="title">
                                                                                <xsl:value-of select="rows/content/separatorlist_1/fields/colaborador/label" />
                                                                            </xsl:attribute>
                                                                        </xsl:if>
                                                                        <span gen-lbl-setter="">
                                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/colaborador/label" />
                                                                        </span>
                                                                    </label>
                                                                    <input class="text  " type="text" rel="F_separatorlist_1" name="{rows/content/separatorlist_1/fields/colaborador/@name}" value="{rows/content/separatorlist_1/fields/colaborador/value}" maxlength="40">
                                                                        <xsl:call-template name="FIELD_validator">
                                                                            <xsl:with-param name="field" select="rows/content/separatorlist_1/fields/colaborador" />
                                                                        </xsl:call-template>
                                                                    </input>
                                                                    <div class="_clear" /></div>
                                                                <div class="_clear" /></div>
                                                        </xsl:if>
                                                        <xsl:if  test="rows/content/separatorlist_1/fields/departamento">
                                                            <div class="col-1-4 item gen-fields-holder" item-name="select">
                                                                <div class="igrp_item select">
                                                                    <label class="">
                                                                        <xsl:if test="string-length(rows/content/separatorlist_1/fields/departamento/label) &gt;45">
                                                                            <xsl:attribute name="title">
                                                                                <xsl:value-of select="rows/content/separatorlist_1/fields/departamento/label" />
                                                                            </xsl:attribute>
                                                                        </xsl:if>
                                                                        <span>
                                                                            <span gen-lbl-setter="">
                                                                                <xsl:value-of select="rows/content/separatorlist_1/fields/departamento/label" />
                                                                            </span>
                                                                        </span>
                                                                    </label>
                                                                    <select class="select  " rel="F_separatorlist_1" name="{rows/content/separatorlist_1/fields/departamento/@name}" data-placeholder="{rows/content/separatorlist_1/fields/departamento/list/option[position() = 1]/text}" chosen="select" id="{rows/content/separatorlist_1/fields/departamento/@name}">
                                                                        <xsl:call-template name="FIELD_validator">
                                                                            <xsl:with-param name="field" select="rows/content/separatorlist_1/fields/departamento" />
                                                                        </xsl:call-template>
                                                                        <xsl:for-each select="rows/content/separatorlist_1/fields/departamento/list/option[position() != 1]">
                                                                            <option value="{value}">
                                                                                <xsl:if test="@selected='true'">
                                                                                    <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                </xsl:if>
                                                                                <span>
                                                                                    <xsl:value-of select="text" />
                                                                                </span>
                                                                            </option>
                                                                        </xsl:for-each>
                                                                    </select>
                                                                    <div class="_clear" /></div>
                                                                <div class="_clear" /></div>
                                                        </xsl:if>
                                                        <xsl:if  test="rows/content/separatorlist_1/fields/projectoprodutoassunto">
                                                            <div class="col-1-1 item gen-fields-holder" item-name="projectoprodutoassunto">
                                                                <div class="igrp_item text">
                                                                    <label class="important">
                                                                        <xsl:if test="string-length(rows/content/separatorlist_1/fields/projectoprodutoassunto/label) &gt;45">
                                                                            <xsl:attribute name="title">
                                                                                <xsl:value-of select="rows/content/separatorlist_1/fields/projectoprodutoassunto/label" />
                                                                            </xsl:attribute>
                                                                        </xsl:if>
                                                                        <span gen-lbl-setter="">
                                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/projectoprodutoassunto/label" />
                                                                        </span>
                                                                    </label>
                                                                    <input class="text  important" type="text" rel="F_separatorlist_1" name="{rows/content/separatorlist_1/fields/projectoprodutoassunto/@name}" value="{rows/content/separatorlist_1/fields/projectoprodutoassunto/value}" maxlength="40">
                                                                        <xsl:call-template name="FIELD_validator">
                                                                            <xsl:with-param name="field" select="rows/content/separatorlist_1/fields/projectoprodutoassunto" />
                                                                        </xsl:call-template>
                                                                    </input>
                                                                    <div class="_clear" /></div>
                                                                <div class="_clear" /></div>
                                                        </xsl:if>
                                                        <xsl:if  test="rows/content/separatorlist_1/fields/actividadeobservacao">
                                                            <div class="col-1-2 item gen-fields-holder" item-name="actividadeobservacao">
                                                                <div class="igrp_item textarea">
                                                                    <label class="">
                                                                        <xsl:if test="string-length(rows/content/separatorlist_1/fields/actividadeobservacao/label) &gt; 45">
                                                                            <xsl:attribute name="title">
                                                                                <xsl:value-of select="rows/content/separatorlist_1/fields/actividadeobservacao/label" />
                                                                            </xsl:attribute>
                                                                        </xsl:if>
                                                                        <span gen-lbl-setter="">
                                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/actividadeobservacao/label" />
                                                                        </span>
                                                                    </label>
                                                                    <textarea class="textarea  " rel="F_separatorlist_1" name="{rows/content/separatorlist_1/fields/actividadeobservacao/@name}" maxlength="#[maxLength]#">
                                                                        <xsl:call-template name="FIELD_validator">
                                                                            <xsl:with-param name="field" select="rows/content/separatorlist_1/fields/actividadeobservacao/label" />
                                                                        </xsl:call-template>
                                                                        <xsl:value-of select="rows/content/separatorlist_1/fields/actividadeobservacao/value" />
                                                                    </textarea>
                                                                    <div class="_clear" /></div>
                                                                <div class="_clear" /></div>
                                                        </xsl:if>
                                                        <xsl:if  test="rows/content/separatorlist_1/fields/number_1">
                                                            <div class="col-1-4 item gen-fields-holder" item-name="number_1">
                                                                <div class="igrp_item number">
                                                                    <label class="">
                                                                        <xsl:if test="string-length(rows/content/separatorlist_1/fields/number_1/label) &gt;45">
                                                                            <xsl:attribute name="title">
                                                                                <xsl:value-of select="rows/content/separatorlist_1/fields/number_1/label" />
                                                                            </xsl:attribute>
                                                                        </xsl:if>
                                                                        <span gen-lbl-setter="">
                                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/number_1/label" />
                                                                        </span>
                                                                    </label>
                                                                    <input class="number  " type="number" rel="F_separatorlist_1" name="{rows/content/separatorlist_1/fields/number_1/@name}" value="{rows/content/separatorlist_1/fields/number_1/value}" maxlength="40">
                                                                        <xsl:call-template name="FIELD_validator">
                                                                            <xsl:with-param name="field" select="rows/content/separatorlist_1/fields/number_1" />
                                                                        </xsl:call-template>
                                                                    </input>
                                                                    <div class="_clear" /></div>
                                                                <div class="_clear" /></div>
                                                        </xsl:if>
                                                        <xsl:if  test="rows/content/separatorlist_1/fields/aplicacao">
                                                            <div class="col-1-4 item gen-fields-holder" item-name="aplicacao">
                                                                <div class="igrp_item LOOKUP">
                                                                    <label class="">
                                                                        <xsl:if test="string-length(rows/content/separatorlist_1/fields/aplicacao/label) &gt;45">
                                                                            <xsl:attribute name="title">
                                                                                <xsl:value-of select="rows/content/separatorlist_1/fields/aplicacao/label" />
                                                                            </xsl:attribute>
                                                                        </xsl:if>
                                                                        <span gen-lbl-setter="">
                                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/aplicacao/label" />
                                                                        </span>
                                                                    </label>
                                                                    <div class="itemIcon">
                                                                        <input class="LOOKUP  " type="LOOKUP" rel="F_separatorlist_1" name="{rows/content/separatorlist_1/fields/aplicacao/@name}" value="{rows/content/separatorlist_1/fields/aplicacao/value}">
                                                                            <xsl:call-template name="FIELD_validator">
                                                                                <xsl:with-param name="field" select="rows/content/separatorlist_1/fields/aplicacao" />
                                                                            </xsl:call-template>
                                                                        </input>
                                                                        <xsl:call-template name="lookup-tool">
                                                                            <xsl:with-param name="page" select="rows/page" />
                                                                            <xsl:with-param name="ad_hoc" select="'1'" />
                                                                            <xsl:with-param name="action" select="'LOOKUP'" />
                                                                            <xsl:with-param name="name" select="rows/content/separatorlist_1/fields/aplicacao/@name" />
                                                                            <xsl:with-param name="js_lookup" select="rows/content/separatorlist_1/fields/aplicacao/lookup" />
                                                                        </xsl:call-template>
                                                                    </div>
                                                                    <div class="_clear" /></div>
                                                                <div class="_clear" /></div>
                                                        </xsl:if>
                                                    </div>
                                                    <xsl:apply-templates  select="rows/content/separatorlist_1/value" mode="gen-form-hidden" />
                                                    <xsl:call-template  name="tools-bar-form-group">
                                                        <xsl:with-param name="class" select="'IGRP_addRow'" />
                                                        <xsl:with-param name="rel" select="'separatorlist_1'" />
                                                    </xsl:call-template>
                                                    <div class="col" sep-name="list-separatorlist_1">
                                                        <div class="box-table table-responsive">
                                                            <ul class="contextMenu ctxSepListDialog" sep-name="btn-separatorlist_1" id="data-separatorlist_1">
                                                                <li class="IGRP_editRow operationTable" rel="separatorlist_1" item-name="edit-separatorlist_1">
                                                                    <img src="{$path_tmpl}/img/icon/tools-bar/edit.png" />
                                                                    <span>
                                                                        <xsl:value-of  select="$lngPath/separatorlist_dialog/edit" disable-output-escaping="yes" />
                                                                    </span>
                                                                </li>
                                                                <li class="IGRP_delRow operationTable" rel="separatorlist_1" item-name="del-separatorlist_1">
                                                                    <img src="{$path_tmpl}/img/icon/tools-bar/delete.png" />
                                                                    <span>
                                                                        <xsl:value-of  select="$lngPath/separatorlist_dialog/delete" disable-output-escaping="yes" />
                                                                    </span>
                                                                </li>
                                                            </ul>
                                                            <table rel="T_separatorlist_1" gen-id="table" data-control="data-separatorlist_1">
                                                                <thead>
                                                                    <tr gen-id="drop-zone" gen-field-template="th">
                                                                        <xsl:if  test="rows/content/separatorlist_1/fields/data">
                                                                            <xsl:if test="//rows/content/separatorlist_1/fields/data/@table='true'">
                                                                                <th align="#[align]#">
                                                                                    <span gen-lbl-setter="">
                                                                                        <xsl:value-of select="rows/content/separatorlist_1/fields/data/label" />
                                                                                    </span>
                                                                                </th>
                                                                            </xsl:if>
                                                                        </xsl:if>
                                                                        <xsl:if  test="rows/content/separatorlist_1/fields/periodo">
                                                                            <xsl:if test="//rows/content/separatorlist_1/fields/periodo/@table='true'">
                                                                                <th align="#[align]#">
                                                                                    <span gen-lbl-setter="">
                                                                                        <xsl:value-of select="rows/content/separatorlist_1/fields/periodo/label" />
                                                                                    </span>
                                                                                </th>
                                                                            </xsl:if>
                                                                        </xsl:if>
                                                                        <xsl:if  test="rows/content/separatorlist_1/fields/colaborador">
                                                                            <xsl:if test="//rows/content/separatorlist_1/fields/colaborador/@table='true'">
                                                                                <th align="#[align]#">
                                                                                    <span gen-lbl-setter="">
                                                                                        <xsl:value-of select="rows/content/separatorlist_1/fields/colaborador/label" />
                                                                                    </span>
                                                                                </th>
                                                                            </xsl:if>
                                                                        </xsl:if>
                                                                        <xsl:if  test="rows/content/separatorlist_1/fields/departamento">
                                                                            <xsl:if test="//rows/content/separatorlist_1/fields/departamento/@table='true'">
                                                                                <th align="#[align]#">
                                                                                    <span gen-lbl-setter="">
                                                                                        <xsl:value-of select="rows/content/separatorlist_1/fields/departamento/label" />
                                                                                    </span>
                                                                                </th>
                                                                            </xsl:if>
                                                                        </xsl:if>
                                                                        <xsl:if  test="rows/content/separatorlist_1/fields/projectoprodutoassunto">
                                                                            <xsl:if test="//rows/content/separatorlist_1/fields/projectoprodutoassunto/@table='true'">
                                                                                <th align="#[align]#">
                                                                                    <span gen-lbl-setter="">
                                                                                        <xsl:value-of select="rows/content/separatorlist_1/fields/projectoprodutoassunto/label" />
                                                                                    </span>
                                                                                </th>
                                                                            </xsl:if>
                                                                        </xsl:if>
                                                                        <xsl:if  test="rows/content/separatorlist_1/fields/actividadeobservacao">
                                                                            <xsl:if test="//rows/content/separatorlist_1/fields/actividadeobservacao/@table='true'">
                                                                                <th align="#[align]#">
                                                                                    <span gen-lbl-setter="">
                                                                                        <xsl:value-of select="rows/content/separatorlist_1/fields/actividadeobservacao/label" />
                                                                                    </span>
                                                                                </th>
                                                                            </xsl:if>
                                                                        </xsl:if>
                                                                        <xsl:if  test="rows/content/separatorlist_1/fields/number_1">
                                                                            <xsl:if test="//rows/content/separatorlist_1/fields/number_1/@table='true'">
                                                                                <th align="#[align]#">
                                                                                    <span gen-lbl-setter="">
                                                                                        <xsl:value-of select="rows/content/separatorlist_1/fields/number_1/label" />
                                                                                    </span>
                                                                                </th>
                                                                            </xsl:if>
                                                                        </xsl:if>
                                                                        <xsl:if  test="rows/content/separatorlist_1/fields/aplicacao">
                                                                            <xsl:if test="//rows/content/separatorlist_1/fields/aplicacao/@table='true'">
                                                                                <th align="#[align]#">
                                                                                    <span gen-lbl-setter="">
                                                                                        <xsl:value-of select="rows/content/separatorlist_1/fields/aplicacao/label" />
                                                                                    </span>
                                                                                </th>
                                                                            </xsl:if>
                                                                        </xsl:if>
                                                                        <th class="bEdDel" />
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each  select="rows/content/separatorlist_1/table/value/row[not(@total='yes')]">
                                                                        <tr gen-id="drop-zone" gen-field-template="td">
                                                                            <xsl:if test="data">
                                                                                <xsl:choose>
                                                                                    <xsl:when test="//rows/content/separatorlist_1/fields/data/@table='true'">
                                                                                        <td class="date" data-title="{../../../fields/data/label}" data-row="{position()}">
                                                                                            <span class="showResponsiveTable ctxmenu" />
                                                                                            <span class="separator-list-td-val">
                                                                                                <xsl:value-of select="data_desc" disable-output-escaping="yes" />
                                                                                            </span>
                                                                                            <input type="hidden" name="p_data_fk" value="{data}" />
                                                                                            <input type="hidden" name="p_data_fk_desc" value="{data_desc}" />
                                                                                        </td>
                                                                                    </xsl:when>
                                                                                    <xsl:otherwise>
                                                                                        <input type="hidden" name="p_data_fk" value="{data}" />
                                                                                        <input type="hidden" name="p_data_fk_desc" value="{data_desc}" />
                                                                                    </xsl:otherwise>
                                                                                </xsl:choose>
                                                                            </xsl:if>
                                                                            <xsl:if test="periodo">
                                                                                <xsl:choose>
                                                                                    <xsl:when test="//rows/content/separatorlist_1/fields/periodo/@table='true'">
                                                                                        <td class="select" data-title="{../../../fields/periodo/label}" data-row="{position()}">
                                                                                            <span class="showResponsiveTable ctxmenu" />
                                                                                            <span class="separator-list-td-val">
                                                                                                <xsl:value-of select="periodo_desc" disable-output-escaping="yes" />
                                                                                            </span>
                                                                                            <input type="hidden" name="p_periodo_fk" value="{periodo}" />
                                                                                            <input type="hidden" name="p_periodo_fk_desc" value="{periodo_desc}" />
                                                                                        </td>
                                                                                    </xsl:when>
                                                                                    <xsl:otherwise>
                                                                                        <input type="hidden" name="p_periodo_fk" value="{periodo}" />
                                                                                        <input type="hidden" name="p_periodo_fk_desc" value="{periodo_desc}" />
                                                                                    </xsl:otherwise>
                                                                                </xsl:choose>
                                                                            </xsl:if>
                                                                            <xsl:if test="colaborador">
                                                                                <xsl:choose>
                                                                                    <xsl:when test="//rows/content/separatorlist_1/fields/colaborador/@table='true'">
                                                                                        <td class="text" data-title="{../../../fields/colaborador/label}" data-row="{position()}">
                                                                                            <span class="showResponsiveTable ctxmenu" />
                                                                                            <span class="separator-list-td-val">
                                                                                                <xsl:value-of select="colaborador_desc" disable-output-escaping="yes" />
                                                                                            </span>
                                                                                            <input type="hidden" name="p_colaborador_fk" value="{colaborador}" />
                                                                                            <input type="hidden" name="p_colaborador_fk_desc" value="{colaborador_desc}" />
                                                                                        </td>
                                                                                    </xsl:when>
                                                                                    <xsl:otherwise>
                                                                                        <input type="hidden" name="p_colaborador_fk" value="{colaborador}" />
                                                                                        <input type="hidden" name="p_colaborador_fk_desc" value="{colaborador_desc}" />
                                                                                    </xsl:otherwise>
                                                                                </xsl:choose>
                                                                            </xsl:if>
                                                                            <xsl:if test="departamento">
                                                                                <xsl:choose>
                                                                                    <xsl:when test="//rows/content/separatorlist_1/fields/departamento/@table='true'">
                                                                                        <td class="select" data-title="{../../../fields/departamento/label}" data-row="{position()}">
                                                                                            <span class="showResponsiveTable ctxmenu" />
                                                                                            <span class="separator-list-td-val">
                                                                                                <xsl:value-of select="departamento_desc" disable-output-escaping="yes" />
                                                                                            </span>
                                                                                            <input type="hidden" name="p_departamento_fk" value="{departamento}" />
                                                                                            <input type="hidden" name="p_departamento_fk_desc" value="{departamento_desc}" />
                                                                                        </td>
                                                                                    </xsl:when>
                                                                                    <xsl:otherwise>
                                                                                        <input type="hidden" name="p_departamento_fk" value="{departamento}" />
                                                                                        <input type="hidden" name="p_departamento_fk_desc" value="{departamento_desc}" />
                                                                                    </xsl:otherwise>
                                                                                </xsl:choose>
                                                                            </xsl:if>
                                                                            <xsl:if test="projectoprodutoassunto">
                                                                                <xsl:choose>
                                                                                    <xsl:when test="//rows/content/separatorlist_1/fields/projectoprodutoassunto/@table='true'">
                                                                                        <td class="text" data-title="{../../../fields/projectoprodutoassunto/label}" data-row="{position()}">
                                                                                            <span class="showResponsiveTable ctxmenu" />
                                                                                            <span class="separator-list-td-val">
                                                                                                <xsl:value-of select="projectoprodutoassunto_desc" disable-output-escaping="yes" />
                                                                                            </span>
                                                                                            <input type="hidden" name="p_projectoprodutoassunto_fk" value="{projectoprodutoassunto}" />
                                                                                            <input type="hidden" name="p_projectoprodutoassunto_fk_desc" value="{projectoprodutoassunto_desc}" />
                                                                                        </td>
                                                                                    </xsl:when>
                                                                                    <xsl:otherwise>
                                                                                        <input type="hidden" name="p_projectoprodutoassunto_fk" value="{projectoprodutoassunto}" />
                                                                                        <input type="hidden" name="p_projectoprodutoassunto_fk_desc" value="{projectoprodutoassunto_desc}" />
                                                                                    </xsl:otherwise>
                                                                                </xsl:choose>
                                                                            </xsl:if>
                                                                            <xsl:if test="actividadeobservacao">
                                                                                <xsl:choose>
                                                                                    <xsl:when test="//rows/content/separatorlist_1/fields/actividadeobservacao/@table='true'">
                                                                                        <td class="textarea" data-title="{../../../fields/actividadeobservacao/label}" data-row="{position()}">
                                                                                            <span class="showResponsiveTable ctxmenu" />
                                                                                            <span class="separator-list-td-val">
                                                                                                <xsl:value-of select="actividadeobservacao_desc" disable-output-escaping="yes" />
                                                                                            </span>
                                                                                            <input type="hidden" name="p_actividadeobservacao_fk" value="{actividadeobservacao}" />
                                                                                            <input type="hidden" name="p_actividadeobservacao_fk_desc" value="{actividadeobservacao_desc}" />
                                                                                        </td>
                                                                                    </xsl:when>
                                                                                    <xsl:otherwise>
                                                                                        <input type="hidden" name="p_actividadeobservacao_fk" value="{actividadeobservacao}" />
                                                                                        <input type="hidden" name="p_actividadeobservacao_fk_desc" value="{actividadeobservacao_desc}" />
                                                                                    </xsl:otherwise>
                                                                                </xsl:choose>
                                                                            </xsl:if>
                                                                            <xsl:if test="number_1">
                                                                                <xsl:choose>
                                                                                    <xsl:when test="//rows/content/separatorlist_1/fields/number_1/@table='true'">
                                                                                        <td class="number" data-title="{../../../fields/number_1/label}" data-row="{position()}">
                                                                                            <span class="showResponsiveTable ctxmenu" />
                                                                                            <span class="separator-list-td-val">
                                                                                                <xsl:value-of select="number_1_desc" disable-output-escaping="yes" />
                                                                                            </span>
                                                                                            <input type="hidden" name="p_number_1_fk" value="{number_1}" />
                                                                                            <input type="hidden" name="p_number_1_fk_desc" value="{number_1_desc}" />
                                                                                        </td>
                                                                                    </xsl:when>
                                                                                    <xsl:otherwise>
                                                                                        <input type="hidden" name="p_number_1_fk" value="{number_1}" />
                                                                                        <input type="hidden" name="p_number_1_fk_desc" value="{number_1_desc}" />
                                                                                    </xsl:otherwise>
                                                                                </xsl:choose>
                                                                            </xsl:if>
                                                                            <xsl:if test="aplicacao">
                                                                                <xsl:choose>
                                                                                    <xsl:when test="//rows/content/separatorlist_1/fields/aplicacao/@table='true'">
                                                                                        <td class="lookup" data-title="{../../../fields/aplicacao/label}" data-row="{position()}">
                                                                                            <span class="showResponsiveTable ctxmenu" />
                                                                                            <span class="separator-list-td-val">
                                                                                                <xsl:value-of select="aplicacao_desc" disable-output-escaping="yes" />
                                                                                            </span>
                                                                                            <input type="hidden" name="p_aplicacao_fk" value="{aplicacao}" />
                                                                                            <input type="hidden" name="p_aplicacao_fk_desc" value="{aplicacao_desc}" />
                                                                                        </td>
                                                                                    </xsl:when>
                                                                                    <xsl:otherwise>
                                                                                        <input type="hidden" name="p_aplicacao_fk" value="{aplicacao}" />
                                                                                        <input type="hidden" name="p_aplicacao_fk_desc" value="{aplicacao_desc}" />
                                                                                    </xsl:otherwise>
                                                                                </xsl:choose>
                                                                            </xsl:if>
                                                                            <td class="bEdDel" data-title="{../../../fields/separatorlist_1/label}" data-row="{position()}">
                                                                                <img title="{$lngPath/separatorlist_dialog/edit}" class="IGRP_editRow" rel="separatorlist_1" src="{$path_tmpl}/img/icon/tools-bar/edit.png" />
                                                                                <img title="{$lngPath/separatorlist_dialog/delete}" class="IGRP_delRow" rel="separatorlist_1" src="{$path_tmpl}/img/icon/tools-bar/delete.png" />
                                                                            </td>
                                                                        </tr>
                                                                    </xsl:for-each>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                    <div class="_clear" /></div>
                                                <div class="_clear" /></div>
                                        </xsl:if>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <div class="_clear" /></div>
                    <xsl:call-template name="link-opener" />
                    <div class="_clear" /></div>
                <div id="igrp-footerPage">
                    <xsl:call-template name="footer" />
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1462183572388"/>
    <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=1462183572388"/>
    <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=1462183572389"/>
</xsl:stylesheet>