<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" doctype-system="about:legacy-compat" indent="yes" />
  <xsl:template match="/">
   
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/form/includes/igrp.forms.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/table/includes/dataTables.bootstrap.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/table/includes/igrp.tables.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/separatorlist/includes/igrp.separatorlist.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/formlist/includes/igrp.formlist.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/fields/date/includes/dateTimePicker/css/datetimepicker.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/fields/select/includes/select2/select2.min.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/fields/select/includes/select2/select2.style.css"/>
            </head>
            <body class="{$bodyClass} sidebar-off old-v">
                <xsl:call-template name="IGRP-topmenu"/>
                <form>
                    <div class="container-fluid">
                        <div class="row">
                            <xsl:call-template name="IGRP-sidebar"/>
                            <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
                                <div class="content">
                                    <section class="content-header gen-container-item">
                                        <h1>
                                            <xsl:value-of select="rows/content/title"/>
                                        </h1>
                                    </section>
                                    <div class="box igrp-forms gen-container-item">
                                        <div class="box-body">
                                            <div role="form" gen-id="drop-zone" first-type-container="true" last-type-container="true">
                                                &lt;div class="form_tab"&gt;
                                                <xsl:if test="rows/content/form/label/form_items">
                                                    <div class="box-head subtitle clearfix" item-name="form_items" item-type="separator">
                                                        <span>
                                                            <xsl:value-of select="rows/content/form/label/form_items"/>
                                                        </span>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/form/label/name">
                                                    <div class="form-group col-md-3" item-name="name" item-type="text">
                                                        <label for="{rows/content/form/label/name/@name}">
                                                            <xsl:value-of select="rows/content/form/label/name"/>
                                                        </label>
                                                        <input type="text" value="{rows/content/form/value/name}" class="form-control" id="{rows/content/form/label/name/@name}" name="{rows/content/form/label/name/@name}"/>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/form/label/email">
                                                    <div class="form-group col-md-3" item-name="email" item-type="email">
                                                        <label for="{rows/content/form/label/email/@name}">
                                                            <xsl:value-of select="rows/content/form/label/email"/>
                                                        </label>
                                                        <input type="email" value="{rows/content/form/value/email}" class="form-control" id="{rows/content/form/label/email/@name}" name="{rows/content/form/label/email/@name}"/>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/form/label/options">
                                                    <div class="form-group col-md-3 " item-name="options" item-type="select">
                                                        <label for="{rows/content/form/label/options/@name}">
                                                            <xsl:value-of select="rows/content/form/label/options"/>
                                                        </label>
                                                        <select class="form-control select2 " id="{rows/content/form/label/options/@name}" name="{rows/content/form/label/options/@name}">
                                                            <xsl:for-each select="rows/content/form/list/options/option">
                                                                <option value="{value}">
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
                                                <xsl:if test="rows/content/form/label/checker">
                                                    <div class="col-md-3" item-name="checker" item-type="checkbox">
                                                        <div class="form-group">
                                                            <div class="checkbox form-check-offset">
                                                                <label>
                                                                    <input type="checkbox" name="{rows/content/form/label/checker/@name}" value="1" class="checkbox">
                                                                        <xsl:if test="rows/content/form/value/checker = '1'">
                                                                            <xsl:attribute name="checked">checked</xsl:attribute>
                                                                        </xsl:if>
                                                                    </input>
                                                                    <xsl:value-of select="rows/content/form/label/checker"/>
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/form/label/date">
                                                    <div class="form-group col-md-3" item-name="date" item-type="date">
                                                        <label for="{rows/content/form/label/date/@name}">
                                                            <xsl:value-of select="rows/content/form/label/date"/>
                                                        </label>
                                                        <div class="input-group">
                                                            <input type="text" value="{rows/content/form/value/date}" class="form-control gen-date" id="{rows/content/form/label/date/@name}" name="{rows/content/form/label/date/@name}" format="IGRP_datePicker"/>
                                                            <span class="input-group-btn gen-date-icon">
                                                                <span class="btn btn-default">
                                                                    <i class="fa fa-calendar"/>
                                                                </span>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/form/label/link">
                                                    <div class="form-group col-md-3" item-name="link" item-type="link">
                                                        <a href="{rows/content/form/value/link}" class="link form-link" target="_blank">
                                                            <xsl:value-of select="rows/content/form/label/link"/>
                                                        </a>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/form/label/looker">
                                                    <div class="form-group col-md-3" item-name="looker" item-type="LOOKUP">
                                                        <label for="{rows/content/form/label/looker/@name}">
                                                            <xsl:value-of select="rows/content/form/label/looker"/>
                                                        </label>
                                                        <div class="input-group">
                                                            <input type="text" value="{rows/content/form/value/looker}" class="form-control gen-lookup" id="{rows/content/form/label/looker/@name}" name="{rows/content/form/label/looker/@name}"/>
                                                            <xsl:call-template name="lookup-tool">
                                                                <xsl:with-param name="page" select="rows/page"/>
                                                                <xsl:with-param name="ad_hoc" select="'1'"/>
                                                                <xsl:with-param name="action" select="'LOOKUP'"/>
                                                                <xsl:with-param name="name" select="rows/content/form/label/looker/@name"/>
                                                                <xsl:with-param name="js_lookup" select="rows/content/form/lookup/looker"/>
                                                                <xsl:with-param name="input-id" select="rows/content/form/label/looker/@name"/>
                                                                <xsl:with-param name="btnClass" select="'primary'"/>
                                                            </xsl:call-template>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/form/label/only_text">
                                                    <div class="col-md-12 clearfix clear form-group" item-name="only_text" item-type="plaintext">
                                                        <xsl:value-of select="rows/content/form/value/only_text"/>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/form/label/radio">
                                                    <div class="col-md-3" item-name="radio" item-type="radio">
                                                        <div class="form-group">
                                                            <div class="radio form-check-offset">
                                                                <label>
                                                                    <input type="radio" name="{rows/content/form/label/radio/@name}" value="1" class="radio">
                                                                        <xsl:if test="rows/content/form/value/radio = '1'">
                                                                            <xsl:attribute name="checked">checked</xsl:attribute>
                                                                        </xsl:if>
                                                                    </input>
                                                                    <xsl:value-of select="rows/content/form/label/radio"/>
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/form/label/file">
                                                    <div class="form-group col-md-3" item-name="file" item-type="file">
                                                        <label for="{rows/content/form/label/file/@name}">
                                                            <xsl:value-of select="rows/content/form/label/file"/>
                                                        </label>
                                                        <div class="input-group">
                                                            <input type="text" class="form-control not-form" readonly=""/>
                                                            <span class="input-group-btn">
                                                                <span class="btn btn-default file-btn-holder">
                                                                    <i class="fa fa-upload"/>
                                                                    <input id="{rows/content/form/label/file/@name}" name="{rows/content/form/label/file/@name}" value="{rows/content/form/value/file}" class="transparent" type="file" multiple=""/>
                                                                </span>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/form/label/wysiwyg">
                                                    <div class="form-group col-md-12" item-name="wysiwyg" item-type="texteditor">
                                                        <label for="{rows/content/form/label/wysiwyg/@name}">
                                                            <xsl:value-of select="rows/content/form/label/wysiwyg"/>
                                                        </label>
                                                        <textarea id="{rows/content/form/label/wysiwyg/@name}" name="{rows/content/form/label/wysiwyg/@name}" class="gen-texteditor">
                                                            <xsl:value-of select="rows/content/form/value/wysiwyg" disable-output-escaping="yes"/>
                                                        </textarea>
                                                    </div>
                                                </xsl:if>
                                                &lt;/div&gt;
                                                &lt;div class="form_tab"&gt;
                                                <xsl:if test="rows/content/form/label/separators">
                                                    <div class="box-head subtitle clearfix" item-name="separators" item-type="separator">
                                                        <span>
                                                            <xsl:value-of select="rows/content/form/label/separators"/>
                                                        </span>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/form/label/separatorlist">
                                                    <div class="box gen-container-item gen-item-boxed" item-name="separatorlist">
                                                        <div class="box-header">
                                                            <h3 class="box-title">
                                                                <xsl:value-of select="rows/content/form/label/separatorlist"/>
                                                            </h3>
                                                        </div>
                                                        <div class="box-body IGRP-separatorlist" tag="separatorlist" dialog="">
                                                            <div class="splist-form-holder">
                                                                <div class="splist-form" role="form">
                                                                    <xsl:if test="rows/content/form/label/nome">
                                                                        <div class="col-md-3" item-name="nome" item-type="checkboxlist">
                                                                            <div class="form-group">
                                                                                <label for="{rows/content/form/label/nome/@name}">
                                                                                    <xsl:value-of select="rows/content/form/label/nome"/>
                                                                                </label>
                                                                                <xsl:for-each select="rows/content/form/list/nome/option">
                                                                                    <div class="checkbox">
                                                                                        <label>
                                                                                            <input type="checkbox" name="{../@name}" value="{value}" class="checkboxlist" label="{text}">
                                                                                                <xsl:if test="@selected='true'">
                                                                                                    <xsl:attribute name="checked">checked</xsl:attribute>
                                                                                                </xsl:if>
                                                                                            </input>
                                                                                            <span>
                                                                                                <xsl:value-of select="text"/>
                                                                                            </span>
                                                                                        </label>
                                                                                    </div>
                                                                                </xsl:for-each>
                                                                            </div>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/form/label/description">
                                                                        <div class="form-group col-md-12" item-name="description" item-type="texteditor">
                                                                            <label for="{rows/content/form/label/description/@name}">
                                                                                <xsl:value-of select="rows/content/form/label/description"/>
                                                                            </label>
                                                                            <textarea id="{rows/content/form/label/description/@name}" name="{rows/content/form/label/description/@name}" class="gen-texteditor">
                                                                                <xsl:value-of select="rows/content/form/value/description" disable-output-escaping="yes"/>
                                                                            </textarea>
                                                                        </div>
                                                                    </xsl:if>
                                                                </div>
                                                            </div>
                                                            <div class="table-box box-body box-table-contents splist-table">
                                                                <table rel="T_separatorlist" id="separatorlist" class="table table-striped gen-data-table">
                                                                    <thead>
                                                                        <tr>
                                                                            <xsl:if test="rows/content/form/table/separatorlist/label/nome">
                                                                                <xsl:if test="not(rows/content/form/table/separatorlist/label/nome/@visible)">
                                                                                    <th align="" item-name="nome">
                                                                                        <xsl:value-of select="rows/content/form/table/separatorlist/label/nome"/>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/form/table/separatorlist/label/description">
                                                                                <xsl:if test="not(rows/content/form/table/separatorlist/label/description/@visible)">
                                                                                    <th align="" item-name="description">
                                                                                        <xsl:value-of select="rows/content/form/table/separatorlist/label/description"/>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <th class="table-btn">
                                                                                <span class="table-row-add btn">
                                                                                    <i class="fa fa-plus"/>
                                                                                </span>
                                                                            </th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <xsl:for-each select="rows/content/form/table/separatorlist/value/row[not(@total='yes')]">
                                                                            <tr>
                                                                                <xsl:if test="nome">
                                                                                    <xsl:if test="not(nome/@visible)">
                                                                                        <td field="nome" item-name="nome" data-row="{position()}" class="checkboxlist">
                                                                                            <span class="separator-list-td-val">
                                                                                                <xsl:value-of select="nome_desc" disable-output-escaping="yes"/>
                                                                                            </span>
                                                                                            <input type="hidden" name="p_nome_fk" value="{nome}"/>
                                                                                            <input type="hidden" name="p_nome_fk_desc" value="{nome_desc}"/>
                                                                                        </td>
                                                                                    </xsl:if>
                                                                                </xsl:if>
                                                                                <xsl:if test="description">
                                                                                    <xsl:if test="not(description/@visible)">
                                                                                        <td field="description" item-name="description" data-row="{position()}" class="texteditor">
                                                                                            <span class="separator-list-td-val">
                                                                                                <xsl:value-of select="description_desc" disable-output-escaping="yes"/>
                                                                                            </span>
                                                                                            <input type="hidden" name="p_description_fk" value="{description}"/>
                                                                                            <input type="hidden" name="p_description_fk_desc" value="{description_desc}"/>
                                                                                        </td>
                                                                                    </xsl:if>
                                                                                </xsl:if>
                                                                                <td data-row="{position()}" class="table-btn">
                                                                                    <xsl:if test="not(@nodelete)">
                                                                                        <span class="table-row-edit btn" rel="separatorlist">
                                                                                            <i class="fa fa-pencil"/>
                                                                                        </span>
                                                                                    </xsl:if>
                                                                                    <xsl:if test="not(@noupdate)">
                                                                                        <span class="table-row-remove btn" rel="separatorlist">
                                                                                            <i class="fa fa-times"/>
                                                                                        </span>
                                                                                    </xsl:if>
                                                                                </td>
                                                                                <input type="hidden" class="sl-row-id" name="p_separatorlist_id" value="{separatorlist_id}"/>
                                                                            </tr>
                                                                        </xsl:for-each>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/form/label/formlist">
                                                    <div class="box box-table-contents gen-container-item gen-item-boxed" item-name="formlist">
                                                        <div class="box-header">
                                                            <h3 class="box-title">
                                                                <xsl:value-of select="rows/content/form/label/formlist"/>
                                                            </h3>
                                                        </div>
                                                        <div class="box-body table-box">
                                                            <table id="formlist" class="table table-striped gen-data-table IGRP_formlist" rel="T_formlist" data-control="data-formlist">
                                                                <thead>
                                                                    <xsl:if test="rows/content/form/table/formlist/label/number">
                                                                        <xsl:if test="not(rows/content/form/table/formlist/label/number/@visible)">
                                                                            <th>
                                                                                <xsl:value-of select="rows/content/form/table/formlist/label/number"/>
                                                                            </th>
                                                                        </xsl:if>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/form/table/formlist/label/link">
                                                                        <xsl:if test="not(rows/content/form/table/formlist/label/link/@visible)">
                                                                            <th>
                                                                                <xsl:value-of select="rows/content/form/table/formlist/label/link"/>
                                                                            </th>
                                                                        </xsl:if>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/form/table/formlist/label/radios">
                                                                        <xsl:if test="not(rows/content/form/table/formlist/label/radios/@visible)">
                                                                            <th>
                                                                                <xsl:value-of select="rows/content/form/table/formlist/label/radios"/>
                                                                            </th>
                                                                        </xsl:if>
                                                                    </xsl:if>
                                                                    <xsl:if test="not(rows/content/form/table/formlist/value/row[position() = 1]/@noupdate) or not(rows/content/form/table/formlist/value/row[position() = 1]/@nodelete)">
                                                                        <th class="table-btn">
                                                                            <xsl:if test="not(rows/content/form/table/formlist/value/row[position() = 1]/@noupdate)">
                                                                                <xsl:if test="not(@nodelete)">
                                                                                    <span class="formlist-row-add" rel="formlist">
                                                                                        <i class="fa fa-plus"/>
                                                                                    </span>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                        </th>
                                                                    </xsl:if>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/form/table/formlist/value/row[not(@total='yes')]">
                                                                        <tr row="1">
                                                                            <input type="hidden" name="p_formlist_id" value="{formlist_id}"/>
                                                                            <xsl:if test="not(number/@visible)">
                                                                                <td align="" data-row="{position()}" data-title="{../../label/number}" class="number">
                                                                                    <div class="form-group" item-name="number" item-type="number">
                                                                                        <input type="hidden" name="{../../label/number/@name}_fk_desc" value="{number_desc}"/>
                                                                                        <input type="number" name="{../../label/number/@name}_fk" value="{number}" class="number form-control" rel="F_formlist"/>
                                                                                    </div>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="not(link/@visible)">
                                                                                <td align="" data-row="{position()}" data-title="{../../label/link}" class="link">
                                                                                    <div class="form-group" item-name="link" item-type="link">
                                                                                        <input type="hidden" name="{../../label/link/@name}_fk_desc" value="{link_desc}"/>
                                                                                        <input type="hidden" name="{../../label/link/@name}_fk" value="{link}" rel="F_formlist"/>
                                                                                        <a href="{link}" name="p_link" class="link form-link" target="_blank">
                                                                                            <xsl:value-of select="link_desc" disable-output-escaping="yes"/>
                                                                                        </a>
                                                                                    </div>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="not(radios/@visible)">
                                                                                <td align="" data-row="{position()}" data-title="{../../label/radios}" class="radiolist">
                                                                                    <div class="form-group" item-name="radios" item-type="radiolist">
                                                                                        <input type="hidden" name="{../../label/radios/@name}_fk_desc" value="{radios_desc}"/>
                                                                                        <select class="form-control select2 " id="formlist_radios" name="{../../label/radios/@name}_fk" rel="F_formlist">
                                                                                            <xsl:for-each select="../../../../list/radios/option">
                                                                                                <option value="{value}">
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
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="not(@nodelete) or not(@noupdate)">
                                                                                <td class="table-btn" data-row="1">
                                                                                    <xsl:if test="not(@nodelete)">
                                                                                        <span class="formlist-row-remove" rel="formlist">
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
                                                <xsl:if test="rows/content/form/label/list_1">
                                                    <div class="box box-table-contents gen-item-boxed  gen-container-item" item-name="list_1">
                                                        <div class="box-header">
                                                            <h3 class="box-title">
                                                                <xsl:value-of select="rows/content/form/label/list_1"/>
                                                            </h3>
                                                        </div>
                                                        <div class="box-body table-box">
                                                            <table id="list_1" class="table table-striped gen-data-table  ">
                                                                <thead>
                                                                    <tr>
                                                                        <xsl:if test="rows/content/form/table/list_1/label/title">
                                                                            <xsl:if test="not(rows/content/form/table/list_1/label/title/@visible)">
                                                                                <th item-name="title" item-type="text">
                                                                                    <xsl:value-of select="rows/content/form/table/list_1/label/title"/>
                                                                                </th>
                                                                            </xsl:if>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/form/table/list_1/label/b_i_">
                                                                            <xsl:if test="not(rows/content/form/table/list_1/label/b_i_/@visible)">
                                                                                <th item-name="b_i_" item-type="LOOKUP_BI">
                                                                                    <xsl:value-of select="rows/content/form/table/list_1/label/b_i_"/>
                                                                                </th>
                                                                            </xsl:if>
                                                                        </xsl:if>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/form/table/list_1/value/row[not(@total='yes')]">
                                                                        <tr>
                                                                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                                            <xsl:if test="title">
                                                                                <xsl:if test="not(title/@visible)">
                                                                                    <td item-name="title" item-type="text" data-row="{position()}" data-title="{../../label/title}">
                                                                                        <span>
                                                                                            <xsl:value-of select="title"/>
                                                                                        </span>
                                                                                    </td>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="b_i_">
                                                                                <xsl:if test="not(b_i_/@visible)">
                                                                                    <td item-name="b_i_" item-type="LOOKUP_BI" data-row="{position()}" data-title="{../../label/b_i_}">
                                                                                        <span>
                                                                                            <xsl:value-of select="b_i_"/>
                                                                                        </span>
                                                                                    </td>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                        </tr>
                                                                    </xsl:for-each>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                &lt;/div&gt;
                                            </div>
                                        </div>
                                        <xsl:apply-templates select="rows/content/form/tools-bar" mode="form-buttons"/>
                                    </div>
                                    <div class="box box-table-contents  gen-container-item" item-name="table">
                                        <div class="box-body table-box">
                                            <table id="table" class="table table-striped gen-data-table  ">
                                                <thead>
                                                    <tr/>
                                                </thead>
                                                <tbody>
                                                    <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                                                        <tr>
                                                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                        </tr>
                                                    </xsl:for-each>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <xsl:call-template name="IGRP-bottom"/>
                </form>
                <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/form/includes/igrp.forms.js"/>
                <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/separatorlist/includes/igrp.separatorlist.js"/>
                <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/formlist/includes/igrp.formlist.js"/>
                <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/date/includes/dateTimePicker/js/datetimepicker.js"/>
                <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/date/includes/dateTimePicker/js/dtp.init.js"/>
                <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/select/includes/select2/select2.full.min.js"/>
                <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/select/includes/select2.init.js"/>
                <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/texteditor/includes/ckeditor/ckeditor.js"/>
                <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/lookup/includes/igrp.lookup.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150615"/>
    <xsl:include href="../../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=20150615"/>
    <xsl:include href="../../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1463090556311"/>
    <xsl:include href="../../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1463090556312"/>
    <xsl:include href="../../../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1463090556312"/>
    <xsl:include href="../../../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1463090556312"/>
</xsl:stylesheet>