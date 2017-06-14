<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" encoding="ISO-8859-1" omit-xml-declaration="yes" method="html" />
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="home-header" />
                <link rel="stylesheet" type="text/css" href="{$path}/extentions/formgen/types/containers/form/includes/igrp.forms.css"/>
                <script type="text/javascript" src="{$path}/extentions/formgen/types/containers/form/includes/igrp.forms.js"></script>
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
                                        <xsl:if  test="rows/content/gen_form_1">
                                            <div class="box-content resetPadding gen-container-item" gen-id="body">
                                                <div class="box-collapser">
                                                    <div class="col">
                                                        <div gen-id="drop-zone">
                                                            <xsl:apply-templates  select="rows/content/gen_form_1/fields" mode="hidden-fields" />
                                                            <xsl:if  test="rows/content/gen_form_1/fields/text_1">
                                                                <div class="col-1-4 item gen-fields-holder" item-name="text_1">
                                                                    <div class="igrp_item color">
                                                                        <label class="">
                                                                            <xsl:if test="string-length(rows/content/gen_form_1/fields/text_1/label) &gt; 45">
                                                                                <xsl:attribute name="title">
                                                                                    <xsl:value-of select="rows/content/gen_form_1/fields/text_1/label" />
                                                                                </xsl:attribute>
                                                                            </xsl:if>
                                                                            <span gen-lbl-setter="">
                                                                                <xsl:value-of select="rows/content/gen_form_1/fields/text_1/label" />
                                                                            </span>
                                                                        </label>
                                                                        <input class="text  " type="text" name="{rows/content/gen_form_1/fields/text_1/@name}" maxlength="40" value="{rows/content/gen_form_1/fields/text_1/value}">
                                                                            <xsl:call-template name="FIELD_validator">
                                                                                <xsl:with-param name="field" select="rows/content/gen_form_1/fields/text_1" />
                                                                            </xsl:call-template>
                                                                        </input>
                                                                        <div class="_clear" /></div>
                                                                    <div class="_clear" /></div>
                                                            </xsl:if>
                                                            <xsl:if  test="rows/content/gen_form_1/fields/number_1">
                                                                <div class="col-1-4 item gen-fields-holder" item-name="number_1">
                                                                    <div class="igrp_item color">
                                                                        <label class="">
                                                                            <xsl:if test="string-length(rows/content/gen_form_1/fields/number_1/label) &gt; 45">
                                                                                <xsl:attribute name="title">
                                                                                    <xsl:value-of select="rows/content/gen_form_1/fields/number_1/label" />
                                                                                </xsl:attribute>
                                                                            </xsl:if>
                                                                            <span gen-lbl-setter="">
                                                                                <xsl:value-of select="rows/content/gen_form_1/fields/number_1/label" />
                                                                            </span>
                                                                        </label>
                                                                        <input class="number  " type="number" name="{rows/content/gen_form_1/fields/number_1/@name}" maxlength="40" value="{rows/content/gen_form_1/fields/number_1/value}">
                                                                            <xsl:call-template name="FIELD_validator">
                                                                                <xsl:with-param name="field" select="rows/content/gen_form_1/fields/number_1" />
                                                                            </xsl:call-template>
                                                                        </input>
                                                                        <div class="_clear" /></div>
                                                                    <div class="_clear" /></div>
                                                            </xsl:if>
                                                            <xsl:if  test="rows/content/gen_form_1/fields/report">
                                                                <div class="col-1-4 item gen-fields-holder">
                                                                    <div class="igrp_item link">
                                                                        <a class="link" target="_blank" href="{rows/content/gen_form_1/fields/report/value}">
                                                                            <span gen-lbl-setter="">
                                                                                <xsl:value-of select="rows/content/gen_form_1/fields/report/label" />
                                                                            </span>
                                                                        </a>
                                                                    </div>
                                                                    <div class="_clear" /></div>
                                                            </xsl:if>
                                                            <xsl:if  test="rows/content/gen_form_1/fields/email_1">
                                                                <div class="col-1-4 item gen-fields-holder" item-name="email_1">
                                                                    <div class="igrp_item color">
                                                                        <label class="">
                                                                            <xsl:if test="string-length(rows/content/gen_form_1/fields/email_1/label) &gt; 45">
                                                                                <xsl:attribute name="title">
                                                                                    <xsl:value-of select="rows/content/gen_form_1/fields/email_1/label" />
                                                                                </xsl:attribute>
                                                                            </xsl:if>
                                                                            <span gen-lbl-setter="">
                                                                                <xsl:value-of select="rows/content/gen_form_1/fields/email_1/label" />
                                                                            </span>
                                                                        </label>
                                                                        <input class="email  " type="email" name="{rows/content/gen_form_1/fields/email_1/@name}" maxlength="40" value="{rows/content/gen_form_1/fields/email_1/value}">
                                                                            <xsl:call-template name="FIELD_validator">
                                                                                <xsl:with-param name="field" select="rows/content/gen_form_1/fields/email_1" />
                                                                            </xsl:call-template>
                                                                        </input>
                                                                        <div class="_clear" /></div>
                                                                    <div class="_clear" /></div>
                                                            </xsl:if>
                                                        </div>
                                                        <div class="_clear" />
                                                        <xsl:if  test="rows/content/gen_form_1/tools-bar">
                                                            <xsl:apply-templates select="rows/content/gen_form_1/tools-bar" mode="button-bar" />
                                                        </xsl:if>
                                                    </div>
                                                    <div class="_clear" /></div>
                                            </div>
                                        </xsl:if>
                                        <xsl:if  test="rows/content/formlist_1">
                                            <div class="box-content resetPadding gen-container-item" sep-name="formlist_1">
                                                <div class="box-collapser">
                                                    <div class="box-table table-responsive">
                                                        <div class="table-container">
                                                            <xsl:variable  name="hasContextMenu" select="rows/content/formlist_1/table/context-menu" />
                                                            <xsl:if  test="$hasContextMenu">
                                                                <xsl:apply-templates select="rows/content/formlist_1/table/context-menu" mode="context-menu">
                                                                    <xsl:with-param name="contextId" select="'data-formlist_1'" />
                                                                </xsl:apply-templates>
                                                            </xsl:if>
                                                            <table class="IGRP_formlist" rel="T_formlist_1" data-control="data-formlist_1">
                                                                <thead>
                                                                    <tr gen-id="drop-zone" gen-field-template="table.th">
                                                                        <xsl:if  test="rows/content/formlist_1/fields/email_1">
                                                                            <th class=" gen-fields-holder" align="#[align]#">
                                                                                <span gen-lbl-setter="">
                                                                                    <xsl:value-of select="rows/content/formlist_1/fields/email_1/label" />
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if  test="rows/content/formlist_1/fields/textarea_1">
                                                                            <th class=" gen-fields-holder" align="#[align]#">
                                                                                <span gen-lbl-setter="">
                                                                                    <xsl:value-of select="rows/content/formlist_1/fields/textarea_1/label" />
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if  test="rows/content/formlist_1/fields/text_1">
                                                                            <th class=" gen-fields-holder" align="#[align]#">
                                                                                <span gen-lbl-setter="">
                                                                                    <xsl:value-of select="rows/content/formlist_1/fields/text_1/label" />
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if  test="rows/content/formlist_1/fields/date_1">
                                                                            <th class=" gen-fields-holder" align="#[align]#">
                                                                                <span gen-lbl-setter="">
                                                                                    <xsl:value-of select="rows/content/formlist_1/fields/date_1/label" />
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if  test="not(rows/content/form/table/formlist/value/row[position() = 1]/@noupdate) or not(rows/content/form/table/formlist/value/row[position() = 1]/@nodelete)">
                                                                            <th class="fBtn">
                                                                                <xsl:if test="not(rows/content/form/table/formlist/value/row[position() = 1]/@noupdate)">
                                                                                    <img title="" class="IGRP_addRowForm" rel="formlist" item-name="add-formlist" src="{$path_tmpl}/img/icon/tools-bar/add.png" />
                                                                                </xsl:if>
                                                                            </th>
                                                                        </xsl:if>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each  select="rows/content/formlist_1/table/value/row[not(@total='yes')]">
                                                                        <tr class="IGRP_contextMenu" gen-id="drop-zone" row="{position()}">
                                                                            <xsl:apply-templates select="context-menu" mode="context-param" />
                                                                            <input type="hidden" name="p_formlist_1_id" value="{formlist_1_id}" />
                                                                            <xsl:if test="email_1">
                                                                                <xsl:if test="not(email_1/@visible)">
                                                                                    <td class="email" data-title="{../../fields/email_1/label}" data-row="{position()}">
                                                                                        <input type="hidden" name="p_email_1_fk_desc" value="{email_1_desc}" />
                                                                                        <input class="email" type="email" rel="F_formlist_1" name="{../../fields/email_1/@name}_fk" value="{email_1}">
                                                                                            <xsl:call-template name="FIELD_validator">
                                                                                                <xsl:with-param name="field" select="../../fields/email_1" />
                                                                                            </xsl:call-template>
                                                                                        </input>
                                                                                    </td>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="textarea_1">
                                                                                <xsl:if test="not(textarea_1/@visible)">
                                                                                    <td class="textarea" data-title="{../../fields/textarea_1/label}" data-row="{position()}">
                                                                                        <input type="hidden" name="p_textarea_1_fk_desc" value="{textarea_1_desc}" />
                                                                                        <textarea class="textarea" rel="F_formlist_1" name="{../../fields/textarea_1/@name}_fk" maxlength="#[maxlength]#">
                                                                                            <xsl:call-template name="FIELD_validator">
                                                                                                <xsl:with-param name="field" select="../../fields/textarea_1" />
                                                                                            </xsl:call-template>
                                                                                            <xsl:value-of select="textarea_1" disable-output-escaping="yes" />
                                                                                        </textarea>
                                                                                    </td>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="text_1">
                                                                                <xsl:if test="not(text_1/@visible)">
                                                                                    <td class="text" data-title="{../../fields/text_1/label}" data-row="{position()}">
                                                                                        <input type="hidden" name="p_text_1_fk_desc" value="{text_1_desc}" />
                                                                                        <input class="text" type="text" rel="F_formlist_1" name="{../../fields/text_1/@name}_fk" value="{text_1}">
                                                                                            <xsl:call-template name="FIELD_validator">
                                                                                                <xsl:with-param name="field" select="../../fields/text_1" />
                                                                                            </xsl:call-template>
                                                                                        </input>
                                                                                    </td>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="date_1">
                                                                                <xsl:if test="not(date_1/@visible)">
                                                                                    <td class="date" data-title="{../../fields/date_1/label}" data-row="{position()}">
                                                                                        <input type="hidden" name="p_date_1_fk_desc" value="{date_1_desc}" />
                                                                                        <div class="itemIcon">
                                                                                            <input class="date" type="text" rel="F_formlist_1" name="{../../fields/date_1/@name}_fk" value="{date_1}" trel="IGRP_datePicker">
                                                                                                <xsl:call-template name="FIELD_validator">
                                                                                                    <xsl:with-param name="field" select="../../fields/date_1" />
                                                                                                </xsl:call-template>
                                                                                            </input>
                                                                                            <div class="calendar" /></div>
                                                                                    </td>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="not(@nodelete) or not(@noupdate)">
                                                                                <td class="fBtn" data-title="{$lngPath/separatorlist_dialog/delete}" data-row="{position()}">
                                                                                    <xsl:if test="not(@nodelete)">
                                                                                        <img title="{$lngPath/separatorlist_dialog/delete}" class="IGRP_delRow" rel="formlist" item-name="del-formlist" src="{$path_tmpl}/img/icon/tools-bar/delete.png" />
                                                                                    </xsl:if>
                                                                                </td>
                                                                            </xsl:if>
                                                                        </tr>
                                                                    </xsl:for-each>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                    <!--END FORM LIST-->
                                                    <div class="_clear" /></div>
                                                <div class="_clear" /></div>
                                        </xsl:if>
                                        <xsl:if  test="rows/content/table_1">
                                            <div class="box-content resetPadding gen-container-item" gen-structure="label,values">
                                                <xsl:call-template  name="table-view">
                                                    <xsl:with-param name="rel" select="'table_1'" />
                                                </xsl:call-template>
                                                <div class="box-collapser">
                                                    <div class="col borderColor">
                                                        <div class="box-table table-responsive">
                                                            <div class="table-container">
                                                                <xsl:variable  name="hasContextMenu" select="rows/content/table_1/table/context-menu" />
                                                                <xsl:if  test="$hasContextMenu">
                                                                    <xsl:apply-templates select="rows/content/table_1/table/context-menu" mode="context-menu">
                                                                        <xsl:with-param name="contextId" select="'table_1'" />
                                                                    </xsl:apply-templates>
                                                                </xsl:if>
                                                                <xsl:if  test="rows/content/table_1/fields/*[@type='color']">
                                                                    <xsl:apply-templates select="rows/content/table_1/table/legend_color" mode="table-legend" />
                                                                </xsl:if>
                                                                <xsl:if  test="rows/content/table_1/fields/filter">
                                                                    <xsl:call-template name="filter-az">
                                                                        <xsl:with-param name="name" select="rows/content/table_1/fields/filter/@name" />
                                                                        <xsl:with-param name="value" select="rows/content/table_1/fields/filter/value" />
                                                                        <xsl:with-param name="type" select="''" />
                                                                    </xsl:call-template>
                                                                </xsl:if>
                                                                <xsl:variable  name="contextMenuType" select="''" />
                                                                <table class="IGRP_table default-table" gen-id="table" data-control="table_1" context-menu-type="">
                                                                    <thead>
                                                                        <tr gen-id="drop-zone" gen-field-template="th">
                                                                            <xsl:if  test="rows/content/table_1/fields/password_1">
                                                                                <th class=" gen-fields-holder" align="left">
                                                                                    <span gen-lbl-setter="">
                                                                                        <xsl:value-of select="rows/content/table_1/fields/password_1/label" />
                                                                                    </span>
                                                                                </th>
                                                                            </xsl:if>
                                                                            <xsl:if  test="rows/content/table_1/fields/date_1">
                                                                                <th class=" gen-fields-holder" align="left">
                                                                                    <span gen-lbl-setter="">
                                                                                        <xsl:value-of select="rows/content/table_1/fields/date_1/label" />
                                                                                    </span>
                                                                                </th>
                                                                            </xsl:if>
                                                                            <xsl:if  test="rows/content/table_1/fields/text_1">
                                                                                <th class=" gen-fields-holder" align="left">
                                                                                    <span gen-lbl-setter="">
                                                                                        <xsl:value-of select="rows/content/table_1/fields/text_1/label" />
                                                                                    </span>
                                                                                </th>
                                                                            </xsl:if>
                                                                            <xsl:if  test="rows/content/table_1/table/context-menu/item and  $contextMenuType = 'line'">
                                                                                <th />
                                                                            </xsl:if>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <xsl:for-each  select="rows/content/table_1/table/value/row">
                                                                            <tr gen-id="drop-zone">
                                                                                <xsl:if test="$contextMenuType = 'menu'">
                                                                                    <xsl:attribute name="class">IGRP_contextMenu</xsl:attribute>
                                                                                </xsl:if>
                                                                                <xsl:apply-templates select="context-menu" mode="context-param" />
                                                                                <xsl:apply-templates select="." mode="tr-hidden-fields" />
                                                                                <xsl:if test="password_1">
                                                                                    <td class="password" align="left" data-title="{../../../fields/password_1/label}" data-row="{position()}">
                                                                                        <xsl:apply-templates select="../../context-menu" mode="cxtmenu-resp">
                                                                                            <xsl:with-param name="ctx" select="context-menu" />
                                                                                        </xsl:apply-templates>
                                                                                        <xsl:value-of select="password_1" />
                                                                                    </td>
                                                                                </xsl:if>
                                                                                <xsl:if test="date_1">
                                                                                    <td class="date" align="left" data-title="{../../../fields/date_1/label}" data-row="{position()}">
                                                                                        <xsl:apply-templates select="../../context-menu" mode="cxtmenu-resp">
                                                                                            <xsl:with-param name="ctx" select="context-menu" />
                                                                                        </xsl:apply-templates>
                                                                                        <xsl:value-of select="date_1" />
                                                                                    </td>
                                                                                </xsl:if>
                                                                                <xsl:if test="text_1">
                                                                                    <td class="text" align="left" data-title="{../../../fields/text_1/label}" data-row="{position()}">
                                                                                        <xsl:apply-templates select="../../context-menu" mode="cxtmenu-resp">
                                                                                            <xsl:with-param name="ctx" select="context-menu" />
                                                                                        </xsl:apply-templates>
                                                                                        <xsl:value-of select="text_1" />
                                                                                    </td>
                                                                                </xsl:if>
                                                                                <xsl:if test="../../context-menu/item and $contextMenuType = 'line'">
                                                                                    <td class="operationTable" data-row="{position()}">
                                                                                        <xsl:apply-templates select="//rows/content/table_1/table/context-menu" mode="operation-table">
                                                                                            <xsl:with-param name="ContextMenuRow" select="context-menu" />
                                                                                        </xsl:apply-templates>
                                                                                    </td>
                                                                                </xsl:if>
                                                                            </tr>
                                                                        </xsl:for-each>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
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
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1453222151371"/>
    <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=1453222151371"/>
    <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=1453222151372"/>
    <xsl:include href="../../xsl/tmpl/IGRP-operation-table.tmpl.xsl?v=1453222151372"/>
    <xsl:include href="../../xsl/tmpl/IGRP-others.tmpl.xsl?v=1453222151372"/>
</xsl:stylesheet>