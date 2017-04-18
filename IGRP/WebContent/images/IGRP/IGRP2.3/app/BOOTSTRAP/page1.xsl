<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="IGRP-head"/>
        <!-- TOOLSBAR CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/toolsbar/includes/toolsbar.css"/>
        <!-- FORM CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/form/includes/igrp.forms.css"/>
        <!-- TABLE CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/table/includes/igrp.tables.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/table/includes/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/table/includes/table-colors.css"/>
        <!-- SELECT CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/fields/select/includes/select2/select2.min.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/fields/select/includes/select2/select2.style.css"/>
        <!-- DATE CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/fields/date/includes/dateTimePicker/css/datetimepicker.css"/>
        <!-- COLOR CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/fields/color/includes/colorpicker/css/bootstrap-colorpicker.min.css"/>
      </head>
      <body class="{$bodyClass} sidebar-off">
        <xsl:call-template name="IGRP-topmenu"/>
        <div class="container-fluid">
          <div class="row">
            <xsl:call-template name="IGRP-sidebar"/>
            <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
              <div class="content">
                <form class="IGRP-form">
                  <div class="row">
                    <div class="gen-column col-1-1">
                      <div class="gen-inner">
                        <xsl:if  test="rows/content/sectionheader_1">
                          <section  class="content-header gen-container-item">
                            <h1>
                              <xsl:value-of select="rows/content/sectionheader_1/fields/text/value"/>
                            </h1>
                          </section>
                        </xsl:if>
                        <xsl:if  test="rows/content/paragraph_1">
                          <div  class="gen-container-item">
                            <div class="box-body">
                              <p>
                                <xsl:value-of disable-output-escaping="yes" select="rows/content/paragraph_1/fields/text/value"/>
                              </p>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if  test="rows/content/toolsbar_1">
                          <div  class="toolsbar-holder gen-container-item" gen-structure="toolsbar" gen-fields=".btn-group a.btn">
                            <div class="btn-group  pull-left" role="group">
                              <xsl:apply-templates select="rows/content/toolsbar_1" mode="gen-buttons"/>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if  test="rows/content/form_1">
                          <div  class="box igrp-forms gen-container-item">
                            <div class="box-body">
                              <div role="form" gen-id="drop-zone">
                                <xsl:if  test="rows/content/form_1/fields/estado">
                                  <div  class="col-md-3 form-group  gen-fields-holder" item-name="estado" item-type="select">
                                    <label for="{rows/content/form_1/fields/estado/@name}">
                                      <xsl:value-of select="rows/content/form_1/fields/estado/label"/>
                                    </label>
                                    <select class="form-control select2 " id="form_1_estado" name="{rows/content/form_1/fields/estado/@name}">
                                      <xsl:for-each select="rows/content/form_1/fields/estado/list/option">
                                        <option value="{value}" label="{text}">
                                          <xsl:if test="@selected='true'">
                                            <xsl:attribute name="selected">selected
                                            </xsl:attribute>
                                          </xsl:if>
                                          <span>
                                            <xsl:value-of select="text"/>
                                          </span>
                                        </option>
                                      </xsl:for-each>
                                    </select>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/form_1/fields/tipo">
                                  <div  class="col-md-3 form-group  gen-fields-holder" item-name="tipo" item-type="select">
                                    <label for="{rows/content/form_1/fields/tipo/@name}">
                                      <xsl:value-of select="rows/content/form_1/fields/tipo/label"/>
                                    </label>
                                    <select class="form-control select2 " id="form_1_tipo" name="{rows/content/form_1/fields/tipo/@name}">
                                      <xsl:for-each select="rows/content/form_1/fields/tipo/list/option">
                                        <option value="{value}" label="{text}">
                                          <xsl:if test="@selected='true'">
                                            <xsl:attribute name="selected">selected
                                            </xsl:attribute>
                                          </xsl:if>
                                          <span>
                                            <xsl:value-of select="text"/>
                                          </span>
                                        </option>
                                      </xsl:for-each>
                                    </select>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/form_1/fields/prioridade">
                                  <div  class="col-md-3 form-group  gen-fields-holder" item-name="prioridade" item-type="select">
                                    <label for="{rows/content/form_1/fields/prioridade/@name}">
                                      <xsl:value-of select="rows/content/form_1/fields/prioridade/label"/>
                                    </label>
                                    <select class="form-control select2 " id="form_1_prioridade" name="{rows/content/form_1/fields/prioridade/@name}">
                                      <xsl:for-each select="rows/content/form_1/fields/prioridade/list/option">
                                        <option value="{value}" label="{text}">
                                          <xsl:if test="@selected='true'">
                                            <xsl:attribute name="selected">selected
                                            </xsl:attribute>
                                          </xsl:if>
                                          <span>
                                            <xsl:value-of select="text"/>
                                          </span>
                                        </option>
                                      </xsl:for-each>
                                    </select>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/form_1/fields/responsavel">
                                  <div  class="form-group col-md-3  gen-fields-holder" item-name="responsavel" item-type="lookup">
                                    <label for="{rows/content/form_1/fields/responsavel/@name}">
                                      <xsl:value-of select="rows/content/form_1/fields/responsavel/label"/>
                                    </label>
                                    <div class="input-group">
                                      <input type="text" value="{rows/content/form_1/fields/responsavel/value}" class="form-control gen-lookup" id="form_1_responsavel" name="{rows/content/form_1/fields/responsavel/@name}"/>
                                      <xsl:call-template name="lookup-tool">
                                        <xsl:with-param name="page" select="rows/page"/>
                                        <xsl:with-param name="ad_hoc" select="'1'"/>
                                        <xsl:with-param name="action" select="'LOOKUP'"/>
                                        <xsl:with-param name="name" select="rows/content/form_1/fields/responsavel/@name"/>
                                        <xsl:with-param name="js_lookup" select="rows/content/form_1/fields/responsavel/lookup"/>
                                        <xsl:with-param name="input-id" select="'form_1_responsavel'"/>
                                        <xsl:with-param name="btnClass" select="'default'"/>
                                      </xsl:call-template>
                                    </div>
                                  </div>
                                </xsl:if>
                              </div>
                            </div>
                            <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/>
                          </div>
                        </xsl:if>
                        <xsl:if  test="rows/content/table_1">
                          <div  class="box box-table-contents gen-container-item">
                            <div class="box-body table-box">
                              <xsl:apply-templates mode="table-legend" select="rows/content/table_1/table/legend_color"/>
                              <table id="table_1" class="table table-striped gen-data-table ">
                                <thead>
                                  <tr gen-id="drop-zone" gen-field-template="th">
                                    <xsl:if  test="rows/content/table_1/fields/checkbox_1">
                                      <th  class="bs-checkbox gen-fields-holder" align="center">
                                        <input type="checkbox" class="IGRP_checkall" check-rel="checkbox_1"/>
                                      </th>
                                    </xsl:if>
                                    <xsl:if  test="rows/content/table_1/fields/nome">
                                      <th  align="left" class=" gen-fields-holder">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/table_1/fields/nome/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if  test="rows/content/table_1/fields/prazo_de_entrega">
                                      <th  align="left" class=" gen-fields-holder">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/table_1/fields/prazo_de_entrega/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if  test="rows/content/table_1/fields/negociolead">
                                      <th  align="left" class=" gen-fields-holder">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/table_1/fields/negociolead/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if  test="rows/content/table_1/fields/cliente">
                                      <th  align="left" class=" gen-fields-holder">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/table_1/fields/cliente/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if  test="rows/content/table_1/fields/responsavel">
                                      <th  align="left" class=" gen-fields-holder">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/table_1/fields/responsavel/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if  test="rows/content/table_1/fields/estado">
                                      <th  align="left" class="color-th gen-fields-holder">
                                        <xsl:value-of select="rows/content/table_1/fields/estado/label"/>
                                      </th>
                                    </xsl:if>
                                  </tr>
                                </thead>
                                <tbody>
                                  <xsl:for-each select="rows/content/table_1/table/value/row">
                                    <tr gen-id="drop-zone">
                                      <xsl:if  test="checkbox_1">
                                        <td  align="" data-row="{position()}" data-title="{../../label/checkbox_1}" class="bs-checkbox">
                                          <xsl:if test="checkbox_1 != '-0'">
                                            <input type="checkbox" name="p_checkbox_1" value="{checkbox_1}" check-rel="checkbox_1">
                                              <xsl:if test="checkbox_1_check=checkbox_1">
                                                <xsl:attribute name="checked">checked
                                                </xsl:attribute>
                                              </xsl:if>
                                            </input>
                                          </xsl:if>
                                        </td>
                                      </xsl:if>
                                      <xsl:if  test="nome">
                                        <td  align="left" data-row="{position()}" data-title="{../../fields/nome/label}" class="text">
                                          <xsl:value-of select="nome"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if  test="prazo_de_entrega">
                                        <td  align="left" data-row="{position()}" data-title="{../../fields/prazo_de_entrega/label}" class="date">
                                          <xsl:value-of select="prazo_de_entrega"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if  test="negociolead">
                                        <td  align="left" data-row="{position()}" data-title="{../../label/negociolead}" class="link">
                                          <xsl:choose>
                                            <xsl:when test="negociolead != ''">
                                              <a href="{negociolead}" class="link bClick" target="_blank" name="negociolead">
                                                <xsl:value-of select="negociolead_desc" disable-output-escaping="yes"/>
                                              </a>
                                            </xsl:when>
                                            <xsl:otherwise>
                                              <span>
                                                <xsl:value-of select="negociolead_desc" disable-output-escaping="yes"/>
                                              </span>
                                            </xsl:otherwise>
                                          </xsl:choose>
                                        </td>
                                      </xsl:if>
                                      <xsl:if  test="cliente">
                                        <td  align="left" data-row="{position()}" data-title="{../../label/cliente}" class="link">
                                          <xsl:choose>
                                            <xsl:when test="cliente != ''">
                                              <a href="{cliente}" class="link bClick" target="_blank" name="cliente">
                                                <xsl:value-of select="cliente_desc" disable-output-escaping="yes"/>
                                              </a>
                                            </xsl:when>
                                            <xsl:otherwise>
                                              <span>
                                                <xsl:value-of select="cliente_desc" disable-output-escaping="yes"/>
                                              </span>
                                            </xsl:otherwise>
                                          </xsl:choose>
                                        </td>
                                      </xsl:if>
                                      <xsl:if  test="responsavel">
                                        <td  align="left" data-row="{position()}" data-title="{../../label/responsavel}" class="link">
                                          <xsl:choose>
                                            <xsl:when test="responsavel != ''">
                                              <a href="{responsavel}" class="link bClick" target="_blank" name="responsavel">
                                                <xsl:value-of select="responsavel_desc" disable-output-escaping="yes"/>
                                              </a>
                                            </xsl:when>
                                            <xsl:otherwise>
                                              <span>
                                                <xsl:value-of select="responsavel_desc" disable-output-escaping="yes"/>
                                              </span>
                                            </xsl:otherwise>
                                          </xsl:choose>
                                        </td>
                                      </xsl:if>
                                      <xsl:if  test="estado">
                                        <td  align="" data-row="{position()}" data-title="{../../label/estado}" class="color">
                                          <xsl:call-template name="tdcolor">
                                            <xsl:with-param name="color" select="estado"/>
                                          </xsl:call-template>
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
                </form>
              </div>
            </div>
          </div>
        </div>
        <xsl:call-template name="IGRP-bottom"/>
        <!-- TOOLSBAR JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/toolsbar/includes/toolsbar.js">
        </script>
        <!-- FORM JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/form/includes/igrp.forms.js">
        </script>
        <!-- TABLE JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/table/includes/jquery.dataTables.min.js">
        </script>
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/table/includes/dataTables.bootstrap.min.js">
        </script>
        <!-- SELECT JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/select/includes/select2/select2.full.min.js">
        </script>
        <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/select/includes/select2.init.js">
        </script>
        <!-- LOOKUP JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/lookup/includes/igrp.lookup.js">
        </script>
        <!-- DATE JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/date/includes/dateTimePicker/js/datetimepicker.js">
        </script>
        <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/date/includes/dateTimePicker/js/dtp.init.js">
        </script>
        <!-- COLOR JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/color/includes/colorpicker/js/bootstrap-colorpicker.js">
        </script>
        <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/color/includes/colorpicker.init.js">
        </script>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1460465657889"/>
  <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1460465657889"/>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1460465657889"/>
  <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1460465657889"/>
  <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1460465657890"/>
  <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1460465657890"/>
</xsl:stylesheet>
