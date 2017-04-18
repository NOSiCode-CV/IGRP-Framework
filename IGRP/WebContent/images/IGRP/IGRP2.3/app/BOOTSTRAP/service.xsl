<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="IGRP-head"/>
        <!-- FORM CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/form/includes/igrp.forms.css"/>
        <!-- TABLE CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/table/includes/igrp.tables.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/table/includes/dataTables.bootstrap.css"/>
        <!-- SELECT CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/fields/select/includes/select2/select2.min.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/fields/select/includes/select2/select2.style.css"/>
      </head>
      <body class="{$bodyClass}">
        <xsl:call-template name="IGRP-topmenu"/>
        <form>
          <div class="container-fluid">
            <div class="row">
              <xsl:call-template name="IGRP-sidebar"/>
              <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
                <div class="content">
                  <div class="row">
                    <div class="gen-column col-md-12">
                      <div class="gen-inner">
                        <xsl:if  test="rows/content/sectionheader_1">
                          <section  class="content-header gen-container-item">
                            <h1>
                              <xsl:value-of select="rows/content/sectionheader_1/fields/text/value"/>
                            </h1>
                          </section>
                        </xsl:if>
                        <xsl:if  test="rows/content/form_1">
                          <div  class="box igrp-forms gen-container-item">
                            <div class="box-body">
                              <div role="form" gen-id="drop-zone">
                                <xsl:if  test="rows/content/form_1/fields/aplicacao">
                                  <div  class="col-md-3 form-group  gen-fields-holder" item-name="aplicacao" item-type="select">
                                    <label for="{rows/content/form_1/fields/aplicacao/@name}">
                                      <xsl:value-of select="rows/content/form_1/fields/aplicacao/label"/>
                                    </label>
                                    <select class="form-control select2 " id="form_1_aplicacao" name="{rows/content/form_1/fields/aplicacao/@name}">
                                      <xsl:for-each select="rows/content/form_1/fields/aplicacao/list/option">
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
                                <xsl:if  test="rows/content/form_1/fields/codigo">
                                  <div  class="form-group col-md-3   gen-fields-holder" item-name="codigo" item-type="text">
                                    <label for="{rows/content/form_1/fields/codigo/@name}">
                                      <span gen-lbl-setter="">
                                        <xsl:value-of select="rows/content/form_1/fields/codigo/label"/>
                                      </span>
                                    </label>
                                    <input type="text" value="{rows/content/form_1/fields/codigo/value}" class="form-control" id="{rows/content/form_1/fields/codigo/@name}" name="{rows/content/form_1/fields/codigo/@name}" maxlength="30">
                                    </input>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/form_1/fields/nome">
                                  <div  class="form-group col-md-3   gen-fields-holder" item-name="nome" item-type="text">
                                    <label for="{rows/content/form_1/fields/nome/@name}">
                                      <span gen-lbl-setter="">
                                        <xsl:value-of select="rows/content/form_1/fields/nome/label"/>
                                      </span>
                                    </label>
                                    <input type="text" value="{rows/content/form_1/fields/nome/value}" class="form-control" id="{rows/content/form_1/fields/nome/@name}" name="{rows/content/form_1/fields/nome/@name}" maxlength="30">
                                    </input>
                                  </div>
                                </xsl:if>
                              </div>
                            </div>
                            <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/>
                          </div>
                        </xsl:if>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="gen-column col-md-12">
                      <div class="gen-inner">
                        <xsl:if  test="rows/content/table_1">
                          <div  class="box box-table-contents gen-container-item">
                            <div class="box-body table-box">
                              <table id="table_1" class="table table-striped gen-data-table ">
                                <thead>
                                  <tr gen-id="drop-zone" gen-field-template="th">
                                    <xsl:if  test="rows/content/table_1/fields/codigo">
                                      <th  align="left" class=" gen-fields-holder">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/table_1/fields/codigo/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if  test="rows/content/table_1/fields/nome">
                                      <th  align="left" class=" gen-fields-holder">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/table_1/fields/nome/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if  test="rows/content/table_1/fields/funcao">
                                      <th  align="left" class=" gen-fields-holder">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/table_1/fields/funcao/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                  </tr>
                                </thead>
                                <tbody>
                                  <xsl:for-each select="rows/content/table_1/table/value/row">
                                    <tr gen-id="drop-zone">
                                      <xsl:apply-templates mode="context-param" select="context-menu"/> 
                                      <xsl:if  test="codigo">
                                        <td  align="left" data-row="{position()}" data-title="{../../fields/codigo/label}" class="text">
                                          <span class="lookup-parser">
                                            <xsl:value-of select="codigo"/>
                                          </span>
                                        </td>
                                      </xsl:if>
                                      <xsl:if  test="nome">
                                        <td  align="left" data-row="{position()}" data-title="{../../fields/nome/label}" class="text">
                                          <span class="">
                                            <xsl:value-of select="nome"/>
                                          </span>
                                        </td>
                                      </xsl:if>
                                      <xsl:if  test="funcao">
                                        <td  align="left" data-row="{position()}" data-title="{../../fields/funcao/label}" class="text">
                                          <span class="">
                                            <xsl:value-of select="funcao"/>
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
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1460735374591"/>
  <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1460735374591"/>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1460735374591"/>
  <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1460735374591"/>
  <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1460735374591"/>
  <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1460735374591"/>
</xsl:stylesheet>
