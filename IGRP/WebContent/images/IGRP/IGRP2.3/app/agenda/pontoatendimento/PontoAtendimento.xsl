<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- FORM CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/form/igrp.forms.css"/>
                <!-- TABLE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>
                <!-- TOOLSBAR CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css"/>
                <!-- SELECT CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.min.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.style.css"/>
                <!-- DATE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/datetimepicker/css/datetimepicker.css"/>
                <style>#map{  width: 100%;  height: 250px;}</style>
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
                                    <div class="row" id="row-426d7ee8">
                                        <div class="gen-column col-sm-4">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/page_title">
                                                    <section class="content-header gen-container-item " gen-class="" item-name="page_title">
                                                        <h2>
                                                            <xsl:value-of select="rows/content/page_title/fields/page_title_text/value"/>
                                                        </h2>
                                                    </section>
                                                </xsl:if>
                                                <xsl:if test="rows/content/form_2">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_2">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_2/fields"/>
                                                                <xsl:if test="rows/content/form_2/fields/entidade">
                                                                    <div class="col-sm-12 form-group  gen-fields-holder" item-name="entidade" item-type="select" required="required">
                                                                        <label for="{rows/content/form_2/fields/entidade/@name}">
                                                                            <xsl:value-of select="rows/content/form_2/fields/entidade/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 IGRP_change" id="form_2_entidade" name="{rows/content/form_2/fields/entidade/@name}" required="required">
                                                                            <xsl:for-each select="rows/content/form_2/fields/entidade/list/option">
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
                                                        <xsl:apply-templates select="rows/content/form_2/tools-bar" mode="form-buttons"/>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/table_1">
                                                    <div class="box box-table-contents gen-container-item " gen-class="" item-name="table_1">
                                                        <div class="box-body table-box">
                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/table_1/fields"/>
                                                            <table id="table_1" class="table table-striped gen-data-table IGRP_contextmenu" exports="null">
                                                                <thead>
                                                                    <tr>
                                                                        <xsl:if test="rows/content/table_1/fields/ponto_atendimento">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/ponto_atendimento/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/estado_list">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/estado_list/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <th class="igrp-table-ctx-th"/>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/table_1/table/value/row[not(@total='yes')]">
                                                                        <tr>
                                                                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                                            <input name="p_id_balcao_fk" value="{id_balcao}" type="hidden"/>
                                                                            <input name="p_id_balcao_fk_desc" value="{id_balcao_desc}" type="hidden"/>
                                                                            <xsl:if test="ponto_atendimento">
                                                                                <td align="left" data-row="{position()}" data-title="{../../label/ponto_atendimento}" class="link" item-name="ponto_atendimento">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="ponto_atendimento != ''">
                                                                                            <a href="{ponto_atendimento}" class="link bClick btn btn-link [object Object]" target-fields="" target="_self" name="ponto_atendimento">
                                                                                                <i class="fa fa-link"/>
                                                                                                <span>
                                                                                                    <xsl:value-of select="ponto_atendimento_desc"/>
                                                                                                </span>
                                                                                            </a>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <span>
                                                                                                <xsl:value-of select="ponto_atendimento_desc"/>
                                                                                            </span>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="estado_list">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/estado_list/label}" class="text" item-name="estado_list">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="estado_list"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <td class="igrp-table-ctx-td">
                                                                                <xsl:apply-templates select="../../context-menu" mode="table-context-inline">
                                                                                    <xsl:with-param name="row-params" select="context-menu"/>
                                                                                </xsl:apply-templates>
                                                                            </td>
                                                                        </tr>
                                                                    </xsl:for-each>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                        <div class="gen-column col-sm-8">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/toolsbar_2">
                                                    <div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="toolsbar_2">
                                                        <div class="btns-holder   pull-right" role="group">
                                                            <xsl:apply-templates select="rows/content/toolsbar_2" mode="gen-buttons">
                                                                <xsl:with-param name="vertical" select="'true'"/>
                                                                <xsl:with-param name="outline" select="'false'"/>
                                                            </xsl:apply-templates>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/form_1">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                                                <xsl:if test="rows/content/form_1/fields/ponto">
                                                                    <div class="form-group col-sm-4   gen-fields-holder" item-name="ponto" item-type="text" required="required">
                                                                        <label for="{rows/content/form_1/fields/ponto/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/ponto/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/ponto/value}" class="form-control " id="{rows/content/form_1/fields/ponto/@name}" name="{rows/content/form_1/fields/ponto/@name}" required="required" maxlength="300" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/n_de_servicos">
                                                                    <div class="col-sm-4 form-group  gen-fields-holder" item-name="n_de_servicos" item-type="select" required="required">
                                                                        <label for="{rows/content/form_1/fields/n_de_servicos/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/n_de_servicos/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_n_de_servicos" name="{rows/content/form_1/fields/n_de_servicos/@name}" required="required">
                                                                            <xsl:for-each select="rows/content/form_1/fields/n_de_servicos/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/localizacao">
                                                                    <div class="form-group col-sm-3   gen-fields-holder" item-name="localizacao" item-type="text" required="required">
                                                                        <label for="{rows/content/form_1/fields/localizacao/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/localizacao/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/localizacao/value}" class="form-control " id="{rows/content/form_1/fields/localizacao/@name}" name="{rows/content/form_1/fields/localizacao/@name}" required="required" maxlength="300" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/fuso_horario">
                                                                    <div class="form-group col-sm-4   gen-fields-holder" item-name="fuso_horario" item-type="text" required="required">
                                                                        <label for="{rows/content/form_1/fields/fuso_horario/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/fuso_horario/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/fuso_horario/value}" class="form-control " id="{rows/content/form_1/fields/fuso_horario/@name}" name="{rows/content/form_1/fields/fuso_horario/@name}" required="required" maxlength="300" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/confirmacao_automatica">
                                                                    <div class="col-sm-4  gen-fields-holder" item-name="confirmacao_automatica" item-type="radiolist" required="required">
                                                                        <div class="form-group radiolist clear" required="required">
                                                                            <label>
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/form_1/fields/confirmacao_automatica/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <xsl:for-each select="rows/content/form_1/fields/confirmacao_automatica/list/option">
                                                                                <div class="radio col-md-12">
                                                                                    <label>
                                                                                        <input required="required" type="radio" name="{../../@name}" value="{value}" class="radiolist " label="{text}">
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
                                                                <xsl:if test="rows/content/form_1/fields/horario_de_atendimento">
                                                                    <div class="box-head subtitle gen-fields-holder" text-color="1">
                                                                        <span>
                                                                            <xsl:value-of select="rows/content/form_1/fields/horario_de_atendimento/label"/>
                                                                        </span>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/hora_inicio">
                                                                    <div class="form-group col-sm-4  gen-fields-holder" item-name="hora_inicio" item-type="date" required="required">
                                                                        <label for="{rows/content/form_1/fields/hora_inicio/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/hora_inicio/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_1/fields/hora_inicio/value}" class="form-control gen-date " id="form_1-hora_inicio" name="{rows/content/form_1/fields/hora_inicio/@name}" required="required" format="IGRP_timePicker" maxlength="30"/>
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-default">
                                                                                    <i class="fa fa-calendar"/>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/hora_fim">
                                                                    <div class="form-group col-sm-4  gen-fields-holder" item-name="hora_fim" item-type="date" required="required">
                                                                        <label for="{rows/content/form_1/fields/hora_fim/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/hora_fim/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_1/fields/hora_fim/value}" class="form-control gen-date " id="form_1-hora_fim" name="{rows/content/form_1/fields/hora_fim/@name}" required="required" format="IGRP_timePicker" maxlength="30"/>
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-default">
                                                                                    <i class="fa fa-calendar"/>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                            </div>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/toolsbar_1">
                                                    <div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="toolsbar_1">
                                                        <div class="btns-holder   pull-right" role="group">
                                                            <xsl:apply-templates select="rows/content/toolsbar_1" mode="gen-buttons">
                                                                <xsl:with-param name="vertical" select="'true'"/>
                                                                <xsl:with-param name="outline" select="'false'"/>
                                                            </xsl:apply-templates>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/table_2">
                                                    <div class="box box-table-contents gen-container-item " gen-class="" item-name="table_2">
                                                        <div class="box-body table-box">
                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/table_2/fields"/>
                                                            <table id="table_2" class="table table-striped gen-data-table IGRP_contextmenu" exports="null">
                                                                <thead>
                                                                    <tr>
                                                                        <xsl:if test="rows/content/table_2/fields/servicos">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_2/fields/servicos/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_2/fields/id_servico_check">
                                                                            <th class="bs-checkbox gen-fields-holder" align="center">
                                                                                <input type="checkbox" class="IGRP_checkall" check-rel="id_servico_check"/>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <th class="igrp-table-ctx-th"/>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/table_2/table/value/row[not(@total='yes')]">
                                                                        <tr>
                                                                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                                            <input name="p_id_servico_fk" value="{id_servico}" type="hidden"/>
                                                                            <input name="p_id_servico_fk_desc" value="{id_servico_desc}" type="hidden"/>
                                                                            <xsl:if test="servicos">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/servicos/label}" class="text" item-name="servicos">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="servicos"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="id_servico_check">
                                                                                <td align="" data-row="{position()}" data-title="{../../label/id_servico_check}" class="bs-checkbox" item-name="id_servico_check">
                                                                                    <xsl:if test="id_servico_check != '-0'">
                                                                                        <input type="checkbox" name="p_id_servico_check" value="{id_servico_check}" check-rel="id_servico_check">
                                                                                            <xsl:if test="id_servico_check_check=id_servico_check">
                                                                                                <xsl:attribute name="checked">checked</xsl:attribute>
                                                                                            </xsl:if>
                                                                                        </input>
                                                                                    </xsl:if>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <td class="igrp-table-ctx-td">
                                                                                <xsl:apply-templates select="../../context-menu" mode="table-context-inline">
                                                                                    <xsl:with-param name="row-params" select="context-menu"/>
                                                                                </xsl:apply-templates>
                                                                            </td>
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
                <script type="text/javascript" src="{$path}/core/igrp/table/igrp.table.js"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/bootstrap-contextmenu.js"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/table.contextmenu.js"/>
                <!-- SELECT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js"/>
                <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js"/>
                <!-- DATE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/datetimepicker.js"/>
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/dtp.init.js"/>
                <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCn_ZYYXFtUTGjiyhf3Y_TxWl52sk2OS7w"/>
                <script type="text/javascript" src="{$path}/app/SA/js/googleMaps.js"/>
                <!-- RULES -->
                <script src="{$path}/core/igrp/IGRP.rules.class.js"/>
                <script>
$.IGRP.rules.set({"p_entidade":[{"name":"remote list","events":"change","isTable":false,"conditions":{"rules":[{"condition":"notnull","value":"","value2":"","patern":"","patern_custom":"","opposite":""}],"actions":[{"action":"remote_list","targets":"table_1","procedure":"","msg_type":"info","msg":""}]}}]},'actionsList');</script>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1503787245403"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1503787245403"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1503787245403"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1503787245403"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1503787245403"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1503787245403"/>
</xsl:stylesheet>
